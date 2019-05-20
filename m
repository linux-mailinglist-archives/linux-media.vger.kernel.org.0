Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8207924220
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 22:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfETUcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 16:32:23 -0400
Received: from casper.infradead.org ([85.118.1.10]:52276 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfETUcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 16:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DrePGapobT0/jeyrxWsG/afNB12hhw1M5/Vn3LEnifY=; b=HLhpJrC3JWMXPUdU9mEw+SDV5Z
        4istiNEVNuJXrCq+0XrBgreA0kLF95O4i1PF3+taGLgUZ3ONwPWevu/YH//SPSE/p0bgb5lNaLmBN
        yG+nLE89vXAuCXm9cHBsmqLYr0LfAiGHg+lRYCbG9cnIGvEcOnLNbiMWsOgM5bX3KtAIoog65Cs2n
        1XMsiscmN01DFc+NdeiS0OF8wzEEq+3e8HQRmoGnBO/c4bUZZpEtA/dWbzgRzPQM9c3GZjGUtBmsV
        6K53uFT7LDqL/wFqXwyyn36B3NinH/dqEJfKfRg/oPqHlrKbEqpRuy0zDpCkFAjjJCgt0Bv6U2P7G
        HSp51TJA==;
Received: from 179.176.119.151.dynamic.adsl.gvt.net.br ([179.176.119.151] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hSoxH-0001rA-Ip; Mon, 20 May 2019 20:32:20 +0000
Date:   Mon, 20 May 2019 17:32:15 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: dvb: remove replace frontend_debug with
 dynamic debug
Message-ID: <20190520173215.79e048d4@coco.lan>
In-Reply-To: <20190520200144.16713-2-sean@mess.org>
References: <20190520200144.16713-1-sean@mess.org>
        <20190520200144.16713-2-sean@mess.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 20 May 2019 21:01:44 +0100
Sean Young <sean@mess.org> escreveu:

> This simplifies the code a little. This does move a dev_dbg() into a
> timing sensitive code path. This is in the microseconds order so dev_dbg()
> should not make a difference.

This may actually not be true... I remember we had, in the past, at the
saa7134 driver a certain tuner that require a small delay at the order
of ~1 millisecond for it to work. 

There was a printk() message between the two hardware register settings
at the place that would require the delay.

I usually debug those things using a serial console, with debug messages
enabled.

So, every time I tested, I was unable to reproduce the bug, while, for
others, the bug was there.

Ok, the internal print facilities upstream changed a lot those years,
so, things may have changed if I was here to do the tests, but it
sounds a little risky to do such change without enabling a lot of
debug stuff and test it on a real hardware via a serial console.


> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/dvb-core/dvb_frontend.c | 39 +++++++++++++--------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index d3c0f6267bf8..3aad13415654 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -47,15 +47,12 @@
>  #include <media/dvbdev.h>
>  #include <linux/dvb/version.h>
>  
> -static int dvb_frontend_debug;
>  static int dvb_shutdown_timeout;
>  static int dvb_force_auto_inversion;
>  static int dvb_override_tune_delay;
>  static int dvb_powerdown_on_sleep = 1;
>  static int dvb_mfe_wait_time = 5;
>  
> -module_param_named(frontend_debug, dvb_frontend_debug, int, 0644);
> -MODULE_PARM_DESC(frontend_debug, "Turn on/off frontend core debugging (default:off).");
>  module_param(dvb_shutdown_timeout, int, 0644);
>  MODULE_PARM_DESC(dvb_shutdown_timeout, "wait <shutdown_timeout> seconds after close() before suspending hardware");
>  module_param(dvb_force_auto_inversion, int, 0644);
> @@ -917,9 +914,9 @@ static void dvb_frontend_get_frequency_limits(struct dvb_frontend *fe,
>  			 "DVB: adapter %i frontend %u frequency limits undefined - fix the driver\n",
>  			 fe->dvb->num, fe->id);
>  
> -	if (dvb_frontend_debug)
> -		dprintk("frequency interval: tuner: %u...%u, frontend: %u...%u",
> -			tuner_min, tuner_max, frontend_min, frontend_max);
> +	dev_dbg(fe->dvb->device,
> +		"frequency interval: tuner: %u...%u, frontend: %u...%u",
> +		tuner_min, tuner_max, frontend_min, frontend_max);
>  
>  	/* If the standard is for satellite, convert frequencies to kHz */
>  	switch (c->delivery_system) {
> @@ -2586,41 +2583,41 @@ static int dvb_frontend_handle_ioctl(struct file *file,
>  			 */
>  			unsigned long swcmd = ((unsigned long)parg) << 1;
>  			ktime_t nexttime;
> -			ktime_t tv[10];
> +			ktime_t now, lasttime;
>  			int i;
>  			u8 last = 1;
>  
> -			if (dvb_frontend_debug)
> -				dprintk("switch command: 0x%04lx\n",
> -					swcmd);
> +			dev_dbg(fe->dvb->device, "switch command: 0x%04lx\n",
> +				swcmd);
>  			nexttime = ktime_get_boottime();
> -			if (dvb_frontend_debug)
> -				tv[0] = nexttime;
>  			/* before sending a command, initialize by sending
>  			 * a 32ms 18V to the switch
>  			 */
>  			fe->ops.set_voltage(fe, SEC_VOLTAGE_18);
> +
> +			dev_dbg(fe->dvb->device, "(adapter %d): switch delay (should be 32k followed by all 8k)\n",
> +				fe->dvb->num);
> +
> +			lasttime = nexttime;
>  			dvb_frontend_sleep_until(&nexttime, 32000);
>  
>  			for (i = 0; i < 9; i++) {
> -				if (dvb_frontend_debug)
> -					tv[i + 1] = ktime_get_boottime();
>  				if ((swcmd & 0x01) != last) {
>  					/* set voltage to (last ? 13V : 18V) */
>  					fe->ops.set_voltage(fe, (last) ? SEC_VOLTAGE_13 : SEC_VOLTAGE_18);
>  					last = (last) ? 0 : 1;
>  				}
>  				swcmd = swcmd >> 1;
> +
> +				now = ktime_get_boottime();
> +				dev_dbg(fe->dvb->device, "%d: %lld\n", i,
> +					ktime_us_delta(now, lasttime));
> +				lasttime = now;
> +
>  				if (i != 8)
>  					dvb_frontend_sleep_until(&nexttime, 8000);
>  			}
> -			if (dvb_frontend_debug) {
> -				dprintk("(adapter %d): switch delay (should be 32k followed by all 8k)\n",
> -					fe->dvb->num);
> -				for (i = 1; i < 10; i++)
> -					pr_info("%d: %d\n", i,
> -						(int)ktime_us_delta(tv[i], tv[i - 1]));
> -			}
> +
>  			err = 0;
>  			fepriv->state = FESTATE_DISEQC;
>  			fepriv->status = 0;



Thanks,
Mauro
