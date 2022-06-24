Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B109A559CB9
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 17:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbiFXOwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 10:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233660AbiFXOwd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 10:52:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51507B365
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 07:47:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACB8C9DA;
        Fri, 24 Jun 2022 16:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656082053;
        bh=Y+WGZO8bLebArdrpiB2MKq+ISy5HQ1/AEVJ808pICrU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W8nBAXvfT/ME0rtLzG0guc6t1MFw5bUD8z/SERWG/hwRAhcAHabGQy0/DLIi99Ma+
         mFsG6d3Z581c5bSPSlr1BgviG5ovIh6oNi7A+9DKBcvDauXWMvno2xab2Yfu2cuthB
         ThcMWys6zE0gZIFS+WN1+DjTyaQJ9S3Guzzlo3pw=
Date:   Fri, 24 Jun 2022 17:47:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 07/55] media: rkisp1: Save info pointer in rkisp1_device
Message-ID: <YrXOdaswfJZoxK3S@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-8-paul.elder@ideasonboard.com>
 <20220624143400.ars53iairqqbdmq2@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220624143400.ars53iairqqbdmq2@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, Jun 24, 2022 at 05:34:00PM +0300, Dafna Hirschfeld wrote:
> On 15.06.2022 04:10, Paul Elder wrote:
> > To make it possible to use the rkisp1_info after probe time (for
> > instance to make code conditional on the ISP version), save it in the
> > main rkisp1_device structure. To achieve this, also move the info
> > structure into the common header, and document it.
> > 
> > While at it, drop a NULL check in rkisp1_probe() for the match data as
> > it can't happen.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  | 22 +++++++++++++++++++
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 +++----------
> >  2 files changed, 25 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index a67fe7b1dfa1..50d31a254b03 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -91,6 +91,26 @@ enum rkisp1_isp_pad {
> >  	RKISP1_ISP_PAD_MAX
> >  };
> > 
> > +/*
> > + * struct rkisp1_info - Model-specific ISP Information
> > + *
> > + * @clks: array of ISP clock names
> > + * @clk_size: number of entries in the @clks array
> > + * @isrs: array of ISP interrupt descriptors
> > + * @isr_size: number of entires in the @isrs array
> > + * @isp_ver: ISP version
> > + *
> > + * This structure contains information about the ISP specific to a particular
> > + * ISP model, version, or integration in a particular SoC.
> > + */
> > +struct rkisp1_info {
> > +	const char * const *clks;
> > +	unsigned int clk_size;
> > +	const struct rkisp1_isr_data *isrs;
> > +	unsigned int isr_size;
> > +	enum rkisp1_cif_isp_version isp_ver;
> > +};
> > +
> >  /*
> >   * struct rkisp1_sensor_async - A container for the v4l2_async_subdev to add to the notifier
> >   *				of the v4l2-async API
> > @@ -395,6 +415,7 @@ struct rkisp1_debug {
> >   * @pipe:	   media pipeline
> >   * @stream_lock:   serializes {start/stop}_streaming callbacks between the capture devices.
> >   * @debug:	   debug params to be exposed on debugfs
> > + * @info:	   version-specific ISP information
> >   */
> >  struct rkisp1_device {
> >  	void __iomem *base_addr;
> > @@ -413,6 +434,7 @@ struct rkisp1_device {
> >  	struct media_pipeline pipe;
> >  	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
> >  	struct rkisp1_debug debug;
> > +	const struct rkisp1_info *info;
> >  };
> > 
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 258980ef4783..39ae35074062 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -105,14 +105,6 @@ struct rkisp1_isr_data {
> >  	irqreturn_t (*isr)(int irq, void *ctx);
> >  };
> > 
> > -struct rkisp1_info {
> > -	const char * const *clks;
> > -	unsigned int clk_size;
> > -	const struct rkisp1_isr_data *isrs;
> > -	unsigned int isr_size;
> > -	enum rkisp1_cif_isp_version isp_ver;
> > -};
> > -
> >  /* ----------------------------------------------------------------------------
> >   * Sensor DT bindings
> >   */
> > @@ -469,14 +461,13 @@ static int rkisp1_probe(struct platform_device *pdev)
> >  	int ret, irq;
> >  	u32 cif_id;
> > 
> > -	info = of_device_get_match_data(&pdev->dev);
> > -	if (!info)
> > -		return -ENODEV;
> > -
> >  	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
> >  	if (!rkisp1)
> >  		return -ENOMEM;
> > 
> > +	info = of_device_get_match_data(dev);
> 
> Why did you omit the check 'if(!info)'?

Because it can't happen. The probe() function is only called if the
platform device matches one of the of_device_id, so
of_device_get_match_data() can't return NULL.

> > +	rkisp1->info = info;
> > +
> >  	dev_set_drvdata(dev, rkisp1);
> >  	rkisp1->dev = dev;
> > 

-- 
Regards,

Laurent Pinchart
