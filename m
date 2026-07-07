Return-Path: <linux-media+bounces-66870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xACmGFEjTWq2vgEAu9opvQ
	(envelope-from <linux-media+bounces-66870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 18:03:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6E671D9ED
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 18:03:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=VoVvfp55;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66870-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66870-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6F6B300D78F
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 15:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326BE4302EE;
	Tue,  7 Jul 2026 15:49:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF28426403
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 15:49:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439386; cv=none; b=Dim7Y7lMo+v3VUV5QmFpWW1X1lgVwfzZ36k+sAGRRmYmt3HyouaGPQ0dVEAdMD+iVK4CFXkV/pyMOJret/C7L5F2QSKfoBdbtbdmSk3vVz8mliB7ADQZx4pwTSqLF5w/7OpOKKNXQugAlGRSlHWgp8n2h1l3lrFmbhMZh5kWu5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439386; c=relaxed/simple;
	bh=BqX/raJZq/M+26MMxkIWhMYO1ENqNToaygyKe2/Aq0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPIztDeuRmZnhAxvpKFrebPqoD7Z6ZN5sXD5S4Lmn9iBnEgEWQ23xqRzb4nI8/d7FR8c0fIpYmo32n1uxHQhAdeGcxODmTurwz5BZiNAJrWWqAYvbGlumGZfO6Tci1+n3aZWhJtdG6Hwhs0UNa8Jcl6mKIivsrzCzjf6zz3mUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VoVvfp55; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47d70879764so1858757f8f.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783439383; x=1784044183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yoBSGIBvFJoYUlGX0ow4ClOW7y5+xBVzJYsazX/Ju4I=;
        b=VoVvfp55/g7v1m0zkRi9e+J3LCUCLk310UH4aO6cV62pJ25Fao6IGJJUsxs8fZ+7q2
         GYlVgl6axMQpP1DDD/sLudWX+XkqjlRfXlaIlv98ZWjUAozkmd78J70Q8Np7glbxzQ5G
         PRwKUA2HEDAq06fQxk2mSSa4MJk5mizX/LowPJJYrOr/u5xXlWvW2WOXAQuSGvBDlDvX
         W02TqwlDnOjFmdwRNgGfz/JTqjoO4dOloqkeisDBmG/8fumvxokdcGxN/0/B1VMIyglt
         NNkY0is45TT3lxum5edDjz6o+vY5GtYh+pRJac16vl798e6bMBCdmjaK6AA3TaFcq/lS
         6ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783439383; x=1784044183;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoBSGIBvFJoYUlGX0ow4ClOW7y5+xBVzJYsazX/Ju4I=;
        b=sL6AiSq3Bd3hG5YIAiLwBPCVVShZh6GNrBg/nvxbvunB9TOtzcS5/J5lgjWQQwVNBk
         TtV8uCCyRo5Avh/sDp8dfEXDjNwAyg/e5gMDBCgnfGZDa/bQ0l1ohqKeaz6JHgDVHXEw
         G0vWZmn4mGxgOhdAFpX7p/xjw6qv+ybLic+u1fwqK4u5GmyWyTJcrTolqiX7lgYtdarJ
         T73WOySd3sJfFqLaJCOppg6mgdJGgt0F9HjCEt5HiWL7L66GY2g9tpvMRrFiNLyf4cvV
         O2g/AOMy6vGo78Xe4opj9Gzk/Sy/QxP8pb5AeThM3ooSCrZ9oceMpryRhgxLMTInM4CQ
         aVxg==
X-Forwarded-Encrypted: i=1; AHgh+RrQrACU7dKgzrDBMk1D6gNe6YwfaXNkAkknGwyIpankurWCdYiA11qqPIcIMc9HdmGgwy3AtwgFVPVceQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQADD1tAgs1myWH+LjkgTuEjFIEuAYmBi29YvIF8iZpvYEFMeT
	v+vh/eg+txaGQAl3imwz1tiIonbCqOtXrI7XJ2t6yobaXDpvbMgF8+hvpkJ0lAOefgI=
X-Gm-Gg: AfdE7cl4VSQ6PlR96UAPqNtG/D2e8Pbz/dNbcuNMmazv4FHRxJOFZ9QgBp3kuxZN1ki
	6MkPaBCZq9F+3tlafg+XGR6ES48VpayKCK/kfxW7DL1ZJ5u+axM8iPttU/C99qSdNrG+hsZULO5
	sJD/TgXGCGEzg+/taWRlg8LTNiByG31bG2gJwCPspt5SqOaO9WlpuMLTG+nK6nglA4uAtQdQGPF
	beQ73+gq1TgdZTFoqaLXhyEhYdmccjARJKkp4u3GjQFTjAIWd9vqPL+G//EHNP0EYRjodnKopU/
	AUBFJM9H3jplXmboimD8PM0qpKrhQvofvrN6Pd1FnlarHyCYdXW2iC+dyIUNICxnq2IiggSnrYU
	XKPmlRZyCNpHOS3DuURyFMhzbNRs4rIGGqOtkvk1Ob1XHIJbvUOeu6hSGzNwn0ali8ragHNiced
	/hubSrgljeUBHYLF3OMuF5GN0H
X-Received: by 2002:a5d:5089:0:b0:46f:398e:f31 with SMTP id ffacd0b85a97d-47de665b35amr5095812f8f.20.1783439382700;
        Tue, 07 Jul 2026 08:49:42 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm35170317f8f.22.2026.07.07.08.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:49:42 -0700 (PDT)
Message-ID: <85940a25-4897-4983-a328-89b328fbf1e0@linaro.org>
Date: Tue, 7 Jul 2026 16:49:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@nxsw.ie>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
 <4a2c098f-5d46-4339-9b09-e0ace37e4052@nxsw.ie>
 <w6imdnlo3xron3f2cw7fq5jtwcgvyijciddxjftwf46kltjjqx@inipxbghzngc>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <w6imdnlo3xron3f2cw7fq5jtwcgvyijciddxjftwf46kltjjqx@inipxbghzngc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66870-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bod@nxsw.ie,m:bod.linux@nxsw.ie,m:gjorgji.rosikopulos@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C6E671D9ED

On 07/07/2026 14:22, Dmitry Baryshkov wrote:
>> * compat="camss-bus"
> You can't change compat. There is no separate "camss bus". We have camss
> block on, say, Hamoa. Or Glymur. Or CoolPlatform. This would mean
> exactly qcom,x1e80100-camss, qcom,glymur-camss, etc.
> 
> Then, a part of that camss device we have all the IFE, PHY, JPEG and
> other blocks. Each of them having a separate compat, etc.
> 
> But, there is no "camss-bus" (okay, there is a camnoc, but it is not
> represented as such in DT).

Well, perhaps we don't churn the compat, or we add a new one.

TBD

---
bod

