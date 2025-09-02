Return-Path: <linux-media+bounces-41587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4614B40215
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD1E3A6263
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D062D9EE7;
	Tue,  2 Sep 2025 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y0zrNrkA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C0D2D6E4C
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818371; cv=none; b=sjjt+iBfS9zGa+ymmPnSVol6UGJxD/SzcadVQjH7zTQrrkheUSI3UbV4Ty0ESTGa8oHhA+LrGqxwhMyt2uCGODPDhMtUazYRvwufG2a5lj4GSkS5QyKxrlURK4x0TyiaMvCete+IZy+SFVz0p68EpCIBqqfS53ej80PzxCmFpi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818371; c=relaxed/simple;
	bh=7rmFsVB9UwHBKNcb1Q05cTxQ3qHQ6PVwRvx6GgAI83o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJBpkLkk2i9su2HxCSgGuV/ThBAliNzpgconqGWAWsu50eDRuuSE4VJCtZKX/5IXt/lRqTYQOtrELKH2i0rLPDyjdOYDuNVFf1TJQspqyDAB7VeKXjeJF1AH7cWKHd1GiPErJoGwBIydeeHH4v3pWdHEU9aTK9Yn6IDT3yBAHoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y0zrNrkA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-160.net.vodafone.it [5.90.50.160])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A95C3C71;
	Tue,  2 Sep 2025 15:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756818299;
	bh=7rmFsVB9UwHBKNcb1Q05cTxQ3qHQ6PVwRvx6GgAI83o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0zrNrkA8MOKuY6Ei1OmtrDC/XYUftb27i84+8dlUKLTWkCNH0i9e3r0fP1+w9JdC
	 C48BMijATfNiLxRh7bdwINmJ4bzqQBT1i4GPsStzzJMgpUvS6rz39ol3JJ9340A9y8
	 6bN/MMXVYkvBzmjY/yJKCDoHHZdCf66F6DFe0+zs=
Date: Tue, 2 Sep 2025 15:06:03 +0200
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
Subject: Re: [PATCH v11 22/66] media: Documentation: Reference flipping
 controls in raw format docs
Message-ID: <qevrumxjwkckovjdhih3kkwcuatm6kmkcnd6w7taypx3osqthp@etibb5ud4ap5>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-23-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-23-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:23PM +0300, Sakari Ailus wrote:
> Add a reference to the flipping related controls (V4L2_CID_HFLIP,
> V4L2_CID_VFLIP and V4L2_CID_COLOR_PATTERN_FLIP) to the generic raw format
> documentation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
>  Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index ef3784d1119a..3cb7ee1b0aed 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -134,6 +134,8 @@ Image Source Control IDs
>          red, green pixels.
>        - 3
>
> +.. _image-source-control-color-pattern-flip:
> +
>  ``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
>      Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
>      V4L2_CID_VFLIP) have an effect on the pixel order of the output color
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 77571adeb21e..c36cd42b09c6 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3446,6 +3446,9 @@ however the bit depth is still specific to the format.
>
>  The colour components and the native pixel order are determined by the
>  :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control.
> +Whether or not flipping controls (``V4L2_CID_HFLIP`` and ``V4L2_CID_VFLIP``)
> +affect the pattern is conveyed via the :ref:`V4L2_CID_COLOR_PATTERN_FLIP
> +<image-source-control-color-pattern-flip>` control.
>
>  .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
>
> --
> 2.47.2
>
>

