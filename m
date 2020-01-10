Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E428013684D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 08:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgAJHa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 02:30:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:45510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgAJHa2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 02:30:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 519942080D;
        Fri, 10 Jan 2020 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578641426;
        bh=Yu/2n8DClrm96hoke21y0xbEXtsW3RBIkIxXo5KRjSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ISpLn2mfIF2u7Wnb+6BKaCkgefOwKLTy3IqIH1G4rwHdcdz37va2w5UjUHLPo1iWm
         cOsbb9NsvjLk9miVjD2Wzg4W9jSAxEIl23hPLJu002Ggn+yGR7t5CQkNuUKP3UyYt5
         Io3Kge9CllGQY+PCXj73+nFOhCwYnpiAX/H50NrU=
Date:   Fri, 10 Jan 2020 08:30:24 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] media: dvb_dummy_tuner: implement driver skeleton
Message-ID: <20200110073024.GA156006@kroah.com>
References: <20200109233757.734008-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109233757.734008-1-dwlsalmeida@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 09, 2020 at 08:37:57PM -0300, Daniel W. S. Almeida wrote:
> +config MEDIA_TUNER_DVB_DUMMY_TUNER
> +	tristate "Dummy tuner"

"Dummy DVB Media Tuner" perhaps?

> +	depends on MEDIA_SUPPORT && I2C
> +	default n

"default n" is always the default, no need to list it again here.

> +	help
> +	  The virtual DVB test driver serves as a reference DVB driver and helps
> +	  validate the existing APIs in the media subsystem. It can also aid
> +	  developers working on userspace applications.

A bit of text here saying what the module name would be is always nice,
see other Kconfig entries for the normal text needed.

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
> index 000000000000..8aed5d583eeb
> --- /dev/null
> +++ b/drivers/media/tuners/dvb_dummy_tuner.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

I have to ask, are you _SURE_ you want "GPL 2+" here?


> +/*
> + * A dummy DVB tuner as part of ongoing work
> + * on a virtual DVB test driver under the 2020 Spring Linux
> + * Kernel Mentorship Program.

No need for saying why it was written in the file like this :)

> + *
> + * The virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid developers
> + * working on userspace applications.
> + *
> + * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> + * ISDB-T and ATSC when completed.
> + *
> + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Normally this is the first comment line above in this block.

> + */
> +
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <media/dvb_frontend.h>
> +#include "dvb_dummy_tuner.h"
> +
> +struct dvb_dummy_tuner_dev {
> +	struct dvb_frontend *fe;
> +};
> +
> +static void dvb_dummy_tuner_release(struct dvb_frontend *fe)
> +{
> +}
> +
> +static int dvb_dummy_tuner_init(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_sleep(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_suspend(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_resume(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_set_params(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_set_config(struct dvb_frontend *fe, void *priv_cfg)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_frequency(struct dvb_frontend *fe,
> +					 u32 *frequency)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_bandwidth(struct dvb_frontend *fe,
> +					 u32 *bandwidth)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_if_frequency(struct dvb_frontend *fe,
> +					    u32 *frequency)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_status(struct dvb_frontend *fe, u32 *status)
> +{
> +	return 0;
> +}
> +
> +static const struct dvb_tuner_ops dvb_dummy_tuner_ops = {
> +	.release = dvb_dummy_tuner_release,
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
> +	int ret = 0;
> +	struct dvb_dummy_tuner_config *config = client->dev.platform_data;
> +	struct dvb_frontend *fe = config->fe;
> +	struct dvb_dummy_tuner_dev *tuner_dev = NULL;
> +
> +	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
> +	if (!tuner_dev) {
> +		ret = -ENOMEM;
> +		goto err;

Simplify this by just doing:
	return -ENOMEM;

No need to jump around the function for no actual cleanup.


> +	}
> +
> +	i2c_set_clientdata(client, tuner_dev);
> +	tuner_dev->fe = config->fe;

Normal "pattern" is to set up the variable and after it's all ready,
then save the pointer off.  In other words, reverse these two lines :)

> +
> +	memcpy(&fe->ops.tuner_ops,
> +	       &dvb_dummy_tuner_ops,
> +	       sizeof(struct dvb_tuner_ops));
> +
> +	fe->tuner_priv = client;
> +
> +	return ret;
> +
> +err:
> +	return ret;
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
> diff --git a/drivers/media/tuners/dvb_dummy_tuner.h b/drivers/media/tuners/dvb_dummy_tuner.h
> new file mode 100644
> index 000000000000..3569bbc3716e
> --- /dev/null
> +++ b/drivers/media/tuners/dvb_dummy_tuner.h

Why do you need a .h file for a simple driver that does not export
anything to anyone else?

> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Not the same license as your .c file?  Odd :(

> +/*
> + * A dummy DVB tuner as part of ongoing work
> + * on a virtual DVB test driver under the 2020 Spring Linux
> + * Kernel Mentorship Program.
> + *
> + * The virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid developers
> + * working on userspace applications.
> + *
> + * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> + * ISDB-T and ATSC when completed.
> + *
> + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>

If you keep this file, same comments as above for the comment block, but
really, you don't need this .h file at all, just drop it.

thanks,

greg k-h
