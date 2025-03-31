Return-Path: <linux-media+bounces-29088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D9A76FF2
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 23:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04EDE7A3AD7
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 21:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B84321C17B;
	Mon, 31 Mar 2025 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Wdn0lgZx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wjo0FTiE"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89FB211A0D;
	Mon, 31 Mar 2025 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743455489; cv=none; b=Q+//844aU2WkrA8SQRWt6UakKxmNgUOxRtPXzEBzUb/xEeyekpwjAy6d/YFRlLHLeG0No10kIoOil2/OoM6Gwgzs8wwLG5VqaWBwn7WHPjCLOT1HQ4Q065hyayRtFL7rdI0qbNrqCb/M2EaMkpw5smbYaF9mce/Bqyz8/Jo9RCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743455489; c=relaxed/simple;
	bh=VThekt9VP/Q87pC3Z5jTADD876f8JU5hwP2MQuoDMUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAgjn6aj/K7vIF7cfBqxx+a3qg/sqoA3JT/QaS3KWb+fnJ+wJHYhbpLw17OIKGVmJqMerWVq9NnwEUCov4LO/vwsJYgpU1qDzKfyAeE/3KnkIcdbCPwtT86a7L6mxIc/UFq7RDelphtmzBtaHX08DXSz+RDYiesqVcDCRwJyxoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Wdn0lgZx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wjo0FTiE; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C82E811401C0;
	Mon, 31 Mar 2025 17:11:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 31 Mar 2025 17:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743455485;
	 x=1743541885; bh=pfF/Y+IcsafwYncEohGBiPMWzO2sMydxaUqGKaWvhU8=; b=
	Wdn0lgZxWcOo0mQ0qzXaLyjSUQRAFh2jzhN7mJDvD9s/N6aBnB3HHOy22/HRPnQU
	M5r+jY5dqps2kiAd4C24r2lizuHCkYm2maq750BeysYJSBUUYjObk/MNVvuP5YmB
	MkF9oMpLeMp8l9v9JZ8PkY2+nRrSnBBUxV+8Y8A8qk9Mg0x1SYdq9pY/kjZCiGGE
	Ghsq7SFao7Z1Sfl/sN4wE4/6i9TOJ/ainV09mCLxExgah2BHwDRuFwdD9FyOG4tc
	NSoSn8SNgdZ3KomZfNJ8B/AgICcAcQrII8vHfT/2DjPsjnXnxICjSy2eEzI3F7C6
	prb83ehPArJPSu6Vgbz6jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743455485; x=
	1743541885; bh=pfF/Y+IcsafwYncEohGBiPMWzO2sMydxaUqGKaWvhU8=; b=W
	jo0FTiEpvuqXIvVzctovrOai6PA274OMAs56P5y4HppTGlkXJ/EQd/ngS8KQXITQ
	LHDpjrjzVG+fOJ0eZyP+6KgsIL+LsfxWuWQUi1OV7xUDq7O2/jnaI4vorOtNPJzF
	H+Q8ehIl4nxV5qZigSkbZ2eYyb/EPjn0gwuHmlGfWMizGuPB++/f27vpM4vqNtg4
	lCCHE2eg6OwkiZ2yI6fNZr680oHT8ueO6uaPw6PwgRam5Jv0IKu2d1qNYbaxBTgz
	SAcGRuSZuc+5l6kOcUx2wtnSX1QjFIqZ7S9Y3eVUn43NVV51Y7gLZ5YmU1B3M/9E
	1a1yvj9jASzgAvJ23NECQ==
X-ME-Sender: <xms:_QTrZz34gEVdZiwq4Db66TW56egSaWL-UJE2kuKV2VoB2rUqI35xOw>
    <xme:_QTrZyGcIn3PmeYfyzag391XlemKRe-MYvIs8vy0Ra04TKsc_l-oHU-3j0h0y6R_m
    gZAO09dQuy2acc_PB4>
X-ME-Received: <xmr:_QTrZz54zuMPJkpwwAOpcIiJtBKlvnTKjltWobt6O5jl5--6qEgRokVYgoDnfsgZbuE3Yg1JdZdlJ4dmVgXRM8oPPvp6LE-yFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtleejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:_QTrZ41S_GAA3lKVWtsKsgPRI6zDXUiv1vOwI8fmzpiI2ADBTuPlIA>
    <xmx:_QTrZ2GY2ZmtDHySOBKNt5EDHv1nEexO8_JBdz9b-H5d4DO4Q5HbPg>
    <xmx:_QTrZ5-j3xhrb9HVvwVh8XeeGRCk3ru5vw_cofN6Asa5bxlS1cPycQ>
    <xmx:_QTrZzkWa6_aGZYxVYdM3gD-g8vEi0BSE8TcAlmFQKTnTFmqgoWJ7g>
    <xmx:_QTrZ51wXxwXc9B6qZSvtSyjBwaeEkqR5k7kQJnx8VY5T6vFNJH9fmoC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 17:11:25 -0400 (EDT)
Date: Mon, 31 Mar 2025 23:11:22 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 3/3] media: rcar-vin: Fix RAW10
Message-ID: <20250331211122.GA1240431@ragnatech.se>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
 <20250324-rcar-fix-raw-v1-3-ae56c1c7a2f6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324-rcar-fix-raw-v1-3-ae56c1c7a2f6@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2025-03-24 13:48:54 +0200, Tomi Valkeinen wrote:
> Fix the following to get RAW10 formats working:
> 
> In rvin_formats, the bpp is set to 4 for RAW10. As VIN unpacks RAW10 to
> 16-bit containers, the bpp should be 2.
> 
> Don't set VNDMR_YC_THR to the VNDMR register. The YC_THR is "YC Data
> Through Mode", used for YUV formats and should not be set for RAW10.
> 
> Fix the check related to the RGB666 format and CSI-2 mode. The
> VNMC_INF_RGB666 define is the same as used for RAW10 on Gen4, and RAW10
> is allowed on CSI-2 (whereas RGB666 is not allowed on Gen3 on CSI-2).
> This feels a bit hacky, though, and the formats should really have been
> verified already earlier.

I agree, it feels hacky. I would rather just remove the while switch 
then try to "fix" it by extending it more. When testing this series I 
needed a similar fix for VNMC_INF_RAW8 check below to get it to work on 
Gen4.

> 
> Fixes: 1b7e7240eaf3 ("media: rcar-vin: Add support for RAW10")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 9 +++++++--
>  drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 8 ++++----
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 53046614f7a1..f8394be8a922 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -811,12 +811,17 @@ static int rvin_setup(struct rvin_dev *vin)
>  		case VNMC_INF_YUV8_BT656:
>  		case VNMC_INF_YUV10_BT656:
>  		case VNMC_INF_YUV16:
> -		case VNMC_INF_RGB666:
>  			if (vin->is_csi) {
>  				vin_err(vin, "Invalid setting in MIPI CSI2\n");
>  				return -EINVAL;
>  			}
>  			break;
> +		case VNMC_INF_RGB666:
> +			if (vin->info->model == RCAR_GEN3 && vin->is_csi) {
> +				vin_err(vin, "Invalid setting in MIPI CSI2\n");
> +				return -EINVAL;
> +			}
> +			break;
>  		case VNMC_INF_RAW8:
>  			if (!vin->is_csi) {
>  				vin_err(vin, "Invalid setting in Digital Pins\n");
> @@ -913,7 +918,7 @@ static int rvin_setup(struct rvin_dev *vin)
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

