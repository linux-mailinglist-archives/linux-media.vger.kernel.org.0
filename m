Return-Path: <linux-media+bounces-59825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILsHIpuK8GloUgEAu9opvQ
	(envelope-from <linux-media+bounces-59825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:23:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD0482849
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51BFE31D2624
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D8D3DA5C6;
	Tue, 28 Apr 2026 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSlZWNwQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38663DA5C4
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369678; cv=none; b=tdLFsvtOKSWwkyEI0U0h6j1uMHmMzhTCv3AXlZixRtiKgy3i3AZr1dJKqwnvwG9HkAGhGLqfEr3tIU0IabMPhK21F5hkiA16weLpIOxngb4PooGZIkOVx4RZfU7pTPjfIdT+FNLpR5e6InK/4W63JSc4X+/eXR0fLzrASgBpTaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369678; c=relaxed/simple;
	bh=1s3zoV2UGzWKIUYJTiOORY7/gFXs9hQgskCHHMAdMIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq1qRnWmQJiQqtF7SMfMQqmN/jQOMc5mN1YWI6zmp4liqkfxyD/ulPXgfpTPSg3JMEPKpYs3OJyhRAGHuWhIzuH5ICtT2mD3vlZeJYYkzKlXnV+7kgVYjuQwirYiM0PpSWRUgxSgX3AN4qcDjaA1196UIpGstW8PTrWSVUVTntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSlZWNwQ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7986e0553bdso106951657b3.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369676; x=1777974476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFFNaiD3e7rjmKA/oxd0MaN/8EMgqV0cx8JEjl2p0DY=;
        b=mSlZWNwQJhFV/Fta0Lg/DZspuHEowSRFzPDwB5YmB5YVvlCAobHaXdF2dMXrkVWmP6
         g/xKyD7V5BQGr552oP0MAIuwWQfwJoG9l10wUOIwUFYKhaNsShE5/s0dKwohHJguCsJJ
         SaQSHThhsxyLIMGA9L/nHHsLdPmQk8+3q5BOLbtbjWvfF8IXN1rEZfl96Hm7lEkjQk2f
         al+hSdabIBvT8pt/HNoUplH9jag9EHBf8X3Gdm8IQTbZXNOq6Zhi1ntyPYG9Dqevsace
         7d/ggnsUba3izdMo5U6t7Zby1ZQp4PteeSMbrhIUiXX8sGTaDi72bG9LYssP2Ats5Heo
         DTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369676; x=1777974476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFFNaiD3e7rjmKA/oxd0MaN/8EMgqV0cx8JEjl2p0DY=;
        b=AH1NVbzith4cvpDxntBwf15ca3c2kzPFFrf3e7NTso8wwvJZN4xb7By+cTfDruNVuS
         4rLU+FlouzwJcaXz06ow15/2HkJpteSHZfaXQt3fpUPvLHhqfXh/XDwW+ykOy9tbS7TU
         DfFK6V3VuP/bTchSJmJbLXW1eAF+ne4UIJWDUyHuK+1a4kyhJ3Uty0gsgY+blOQrimOI
         xHd3wYNx0zLibbXdewjV/MET3Txr6/0eJUz855zpKGulLQacmhQgSXblGijPUcTWJt5d
         sAEdqNUamClyG3VANcZMq6yDPAaB63WWoOnFCl2UmxCrsa+WdagGPDfciUNSN31LP3Ms
         Bxeg==
X-Gm-Message-State: AOJu0YyNRirb0w+mrP80TLYlGHaIQUJglp+MCEmsEV0tkCVlgYFeogJa
	Sq3aD/JGFUwAdfXVxwBz+Xxzp4M05pY5Cv+UdiFkNm6+cepraTFbaSHh
X-Gm-Gg: AeBDieviUUnJAYck0hAU3rny0RLzm+28jUpfHsw2T172CP7siFztrUJHeeRnT+TrlDu
	jLuUY7SyDzTowLu22qqxeonyVWlxlDYygzkN+SuNdwgAk4mMPckjQIHDeeoAxntKr96L7ybPAzc
	boNcGMSDzifsxvgqNxFH/vRJbFR/b+/A6I+fqU1eEOOWGPbhWLwGVKEKq2/IJjU+PFt1mwnADXz
	Rs9DUwngXAn0krI5dI2OwWUvbyco8iclPGRAYbue6rEYrYLvKBekjl5aSEcsXAgF3Pw84/svJHc
	LTx2OrIX0s4iyKjo9J8qG0Hvr8Cfy4U6TcXZkVJbCY1t4lLSppIjFvRiMPDtHiFyQJVn2nO9xCO
	nSwDDzXw5I9bpCsgZIOR+GUp7Y7TbqycSQXkjTOhJfOgIxtuOpfDB4vM4pnH8MEL8Msctl2zTRr
	CypNeJ5n8QjG8EeBzQpZdenw+hcp48Ps0SE7RT
X-Received: by 2002:a05:690c:6e86:b0:7ba:f2f1:86c7 with SMTP id 00721157ae682-7bcf50d07d7mr20810327b3.1.1777369675548;
        Tue, 28 Apr 2026 02:47:55 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e4740sm14218867b3.14.2026.04.28.02.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:47:55 -0700 (PDT)
Message-ID: <34627be5-75cc-469b-af23-f1f08ce29820@gmail.com>
Date: Tue, 28 Apr 2026 12:47:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
To: Bryan O'Donoghue <bod@kernel.org>,
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
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <Xfiq_WNTU9P-ThZLMs4plWE5hwtmwyVyKJc1bD5BKdhERGouucNpyuenIoKQiKfZKaRzP-PdamsNlQ8vezjrRg==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
 <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 04CD0482849
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59825-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pastebin.com:url]



On 4/28/26 10:10 AM, Bryan O'Donoghue wrote:
> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
>> +                power-domain-names = "core0", "core1";
>> +            };
>> +
>> +            video-encoder {
>> +                compatible = "venus-encoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
>> +                power-domain-names = "core0", "core1";
>> +            };
> 
> So to be fair in this case you do have a reason to have an encoder and
> decoder compatible here _but_ it should be the case that one one of the
> sub-devices contains CORE0 related stuff and the other CORE1 related stuff.
> 
> Because in that case the sub-devices actually represent individual
> hardware settings.
> 
> So listing power-domains and clocks for both cores in each node like
> this militates against that.
> 
> The other thing is to double check of the encoder and decoder are inter-
> changable here i.e. can either core be encoder or decoder or is it fixed ?
> 
> I believe on older generations - perhaps not on 8939 it is not
> interchangable.
> 
I found this in LA.BR.1.2.9.1_rb1.5:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
Only decoder bits are being set in bus configs. This suggests that the
cores are not interchangeable.
Then again, I never managed to get encoding working on MSM8939. Testing
it with
gst-launch-1.0 videotestsrc ! videoconvert ! v4l2vp8enc ! queue !
v4l2vp8dec ! xvimagesink
Fails with the following log: https://pastebin.com/nmZcLgPV
And in dmesg it reports a firmware error:
[  784.461031] qcom-venus 1d00000.video-codec: no valid instance(pkt
session_id:dead, pkt:21001)
[  784.461126] qcom-venus-decoder 1d00000.video-codec:video-decoder:
dec: event session error 0
[  784.461200] qcom-venus-encoder 1d00000.video-codec:video-encoder:
enc: event session error 0
[  784.468799] qcom-venus 1d00000.video-codec: SFR message from FW:
QC_IMAGE_VERSION_STRING=VIDEO.VE.1.8-00099, Err_Fatal -
Z:\b\venus\utils\src\vbuffer.c:1319:
[  785.791641] qcom-venus 1d00000.video-codec: System error has
occurred, recovery failed to init HFI
[  787.018339] qcom-venus 1d00000.video-codec: System error has
occurred, recovery failed to init HFI
[  787.097253] qcom-venus 1d00000.video-codec: system error has occurred
(recovered)
This happens regardless of whether I enable the cores for encoding too
or not. The same errors were happening on MSM8916 as well. So I can't
tell if these cores are interchangeable just by testing.

