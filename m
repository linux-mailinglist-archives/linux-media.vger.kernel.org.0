Return-Path: <linux-media+bounces-26876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D9A42F50
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 22:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACD82174FCE
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 21:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3FF1DF993;
	Mon, 24 Feb 2025 21:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ex9pL1tb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9231C8630;
	Mon, 24 Feb 2025 21:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740433267; cv=none; b=JWHc5Cmg1BViFGpHD9E8arjVY5pqBnHl1ZU6oYWfE/pNuq1eWyJahov/zpH37R5TO7+r04AFu3HxEaY4Vhwx1O/pDuDtR3BCKxDyC/Ir7oo4RXjI+sUCuGyBAoDM9GnjmOWHh460QjTcT0vK8qRRkG/zgObwGQURhJdDEJmx/Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740433267; c=relaxed/simple;
	bh=Q+CujMAdg3JdeG0AwSNgh4CB8wuFVGWqju3Cnisvqoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXetAkOt75cffr8nhAe39TOAkW0HXF4PlkWQrp4j/7tb+oSFV4+y6dvv96Tj6vmEx3EyHKkwqUq49jFs5EeKAHDhItiZ0RHr45W3CkUiUrbFMhwjHu5FOnr/9b6x6LheNe3RoW2kSGfyZyaZ+fNoLPlXxi3NG/khDIH2F7Y2P/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ex9pL1tb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 642C2220;
	Mon, 24 Feb 2025 22:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740433177;
	bh=Q+CujMAdg3JdeG0AwSNgh4CB8wuFVGWqju3Cnisvqoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ex9pL1tbcP/9cY083eTsnpcO0wzf98asX+w+AW8acupb/SVwqRCSGxLbmDFZ/xewl
	 f/Jh2aA+64s6hv8ndxkexpeyr+m8Mx2ZuurdIrH6xArS9w05GNb+lrj9C+clo6Olvg
	 pNJ+ScFu7DYSeoStUg/i1AGBNgaBi84C+5AB8CVE=
Date: Mon, 24 Feb 2025 23:40:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support
 for Virtual Channel IDs
Message-ID: <20250224214045.GA9516@pendragon.ideasonboard.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-2-demonsingur@gmail.com>
 <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
 <aa67bfed-2cdf-452c-bd36-2c5647ae96ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa67bfed-2cdf-452c-bd36-2c5647ae96ed@gmail.com>

Hi Cosmin,

On Fri, Feb 21, 2025 at 04:27:55PM +0200, Cosmin Tanislav wrote:
> On 2/21/25 10:38 AM, Sakari Ailus wrote:
> > On Fri, Feb 21, 2025 at 01:08:09AM +0200, Cosmin Tanislav wrote:
> >> Multi-camera systems often have issues with receiving video streams
> >> from multiple cameras at the same time because the cameras use the same
> >> Virtual Channel IDs.
> >>
> >> CSI bridges might not support remapping the Virtual Channel IDs, making
> >> it impossible to receive the separate video streams at the same
> >> time, while the CSI receiver is able to de-mux streams based on VC IDs.
> >>
> >> Cameras sometimes have support for changing the VC IDs they output
> >> themselves.
> >>
> >> For a practical example, GMSL2 deserializer chips do not support VC ID
> >> remapping in tunnel mode, and neither do the serializers. Allowing the
> >> cameras to have their VC IDs configured would allow multi-camera setups
> >> to use tunnel mode.
> > 
> > We've tried to avoid having virtual channels in firmware and in UAPI,
> > I'm not yet entirely convinced we need to depart from the established
> > practices. Let's see. Apart from that, please see my comments below.
> 
> Can you think if any other way of handling this? The most useful way
> would be to have it accessible at runtime so that devices upstream of
> the cameras could assign the VC IDs dynamically.
> 
> This would be useful when having more cameras than the maximum supported
> number of VC IDs (4, without extended VC IDs), and streaming from them
> selectively.
> 
> For example, for 8 cameras, you'd have to prepare your VC IDs in advance
> to fit the streaming selection you want to make. If the cameras 0 to 7
> have the VC IDs 0, 1, 2, 3, 0, 1, 2, 3, you wouldn't be able to stream
> camera 0 together with camera 4.
> 
> Dynamic configuration of the VC IDs would solve that usecase since it
> would assign VC IDs based on the routed streams.
> 
> v4l2_subdev_pad_ops has a .set_frame_desc() that could be used to apply
> an updated v4l2_mbus_frame_desc, after retrieving it using
> .get_frame_desc(). Cameras that don't support VC ID remapping would just
> modify the v4l2_mbus_frame_desc to restore the VC ID to the original one
> (similar to how set_fmt() can modify the passed in format to what it
> supports) and the caller would have to handle that situation how it sees
> fit.
> 
> Does that sound better than sticking the VC ID in device tree?

I think a VC allocator would be very interesting development. It's
probably a bit more complex than hardcoding the information in DT, but
it would also be much nicer :-) I haven't really thought about how this
could be implemented though, but I'd be happy to discuss it.

The timing is slightly unfortunate, as I'll be travelling on weeks 11
and 12 and will have limited time then, but I'm sure Sakari and Tomi can
also provide guidelines.

> >> Add support for specifying these Virtual Channel IDs in Video Interface
> >> Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
> >> Although the CSI-2 specification allows for up to 32 virtual channels,
> >> most hardware doesn't support more than 4. This can be extended later
> >> if need be.
> >>
> >> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> >> ---
> >>   .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> >> index 038e85b45befa..414b5fa8f3472 100644
> >> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> >> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> >> @@ -231,6 +231,17 @@ properties:
> >>         shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
> >>         busses only.
> >>   
> >> +  vc-ids:
> > 
> > Other properties aren't using abbreviations, at least most of them. How
> > about "virtual-channels"?
> > 
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +    minItems: 1
> >> +    maxItems: 4
> > 
> > Shouldn't this be 32?
> > 
> >> +    items:
> >> +      maximum: 3
> > 
> > 31 here, too.
> > 
> >> +    description:
> >> +      An array of Virtual Channel IDs. These are unsigned integers that specify
> > 
> > I'd leave out the explanation on the data type. It's redundant.
> > 
> >> +      the VC IDs used by the device for its data streams. This property is valid
> >> +      for MIPI CSI-2 only.
> >> +
> >>     strobe:
> >>       $ref: /schemas/types.yaml#/definitions/uint32
> >>       enum: [ 0, 1 ]

-- 
Regards,

Laurent Pinchart

