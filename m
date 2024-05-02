Return-Path: <linux-media+bounces-10619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F7B8B9C56
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 16:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31269283A79
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 14:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C39153560;
	Thu,  2 May 2024 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="htIczQVc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jGFHVDhp"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C93153509;
	Thu,  2 May 2024 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714660414; cv=none; b=LDB5FU0wRp3XwvCOMGMQgSCBbZ4s9fJar0sbnbxuI5WnATIEliu0dJc/1WImMgXtFXtVuLWVKRY//gZ7KYQShXKeF+hTg5IE9IrBEKuyyVHHKMucFq+3BWjCUO5iPQQMTeOLOCx3z3lsxGGGvVJlsRnC/uW1WxI7b9klCOFbK2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714660414; c=relaxed/simple;
	bh=kpt2UNWXmHgKiEQSyx27i29MsFz4YK1Ft8/K41tpNG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2/x5bshQG8424Rc3GZl4hdnOk5K771sQ2fHhiSqiEKe+eY1U6Eke+MBu4j/cGjpdDDrlF/PP50V1qiba8ZeDgr2NjtUB8Kw9CBmoSPYOoNIyF1yVV6GDShe6n9zEhMavuSKKA23Y/QZvNVQVYhRUtp53nQCKiYfDrw1HUIWBqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=htIczQVc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jGFHVDhp; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 396E718000FD;
	Thu,  2 May 2024 10:33:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 02 May 2024 10:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714660409;
	 x=1714746809; bh=7bdOaRp6Mqe6jKUXKLoauEa86u4mckyB8Y2VcyWH4a8=; b=
	htIczQVcFNLzjiYxa/YP/pUTC1CvqKg1RncrJROnr3qqRpwmy7zQ7U52jNmKpYDp
	qIbSwoGFqwzJ5JdSKjuOtbMRfCjw0GByKmdz2WDNJSa0AfkYpIxmRZ3hyUmifb7A
	08EQafU1jwp7QjgEO9fKvsPvpazI0duFaNJfyEyVCwFQINkB13lPvk4tUrZJKNtA
	Xh3c/AIr8ZH0OE7WyrwlMzvgXBwXiDWjSZxR/CNj6gPI+WB0XEk8vk4Uw+7FESgC
	oLdqPY8eocU8tZwgLT4RFv59iu5C8vEB5Z8O/NlaCo+vYMFsfy2H2pWDZSLYAOqO
	fzAf+qwq+Joul5WiVpSUrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714660409; x=
	1714746809; bh=7bdOaRp6Mqe6jKUXKLoauEa86u4mckyB8Y2VcyWH4a8=; b=j
	GFHVDhp1k+SPkHZf6Xf89PYmDFyjfA7JRhfKkPxduoE+NmiCUowGV6QiiVFbdaZ4
	PrNi1ej/K6a8BhJBZRgbRFP61NFsReu/Ylo9b4dprslG6rcfc5RhP4Tm8reoO7W7
	QijRH1CAg2uf2F0VALnKRupSETiqI/33/A7BlwIRNsnaPc7moXxcwTdQDcCAxUZf
	yKbKnc658e4xNLVkho2i7n6x7omtAsifA0HIFSw+G71sdKBEGaY5e0f5TPb2GGXF
	We30R1eDmE6pbktvyV9cxfW9+67dw6nmcK+PBu/X59jXoDGnIexQv+De4insftOh
	NXm2zoLRRmudfUB/11lTQ==
X-ME-Sender: <xms:OaQzZp9z-_Pn9NDkx-LYn7-ICZFRKNGW8RE2wsl6g5OlKkAb4sW7cA>
    <xme:OaQzZtswe4wDlCzTMQr297poJFJGaA6Jdwfo0WpVUOXkZvUvU_j5a1QN_qcX0vwf9
    UjoMSMDhMzn77EQAFk>
X-ME-Received: <xmr:OaQzZnDnnGkdpur5XifbipbZpCOh0wTLUn94yE8QPLE4IbgTYXMR1-HWXU45Y7byZOJDWQjWtXx7Nu99VvdcrMvoUUEya-Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddukedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:OaQzZteW4K9pH7GHcTi2k1bjxsVwl-Z2rezjdtAb_SW4ImGT48Vvtw>
    <xmx:OaQzZuMnnWZzzELhB9SW7bvxYdPOPotu8ahKkE6UaOJoXRQ_3zK4cQ>
    <xmx:OaQzZvmJ6gIxyYiB3kc2FSu6sjbsmIaiBOCR46RizOMPIOwcJZqYCg>
    <xmx:OaQzZosG_IcytC6pkfqPVFkdiUPx6CpATYnSR3IIl-j2Yzo_abD3ng>
    <xmx:OaQzZtenTteYNMvmwbMcCMzrUurjyJsLYnkRnMn5DBL5aXMljHqc3KjL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 May 2024 10:33:28 -0400 (EDT)
Date: Thu, 2 May 2024 16:33:26 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 19/19] media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
Message-ID: <20240502143326.GD3927860@ragnatech.se>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-20-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430103956.60190-20-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Same for this patch, can't we fix this issue independent from the 
streams work?

On 2024-04-30 12:39:55 +0200, Jacopo Mondi wrote:
> The YUYV8_1X16 and UYVY8_1X16 formats are treated as 'ITU-R
> BT.601/BT.1358 16-bit YCbCr-422 input' (YUV16 - 0x5) in the R-Car VIN
> driver and are thus disallowed when capturing frames from the R-Car
> CSI-2 interface according to the hardware manual.
> 
> As the 1X16 format variants are meant to be used with serial busses they
> have to be treated as 'YCbCr-422 8-bit data input' (0x1) when capturing
> from CSI-2, which is a valid setting for CSI-2.
> 
> Commit 78b3f9d75a62 ("media: rcar-vin: Add check that input interface
> and format are valid") disallowed capturing YUV16 when using the CSI-2
> interface. Fix this by using YUV8_BT601 for YCbCr422 when CSI-2 is in
> use.
> 
> Fixes: 78b3f9d75a62 ("media: rcar-vin: Add check that input interface and format are valid")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index e2c40abc6d3d..21d5b2815e86 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -742,12 +742,22 @@ static int rvin_setup(struct rvin_dev *vin)
>  	 */
>  	switch (vin->mbus_code) {
>  	case MEDIA_BUS_FMT_YUYV8_1X16:
> -		/* BT.601/BT.1358 16bit YCbCr422 */
> -		vnmc |= VNMC_INF_YUV16;
> +		if (vin->is_csi)
> +			/* YCbCr422 8-bit */
> +			vnmc |= VNMC_INF_YUV8_BT601;
> +		else
> +			/* BT.601/BT.1358 16bit YCbCr422 */
> +			vnmc |= VNMC_INF_YUV16;
>  		input_is_yuv = true;
>  		break;
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		vnmc |= VNMC_INF_YUV16 | VNMC_YCAL;
> +		if (vin->is_csi)
> +			/* YCbCr422 8-bit */
> +			vnmc |= VNMC_INF_YUV8_BT601;
> +		else
> +			/* BT.601/BT.1358 16bit YCbCr422 */
> +			vnmc |= VNMC_INF_YUV16;
> +		vnmc |= VNMC_YCAL;
>  		input_is_yuv = true;
>  		break;
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

