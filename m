Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9015156527C
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 12:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiGDKhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 06:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbiGDKhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 06:37:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26617E0CB
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 03:37:35 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240127029.bbtec.net [36.240.127.29])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51E5F735;
        Mon,  4 Jul 2022 12:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656931053;
        bh=+AkxnrXoEk+1/h/5edijx5xZQVrBcbd4OMCVCXatUGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qFsM4zsW3gBOuD3Oi8Fg2rNZkUcs41TKEr9XdzVB+HwVYmlLFgnwHdq8PBYgXDNxz
         5IRKoO+cCz9CiGaeR3KYWOVReaesDLWb3b/xSuVk4BI1WiL8bvwfntbunuRnZY4htb
         xWmEG3EtCNXvckHYh4KrCtu9CSJnUgGoFPfSAZ2M=
Date:   Mon, 4 Jul 2022 19:37:24 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 50/55] media: rkisp1: Add and set registers for crop for
 i.MX8MP
Message-ID: <20220704103724.GE3886060@pyrite.rasen.tech>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-51-paul.elder@ideasonboard.com>
 <YrhKBN8lrI+beC26@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrhKBN8lrI+beC26@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Jun 26, 2022 at 02:59:00PM +0300, Laurent Pinchart wrote:
> Hi Paul,
> 
> Thank you for the patch.
> 
> On Wed, Jun 15, 2022 at 04:11:22AM +0900, Paul Elder wrote:
> > The ISP version in the i.MX8MP has a separate set of registers for crop
> > that is currently not handled. Add a feature flag to determine which
> > type of crop the ISP supports and set the crop registers based on that.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
> >  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 14 +++++++++++++-
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  7 +++++--
> >  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 +++++++++
> >  .../platform/rockchip/rkisp1/rkisp1-resizer.c | 19 +++++++++++++++++--
> >  5 files changed, 46 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 667fca0fef95..e4f422bed09a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -110,6 +110,8 @@ enum rkisp1_isp_pad {
> >   */
> >  enum rkisp1_feature {
> >  	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
> > +	RKISP1_FEATURE_DUAL_CROP = BIT(1),
> > +	RKISP1_FEATURE_RSZ_CROP = BIT(2),
> >  };
> >  
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > index 02854e8ea1a4..753abd024ce7 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > @@ -115,9 +115,21 @@ static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
> >  		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_VC),
> >  		{ /* Sentinel */ },
> >  	};
> > +	static const struct rkisp1_debug_register crop_registers[] = {
> > +		RKISP1_DEBUG_SHD_REG(RSZ_CROP_X_DIR),
> > +		RKISP1_DEBUG_SHD_REG(RSZ_CROP_Y_DIR),
> > +		RKISP1_DEBUG_REG(RSZ_FRAME_RATE),
> > +		RKISP1_DEBUG_REG(RSZ_FORMAT_CONV_CTRL),
> > +		{ /* Sentinel */ },
> > +	};
> >  	struct rkisp1_resizer *rsz = m->private;
> >  
> > -	return rkisp1_debug_dump_regs(rsz->rkisp1, m, rsz->regs_base, registers);
> > +	rkisp1_debug_dump_regs(rsz->rkisp1, m, rsz->regs_base, registers);
> > +	if (rsz->rkisp1->info->features & RKISP1_FEATURE_RSZ_CROP)
> > +		rkisp1_debug_dump_regs(rsz->rkisp1, m, rsz->regs_base,
> > +				       crop_registers);
> > +
> > +	return 0;
> >  }
> >  DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
> >  
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index a4496ee2e9b4..5abe33f5fed4 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -465,7 +465,8 @@ static const struct rkisp1_info px30_isp_info = {
> >  	.isrs = px30_isp_isrs,
> >  	.isr_size = ARRAY_SIZE(px30_isp_isrs),
> >  	.isp_ver = RKISP1_V12,
> > -	.features = RKISP1_FEATURE_MIPI_CSI2,
> > +	.features = RKISP1_FEATURE_MIPI_CSI2
> > +		  | RKISP1_FEATURE_DUAL_CROP,
> >  };
> >  
> >  static const char * const rk3399_isp_clks[] = {
> > @@ -484,7 +485,8 @@ static const struct rkisp1_info rk3399_isp_info = {
> >  	.isrs = rk3399_isp_isrs,
> >  	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
> >  	.isp_ver = RKISP1_V10,
> > -	.features = RKISP1_FEATURE_MIPI_CSI2,
> > +	.features = RKISP1_FEATURE_MIPI_CSI2
> > +		  | RKISP1_FEATURE_DUAL_CROP,
> >  };
> >  
> >  static const char * const imx8mp_isp_clks[] = {
> > @@ -503,6 +505,7 @@ static const struct rkisp1_info imx8mp_isp_info = {
> >  	.isrs = imx8mp_isp_isrs,
> >  	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> >  	.isp_ver = IMX8MP_V10,
> > +	.features = RKISP1_FEATURE_RSZ_CROP,
> >  };
> >  
> >  static const struct of_device_id rkisp1_of_match[] = {
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > index dd3e6c38be67..1fc54ab22b6d 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > @@ -168,6 +168,9 @@
> >  #define RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO		BIT(9)
> >  #define RKISP1_CIF_RSZ_SCALER_FACTOR			BIT(16)
> >  
> > +/* RSZ_CROP_[XY]_DIR */
> > +#define RKISP1_CIF_RSZ_CROP_XY_DIR(start, end)		((end) << 16 | (start) << 0)
> > +
> >  /* MI_IMSC - MI_MIS - MI_RIS - MI_ICR - MI_ISR */
> >  #define RKISP1_CIF_MI_FRAME(stream)			BIT((stream)->id)
> >  #define RKISP1_CIF_MI_MBLK_LINE				BIT(2)
> > @@ -926,6 +929,12 @@
> >  #define RKISP1_CIF_RSZ_PHASE_HC_SHD		0x004C
> >  #define RKISP1_CIF_RSZ_PHASE_VY_SHD		0x0050
> >  #define RKISP1_CIF_RSZ_PHASE_VC_SHD		0x0054
> > +#define RKISP1_CIF_RSZ_CROP_X_DIR		0x0058
> > +#define RKISP1_CIF_RSZ_CROP_Y_DIR		0x005C
> > +#define RKISP1_CIF_RSZ_CROP_X_DIR_SHD		0x0060
> > +#define RKISP1_CIF_RSZ_CROP_Y_DIR_SHD		0x0064
> > +#define RKISP1_CIF_RSZ_FRAME_RATE		0x0068
> > +#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL		0x006C
> >  
> >  #define RKISP1_CIF_MI_BASE			0x00001400
> >  #define RKISP1_CIF_MI_CTRL			(RKISP1_CIF_MI_BASE + 0x00000000)
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > index f4caa8f684aa..08bf3aa8088f 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > @@ -244,6 +244,7 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
> >  {
> >  	u32 ratio, rsz_ctrl = 0;
> >  	unsigned int i;
> > +	u32 val;
> >  
> >  	/* No phase offset */
> >  	rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_PHASE_HY, 0);
> > @@ -292,6 +293,18 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
> >  
> >  	rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CTRL, rsz_ctrl);
> >  
> > +	if (rsz->rkisp1->info->features & RKISP1_FEATURE_RSZ_CROP) {
> > +		val = RKISP1_CIF_RSZ_CROP_XY_DIR(src_y->left, src_y->left + src_y->width - 1);
> > +		rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CROP_X_DIR, val);
> > +		val = RKISP1_CIF_RSZ_CROP_XY_DIR(src_y->top, src_y->top + src_y->height - 1);
> > +		rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CROP_Y_DIR, val);
> > +
> > +		val = RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_INPUT_FORMAT_YCBCR_422
> > +		    | RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_OUTPUT_FORMAT_YCBCR_420
> > +		    | RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_PACK_FORMAT_SEMI_PLANAR;
> 
> Shouldn't this depend on the input and output formats of the resizer ?

Oops, yeah it should.


Paul

> 
> > +		rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_FORMAT_CONV_CTRL, val);
> > +	}
> > +
> >  	rkisp1_rsz_update_shadow(rsz, when);
> >  }
> >  
> > @@ -656,7 +669,8 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
> >  	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
> >  
> >  	if (!enable) {
> > -		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
> > +		if (rkisp1->info->features & RKISP1_FEATURE_DUAL_CROP)
> > +			rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
> >  		rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
> >  		return 0;
> >  	}
> > @@ -666,7 +680,8 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
> >  
> >  	mutex_lock(&rsz->ops_lock);
> >  	rkisp1_rsz_config(rsz, when);
> > -	rkisp1_dcrop_config(rsz);
> > +	if (rkisp1->info->features & RKISP1_FEATURE_DUAL_CROP)
> > +		rkisp1_dcrop_config(rsz);
> >  
> >  	mutex_unlock(&rsz->ops_lock);
> >  	return 0;
