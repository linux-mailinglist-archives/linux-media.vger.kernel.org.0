Return-Path: <linux-media+bounces-23860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 799289F90D0
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89DC518885B2
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A377F1C1F26;
	Fri, 20 Dec 2024 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JqTekvBa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ms4kjCD0"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1761ABEB7;
	Fri, 20 Dec 2024 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734692379; cv=none; b=nqS9NxHLSdo1288O1QCYgGw/cuTaJZA7Vz9heVoudWnOYr93BZtuQbxlOwm4Q5NSCHkE/hgRXUMsXHvzsiW1p4AJaQDLB0nfJwm/Kf4GjnTFF3gCdWF1oc3KwsBL6oleFYJJmlueP9pl2GaY9U7hDNTzjCNlxYe8Q7btCgwYIMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734692379; c=relaxed/simple;
	bh=wu/7LPH4E88PziyaAT+bYhhBSyvwqTmAGn8pjsjowEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEmYzMS44z4h2T5GEW4+pt/ozZU9Rongmpdl2uVaRwf5Q7Rwbv7Pg8Sr7q8zDxd8ziMrg5ei+gPXqV/8m/SpgTnx8slDBXOPhH2y298QhuECBu/3OTa9OdXZ4cAxY1hDJBdHFRsY4ROdyOD+h8CyQDeNfKdIPturx//7///pR/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JqTekvBa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ms4kjCD0; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 0883E11401CF;
	Fri, 20 Dec 2024 05:59:37 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 20 Dec 2024 05:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734692376;
	 x=1734778776; bh=67DpQfzCphjdRmBvrAMNjiOdW47kCrZYMO1bv14OmGw=; b=
	JqTekvBaxZfYhpdrgeUjltcuz75VDiEJn/37X2N5r9Umwad2IOXZLUHyu2qo+UAc
	U0P6VvNwlnznBfYEvb8yZsAhQ1P6+i2woyDPTFAJh/fXe5rf13hRVS97l9v3oh45
	s7BV1FYWq+6tdlk49h6sqBAVDHXCtPArTAoMsANI17nFRdloZyulr/wmbuBWh/2K
	4ZnR5bKF4/lLi1j/hyCRqB6rhhb9vwQBp9Nhr7KJ4AFHLGMoYJRJ8PYc9iHrqCac
	Qm1S3UhnRWFPSuFd/10n9ivDBTi0BVoFKSZUeAJspcDofoHDInMNDl3aeB8NJTmL
	s9CMR21gWG1V3z3fSjFPWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734692376; x=
	1734778776; bh=67DpQfzCphjdRmBvrAMNjiOdW47kCrZYMO1bv14OmGw=; b=m
	s4kjCD0JA6b85QPNLyfvNyWX7rWPFKWTblybML16rmcdzdNbeO54jkLBh9LxRlXg
	4DoEhkykuggr6dkeONhNXXvx75kSMyrZMfG1qWe22P0HBv366hSkdRd6TWIYWKyA
	jMjWPc8+zSv6p7RLLSKJLfRmALya14KuoB28RAoxGDw8tcmYKZ76Kbt5aCAFwu7T
	Ws0tiHytamgxXAKYwN+9QQ9ICjzzjUYwA5pxLGf2kooqeAl/IAiFy3YRkd0NYexZ
	0SRjrV1oZNtFlWb+rhWKI1IuDA3RfSFeVCPBpOqM/rJh5m6KPgfJVOeWU9JV2O7V
	KXL5N9Q8WExAAsW2oNS7g==
X-ME-Sender: <xms:GE5lZ_jNEIidwlfhINN3vVl-NGSwL6UkPdNo6CvFwEEQGYKDvPJA7Q>
    <xme:GE5lZ8CeykAFWwVdGpKGcpCx_g4I_K0U0HERllTXrj8PY-fUNUltJkzu840Fr1Ek8
    _DC5iqjQiPcwM5aFng>
X-ME-Received: <xmr:GE5lZ_FvRnHVsttLKM__bSg4qo5MTfCtKosBtrg8eGC44byljqtD5d5TBYZ7M5uXqfowZpQpcoMCDYHiu-PEuhbHtsCNfNjMOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehlrghurhgvnhhtihhurdhprghltghuseho
    shhsrdhngihprdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrd
    guvghv
X-ME-Proxy: <xmx:GE5lZ8Sbn_jUrApSsL5voZNLFNAW46Pk3460N498C3lASC0ATx_7Ag>
    <xmx:GE5lZ8wu2w7iKQX4XudcQFgsXTFp2ZAc3maRJyq_XjVW6PSaiQAa7g>
    <xmx:GE5lZy7RVMyQrkCz5DpCX2m6FOD4HrZ6aaaClpjrJm6GcpsCEGIG1A>
    <xmx:GE5lZxz2EWE5OBjIchqJVIfg6vBd-7U7pGhviF3yoeJoqUjB30Fwsg>
    <xmx:GE5lZzmhra13Q4uSJlDTpkNUhjPDA7IT6_rCkLQS4wZXpJti3feFgnI8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Dec 2024 05:59:36 -0500 (EST)
Date: Fri, 20 Dec 2024 11:59:34 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: media: max96712: fix typo
Message-ID: <20241220105934.GB3634024@ragnatech.se>
References: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
 <20241220104939.503547-2-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220104939.503547-2-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

On 2024-12-20 12:49:36 +0200, Laurentiu Palcu wrote:
> Fix a typo in VS_LOW expression.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Niklas S??derlund <niklas.soderlund+renesas@ragnatech.se>

I think your mail setup mangled my döts ;-) The Content-Type header for 
this mail is set to 'text/plain; charset="us-ascii"' while the patch is 
likely utf-8 encoded. Same in patch 3/3.

> ---
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 0751b2e048958..5228f9ec60859 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
>  	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
>  	max96712_write_bulk_value(priv, 0x1058,
> -				  (v_active + v_fp + + v_bp) * h_tot, 3);
> +				  (v_active + v_fp + v_bp) * h_tot, 3);
>  	max96712_write_bulk_value(priv, 0x105b, 0, 3);
>  	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
>  	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

