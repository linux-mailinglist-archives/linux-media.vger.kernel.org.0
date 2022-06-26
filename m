Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF6A55B194
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 13:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiFZLlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 07:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiFZLlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 07:41:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E040F11A32
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 04:41:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 355F047C;
        Sun, 26 Jun 2022 13:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656243663;
        bh=cYzdx3uKLVEDVNkxLTn7JjhlxbIX358DSvDWa5D2URE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WD4VCrpmtOeZIZoPAh+4Bu20Zu8+mHyF4ev3zo1/JqM4hvRENIK391kvmImQHhfM/
         i6L8D47xCpZBspjGC1sqCeyXSlNnb3k43eI13+orKjEek/EmD50lft1oFH52Moip3T
         iddOdVpOTkxLwUnaANsPSE3NBMLy4eWrXA7yOT7I=
Date:   Sun, 26 Jun 2022 14:40:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: (EXT) [PATCH 55/55] media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
Message-ID: <YrhFvatJPuI1giMt@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-56-paul.elder@ideasonboard.com>
 <3553507.tdWV9SEqCh@steina-w>
 <Yq0INaUi1yaB0d8F@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yq0INaUi1yaB0d8F@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Ping

On Sat, Jun 18, 2022 at 02:03:19AM +0300, Laurent Pinchart wrote:
> On Thu, Jun 16, 2022 at 10:05:06AM +0200, Alexander Stein wrote:
> > Am Dienstag, 14. Juni 2022, 21:11:27 CEST schrieb Paul Elder:
> > > The ISP that is integrated in the i.MX8MP uses different bits in the
> > > MRSZ_CTRL and SRSZ_CTRL registers for updating the configuration
> > > compared to the on in the RK3399. In addition, it adds a new bit for
> > > enabling crop. Add new definitions for these bits for i.MX8MP devices,
> > > and update where they are set.
> > > 
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h   |  4 ++++
> > >  .../media/platform/rockchip/rkisp1/rkisp1-resizer.c    | 10 ++++++++--
> > >  2 files changed, 12 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > > b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h index
> > > 34f4fe09c88d..24ad2ccec2a3 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > > @@ -168,6 +168,10 @@
> > >  #define RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO		BIT(9)
> > >  #define RKISP1_CIF_RSZ_SCALER_FACTOR			BIT(16)
> > > 
> > > +#define RKISP1_CIF_RSZ_CTRL_CROP_ENABLE_IMX		BIT(8)
> > > +#define RKISP1_CIF_RSZ_CTRL_CFG_UPD_IMX			BIT(9)
> > > +#define RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO_IMX		BIT(10)
> > > +
> > 
> > Does it make sense to move this kind of information into struct rkisp1_info? 
> > This way you can skip the if (isp_ver == ...) thing.
> 
> Good question. Paul, what do you think ? If it doesn't get moved to the
> structure, I think I'd condition it by the RKISP1_FEATURE_RSZ_CROP
> feature bit instead of a version check, as it seems closely related. I'm
> actually leaning towards the latter.
> 
> > >  /* RSZ_CROP_[XY]_DIR */
> > >  #define RKISP1_CIF_RSZ_CROP_XY_DIR(start, end)		((end) << 16 | (start) << 0)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > > b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c index
> > > 08bf3aa8088f..29a31b18a082 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > > @@ -209,9 +209,15 @@ static void rkisp1_rsz_update_shadow(struct
> > > rkisp1_resizer *rsz, u32 ctrl_cfg = rkisp1_rsz_read(rsz,
> > > RKISP1_CIF_RSZ_CTRL);
> > > 
> > >  	if (when == RKISP1_SHADOW_REGS_ASYNC)
> > > -		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO;
> > > +		if (rsz->rkisp1->info->isp_ver == IMX8MP_V10)
> > > +			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO_IMX;
> > > +		else
> > > +			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO;
> > >  	else
> > > -		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD;
> > > +		if (rsz->rkisp1->info->isp_ver == IMX8MP_V10)
> > > +			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_IMX;
> > > +		else
> > > +			ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD;
> > > 
> > >  	rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CTRL, ctrl_cfg);
> > >  }

-- 
Regards,

Laurent Pinchart
