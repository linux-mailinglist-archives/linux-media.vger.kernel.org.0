Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA9AB1959EB
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 16:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgC0PaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 11:30:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:51988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727335AbgC0PaL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 11:30:11 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3168020578;
        Fri, 27 Mar 2020 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585323009;
        bh=otqeM3JMT7GZxuUNx7a5gP1EEfNejXVq3ZNmWwplSVQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JZJribSoBPcKeN8Z/aTEzFVg3Y8A23jyJAXh7SBTc3r3+MQ9ZkW+TCUfrZgAc4PQl
         aKx9RiqZ7or5NoOrVtk8Ueq9suwBnnVUv/WnPjtFwC/Xayn/FzPR/57TmvfSk9sL0+
         dkVW6qN2lUC7bPvsjK5zwrm1KtFtrjnbYWCDkMiM=
Date:   Fri, 27 Mar 2020 16:30:03 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [RFC, WIP, v2 1/3] media: dvb_dummy_tuner: implement driver
 skeleton
Message-ID: <20200327163003.6e5baf59@coco.lan>
In-Reply-To: <20200323125732.281976-2-dwlsalmeida@gmail.com>
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
        <20200323125732.281976-2-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 23 Mar 2020 09:57:30 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> The virtual DVB test driver serves as a reference DVB driver and helps
> validate the existing APIs in the media subsystem. It can also aid developers
> working on userspace applications.
> 
> This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> ISDB-T and ATSC when completed.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/tuners/Kconfig           |   9 +
>  drivers/media/tuners/Makefile          |   1 +
>  drivers/media/tuners/dvb_dummy_tuner.c | 419 +++++++++++++++++++++++++
>  3 files changed, 429 insertions(+)
>  create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c
> 
> diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
> index e104bb7766e1..8ad54339ceee 100644
> --- a/drivers/media/tuners/Kconfig
> +++ b/drivers/media/tuners/Kconfig
> @@ -296,4 +296,13 @@ config MEDIA_TUNER_QM1D1B0004
>  	default m if !MEDIA_SUBDRV_AUTOSELECT
>  	help
>  	  Sharp QM1D1B0004 ISDB-S tuner driver.
> +
> +config MEDIA_TUNER_DVB_DUMMY_TUNER
> +	tristate "Dummy DVB Media Tuner"
> +	depends on MEDIA_SUPPORT && I2C
> +	help
> +	  Dummy DVB media tuner driver
> +	  The virtual DVB test driver serves as a reference DVB driver and helps
> +	  validate the existing APIs in the media subsystem. It can also aid
> +	  developers working on userspace applications.
>  endmenu
> diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
> index 7b4f8423501e..f98de1cf2e19 100644
> --- a/drivers/media/tuners/Makefile
> +++ b/drivers/media/tuners/Makefile
> @@ -44,5 +44,6 @@ obj-$(CONFIG_MEDIA_TUNER_QM1D1C0042) += qm1d1c0042.o
>  obj-$(CONFIG_MEDIA_TUNER_QM1D1B0004) += qm1d1b0004.o
>  obj-$(CONFIG_MEDIA_TUNER_M88RS6000T) += m88rs6000t.o
>  obj-$(CONFIG_MEDIA_TUNER_TDA18250) += tda18250.o
> +obj-$(CONFIG_MEDIA_TUNER_DVB_DUMMY_TUNER) += dvb_dummy_tuner.o
>  
>  ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
> diff --git a/drivers/media/tuners/dvb_dummy_tuner.c b/drivers/media/tuners/dvb_dummy_tuner.c
> new file mode 100644
> index 000000000000..f0e1f60918f0
> --- /dev/null
> +++ b/drivers/media/tuners/dvb_dummy_tuner.c
> @@ -0,0 +1,419 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + *
> + * The virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * This dummy tuner should support common TV standards such as
> + * DVB-T/T2/S/S2, ISDB-T and ATSC when completed.
> + *
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <media/dvb_frontend.h>
> +
> +struct dvb_dummy_tuner_config {
> +	struct dvb_frontend *fe;
> +	u32 mock_power_up_delay_msec;
> +	u32 mock_tune_delay_msec;
> +	u32 mock_sleep_delay_msec;
> +	u32 mock_resume_delay_msec;
> +	u32 dummy_valid_dvb_t_freqs[8];
> +	u32 dummy_valid_dvb_c_freqs[8];
> +	u32 dummy_valid_dvb_s_freqs[8];
> +	u8  max_frequency_shift_hz;
> +};
> +
> +struct dvb_dummy_tuner_cnr_to_qual_s {
> +	/* attempt to use the same values as libdvbv5 */
> +	u32 modulation;
> +	u32 fec;
> +	u32 cnr_ok, cnr_good;
> +};
> +
> +struct dvb_dummy_tuner_cnr_to_qual_s dvb_dummy_tuner_c_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QAM_256, FEC_NONE,  34000, 38000},
> +	{ QAM_64,  FEC_NONE,  30000, 34000},
> +};
> +
> +struct dvb_dummy_tuner_cnr_to_qual_s dvb_dummy_tuner_s_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QPSK, FEC_1_2,  7000, 10000},
> +
> +	{ QPSK, FEC_2_3,  9000, 12000},
> +	{ QPSK, FEC_3_4, 10000, 13000},
> +	{ QPSK, FEC_5_6, 11000, 14000},
> +
> +	{ QPSK, FEC_7_8, 12000, 15000},
> +};
> +
> +struct dvb_dummy_tuner_cnr_to_qual_s dvb_dummy_tuner_s2_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QPSK,  FEC_1_2,   9000,  12000},
> +	{ QPSK,  FEC_2_3,  11000,  14000},
> +	{ QPSK,  FEC_3_4,  12000,  15000},
> +	{ QPSK,  FEC_5_6,  12000,  15000},
> +	{ QPSK,  FEC_8_9,  13000,  16000},
> +	{ QPSK,  FEC_9_10, 13500, 16500},
> +	{ PSK_8, FEC_2_3,  14500, 17500},
> +	{ PSK_8, FEC_3_4,  16000,  19000},
> +	{ PSK_8, FEC_5_6,  17500, 20500},
> +	{ PSK_8, FEC_8_9,  19000,  22000},

Better to keep the last column right-aligned.

> +};
> +
> +static struct dvb_dummy_tuner_cnr_to_qual_s dvb_dummy_tuner_t_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db*/
> +	{   QPSK, FEC_1_2,  4100,  5900},
> +	{   QPSK, FEC_2_3,  6100,  9600},
> +	{   QPSK, FEC_3_4,  7200, 12400},
> +	{   QPSK, FEC_5_6,  8500, 15600},
> +	{   QPSK, FEC_7_8,  9200, 17500},
> +
> +	{ QAM_16, FEC_1_2,  9800, 11800},
> +	{ QAM_16, FEC_2_3, 12100, 15300},
> +	{ QAM_16, FEC_3_4, 13400, 18100},
> +	{ QAM_16, FEC_5_6, 14800, 21300},
> +	{ QAM_16, FEC_7_8, 15700, 23600},
> +
> +	{ QAM_64, FEC_1_2, 14000, 16000},
> +	{ QAM_64, FEC_2_3, 19900, 25400},
> +	{ QAM_64, FEC_3_4, 24900, 27900},
> +	{ QAM_64, FEC_5_6, 21300, 23300},
> +	{ QAM_64, FEC_7_8, 22000, 24000},
> +};
> +
> +enum dvb_dummy_tuner_lock_status {
> +	STATUS_NO_LOCK = 0,
> +	STATUS_LOCKED = TUNER_STATUS_LOCKED,
> +};
> +
> +enum dvb_dummy_tuner_power_status {
> +	STATUS_UNKNOWN,
> +	STATUS_ASLEEP,
> +	STATUS_ACTIVE
> +};
> +
> +struct dvb_dummy_tuner_hardware_state {
> +	enum dvb_dummy_tuner_power_status power_status;
> +	enum dvb_dummy_tuner_lock_status lock_status;
> +	u32 if_frequency;
> +	u32 tuned_frequency;
> +	u32 bandwidth;
> +};
> +
> +struct dvb_dummy_tuner_dev {
> +	struct dvb_frontend *fe;
> +	struct dvb_dummy_tuner_hardware_state hw_state;
> +	struct dvb_dummy_tuner_config config;
> +};
> +
> +static struct dvb_dummy_tuner_dev*
> +dvb_dummy_tuner_get_dev(struct dvb_frontend *fe)
> +{
> +	struct i2c_client *client = fe->tuner_priv;
> +
> +	return (struct dvb_dummy_tuner_dev *)i2c_get_clientdata(client);
> +}
> +
> +static s32 dvb_dummy_tuner_check_frequency_shift(struct dvb_frontend *fe)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> +	struct dvb_dummy_tuner_config config = tuner_dev->config;
> +	u32 *valid_freqs = NULL;
> +	u32 array_sz = 0;
> +	u32 i;
> +
> +	switch (c->delivery_system) {
> +	case SYS_DVBT:
> +	case SYS_DVBT2:
> +		valid_freqs =
> +			config.dummy_valid_dvb_t_freqs;

This fits into a single line. Same on similar assignments below.

> +		array_sz = ARRAY_SIZE(config.dummy_valid_dvb_t_freqs);
> +		break;
> +	case SYS_DVBS:
> +	case SYS_DVBS2:
> +		valid_freqs =
> +			config.dummy_valid_dvb_s_freqs;
> +		array_sz = ARRAY_SIZE(config.dummy_valid_dvb_s_freqs);
> +		break;
> +	case SYS_DVBC_ANNEX_A:
> +		valid_freqs =
> +			config.dummy_valid_dvb_c_freqs;
> +		array_sz = ARRAY_SIZE(config.dummy_valid_dvb_c_freqs);
> +		break;
> +
> +	default:
> +		pr_warn("%s: unsupported delivery system: %u\n",
> +			__func__,
> +			c->delivery_system);
> +		break;
> +	}
> +
> +	for (i = 0; i < array_sz; i++) {
> +		if (c->frequency == valid_freqs[i])
> +			return 0;
> +		else if (c->frequency >= valid_freqs[i] -
> +			 config.max_frequency_shift_hz &&
> +			 c->frequency <= valid_freqs[i] +
> +			 config.max_frequency_shift_hz)
> +			 /* This will provide a value from 0 to 100 that would
> +			  * indicate how far is the tuned frequency from the
> +			  * right one.
> +			  */
> +			return abs((c->frequency - valid_freqs[i]) *
> +				   100 / config.max_frequency_shift_hz);
> +	}

Instead, use a temp var (and supress the else):

	for (i = 0; i < array_sz; i++) {
		unsigned shift = abs(c->frequency - valid_freqs[i]);

		if (!shift)
			return 0;

		/* 
		 * This will provide a value from 0 to 100 that would
		 * indicate how far is the tuned frequency from the
		 * right one.
		 */
		if (shift < config.max_frequency_shift_hz)
			return shift * 100 / config.max_frequency_shift_hz;
	}

See, code is now a lot clearer.

> +
> +	return -1;
> +}
> +
> +static int
> +dvb_dummy_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
> +{
> +	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> +	struct dvb_dummy_tuner_cnr_to_qual_s *cnr2qual = NULL;
> +	u32 array_size = 0;
> +	s32 shift;
> +	u32 i;
> +
> +	shift = dvb_dummy_tuner_check_frequency_shift(fe);
> +
> +	switch (c->delivery_system) {
> +	case SYS_DVBT:
> +	case SYS_DVBT2:
> +		cnr2qual = dvb_dummy_tuner_t_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_dummy_tuner_t_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBS:
> +		cnr2qual = dvb_dummy_tuner_s_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_dummy_tuner_s_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBS2:
> +		cnr2qual = dvb_dummy_tuner_s2_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_dummy_tuner_s2_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBC_ANNEX_A:
> +		cnr2qual = dvb_dummy_tuner_c_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_dummy_tuner_c_cnr_2_qual);
> +		break;
> +
> +	default:
> +		pr_warn("%s: unsupported delivery system: %u\n",
> +			__func__,
> +			c->delivery_system);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i <= array_size; i++) {
> +		if (cnr2qual[i].modulation == c->modulation &&
> +		    cnr2qual[i].fec == c->fec_inner) {
> +			*strength = (shift == 0) ?
> +				    cnr2qual[i].cnr_good :
> +				    (shift > 0) ?
> +				    cnr2qual[i].cnr_ok :
> +				    cnr2qual[i].cnr_ok -
> +				    (cnr2qual[i].cnr_good - cnr2qual[i].cnr_ok);
> +			return 0;

This can be simplified and make easier to understand. Btw, the logic there
is wrong: a negative value for shift means channel is not tuned.

I would write the above, instead, as:

			if (!shift) {
				*strength = cnr2qual[i].cnr_good;
				return 0;
			}
			if (shift < 0) { 	/* Channel not tuned */
				*strength = 0;
				return 0;
			}
			/*
			 * Channel tuned at wrong frequency. Simulate that the
			 * Carrier S/N ratio is not too good.
			 */

			*strength = cnr2qual[i].cnr_ok -
				    (cnr2qual[i].cnr_good - cnr2qual[i].cnr_ok);
			return 0;

This makes a lot cleaner about the possible return ranges and what's
happening on each case.

Gcc will very likely optimize the code to produce the same object code.

> +		}
> +	}
> +
> +	/* do a linear interpolation between 34dB and 10dB if we can't
> +	 * match against the table
> +	 */

Please fix your multi-line comments. For example, the above should be, 
instead:

	/* 
	 * do a linear interpolation between 34dB and 10dB if we can't
	 * match against the table
	 */

> +	*strength = 34 - 24 * shift / 100;
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_init(struct dvb_frontend *fe)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +	struct dvb_dummy_tuner_config config = tuner_dev->config;
> +
> +	msleep_interruptible(config.mock_power_up_delay_msec);
> +
> +	tuner_dev->hw_state.power_status = STATUS_ACTIVE;
> +	tuner_dev->hw_state.if_frequency = 5000;
> +
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_sleep(struct dvb_frontend *fe)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +	struct dvb_dummy_tuner_config config = tuner_dev->config;
> +
> +	msleep_interruptible(config.mock_sleep_delay_msec);
> +	tuner_dev->hw_state.power_status = STATUS_ASLEEP;
> +
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_suspend(struct dvb_frontend *fe)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +
> +	tuner_dev->hw_state.power_status = STATUS_ASLEEP;
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_resume(struct dvb_frontend *fe)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +
> +	tuner_dev->hw_state.power_status = STATUS_ACTIVE;
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_set_params(struct dvb_frontend *fe)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +	struct dvb_dummy_tuner_config config = tuner_dev->config;
> +	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> +	u32 min_freq = fe->ops.tuner_ops.info.frequency_min_hz;
> +	u32 max_freq = fe->ops.tuner_ops.info.frequency_max_hz;
> +	u32 min_bw = fe->ops.tuner_ops.info.bandwidth_min;
> +	u32 max_bw = fe->ops.tuner_ops.info.bandwidth_max;
> +
> +	if (c->frequency < min_freq  || c->frequency > max_freq  ||
> +	    c->bandwidth_hz < min_bw || c->bandwidth_hz > max_bw) {
> +		tuner_dev->hw_state.lock_status = STATUS_NO_LOCK;
> +		return -EINVAL;
> +	}
> +
> +	tuner_dev->hw_state.tuned_frequency = c->frequency;
> +	tuner_dev->hw_state.bandwidth = c->bandwidth_hz;
> +	tuner_dev->hw_state.lock_status = STATUS_LOCKED;
> +
> +	msleep_interruptible(config.mock_tune_delay_msec);
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_set_config(struct dvb_frontend *fe,
> +				      void *priv_cfg)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +
> +	memcpy(&tuner_dev->config, priv_cfg, sizeof(tuner_dev->config));
> +
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_frequency(struct dvb_frontend *fe,
> +					 u32 *frequency)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +
> +	*frequency = tuner_dev->hw_state.tuned_frequency;
> +
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_bandwidth(struct dvb_frontend *fe,
> +					 u32 *bandwidth)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +
> +	*bandwidth = tuner_dev->hw_state.bandwidth;
> +
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_if_frequency(struct dvb_frontend *fe,
> +					    u32 *frequency)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +
> +	*frequency = tuner_dev->hw_state.if_frequency;
> +
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_status(struct dvb_frontend *fe, u32 *status)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
> +
> +	*status = tuner_dev->hw_state.lock_status;
> +
> +	return 0;
> +}
> +
> +static const struct dvb_tuner_ops dvb_dummy_tuner_ops = {
> +	.init = dvb_dummy_tuner_init,
> +	.sleep = dvb_dummy_tuner_sleep,
> +	.suspend = dvb_dummy_tuner_suspend,
> +	.resume = dvb_dummy_tuner_resume,
> +	.set_params = dvb_dummy_tuner_set_params,
> +	.set_config = dvb_dummy_tuner_set_config,
> +	.get_bandwidth = dvb_dummy_tuner_get_bandwidth,
> +	.get_frequency = dvb_dummy_tuner_get_frequency,
> +	.get_if_frequency = dvb_dummy_tuner_get_if_frequency,
> +	.get_status = dvb_dummy_tuner_get_status,
> +	.get_rf_strength = dvb_dummy_tuner_get_signal_strength
> +};
> +
> +static const struct i2c_device_id dvb_dummy_tuner_i2c_id_table[] = {
> +	{"dvb_dummy_tuner", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, dvb_dummy_tuner_i2c_id_table);
> +
> +static int dvb_dummy_tuner_i2c_probe(struct i2c_client *client,
> +				     const struct i2c_device_id *id)
> +{
> +	struct dvb_dummy_tuner_config *config = client->dev.platform_data;
> +	struct dvb_frontend *fe = config->fe;
> +	struct dvb_dummy_tuner_dev *tuner_dev = NULL;
> +
> +	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
> +	if (!tuner_dev)
> +		return -ENOMEM;
> +
> +	tuner_dev->fe = config->fe;
> +	i2c_set_clientdata(client, tuner_dev);
> +
> +	memcpy(&fe->ops.tuner_ops,
> +	       &dvb_dummy_tuner_ops,
> +	       sizeof(struct dvb_tuner_ops));
> +
> +	fe->tuner_priv = client;
> +
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_i2c_remove(struct i2c_client *client)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = i2c_get_clientdata(client);
> +	struct dvb_frontend *fe = tuner_dev->fe;
> +
> +	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
> +	fe->tuner_priv = NULL;
> +	kfree(tuner_dev);
> +
> +	return 0;
> +}
> +
> +static struct i2c_driver dvb_dummy_tuner_i2c_driver = {
> +	.driver = {
> +		.name = "dvb_dummy_tuner",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe		= dvb_dummy_tuner_i2c_probe,
> +	.remove		= dvb_dummy_tuner_i2c_remove,
> +	.id_table	= dvb_dummy_tuner_i2c_id_table,
> +};
> +module_i2c_driver(dvb_dummy_tuner_i2c_driver);
> +
> +MODULE_DESCRIPTION("DVB Dummy Tuner");
> +MODULE_AUTHOR("Daniel W. S. Almeida");
> +MODULE_LICENSE("GPL");



Thanks,
Mauro
