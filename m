Return-Path: <linux-media+bounces-29089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F838A76FF6
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 23:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0349168112
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 21:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F8421C188;
	Mon, 31 Mar 2025 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gWrFEaiD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FBgJSrPo"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C197189F56;
	Mon, 31 Mar 2025 21:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743455613; cv=none; b=aINpSGwSlW9Jh7kC/UOGwszmJgV5vaSdrVxCGMGQq5NVyHfF91JYwQeKWrQrl5c5tPpr3mZoAHa+ksIOvnm+w0c/3NiQeTtMAZq6zqgOOvlDEuK4MDTfXY0qRj0UVaW52kjWkT1noHY+5d6wa46vpmDoAYkmi/wgeGAhuah8Xiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743455613; c=relaxed/simple;
	bh=F1YikHRXUSSHRhz2d6p0uniSRuNAg/hbswSJp4j6w/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQNJGNOMryqUdNu7CdcLX0cAwgYD2VFUlwGyqbtKJklc3ifLh7GbAe6oAEscpmxJn1kK8QBT4NoUUp+s/OKqe3qpd6wCrQucYDgfI4kABGOgAbqS2GeVerfZBNlpZQxeNBGB8qJkVVjZlBS4p0vIoJNuoVSGu41uPNOcmG1rW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gWrFEaiD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FBgJSrPo; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EFDBA11401F6;
	Mon, 31 Mar 2025 17:13:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Mon, 31 Mar 2025 17:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743455610;
	 x=1743542010; bh=iG61YoYfBsUHoXvyDbXxE5zBVIGZRgRxOozAF7+tnC4=; b=
	gWrFEaiDbekocnNrpbiPbVUWnCeOD610Ww2EdCKwcX7hHYHvxJicqFSJn0zYmyp1
	OcutYFCEXbVExn1V2usTDoGE/o28MtQlhUcmuKgBBiMCnHmlTVOKyTixqR9Bq+Tk
	8pZx/UqBcf2hgSK/g8DShaUGCDtJ2zBx03PKLG2JDniFT6e7iOW6Nd8/ScI0YVKw
	J/Wkta/cfk9iUfHwsGwuEJRWWtcBEeKR9CjSBQ803GCGfqCfSa7B5alm0lj/zh9b
	zsnYgeFip5VlKrTRr4qMn6aTA0UPeZ9qgIXthuYfaTP84vegoL2/LcksD8JO43xu
	vhtSGNiYeKe0DgLe1kHR2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743455610; x=
	1743542010; bh=iG61YoYfBsUHoXvyDbXxE5zBVIGZRgRxOozAF7+tnC4=; b=F
	BgJSrPoJs7Ok60bRIwBkdi5CHE9XqTKO0JizNQ8KFYHzO5sqLJtQ6IGrs8ZQeYW6
	yT2yUNeLaB2h/RdEQ4pXsDr2B8njYvnDCYyD8VFm4LE+4nAEl4m1OUUxrgJY4jvT
	kiKO9sb9wezBRKPwBmtEiYK9l+jAfRcqRSh/NRGmiJbc0qJczYfY24jF4J19nPkU
	SRHHSid3to/2MG2XNbwUOhfzpZ2HJRlZkKIZ9Miz/kPAuVF6VKHRQP2g/LwD7KNQ
	gzeh5A5xbp/lgqZtB6ta9chQ/N/dUecCYMEdTCRPGd9xEozbzS6UAgWKgm6X3FLY
	vStzqNfSWBXt8bLIr+qKA==
X-ME-Sender: <xms:egXrZ9XFpJ0pomNCTYGGlnF7Tb5Gk0uNp3dZk2j0MjpQkNHhizkzBA>
    <xme:egXrZ9m1N4cSS5byW72mN03N-mi7_5L8xO431HV992LjvKAAQd6TLbWa_O3oRoeuU
    22N1c_rxktI0PQZbN8>
X-ME-Received: <xmr:egXrZ5a7hWkxtpYL3imCVukAqmuTf00TKu1U0OMmFFz9Ros8QafpDgB-lOEDNFBZybap-wBrWKvZXk7Ed4-krYHmK49yx7VaRw>
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
X-ME-Proxy: <xmx:egXrZwUPpVt6PAhk1jDApteSrnz4CaJIQShWOGweiyY7vatI2No5KQ>
    <xmx:egXrZ3mnpbsgWhwOAwr3eulDq4Cf376KQaOos4K2PFBnGFgiy3zEPQ>
    <xmx:egXrZ9egcYzFH61zEciIGRFaKqsjezlHB6yQoqYPku_riz_b0fzXJA>
    <xmx:egXrZxE3tA1N79AMeJ0Zoi0VQV7i4J7TTyqZ-IAsri9EfL2X59-WDQ>
    <xmx:egXrZ1VoTn1J0ccLueGsTvgmX1cVs6s5d9HkEbP72BJnzMABlCXUS868>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 17:13:30 -0400 (EDT)
Date: Mon, 31 Mar 2025 23:13:28 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 1/3] media: rcar-vin: Add RCAR_GEN4 model value
Message-ID: <20250331211328.GB1240431@ragnatech.se>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
 <20250324-rcar-fix-raw-v1-1-ae56c1c7a2f6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324-rcar-fix-raw-v1-1-ae56c1c7a2f6@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2025-03-24 13:48:52 +0200, Tomi Valkeinen wrote:
> Currently Gen4 VINs are marked as RCAN_GEN3 models. Add a new enum
> value, RCAR_GEN4, and use it for Gen4 VINs. No functional changes in
> this patch.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 8 ++++----
>  drivers/media/platform/renesas/rcar-vin/rcar-vin.h  | 1 +
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index ddfb18e6e7a4..88989c5fe636 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1275,7 +1275,7 @@ static const struct rvin_info rcar_info_r8a77995 = {
>  };
>  
>  static const struct rvin_info rcar_info_gen4 = {
> -	.model = RCAR_GEN3,
> +	.model = RCAR_GEN4,
>  	.use_mc = true,
>  	.use_isp = true,
>  	.nv12 = true,
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 8de871240440..972ae2cb3314 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -803,7 +803,7 @@ static int rvin_setup(struct rvin_dev *vin)
>  	}
>  
>  	/* Make sure input interface and input format is valid. */
> -	if (vin->info->model == RCAR_GEN3) {
> +	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) {
>  		switch (vnmc & VNMC_INF_MASK) {
>  		case VNMC_INF_YUV8_BT656:
>  		case VNMC_INF_YUV10_BT656:
> @@ -826,7 +826,7 @@ static int rvin_setup(struct rvin_dev *vin)
>  	}
>  
>  	/* Enable VSYNC Field Toggle mode after one VSYNC input */
> -	if (vin->info->model == RCAR_GEN3)
> +	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4)
>  		dmr2 = VNDMR2_FTEV;
>  	else
>  		dmr2 = VNDMR2_FTEV | VNDMR2_VLV(1);
> @@ -926,7 +926,7 @@ static int rvin_setup(struct rvin_dev *vin)
>  		if (input_is_yuv == output_is_yuv)
>  			vnmc |= VNMC_BPS;
>  
> -		if (vin->info->model == RCAR_GEN3) {
> +		if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) {
>  			/* Select between CSI-2 and parallel input */
>  			if (vin->is_csi)
>  				vnmc &= ~VNMC_DPINE;
> @@ -1351,7 +1351,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  
>  	if (rvin_scaler_needed(vin)) {
>  		/* Gen3 can't scale NV12 */
> -		if (vin->info->model == RCAR_GEN3 &&
> +		if ((vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) &&
>  		    vin->format.pixelformat == V4L2_PIX_FMT_NV12)
>  			return -EPIPE;
>  
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index f87d4bc9e53e..34bbd1343bf6 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -39,6 +39,7 @@ enum model_id {
>  	RCAR_M1,
>  	RCAR_GEN2,
>  	RCAR_GEN3,
> +	RCAR_GEN4,
>  };
>  
>  enum rvin_csi_id {
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

