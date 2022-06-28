Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A17A55D52D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243287AbiF1DeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 23:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243262AbiF1DeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 23:34:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13A92315F
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 20:34:15 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240122163.bbtec.net [36.240.122.163])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44DF555A;
        Tue, 28 Jun 2022 05:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656387253;
        bh=uAW6GcHoUPMiKxGuSCNLO3RgTEVtafdBLbuDPx0TbhY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CSiiZafd9ndjTM1FD7nY1tRI5u2LEanI/1y8hj0i9Q4SHbHhu8VO51pi1e7bu9L5G
         i0f0N2eLJLK++ZQJNer+Di2NPvkTjajPB3y+vLIQQIQkMDKOHWUbrtEkWax9m+DnjL
         eFtI1Wy0mm8pmRqSzohiAYAqyuXZprRj9Z56PZ8k=
Date:   Tue, 28 Jun 2022 12:34:03 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: rkisp1: Support devices without self path
Message-ID: <20220628033403.GA1392345@pyrite.rasen.tech>
References: <20220627104429.1454717-1-paul.elder@ideasonboard.com>
 <YrmUOtdC09w/nb46@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrmUOtdC09w/nb46@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Jun 27, 2022 at 02:27:54PM +0300, Laurent Pinchart wrote:
> Hi Paul,
> 
> Thank you for the patch.
> 
> On Mon, Jun 27, 2022 at 07:44:29PM +0900, Paul Elder wrote:
> > Some hardware supported by the rkisp1 driver, such as the ISP in the
> > i.MX8MP, don't have a self path. Add a feature flag for this, and
> > massage the rest of the driver to support the lack of a self path.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > ---
> > This patch depends on "media: rkisp1: Cleanups and add support for
> > i.MX8MP" [1], which in turn depends on v4 of "media: rkisp1: Misc bug fixes
> > and cleanups" [2].
> > 
> > [1] https://lore.kernel.org/linux-media/20220625070034.6odv6cyvqqigb2sa@guri/T/
> > [2] https://lore.kernel.org/linux-media/Ymbxs2p9Tuf331qM@pendragon.ideasonboard.com/T/
> > ---
> >  .../media/platform/rockchip/rkisp1/rkisp1-capture.c   | 11 ++++++++---
> >  .../media/platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c   | 10 +++++++---
> >  .../media/platform/rockchip/rkisp1/rkisp1-resizer.c   |  7 +++++--
> >  4 files changed, 21 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 234b1f8488cb..9387996f64a4 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -711,6 +711,8 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
> >  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> >  	unsigned int i;
> >  	u32 status;
> > +	bool self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
> > +	unsigned int dev_count = ARRAY_SIZE(rkisp1->capture_devs) - (self_path ? 0 : 1);
> 
> Please move those two lines up a bit, just below rkisp1, to more or less
> soft them by length.
> 
> I'm tempted to just write
> 
> 	unsigned int dev_count = self_path ? 2 : 1;
> 
> Or even better, add an inline function to the common.h header for this ?
> The code is duplicated in many places.

Yeah that's probably better.

> 
> >  
> >  	status = rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
> >  	if (!status)
> > @@ -718,7 +720,7 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
> >  
> >  	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, status);
> >  
> > -	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); ++i) {
> > +	for (i = 0; i < dev_count; ++i) {
> >  		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
> >  
> >  		if (!(status & RKISP1_CIF_MI_FRAME(cap)))
> > @@ -875,6 +877,7 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
> >  {
> >  	struct rkisp1_device *rkisp1 = cap->rkisp1;
> >  	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
> > +	bool has_self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
> >  
> >  	cap->ops->set_data_path(cap);
> >  	cap->ops->config(cap);
> > @@ -892,7 +895,7 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
> >  	 * This's also required because the second FE maybe corrupt
> >  	 * especially when run at 120fps.
> >  	 */
> > -	if (!other->is_streaming) {
> > +	if (has_self_path && !other->is_streaming) {
> 
> Shouldn't this be
> 
> 	if (!has_self_path || !other->is_streaming) {
> 
> ? If there's no self-path, it can't be streaming, should we should
> update immediately, or am I missing something ?

Oh oops yeah you're right. My thought process was guard condition but
clearly that's not right :/

Not sure why this passed tests then...


Thanks,

Paul

> 
> >  		/* force cfg update */
> >  		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT,
> >  			     RKISP1_CIF_MI_INIT_SOFT_UPD);
> > @@ -1447,8 +1450,10 @@ int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
> >  {
> >  	unsigned int i;
> >  	int ret;
> > +	bool self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
> > +	unsigned int dev_count = ARRAY_SIZE(rkisp1->capture_devs) - (self_path ? 0 : 1);
> >  
> > -	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
> > +	for (i = 0; i < dev_count; i++) {
> >  		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
> >  
> >  		rkisp1_capture_init(rkisp1, i);
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 0b834579d08c..4a9e53aa3229 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -114,6 +114,7 @@ enum rkisp1_feature {
> >  	RKISP1_FEATURE_RSZ_CROP = BIT(2),
> >  	RKISP1_FEATURE_MAIN_STRIDE = BIT(3),
> >  	RKISP1_FEATURE_DMA_34BIT = BIT(4),
> > +	RKISP1_FEATURE_SELF_PATH = BIT(5),
> >  };
> >  
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 4c77aa2bc50a..721075849a25 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -328,6 +328,8 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
> >  {
> >  	unsigned int i;
> >  	int ret;
> > +	bool self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
> > +	unsigned int dev_count = self_path ? 2 : 1;
> >  
> >  	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
> >  		/* Link the CSI receiver to the ISP. */
> > @@ -341,7 +343,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
> >  	}
> >  
> >  	/* create ISP->RSZ->CAP links */
> > -	for (i = 0; i < 2; i++) {
> > +	for (i = 0; i < dev_count; i++) {
> >  		struct media_entity *resizer =
> >  			&rkisp1->resizer_devs[i].sd.entity;
> >  		struct media_entity *capture =
> > @@ -466,7 +468,8 @@ static const struct rkisp1_info px30_isp_info = {
> >  	.isr_size = ARRAY_SIZE(px30_isp_isrs),
> >  	.isp_ver = RKISP1_V12,
> >  	.features = RKISP1_FEATURE_MIPI_CSI2
> > -		  | RKISP1_FEATURE_DUAL_CROP,
> > +		  | RKISP1_FEATURE_DUAL_CROP
> > +		  | RKISP1_FEATURE_SELF_PATH,
> >  };
> >  
> >  static const char * const rk3399_isp_clks[] = {
> > @@ -486,7 +489,8 @@ static const struct rkisp1_info rk3399_isp_info = {
> >  	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
> >  	.isp_ver = RKISP1_V10,
> >  	.features = RKISP1_FEATURE_MIPI_CSI2
> > -		  | RKISP1_FEATURE_DUAL_CROP,
> > +		  | RKISP1_FEATURE_DUAL_CROP
> > +		  | RKISP1_FEATURE_SELF_PATH,
> >  };
> >  
> >  static const char * const imx8mp_isp_clks[] = {
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > index 29a31b18a082..fe699b49757c 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > @@ -673,6 +673,7 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
> >  	struct rkisp1_device *rkisp1 = rsz->rkisp1;
> >  	struct rkisp1_capture *other = &rkisp1->capture_devs[rsz->id ^ 1];
> >  	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
> > +	bool has_self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
> >  
> >  	if (!enable) {
> >  		if (rkisp1->info->features & RKISP1_FEATURE_DUAL_CROP)
> > @@ -681,7 +682,7 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
> >  		return 0;
> >  	}
> >  
> > -	if (other->is_streaming)
> > +	if (has_self_path && other->is_streaming)
> >  		when = RKISP1_SHADOW_REGS_ASYNC;
> >  
> >  	mutex_lock(&rsz->ops_lock);
> > @@ -771,8 +772,10 @@ int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1)
> >  {
> >  	unsigned int i;
> >  	int ret;
> > +	bool self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
> > +	unsigned int dev_count = ARRAY_SIZE(rkisp1->resizer_devs) - (self_path ? 0 : 1);
> >  
> > -	for (i = 0; i < ARRAY_SIZE(rkisp1->resizer_devs); i++) {
> > +	for (i = 0; i < dev_count; i++) {
> >  		struct rkisp1_resizer *rsz = &rkisp1->resizer_devs[i];
> >  
> >  		rsz->rkisp1 = rkisp1;
