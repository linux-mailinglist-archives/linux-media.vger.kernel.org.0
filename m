Return-Path: <linux-media+bounces-52245-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM94FWqBhGl/3AMAu9opvQ
	(envelope-from <linux-media+bounces-52245-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 12:39:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C8F1F73
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 12:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F864300DF4C
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 11:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C7E3AEF3E;
	Thu,  5 Feb 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFWhidw3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65A93ACF0D
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770291526; cv=none; b=UaNFRUgKeoFYz/8F2004yJgdpXzbas6yV01Fw5BWdZAUApvg3fGMaqXdYABKeDSC2kfLEWpvWsmaiSgAp2KkklCyregngXwECBKLM93cEr5B7oMiCnhrXTWl7EF6b1AlKfCk+oc8iapWtlPP6g9Ujz+h3/yxrGDcM5wKTWejrdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770291526; c=relaxed/simple;
	bh=YCBRgXntpheSH3qhf7vWlghsMl+Uf9eoyH2lNnwL6Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPnI+raWXqJzcKDnwD0oj75+8JLUDBZqsd5iUMYpOUFAmhrcc+vTglZWzpUx6RLLLkmByY/W8vochreLhmdF+NLmkEKT7RWVpPNV8XWh79iRfB/ydc1GUCXE1wOVUMqyEfm5E0WU9PnR4Nvo690KgW24+eRXkPQ5+xayIRz+A/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FFWhidw3; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-480706554beso8669755e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Feb 2026 03:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770291524; x=1770896324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQio7UUPC7rfkxVUS3pxydTe3b5fGN+2O3n+zDeskdc=;
        b=FFWhidw3qo3ELRQ0eGSRL2TeT0XzEyk1b8C4pS9f5irDvlETMVa2FYM61SxGuYFC56
         D37luqfv3yLmISp0XpJsTL7ZsiRCr6FBVDjiKhSmyOfCllV5nf52l98tbtxlBoBbkGVb
         Vz7eSnBQPmL13c7Zf5XOB/NqBuujciyyvSNfUWd8kF/UGJ/WtjwxjM6bqc1xxLh+VGdD
         td781IaAEo9ldhNrhoThoYdofPLDF8LcHeKLSrDPpTkuIjN7SL3MYdaGTTJpRhbN30Ar
         O0DdNacP2J77uYcRzu5Y1H2U3tRLyzJtjZSzZld+r06Y3xfn9Mo7Vsb8VjNanFpqeW5U
         LBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770291524; x=1770896324;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQio7UUPC7rfkxVUS3pxydTe3b5fGN+2O3n+zDeskdc=;
        b=Zeu/Qi23Lu8H0ZJQ5589wK11O2ca7agrVOGMJK8xGb+kP9CiM3bc6lhUGLoqUxuy47
         0w2KqszzCAh8MqQWJ6J+sZQihiNqFpDABfcvTLzjxPC5XwsZsbhvKpo/PlWUn3i33Ncu
         0fqepzYwLVsLxpFg8j/FeevCQH388193VsDtea6Fe6TmKZnELKsPcwiDm1ce0AfPDzKr
         u4Icy/esrKqQWeq6KfZ9icNDJhYm92KA/ZM59qlGx0p40fvCJYq7JRNA/o1KJIQmGomi
         yLWnDsipllZbq2reIeo1XUyF7gmWRBC70Q4t2OXNWK4B72iFsE43c1E8EPRrHvUHCAzg
         2AFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9/v8Yy9TIYkuT2RIUpZquWQENxnynHbP3nsE8c7EJufobHqYkLpgkAe2mnK11IqUnvxVycFux8qLhUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb/QwkIMmc9LEnVImmRFeVgRLKuKeC63wPIzxhZc6ZfVeSRaSc
	z/oXu0Fhf0Dbl6ZJrMZYPXEk00jXnW7C778RCHHZ5pLJXXbW1sU7aRwlOnTMuLTbNLg=
X-Gm-Gg: AZuq6aIwMB8OpBtTCuIxR1/cPBccVoKBl5LW/jIsnjCyg77dVcJiA1uGpAKPS2CRRCM
	1SOF/UlW9joJ6Ne4jIAds7wOcJEn/bzbPmcOzNYxLjwqEWLUXSt4MHLQ8vqGktzIez1Nmz3fssf
	qMkTS2VrZ0hH2fM0teNbeHn++ZZ3r+2bnxP245r9AN8yN1bqpaXiZqvnDFKq1AQBvQ2roUjmbOK
	42JC5eRPsmglsDJjRmkLkw+AGS98owuuXREVcDgPUgCJqIzNyb4fW+PfSzsDqCzBQiEWZMSl1c9
	PnffmB/cwNxUvdeJwqxMros041xhvMWwvSpmMMOa4vjEDbfHnNCOuMsss+RGEA3HgKykqj8fcfy
	U0riJHt3M+RkauRw/jNZJPRfCnt3hLI0m8+jaD7jmxA//XMWv7oY5i1n/lpULzuzMKTpiMFdrY5
	YGhE4gy0/8WsA1xKVG+HIRTl8FcFVfNpCiebOG0sHcpo/noqfToUnE
X-Received: by 2002:a05:600c:6290:b0:483:aa2:6bce with SMTP id 5b1f17b1804b1-4830e98629bmr83879415e9.30.1770291524032;
        Thu, 05 Feb 2026 03:38:44 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec10577sm43022975e9.0.2026.02.05.03.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 03:38:43 -0800 (PST)
Message-ID: <6974f077-ff5e-4eae-82a9-8fba10e2870e@linaro.org>
Date: Thu, 5 Feb 2026 11:38:42 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7 2/3] docs: media: document Media Maintainers
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1769511207.git.hverkuil+cisco@kernel.org>
 <74976e732f6be2964e0371c73407c9dccf755424.1769511207.git.hverkuil+cisco@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <74976e732f6be2964e0371c73407c9dccf755424.1769511207.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52245-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mess.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: BC0C8F1F73
X-Rspamd-Action: no action

On 27/01/2026 10:53, Hans Verkuil wrote:
> Document who the Media Maintainers are and what their
> responsibilities are.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>   .../media/maintainer-entry-profile.rst        | 47 +++++++++++++++++--
>   1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index be4728b97759..4f73ee073860 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -346,13 +346,54 @@ With the pull request workflow, pull requests shall use PGP-signed tags.
>   For more details about PGP signing, please read
>   Documentation/process/maintainer-pgp-guide.rst.
>   
> -Subsystem Media Maintainers
> ----------------------------
> +List of Media Maintainers
> +-------------------------
>   
> -The subsystem maintainers are:
> +The Media Maintainers listed here all have patchwork access and can
> +make Pull Requests or have commit rights.
> +
> +The Media Subsystem Maintainers are:
>     - Mauro Carvalho Chehab <mchehab@kernel.org>
>     - Hans Verkuil <hverkuil@kernel.org>
>   
> +The Media Core Maintainers are:
> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> +
> +    - ISP
> +    - sensor drivers
> +    - v4l2-async and v4l2-fwnode core frameworks
> +    - v4l2-flash-led-class core framework
> +
> +  - Mauro Carvalho Chehab <mchehab@kernel.org>
> +
> +    - DVB
> +
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +    - Media controller drivers
> +    - Core media controller framework
> +
> +  - Hans Verkuil <hverkuil@kernel.org>
> +
> +    - V4L2 drivers
> +    - V4L2 and videobuf2 core frameworks
> +    - HDMI CEC drivers
> +    - HDMI CEC core framework
> +
> +  - Sean Young <sean@mess.org>
> +
> +    - Remote Controller (infrared) drivers
> +    - Remote Controller (infrared) core framework
> +
> +The Media Driver Maintainers responsible for specific areas are:
> +  - Nicolas Dufresne <nicolas.dufresne@collabora.com>
> +
> +    - Codec drivers
> +
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +    - Qualcomm drivers
> +
>   Submit Checklist Addendum
>   -------------------------
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

