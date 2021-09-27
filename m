Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8241B418D56
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 02:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbhI0Atx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 20:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhI0Atw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 20:49:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C12C061575
        for <linux-media@vger.kernel.org>; Sun, 26 Sep 2021 17:48:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A14E149A;
        Mon, 27 Sep 2021 02:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632703691;
        bh=Lyy/geQP5ZUeZ9k4Yj55Q/jhKi/M4VPx7CKTkLJDtj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O9XYNSdod9MDNdt+p6oe1cn9qh64U1CKLZx3MdRaRcY/3OTVSPN0yo5EHrUV9z7NQ
         4u6JAaqoDZYWzfXPj9caCa9CrB6lDLRL+b6e4gTcaHcF+imQFod2DwBx9LU9eURZYV
         0x/AjQAnYsQb9EKZqISrNLq8SWFyE9pl0vOH258I=
Date:   Mon, 27 Sep 2021 03:48:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 03/36] media: subdev: add 'which' to subdev state
Message-ID: <YVEUxunGwevzoy5f@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-4-tomi.valkeinen@ideasonboard.com>
 <20210913114154.ovffxjoghgdud4js@uno.localdomain>
 <0733ae28-bcd9-6dc8-fb6a-0fa43beb1191@ideasonboard.com>
 <20210913133841.nck65h2ft4hfnbg5@uno.localdomain>
 <656577a3-b783-0272-4809-20169b84e891@ideasonboard.com>
 <20210916130752.bsdhq3xpsatdfl4a@uno.localdomain>
 <a1e81cb9-ea1b-c81c-64d6-e0dd7cf87590@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a1e81cb9-ea1b-c81c-64d6-e0dd7cf87590@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Sep 16, 2021 at 04:24:19PM +0300, Tomi Valkeinen wrote:
> On 16/09/2021 16:07, Jacopo Mondi wrote:
> 
> > Also note that operations like s_stream do not take a state as
> > parameter. The driver has to fetch it from the subdev anyway
> > (this in reply to the idea of having the active state as parameter vs
> > retrieving it from the subdev if ACTIVE)
> > 
> > While porting the R-Car drivers on top of this series I found myself
> > in the need to (in the s_stream call chain)
> > 
> > static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> > {
> > 	const struct v4l2_subdev_state *state = priv->subdev.state;
> > 	const struct v4l2_subdev_stream_configs *configs = &state->stream_configs;
> > 
> >          ...
> > 
> > 	/*
> > 	 * Configure field handling inspecting the formats of the
> > 	 * single sink pad streams.
> > 	 */
> > 	for (i = 0; i < configs->num_configs; ++i) {
> > 		const struct v4l2_subdev_stream_config *config = configs->configs;
> > 		if (config->pad != RCAR_CSI2_SINK)
> > 			continue;
> > 
> > 		if (config->fmt.field != V4L2_FIELD_ALTERNATE)
> > 			continue;
> > 
> > 		fld |= FLD_DET_SEL(1);
> > 		fld |= FLD_FLD_EN(config->stream);
> > 
> > 		/* PAL vs NTSC. */
> > 		if (config->fmt.height == 240)
> > 			fld |= FLD_FLD_NUM(0);
> > 		else
> > 			fld |= FLD_FLD_NUM(1);
> > 	}
> > 
> >          ...
> > 
> > }
> > 
> > Am I doing it wrong, or is this a case for the subdev to have to
> > directly access sd->state ?
> 
> In s_stream path you should:
> 
> 	state = v4l2_subdev_lock_active_state(sd);
> 
> 	<do the work with the state>
> 
> 	v4l2_subdev_unlock_state(state);
> 
> If you already have the state, e.g. in set_fmt:
> 
> 	state = v4l2_subdev_validate_and_lock_state(sd, state);
> 
> 	<do the work with the state>
> 
> 	v4l2_subdev_unlock_state(state);
> 
> Accessing the stream_configs directly is fine but not that nice. I did 
> think about some helpers, perhaps for_each_stream_config(), but I didn't 
> add that as I didn't have the need.
> 
> There's v4l2_state_get_stream_format() which can be used in many cases, 
> but we probably need something else if you need to iterate over all the 
> configs.

I really like forcing drivers to call functions that will lock the
state, at least until we can move the locks to the core (if ever). We
should move the fields of v4l2_subdev that drivers are not supposed to
access directly under a big PRIVATE comment.

-- 
Regards,

Laurent Pinchart
