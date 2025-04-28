Return-Path: <linux-media+bounces-31240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A5A9FD72
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 01:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2194F16E5B8
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 23:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30512144BE;
	Mon, 28 Apr 2025 23:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="zOjEFB+y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gv58ap/X"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE702116F1;
	Mon, 28 Apr 2025 23:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881381; cv=none; b=HG65zF4AdEKyby44epGXlkozY1qKc0iYw01pWuOvZCE3h0ADcgRlQvVWzAfWmYr/F/IyFNfNslXfAj8u9fWop/JroLSh7v4PGqufngwTdhCsSB9ZfM4mjFARtueXDAOKXk3Sv9EsSqv6cnOkpTVkZwzXGktfJFrcspGFFW+++n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881381; c=relaxed/simple;
	bh=LszMF9yMBxNG7JCcGD/N4gsf3hsOEmKIFhJ25HyTnBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTtdVPIWFFZ33s920Uwzd6SN6pzVizKEbfRbW6dyqhtzn0aeC7GExWCoMr7Agy14s7rdxfaH7b99M0rh9g0kLzX1HIH4GM6CwJaHZ+CFc3b2TCz2EHHQZ/uG8vvQHb49eiCanQjOlKmWtAg8J6m1MNNJsI5i8WEXhyTvyGIIMaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=zOjEFB+y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gv58ap/X; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0165911401DD;
	Mon, 28 Apr 2025 19:02:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 28 Apr 2025 19:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745881377;
	 x=1745967777; bh=XuYxPCr5YHAbKb27yTXUyW+0JSv1PboMTLgYCJXOjjY=; b=
	zOjEFB+ym3k25m+FnQdcMbyIjgAj/Ab67LeBkIkcVSpKNeez+yKjF/fo7V17FoeN
	zPS/qp7sS7XLdM73SKrNtOkN/SsQzryuMzvDvIL8kSSK/ffEX4yRSj7C0kNlgasY
	UkZW9egQKZaZlkNgF78lp1/NcjukKtv9oUX6ajDYW7dc5Raztduqr4ohWrxVmeap
	XXdbFdwfqmoBfEtGAQxgNRo+R2BbLyeDREOP1uOZ/X9/A1WwD21wa4yvSd3WUAbf
	Og7uzFnLhdReYj/kPPXKr+fDPxs8vc7Az/ow+4fwBFc8Iz4AcPz29Ba36yQ3aSfr
	qGxy+8wgjC+hqgZXgwau+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745881377; x=
	1745967777; bh=XuYxPCr5YHAbKb27yTXUyW+0JSv1PboMTLgYCJXOjjY=; b=G
	v58ap/X2x90DEy2spdY2BR6hNbPgeTH2q1AyXwTpNPIuvTPiShxddSc4FQeor3Re
	ZEsyxJnhVUI5JTinx7B+k6LenG9Qs8RQwy4tlRUdLKtlej4jXakG3qaWjqE8HBx1
	dtjOACqfC/rLX/7Yccgo8K9S8AdL66MIbylsDOe8Je22gWN25mENARzcgjsLdgZs
	nW11W3JZLFFgMyLVg+oSbR0Nnb/8Q4OEOxEcgvDg8gN3znlB25wsVDDgIDEpw1s/
	QzDEGznFMypMNy9RZYBGyeWO20/OYMYr6mIs29hELfXNEkrrrAWXkZkiL1JdMa0i
	l3SiyuoP+lA5IzrcWKpFQ==
X-ME-Sender: <xms:IQkQaDEzk1cXIobz0XBlNY6lbbrfYYMUyuUEKaiHJU2-v5Sd08ucJg>
    <xme:IQkQaAXuzIDUnACqvDfehHE630qnzG0b8s38w4sNP2g3t-Afh7WLP3hZYPICpsGfF
    9GOz8dWjIe5e1XTY-g>
X-ME-Received: <xmr:IQkQaFIuFq9t6ZXrMZWOZXaiGirtEdf2iEyw3f9qLr-BcRm1yKzN4A5j7SP1BD1h18_dF9YBqmTrf-rd0eV1d9GhZo0HbVAMTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedvvdduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:IQkQaBHRio7lAF3CdVg9e1AY0BYZlUr2IvdXUQD4zF_to6dsaMePIg>
    <xmx:IQkQaJUO4B7NoTi2XCvbZqL742gWuVfKBsquLmzS_0tAzsUmpzRzFg>
    <xmx:IQkQaMOvwpoNMyzw6-JM-74noUJCbhheoeND8mkq4oCezKW0mjPnjA>
    <xmx:IQkQaI2ZL2MZUbTQeJLJUQBnG_BNef4QT_oINT4wkA7Q9r2eMyhzAQ>
    <xmx:IQkQaHjKb50VgXz1pmM2BsehPEp7bmUI0-WB_wF6-MTKH51d3OrGg_vc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Apr 2025 19:02:56 -0400 (EDT)
Date: Tue, 29 Apr 2025 01:02:54 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 2/4] media: rcar-vin: Remove unnecessary checks
Message-ID: <20250428230254.GC1969140@ragnatech.se>
References: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
 <20250424-rcar-fix-raw-v2-2-f6afca378124@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-rcar-fix-raw-v2-2-f6afca378124@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2025-04-24 10:05:34 +0300, Tomi Valkeinen wrote:
> Remove unnecessary checks wrt. formats and interfaces in rvin_setup().
> The validity of the formats has already been checked earlier.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 23 ----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 972ae2cb3314..0b5077e2e989 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -802,29 +802,6 @@ static int rvin_setup(struct rvin_dev *vin)
>  		break;
>  	}
>  
> -	/* Make sure input interface and input format is valid. */
> -	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) {
> -		switch (vnmc & VNMC_INF_MASK) {
> -		case VNMC_INF_YUV8_BT656:
> -		case VNMC_INF_YUV10_BT656:
> -		case VNMC_INF_YUV16:
> -		case VNMC_INF_RGB666:
> -			if (vin->is_csi) {
> -				vin_err(vin, "Invalid setting in MIPI CSI2\n");
> -				return -EINVAL;
> -			}
> -			break;
> -		case VNMC_INF_RAW8:
> -			if (!vin->is_csi) {
> -				vin_err(vin, "Invalid setting in Digital Pins\n");
> -				return -EINVAL;
> -			}
> -			break;
> -		default:
> -			break;
> -		}
> -	}
> -
>  	/* Enable VSYNC Field Toggle mode after one VSYNC input */
>  	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4)
>  		dmr2 = VNDMR2_FTEV;
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

