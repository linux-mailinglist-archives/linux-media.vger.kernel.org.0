Return-Path: <linux-media+bounces-60655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPUUAo9p+2miawMAu9opvQ
	(envelope-from <linux-media+bounces-60655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:17:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAA24DDF73
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F64A303C3CC
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 16:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E522B494A00;
	Wed,  6 May 2026 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqAg1DQL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A5348BD43
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084065; cv=none; b=hNHqY5r956e4zJYrSA3HE6U+FoGR1EGjiq5cMVryHnjHeW0zuQxATsJrmUEHr/lZa720zBz1Y3begHcy8N1xv0MbWxG1qnvXtAsu0Jo007MLcg5QZ9IddQYeGCSMsZwR05jJhmkIStsMTGmb2F65ewyEPjWDOTkLThJOjVZcE9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084065; c=relaxed/simple;
	bh=T+hwVHoy+/HW70H4b4ny1tz+u9z10JcY5ob6OwvauXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8xY+XBY4lHpaSbY+3fAy7gCckLudTRemWfd1zcqypDse0Ex4uRaetpv8/hRBSxiph8Z6IJKcP53NfrlYcWmmRGzpc2mZA4lWx0+fC13gb+t4iAy/GDxWu4fTj849ToObUV4WyxsJsNXSjZANFJ9Rms3JLdCvfnj7KoS2Bq9JgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqAg1DQL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dea72099eso6693686e87.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778084056; x=1778688856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpS9p5To8P4BftdAlsDaBegfX21bw2fBoqWrx1dYiXE=;
        b=oqAg1DQLyT1XmAPaltQ+v5D5NGDIUFmqL8DMIIgdEXMsXXu8D11qsPAtu7mycGuWIN
         u2jGvpcEqLaxG2CqMcsBt6HFrhfmjqQJif2P/CjuB1e2CLyomhLQ58/A/mq3aBtNC0ra
         FjL4kjdxZh9uUrx97XmXVPvgxEb2You1mx9bPwdAekIi8rnbh77547Htce3/Pm+T8af/
         4ArDZwLqL/XaEKpR9AT7GlNzyACVwwrpT49MNaVbgGO2Viku2SMFqhM4OGfTKkd3aAuL
         LMqZdQ0GKmgsiOZszGaknj/YovO8af3f65RcEoq+gAFf8t0gTMSOvEYDv3PX8huWQQdR
         rEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084056; x=1778688856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpS9p5To8P4BftdAlsDaBegfX21bw2fBoqWrx1dYiXE=;
        b=bdOZU3Fx/qIhOjTNOD31T3Jmc5cgzbTAWWYT8vIoKLblIhcLoLPF3/mwZ7vr30CRRZ
         jWQBq6/Avv3XVRS9TMj3cbTGZTPE/pG83UGIJi/IFvl8JjT4YticarfKL9zuht8O9jGD
         Xw7Z+GVPIcJmGJbhhh0LA0ZADMj+KNKP2bsAbrHQ9Agw0u0seox5tt8IcJJ+vEbH3dNz
         CoLwvtRZJ5uZMwqZ8sZSEOCyVn8RzUSPB/JjIpaj6ubbXNvORedz5U5FDwU4vqyzLSmz
         1cCcKBMs+b3y3Nvy5ctdFzrQggFfeM4YJxCiLDI5Nb2d1/BziKZ4LNMDWXdusn5u5NvT
         jUsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+x6e5SbDZtwbi3WfQvI/bj8SeMRRLpEClGnAhHqlDvQpVoBcbGLEwkqgHzdC1IYtTr0fqsNlppYx+nMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMafk8M38cMZpP/vou/alOq1wQn8a7Ebk7gWRZ9WriUuQOiRX7
	zxWAsfaf9C+tAmw5ODqP6qHQtihGo3o3jDLt7t059lT+xgSjmabOFiPG
X-Gm-Gg: AeBDietIZKPpdC7cpy5NHLfbmWiO4AZPZZNROHvOwQGELnfez6QX7B+/sz2wslIP/Mw
	C/MU5iKTRQiH9RMDmQj4kuGQuxR0qGMwB+pyyKgBofUYWiEG3ng9e0r2Pddb7zCWkG9AgbZPFF7
	9dJRskbf07fM9y5bDlPqpXyaJY4WG/rrHzxvXdM1iQLhA+PYfeRCGZuLTK3ep/RC+6frkX9SI+F
	OI5w3TzIly7116YWXGrQQSZ12UOWowSz6UZ/eSTzPW3LCNFDBeCQMhzk8ncSgPkp/7QztXsSVY6
	uanxxSywU/X7QQWaxZO5rrwXlGsia2s3r2TNTR6G3bYrhx3oiIE9WnvL177ndKC5sTkN7PMTIkI
	cjuZoXeoYIhm/zBxIAnlrypIJrnvFSedz3YmTAz6/V2/ZZY/2cwaEchzYxeAeqwcKL07anRiv1H
	RyIGbe89YwQJ12xKTOsRJPH3UjqdolttGvIvy3azwaG5G3BP9qEUuxRdUAaPOQJXsxleH2cOSVZ
	A==
X-Received: by 2002:a05:6512:308b:b0:5a8:89c5:2c0f with SMTP id 2adb3069b0e04-5a889c52e35mr1306160e87.25.1778084055726;
        Wed, 06 May 2026 09:14:15 -0700 (PDT)
Received: from [192.168.2.20] (109-252-156-195.dynamic.spd-mgts.ru. [109.252.156.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa3d540sm3844372e87.17.2026.05.06.09.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:14:14 -0700 (PDT)
Message-ID: <9af23def-ffa7-4f68-8aa1-ab080b6c1c4f@gmail.com>
Date: Wed, 6 May 2026 19:14:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: nvidia: tegra-vde: Fix iommu_map_sgtable()
 return value check
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
 <20260421-iommu_map_sgtable-return-v1-4-fb484c07d2a1@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <20260421-iommu_map_sgtable-return-v1-4-fb484c07d2a1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5FAA24DDF73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60655-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[digetx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

21.04.2026 07:02, Mikko Perttunen пишет:
> Commit "iommu: return full error code from iommu_map_sg[_atomic]()"
> changed iommu_map_sgtable() to return an ssize_t and negative values
> in error cases, rather than a size_t and a zero.
> 
> Update tegra_vde_iommu_map() to correctly check for errors from
> iommu_map_sgtable.
> 
> Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/iommu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nvidia/tegra-vde/iommu.c b/drivers/media/platform/nvidia/tegra-vde/iommu.c
> index b1d9d841d944..824d2aa80a43 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/iommu.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/iommu.c
> @@ -25,6 +25,7 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
>  	unsigned long shift;
>  	unsigned long end;
>  	dma_addr_t addr;
> +	ssize_t map_err;
>  
>  	end = vde->domain->geometry.aperture_end;
>  	size = iova_align(&vde->iova, size);
> @@ -36,11 +37,11 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
>  
>  	addr = iova_dma_addr(&vde->iova, iova);
>  
> -	size = iommu_map_sgtable(vde->domain, addr, sgt,
> -				 IOMMU_READ | IOMMU_WRITE);
> -	if (!size) {
> +	map_err = iommu_map_sgtable(vde->domain, addr, sgt,
> +				    IOMMU_READ | IOMMU_WRITE);
> +	if (map_err < 0) {
>  		__free_iova(&vde->iova, iova);
> -		return -ENXIO;
> +		return map_err;
>  	}
>  
>  	*iovap = iova;
> 

Acked-by: Dmitry Osipenko <digetx@gmail.com>

