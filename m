Return-Path: <linux-media+bounces-54288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ+QM2Wxpmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:01:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3603D1EC3A2
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 777C6313CE28
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52ABF38F654;
	Tue,  3 Mar 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXDWwTpz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E9538E5E1
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531745; cv=none; b=hET9ITCWkM1gboRnLDZfbUedwZC4pAsijSWp/iMuZM12NO5ztpvYaY0o5BOdJtBeAN5lcJEkimGaPGBIYYRycDSQ09UmXCEY91NFFwQTLha6lTqhVAOqF/YIXH+YxpmrioEbERWBM/shOaHHx1GY4yAE7QaFE6ZEKpJ8Yxz8h0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531745; c=relaxed/simple;
	bh=XfEQZg8O1NwywMbwrjVuCdoCa1sFQb9IBIllLzxCgYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6vQ6eJOMOudyuc1WXLXAeXLZlgtsGjeSwFFAZmnJwksDp2FHWJIa3cPBIvOwzKG+FVlLv4vprl3m0Vyv3J6DCjkFtsvWvGNg7UmoV0EWBw5XyxReXC78KPRgZKGrdNdFvZI6qyTyJ5mVyLg7mlbqFXFZpOrfliw3wLB2unz2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXDWwTpz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48371119eacso67513515e9.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 01:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531743; x=1773136543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8b78R18+qD2EcN3iJ6PBq/vdbXQerYBeT4QKKh24O4=;
        b=xXDWwTpzcfIpZk/BnlC2pRpX1mlJiEZcQsysfzAXgw9qfjHD/Wr1Jjxrz/NbCoEs9W
         h5ZC2mOOscdUKa5Qz/NVMt4FHZk6ipS0Himoa0ZUg2QQ3hcyECe0bSwmr1QYFDcDVOrG
         GK7LjZvoNsuA6b/RzqWJQ+fFJUgmnY0jsxu+84nE+N6IvXO5jHL7riHUa7NbMuCshUHE
         dM1UyOdi8M45wGC6nhl06ZcyXUbZMls+UqTGb4eo2rc7/1g3j3ZYWgFginoKfvQrTxL2
         c6YTuZ7IVAqKjWrGaLXE3FOYM/mh21bjTsUB6tsNiFfKjua6EprUTIK61zErAeMhNqcf
         13eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531743; x=1773136543;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8b78R18+qD2EcN3iJ6PBq/vdbXQerYBeT4QKKh24O4=;
        b=H4mkNebZfCxMTEJL2S0kuSzgAjmmCOxrsEepRKz3PN99xMIXAd1gemeaWqxs8uxE9Y
         3Wdz0ABZ6yLRo9BjGapxrBleHljvJaLTUWor/KhcNVJOwMJHixDumrklgBRIMstozVpS
         DykxQQ33Whh3/cRRzOpEYVzVjGTHByZQNl+I2ct9SyX7bsZAHta4EMqbhu9npZI49xtA
         2KuuVhd3ytqxZidfKgHS857jDzPd4fefHXusGTicNYnIZsRh0L0KE1aFpzLiFMoWB4Ij
         jww4msUVgs4RBvVrqKi4HLGTThSwSACXRu2XvQ5gGOu6AMnlBgavU+TGYTOnTYNg0iVU
         LCcw==
X-Forwarded-Encrypted: i=1; AJvYcCXXReSPdtkKsQkJ1d8bTKGQ+Sp/iItk0k5Qic3OtP4Wo3j/iWNl5ORlOLpiiIU1dwS4oKuyJhFKn1xQ5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgba8UB5PHa6N3t8bz34m7Om1szUY4OGVG3Ra7wbIm6883JJGr
	hx1aEZarT9lw8CWj6IiI/xj5KbrV78iLoimZnrSDXI7sQPu+YxC4V5Mi0zFdnzKYDLc=
X-Gm-Gg: ATEYQzzpbYMvP/3ivow0wB3xZbclYBuDPTuE9CiJ4vD3CYsr+L80z1sUxUCFeckVXU5
	cOu+2diL6cosQfkYS02PBonYoXuN5n8naTN7GoYDVFyzCM1Kip+6V8TykjsVhk1QTcosGp0y58b
	WNDlEvDI/3CdD9swNcglt7BY346VXBIRrWSUy2bm5rE7a7xG1DvvExIQOxH9QDAOLaaZOyjPoJf
	Us31uLZBrDf4PAUNkjlUSBfWRf2B9cpiiSbfC8lt+eqXNc0QuHrbJKSyi0QDHTa8gU22pQ62+/T
	BelH6lQiUJGlrg7dkiHkLgDpxEGRL6XswZowsFXEOUUC2Q8AKF3VnljnNR2qxmvlgIAtJrtvpu8
	r4xTwdvD0Jv6KpIsg9XI37QnDGlK1JKB79rbQsn9PgxzO1/V8IdRytn2oUZEa5HGpH0XGnvvXCT
	ntUnAgt9ZtKknqYzSlQP17NU1aLRDGFQ7bPyMuRxPeXQGoCxXt2Lcbg89Xi6dSrB3L
X-Received: by 2002:a05:600c:8106:b0:483:afbb:a064 with SMTP id 5b1f17b1804b1-483c9bb7b7emr255369825e9.1.1772531742805;
        Tue, 03 Mar 2026 01:55:42 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485125ba6bdsm14310115e9.0.2026.03.03.01.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:55:42 -0800 (PST)
Message-ID: <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
Date: Tue, 3 Mar 2026 09:55:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3603D1EC3A2
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
	TAGGED_FROM(0.00)[bounces-54288-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> These values should improve C-PHY behaviour. Should match most recent
> Qualcomm code.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 5482fb5163e17..c612192ee727a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -225,9 +225,9 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>   /* 3 entries: 3 lanes (C-PHY) */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> -	{0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> @@ -245,9 +245,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>   	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>   
> -	{0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> @@ -265,9 +265,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>   	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>   
> -	{0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> 

Squash down and Co-developed-by

---
bod

