Return-Path: <linux-media+bounces-3481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E1882A11C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 20:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73DFCB22296
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 19:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220354E1BF;
	Wed, 10 Jan 2024 19:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iwonAFm5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CDC22063;
	Wed, 10 Jan 2024 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08D433DFA;
	Wed, 10 Jan 2024 20:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704915460;
	bh=zHQis5xP8OgIGCs3kY8BouPwXp7i9V/rpOTbYi87Dt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwonAFm5HQi0o+Au9y/q+DfG+zSyytUBy6pmUaq3Sl78QhwsRPPKKldiddGuntkZe
	 RMO4DfamtJuMOiH3PcUfp6fQmR+13IAYxHl/isR8NsnV8+Hi9s9bfiHP2BGhTPO/Z/
	 WjdtwmUpQ+rf1psExbd//T/q5p+aEZbWzULLZjPc=
Date: Wed, 10 Jan 2024 21:38:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <20240110193852.GF23633@pendragon.ideasonboard.com>
References: <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <g4uqcavglw2md4ojiw7yxequy37ttozjazr3b4ypqzznlrsinv@zm6mvzaempwp>
 <TYCPR01MB11269BCE6CAEE3C5063C4D1728693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269726F051D0F497597F28A86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269726F051D0F497597F28A86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>

Hi Biju,

On Thu, Jan 04, 2024 at 02:17:39PM +0000, Biju Das wrote:
> On Friday, December 15, 2023 2:56 PM, Biju Das wrote:
> > On Friday, December 15, 2023 2:18 PM, Maxime Ripard wrote:
> > > On Fri, Dec 15, 2023 at 01:52:28PM +0000, Biju Das wrote:
> > > > > > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc) {
> > > > > > > > > > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > > > > > > > > > +
> > > > > > > > > > +	rcrtc->vblank_enable = true;
> > > > > > > > > > +
> > > > > > > > > > +	return 0;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc)
> > > > > > > > > > +{
> > > > > > > > > > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > > > > > > > > > +
> > > > > > > > > > +	rcrtc->vblank_enable = false; }
> > > > > > > > >
> > > > > > > > > You should enable / disable your interrupts here
> > > > > > > >
> > > > > > > > We don't have dedicated vblank IRQ for enabling/disabling vblank.
> > > > > > > >
> > > > > > > > vblank is handled by vspd.
> > > > > > > >
> > > > > > > > vspd is directly rendering images to display,
> > > > > > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > > > > > called in vspd's pageflip context.
> > > > > > > >
> > > > > > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > > > > > >
> > > > > > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > > > > > reporting is going to work. Could you explain it a bit more?
> > > > > >
> > > > > > We just need to handle vertical blanking in the VSP frame end handler.
> > > > > > See the code below.
> > > > > >
> > > > > > static void rzg2l_du_vsp_complete(void *private, unsigned int status,
> > > > > > u32 crc) {
> > > > > > 	struct rzg2l_du_crtc *crtc = private;
> > > > > >
> > > > > > 	if (crtc->vblank_enable)
> > > > > > 		drm_crtc_handle_vblank(&crtc->crtc);
> > > > > >
> > > > > > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > > > > > 		rzg2l_du_crtc_finish_page_flip(crtc);
> > > > > >
> > > > > > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
> > > > >
> > > > > Then we're back to the same question :)
> > > > >
> > > > > Why can't you mask the frame end interrupt?
> > > >
> > > > We are masking interrupts.
> > > >
> > > > [   70.639139] #######rzg2l_du_crtc_disable_vblank#######
> > > > [   70.650243] #########rzg2l_du_vsp_disable ############
> > > > [   70.652003] ########## vsp1_wpf_stop###
> > > >
> > > > Unmask is,
> > > >
> > > > [ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
> > > > [ 176.354922] #########rzg2l_du_vsp_atomic_flush ############
> > > > [ 176.355198] ########## wpf_configure_stream###
> > >
> > > Sorry, my question was why aren't you unmasking and masking them in
> > > the enable/disable_vblank hooks of the CRTC.
> > 
> > I have n't tried that. Will try and provide feedback.
> > 
> > Currently the IRQ source belongs to VSPD in media subsystem.
> > So I need to export an API though vsp1_drm and test it.
> 
> + linux-media
> 
> Laurent, are you ok with the below RZ/G2L specific patch[1] for
> enabling/disabling frame end interrupt in VSP driver?
> Note:
> I need to add a quirk for handling this only for RZ/G2L family as
> other SoCs have Vblank specific interrupt available in DU.

The DU driver on Gen3 handles vblank exactly as in your patch. What's
the problem with that ?

> [1]
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 9b087bd8df7d..39347c16bb27 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -936,6 +936,14 @@ void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt)
>  }
>  EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
>  
> +void vsp1_du_mask_frame_end_interrupt(struct device *dev, bool mask)
> +{
> +       struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +
> +       vsp1_write(vsp1, VI6_WPF_IRQ_ENB(0), mask ? 0 : VI6_WPF_IRQ_ENB_DFEE);

That will break everything. As soon as you turn of vblank reporting, the
VSP will stop processing frames and the display will freeze.

> +}
> +EXPORT_SYMBOL_GPL(vsp1_du_mask_frame_end_interrupt);
> +
>  /* -----------------------------------------------------------------------------
>   * Initialization
>   */
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index 48f4a5023d81..ccac48a6bdd2 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -117,4 +117,6 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
>  int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
>  void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
>  
> +void vsp1_du_mask_frame_end_interrupt(struct device *dev, bool mask);
> +
>  #endif /* __MEDIA_VSP1_H__ */

-- 
Regards,

Laurent Pinchart

