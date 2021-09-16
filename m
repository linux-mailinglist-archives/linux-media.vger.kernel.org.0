Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8118E40DB27
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 15:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240034AbhIPNZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 09:25:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240001AbhIPNZo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 09:25:44 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8E122A5;
        Thu, 16 Sep 2021 15:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631798662;
        bh=Fu1G/WPOhBrmTBfQ12HXAPQcyYKkM5vMmmliW1bndvg=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=bF9218Mi/qG57NFF0OBVlbKrjQZ1J9DoixH61WpCJgFzCPoJGTsuPHB3ctGkRwRmg
         S4g7dAE35ByVXGGpla1QQtv814xonKXq7gn8v9QjYMHLVrtxZl44o2BYdSvCRjEr8J
         lkuMwDvRWYPQ0jEnEUQ2ZCGPh352wGFDJ80Sn1cE=
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-4-tomi.valkeinen@ideasonboard.com>
 <20210913114154.ovffxjoghgdud4js@uno.localdomain>
 <0733ae28-bcd9-6dc8-fb6a-0fa43beb1191@ideasonboard.com>
 <20210913133841.nck65h2ft4hfnbg5@uno.localdomain>
 <656577a3-b783-0272-4809-20169b84e891@ideasonboard.com>
 <20210916130752.bsdhq3xpsatdfl4a@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 03/36] media: subdev: add 'which' to subdev state
Message-ID: <a1e81cb9-ea1b-c81c-64d6-e0dd7cf87590@ideasonboard.com>
Date:   Thu, 16 Sep 2021 16:24:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916130752.bsdhq3xpsatdfl4a@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 16/09/2021 16:07, Jacopo Mondi wrote:

> Also note that operations like s_stream do not take a state as
> parameter. The driver has to fetch it from the subdev anyway
> (this in reply to the idea of having the active state as parameter vs
> retrieving it from the subdev if ACTIVE)
> 
> While porting the R-Car drivers on top of this series I found myself
> in the need to (in the s_stream call chain)
> 
> static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> {
> 	const struct v4l2_subdev_state *state = priv->subdev.state;
> 	const struct v4l2_subdev_stream_configs *configs = &state->stream_configs;
> 
>          ...
> 
> 	/*
> 	 * Configure field handling inspecting the formats of the
> 	 * single sink pad streams.
> 	 */
> 	for (i = 0; i < configs->num_configs; ++i) {
> 		const struct v4l2_subdev_stream_config *config = configs->configs;
> 		if (config->pad != RCAR_CSI2_SINK)
> 			continue;
> 
> 		if (config->fmt.field != V4L2_FIELD_ALTERNATE)
> 			continue;
> 
> 		fld |= FLD_DET_SEL(1);
> 		fld |= FLD_FLD_EN(config->stream);
> 
> 		/* PAL vs NTSC. */
> 		if (config->fmt.height == 240)
> 			fld |= FLD_FLD_NUM(0);
> 		else
> 			fld |= FLD_FLD_NUM(1);
> 	}
> 
>          ...
> 
> }
> 
> Am I doing it wrong, or is this a case for the subdev to have to
> directly access sd->state ?

In s_stream path you should:

	state = v4l2_subdev_lock_active_state(sd);

	<do the work with the state>

	v4l2_subdev_unlock_state(state);

If you already have the state, e.g. in set_fmt:

	state = v4l2_subdev_validate_and_lock_state(sd, state);

	<do the work with the state>

	v4l2_subdev_unlock_state(state);

Accessing the stream_configs directly is fine but not that nice. I did 
think about some helpers, perhaps for_each_stream_config(), but I didn't 
add that as I didn't have the need.

There's v4l2_state_get_stream_format() which can be used in many cases, 
but we probably need something else if you need to iterate over all the 
configs.

  Tomi
