Return-Path: <linux-media+bounces-58939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJBeOxIV4WnoogAAu9opvQ
	(envelope-from <linux-media+bounces-58939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:57:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B44122EA
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8864A306D1DB
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489D131D730;
	Thu, 16 Apr 2026 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/MrKT6O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8F30BF66
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358658; cv=none; b=E22LCMq1CqhXTtnfAvjE+xjrgwcqlo3cFGLij+1lCQSCAmEdHTmuM94Gpqnoe0QY30OHIhivqa2A+0A0x77GUsIFopXv0z2LLgjTStQRcdhMeTl4YsQTANmEGt2hCCNVjL6PLM3++XCXAdt63528mPIJ1v25ybZRg5VT/qpWjn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358658; c=relaxed/simple;
	bh=ZQzEC9KPPF/hi8gDo0hur4Qe56bygpOXxw15KXDnxAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df+8v7BJITrmnmMTG5MFhwhC0rj9vYm5bDv3nZhXRG01xt+gMIXdyMh4Eqt4YmHPqswlC+C3LrbtxcGwG9BRa3P9IdCF9HnS/RXqeEwmEjS01J/FYDJ+dpQljlB64iuXYAG+csmvoAVYIhCjlhwxv9NZ1XQtYbJ/Apypm1uBeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/MrKT6O; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38def541b0bso70613171fa.1
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358655; x=1776963455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwdYD3XnjJtBgOU3arfJQiqPM7dBusbX3FMwNNhUQFc=;
        b=A/MrKT6O9oD6Gfu2xmuZDFlnBZTe9Jk/sv7bT4sc+7K4ZbAgwuGa56iA95WpWk8z/Y
         E+v2A/H73A1sI0mubI0GSwIcVMuBIZMtaUT/l+FHqTR+g51zKNqsWM4oUriPaUtzNB1a
         2PCDLQnOpAQbDbBiacp3laaM0SHVGtMUPhPosJWmuN5Z3s6CzLSAM2cQ4t6i9VdWqKoN
         IikH+pcAqGOKGLZOPVqs7U2kZ6WVzyQb8rVJF4EDMKOAF4j5XOp6zYwQj75u0LZFRwMm
         PbhdwrTPJZAsuYiq76tTuuj28EInyGiKeNwbr022Kae5Nd+0NIYQBP8gjE6eav+5FgtK
         ehUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358655; x=1776963455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwdYD3XnjJtBgOU3arfJQiqPM7dBusbX3FMwNNhUQFc=;
        b=DR9hwcVKlzSAtruEKGoA9mgV9Gby4nEDi+3+lgqaUDamNlw9x/QBHIJCn2GUotUMkf
         j27Jd2zavzkVKJGaTJKQod+77jpES4BHWcMnpVrZ3KHocZ2FvrDGRHx5BpRxl+syW6Oe
         O8gooc/bjrUt+VaCR9BZSGEbXtFr1iWwHKAab5PigXbzvDghecyNk3e5Pwouj7W2m0hA
         cFKzmnldEMSNoZ1A77LtCe4AJ5YjKmY5i34GcGhnKYRVOCq4G9fM7bc8OxAWsxHvMEYs
         40dyLeWNoZYqodSTgfTRXfqEW2U+JsuFX+yAedHNvbTb8KqQ3LXjUncD+mh2ziLaFENz
         Ynsg==
X-Gm-Message-State: AOJu0YzIKrnOPgOpRvpvTKWVg2vAKUTZfBpstXuFDoqJC3fReAi2lYnn
	taeyVdpAE99sb5pBgubm6sbkMEYmo/ZmBBj22dOCn0jhVsZFFLX8S6hX
X-Gm-Gg: AeBDieuFqx2V5L/o1RDesVvS27o+rgWze33NADWyUL9P0+s9juP/KE6+numbiyOc3Wz
	WatLSIUNa38ePJjgS05Qpi3ZLJPQpI2DbD2Q5tEP5ixdquoil+JIhC12vPChmpFtCIxhdpNabJa
	DHxxbp3Ow07fyB6/GXIl6BdEit/feQTDjVHlR4bkqfHNMrv05DV1izUcJhaLIOZrVe2R5r7949z
	gpUAc8rVvLFtQlCiXszyZA8vjfWQi7hYrSqWALYM0POR1jZPk4j6i0n5BK9ddys5sDPz4K6bL7Y
	U9N6eNXOygJAAi9/84ZEhLHUxwsMAy9+y11cn4wsR6ca/YU29bH4wZBY3n++s/Ap7xFKHId3Lvf
	+QbLhuerU1nM7cUI7DAAUYvbWs7W0EOikTrCl2wKz6XxvxRMPgCcRjqYkP7FQjgt0E8YSvUItnG
	kTDWVBAOCq8Ne4n4m+wtMrKGa1OJloiJB/XAOzuo9q3X6mxoDA8cNf70QyiuUpvV2m
X-Received: by 2002:a05:651c:985:b0:38e:21bb:b2dc with SMTP id 38308e7fff4ca-38e4bf67cd6mr84783971fa.32.1776358654514;
        Thu, 16 Apr 2026 09:57:34 -0700 (PDT)
Received: from [10.29.244.82] (m-37-0-167-201.cust.tele2.lt. [37.0.167.201])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ec6b35dsm12269011fa.37.2026.04.16.09.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 09:57:33 -0700 (PDT)
Message-ID: <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
Date: Thu, 16 Apr 2026 19:57:30 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58939-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E9B44122EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
>> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> index 90e966242720..231a3e9c1929 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> @@ -267,6 +267,14 @@ &usb_hs_phy {
>>  	extcon = <&usb_id>;
>>  };
>>  
>> +&venus {
>> +	status = "okay";
> 
> You need a firmware path here

When I tested Venus on my device, it loaded without one specified -
msm-firmware-loader creates a symbolic link from modem partition for
firmware. Additionally, none of the MSM8916 devices seem to include a
firmware name. Has something changed since then?

> Konrad


