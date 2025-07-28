Return-Path: <linux-media+bounces-38580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD657B13DD6
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D76C3A7F1C
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75DF26D4E9;
	Mon, 28 Jul 2025 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZiQqSpoF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C39033E7
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753715114; cv=none; b=LjC7rAKgB3NWQjc4uJssixqv51haFkvmXV6x2iMzGnkKTm4Cwg9R42n0OW0EhePfurV0poSbf/ra8NlZqD2zAd+sc1BmNpt6ibiwnBlmc8ji6kLV0A+qOiWBo61+vfogAA+FmMgQ6jIQPI2ZL145EC21/CtpCvxCu4V+ICLkXXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753715114; c=relaxed/simple;
	bh=k/fJSh+YEF5G5J6rIds4Y0GyQQ4SCXQTEqG97L4wbDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdB/h5PxEhubQJibQOp/gnAbgdGckRqce3rBYtsAd9L9api96WGfPV1+AnRAdHYVjsfHBGfYeAE7Qm26Jxsu+7/1PmVWw2OzzE7asgtV93sp4AfFfKUuJ/qbgOg9rrTAlYzJ3WH60/QMmwfR+Mwhe74G3Akmvsui1y+2LnLiKhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZiQqSpoF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-29.net.vodafone.it [5.90.139.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB3703A4;
	Mon, 28 Jul 2025 17:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753715066;
	bh=k/fJSh+YEF5G5J6rIds4Y0GyQQ4SCXQTEqG97L4wbDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZiQqSpoFFtXacdzFCEfRUKtQIuQDT4iNMRXzvwfORhBVtbpscTkd5JazdgX1rW+Ad
	 CjUeU1iyVIDU85zqAGWDc+IV9gDRd9J3D2E5Fr7FTHyDokUaMWRLT0yKUqoXZNUGA9
	 evyKl+Z0JHUPPHFfqSX6ALWiA95SOkk0wuVIE52Q=
Date: Mon, 28 Jul 2025 17:05:04 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 41/64] media: Documentation: Add scaling and
 post-scaler crop for common raw
Message-ID: <oko2j24mj4wqdfleal2weip6al4i37cuzram2eqgm2btsrfbr7@chr5vv3gl2xa>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-42-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-42-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:58:13PM +0300, Sakari Ailus wrote:
> Document scaling and post-scaler digital crop operations for the common
> raw sensor model.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

But I think this patch could be squashed with the previous one!

> ---
>  .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> index 1e6c58931ea0..c1b9b74cbcef 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -139,11 +139,18 @@ sub-sampling to achieve the desired size.
>
>  The digital crop operation takes place after binning and sub-sampling. It is
>  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> -0/0. The resulting image size is further output by the sensor.
> +0/0.
> +
> +The scaling operation is performed after the digital crop. It is configured by
> +setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
> +relative to the digital crop.
>
>  The sensor's output mbus code is configured by setting the format on the (pad,
> -stream) pair 0/0. When setting the format, always use the same width and height
> -as for the digital crop setting.
> +stream) pair 0/0. The width and height fields are used to configure post-scaler
> +digital crop if supported by the driver, affecting the right and bottom edges of
> +the frame. If post-scaler digital crop is not supported, the width and height
> +fields of the format will match the compose rectangle sizes applied on the same
> +0/0 (pad, stream) pair.
>
>  Drivers may only support some or even none of these configurations, in which
>  case they do not expose the corresponding selection rectangles. If any selection
> @@ -201,12 +208,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
>        - X
>        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
>          rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - ``V4L2_SEL_TGT_COMPOSE``
> +      - \-
> +      - X
> +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> +        rectangle on (pad, stream) pair 0/0.
>      * - 0/0
>        - Format
>        - X
>        - X
> -      - Image data source format. Always assign the width and height fields of
> -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> +      - Image data source format and post-scaler crop. The width and height
> +        fields of the format, used to configure post-scaler crop on the right
> +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
>          rectangle on (pad, stream) pair 0/0. The media bus code reflects the
>          pixel data output of the sensor.
>      * - 0/1
> --
> 2.39.5
>
>

