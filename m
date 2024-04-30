Return-Path: <linux-media+bounces-10445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF78B734F
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 13:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8A63B227CE
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 11:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233D512D214;
	Tue, 30 Apr 2024 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jd+fVB0V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VBUXMZIr"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8202D12CDA5;
	Tue, 30 Apr 2024 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714475853; cv=none; b=rJOZbvM0rFLFyyzqUN7fP+dJ+Vd3kuqW5mUtOBSFfId8WD4yVukhol1XO179WC2O8LOEz1CXzb06DsSALikXV7qRJTcYKcEGFJ/g5ehX/zERuVJlKEr+LoiiZ1f98S9X5bFS/GaRCWgytVuLcIBzEE5KMxomo+4JqrvXqXYR4uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714475853; c=relaxed/simple;
	bh=jNhxFsqdIVowRZuprOCO65DeMuP/hdH++1Xltyrc9cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IH441oeLE+/BKxXP6viuovLRNAWcYl4fuiGVIUD3cMh49FqvQ8aDKuATZKzsKle5255g/zkombYIE/xX2pjh5Vy7ZUYBEaEYx/izv6geBmk3KVZQaWyg8pZbU2WTplJVEmI6jJUjpIfsrO9hwn4aNoIHcxq5VGREkGnvcYj/8Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jd+fVB0V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VBUXMZIr; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id DCC1A18000DF;
	Tue, 30 Apr 2024 07:17:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 30 Apr 2024 07:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714475846;
	 x=1714562246; bh=+MnHvwBcq0QOPQzFK/SO3EzOcRzkssdUInpdb6xKOtg=; b=
	jd+fVB0VwCuLh7zsr1NbuOS6mTbu3/FerawL7mpteaTbUJMyfgdFFO9OYO/E2OkY
	2kxoXui0O0LIveV3wZOQCph86ep66rMdVg9h90ERO5KzP5tPiVRlwQN5oEDlgIlT
	uhYpYOLMkb8H2ZFkXg3InelYUdscwfyL7i9tbCwTmkfVHG6YY5NGXw0nk5r3F0pJ
	xDxbNKlvBGenhd2mlPPEpb7W4X/s8b++PiYlx9ee6nrnEFkGCvZPp/NwMYgDLDGA
	3POg0F23KQtczURVwgcdBnmx8UOcqav3xEPiLO+BL+pNsas5qBkSb+8wlH7eai9m
	Rf0zHPakAEY8Y8TqjiSPDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714475846; x=
	1714562246; bh=+MnHvwBcq0QOPQzFK/SO3EzOcRzkssdUInpdb6xKOtg=; b=V
	BUXMZIrj0Y3AC1EepvWa6wCbeZh1bBt8x7PVvcY6oCAw2vvWonZXsv6+XBTQ8xCf
	abUzd4N+btuY1w1GW3gOY3oFo7vj5wMd1i3jo9PBHY+Y9SiWKQKe68IuwCG5ajvO
	ZtIMwhSNtdk1J3XTiVh7m1S4r1VtGsYSNuYCPlqOkOGtMFdNtIHnSInl33bdeYet
	gF1nxm1h67BqjWnMQ/tK4V5MHvISr8DUEmN9ZlAp0mf+zN/trdfpKP7rfOV0ZxyI
	pUZQ81fJfnNI1aUHCUmlboMSI6Yb/uG4krLG+m2h9Vj9Mk5KQ3ZkokgdSYxK8uMU
	8DB8kAMUw+Pncl+8d0YXQ==
X-ME-Sender: <xms:RtMwZij_l1uWuqwz9Y1HjysmSEwyr2bjd5ah7lAEk2vZho-eIp1x6Q>
    <xme:RtMwZjCwy7-0m4o2PsvvmIVErVIYmpWbV5swg29l7z7tB8Vl82IaKeLyk3Duh7DV5
    wzi3pb3QJWfHb-apEw>
X-ME-Received: <xmr:RtMwZqF8pa1CCE98ApbuGH_NtPrVSlVfBZcvEpzJh2MvoeY3wU97k9p98Jd2tu8Z8R2qQQghxkgWbruV082cgq01zdMeeeY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeektdegjeel
    hfevudehgfetiefhheeiieehveeifffgveetgfegveegtedtheelffenucffohhmrghinh
    epihguvggrshhonhgsohgrrhgurdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:RtMwZrQivmSbYQf4wOZ0rL7-XKWub97zuYsByNCxPNmWRhjkAxgIvw>
    <xmx:RtMwZvxCVgo7cexQ_UHsPYpbsTzBmw36c6O7XXSebHC8Bv6_r4bweQ>
    <xmx:RtMwZp6JH7DYXy1ZWHnDAhur3QxlwiQM1jlEOnNAuiHSUrtZpVtYfw>
    <xmx:RtMwZswdV6eaa81m4zZlGDz1vlanQ5B8G2w3olUtYDJn9jdCtys16w>
    <xmx:RtMwZmymQRJyccl6BCLYW_7wmgCHrkRUmd1I9iytVYPOc6sAwg86lYfv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 07:17:25 -0400 (EDT)
Date: Tue, 30 Apr 2024 13:17:18 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] media: renesas: rcar-csi2: Support multiple streams
Message-ID: <20240430111718.GC1341585@ragnatech.se>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for this work! I'm happy that we finally can get this upstream. I 
will test and review this in the coming days. As there appears to be a 
few dependencies to get this to work do you have a branch covering 
everything needed?

On 2024-04-30 12:39:36 +0200, Jacopo Mondi wrote:
> Hello this series implements multi-stream support for R-Car CSI-2 and the
> two CSI-2 devices that are available on Renesas dev-boards which are mainline
> supported (the ADV748x HDMI decoder and the MAX9286 GMSL deserializer).

You also need to update the MAX96712 driver in staging else V3U and Gen4 
will break.

> 
> The net gain in feature is:
> - ADV748x: Select on which MIPI CSI-2 VC to send the stream on
> - MAX9286: Paves the way for run-time selection of active links
> 
> Both features are realized by controlling the devices routing tables.
> The max9286 routing support is not implemented, but these patches are needed
> in order to maintain the current version compatible with R-Car CSI-2.
> 
> The R-Car CSI-2 driver needs to be updated in order to support multiplexed
> transmitters, in particular:
> 
> - Use LINK_FREQ to compute the lane bandwidth
> - Support subdev_active state
> - Configure DT and VC handling by using the remote's frame_desc
> 
> A separate fix for VIN sits at the top of the series to re-enable YUYV capture
> operations.
> 
> The series needs to activate streams in v4l2-subdev to work correctly:
> 
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -32,7 +32,7 @@
>   * 'v4l2_subdev_enable_streams_api' to 1 below.
>   */
> 
> -static bool v4l2_subdev_enable_streams_api;
> +static bool v4l2_subdev_enable_streams_api = 1;
>  #endif

I'm not up to date with the latest state of the multiple streams API.  
Can this be runtime configured or will this break capture if the kernel 
is not patched to enable this?

> 
> 
> Test scripts, based on vin-tests are available at:
> https://git.uk.ideasonboard.com/jmondi/vin-tests
> 
> A note for Sakari: patch
> "media: max9286: Implement support for LINK_FREQ"
> 
> Could actually use your new
> "media: v4l: Support passing sub-device argument to v4l2_get_link_freq()"
> 
> I kept it as it is for this version waiting for your patch to get in.

I like this idea.

> 
> A note for Niklas:
> I think this series paves the way to actually moving the control of which
> VC goes to which VIN using a routing table instead of using link enablement.
> 
> Currently the setup is as it follows: routing within R-Car CSI-2 is fixed, sink
> stream 0/X goes to source stream X+1/0 and each source pad represents a VC.
> Which VC gets sent to which VIN is controlled by link enablement.
> 
> A more natural way of handling this would be to make the routing table
> within CSI-2 configurable and have media-links immutable between the CSI-2
> source pad. A CSI-2 source pad would then represent a 'channel' between
> CSI-2 and VIN and not the VC which is sent on it.
> 
> This setup would better represent the current implementation, with VIN's VCSEL
> fixed channel routing and with the CSI-2 routing table controlling which VC gets
> sent on which channel. What do you think ?

That could be useful. Maybe we can even switch to use immutable links 
and use the routing instead greatly simplifying the VIN driver as this 
together with the other VIN series on the list we can drop the ugly 
group concept ;-)

But this series is already quiet large, I think we can work on this 
on-top in a new series.

> 
> Jacopo Mondi (19):
>   media: adv748x: Add support for active state
>   media: adv748x: Add flags to adv748x_subdev_init()
>   media: adv748x: Use V4L2 streams
>   media: adv748x: Propagate format to opposite stream
>   media: adv748x: Implement set_routing()
>   media: adv748x: Use routes to configure VC
>   media: adv748x: Implement .get_frame_desc()
>   media: max9286: Add support for subdev active state
>   media: max9286: Fix enum_mbus_code
>   media: max9286: Use frame interval from subdev state
>   media: max9286: Use V4L2 Streams
>   media: max9286: Implement .get_frame_desc()
>   media: max9286: Implement support for LINK_FREQ
>   media: max9286: Implement .get_mbus_config()
>   media: rcar-csi2: Add support for multiplexed streams
>   media: rcar-csi2: Support multiplexed transmitters
>   media: rcar-csi2: Store format in the subdev state
>   media: rcar-csi2: Implement set_routing
>   media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
> 
>  drivers/media/i2c/adv748x/adv748x-afe.c       |   2 +-
>  drivers/media/i2c/adv748x/adv748x-core.c      |  12 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      | 251 +++++++---
>  drivers/media/i2c/adv748x/adv748x-hdmi.c      |   2 +-
>  drivers/media/i2c/adv748x/adv748x.h           |   4 +-
>  drivers/media/i2c/max9286.c                   | 457 ++++++++++++------
>  drivers/media/platform/renesas/rcar-csi2.c    | 442 ++++++++++++-----
>  .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
>  8 files changed, 834 insertions(+), 352 deletions(-)
> 
> --
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

