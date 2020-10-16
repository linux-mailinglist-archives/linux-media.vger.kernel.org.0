Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62D2290700
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 16:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406090AbgJPOPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 10:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395338AbgJPOPH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 10:15:07 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E063C0613D3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 07:15:06 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a9so3123154lfc.7
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Tgk9PpZrlrrJL5QQTByN6YCbUtoIIbrVygmKAXQXYWg=;
        b=njqOTBzTuf6jB30b/yXWtqv+z0zBkLtJWjkBX3MF1hbYQ4K8LFJtma9qIOfwT/8SCu
         ouSaepYywg+DQ0zBF5Pre/DTZwnR7arvJqGM/IfBHSt5IOuK6zGeIQHfaRmyxsNGc+c5
         BC0bHLq0JZlPeVdh4WFByOF+eatmbOHGTIPaMJW5oFJEuHhc/5fTFgkJyWq9VVUit3uH
         wnVN9btUiaNHJbLY2lK+OSbudCiRAStKq88ASF6uwfwP0WFf3ajincpDf8fDVWph6XYl
         e6hGdJTF/scHXG419VYCdJ0IUbcSt1vK9bwNJargMUbdvj+R3tkuqZywNh4keZBjWicW
         5w1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Tgk9PpZrlrrJL5QQTByN6YCbUtoIIbrVygmKAXQXYWg=;
        b=gV10uhV5rEO2h6fxYTG3DRh+HBLLx9n5IxL4DcIDtUSE2lElHgMaTRhy3pRtEHij33
         k7MjKrAEcVuaWRTxE+phnjkc+nQajLR/otIH57qjeUUYEk7aF56jSNMo9aGQdjBI1xM6
         i2uvtPLMHx5ggwhjnE4UyAD8GJRUlEjuqWDL8LST4VLBDKJ7r1kpGQGfqTJ/B8NqRiwr
         VFEBNs2BTUEdMTtCD8cpmpKEZPvBsQeUv9cBTxkqf2DOyqXdVCW9cOWmgJ7gdoVNLATC
         cyAucgJc0STAyf7i7ggDTibrTasnFp9jaB5eMVioPXQcyMJbQ7oU3wOxH7x7N5WeB8my
         EzkQ==
X-Gm-Message-State: AOAM533FY3x26DJPH64c0j1y9W81nLCXQnn7oasGQoNjNMeJhhmaGQEc
        XA5curxgMMVMTVB//ZMGs9HnnQ==
X-Google-Smtp-Source: ABdhPJzmBWj5DqdAl4uhU0WfTlvV3gKDH7/Q50qY7UaoiEr6Kpqxxhg2Os5D0vgcLrzlhLT9VXqSmA==
X-Received: by 2002:a05:6512:2001:: with SMTP id a1mr1347509lfb.336.1602857704905;
        Fri, 16 Oct 2020 07:15:04 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id m28sm851816lfq.228.2020.10.16.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:15:04 -0700 (PDT)
Date:   Fri, 16 Oct 2020 16:15:03 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] rcar-vin: Add support for suspend and resume
Message-ID: <20201016141503.kas7h5lumwm3wmal@oden.dyn.berto.se>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
 <20201015231408.2399933-6-niklas.soderlund+renesas@ragnatech.se>
 <20201016160718.klbkccgcbnpoi7bq@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201016160718.klbkccgcbnpoi7bq@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your feedback.

On 2020-10-16 18:07:18 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Fri, Oct 16, 2020 at 01:14:08AM +0200, Niklas Söderlund wrote:
> > Add support for suspend and resume by stopping and starting the video
> > pipeline while still retaining all buffers given to the driver by
> > user-space and internally allocated ones, this gives the application a
> > seamless experience.
> >
> > Buffers are never returned to user-space unprocessed so user-space don't
> > notice when suspending. When resuming the driver restarts the capture
> > session using the internal scratch buffer, this happens before
> > user-space is unfrozen, this leads to speedy response times once the
> > application resumes its execution.
> >
> > As the entire pipeline is stopped on suspend all subdevices in use are
> > also stopped, and if they enter a shutdown state when not streaming
> > (such as the R-Car CSI-2 driver) they too will be suspended and resumed
> > in sync with the VIN driver.
> >
> > To be able to do keep track of which VINs should be resumed a new
> 
> s/to do/to/
> 
> > internal state SUSPENDED is added to recode this.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 51 +++++++++++++++++++++
> >  drivers/media/platform/rcar-vin/rcar-vin.h  | 10 ++--
> >  2 files changed, 57 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 34d003e0e9b9c25a..4adf4ce518f79c93 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -918,6 +918,54 @@ static int rvin_mc_init(struct rvin_dev *vin)
> >  	return ret;
> >  }
> >
> > +/* -----------------------------------------------------------------------------
> > + * Suspend / Resume
> > + */
> > +
> > +static int __maybe_unused rvin_suspend(struct device *dev)
> > +{
> > +	struct rvin_dev *vin = dev_get_drvdata(dev);
> > +
> > +	if (vin->state != RUNNING)
> > +		return 0;
> > +
> > +	rvin_stop_streaming(vin);
> 
> This delay suspend untill all the userspace queued buffers are not
> completed, right ?

Yes it will delay suspend until all the buffers queued by user-space AND 
have been written to one of the 3 hardware slots are completed. So the 
worst case scenario is a delay of 3 frames to complete.

Buffers queued by an application not yet commited to a slot are not 
waited for. Instead they are used when capture is resumed.

> 
> > +
> > +	vin->state = SUSPENDED;
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused rvin_resume(struct device *dev)
> > +{
> > +	struct rvin_dev *vin = dev_get_drvdata(dev);
> > +
> > +	if (vin->state != SUSPENDED)
> > +		return 0;
> > +
> > +	/*
> > +	 * Restore group master CHSEL setting.
> > +	 *
> > +	 * This needs to be by every VIN resuming not only the master
> > +	 * as we don't know if and in which order the master VINs will
> > +	 * be resumed.
> > +	 */
> > +	if (vin->info->use_mc) {
> > +		unsigned int master_id = rvin_group_id_to_master(vin->id);
> > +		struct rvin_dev *master = vin->group->vin[master_id];
> > +		int ret;
> > +
> > +		if (WARN_ON(!master))
> > +			return -ENODEV;
> > +
> > +		ret = rvin_set_channel_routing(master, master->chsel);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return rvin_start_streaming(vin);
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Platform Device Driver
> >   */
> > @@ -1421,9 +1469,12 @@ static int rcar_vin_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >
> > +static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
> > +
> >  static struct platform_driver rcar_vin_driver = {
> >  	.driver = {
> >  		.name = "rcar-vin",
> > +		.pm = &rvin_pm_ops,
> >  		.of_match_table = rvin_of_id_table,
> >  	},
> >  	.probe = rcar_vin_probe,
> > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > index 4ec8584709c847a9..4539bd53d9d41e9c 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > @@ -49,16 +49,18 @@ enum rvin_csi_id {
> >  };
> >
> >  /**
> > - * STOPPED  - No operation in progress
> > - * STARTING - Capture starting up
> > - * RUNNING  - Operation in progress have buffers
> > - * STOPPING - Stopping operation
> > + * STOPPED   - No operation in progress
> > + * STARTING  - Capture starting up
> > + * RUNNING   - Operation in progress have buffers
> > + * STOPPING  - Stopping operation
> > + * SUSPENDED - Capture is suspended
> >   */
> >  enum rvin_dma_state {
> >  	STOPPED = 0,
> >  	STARTING,
> >  	RUNNING,
> >  	STOPPING,
> > +	SUSPENDED,
> >  };
> >
> >  /**
> > --
> > 2.28.0
> >

-- 
Regards,
Niklas Söderlund
