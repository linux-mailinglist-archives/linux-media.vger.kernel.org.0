Return-Path: <linux-media+bounces-41442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20196B3E6DF
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 16:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FA8118958BC
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815072F1FD6;
	Mon,  1 Sep 2025 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ci9vCIiQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FD18991E
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756736524; cv=none; b=WaS3j999Z/SSje/tdifaRepb4oX9dWHn27Y++Ubfiv6TvhhuYNXfIhjm2/erJ7AllHRDr5mFCNHqt9nUazxcO3E745b6MA3GmyMib6nR3MI+r+2dSfzFtq/HLg9PeEjLDyKx6t8tUZwwVyMsM9igU3M1OZkxyHcouy/k1aPk/ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756736524; c=relaxed/simple;
	bh=n4D/QAOyQNSpW5dS02G1KPFWKnmxpjtk3ZeLd6S65iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN/H5byHA5Qr0390QlH4AmrOQL+DuZ0oxiB6HoeECLr8JoG0daQqKosOqVQUfJTTzz7JU0wr/TBkZrfGW3XjHsDbDwA0eTWP17XtWRaRrIhNByEpKt7fPxh6z8iaRFu635Kfbl4bna+bLDcNS0qU2Tb7LuoO/N5y/Vf0ap+6D0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ci9vCIiQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC585EAE;
	Mon,  1 Sep 2025 16:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756736451;
	bh=n4D/QAOyQNSpW5dS02G1KPFWKnmxpjtk3ZeLd6S65iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ci9vCIiQKWS2OKoxts4rrZe2Bt/7b7HfNYbI4lcHL1Y7HfR+96NmRAe4vDhjOIFfZ
	 +X24unnonkfX5qswUlJNSTElpilApJ0kHmcCTa844PQ+6PV0ovC7r4xHLEHbp+ICS4
	 7MFgDCUkmW7n3ESl91nnnqLl16neIt2KMZkEFzV0=
Date: Mon, 1 Sep 2025 16:21:53 +0200
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
Subject: Re: [PATCH v11 20/66] media: Documentation: Reference COLOR_PATTERN
 control in raw format docs
Message-ID: <ndc5gt6jyla5hoelwwk4wyy3rqb3ntbppjzsh7hpgevcd36ewo@d5n6nr2jxgck>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-21-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-21-sakari.ailus@linux.intel.com>

On Mon, Aug 25, 2025 at 12:50:21PM +0300, Sakari Ailus wrote:
> Add a reference to the V4L2_CID_COLOR_PATTERN control in the generic raw
> pixelformat documentation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
>  Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index b19aaaffbce0..0fcd60d8c621 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -93,6 +93,8 @@ Image Source Control IDs
>      is reported as being (say) 128, then a value of 192 would represent
>      a gain of exactly 1.5.
>
> +.. _image-source-control-color-pattern:
> +
>  ``V4L2_CID_COLOR_PATTERN (integer)``
>      This control determines the color components and native pixel order in the
>      sensor's CFA (Color Filter Array) when used in conjunction with
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index e77b4ad19737..77571adeb21e 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3444,6 +3444,9 @@ camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
>  interfaces. The packing of the data on the bus is determined by the hardware,
>  however the bit depth is still specific to the format.
>
> +The colour components and the native pixel order are determined by the

Isn't
  +The native colour components ordering are determined by ...

As I don't see how "colour components and the native pixel order"
information can be conveyed separately.

Up to you

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> +:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control.
> +
>  .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
>
>  .. cssclass:: longtable
> --
> 2.47.2
>
>

