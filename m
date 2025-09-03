Return-Path: <linux-media+bounces-41684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E151BB42168
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CA521689EB
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303A32FF64B;
	Wed,  3 Sep 2025 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WKXzJ31n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F31E2FFDE6
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905772; cv=none; b=gvyN0U1q3tEIzmkEky6H3RGWHgRU6PnL4s5Y8RUDUrCUVFudmkz+fSziL+yLU4I/uXTSrX9ednGwPsJHIWOjDLp3vpuxjEmfYQTykVU9cifl3zjfCxA3aALBEzX8ulYmh/VLcG8MtDef5lB3tOMftlxnYipKxCOvNkhPW3i2w+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905772; c=relaxed/simple;
	bh=S7NubZttsvs/BIzaOsJNfBGQj0i9tViLlU2TmZXL+ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtEqcIXv4FocwlZdG4KO2zEAbLYuTNeuJER/yE8KmiPewDN4GQfeaqT0/Cqp7fnlfAl4EAhQullZDFrfGPsXCmuc2o6tsfF8UuVPKeyVA9xZcCzwtXrYDv3vxjagiEG6ePTMfXf3Ax+FQgFKeiqZhAhgr0JHukrVKYHH5gfDr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WKXzJ31n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E7A3D928;
	Wed,  3 Sep 2025 15:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756905698;
	bh=S7NubZttsvs/BIzaOsJNfBGQj0i9tViLlU2TmZXL+ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKXzJ31nP2RN5nojUf7f+gdwzyAdCC/ahWIqcTctqZFCWXxV16eEQi8lk/Ry4f2fN
	 sDx3vSTEP5ZgdRvpo9lzz4x+ZJaHOc+hShE9B9UK8Kn4CBYCfL3PAyh8AaEQW4ZWbc
	 oqPOfi5YSt9EQyjmPH3LTTxUVGdTYFEMs3OUFYnQ=
Date: Wed, 3 Sep 2025 15:22:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 03/66] media: Documentation: There are either
 immutable or mutable routes
Message-ID: <20250903132226.GE3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-4-sakari.ailus@linux.intel.com>

On Mon, Aug 25, 2025 at 12:50:04PM +0300, Sakari Ailus wrote:
> Document that each sub-device may have either immutable or mutable routes,
> not both of them.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index f30a98a9cf78..4da67ee0b290 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -594,6 +594,11 @@ and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
>  called on the sub-device. Such newly created routes have the device's default
>  configuration for format and selection rectangles.
>  
> +A sub-device may only have either immutable routes (routes that have
> +``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``) flag set or routes that are all user-created

``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` flag set) or routes that are all user-created

> +or user-removable (routes that do not have ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``
> +flag). This is subject to change in the future.

I'd add

Mixing immutable and non-immutable routes is not allowed.

between the two sentences.

But... that's actually not right. An immutable route is always active.
What we don't allow is combining driver-created "static" routes (as in
routes that can be disabled but can't be removed) and user-created
"dynamic" routes.

> +
>  Configuring streams
>  -------------------
>  

-- 
Regards,

Laurent Pinchart

