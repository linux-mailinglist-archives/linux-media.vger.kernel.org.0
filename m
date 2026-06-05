Return-Path: <linux-media+bounces-63895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vvnLH72mImoXbgEAu9opvQ
	(envelope-from <linux-media+bounces-63895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 12:36:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92B647646
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 12:36:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Y4NuGziS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63895-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63895-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9027830AF5DD
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 10:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3791040B370;
	Fri,  5 Jun 2026 10:30:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2940B36F
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 10:30:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655427; cv=none; b=Jkl1fhYDEOnhOffIx+VvFL1eS1jfxCVlR/5wnQDfRVxmS8pReYyHvXu18g20yTsoTfY3yvBoki+zv7jKDl3uUJNzGH6PhxwrcZaTJWQaq32KcbAmYcFmWcc6e3xXRVAe2MuvH3nMUcktZ99mZqAhOHuobZ0JU7KtsokZr1iGWzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655427; c=relaxed/simple;
	bh=gnS8iRTedo9sLWcRxLMg15lZgLFIOaXZiTRitU221LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/gCVczmyQ1wf0e1quVSjUekr88Q6TrYRGSvx9BAhbnXDhKyN1UyckUz55iEs1ARCxsNGOD84qzBtldkq1rJjNZ9pKANPq8HkbaZcoPidVhNyoN4K3eG+L0s+j+Y3tew4kfAlrEg23J8ZtmTNJTi0EOWqPqCCWSjZy8P7s+Xt5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y4NuGziS; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso3447994a12.1
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780655424; x=1781260224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0KPVu9xlZpg9ZdiY7RZ3Kuoe5dMqAtDeJAk4rvD4TuY=;
        b=Y4NuGziSZTd03acHFiarntfV/G7Rprv34WsD0NKPje0O1n1Cw7vvGX3EDgDMjr8qyp
         SJp80SDGMabrgaAyYZmBIRk+V2+PVVMcYAs/RIUKfXOi6jR7Ke6+ORxe2gRnYNlbTS6y
         2neN0CFItu2Zi546iBEH7JfGuzHNDjE4Yousi2WFPs0V59HE8qFyvQWp3bTNthfJtF9v
         N3YmLXHjlkKf0T4RcjsHw0yC7UuhtZVjRV+GMTwTCJV6DsMunxLdJTE0n67EwEI41mKd
         Gkq97NDeqP/+TsnkbZ6ebdPDrrCfQKjwHElubmoNQLQReS6klrNOOTOZ0enBR9MBua+u
         Wjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780655424; x=1781260224;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KPVu9xlZpg9ZdiY7RZ3Kuoe5dMqAtDeJAk4rvD4TuY=;
        b=oC6rlbbGboJjgI6l50Q8gCHHKUKFOlyJf4fu+i1/4BzwwqFtVzX3GVzSQjKJ/yqz/1
         wssHucLwGAzGAgZtGru9oLl6qI4N/aJlEyNDztoVYu4oJrQGYPMe6KG8NCU92FJA9EkN
         12BIbRBlPcDoh4dtOO/JS9DHJEl7qt7eNm8qEzqQ/tuNWkgp8amj5W0ZhMtEn0SlvXLD
         TJSqcdVBbRujo8mtrIp5jJ9rnnxsI+7dO1Q4lUSPmjBtetPaNkxQc8MfEZYr3OXKhKfv
         CEIJlDbbKkjwFVh41t+7OHiuHXpPEkW92Pesb3xZsOeyzbbbrUPIqYEQ1WBYaOke+0SG
         pIGA==
X-Forwarded-Encrypted: i=1; AFNElJ8lEbrRU7dTc8f1pTw4owHMYRWRznL9/uiCq3oohxMEL5LfNo1IdOnwuAL6cUX3FgiB1ultetDWyRZLxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKXxt00fN1eSpqvGfL7x9vtkFv1+Ar/N369gwkoz00s8B16Eu
	3u0GCqJYtr8cOHE61Fqqpr4wE0N1To2f5IhTYEzCA5B0e0MKiUO3kCJwKeXyH4cO2vE=
X-Gm-Gg: Acq92OFfX0rplk4sDvTYaN3L+ZXJ4NvarYKDhi3NiBdK3eMEKY9LcijX9NoyUryrprB
	P5zoJoZMnHx0THhKjGZ0itl+05NBqI8/Y/O8q2XYxC/P2bK3+MaeZxifnG+xUilrNUKQ77TGxeU
	gF+Vdcc6/bqpfGObd1J5jHfB8M0JVRecs53zXvRYxJVVXGGwPeKPLhU1vqCu92MVImCUZCVRvKG
	w2M1ZlNf1Qegxx0w93uHZdzURoMhUmeaKdHLb1gGJBWICSxVxqt3eSaDe4W/f/sLTDO4XHIythj
	g+tssNNBZIImpJgXD+y+lK2DC20d11BgEYubRLLF6YZkDL5CJwgVsEzdm5ivNdvkJyR3ePGLJIX
	N1VyOtx5KAUCxWXAVIYgdH3jSVs16Ht/Z6/R0Blh7+LEv1MUWo3/YHhel/MRXez+vwzbFQVzZbo
	Rkqg0AnDrVD6rMFTH2JaqCpKKfv4VD3HZ7uv+jVeXyMGSf
X-Received: by 2002:a17:907:7b82:b0:bd2:bd3:1ef8 with SMTP id a640c23a62f3a-bf372d28df7mr147592166b.35.1780655424300;
        Fri, 05 Jun 2026 03:30:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.32.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055303fc6sm446486166b.42.2026.06.05.03.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 03:30:23 -0700 (PDT)
Message-ID: <33989515-322d-4189-bf84-1d62a0c2d294@linaro.org>
Date: Fri, 5 Jun 2026 11:30:22 +0100
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63895-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F92B647646

On 05/06/2026 10:31, Nihal Kumar Gupta wrote:
>> Having clock-names property doesn't mean that all values are valid.
>>
> CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
> - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
> - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
> 
> In combo mode, only LN6 can be configurable as a clock lane.
> 
> The lane-enable computation in phy_qcom_mipi_csi2_lanes_enable() uses
> BIT(data[i].pos) directly, assuming physical bit positions <0 2 4 6>,
> but the DT [1] uses conventional indices <0 1 2 3>, producing 0x8F
> instead of the correct 0xD5.
> 
> This goes unnoticed because the wrong value is immediately overwritten by the
> hardcoded 0xD5 in lane_regs_x1e80100, making the dynamic computation effectively dead.
> 
> Could you please fix the driver to map logical lane indices, consistent with the gen2 camss convention.
> 
> [1]https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi- 
> v3-5-1d5a9306116a@linaro.org

That's great, thank you for sharing this information, it moves us from 
"I think" to "the documentation says"

---
bod

