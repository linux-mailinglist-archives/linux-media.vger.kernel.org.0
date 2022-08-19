Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA5B599317
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 04:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242705AbiHSCik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 22:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiHSCii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 22:38:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9ED11141;
        Thu, 18 Aug 2022 19:38:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 483CA3F1;
        Fri, 19 Aug 2022 04:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660876711;
        bh=bI/FyPcyEjkwd94dRpjq01q1V8C/fYllucggGtxNMr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zsj8VC1/gI1lrIi2R7DBgOswIa2JuaK8oaY368lngjW7bg9qnXqwijZiwjzBfHOSE
         OoJ9Cz4EoylRcFgEzvt+6dI+o+oE82l/bYP5WkbPniYKzvJYYyCHrd2oKdmY+e8VRY
         1a8Z9lpug/d2H2MpnpIprBidDdPDygiAKM3RF1vg=
Date:   Fri, 19 Aug 2022 05:38:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     mchehab@kernel.org
Cc:     Takanari Hayama <taki@igel.co.jp>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Subject: Re: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
Message-ID: <Yv73pNxr62j+hYd5@pendragon.ideasonboard.com>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-2-taki@igel.co.jp>
 <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro, would you be fine with this patch going through the DRM tree for
v6.1 ? I don't foresee any risk of conflict with other changes to the
VSP driver scheduled for the next kernel version. If that's fine with
you, could you give an Acked-by ? Otherwise I can send you a pull
request to create an immutable branch and base the rest on it in my pull
request for DRM, but given how small this change is, it seems a bit
overkill.

On Fri, Aug 19, 2022 at 05:01:10AM +0300, Laurent Pinchart wrote:
> Hi Hayama-san,
> 
> Thank you for the patch.
> 
> On Wed, Aug 10, 2022 at 05:37:09PM +0900, Takanari Hayama wrote:
> > To support DRM blend mode in R-Car DU driver, we must be able to pass
> > a plane with the premultiplied alpha. Adding a new property to
> > vsp1_du_atomic_config allows the R-Car DU driver to pass the
> > premultiplied alpha plane.
> > 
> > Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
> >  include/media/vsp1.h                           | 2 ++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > index 0c2507dc03d6..019e18976bd8 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > @@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
> >  	rpf->mem.addr[1] = cfg->mem[1];
> >  	rpf->mem.addr[2] = cfg->mem[2];
> >  
> > +	rpf->format.flags = (cfg->premult) ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
> 
> I'll drop the parentheses when applying.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> >  	vsp1->drm->inputs[rpf_index].crop = cfg->src;
> >  	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
> >  	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
> > diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> > index cc1b0d42ce95..48f4a5023d81 100644
> > --- a/include/media/vsp1.h
> > +++ b/include/media/vsp1.h
> > @@ -51,6 +51,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> >   * @dst: destination rectangle on the display (integer coordinates)
> >   * @alpha: alpha value (0: fully transparent, 255: fully opaque)
> >   * @zpos: Z position of the plane (from 0 to number of planes minus 1)
> > + * @premult: true for premultiplied alpha
> >   */
> >  struct vsp1_du_atomic_config {
> >  	u32 pixelformat;
> > @@ -60,6 +61,7 @@ struct vsp1_du_atomic_config {
> >  	struct v4l2_rect dst;
> >  	unsigned int alpha;
> >  	unsigned int zpos;
> > +	bool premult;
> >  };
> >  
> >  /**

-- 
Regards,

Laurent Pinchart
