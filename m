Return-Path: <linux-media+bounces-53733-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDa4EDe8oWmswAQAu9opvQ
	(envelope-from <linux-media+bounces-53733-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:45:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F41BA301
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D544D3174C7D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F310A43E9CF;
	Fri, 27 Feb 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4zSXWb5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A243635F
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206944; cv=none; b=pJoVEIG4HOcZvMYfATjyg55ELdQMQrvYZ4Y0RV/LcTNAlwoywwRcp3UMCXOOrv4FFgNvELIfCOLJ53qt0IaAyDLj4zwak2Mv0Erqv3JLGlIOpWaML/16S6bImx5PVYS5+fE7+7nxQ/BQoFK2X/o478iEKXjlwN6QyTK64eQ7CSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206944; c=relaxed/simple;
	bh=xHYW3p+5GVfDn8x6oFMyWCK6CrLKRkNsDbg87Yl2z8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Olr1X7YZZgEz7cbDADy6eyPjwOkPQUs5hqbIATz4wYRV6UO/zddKVTGyWWegIgnU/FEpvDXrB5psNS9pMIAfHxy+CGog/NKuFhpDvZRQZaO56WmQaQ56ewtD73c3J/60eT4V8CwxB/CCn/Uji/yYACHg7R0sHzvtphsKGHHFC7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4zSXWb5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48069a48629so23570905e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 07:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772206941; x=1772811741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wzqme1k+Wy+/3yspGSINYIH3f7UH5wA3CsIMcq2UIg=;
        b=o4zSXWb5oeEIvPb4mrMDF6IKH/xoKT74sKzJM0PTHy2wGFz3fFja40UDgCZtZf+ZTP
         lRSI79c0+6QQcEquu8o+F05cYoM/tAVGEQhAvvTMWHKos/fAjoxX7E+c7NQRKiapMS2/
         dc0X1cNUof8Voy9tbrrarcEKxx3+icaDKouZi8INrbOs3Oo6GqXmBq5DbSAqgFiNv8UB
         hMxQdi2aF93KtCfssdyfLyyIcE3O2XoyXrBEyJZAVH1xOOfr5lKb4RGo/xQzR+zLZYz9
         NU2j7rvyqRL3GJAiyBWfisiCZI9EyxHVTCtiTkMy2VaZ67sVC7ASHuT5ct5Ci39GaJ+v
         088Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206941; x=1772811741;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wzqme1k+Wy+/3yspGSINYIH3f7UH5wA3CsIMcq2UIg=;
        b=HwIPFaFEPr+LQpkurF7AjQ4uy0p0G2hkqk8pid3FfAW5BwY0TkqysGP3BJQG/YLBs1
         Xt/JwWPWUPiotsXN+fFu+HIqWE4e8TJuy1S9vAfdAoEoJIIj/OC8vpRkJUc53WEgpq1h
         w3CPr5o9L8aSaK26Alfs0v+SxuWRULuf8/SS+GuSI2GQ4I1ytspw3FONgJnR4rCho6JD
         85L/wezw2EKkQr/GF09MTLZCqLUV8m5JEtng5fLn9S48wuTgY9d/m/4jSe4YpXSGIcgO
         60XNy3A+/wZsnRC+AQdoYhT8nh2VIU/ilyDeia2nDV41ArdGBb9iMYd6GOAkuKS2lHqr
         L5aA==
X-Forwarded-Encrypted: i=1; AJvYcCXHTpTpjQtfesTzFor9RwtkjDIO+pyLdRqOi3qtmUkRoA5qc3h/yw9askVCmVzXVrAiX/8KKWtOFQW8mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygmlk+rPwTKgRhHfoSALmaFhYQz6+fyR+kW6ZmJE0lsjfVhBGN
	nVJfDhqusAmaGygCcbkpv9YCFCZu5uI6SaxK7S5G94krt7i07TcL5PCBRpBEtdY+n4s=
X-Gm-Gg: ATEYQzx9bcSW6WysxTyJuQG79yPdAn7EjGbLcrqlwpR9r8AKRD2gUpXzlQa/6KAOLVz
	FbQ4o9JjZa5XXPOoiTMPq7SbtGaHu8M6VsUVOTfHnvedmbOBNny/529zB+bmOQEH2K0BVbkvXlJ
	AUe7tTDwPqcbogq3ZMoCRWXClokY0OEmOzstv+Dp2oGw1hfXx7Yg7f1sZDTvTO401SGzFuV+FpL
	43U7URHYIAq63RU0Uh7g3LSa0ROmwEo0ibEZ8LMl8cRTLVA8uq/kvgWaC6erUYJx6S2tpRTjrTK
	bWk8lzd1vx59/mzmKkip1Y0gTdstbideIvijmWCoqDz3FzWs29JID1TkIkFsI1zhgbfJ+cij79A
	yyarp77lvuUWgVQNnQEo27RnuVlEuJSWKW110loG/pmTsLx8/o+7Nba1FqZG/d87s+Q1N+yrmG/
	95OVcWjeUPjyXTJs+uIq/wc+z8sqTH4ujCAGD3E/M1/YQK71zKjakVf7HCTVPfM3Uq
X-Received: by 2002:a05:600c:c4a6:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-483c9bc0344mr52202975e9.12.1772206940611;
        Fri, 27 Feb 2026 07:42:20 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm83821705e9.5.2026.02.27.07.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 07:42:20 -0800 (PST)
Message-ID: <c84f0e40-50d9-4c99-92dd-00bcfc554d83@linaro.org>
Date: Fri, 27 Feb 2026 15:42:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: iris: add support for kaanapali platform
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53733-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A89F41BA301
X-Rspamd-Action: no action

On 27/02/2026 14:11, Vikash Garodia wrote:
> Qualcomm kaanapali platform have a newer generation of video IP iris4.
> The hardware have evolved mostly with respect to higher number of power
> domains as well as multiple clock sources.
> 
> Considering iris as a client driver, it adds the handling for multiple
> stream ids from VPU via iommu-map.
> 
> This series is depend on the below series:
> https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/
> 
> Following patches were dropped in v2, as per the comments, and would
> be posted separately. This series depends on these patches for
> functionality.
> - https://lore.kernel.org/all/20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/
> 
> Patch #4 is also posted alongwith below series. If the other series is
> picked earlier, then this patch can be dropped from this series.
> https://lore.kernel.org/all/20260227-iris_sc7280_gen2_support-v2-1-7e5b13d26542@oss.qualcomm.com/

For the record this series is blocked on this:

https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/ 


---
bod

