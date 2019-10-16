Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8FCCD96BE
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 18:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406111AbfJPQO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 12:14:28 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:59716 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728343AbfJPQO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 12:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IFYK7jK230rvg5UAMhMlJiijWiZK0m7AA2vFJ0b/3RQ=; b=wl9CfRy+GecOyLlv0+Cc6lOfr
        Wn2ihCTsxGMMTXyMZo9JIjTpppFZ6nCr2+5+QluyFO3g1On79CCwMH7W5sf5adk5/AXNvXrybaES2
        qEe1Ma1wnUFNVPzcmBktcOc889Az/vuGD71sl7B0bsWNQ1j8nrr9LTBqaIERz6lXtGPCybXjr431S
        Keh1QCy3lly6NXm21lGiD4scj7KHmsxWdAkQF4WPseoDz07yB9nyn3qHWY4TMXI2SDyz50g+mKqJS
        uElf2qNxAyjMqrpzz7NPqn9jWGScZq8+C4Z8jMgg/r3t0yF+eWdouqiKDNH1HmLaMmYstI6eC9qob
        /EsmPyerg==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:43798)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iKlwL-0003S0-18; Wed, 16 Oct 2019 17:14:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iKlwH-0007HP-3H; Wed, 16 Oct 2019 17:14:17 +0100
Date:   Wed, 16 Oct 2019 17:14:17 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv8 1/2] drm: tda998x: use cec_notifier_conn_(un)register
Message-ID: <20191016161417.GX25745@shell.armlinux.org.uk>
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016133916.21475-2-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 16, 2019 at 03:39:15PM +0200, Hans Verkuil wrote:
> From: Dariusz Marcinkiewicz <darekm@google.com>
> 
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Please explain in detail what this mutex actually achieves.

> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 84c6d4c91c65..8262b44b776e 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -82,6 +82,9 @@ struct tda998x_priv {
>  	u8 audio_port_enable[AUDIO_ROUTE_NUM];
>  	struct tda9950_glue cec_glue;
>  	struct gpio_desc *calib;
> +
> +	/* protect cec_notify */
> +	struct mutex cec_notify_mutex;
>  	struct cec_notifier *cec_notify;
>  };
>  
> @@ -805,8 +808,11 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
>  				tda998x_edid_delay_start(priv);
>  			} else {
>  				schedule_work(&priv->detect_work);
> -				cec_notifier_set_phys_addr(priv->cec_notify,
> -						   CEC_PHYS_ADDR_INVALID);
> +
> +				mutex_lock(&priv->cec_notify_mutex);
> +				cec_notifier_phys_addr_invalidate(
> +						priv->cec_notify);
> +				mutex_unlock(&priv->cec_notify_mutex);
>  			}
>  
>  			handled = true;
> @@ -1790,8 +1796,10 @@ static void tda998x_destroy(struct device *dev)
>  
>  	i2c_unregister_device(priv->cec);
>  
> -	if (priv->cec_notify)
> -		cec_notifier_put(priv->cec_notify);
> +	mutex_lock(&priv->cec_notify_mutex);
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +	priv->cec_notify = NULL;
> +	mutex_unlock(&priv->cec_notify_mutex);

By the time we get here:

1) The interrupt has been freed (which is a synchronous operation)
   tda998x_irq_thread() can't be called and can't be running, and
   therefore cec_notifier_phys_addr_invalidate() also can't be called
   or be running.
2) You don't touch the cec_notifier_set_phys_addr_from_edid() site;
   if there's any case that _might_ possibly conflict, it is that one.
3) tda998x_destroy() and tda998x_create() can't be called concurrently
   in any case; the driver model guarantees that ->probe and ->remove
   for the same device are serialised.

>  }
>  
>  static int tda998x_create(struct device *dev)
> @@ -1812,6 +1820,7 @@ static int tda998x_create(struct device *dev)
>  	mutex_init(&priv->mutex);	/* protect the page access */
>  	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
>  	mutex_init(&priv->edid_mutex);
> +	mutex_init(&priv->cec_notify_mutex);
>  	INIT_LIST_HEAD(&priv->bridge.list);
>  	init_waitqueue_head(&priv->edid_delay_waitq);
>  	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
> @@ -1916,7 +1925,9 @@ static int tda998x_create(struct device *dev)
>  		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
>  	}
>  
> -	priv->cec_notify = cec_notifier_get(dev);
> +	mutex_lock(&priv->cec_notify_mutex);
> +	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
> +	mutex_unlock(&priv->cec_notify_mutex);

and:

4) priv->cec_notify will be NULL here until such time that
   cec_notifier_conn_register() has returned.  If the mutex is trying
   to protect something, it's very unclear what it is.
   
Trying to guess what it's protecting against:

- Is it protecting against NULL priv->cec_notify?  No, because it can
  be NULL just before we take the lock.
- Is it protecting the internals of cec_notifier_conn_register()
  against the other calls - no, because priv->cec_notify will be NULL
  until the function has finished.
- Is it protecting the write to priv->cec_notify?  Maybe, but that
  doesn't need any protection - architectures are single-copy atomic,
  which means that a pointer is either written or it is not written.
  Therefore, it will either be NULL (the state before the call is made)
  or it will be set correctly (after the call has completed.)

So, all in all, I don't see what this lock is doing, and I think it
should be removed.

If it's necessary for a future change (which may or may not be merged)
then the lock should be part of that future change, because the change
proposed by this patch certainly does not need it.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
