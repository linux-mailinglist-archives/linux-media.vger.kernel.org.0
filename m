Return-Path: <linux-media+bounces-38586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0EB13EB1
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74E464E1CAC
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCBE273D9F;
	Mon, 28 Jul 2025 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wHYtTY3c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F426FA69
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753716845; cv=none; b=sbab+jNnQs1H89BLelG+FYQBDzgujAfHNpjlQfp8RBMykc9Ro/dSM3FjbGwpJsHUyIWtR4UwSFtCW3bAMCINVD0VVyenZQSvWP1IO1cPxjftknuSSN7/BiBfwUp2zfdAhddw/3rh/XTRY4b4OF/vuu8wVuxE4jMU4FWtWhYVj1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753716845; c=relaxed/simple;
	bh=5apRIg3h7P0GW5qyXMttkf1BjSqybuuFqcm5F10PhMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWPhIl5gLOl9MP1L2W2voHukkqo1GR/qdeROCIoBX2ngAvoam2hT1OEiW9uMD9nQ04azuOLY1BG7hvST/WnKjbNflu7VbvEdfZncbU7u233dYi6fyYssxwnbi/6BvCSu+t18JsojL2XS6Fj8nyT4cfKZDM7ktGbL6mBe27LnqYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wHYtTY3c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-29.net.vodafone.it [5.90.139.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 906FD42B;
	Mon, 28 Jul 2025 17:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753716798;
	bh=5apRIg3h7P0GW5qyXMttkf1BjSqybuuFqcm5F10PhMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wHYtTY3ceIRSGctDE0knxB0TPs4PEHSR/tOxH3X/Uu7L9gVwVL1BQp2AaZvzg+yWe
	 vBOtTzZgQjfcQduuZvANON/WtJTnMKxzEuZlASkqf80AuM+Lmmmhz4Ox0gzvjIn7H3
	 +G6qEqOLXFS/xtyqCE7xNEAjxQDFsxhShku8Dk/Q=
Date: Mon, 28 Jul 2025 17:33:57 +0200
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
Subject: Re: [PATCH v10 45/64] media: Documentation: Add binning and
 sub-sampling controls
Message-ID: <3h2uiwbzg65djyy22p2yi3s72wdfssnddblyzphfsnfhrczzp5@przqnnisxl32>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-46-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-46-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:58:17PM +0300, Sakari Ailus wrote:
> Document the binning and scaling controls (V4L2_CID_BINNING and
> V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
> model.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> index ee59bf3c5761..c1c9c9b8bc14 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -134,8 +134,12 @@ separately horizontally and vertically.
>
>  Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
>  rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
> -1/0. The driver implementation determines how to configure binning and
> -sub-sampling to achieve the desired size.
> +1/0. It depends on the driver which of these operations are being used to
> +achieve the resulting size. Binning and sub-sampling are also directly
> +configured using :ref:`V4L2_CID_BINNING_FACTORS
> +<v4l2-cid-camera-sensor-binning>` and :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>` controls on
> +drivers that support them.

This is a big vague, as it allows drivers to ignore the two newly
introduced controls.

I understand existing drivers cannot all be moved to use them, but new
drivers complying with the V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR should
probably implement the full model, including the controls.

What do you think ?

>
>  The digital crop operation takes place after binning and sub-sampling. It is
>  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> @@ -194,9 +198,15 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
>        - \-
>        - X
>        - Binning and sub-sampling. This rectangle is relative to the
> -        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> -        combination of binning and sub-sampling is configured using this
> -        selection target.
> +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binning is
> +        configured using the :ref:`V4L2_CID_BINNING_FACTORS
> +        <v4l2-cid-camera-sensor-binning>` control and sub-sampling is configured
> +        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> +        V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`
> +        controls on drivers that support these controls. To configure binning
> +        and sub-sampling on drivers that do not support these controls, the
> +        selection rectangle may be changed directly to configure the combined
> +        effect on the image size.
>      * - 2/0
>        - Format
>        - X
> --
> 2.39.5
>
>

