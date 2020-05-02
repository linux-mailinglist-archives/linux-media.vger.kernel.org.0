Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775231C238E
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 08:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgEBGai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 02:30:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbgEBGai (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 02:30:38 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8EE6208DB;
        Sat,  2 May 2020 06:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588401036;
        bh=6eF4VU0zl3Dj2Zh47SQNN1ZMHI0oNQMEXXjjV+gqqJc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AHZ47eZvtUbpRVhpBx3NKAKHMzi68WIW41npol3c/GYRe6Rym2ftMLM4MjfXaW7fe
         uwyoWbgtrhwttEyZ3MmeJsvVvQSdMyOQaHF3ulLhGso/pFbxt+W+P1AT6gCL9i23PC
         LYpfpzWGf192hCBlpfz69AAOXw9fEikjwAnMCqkU=
Date:   Sat, 2 May 2020 08:30:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC, WIP, v4 05/11] media: vidtv: add a bridge driver
Message-ID: <20200502083030.2314349d@coco.lan>
In-Reply-To: <20200502032216.197977-6-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
        <20200502032216.197977-6-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat,  2 May 2020 00:22:10 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Digital TV devices consist of several independent hardware components which
> are controlled by different drivers.
> Each media device is controlled by a group of cooperating drivers with the
> bridge driver as the main driver.
> 
> This patch adds a bridge driver for the Virtual Digital TV driver [vidtv].
> 
> The bridge driver binds to the other drivers, that is, vidtv_tuner and
> vidtv_demod and implements the digital demux logic, providing userspace
> with a MPEG Transport Stream.
> 
> Move config structs to a common header so they can be used by the bridge
> driver and by their respective drivers.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/Makefile     |   2 +-
>  .../media/test-drivers/vidtv/vidtv_bridge.c   | 379 ++++++++++++++++++
>  .../media/test-drivers/vidtv/vidtv_bridge.h   |  37 ++
>  3 files changed, 417 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
> 
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> index 36ba00ddc0d1e..a9f1993dd5443 100644
> --- a/drivers/media/test-drivers/vidtv/Makefile
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o  vidtv_demod.o
> +obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> new file mode 100644
> index 0000000000000..05ca4027c869f
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> @@ -0,0 +1,379 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Virtual DTV test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/moduleparam.h>
> +#include <linux/mutex.h>
> +#include <linux/workqueue.h>
> +#include <linux/time.h>
> +#include "vidtv_bridge.h"
> +
> +#define TS_BUF_MAX_SZ (128 * 188)
> +#define TUNER_DEFAULT_ADDR 0x68
> +#define DEMOD_DEFAULT_ADDR 0x60
> +
> +MODULE_AUTHOR("Daniel W. S. Almeida");
> +MODULE_LICENSE("GPL");
> +

> +static unsigned int drop_tslock_prob_on_low_snr;
> +module_param(drop_tslock_prob_on_low_snr, uint, 0644);
> +MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
> +		 "Probability of losing the TS lock if the signal quality is bad");
> +
> +static unsigned int recover_tslock_prob_on_good_snr;
> +module_param(recover_tslock_prob_on_good_snr, uint, 0644);
> +MODULE_PARM_DESC(recover_tslock_prob_on_good_snr,
> +		 "Probability recovering the TS lock when the signal improves");

The FS permissions should be reviewed. IMHO, we should allow the
group which owns the /dev to be able to change values when they can
be changed in runtime. 

Yet, be sure that changing it on runtime won't cause race conditions.

For the two above, I guess the permissions for those should be, instead,
0664.

> +
> +static unsigned int mock_power_up_delay_msec;
> +module_param(mock_power_up_delay_msec, uint, 0644);
> +MODULE_PARM_DESC(mock_power_up_delay_msec, "Simulate a power up delay");

What's the sense of allowing changing it after the probe? I guess
permissions should be 0444 here.

> +
> +static unsigned int mock_tune_delay_msec;
> +module_param(mock_tune_delay_msec, uint, 0644);
> +MODULE_PARM_DESC(mock_tune_delay_msec, "Simulate a tune delay");

Same here: I guess 0664 would work better.

> +
> +static unsigned int vidtv_valid_dvb_t_freqs[8];
> +module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0644);
> +MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
> +		 "Valid DVB-T frequencies to simulate");
> +
> +static unsigned int vidtv_valid_dvb_c_freqs[8];
> +module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0644);
> +MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
> +		 "Valid DVB-C frequencies to simulate");
> +
> +static unsigned int vidtv_valid_dvb_s_freqs[8];
> +module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0644);
> +MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
> +		 "Valid DVB-C frequencies to simulate");

Can those be changed in runtime without causing race conditions?

> +
> +static unsigned int max_frequency_shift_hz;
> +module_param(max_frequency_shift_hz, uint, 0644);
> +MODULE_PARM_DESC(max_frequency_shift_hz,
> +		 "Maximum shift in HZ allowed when tuning in a channel");

0664?

> +
> +static unsigned int chosen_delsys = SYS_DVBT;
> +module_param(chosen_delsys, uint, 0644);
> +MODULE_PARM_DESC(chosen_delsys,
> +		 "The delivery system to simulate. Currently supported: DVB-T, DVB-C, DVB-S");

Hmm... in order to allow changing this value on runtime, as you proposed,
you should use module_param_cb(). The callback would allow touching the 
delsys only if the driver is not in use. Otherwise, it would return -EBUSY.
Also, permissions should be 0664.

Btw, after thinking a little bit about that, I would take one step back on
my demod review, changing it and the bridge's logic to allow chosen_delsys,
while keeping just one struct for DVB info parameters.

The way I see is that the logic here should be changed in order to use a
a bitmask for the chosen_delsys, like:

	bit 0: DVB-T
	bit 1: DVB-T2
	bit 2: DVB-C
	bit 3: DVB-S
	bit 4: DVB-S2

Of course you will need to document the meaning for each bit somewhere.

The default should be to have all supported types enabled.

As there's no ops that would allow the bridge driver to change it
dynamically, you should instead implement the "chosen_delsys" directly
at the demod's driver.

> +static unsigned int ts_buf_sz = 20 * 188;
> +module_param(ts_buf_sz, uint, 0644);
> +MODULE_PARM_DESC(ts_buf_sz, "Optional size for the TS buffer");

Huh? Userspace can already change it via an ioctl. Why adding a parameter
for that?

> +
> +DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nums);
> +
> +static int vidtv_start_streaming(struct vidtv_dvb *dvb)
> +{
> +	WARN_ON(dvb->streaming);
> +	dvb->streaming = true;
> +
> +	return 0;
> +}
> +
> +static int vidtv_stop_streaming(struct vidtv_dvb *dvb)
> +{
> +	/* mpeg thread will quit */
> +	dvb->streaming = false;
> +
> +	return 0;
> +}
> +
> +static int vidtv_start_feed(struct dvb_demux_feed *feed)
> +{
> +	struct dvb_demux *demux = feed->demux;
> +	struct vidtv_dvb *dvb   = demux->priv;
> +	int rc, ret;
> +
> +	if (!demux->dmx.frontend)
> +		return -EINVAL;
> +
> +	mutex_lock(&dvb->feed_lock);
> +
> +	dvb->nfeeds++;
> +	rc = dvb->nfeeds;
> +
> +	if (dvb->nfeeds == 1) {
> +		ret = vidtv_start_streaming(dvb);
> +		if (ret < 0)
> +			rc = ret;
> +	}
> +
> +	mutex_unlock(&dvb->feed_lock);
> +	return rc;
> +}
> +
> +static int vidtv_stop_feed(struct dvb_demux_feed *feed)
> +{
> +	struct dvb_demux *demux = feed->demux;
> +	struct vidtv_dvb *dvb   = demux->priv;
> +	int    err              = 0;
> +
> +	mutex_lock(&dvb->feed_lock);
> +	dvb->nfeeds--;
> +
> +	if (!dvb->nfeeds)
> +		err = vidtv_stop_streaming(dvb);
> +
> +	mutex_unlock(&dvb->feed_lock);
> +	return err;
> +}
> +
> +static int vidtv_master_xfer(struct i2c_adapter *i2c_adap,
> +			     struct i2c_msg msgs[],
> +			     int num)
> +{
> +	return 0;
> +}
> +
> +static u32 vidtv_i2c_func(struct i2c_adapter *adapter)
> +{
> +	return I2C_FUNC_I2C;
> +}
> +
> +struct i2c_algorithm vidtv_i2c_algorithm = {
> +	.master_xfer   = vidtv_master_xfer,
> +	.functionality = vidtv_i2c_func,
> +};
> +
> +static int vidtv_bridge_i2c_register_adap(struct vidtv_dvb *dvb)
> +{
> +	struct i2c_adapter *i2c_adapter = dvb->i2c_adapter;
> +
> +	strscpy(i2c_adapter->name, "vidtv_i2c", sizeof(i2c_adapter->name));
> +	i2c_adapter->owner      = THIS_MODULE;
> +	i2c_adapter->algo       = &vidtv_i2c_algorithm;
> +	i2c_adapter->algo_data  = NULL;
> +	i2c_adapter->timeout    = 500;
> +	i2c_adapter->retries    = 3;
> +	i2c_adapter->dev.parent = NULL;
> +
> +	i2c_set_adapdata(i2c_adapter, dvb);
> +	return i2c_add_adapter(dvb->i2c_adapter);
> +}
> +
> +static int vidtv_bridge_register_adap(struct vidtv_dvb *dvb)
> +{
> +	int ret = 0;
> +
> +	ret = dvb_register_adapter(&dvb->adapter,
> +				   KBUILD_MODNAME,
> +				   THIS_MODULE,
> +				   &dvb->i2c_adapter->dev,
> +				   adapter_nums);
> +
> +	return ret;
> +}
> +
> +static int vidtv_bridge_dmx_init(struct vidtv_dvb *dvb)
> +{
> +	dvb->demux.dmx.capabilities = DMX_TS_FILTERING |
> +				      DMX_SECTION_FILTERING;
> +
> +	dvb->demux.priv       = dvb;
> +	dvb->demux.filternum  = 256;
> +	dvb->demux.feednum    = 256;
> +	dvb->demux.start_feed = vidtv_start_feed;
> +	dvb->demux.stop_feed  = vidtv_stop_feed;
> +
> +	return dvb_dmx_init(&dvb->demux);
> +}
> +
> +static int vidtv_bridge_dmxdev_init(struct vidtv_dvb *dvb)
> +{
> +	dvb->dmx_dev.filternum    = 256;
> +	dvb->dmx_dev.demux        = &dvb->demux.dmx;
> +	dvb->dmx_dev.capabilities = 0;
> +
> +	return dvb_dmxdev_init(&dvb->dmx_dev, &dvb->adapter);
> +}
> +
> +static void vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
> +{
> +	struct vidtv_demod_config cfg = {0};
> +
> +	cfg.drop_tslock_prob_on_low_snr     = drop_tslock_prob_on_low_snr;
> +	cfg.recover_tslock_prob_on_good_snr = recover_tslock_prob_on_good_snr;
> +	cfg.chosen_delsys                   = chosen_delsys;
> +
> +	dvb->i2c_client_demod[n] = dvb_module_probe("vidtv_demod",
> +						    NULL,
> +						    dvb->i2c_adapter,
> +						    DEMOD_DEFAULT_ADDR,
> +						    &cfg);
> +
> +	/* retrieve a pointer to struct dvb_frontend */
> +	dvb->fe[n] = cfg.frontend;
> +}
> +
> +static void vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
> +{
> +	struct vidtv_tuner_config cfg = {0};
> +
> +	cfg.fe                       = dvb->fe[n];
> +	cfg.mock_power_up_delay_msec = mock_power_up_delay_msec;
> +	cfg.mock_tune_delay_msec     = mock_tune_delay_msec;
> +
> +	memcpy(cfg.vidtv_valid_dvb_t_freqs,
> +	       vidtv_valid_dvb_t_freqs,
> +	       sizeof(vidtv_valid_dvb_t_freqs));
> +
> +	memcpy(cfg.vidtv_valid_dvb_c_freqs,
> +	       vidtv_valid_dvb_c_freqs,
> +	       sizeof(vidtv_valid_dvb_c_freqs));
> +
> +	memcpy(cfg.vidtv_valid_dvb_s_freqs,
> +	       vidtv_valid_dvb_s_freqs,
> +	       sizeof(vidtv_valid_dvb_s_freqs));
> +
> +	cfg.max_frequency_shift_hz = max_frequency_shift_hz;
> +
> +	dvb->i2c_client_tuner[n] = dvb_module_probe("vidtv_tuner",
> +						    NULL,
> +						    dvb->i2c_adapter,
> +						    TUNER_DEFAULT_ADDR,
> +						    &cfg);
> +}
> +
> +static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
> +{
> +	int ret;
> +	int i, j;
> +
> +	ret = vidtv_bridge_i2c_register_adap(dvb);
> +	if (ret < 0)
> +		goto fail_i2c;
> +
> +	ret = vidtv_bridge_register_adap(dvb);
> +	if (ret < 0)
> +		goto fail_adapter;
> +
> +	vidtv_bridge_probe_demod(dvb, 0);
> +	vidtv_bridge_probe_tuner(dvb, 0);
> +
> +	for (i = 0; i < NUM_FE; ++i) {
> +		ret = dvb_register_frontend(&dvb->adapter, dvb->fe[i]);
> +		if (ret < 0)
> +			goto fail_fe;
> +	}
> +
> +	ret = vidtv_bridge_dmx_init(dvb);
> +	if (ret < 0)
> +		goto fail_dmx;
> +
> +	ret = vidtv_bridge_dmxdev_init(dvb);
> +	if (ret < 0)
> +		goto fail_dmx_dev;
> +
> +	for (j = 0; j < NUM_FE; ++j) {
> +		ret = dvb->demux.dmx.connect_frontend(&dvb->demux.dmx,
> +						      &dvb->dmx_fe[j]);
> +		if (ret < 0)
> +			goto fail_dmx_conn;
> +
> +		/*
> +		 * The source of the demux is a frontend connected
> +		 * to the demux.
> +		 */
> +		dvb->dmx_fe[j].source = DMX_FRONTEND_0;
> +	}
> +
> +	return ret;
> +
> +fail_dmx_conn:
> +	for (j = j - 1; j >= 0; --j)
> +		dvb->demux.dmx.remove_frontend(&dvb->demux.dmx,
> +					       &dvb->dmx_fe[j]);
> +fail_dmx_dev:
> +	dvb_dmxdev_release(&dvb->dmx_dev);
> +fail_dmx:
> +	dvb_dmx_release(&dvb->demux);
> +fail_fe:
> +	for (i = i - 1; i >= 0; --i)
> +		dvb_unregister_frontend(dvb->fe[i]);
> +
> +fail_adapter:
> +	dvb_unregister_adapter(&dvb->adapter);
> +
> +fail_i2c:
> +	i2c_del_adapter(dvb->i2c_adapter);
> +
> +	return ret;
> +}
> +
> +static int vidtv_bridge_i2c_probe(struct i2c_client *client,
> +				  const struct i2c_device_id *id)
> +{
> +	int ret;
> +	struct vidtv_dvb *dvb;
> +
> +	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
> +	if (!dvb)
> +		return -ENOMEM;
> +
> +	ret = vidtv_bridge_dvb_init(dvb);
> +	if (ret < 0)
> +		goto err_dvb;
> +
> +	mutex_init(&dvb->feed_lock);
> +
> +	i2c_set_clientdata(client, dvb);
> +
> +	return ret;
> +
> +err_dvb:
> +	kfree(dvb);
> +	return ret;
> +}
> +
> +static int vidtv_bridge_i2c_remove(struct i2c_client *client)
> +{
> +	struct vidtv_dvb *dvb;
> +	u32 i;
> +
> +	dvb = i2c_get_clientdata(client);
> +
> +	mutex_destroy(&dvb->feed_lock);
> +
> +	for (i = 0; i < NUM_FE; ++i)
> +		dvb->demux.dmx.remove_frontend(&dvb->demux.dmx,
> +					       &dvb->dmx_fe[i]);
> +
> +	dvb_dmxdev_release(&dvb->dmx_dev);
> +	dvb_dmx_release(&dvb->demux);
> +
> +	for (i = 0; i < NUM_FE; ++i) {
> +		dvb_unregister_frontend(dvb->fe[i]);
> +		dvb_frontend_detach(dvb->fe[i]);
> +	}
> +
> +	dvb_unregister_adapter(&dvb->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id vidtv_bridge_id_table[] = {
> +	{"vidtv_bridge", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, vidtv_bridge_id_table);
> +
> +static struct i2c_driver vidtv_bridge_driver = {
> +	.driver = {
> +		.name                = "vidtv_bridge",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe    = vidtv_bridge_i2c_probe,
> +	.remove   = vidtv_bridge_i2c_remove,
> +	.id_table = vidtv_bridge_id_table,
> +};
> +
> +module_i2c_driver(vidtv_bridge_driver);
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
> new file mode 100644
> index 0000000000000..ef5c7cd2d64e3
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The Virtual DTV test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#ifndef VIDTV_BRIDGE_H
> +#define VIDTV_BRIDGE_H
> +
> +#define NUM_FE 1
> +
> +#include <linux/types.h>
> +#include <media/dvb_frontend.h>
> +#include <media/dvb_demux.h>
> +#include <media/dmxdev.h>
> +#include <linux/i2c.h>
> +
> +struct vidtv_dvb {
> +	struct dvb_frontend *fe[NUM_FE];
> +	struct dvb_adapter adapter;
> +	struct dvb_demux demux;
> +	struct dmxdev dmx_dev;
> +	struct dmx_frontend dmx_fe[NUM_FE];
> +	struct i2c_adapter *i2c_adapter;
> +	struct i2c_client *i2c_client_demod[NUM_FE];
> +	struct i2c_client *i2c_client_tuner[NUM_FE];
> +
> +	u32 nfeeds;
> +	struct mutex feed_lock; /* start/stop feed */
> +
> +	bool streaming;
> +};
> +
> +#endif // VIDTV_BRIDGE_H



Thanks,
Mauro
