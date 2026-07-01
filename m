Return-Path: <linux-media+bounces-66234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5jzZNbo4RWo58woAu9opvQ
	(envelope-from <linux-media+bounces-66234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 17:56:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4849E6EF69D
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 17:56:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=sRXLRewA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66234-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66234-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8FA130891F5
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 15:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC4C48C8DB;
	Wed,  1 Jul 2026 15:53:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04CB2D5940
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 15:53:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921213; cv=none; b=oYSZ5L7m5KvPYqFY2D2oUSp85+FUx4444LhvLdenywMYjpQJs3pA9NY3SfXLgCAAAcduRnH2MdnoM0N+A8g4hTkkxvvBk8Q/vLkYc2TqSxI3ixqUFoHP01Ib6feLKE0Y73iMJX1Ua3SenLhpQfdXVfvSlRC8LQLXYKb6WIDDnkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921213; c=relaxed/simple;
	bh=W5gcoFcrKtfbOQRmfiTSBojpOsV5BPmx6vA/jpWZ35Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a50Msfcjv8P/ZcrgJ+pJRItZFTT8hyPX+fbye+CIxfnpkluNLWWnCyuGInJH6yOLlIysyLT8k8+Ww280nOsN9+gurXTmq3s4Gsa+HS7ol16Btixxh15R+3eu0NxjiHa14lF9OPm7wYBEf+OxvKFwtu4je5eiogn21+t4pwpuM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRXLRewA; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4939a809b24so7971295e9.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782921210; x=1783526010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upLoHwuqws7rrBOx3O6MmxFWpeRxrfgF8hyyVKwGdoE=;
        b=sRXLRewAcpxywLpg1fpYvOCs8BbfGI8w7bxzyV1vma0L0NnTzAbZlGY+nFzUpmz5nq
         bTGf02X0WsqjcjPU/Loxj7Ckz+6X/eS/ki+FlIvwX2EnMxfKJlktdHHvQ6t8iYJrGbyF
         2juAxahR6Xhc/2cHdL3LacMcYI3jt55uX1K6tHT+A3iySWMdlB5QmLqlQj/gsYnR4XWw
         miycVchiLl24iOMcAR6IVW4b7CoHtw722ASrYs2qE6gp+6+/Ux1YAx8AU2oqx64OSsug
         dsnrjjV7OqhfrGkejEANc6Cnk5PpGZ/r1AE2An4aIPQUfx8i0vesJcCv/u05F0dHV1wf
         X47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921210; x=1783526010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upLoHwuqws7rrBOx3O6MmxFWpeRxrfgF8hyyVKwGdoE=;
        b=TddKmaO4ewMnnrWESPyEQSkui55dKrBcNRTytDcN7DimNyIzmvuVn/OsuabeDa/GX7
         iP6Jg7ubgYtUJH/A8mUpYCuncAPvWc2hJMagr50v/3qzIaiGQITyxkqo0iQT40pgo5qO
         5EQU/Y4wFIC5R2P0E6rI/3JgyqYhTGw9W8dpvehmfRCT0EJ328QxCSuzZDqWDXex48Np
         tH0WdV8Jm9xxddgXIgYPKtXmk+S8E9z3cMQ8XVNJ8tPgsm/VdgVffS8qaGXe1c0nRYFA
         jyRtqczRatTipukQKY+uwqNmlBVFVBjn4vvogzfDaV5S6CFAALQGZfX07Tq3nJfoC6iB
         ubyg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZlCzBHWv/svX+QDetwRnJkb22u8qqUsxwzpv0qKFmegH0vDLK9AtQPfVxktf1Cwe33snebwsy2l/RzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5FGceHblfdKmHM13twIDx+B75xYHJpcaSrPzUobKmkyw7rIgD
	+mXVft/EyGobGUjFLkkjcbIqLzicmb1MlkcE7vIsTL91jACbUP1EjamkxE78rwOjQHM=
X-Gm-Gg: AfdE7cnEGEiolUJz3EaRz6IHr+Qn5/Q71XKCZcZ5M5nI4vGP7xd3pP5HhoIMR6wNqOI
	GeKTseRa3kmi3vhjNLbIyLN2nmvKAewQM0TtQ05S+wkTkhmfhdI44ee4mHl3rOz18KFm9D/ehRT
	zJfHdjQcMgEYzBYV/8viHVkY1y60MxnBTZWSeuliUbREjBarTmxPqrkwwg4FM4z3bgLzDJqPdy2
	wI4fXKr3bez/DKsCy7NaWdgfH0bto52N36Kzgxgnnh3kgJs0JlQMPeFhMY76Ruldc99RZB9EDoi
	YUhQo+1LxYKPQuoX/9icU8Sr9aZFwFa9wwTSUmL9NofjOnnwqR/zz+aEA1uPROgBw/CB3BLfGH7
	gHpqA/CJ0+WeCnMR9+sz+bFtri//StHoax/Tj+ga3oNV24njqdksF8AX3owp802g7nKsGq0VFu2
	nCHJSEysNQZH0p/2fsMKf849g=
X-Received: by 2002:a05:600c:c171:b0:493:b6e2:1b0f with SMTP id 5b1f17b1804b1-493c2b99a63mr35052815e9.33.1782921210480;
        Wed, 01 Jul 2026 08:53:30 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.66.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d8f5asm127457835e9.8.2026.07.01.08.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 08:53:29 -0700 (PDT)
Message-ID: <cdcea32f-0160-4501-9dfd-9103807c4d93@linaro.org>
Date: Wed, 1 Jul 2026 16:53:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
 <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
 <htxqjgwjczsghunsbvo44lwkadzeg2kp6wfcksf3hkmcubvs2d@cw5r67uxskvu>
 <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66234-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4849E6EF69D

On 05/06/2026 10:31, Nihal Kumar Gupta wrote:
>> Having clock-names property doesn't mean that all values are valid.
>>
> CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
> - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
> - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
> 
> In combo mode, only LN6 can be configurable as a clock lane.

This is a really excellent comment and I'm going to copy/paste the text 
entirely into the driver as a comment.

ty

---
bod

