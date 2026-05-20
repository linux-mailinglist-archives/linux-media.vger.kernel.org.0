Return-Path: <linux-media+bounces-62332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN8QKwzkDWpN4gUAu9opvQ
	(envelope-from <linux-media+bounces-62332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:40:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A70592360
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BF7E3001A7C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA343F5BDA;
	Wed, 20 May 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWkZaH8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo/NUyyh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C51B3ED3CF
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291872; cv=none; b=qsa7OmTkalKeKBDzXB999DQfpVg8es3K5CH7Mpdk9vNGmI3ipP6B4PLheLpEY3npZ1P/Mdfv/knZPznpAju1lrsUfAyWKQ/BaQrwebRGn8wZTeuhB1pTnJNh7TUzJme0iNE1ZShIziYoW5SisBLlo37BQILGrneTxPVCp4Jax4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291872; c=relaxed/simple;
	bh=hXYOo2KOdZ2RezxUpX+nYE6lfyapAWeCnwTUrPTZ4cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0z5bAwa9Y4Le85q/Vg6kR2SZQR1flGo+JlgDrFKDEw6gilLtcixjXj2GuJ103OV2FFS/B6cdgZoM4N55owC75Sf6CgmR1+vCRemiVm6WQlRl6gRxBcuJLmATjqr8sk53DAevAvdS7HHdRd23HSJyEidcFPVP0MsHSI7DtWUqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWkZaH8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo/NUyyh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6d8n119200
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qZiw3Q1UdCzGrvVsZnH0m9WuZPRbHSQ0ex7xVdJkCA=; b=FWkZaH8Q3eGw3zBs
	a9WY6NuemhnNDNJbTacpwXkQi5l47YYuFph2bmONnX2LFikLp9+cDJxn+GckTYSb
	om0ZEDcuR/ypP+B2balufsPL/l0/xMUbbVYrg3bSFdCemINHkalSqIMEf/dck3W3
	jl1BzevyVRHhL5om42xucssWD8o3EbL4oAfZ28srTiJRF9CPFShZZjARd0twIAm0
	RH9V5SDwL/ydAeDeLysZL0KyQHh77AJibVa0GM7fXOw16XSyFqsf0oNNut5TsDE1
	GRbgSw4utvNc7Oq/KuzvEnHMMzNmxdaZKudXRQmvxD7N2+XyBGz9o8figfjUugYi
	pTKasw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee88e8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:44:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso10865527a91.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291870; x=1779896670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qZiw3Q1UdCzGrvVsZnH0m9WuZPRbHSQ0ex7xVdJkCA=;
        b=Fo/NUyyh0W5oOPGSbXPb0s9pltxpeggxI8UMPQAU5ki4DUZQalCYqq3xBG45panaQk
         uQO1wgXkkJTj1+TKZpVh6ZKQMM7VBxFBcGgknBGxK3tJvyfRck/Q/KoQICkyR/0WG6EG
         jTaqtT2p3i5LTx9VmypVIlrO+X0/Sk/HvAIBU/xKNAhFwiBDaB1E0vrj6u/IpiJ3jrXb
         rJXJdi9NFuKDsyt6oKDwT7UdfK6wrp/fyn5CovRlLpQPLkD982bXMPZ73rgl1LPpTsdE
         ky87MTtedHRzojs5PV+UH2LY+jxJRnFzc96yjlf7oXXjsnFD8MRFEPPlNNQKoFTdPNJ+
         3I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291870; x=1779896670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qZiw3Q1UdCzGrvVsZnH0m9WuZPRbHSQ0ex7xVdJkCA=;
        b=oVMuiCKRbCogFVf+7uyyHbMiyOJSEJ4S1H5E4iOmGj6ERjn1jY79Bc8SEgaWlE9Uyj
         kwLVid2SFyd+gwF1+vuwoGpdRRqQhPgYy6XXFlKAKVygN+L8YYfN5LoYuRjRrAf5Z0j3
         4CpvgXVufaAiH+3kxPqr0Zmy3RXoBBeVG3qmo9ACXJBnKEuj2G9wyDdRWYKLvJ05ADeU
         ZLLtWbDtS94OD83SLAIeqn5yUOVP3msq8AVWHvhQpcfbixwGMlxoz7bgbmppa+Dsp0jX
         Y8IXAuteM198l0ZIVwSu6clvG8cSwW43sTfYokNDcgJ7nvMymOjcU/iNwEwPM+XWe2h8
         HAkQ==
X-Gm-Message-State: AOJu0Yz5rOuazNXywUB/8TD7pLQ64AntBCWxeCGKnVn5IWz32twLgX8G
	5C+vnHvbrtOU5Y5SeZ+jIAzFW0gwXfl2CDs7wSds8uPYljTiJXgGLwDWfh/ui8qKr8qYMmjFFaa
	htB60pROIuRFMHkfBYr2kHhZOnf0kBaJxr6dCndM+TKaLmmVdO/qb0nc/GRub6X1R84aVstUfAQ
	==
X-Gm-Gg: Acq92OHAXyyk00FoW2e4XtlRip4MVCANuHb8y6E+76z4Lw5urm/O3grKJK9DMs9ZyHn
	6JN+koSzx7Tol+60Z+RJJYI2pXwtTZkUz39V/a3DWH0TrNVKOrin7T1iL7Uq05FXewBCXRftGgu
	fdty1eurqXoGTBtktBDHbkRVzz3dw2ketlsxwE7klRl0iFEXmKXSQYJtQKiJV3/7veT9KarXmWE
	wboIo7MdxILLhBeDhj6tWiMQPmbO/zWN2eyFKmJpXYmnN6iTjYiH1rdupJ6SKJdFB1tSSzLF/tB
	bVlB41bsP4KgXyCVcZqHmSvQwRuRFS2xUyeq70SpKw4SnRtQEhz3zgf3zMv7M4amazfmoU8TN0Q
	hBIWhP3K2ET9iBXCR/0pLh6w/e6ME5/yrBFsnoe95AbzhZ/F317rmgHs=
X-Received: by 2002:a05:6a20:3d8f:b0:3a2:dabf:fef9 with SMTP id adf61e73a8af0-3b22ec9b3d7mr27913070637.27.1779291870029;
        Wed, 20 May 2026 08:44:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8f:b0:3a2:dabf:fef9 with SMTP id adf61e73a8af0-3b22ec9b3d7mr27913034637.27.1779291869552;
        Wed, 20 May 2026 08:44:29 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062695sm19731416a12.4.2026.05.20.08.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:44:29 -0700 (PDT)
Message-ID: <16581410-45e9-4311-a0e5-435dc5314ae6@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:14:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <c4144820-c5fe-4249-85df-acd64642b909@oss.qualcomm.com>
 <3b3fbaab-1463-4593-beeb-40168658de7c@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3b3fbaab-1463-4593-beeb-40168658de7c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: buWRRIbpQVndn8wDrmPA9ckn-bCHejIw
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dd6de cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=poQuPI4Y3rRwBnmNrTsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MiBTYWx0ZWRfX7F1lbUygl5Xz
 5/at/0/WDeozbTfkRiqxHtuJp6Dh999pa4HAwblgnJ23JaXF0WAx65Jz/i54rUTz1mnV16QTFyF
 u05QXxrM+fuyNohefDkYKej1ySNkiwU9rHT2KKP3P9HnYMb82xZn+Gpwr0nOpaFc+s/LeI5vrUr
 knFQfSGtge/LzDcTYHBQOLrub5dvK9+/qrlTD4HIhj0V0GPihLI9zl+3INRoGo4EYsEChnNdwsu
 dz9BHEb2KCAn/wWfiOA7SMYod9dACyUscRE67yL5sHysAlRfW/UdJFMbEQjMmBcr4M/K54yT+SS
 PQqdAoyjHMyBfC1CZb4RzVTopzfZXxZJ5XhxihKO5jEYgqTsq9AmOo+YxIfF4Bhxp0HTRzJ8Bhs
 5VlEUOQjev8VhVptRXRu6sBbMPj3pOnXG2QzqrR0fHkQ/+DmbwOMiHQeHGSTdeD9l7ZrqKvEMtC
 9/1Xd6kucpN8pyUPxAg==
X-Proofpoint-GUID: buWRRIbpQVndn8wDrmPA9ckn-bCHejIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62332-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6A70592360
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 1:12 PM, Neil Armstrong wrote:
> On 5/13/26 19:33, Vikash Garodia wrote:
>>
>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>>> streams into 10bit pixel formats, linear and compressed.
>>>
>>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>>> buffer calculations and HFI messages.
>>>
>>> I was unable to get 10bit decoding working with ffmpeg since P010
>>> support for v4l2 decoding is missing, but v4l2-ctl works with:
>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt- 
>>> video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from- 
>>> hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
>>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt- 
>>> video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from- 
>>> hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
>>>
>>> The non-10bit decoding still works as before.
>>>
>>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>>> and tranformed in v4l2 header format with [1]:
>>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v 
>>> libx265 -crf 28 -x265-params profile=main10 
>>> Big_Buck_Bunny_1080_10s_30MB_main10.h265
>>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw 
>>> Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>>
>>> Fluster HEVC results on SM8650:
>>>
>>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 
>>> 131/147
>>> The failing test case:
>>> - Pixel Format mismatch
>>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but 
>>> decoder returns P010
>>> - Unsupported resolution
>>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>>> - CRC mismatch
>>>   - RAP_A_docomo_6
>>> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>>>   - VPSSPSPPS_A_MainConcept_1
>>
>>  From earlier SOC reports, 10bit tests which were failing were
>> - DBLK_A_MAIN10_VIXS_4
>> - INITQP_B_Main10_Sony_1
>> - TSUNEQBD_A_MAIN10_Technicolor_2
>> - WP_A_MAIN10_Toshiba_3
>> - WP_MAIN10_B_Toshiba_3
>> - WPP_A_ericsson_MAIN10_2
>> - WPP_B_ericsson_MAIN10_2
>> - WPP_C_ericsson_MAIN10_2
>> - WPP_E_ericsson_MAIN10_2
>> - WPP_F_ericsson_MAIN10_2
>>
>> I was in the opinion that once we enable 10bit, these tests would 
>> pass. Though i do not see these in your failing tests, but the count 
>> of 131/147 have not improved. Could you check if these tests are 
>> passing and count is better than 131 pass ?
> 
> Sorry there's a copy paste error I'll fix on v4, here's the fluster log:
> 
> 
> |Test|GStreamer-H.265-V4L2|
> |-|-|
> |TOTAL|141/147|
> |TOTAL TIME|8.600s|
> |-|-|
> ...
> |PICSIZE_A_Bossen_1|☠|
> |PICSIZE_B_Bossen_1|☠|
> ...
> |RAP_A_docomo_6|❌|
> ...
> |TSUNEQBD_A_MAIN10_Technicolor_2|☠|
> ...
> |WPP_D_ericsson_MAIN10_2|☠|
> |WPP_D_ericsson_MAIN_2|☠|
> ...
> |-|-|
> |Test|GStreamer-H.265-V4L2|
> |TOTAL|140/147|
> |TOTAL TIME|8.600s|
> 
> |-|-|
> |Profile|GStreamer-H.265-V4L2|
> |MAIN|131/135|
> |MAIN_10|9/11|
> |MAIN_STILL_PICTURE|1/1|
> 
> So the failing cases:
> - Pixel Format mismatch
>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder 
> returns P010

Why would gstreamer expect NV12 for MAIN10 usecase ? Is this something 
to do with format negotiation ?

> - Unsupported resolution
>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
> - CRC mismatch
>   - RAP_A_docomo_6
> 
>>
>> Regards,
>> Vikash
> 


