Return-Path: <linux-media+bounces-29675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D6A8176C
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634D13AB029
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CA2254867;
	Tue,  8 Apr 2025 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IlTUpTVu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C3D253F23;
	Tue,  8 Apr 2025 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146502; cv=none; b=dM2FbZ2bil6E01Thcvj9tCfEyNUREzFcUAdPP4nbdehynL9iuLBuqrcUHvZZU8iFwtOsgGHb8r6DOoPUSDIVyCTHUPsdZDBk1ZhFufz2ki/xUnCcdxdmmDwU1NRSL97k36Qp0oGCd+2KMguowrnpiwBG3CXIXZdnKd0bVjeQyAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146502; c=relaxed/simple;
	bh=btv7qpy1infRfUdBialPoFlIqUVev+DgGGoAYqlmeoA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ndMzdyBocGL0xBJnQ4l8jurzIEzCutk+pjbETy61LzCCQ/H8uv7ros1GJoiWvZWydih4yQ+mupg8JrGVMEanPKIC9CxFGUyrPS4hgmC//isjOupHp9hU/4roDo6+hVvOT7jFJEfQrIBohGcQrfB6GjdM12zLiIbUlbOT8zfDki8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IlTUpTVu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744146498;
	bh=btv7qpy1infRfUdBialPoFlIqUVev+DgGGoAYqlmeoA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IlTUpTVuDoSHh8D2w8BBHEwqNEthjw8u8veSmEE5tDglQdaxC8deyyDC84l6LTV5K
	 MIyLlFJn8iMsLrDc4SbEPwO0wdetGq10/OCMXH2RdISAEZL0TnNihDvTHFpK9o92Nk
	 5U9OYg6mE5ROd6aSczX1fx0NePLlG0Ui5jSmTv2r1W7PnL0YzExT2ACE0SnCmwaZ8X
	 wG57b4tguLmc0piw0nAqPUMlMMG4yrCpWLnRdygjnMCdjfvAeRL6tjJr//aE25X/Sg
	 0y4lqvrzteQGXlxXgNZqJoe6fbmZ116euundZtaq50/KHorTFNLl+ZCiu4+Q9afkJS
	 GQDq7NOGwGH8Q==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A01F517E0EB8;
	Tue,  8 Apr 2025 23:08:14 +0200 (CEST)
Message-ID: <fd471fe44a57e1b0c74505f2a7122b62241809d5.camel@collabora.com>
Subject: Re: [PATCH v4 1/6] media: v4l2: Add NV15 and NV20 pixel formats
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Diederik de Haas <didi.debian@cknow.org>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Jonas Karlman	 <jonas@kwiboo.se>, Sebastian
 Reichel <sebastian.reichel@collabora.com>,  Niklas Cassel
 <cassel@kernel.org>, Alexey Charkov <alchark@gmail.com>, Dragan Simic
 <dsimic@manjaro.org>,  Jianfeng Liu <liujianfeng1994@gmail.com>, Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>, Naushir Patuck	 <naush@raspberrypi.com>,
 Jean-Michel Hautbois	 <jeanmichel.hautbois@ideasonboard.com>, Dmitry
 Perchanov	 <dmitry.perchanov@intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-staging@lists.linux.dev,
 kernel@collabora.com, 	linux-kernel@vger.kernel.org
Date: Tue, 08 Apr 2025 17:08:13 -0400
In-Reply-To: <D8SA0W2ZEAQ3.3BO4NMONFJCRC@cknow.org>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
	 <20250325213303.826925-2-detlev.casanova@collabora.com>
	 <D8SA0W2ZEAQ3.3BO4NMONFJCRC@cknow.org>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le samedi 29 mars 2025 à 00:09 +0100, Diederik de Haas a écrit :
> Hi Detlev,
> 
> On Tue Mar 25, 2025 at 10:22 PM CET, Detlev Casanova wrote:
> > From: Jonas Karlman <jonas@kwiboo.se>
> > 
> > Add NV15 and NV20 pixel formats used by the Rockchip Video Decoder for
> > 10-bit buffers.
> > 
> > NV15 and NV20 is 10-bit 4:2:0/4:2:2 semi-planar YUV formats similar to
> > NV12 and NV16, using 10-bit components with no padding between each
> > component. Instead, a group of 4 luminance/chrominance samples are
> > stored over 5 bytes in little endian order:
> > 
> > YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes
> > 
> > The '15' and '20' suffix refers to the optimum effective bits per pixel
> > which is achieved when the total number of luminance samples is a
> > multiple of 8 for NV15 and 4 for NV20.
> > 
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> > ---
> >  .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-common.c         |   2 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
> >  include/uapi/linux/videodev2.h                |   2 +
> >  4 files changed, 134 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > index b788f69338554..22cad8c9726bf 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > @@ -79,6 +79,13 @@ All components are stored with the same number of bits per component.
> >        - Cr, Cb
> >        - Yes
> >        - Linear
> > +    * - V4L2_PIX_FMT_NV15
> > +      - 'NV15'
> > +      - 10
> > +      - 4:2:0
> > +      - Cb, Cr
> > +      - Yes
> > +      - Linear
> 
> In your cover letter you mentioned:
> Imported improvements from [1]
> [1]: https://lore.kernel.org/linux-media/20250225-rkvdec_h264_high10_and_422_support-v7-2-7992a68a4910@collabora.com/
> 
> The changelog of "media: rkvdec: Add H.264 High 10 and 4:2:2 profile
> support" v7 had this:
> - Move V4L2_PIX_FMT_NV15/V4L2_PIX_FMT_NV20 documentation as suggested
> 
> Following a comment on v6 of that series.
> 
> But it seems these blocks are now placed at the location as it was in
> the v6 series, thus NOT importing its improvements?

The other series have been partially accepted into media-commiters next
branch, including this patch. Meaning you can simply remove that patch
in your next submission.

regards,
Nicolas

> 
> >      * - V4L2_PIX_FMT_NV12M
> >        - 'NM12'
> >        - 8
> > @@ -172,6 +179,13 @@ All components are stored with the same number of bits per component.
> >        - Cr, Cb
> >        - Yes
> >        - Linear
> > +    * - V4L2_PIX_FMT_NV20
> > +      - 'NV20'
> > +      - 10
> > +      - 4:2:2
> > +      - Cb, Cr
> > +      - Yes
> > +      - Linear
> >      * - V4L2_PIX_FMT_NV16M
> >        - 'NM16'
> >        - 8
> 
> The same thing seemed to have happened here?
> 
> Cheers,
>   Diederik
> 
> > @@ -302,6 +316,57 @@ of the luma plane.
> >        - Cr\ :sub:`11`
> >  
> >  
> > +.. _V4L2-PIX-FMT-NV15:
> > +
> > +NV15
> > +----
> > +
> > +Semi-planar 10-bit YUV 4:2:0 format similar to NV12, using 10-bit components
> > +with no padding between each component. A group of 4 components are stored over
> > +5 bytes in little endian order.
> > +
> > +.. flat-table:: Sample 4x4 NV15 Image (1 byte per cell)
> > +    :header-rows:  0
> > +    :stub-columns: 0

-- 
Nicolas Dufresne
Principal Engineer at Collabora

