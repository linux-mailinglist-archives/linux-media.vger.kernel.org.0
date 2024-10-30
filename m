Return-Path: <linux-media+bounces-20607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7FA9B6CF2
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 20:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3820F28252F
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 19:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0531CFED1;
	Wed, 30 Oct 2024 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ifRVA7sq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E71C3F06;
	Wed, 30 Oct 2024 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317211; cv=none; b=NAgb0iVzRM/H/XMxM8m5oiuyR9jwqbFtXrjmRNmssGt8xAqo+7eVjFL+TQOWEUhocxg2rtVK8xs+gIG/t2E1Rc9fUF3pjfBw7IAkE73FNRHRA5beLZAY7MRh75LDnlUExyNq5HrpLD5l4AqiBwFndOaqIfcsmddHFchAfsVHb/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317211; c=relaxed/simple;
	bh=wf8CVMszdvTiLYCMwk9QlqN4MhxMDA38RZP9HJEWrtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8FCwd6ZyoRPfbTWWgmjz67JgVRj1o8+rTuxAztUpBDFq0jPOgjQM+YLGxoqddWrym28b+6b42/PFVjAENy1Uu1+cePzPbjP7mL5HING3Yl2FeE6rQDN1OvjUH6AVIFpEfQM2f9SQQ6S+/TgraGgs5m/EptZsdApBSjIJhZgjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ifRVA7sq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD0441083;
	Wed, 30 Oct 2024 20:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730317204;
	bh=wf8CVMszdvTiLYCMwk9QlqN4MhxMDA38RZP9HJEWrtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifRVA7sqUuaxsjnQ9Gw5mDhoxUFRwlpB6GCeoAZ5YA7PmRNg/m1BZ71/vvf7+CNIY
	 l7XCDHZ8QwB5eiL20LOg9HcszPP62M9sTjm0vDluA4Z/nSX9Ydgb734l5ylhbwNTCt
	 dr7FLun8kosYcUG+JPBSsXJ2I+1sqhEAMTNww9D4=
Date: Wed, 30 Oct 2024 21:40:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: sakari.ailus@linux.intel.com, Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sebastian Reichel <sre@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: imx415: Drop HAS_EVENTS flag
Message-ID: <20241030194001.GD920@pendragon.ideasonboard.com>
References: <20241029225632.3019083-1-tomm.merciai@gmail.com>
 <20241029225632.3019083-3-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029225632.3019083-3-tomm.merciai@gmail.com>

On Tue, Oct 29, 2024 at 11:56:31PM +0100, Tommaso Merciai wrote:
> v4l2_subdev_init_finalize() already sets the HAS_EVENTS flag if a
> control handler is set. Let's drop the HAS_EVENTS flag.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx415.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index a20b0db330d3..3f7924aa1bd3 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1113,8 +1113,7 @@ static int imx415_subdev_init(struct imx415 *sensor)
>  	if (ret)
>  		return ret;
>  
> -	sensor->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> -				V4L2_SUBDEV_FL_HAS_EVENTS;
> +	sensor->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	sensor->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&sensor->subdev.entity, 1, &sensor->pad);

-- 
Regards,

Laurent Pinchart

