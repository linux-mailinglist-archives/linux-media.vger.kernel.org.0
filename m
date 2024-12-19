Return-Path: <linux-media+bounces-23811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 852109F8156
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 523E01621FA
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAB51D7E41;
	Thu, 19 Dec 2024 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QOP2kb7Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fZKLMjs4"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C06D1A23A3;
	Thu, 19 Dec 2024 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627986; cv=none; b=lZ1pgESjf3cz375/1yNIPfFUiG17jjUGZ6Kfif1WddDMY0G3BEfeYp0YLoKlL3a1dRGBURQa01A0a6W+fpdli35IP03MaVGptKXAJcF+p9ivIMm9jz/EUl8tX8WtJZaAwLGdazNV0WrRZejqNaHOoL7zW0yXdVc2trfc9WVwhng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627986; c=relaxed/simple;
	bh=t/EcBHAqfkrnEKb6LG04R//r7a+uNB51wNvmxDf0j0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPN1vfxqkyWRHSvAHJOW4usHvIsgiVThxYbfh8A957sJGfOHQQR7UDQqhOc/LY5ze2NpqPB+uSDTMehaVGeGOY/8qfwpb2SicmuUp6QqrdNcmNmOayTPbeRAsSpk3jVjZngRnQdr5na8822EsN+hJso4W98bgvAxam5UutLAu9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QOP2kb7Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fZKLMjs4; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2101F25400FF;
	Thu, 19 Dec 2024 12:06:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 19 Dec 2024 12:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1734627981;
	 x=1734714381; bh=KEGJABDIZBRnKwBdvJqhB+BSVr0/3cbzIPdCUP+vBQY=; b=
	QOP2kb7YBo1Zk9ydjrLzBsq684Ix5hbaXZ0Q9tcO7Fr2mwB25Mo2XCO5pkLDLNjD
	GWx4CfrwS1WY3KgX8A5brdgW0pSpXYu28BgL6akiSUyc2Bfvc56uYHfiJfPNMBHn
	fJdjk9NDw6LxM3Kp1In8mkVjsDeBt45HmNNBzOBRWDo6YPDkvsbinRJjoMU5hKZZ
	RfO7jP/lozMG30Kk/D5KiPmvtZHJEQg+3qfb05P0iI7mnGKztlRWQZg2Usg3Kgam
	c5aZHHvLYNL3i7tQr8Cnr43/Ykx23YPQDa2t50onMohhv4JKdex02ZecJdeyln9p
	5+wJPnXMIkkHbGGUq5yZFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734627981; x=
	1734714381; bh=KEGJABDIZBRnKwBdvJqhB+BSVr0/3cbzIPdCUP+vBQY=; b=f
	ZKLMjs4xY8eYnwFlUvYpuCYNtgEjHHU3iruQdfokrRrgw4/wor+UwZ4n2qwdcdyU
	ewVOEUinrV6YRgEDdXwui2M1XvkaFV87ZkJJhLV6JlnNmdLA5JtWbwJLZJiH1JXT
	Ii487I9G7sgyJfrgbLT5RScuiiCSs/GU/5TEKFFoFibhInqW7+siQyZjWtaAhByW
	Nugs5848n17igHPY/1ljNzTioIexNAR+1Q5GCIzYuuKBjSUiSxR+eg/VlikTMoIk
	wTJ6RoTVqdg0dIKcY6h6k8V13ZxqiKLFtzp5TNSo9PNl6qB2Q4kuYTFdPYJwFABm
	qF+1X+XRbu00H65jg5b5A==
X-ME-Sender: <xms:jVJkZ0LLXNC16dBfjMKZXxQsUbWhPnUaorFmZFO0Qr7sgtEnDy8J6w>
    <xme:jVJkZ0Lz7fpJRK55cJkWzt6jwbD_PjNAlK4aXLEelU231m3Rkaf7CsuEo1Pk-NsWz
    d9fcZ8Zx0kfTwmKilY>
X-ME-Received: <xmr:jVJkZ0s3FhSNSlHzxUnBQO69Cz7BTVtcM8OAtDk4BiI_xh5ALK3wacF8Gy5PiC1cJzQqB_dbEKIjo05BMFjkG02T8uJXtPbDXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgleegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:jVJkZxZZKsu4eQ5p_USUY4nK2eSpXDqmY4VRkPW03WT9vsEKxk8pUw>
    <xmx:jVJkZ7Z2nf1oYbSogUiO3vzDfDEpscJCmh8kdC-Ab76AzXkIFERhrQ>
    <xmx:jVJkZ9CrYTkVJYaqwtxV4U2BmQYXCfeW3PjDCXSnG-2-_idtxklHKw>
    <xmx:jVJkZxaZUGXfjZTCW7rE1kepEY5AXQosAvkMi2s-o925b2gqyDtQ1Q>
    <xmx:jVJkZwOFeybHppHIUQVjgALMKApvKV67JNTd_GyHHcSbxs97NF7ZvMFC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 12:06:20 -0500 (EST)
Date: Thu, 19 Dec 2024 18:06:18 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] staging: media: max96712: fix typo
Message-ID: <20241219170618.GB3377144@ragnatech.se>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
 <20241219150644.64507-2-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241219150644.64507-2-laurentiu.palcu@oss.nxp.com>

Hello Laurentiu,

Thanks for your work.

On 2024-12-19 17:06:41 +0200, Laurentiu Palcu wrote:
> Fix a typo in VS_LOW expression.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
> 2.44.1
> 

-- 
Kind Regards,
Niklas Söderlund

