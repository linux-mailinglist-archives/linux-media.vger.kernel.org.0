Return-Path: <linux-media+bounces-31241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A21ACA9FD78
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 01:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CF0916820C
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 23:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5097A213E97;
	Mon, 28 Apr 2025 23:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="svD9qBHY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DPrtvh6e"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A22135C7;
	Mon, 28 Apr 2025 23:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881425; cv=none; b=CxIK1b9O3PS2E6eUwQrA8vNpjRoSMvDEkDcqKsw5PMccDcZV0JAGUW5w42pRpeDWJ2nL6DGjo6Do30TKkxeJ38N3vQQVeU8qAwfeYnlz5u35ntdAzuA4wbtTNqyULPkt+ZWWu7VQI4gfvqDF5s0tCnPePQbt26Ua+Iu4xKAJ03A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881425; c=relaxed/simple;
	bh=kI8IlL3QI3aVmXNNJOCB7Eu2xcTR9zSAMidcgL+otWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPBCtuFjhx/B53LEkED79ONfZPlSn2hkOfDU4W7s+6KYvrFjGxnBzQe1XfGCz3sKV5b7l8ZSbneOHBl3ZA2fUKwd/sA3v2D+rC7aTysGAzzHVf5yXIB5IHGBjv9yEhnm0j0BCacxr7S6oZi5G49U0dA/GT4Bj+EAdLtY7FiQ9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=svD9qBHY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DPrtvh6e; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 776C013801AC;
	Mon, 28 Apr 2025 19:03:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 28 Apr 2025 19:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745881422;
	 x=1745967822; bh=pHqx1GykFQWZVkLUWBRThPy9+CwWC9fTddnGKdpIZK8=; b=
	svD9qBHYmtIjhjQpMVYNcLKM3L5DMsZ+GLtDxJKnkAL9ezDGTpx8PO4hmqH/bjZG
	l4aOu9BMs60Y8tu1ZYmVlgC2iSrsXzA8WsyyqGBLxinqxMlNS53VnCclGonXf3Z6
	nTT+WxV/1/1BkGpqBpI7o2mee4PZ8XML4zWG6nNp9mpWK0aUMXFuVwRxKN1aNXBg
	XDvpTjeZV7t56R5WYAEdrRPkLcuwOgULTycR6Ghi1Ru5fZAeCP1u7UdKO8Z+xEvL
	ORJys3iOohu/axUUHvWkcQv21ClVqKWtVs3aawc5i3guHeNbRAf1DS19uMbMPLOQ
	UQSIjH/jFE+Z6LiOV8qq3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745881422; x=
	1745967822; bh=pHqx1GykFQWZVkLUWBRThPy9+CwWC9fTddnGKdpIZK8=; b=D
	Prtvh6eunoXGGqOO3tdocxwR2olO7ENAGzJJRfmzoJq0vgVV9cHUQERDfvZ8niW9
	l6XhZF4NrEWWtQVNKeuJpN24Ae/bXlgd0SynS4b/Vpul1Ndq/k1eQbb47W5JXjh1
	wmoX20IvsCGjJwFDyoWzjpyuYRbWJ6uoebFpEnHYKMsH9Z6Ti8wQvqzAz8Or7lc0
	bJaRffxWmCLhLDLL65QWQQpQeQKGbfHJj+nxcVP0pqzEPlgAUo9+c372OK9MnfEt
	xPApVdgKWtsVus0sL4U0Bqtx3idKg7Q6Px4nOw6OP4UaJX/hmEHYMsGAgGbAFqok
	5OhOKuarou34GLf9YfpTQ==
X-ME-Sender: <xms:TgkQaA2bIcG1Nf3RyyUwEDqolAzGxumyzsHNi2xue3twCj868fNe_Q>
    <xme:TgkQaLHOjuqSV4jl9UltIHakDYXWqgyrZo9PEPvfJWAkks-voXC2wMXVhzyyJNyuc
    pumL27saL5t4XJnyuY>
X-ME-Received: <xmr:TgkQaI5fDS0v9TPs6eIzuxgmpyrtInt-G2hEa6GVuhTWeZVvaBp4_IJAsL58pAdIabC20ayo3VaDVXUPz0IRuazWG07_4AuU9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedvvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthh
    gvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgv
    hhgrsgdohhhurgifvghisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:TgkQaJ2vVrJ4bgQKXSInNO6jD00iol9T9zT9OtgH7vAi_Kup6xCmKg>
    <xmx:TgkQaDGYrxcHGBTQzpL8cOcE1tOBaqE-liHwpYRZvAmO9hsFWReKSQ>
    <xmx:TgkQaC9vkiS0VXudaYBwRjIwiA12_eNnzED2D4qSmsnpP4q__Rkung>
    <xmx:TgkQaIkiL9bMseCkW9xSoxCEqBDGEW-0WzzqjQK_vkQfy7eof-jbuA>
    <xmx:TgkQaMQGYplNY4UH3N79MZMSAvOGCkP-ji9pk2aSDdf2YYssedBM8lD5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Apr 2025 19:03:41 -0400 (EDT)
Date: Tue, 29 Apr 2025 01:03:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 4/4] media: rcar-vin: Fix RAW10
Message-ID: <20250428230340.GD1969140@ragnatech.se>
References: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
 <20250424-rcar-fix-raw-v2-4-f6afca378124@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-rcar-fix-raw-v2-4-f6afca378124@ideasonboard.com>

Hello Tomi,

Thanks for your work.

On 2025-04-24 10:05:36 +0300, Tomi Valkeinen wrote:
> Fix the following to get RAW10 formats working:
> 
> In rvin_formats, the bpp is set to 4 for RAW10. As VIN unpacks RAW10 to
> 16-bit containers, the bpp should be 2.
> 
> Don't set VNDMR_YC_THR to the VNDMR register. The YC_THR is "YC Data
> Through Mode", used for YUV formats and should not be set for RAW10.
> 
> Fixes: 1b7e7240eaf3 ("media: rcar-vin: Add support for RAW10")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index a38c7b835231..9de1d3d91fa6 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -890,7 +890,7 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_PIX_FMT_SGBRG10:
>  	case V4L2_PIX_FMT_SGRBG10:
>  	case V4L2_PIX_FMT_SRGGB10:
> -		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
> +		dmr = VNDMR_RMODE_RAW10;
>  		break;
>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index 756fdfdbce61..65da8d513b52 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -88,19 +88,19 @@ static const struct rvin_video_format rvin_formats[] = {
>  	},
>  	{
>  		.fourcc			= V4L2_PIX_FMT_SBGGR10,
> -		.bpp			= 4,
> +		.bpp			= 2,
>  	},
>  	{
>  		.fourcc			= V4L2_PIX_FMT_SGBRG10,
> -		.bpp			= 4,
> +		.bpp			= 2,
>  	},
>  	{
>  		.fourcc			= V4L2_PIX_FMT_SGRBG10,
> -		.bpp			= 4,
> +		.bpp			= 2,
>  	},
>  	{
>  		.fourcc			= V4L2_PIX_FMT_SRGGB10,
> -		.bpp			= 4,
> +		.bpp			= 2,
>  	},
>  };
>  
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

