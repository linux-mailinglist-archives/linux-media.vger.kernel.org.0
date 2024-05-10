Return-Path: <linux-media+bounces-11296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A14E78C1FD8
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57BFE281317
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D297711A;
	Fri, 10 May 2024 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ikP/JuDt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UR89/jB+"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAA5339A;
	Fri, 10 May 2024 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715330191; cv=none; b=s8An6kw7inGZTkLk+F/ivmxTdq9mApJ9CK2Ws6ocwoXuT1dtAYOpFUYsDgiz0cXzFH9IK0qSKV8aM2gMcj5igMT6PbAVhRA9gUzLEGIUQi8LOdLRVpkacKIniWPbffSZV9DCIs1tQmMoVIC+sl5gOqxtYvyR0Vy+5XO9GQO/DBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715330191; c=relaxed/simple;
	bh=4EmmVmCdCcj3oPIJdizath/cqKlFLflRxCu+gjzUh2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnYGXtyKGY978OT+4/LbKsyroSJ2T5tHjwDP8arr1aI9gzA8+62vTiDtHMcsQNuuQwy7LlPpwvwIybt5VdSRrHm1K0vQFmqmxvbm8bUbgiLIgyLiUmTzflqVHb5OFio2acAT7rCpY2FN3j7o+4JrD9SooDw7vES4CCvkliFXKkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ikP/JuDt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UR89/jB+; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id 1ADB51800125;
	Fri, 10 May 2024 04:36:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 10 May 2024 04:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715330185;
	 x=1715416585; bh=Ls+CxiM7NWikyNdfD3XS/2SP5hZiLIC16I4srK3vDfo=; b=
	ikP/JuDtAz0N8AStUfA94YlsljrEqmXZhU0YKZnd54iexLV135fs8B90XLmzw+J+
	I3D7odqLaF/qY9ptthdoMefH8SU0lT9DSrx2rcwSQwm6BnXOcdqUlHCYZQg52iMO
	F9wpWk1PhroTeINzvPZPUkYOyvVf3YPrTehHMDg6DLJVDUFymrDvHoTNp9ibXy3U
	U98z4w3/toZ+LfoVioTcF9zW8iRUzZlGzaiu+lZ9rtixxdRaD9z1pxa3An2sfwUa
	IK+ubew/qywM0RG5VgxFdklGPsKmsLbi4u8akTA/vsFW4dRBroxaoSAMW74Pd29f
	gkWOZQzvPxXqQLZydFH+lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715330185; x=
	1715416585; bh=Ls+CxiM7NWikyNdfD3XS/2SP5hZiLIC16I4srK3vDfo=; b=U
	R89/jB+/h+7e62rR4r2bOZH1SAKlXB+KMlkNKxb+KckW75/BOhvYTVM/pW0CsSxY
	QAO0LcB3G2ovwIhNVJwGdf2euq68WBXgUs5pFEpvc3TJ5Kt+D/GLEsMpPjYn1pAu
	NpjCxcHJbAFl4GN3rNfyoL3rI6yv6hQOMFXa5jlCogwhyeptbITtdKqrFw64LHFc
	A9QgXKZBJqy0cg+gHShWaXFYqJbI7YE7Q854Squ/A1PmlgDKnUlv8Ym2wV/BPAgC
	w5lJ9sbFJZGN9DBLOdzpjst5q3HKQC66P3vLI9iPfjupLVOXeSchfHzUrZ6ac7Dt
	4Qly3gB/EHW854hlHC6ew==
X-ME-Sender: <xms:idw9ZvjeqhnwJytaqLiWd7x7BI_r3UKqvm7Yulbjyy24LG78ti-aKg>
    <xme:idw9ZsDbqVYNJs3D2aajxyb1pSZJHqEj7_nYPCGrqySNoLy_OQ67ePG3V4dfs7b_g
    92qudMuQZlUgOD9wFE>
X-ME-Received: <xmr:idw9ZvFoIY55_6-wskD6VQcYhYNIuh1hrErmwskPoqTKwK0sHInh5BUcuQrKrBwYzEYHgOw00eEeBzYl_FjoQPEHk2ixFbI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefkedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeffkefgudek
    gefhhfejtedviedtgeetieekffeiudfhgeevteejvedtffdvkefftdenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:idw9ZsSgkYn4RPdSAEjb6pVH4bkV84eKaUZqkC6OgaN_2rO6uWTQOQ>
    <xmx:idw9ZsxPZdIUozcWajj1HEL5lwEsZ194oGu5oMV_u4zFLBRGpD3u7w>
    <xmx:idw9Zi7eypM5KG65a1b01F_zSzkOTpe0FcR4Kjb6H7ua1ZlBO8VilQ>
    <xmx:idw9Zhx_A1qTIXJKVeuKYKOdM6FBmBxEwukuuSdiaJLqhVQ5un4tug>
    <xmx:idw9ZvzVQdpQ3KhiQSoFqYnVQ00kSUv_nLy_fF7YXGdVu-KL0JIx4mMT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 May 2024 04:36:24 -0400 (EDT)
Date: Fri, 10 May 2024 10:36:22 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 00/11] media: renesas: rcar-csi2: Use the subdev
 active state
Message-ID: <20240510083622.GA2165064@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509205129.GD6407@pendragon.ideasonboard.com>
 <20240509224848.GV1385281@ragnatech.se>
 <20240509230604.GC32013@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509230604.GC32013@pendragon.ideasonboard.com>

On 2024-05-10 02:06:04 +0300, Laurent Pinchart wrote:
> On Fri, May 10, 2024 at 12:48:48AM +0200, Niklas Söderlund wrote:
> > On 2024-05-09 23:51:29 +0300, Laurent Pinchart wrote:
> > > On Thu, May 09, 2024 at 06:13:50PM +0200, Jacopo Mondi wrote:
> > > > v2->v3:
> > > > - rcar-csi2: Collect v2.2 of [4/11]
> > > > - adv748x: enum_mbus_code: reduce the number of formats to the ones supported
> > > >   by the HDMI and Analog front ends;
> > > > - adv748x: enum_mbus_code: enumerate all formats on sink pad; enumerate the
> > > >   active format on the source pad
> > > > - max9286: Apply the format to all pads to enforce all links to have the same
> > > >   format
> > > > - max9286: Remove max9286_set_fsync_period() from setup
> > > > 
> > > > v2->v1:
> > > >   - Remove "media: adv748x-csi2: Initialize subdev format"
> > > >   - Add "media: adv748x-afe: Use 1X16 media bus code"
> > > >   - Tested with CVBS
> > > >   - address comments from Laurent and Niklas
> > > > 
> > > > A branch is available at
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git/
> > > > jmondi/renesas-drivers-2024-04-23-v6.9-rc5/multistream-prep
> > > > 
> > > > As a follow-up to the recently sent
> > > > "media: renesas: rcar-csi2: Support multiple streams" series, this smaller
> > > > version collects some fixes and implement usage of the subdev active state
> > > > to simplify the R-Car CSI-2, ADV748x and MAX9286 drivers implementations.
> > > > 
> > > > Tested with GMSL on Eagle V3M
> > > > Tested with HDMI on Salvator-X
> > > > Tested with CVBS on Salvator-X
> > > > Boot tested on WhiteHawk V4H
> > > 
> > > Niklas, would you be able to runtime-test this on V4H ? The series is
> > > otherwise ready to be merged in my opinion.
> > 
> > I have run-time tested this on Gen4 and it works as expected. I also 
> > tested on Gen2 and Gen3 and all looks good.
> 
> Can I add your Tested-by ? :-)

For patches 1-8,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I'm afraid I don't have a turn-key setup to test max9286.

> 
> > Patch 7 needs to be moved earlier in the series to avoid breaking git 
> > bisect, but that move causes no conflicts so should be easy. With that 
> > fixed I too think this is ready to be merged. Nice work Jacopo!
> 
> I've reordered the patches in my tree already.
> 
> > > > Jacopo Mondi (11):
> > > >   media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
> > > >   media: rcar-csi2: Disable runtime_pm in probe error
> > > >   media: rcar-csi2: Cleanup subdevice in remove()
> > > >   media: rcar-csi2: Use the subdev active state
> > > >   media: adv748x-csi2: Implement enum_mbus_codes
> > > >   media: adv748x-csi2: Validate the image format
> > > >   media: adv748x-csi2: Use the subdev active state
> > > >   media: adv748x-afe: Use 1X16 media bus code
> > > >   media: max9286: Fix enum_mbus_code
> > > >   media: max9286: Use the subdev active state
> > > >   media: max9286: Use frame interval from subdev state
> > > > 
> > > >  drivers/media/i2c/adv748x/adv748x-afe.c       |   4 +-
> > > >  drivers/media/i2c/adv748x/adv748x-csi2.c      | 145 +++++++++-----
> > > >  drivers/media/i2c/adv748x/adv748x.h           |   1 -
> > > >  drivers/media/i2c/max9286.c                   | 182 +++++++-----------
> > > >  drivers/media/platform/renesas/rcar-csi2.c    | 155 +++++++++------
> > > >  .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
> > > >  6 files changed, 271 insertions(+), 232 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

