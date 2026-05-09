Return-Path: <linux-media+bounces-60993-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LuMBP4h/2mu2gAAu9opvQ
	(envelope-from <linux-media+bounces-60993-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 14:01:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB04FF871
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 14:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48BB3301F30E
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 12:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EFE38A718;
	Sat,  9 May 2026 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7TN+NgJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5381A3165
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328041; cv=none; b=Uv6XmE0yZMGBc9mbbgsBuoCYEKEikyfto1EIjVtjHJaQPqJhMau5NdSQUsqW+aXKQXAqQEdiikmXDdEBAQhZiyv8vVl0TIBXXZn7K2VV4K4DrjUxnknqnr1cRgq3AzdjGcIf7hL1nVfEg06ggCPifQQjrXoyUhj+oCOjwhPRm0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328041; c=relaxed/simple;
	bh=iemCui2l8qqvzux3lam3RV5hSucVjjAACXX7LzCZHcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7lbEElEqM/2zOL7c+RjE5AEqxV0y5UBDdrkJCpSWU8Ged5L6FH9stnIlIZ5thBKfqAWp53dHNgoX1gXR+kSOs9bpqef055K5I0hzpZV+vA/gqRQ/o1lJ+xklfFvZtuTTPx5qUzSNIs+GwTlRpDW0ISG74uVRueEdm7dMfjUpFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7TN+NgJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bcc2b199c17so44669566b.3
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778328038; x=1778932838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmUf6SNpF4clO18ErlUoo6BNS+Vk6nKV8PcksNLHfkQ=;
        b=A7TN+NgJDOiROdSbAmP7uh/zrwBSV+nGEFjf6F2Gp9Wbx1FCzxQxNvTT9cfw7JLzmd
         gq+isEPxiAl7kKjsjKvZEYOxPBv/446cLEKUun52UKzI4zCbw/0tw8UmDSWANXcgP4y3
         Cf8UcV3gdKmhKzUp9TTd4ZbngpmyZo8eDl7s3tQ+xGlbyf6qxMCBsSxkGH23W3oIHAcX
         nP/fcModN7+s0dVCP4b9YtD4khIqFG5uoZDQa9ofKOTpmFHNyJ/ijVodp1PeU9K+6y9e
         C4ZQECaBbPzW/XubM7Ijk4gG0JG5cfyg85ToHzxwqdi4i3UM01T4gaStKNbEzQYNc5Uw
         yGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778328038; x=1778932838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmUf6SNpF4clO18ErlUoo6BNS+Vk6nKV8PcksNLHfkQ=;
        b=cPIjyx8AXag4mGOSCePsm8D3MJGo9ZFO/X04LdLLsnOHjjIDkPzI5C2ePVq2qZl97t
         GHcmHHMJaLnP6LvxubPw7GmiP6Weu3dbkAdm9QdOZPOCcW4WtQmp/jCHRIxkEtAabrrH
         tAiTLQptNDWjct74O7oDxtVPT3zR7821xt+b+hsColQopNvjhxdCd66RS1/nfFHjhexs
         YzrmaARLN3Y+z4RqU5yXTQkTtQ1UZJPlXUmydmSeTCSGwNe28QinpqJMzRCODwmtkm4y
         Y1r151jOhTuzoMTsEPPoSYx2j2jNxNbUJkdj2MNkRgb/tA5pu0Kgu6VjlKpfR8wHuw2G
         wnKw==
X-Gm-Message-State: AOJu0YzYVj5eKujDXGJOb9E4RmgY1Z5plqSF63X4GqFt3LPqW6/We7Ds
	iAvFWvaBs06PnPjv2dpNibEfdTC/VWzuNLs0bxkpyeZ1EAVJm+rcxDiZ
X-Gm-Gg: Acq92OEnlxyJRmy5OeZt/ORmgOc9A/R2PjQ/ei37GQ4mPdDiRxeV/kWXyms4wDjo0Hg
	62BpqNu4C9nt9L1FuSX30SloiHSzDRpQvbTw6HSjkhUjsxblXY5gj2nmMZKO6ZAj+2r8QIVOf4A
	uyKd4tAoVBQPZIVHvIJzIq6ZLbQEW/NOL7DDV+TyIgjDCH/w3tQQ28jr/cYdE6ol8MuH9NQImDf
	Fx31+1rr9NgOgJPNCeMuAzjSbZBxeKga87jLd3S63YakFMp36UL7MzOFVf5TceJDgYgOfMMqKnk
	iOJhZYlbin0msCRU0BM1HR3Cj7HuQKSxsXn2pMLot4eZ4NcCWxD2G9GXhRl87VhDYQ9+mba0LDo
	UGCTDGLzL0bpKJAK42SL9xOayq+YEY+siyVvF24qaBbuENtaqz+IydYRAEXVSkiMiP9nqQB9c2/
	Jf/IcS2/R23pIU1s2K5QluXtTptEZR5+jPzRIndh60B/bW+Mco/lHY50kcAUHt3JuVrQwB
X-Received: by 2002:a17:907:c817:b0:bae:456f:fbb2 with SMTP id a640c23a62f3a-bc56cd3b1ccmr1054228966b.23.1778328037744;
        Sat, 09 May 2026 05:00:37 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:4e2:a099:cad9:2ecd:93de? ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359ea4sm219872166b.50.2026.05.09.05.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 05:00:37 -0700 (PDT)
Message-ID: <69f9a6b7-7431-442a-82a2-6305635a508a@gmail.com>
Date: Sat, 9 May 2026 15:00:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <f5TsKnC12rLsH63vAi01aN4oXUFLrfgIhn14IQFDb9gcac6anLzzhJdkGNdQ2dRs4vYbFKUptfEgWuKdgIgGsQ==@protonmail.internalid>
 <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
 <CYaHtccGOWlaUtl3QIKva44ybJiRHsPOZmHEkl2KKGmnDxJ8vTH-SVNMGbL7bjkYjI692nplORzOhpfjs3XJfg==@protonmail.internalid>
 <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
 <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
 <tawGGT4rtpw22Ng-MgM--GhoEihBU7tY_TrFUHf8raMKApyqTcSkKHyfSuRIL_bqNp_5zWD4SBG_C4c8CB7_6Q==@protonmail.internalid>
 <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
 <614a087d-d219-49cb-85ee-772044558649@kernel.org>
 <Jxt4BbN1dL8VKh_Zjah1xecAjz3c9VfbhKSm4a0K2D1MNKfJKIFnCPLj2VvdW1q4LnMIQy8bCzV3YoVnLFYUlA==@protonmail.internalid>
 <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
 <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 22CB04FF871
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
	TAGGED_FROM(0.00)[bounces-60993-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/8/26 6:55 PM, Bryan O'Donoghue wrote:
> On 07/05/2026 16:51, Erikas Bitovtas wrote:
>>
>>
>> On 5/7/26 4:37 PM, Bryan O'Donoghue wrote:
>>> v4l2-ctl --verbose --set-fmt-video-
>>> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
>>> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
>>> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-
>>> from=cyclists_1280x720_92frames.yuv --stream-to=/tmp/
>>> cyclists_1280x720_92frames.h264 -d /dev/video1
>>
>> With the patch kept:
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=H26
>> 4 --stream-mmap --stream-out-mmap
>> --stream-from=cyclists_1280x720_92frames.yuv
>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>> VIDIOC_QUERYCAP: ok
>> VIDIOC_G_FMT: ok
>> VIDIOC_S_FMT: ok
>> Format Video Capture Multiplanar:
>>     Width/Height      : 1280/736
>>     Pixel Format      : 'H264' (H.264)
>>     Field             : None
>>     Number of planes  : 1
>>     Flags             :
>>     Colorspace        : Default
>>     Transfer Function : Default
>>     YCbCr/HSV Encoding: Default
>>     Quantization      : Default
>>     Plane 0           :
>>        Bytes per Line : 0
>>        Size Image     : 708608
>> VIDIOC_G_FMT: ok
>> VIDIOC_S_FMT: ok
>> Format Video Output Multiplanar:
>>     Width/Height      : 1280/736
>>     Pixel Format      : 'NV12' (Y/UV 4:2:0)
>>     Field             : None
>>     Number of planes  : 1
>>     Flags             :
>>     Colorspace        : Default
>>     Transfer Function : Default
>>     YCbCr/HSV Encoding: Default
>>     Quantization      : Default
>>     Plane 0           :
>>        Bytes per Line : 1280
>>        Size Image     : 1425408
>> VIDIOC_G_SELECTION: ok
>> VIDIOC_S_SELECTION: ok
>>         VIDIOC_G_FMT returned 0 (No error information)
>>         VIDIOC_G_FMT returned 0 (No error information)
>>         VIDIOC_G_FMT returned 0 (No error information)
>>         VIDIOC_REQBUFS returned -1 (Invalid argument)
>>
>> With the patch reverted:
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=H26
>> 4 --stream-mmap --stream-out-mmap
>> --stream-from=cyclists_1280x720_92frames.yuv
>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>> VIDIOC_QUERYCAP: ok
>> VIDIOC_G_FMT: ok
>> The pixelformat 'H264' is invalid
>> VIDIOC_G_FMT: ok
>> The pixelformat 'NV12' is invalid
>>
>> Decoding breaks if I revert the patch as well, it fails with a power
>> collapse fail.
> 
> If you declare both as decoders can you successfully decode @ video0 and
> video1 ?
> Apparently device nodes for encoder and decoder are not persistent
across reboots, so when I reverted the patch, I was actually testing
against decoder, not encoder.

So, the result is the same when the patch is applied, when it is
reverted, and when testing against v1 where the cores are enabled only
for decoding.

