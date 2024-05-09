Return-Path: <linux-media+bounces-11251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3E8C189A
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 23:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A9D11F23D12
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 21:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21141292FF;
	Thu,  9 May 2024 21:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="j3iNkNix";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DBpp18BA"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C295B85C65;
	Thu,  9 May 2024 21:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715291157; cv=none; b=SwqGxkIdmKvV2D9n2CtPhf725IcytBOuaWvOsa6THbt0lmfv6qYHXA0yV/HOnWH1l1dd/tm3At8BQYHYKeYV2lGqTTDJo7FSslzRT2ciOCOLBiKJhXGb7a2dvskX2xxjIFFJtNvbvUOKDj4aLGIEWmFp8X8NQ8eEdpuKYgvYOBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715291157; c=relaxed/simple;
	bh=UqFJ955UHqpI7wFMbX38PiaJALQUlzrO3jxFReZZcEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xu+0m7iCgLonxAN9+KxOkKzlfuKQeKSCnB9f17czpSyH0lqcnzmUmAhmEDg2LV4Q2NNRfaxIoQuvhTSDFP05FvOPS+fFoX2WsnH5ru9zekA/QRs7Jg+KoywlKWDsudzQedL5HrK5aVyC0/jb7Wf0WsbPlUOPEhBj154EAgER4bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=j3iNkNix; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DBpp18BA; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 5AA551140153;
	Thu,  9 May 2024 17:45:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 09 May 2024 17:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715291151;
	 x=1715377551; bh=sthv21qXke2meUnVcWoreiN/68zNzQvNCvuRC1Qny1U=; b=
	j3iNkNixlh2NKLLiH/NKY8UTcXkCdZfswzyJ04yVpvejGbysZSwhwdil8pBThrU+
	4sc5llUHlvyUITwPErSkjGtJxJr8wt5bGX7/NTqhL3Sv/9xc/q1TRgXlxfmFVUo+
	ENBBm5WoxFs/qlFqtHqOsfbugiDz/LDlQ1Ueupdh5gQbLsMyg4tP31KhMveLrfoE
	J3dZeIHUygh0dxb/wgsCWTSM5hYs5Nmgmwy9krHoVHVA4Hq/BXMEJV4LtisLt9d9
	RQwHBXqhJtGAgQjLcmOIqRTE4pgJJ+A9S2MelGPhTNOBFcGfo16+Cd3DRV/IUq8f
	xH62u7TVStDgMAHy4mOq9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715291151; x=
	1715377551; bh=sthv21qXke2meUnVcWoreiN/68zNzQvNCvuRC1Qny1U=; b=D
	Bpp18BAlUejZY3L03zqgoIHmJIflKMPrLcIKtoSUxKjk9XfDJM+y7zbgm8ElIDML
	6UTeP4yKhbKtZ2K7jK4cmAn1Qu6Kblcz4ZUttL0GBxofI+Z/F8DiyeAsqyR687i6
	pi/kPmFLLBM/48xt5sKP8NO2Th+zYYT/hHrwd32ZpW4zcOK2ycI6JRH1f9EbZWJx
	/xopXVHE1X0YFukwGZu2j7ogG3HUORS3y1bbaQ5YHwoOYAeazHDgcnzO4yzTmRJh
	cXcNk/PSAgiJqSkUCM57UQWKYz1r0ivPfPQ/PsuPIGodFcqeSuoZ1AfdNUlepUsQ
	8LsdZ/oc/jP8RnW4SV3FA==
X-ME-Sender: <xms:D0Q9ZkHyFUaxS2Cvgq7P9QGVnNofeWuVcqe8nzNSiglgHx6QwEZ_hA>
    <xme:D0Q9ZtWn4IipiHIiTpeSYNvOv3BY1-C5XvcWorhpqRZmCAgcOhV-_Xh5W4-UpY_yO
    vFFC8tYV62nQ4tiWmw>
X-ME-Received: <xmr:D0Q9ZuIrLYR_YIsyq131Q0XFK4i88Y1J1bSbHrxAwJfXQyfuH_Qb-Bc3klrMf2cRmhLp2huOIschLdCqaCF_5Hoh7QtGuaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:D0Q9ZmEn5JF9mGNmSTaCDQyr_dOV1DHiA3RRszAaHNVDcyvM6K7BKQ>
    <xmx:D0Q9ZqWuNcGDkvZfN7tGSF8Ct8E3H4TwUaVxGzwXacvuHiAfDVn7VQ>
    <xmx:D0Q9ZpM2xhWqvaf6_y0OODyB60OBYVgXv4MTy-Q_kYkmVXxqezDwgQ>
    <xmx:D0Q9Zh3gjpbZu2G9XBlgNloIredql4iVQrHRoFgtmNah1QidIniWSQ>
    <xmx:D0Q9ZlHRR2GajMMQbeOVxjvMb67PWIC68u9yVc9Qxjxb3tFuFwIk8ggu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 17:45:50 -0400 (EDT)
Date: Thu, 9 May 2024 23:45:49 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 08/11] media: adv748x-afe: Use 1X16 media bus code
Message-ID: <20240509214549.GM1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-9-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509161403.111789-9-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-05-09 18:13:58 +0200, Jacopo Mondi wrote:
> Now that the adv748x CSI-2 transmitter driver validates the supported
> formats, it is required for subdevices along the pipeline to produce
> and consume the same media bus codes.
> 
> The adv748x analog front end driver use the 2X8 variant of the UYVY8
> media bus code, while the CSI-2 transmitter use the 1X16 variant, which
> is the correct one to use for the serial bus.
> 
> Make the adv748x afe use the 1X16 format variant to maintain the
> pipeline validation correct.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Can you move this patch earlier in the series, before "media: 
adv748x-csi2: Validate the image format". Else capture from AFE is 
broken between that patch and this one for no reason.

There is no conflict in reordering the patches and it allows for future 
bisects to work more smoothly.

With the ordering of patches fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-afe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> index 50d9fbadbe38..5edb3295dc58 100644
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> @@ -114,7 +114,7 @@ static void adv748x_afe_fill_format(struct adv748x_afe *afe,
>  {
>  	memset(fmt, 0, sizeof(*fmt));
>  
> -	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
>  	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
>  	fmt->field = V4L2_FIELD_ALTERNATE;
>  
> @@ -337,7 +337,7 @@ static int adv748x_afe_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index != 0)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
>  
>  	return 0;
>  }
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

