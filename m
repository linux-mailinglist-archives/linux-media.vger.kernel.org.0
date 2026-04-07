Return-Path: <linux-media+bounces-58160-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIIDJTrC1GmWwwcAu9opvQ
	(envelope-from <linux-media+bounces-58160-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 10:37:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 451593AB6EC
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 10:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EFAE300BC83
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 08:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542C039A04C;
	Tue,  7 Apr 2026 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcrAyvSx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7A921256C
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551010; cv=none; b=BWJf4mjxonK2lGRDW8bll7KkxkdmzuSfONkWo4K9MhCGkOgye3gPzGnmT2fcVNZUdkRz6aDg/H6Vw9yWCduLS7Z0ze34fEeKazC/n1D6heOKc1wCwaC0AYzamRfhR2oEjpmVmozlwFhF7Nb3BAmAtHDCTdX5UMPPzPjE8PDhgSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551010; c=relaxed/simple;
	bh=coAssiB5s3BHcWfufm9xuM2t6aLsl0hqzz+I47rZLP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9jO1fKntu3XLFxSVYZqZ1y6lYOQFJYH+BNmG3bBeW8pMZv0KeVoJudmbIGHw5r5YtGSgpoSryxKtkaQ1xZDVNSJ/C8xwSY4B7+QgfGeWo8gzBBp7vEIEbBYSS9ua50sPY1OcPITQofnQUMen2jxGoHwRRaaJ9Ytb2cL80W6oMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcrAyvSx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so6336679a12.1
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775551005; x=1776155805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvIQyuVRFxWn/kbN1SCbK2vfu2qTJKpKKyKCht1EX/8=;
        b=rcrAyvSxW2RhUEG6eAhKqZ+AetYohKd4TcfyjmLsD+RWjFbtBP3tovmpskAOQqYKMX
         v6kRZTd4aAuQeetOcxD8rQYMiwptbE+z8+64EQIPiV4alf2gS+0Z7lSy01Pem+db9V4h
         IHU8m+t9OBJlMO9N/41g7mCEg9p7SDJxS18hVElLIHWXiFYF4XkupGrzLheRQaRMVwZ3
         jLscwxgT0KFbJ2lcrXIp4L3fZjI/Z0HwIt+TTcROsfrSsj0tve+SfQicum6li20uSYb2
         D2X3b5t6Zpl6s3WCDPFOtez+zTE6M2GEUuqj5GhxBb71fM0KFIxoTWSIZudyQRd0eIlC
         OLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551005; x=1776155805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvIQyuVRFxWn/kbN1SCbK2vfu2qTJKpKKyKCht1EX/8=;
        b=GgFyGsDOg9PiZY1RvO8V2PKYHfD3qIpdTDk40AGF/EuntE2/S8mV7FOAVTFrw8KWZC
         C8b82A+8bIaWPI99wOPkOzDGmq8cSwJl7didH6s29iJs1SdYaYjDStwn4jmOtISoCaXx
         Y57w/6ncIVM7QHwOOFnszQgTu6KaccCUZ9GOm3oBdYz0hiofR+8FC9Cc9rcF4lB7ludq
         2uDt0PviiU0tLyhz+amX8FtgDC4a6fzwotZW9htmbFfLhrSzAZcAsRP5dB5jD19bDVk+
         aDLU2deprnfAlj2v/sVFIY4D9Dm4Bd00rrvvRBnmMFyCRZDA4+XRQ8VcCG3eXXENta+P
         WcBg==
X-Forwarded-Encrypted: i=1; AJvYcCW5J4nErpZ00lDfigsTodmGa/puuY5e7MLbpf0GCQt8hN9fKHGT4v7fSWeG7DkFjORdkaAhKIPZNfOE7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBKE9h8Nb+sBv29FRNYXKodDSONRCctA8Fq7yCYsOLry+VmsO
	vTHgkg7PaSj+fKu7QsyddSEn0GAtMw7/eOdoz9x/0miyImixFyhuJeNPAuRkyz7udfI=
X-Gm-Gg: AeBDietqNku1qVxQ4v4aIOu22pg0zg9tij6k+18c9pkvY7ZN9yRbrP1GMVAzDNeEItu
	DQ/7vL/2tppis0iRLFaEERlkC4FBNch24M3YYp1PMEmxh/cAdzeGN0/UCpIOkumtVgOT3sy4j71
	67xujpPUW+QmNXf+7MZ/crhcwrAAhyi7pLrxdn/PJYKSAkFjf7S3legz87YaXJzLdBOPF2oowpI
	qXUlcMzIxyLK5HPqpVuByWMKBkyzZq4/Z2hdoriicSFAhui8DOuItt625jTFAv2D3iormYLFbJr
	kpx2fPOT9NYO8tL/DNox0a96lwpD3sXLmRy9YSDx4evr8nUD0QN48IUoaCo8r5Q6ZCYxobIlm9j
	tv8ql+/vISamCDK1ldB0hMvNwQ3c2Uod82DqouTGyduhkkDAxuUvbH1tsFeHt7UhD0z3HndhmIe
	Imz2LTrkxPaSgBZ1IgLLwOSsmIgWNI+xBjyHq26WqUR453DIM5/HOhLTUZsXvCTHYuf8FMAoqnO
	HPcyJtzhxTIpCv+mJ2b2b6I7pTOwftvE/r1VKy/ab8BKL7iEn/KErr1msS00qbkt6lS8rodRYWu
	E49sLgPnPWe5ug==
X-Received: by 2002:a05:6402:26c8:b0:66e:714a:f6ad with SMTP id 4fb4d7f45d1cf-66e714afb89mr5429021a12.9.1775551004633;
        Tue, 07 Apr 2026 01:36:44 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4110570a12.16.2026.04.07.01.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 01:36:43 -0700 (PDT)
Message-ID: <5812c794-fd2c-4b49-8146-db6a1c783706@linaro.org>
Date: Tue, 7 Apr 2026 09:36:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: qcom: camss: Fix RDI streaming for various
 CSIDs
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Gjorgji Rosikopulos
 <quic_grosikop@quicinc.com>, Milen Mitkov <quic_mmitkov@quicinc.com>,
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
 <CAFEp6-2BMaT+u0cAJnZNCaxbiNGCayYs5uMr13AEe2iWWZZxzQ@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-2BMaT+u0cAJnZNCaxbiNGCayYs5uMr13AEe2iWWZZxzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-58160-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 451593AB6EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 09:16, Loic Poulain wrote:
> I agree with the observation and conclusion that proper PORT and VC
> support is needed. However, as things stand today, this mechanism is
> also a convenient API for leveraging different virtual channels.
> Concretely, if you want to receive data from both VC0 and VC1, you can
> simply use RDI0 and RDI1. Changing this behavior would effectively
> break that usage model, leaving us only able to retrieve VC0 data,
> which feels like a regression to me. The more compelling use case, in
> my view, is the ability to stream different VCs in parallel, rather
> than streaming VC0 multiple times?
> 
> This then brings us to the Pix interface, where streaming something
> like VC3 does not really make sense. In the current csid-340 series
> [1], I therefore took a simpler approach/workaround of forcing the
> main channel (VC0) for the Pix interface.
> 
> [1]https://lore.kernel.org/linux-media/20260313131750.187518-4- 
> loic.poulain@oss.qualcomm.com

I thought about that however, there are no upstream sensors driving more 
than once VC right now.

So this really is a bugfix. You can even see it in the original commit 
message for this feature, imx412 was used in the example but imx412 
doesn't support multiple VCs.

This is a pure bugfix and now that you draw my attention to it, I think 
you should update your series.

I guess this explains the indexing stuff I was nagging you about.

---
bod

