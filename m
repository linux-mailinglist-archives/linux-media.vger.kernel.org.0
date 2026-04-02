Return-Path: <linux-media+bounces-57988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGGEBkTBzmmqpwYAu9opvQ
	(envelope-from <linux-media+bounces-57988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 21:19:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48938D9CD
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 21:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F30E30333F3
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 19:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A58F3603F7;
	Thu,  2 Apr 2026 19:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5k2uBCK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8cAJSss"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE3330FC26
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 19:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157549; cv=none; b=cPyYsCs+zWx2e+H65cdDRGlCzYDiwZL11Am2q9c2qUzIOBVmos1uFD3tN6kX9Cc/gITzXQOj1kWhWU9x25wObHNm3F/k9yBGWMNN37zbkis0HxE3+QFrCxSe+qNAAvvbTGgUWQOsboM4hdjM7fLTepLxWjPy/u+RQKGJwH6PK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157549; c=relaxed/simple;
	bh=UTZMulMxQADJs3Qm4AUagfCdPKlR9SaR7Ts06MtUMo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=govq51BoDwVpLwjFiAokOolvSWM9MU+MQw6AuHPqtqzMhKB4ykZKtniv60VjOmyhDpTOUVIgfjzMff1yj//oEa4nd0jhhl20gD7v9cPYwsB48OwdYFKfKhW1yGTFWE8UPT8acnvuazxZxoM7K3N2Xoaa4/JAMGVlRAMWT2wDlGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5k2uBCK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8cAJSss; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632I2QLc3772909
	for <linux-media@vger.kernel.org>; Thu, 2 Apr 2026 19:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZl3cTHjMN7Sox3H+l4MMbGllYCAKHkUh5l+L5p4Rxg=; b=n5k2uBCKrq4C/kGg
	64QCtbpwkS9erZslFj4SnTr9U+DT4Awet9lsrpWwAd58yHbW7DA4Y9w3Io/snULZ
	ngnGaS9gOoxFTlCVHrEWkxdP5dQoMNSKDekC/9FPKDZtsI8Ebd107S32Cl/EP32i
	op8HuHnTbeiHKdqWFvwNvTdMi75my+mSF5RleMA2mFCdpqSPIIRoHKJ1E7KBBKsx
	+IDqO+D/QppKrSuycV4kTws7/9+O3m3f/qE8maSheU8f9OWGQ/BQrl8Do01MiN/b
	UdP/KcW6ULkEY1RKgSJA27g1uO6+we6Vh3UMgYOLC1HZbvQNXEcOQF8rTCsRYBTM
	ieHVFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs08ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 19:19:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so32299965ad.3
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775157546; x=1775762346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZl3cTHjMN7Sox3H+l4MMbGllYCAKHkUh5l+L5p4Rxg=;
        b=U8cAJSssEOchDGmc+hkxzPrKMa7WM8Vg32SdNOfdE/rIi6tKhSBU3enASwSiNLVnXP
         VC+dxl3nM/4e6sjOUT+S1RiCMXPZ5yGx52LOFv08tRuPs27HByBpEzdH74a6S/mN64xe
         aBBD4I7PWYmeYf4HkONzUqrd7Fvd1IVa/Rc4dGBZqe87KOYY++Dai1lb8i7aYWfQLH2y
         nC/d6w3K6XN5PpiX9d2gTcKngK/ufvEO+RW4P8IMe7DtJgzE1pMrPGFnU8maH+b0cZzo
         VQFZzu9gR0F5GgiIKuRCmgW0wap5rmPrxhUEl3vaNj/H7+AMowFKdtH5gtdsXfwmSRLY
         0aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775157546; x=1775762346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZl3cTHjMN7Sox3H+l4MMbGllYCAKHkUh5l+L5p4Rxg=;
        b=qURdXyKv4bQoub1648ajugrb3oThlQqEeX/MfGKKtnciMKIsc+LXQ5X1uueerj5uT4
         2X74jRPG8PDP5T0U3xoZTgrmIFN932fGzVyyROYr1PNDQQsUXkkD3wFRi0iWg0K2Z1BD
         L0T/x33OjptUJYfmrjUJ3KUO9prr/+ajURpYOYCbh1wedQJK0XgQH4nl/e+xLoBqjw1A
         YhmDz6hs3b9agk45bG6mfLUQaqE9He9+Xs+gqoZrLXsZ3ivB0U5Oncvb5sXaNvUB6t7P
         WyCZl5Zm3kTX9cWgDE03W4sMhDotLIc2w/iGzIdQj+7W4cG6xJPOryQLBh5YmAxD1hMc
         5cgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFulpflOKs+eLgEU8YHrVpI7tt9wdvAXHjjwu7xF6zchazFlLxHxBqcVjePu6SaJ5FONAe1BFnTluFNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCGZlTYotyYl8Wu5H5WuRCjov0nBzik4TS/GqMew1L3QOVfiLD
	WjWbnK/9TCIbkQyMVfrU3/1sod9uY7RAd0sJFPIRikkjvfVWHxz2jKl6Qu6V5aDFx+K4eToUPEv
	H2HcrCCMinr3ocb64h9auMvvNd/YTJuu2Mo9/oR6+XjwkaGw9CA6h/oSYDGikqX8y4A==
X-Gm-Gg: AeBDieukBNsA+IyDX7AkVcZJB4Axd8nFXbu/wPC6hJD2sFWeGLLBAWm6vQFlJy+lv9N
	adqXjazDCOXO5Ns6SUDjO1cETXvQsky7hsP6FlJiThVUP9jNKI5WMwE4H72fKlJ4jNS86uxhRXW
	RlrC//f4tSBRkvWEXM8HwUOhWsgH3ryN31icPZYeLOhU/YVkZoxk6N/k/OISaj2RM08h768qwwo
	nCgtCpD1fuWO0EPoPmCFOl6+FTcG0qF4wQ1KCgQEL5BniQiISNr6vPQ0MjT1bGRZjbsXxaVh4iq
	yAo/mnAzMdO7DZ++XPySis+PnknPAiLA7EOxZGLHZ0qASpURSkFGh/FtISEZipoFvQpIn4o/a4n
	rSsHR4ugucF+cDPgN6uredlHrE8FMSwVMEOnok9eSDNZOOHjfH7QoE1o=
X-Received: by 2002:a17:903:1248:b0:2b0:6f21:8289 with SMTP id d9443c01a7336-2b28179947fmr4581755ad.25.1775157546192;
        Thu, 02 Apr 2026 12:19:06 -0700 (PDT)
X-Received: by 2002:a17:903:1248:b0:2b0:6f21:8289 with SMTP id d9443c01a7336-2b28179947fmr4581485ad.25.1775157545681;
        Thu, 02 Apr 2026 12:19:05 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.251.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d646sm37774555ad.5.2026.04.02.12.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 12:19:05 -0700 (PDT)
Message-ID: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 00:48:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
To: Steev Klimaszewski <threeway@gmail.com>, dmitry.baryshkov@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev, andersson@kernel.org, bod@kernel.org,
        bryan.odonoghue@linaro.org, conor+dt@kernel.org, david@ixit.cz,
        devicetree@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
        johan+linaro@kernel.org, konrad.dybcio@oss.qualcomm.com,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        stanimir.varbanov@linaro.org
References: <ebzdn3aplm76xkvljwpg6v4mid7ljslhzwnf45u4obgwhcnckh@rtdv64on3y6b>
 <20260402183209.27159-1-threeway@gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260402183209.27159-1-threeway@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rB-NrCkvKsG-Xg4eLdBg-liv3LtV9Ib7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE3MiBTYWx0ZWRfXxm0hoIBkVF3l
 JJpTzEYj2UrRm9S7bLdNqw8yjNolqLP6yMsB1VYZ2dwhGEtpSaAIWvJedpiF/GTwAvVPhAllrGT
 +LnXaDJqTp4OE2l4wfxsBJMeN7As2/C5yNFLmo14BcCRFevuIcTrXjKi7NJHz/BwjKAjzpwbbbF
 e5/MkXeOj/sbX3cWc4viPDH2DnR0dafkD9VTi+1H4hxhDthVC0oa6uEWhXS0s7EV50l9vXIy9/W
 5SkZo4o/1W4gVA8KD8+AHMxMajug26qvxAjLHM9jnotdcZhhWQa4k3j3Z9lHPI37Cg+Z5DiQcpb
 Fc6OooednfK1lb9r99r1X3MAoKybo5EAPcB5nslWKJJhPH9E5ykzexxIlw4yFSmKbCQrWS9UvCD
 4Tbz5AaEhDuIz9/RteU9Y6h5tUVIGCH+8ePYTFM+8FEazoru5dnzDDcWqlQf7SFWEiKk9XkN75q
 G/3DJcKKeND9wl5YOag==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cec12b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=HjhN+elnpTkf3xRQdsZrsA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=4UBBUgiBvx0gm6X3eg8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rB-NrCkvKsG-Xg4eLdBg-liv3LtV9Ib7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020172
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57988-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E48938D9CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Steev, Dmitry,

On 4/3/2026 12:02 AM, Steev Klimaszewski wrote:
> Hi Dmitry,
> 
>> Thanks for the additional testing!
> 
>> This might be:
>> - A bug in the firmware
>> - A bug in the Gen1 support in the Iris driver.
>> - A bug in totem (heh).
> 
>> Would you mind sharing details, which video were you trying to play (at
>> least, the codec that it used, please).
> 
>> Also, does it kill the playback afterwards? Can you start another
>> playing stream afterwards?
> 
> The video that does not work seems to be
> 
>    Metadata:
>      major_brand     : M4V
>      minor_version   : 1
>      compatible_brands: isomavc1mp42
>      creation_time   : 2025-08-04T19:42:21.000000Z
>    Duration: 00:00:35.24, start: 0.000000, bitrate: 6291 kb/s
>    Stream #0:0[0x1](und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(progressive), 1280x720 [SAR 1:1 DAR 16:9], 6126 kb/s, 23.98 fps, 23.98 tbr, 24k tbn (default)
>      Metadata:
>        creation_time   : 2025-08-04T19:42:21.000000Z
>        handler_name    : ETI ISO Video Media Handler
>        vendor_id       : [0][0][0][0]
>        encoder         : Elemental H.264
>    Stream #0:1[0x2](und): Audio: aac (LC) (mp4a / 0x6134706D), 48000 Hz, stereo, fltp, 159 kb/s (default)
> 
> 
> However, a video that *does* work is
> 
> Stream #0:0: Video: av1 (libdav1d) (Main), yuv420p(tv, bt709), 1920x1080, 23.98 fps, 23.98 tbr, 1k tbn
>      Metadata:
>        HANDLER_NAME    : ISO Media file produced by Google Inc.
>        VENDOR_ID       : [0][0][0][0]
>        DURATION        : 00:05:16.732000000
>    Stream #0:1(eng): Audio: opus, 48000 Hz, stereo, fltp, start 0.007000
>      Metadata:
>        DURATION        : 00:05:16.744000000
>    Stream #0:2: Video: mjpeg (Baseline), yuvj420p(pc, bt470bg/unknown/unknown), 1280x720, 90k tbr, 90k tbn (attached pic)
>      Metadata:
>        filename        : cover.jpg
>        mimetype        : image/jpeg
> 
> I do not have a ton of videos to test, so I just used 2 that are on my system.
> 
> This is not just with totem, showtime shows the same issue.  If I let the video
> play, it plays just fine, however, if I attempt to skip forward, back, or even
> play *after* the video has played, then I see the smmu fault
> 
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6

please log the info about which "iova=0xd51e3e00" buffer is faulting in 
this case

Regards,
Vikash

>   arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
>   arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
>   qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:1, data2:deadbead)
> 
> If I exit and re-launch totem, it will play the video through, but again, if I
> attempt to skip forward, back or play once it has finished the video, then again
> the smmu fault occurs.
> 
> totem and showtime both use gstreamer, and show the issue. showtime replaces
> totem as the media player on modern gnome systems.  mpv and vlc do *not* show
> the issue, but they also do not appear to use iris/venus at all.
> 
> Totem is version 43.2-11
> Showtime is version 50~rc2
> 
> Host system is Kali, which is essentially Debian Testing.
> 
> -- steev


