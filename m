Return-Path: <linux-media+bounces-34228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D362AD018B
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B60653B1712
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 11:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA1F2882CE;
	Fri,  6 Jun 2025 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MMw7BfyR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K3+TCF/3"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0C2874F5;
	Fri,  6 Jun 2025 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211127; cv=none; b=A7mSivEmsORm/u9zFsxAMqyYaDyiRPVNwJZh+RSG8Gip1Gq/OgInHiRiPUVZlkXIhI/l2VNl2sVBL2iH1SNs4Zq4uZrCEmaQKpeDCkHg3LL/8GnhedT3xnF1ktP+uUoO3UT6jO+QIDZof3dpSdQur4OvpiNTdd0cCbVQ5ouhKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211127; c=relaxed/simple;
	bh=Z1dpV55199JgVLJKDh9KRdgp3ZzvqYnyGpUneFrV/4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrWehDpmmk5A8I7UO2pQRzAAYMCHsuRyMCZ7KwmTPqkb1hqJaWZKMBoZRNK/57aPv9Q0h0KGqaRg9efgXjn3LTQCVxqGdETGXbzOtBqpXs/1fujQ8+CIAoVvwhaJi/foO8mFuw0Qs3BYQCo64q5qnIUGtOYMc4zme92Ns6qugIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MMw7BfyR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K3+TCF/3; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4C6DB25400F8;
	Fri,  6 Jun 2025 07:58:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 06 Jun 2025 07:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749211124;
	 x=1749297524; bh=Ywkaob1+268n6S7xuxwr0QBKYG0NurisG9wGzUWJyDY=; b=
	MMw7BfyRlYQCfH74yMPbHG/bxHaY8mhbfpPITyQ9X/E0hDo0G5Ua00UGgIigmMIm
	ODU503IWobpQ23PtHBoFOqnafp55AVa+Vg17zMNGHMKTZiG3pa1nCVB/hOkVn1Cz
	F8pwStuOUH3tFMXrMIzDbgQSveP/OaPTNJNJHR6SiOHcNIx6MBvVyNz4O0cV7anL
	pBxVXv4cm4Prkgh7L4cGCEj4WKI4IyOpn87zjfr/z+XdeoNfEydk9kcpoA5S2WhB
	2TqETcauo912fbg7Cf97fci0hGh1weQpTiqcMAF5372vuJSyJf00Pqtx8AN7Iz0y
	eVs0ng15jjZE63b+8vVANw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749211124; x=
	1749297524; bh=Ywkaob1+268n6S7xuxwr0QBKYG0NurisG9wGzUWJyDY=; b=K
	3+TCF/3x2gS2dz/6+2XtoaC3Y5vZVErMJVhVFH5k+WXWiDja/SQJ2uLkKDRiKIvh
	az1qw4tWYV/hdIvWJCLbDbfMrojSluqtt6AR0F7jWSPfzI+FnCCI0oEq3q7oqGel
	+YA9PtWCBC3R2/xwn1x30OSdi+gDkLsYUiU3TB5HeRyk+zePTA9m70QGsYTKnVZX
	uptgEhlzlWq2FOQtUEBiMq6FfQVQzLyfbvd+R43UrV40HrM1KwJBSFB1buh1bPAF
	/AvoK4LYp+JhD//GUyZc2rUrPMii+i94YXaJC8ZcO3W1KV9IFkWe19A+4l59Pvqy
	J+ai1Cxihx3RtVTW9YoHA==
X-ME-Sender: <xms:9NdCaAUavr_xZZ9WJvdU5H0FSLD-5Ut2py8NLbMCGCq2e5nG3qaThQ>
    <xme:9NdCaEmu4wky7TYf3FpsqgdJG4Duxjnjuxbn2DcF4EIRGf7Wl8EmJ59cmDAeO3--Z
    4xaTC14tXOCs6Y45e0>
X-ME-Received: <xmr:9NdCaEYjM7XjtQ38fBeNw997EMYYsrT4_rn_xn3Ijk49e41B03Z6JdU0-0J5fdlnuJWVOxFAHJwoLeN0fFr_3WE2vFhkFFX2rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhh
    grsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehl
    ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghs
    qdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgr
    sgdohhhurgifvghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrd
    hpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgr
    tghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:9NdCaPVU4pXkcx6sh1d3yKcrDY7yBK2KeI9SC-oW7a0V8li_hpPSeA>
    <xmx:9NdCaKkO0i3crsgUioz3ImeWpE6GVRrDrTMiGtOExDr9q9REqDQgkA>
    <xmx:9NdCaEewTs62_9rZSoWTqXJwPa5aiPcg0612-2LsCARqK80tQsdXJw>
    <xmx:9NdCaMFp8g85Sjr3rVm6DZhE2eSQZEgyVa0b0ovP-V23wMdO7MLJ8g>
    <xmx:9NdCaG_IGTZrLx4WzxjQRGzPjGyY15a8dsotTclj-z4AepNRosu6uvRo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 07:58:43 -0400 (EDT)
Date: Fri, 6 Jun 2025 13:58:42 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 02/15] media: rcar-isp: Improve
 ISPPROCMODE_DT_PROC_MODE_VC
Message-ID: <20250606115842.GA2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-2-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-2-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2025-05-30 16:50:31 +0300, Tomi Valkeinen wrote:
> Instead of having four macros for ISPPROCMODE_DT_PROC_MODE_VC[0123](pm),
> have just one ISPPROCMODE_DT_PROC_MODE_VCn(vc, pm).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 1eb29a0b774a..8fb2cc3b5650 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -28,10 +28,7 @@
>  #define ISPSTART_STOP					0x0000
>  
>  #define ISPPROCMODE_DT_REG(n)				(0x1100 + (0x4 * (n)))
> -#define ISPPROCMODE_DT_PROC_MODE_VC3(pm)		(((pm) & 0x3f) << 24)
> -#define ISPPROCMODE_DT_PROC_MODE_VC2(pm)		(((pm) & 0x3f) << 16)
> -#define ISPPROCMODE_DT_PROC_MODE_VC1(pm)		(((pm) & 0x3f) << 8)
> -#define ISPPROCMODE_DT_PROC_MODE_VC0(pm)		((pm) & 0x3f)
> +#define ISPPROCMODE_DT_PROC_MODE_VCn(vc, pm)		(((pm) & 0x3f) << (8 * (vc)))
>  
>  #define ISPCS_FILTER_ID_CH_REG(n)			(0x3000 + (0x0100 * (n)))
>  
> @@ -263,10 +260,10 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  
>  	/* Setup processing method. */
>  	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
> -		      ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
> +		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
>  
>  	/* Start ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

