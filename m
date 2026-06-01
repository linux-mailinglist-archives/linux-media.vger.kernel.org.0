Return-Path: <linux-media+bounces-63270-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECFSMWyWHWoXcgkAu9opvQ
	(envelope-from <linux-media+bounces-63270-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:25:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F1C620D35
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F2D2302E2C9
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 14:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5447C3B8BCB;
	Mon,  1 Jun 2026 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1vJM7tB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B03B8BD8
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323337; cv=none; b=lyL3GoBxlliW9AlPwynOVwoYuZ+kdsXH3JzyCvfWE+U1nIqcLX1wo8b2GSMKfSENCGrro2OK0ibE91kZRZFZlDmiK2oKBiQy7N3FGpRaB5LP3Wu077iJItDFDQcRFF01YyADlJllWj/xqbSN57l1/u53lyCQvorTNM7+uSLyIKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323337; c=relaxed/simple;
	bh=IxB7Fd79A3gZ1r/a8Cr3tbT307HV68s4njAYnRINXlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hA6mFNzh6+WtvrkjYvFTewABRVnKUainaCpWdp2yvy6SnS4oEh5L3pId2cQmgIs3Ll0m1dD0UlGj3XGHxcpwkeZVtTQenYB1SZdbzQnUKQWIloLRUqX3Ov/+vYU2pnVmxCDBi95ZzJzOSwaf4+RnY1iDqvKIcIPVST6RBx3TewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1vJM7tB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so1904281f8f.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780323335; x=1780928135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=;
        b=k1vJM7tBtva4X1Eo4pUIcjiPrNX/aL/a48xSdtVgurZlbveyp9kTVF9eG0QiOYn680
         Cbh8OkJHXi+D8D2Ts6lpLB/ncxDzo5kzXJgvH5LGoEocqFfWf/omi9252A7HAopwBl1c
         08OFY0NG/zPCCpIZ7Z8tCKKM12Zmd+yBNpDBH6t0hvu+CL5+Wy0j/PohhGHyRTYvI2UA
         bv/P9AjjhOOi2s1M379z2rrOTdKttYlDCavlOgnGDDrbeW9jUBI6cKOn8c8G6QNNIz57
         SuJZXa6D092R/pnlJP6LGzZEz+Ren9BSfsCaFlWtctwVi7OUl8ovinbDayrGc/x8gna0
         O11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323335; x=1780928135;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=;
        b=L0psAY4rwhMq0GxkQOVrYqXMnNJXPCQx3o9bNax5Ee2bobIPm8K7N9oD9QbC9L4ago
         vQqlk0jZ5JsqM4QsI/EoCHc4Q9lhv1AIIV7NNhgIa39L8zrHWY1igWBI18AKHxfjoDnR
         g70IF+s8T7nXnZDWReiGYWN0DFnjxPzG1fNCsFtN9vIiixR2wlV+1oqa7Ag/jFv9/RPq
         JSX8FgCg3tFHRnSK7Zk64fnIeJmXwBiH+zCzw5I9GspM1XeztpxhRV6MEgq2lj+Gg+uA
         l890Iv9uFHiloF7S7A8c/pJfLMZPbeSg4M8XlKku3MZ6eAs9mX3svTgT+5T+0ZeORfum
         7tsg==
X-Forwarded-Encrypted: i=1; AFNElJ+hrLATYaFicSL9WfG6P7t/Gy3fqF3gR9p4dIJmVOkXhKtMg5LEOrHviXOCDRZ7/aqa+ns2B3WkchhcPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/R7bvNKCKsYaADf370f3chgokle9RL+s9Xe4ztjTwzIQWiGW
	H59KC+3qLhvAQF2Lgra3z51ARc0eG0l2KAhJxYRNoEsSsqLqjrNksA0QP5/I54gHvlY=
X-Gm-Gg: Acq92OEnQF5l+BGLFqWF5EYSO8Ad/IGV+xwIdIaKF8ncEtFLG2dc2v0okI19/kjA5Ax
	7BReCtRxG/49xhwrYD6Jph+bTpMcOdpT1jHLC0KvL52+QYXBcZdJ+vIS/hrF2RavdF1e2Z0a37c
	CBm8lLVV7N6bJ35eznx5KbzX/PAuWOsJLfrlYzHyR0DidvCovEQIOp+/Rk9cVqJMhUBN8RyMGko
	6Wd8Mx53JE6Ej17l4R7KLHuE7Fzd7PARsUi5ykvDSafKdh2CnMZJA9R873gwq50cyJ99rPLmEdw
	TLFkdU2TLvOTpqWzs1uxT5WchA/7LYIh+4Nseyhq1BFpR0uXrHPXbJ764ESM/XArcyFJI6sFYxD
	JEcFXMIIGpqQQ/XDDl/ItzM3JZne/ivqZpPHAyNE/y39MnAUQhnB1bVT7hzSB87Nith/Vdy9yoj
	/cDecLwPgg/cCniuvTqDS5J4kCvPZcCEmc++aoTt/mqJ7KGWa0oM8vUyYJ
X-Received: by 2002:a05:6000:4610:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-45ef6b670e1mr21405913f8f.26.1780323334783;
        Mon, 01 Jun 2026 07:15:34 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm27847640f8f.9.2026.06.01.07.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:15:33 -0700 (PDT)
Message-ID: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
Date: Mon, 1 Jun 2026 15:15:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
 <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-63270-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 09F1C620D35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> Here is the full IOMMU SID list for both platforms:
> Agatti (QCM2290):
> - 0x0400 0x00 — VFE non-protected
> - 0x0800 0x00 — CDM non-protected
> - 0x0820 0x00 — OPE read non-protected
> - 0x0840 0x00 — OPE write non-protected
> 
> Shikra:
> - 0x0400 0x00 — VFE non-protected
> - 0x0600 0x00 — CDM non-protected
> - 0x0620 0x00 — OPE read non-protected
> - 0x0640 0x00 — OPE write non-protected

What this tells me is that the Agatti binding is incorrect for addition 
of OPE as a separate device.

> Only VFE SID (0x0400) is shared between the two platforms.

Both platforms have the same IOMMU list, its just that you are 
correcting a bug in Agatti's defintion.

Again only IFE SIDs should be included in CAMSS...

> The current Shikra submission enumerates only the VFE SID.

Great, this is what we want.

I think for future submissions we need to be commenting, naming, 
something each IOMMU entry as we have a problem now in Agatti and a 
legacy problem - already - in VIDC as a result of misallocated IOMMU 
entries.
> Should CDM and OPE each get a separate YAML binding like [1], or
> should both be part of the CAMSS YAML binding? If part of CAMSS,
> please confirm and we will add their SIDs in the DTS in the next revision.
> [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/

Yes I think CDM should be a standalone block and BTW use standard DMA 
APIs with its own IOMMU entry.

Similarly so OPE.

The CAMSS node should only contain the IFE SIDs.

So, actually I think your IOMMU defintion is correct but Agatti is not.

Sigh.

---
bod

