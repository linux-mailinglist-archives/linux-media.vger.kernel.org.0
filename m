Return-Path: <linux-media+bounces-28373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F9EA65757
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEE307AD2D9
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 16:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFDD1991CF;
	Mon, 17 Mar 2025 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Qyu/kgYd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IaS9OcaX"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7C18D65C;
	Mon, 17 Mar 2025 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227602; cv=none; b=KmfTqhYreDDAg/cMCTiHgcQYIaxrVLvK8GYh+5+cfZWSnpy/olIeD3Pppjg4HES5bArPIBDJeIt/9pUUWYbqnSc/tcTgQeiDKQSuHSf3sTvsvZhz0fCNL33rPXmsoSZ1n4jJRZh8yvua8ziHa81+mvjd1tBpjf4r8izUwzU1ppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227602; c=relaxed/simple;
	bh=uKSng1NdF7mMLeG85plqfcAhWbLkZq5SvvhEzRGdFGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLozZvzFTiD6Mv5+3GQUSqdn5VjSQCkuzLeNj9RshUohBPPgTA9pnTHxCJTkog5KtTpEBDoe8Q4zrSOeAJUxZBZxqT/ovTRUcZm1gGaw2tjVosSTQzLmb5GaSAQirGYmEt5V4/+aNt3oUdMuHUF9v0zEYMWSnuZoLtwgJpnSeeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Qyu/kgYd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IaS9OcaX; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 25E711140125;
	Mon, 17 Mar 2025 12:06:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 17 Mar 2025 12:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742227598;
	 x=1742313998; bh=pa+ksCuTnDtddf/P8FrweoZ2KX/mskfwkwWXLugHfHM=; b=
	Qyu/kgYd8xoCVrvDV4o8HE69nVh5RGJK/9qTPPcaAQRpV+fcojmsajk/GOsHeiB/
	M+/yiRj/LifkAj078pxyCZyYadgbFWe4BMbanmKyySgZOPye6Bj46419OfJ2Zm8F
	vW/oSQGV/B8mRuOxuWHdfPkNC7+Ld3DtGFEy4cTAsHTIBWzHLmdMYKAqHJRFiD3k
	Y05uzVVySHAhXC6wj+iQ9vPk6mT5EmUyPLkB3TQwggZGp/einzyrhtKQZ8PEuepe
	y0mhmQ15ZPGQDcjD4sczzji7wrMLBEAlHdnjPdYMP0Pgwfo/GLOFaNw935avZKu2
	6iTKHbhdqTYtyKlBHt/ynw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742227598; x=
	1742313998; bh=pa+ksCuTnDtddf/P8FrweoZ2KX/mskfwkwWXLugHfHM=; b=I
	aS9OcaXE09PeELKcnYzWbzLTGJ7WW4tfAHTxbg543yRhrT3qjr1k2huRwBuD0yWF
	EBC9I7ho9gjMVk09pQlIwcBBnpDK28wm16rgZJqwRqZvtJYctqx9C72mEY6JD4zV
	UGe0NWyAAoypxY5knR8TZswHxgXVaCL+gMXCPMlkKBJapZkupKTBLiPSk7zUJpOM
	i+mGw0iD8WAdacst/YI+o7q5nYW0Rg4DO5KC4DL5H1TgHxQ0bZpeuvd7gd/8ufnT
	n5IKuFTQxHL7G6M1Ae7q26h7jD4mJe59Zt8HqXrH5r38MnYMWQzLAhcpVPcpXMVP
	kj6+mQS9+4VOXizIFc6VQ==
X-ME-Sender: <xms:jUjYZ9miTwEbFc9gRZbXbaHZlN0M1kDnRnj-aKmq2g9qDm4kEoXfng>
    <xme:jUjYZ41oObEZh7Yaj1pufMR7Aq8z8Tq1w0H4f0q-INpAo6SO4Mb_brDZH7xxOHWY8
    eiH8355nKnslMBAIII>
X-ME-Received: <xmr:jUjYZzqKvKieZHVMBN7CY1pFzKnhtOswKWW4T4s08yILULthLMB1EORUfi_lEwSNTrHDK6EU1F4CPDHXGGviPEQ3f8aFwo8qaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehkihgvrhgrnhdrsghinhhghhgrmhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrh
    gurdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jUjYZ9li0jorVd0-d02PhtYBMCIuDmkvTFeLc7jMkttKrI55tS1T-w>
    <xmx:jUjYZ73QsppsnyRKlKGDDuJWr207NEybAl0qjnhBuYvsTBLmYCJmew>
    <xmx:jUjYZ8tKz1q5KDaRDKUUguUSP4eQFfZJDVE_47phpzwza4bckaZVCw>
    <xmx:jUjYZ_XLNldMXCKiTh825K6bQle5iOSvs9JCZ25-AAxCyv4oBugyMQ>
    <xmx:jUjYZ1pwP8oAiPoYQOMDPdrhFTeX-mbEI2h2MIGm65eiKr92xaCMd-JV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 12:06:37 -0400 (EDT)
Date: Mon, 17 Mar 2025 17:06:35 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Message-ID: <20250317160635.GA949127@ragnatech.se>
References: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
 <20250317-v4h-iif-v3-7-63aab8982b50@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317-v4h-iif-v3-7-63aab8982b50@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2025-03-17 12:56:45 +0100, Jacopo Mondi wrote:
> Add formats definition for RAW Bayer formats in vsp1_pipe.c.
> 
> 8-bits RAW Bayer pixel formats map on VSP format RGB332.
> 10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index 8e9be3ec1b4dbdad1cbe35ae3a88952f46e41343..6592513ca833175bdbfe850d61d1b5957ad27e0d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -30,10 +30,80 @@
>   */
>  
>  static const struct vsp1_format_info vsp1_video_formats[] = {
> -	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	/* Raw Bayer 8-bit: Maps on RGB332 */
> +	{ V4L2_PIX_FMT_SBGGR8, MEDIA_BUS_FMT_Y8_1X8,
> +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGBRG8, MEDIA_BUS_FMT_Y8_1X8,
> +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGRBG8, MEDIA_BUS_FMT_Y8_1X8,
> +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SRGGB8, MEDIA_BUS_FMT_Y8_1X8,
>  	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>  	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> +
> +	/* Raw Bayer 10/12/16-bit: Maps on RGB565 */

I have tested this with 10 and 12 bit bayer formats and all of them only 
need the VI6_RPF_DSWAP_P_WDS swap bit set. Setting VI6_RPF_DSWAP_P_BTS 
do not work.

I have not tested on with 16 bit as the interface I use don't support it 
but I suspect this holds true for 16 bit too.

With this fixed for at least 10 and 12,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>


> +	{ V4L2_PIX_FMT_SBGGR10, MEDIA_BUS_FMT_Y10_1X10,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> +
> +	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> +
> +	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> +
> +	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
>  	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
>  	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS,
> 
> -- 
> 2.48.1
> 

-- 
Kind Regards,
Niklas Söderlund

