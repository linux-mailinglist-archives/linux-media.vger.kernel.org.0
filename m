Return-Path: <linux-media+bounces-43698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F2BB582A
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 23:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3967F3C7C32
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 21:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB7326FDA5;
	Thu,  2 Oct 2025 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chc9yJ/K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB8CC148
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 21:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441945; cv=none; b=QC9URM1AuJStS1Gz3uhqTfTQxB3egh84owqdPPPrIJQNkoqI2uOmnrgPl/I5XqQWkWPX8cjP3bNrAkRYWUpu5NeAnXABERcYy0NTrx5yg0LWw9a8pgy3XlLJG3qWwDdkUsCYnoguoRGFiFrO3NpRF3NczCkyN5vV/egKkhF40bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441945; c=relaxed/simple;
	bh=NIz7qPlfFJG/HN+nuGY6ykVtXvMslI+s24hTeB2sKsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdHJvtUz0dWzFWwfK6qvhg3uxGG35xHw+Ao7olnhxwN8CFguuce1jhcCDbhmXGTMSVfVVxhHS/XCdAs7h8Y6uzaqFVMffxLlaDg73JfAz35JaXyyXXokZerN9tZ7RLv2i3KjTaCCxYGjCulJM9/FG15k2wKBClH1kpCGuRw9co0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chc9yJ/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929Me8H009667
	for <linux-media@vger.kernel.org>; Thu, 2 Oct 2025 21:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jqMHq5TfRmj3TbrSeyiMOMkIWH6OS1IpBWFPEro1KI=; b=chc9yJ/KgXIArOvy
	TnPszPDn5q4GGOCo4s5IIg8OwAR4IgmNYT9C9U3IgoAAOEiWBKWII9ahx+a9l+yE
	i3/sywBuGh2b0HASnRdgdBqYo4N+qZPjnv+6eEL+HXOyP8SWfMgnEbqiBn9zyiRh
	Gg9t1vQKmRZNMmnOftNxPNHpr6SmrgIpK+dlHlZjk5XHMIW0erzNnWyBhE1n461a
	U4yyHIgGvntxlPMLXgjnK2shwmqGCaAzrRjoPsiMDIVp1LMsOKp880RFSoJx5V8p
	TXVvkwDAR7z6h1FDhN7mT6pNXa/WH664xeP0NZquXIipFXOJOQE8DO1U55ZBYi3s
	GDte6A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hrsxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 21:52:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3306bae2119so605363a91.0
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 14:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441942; x=1760046742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jqMHq5TfRmj3TbrSeyiMOMkIWH6OS1IpBWFPEro1KI=;
        b=qqHULc9gNigbRgBvjs2Mwd+Fysc6XdHsyY2z/yhnSXJpI74rJqiCcEQou/ihWOjJP7
         k9irUmzZvuaLNB+J5ATxXtHtnWX/D6a68jpk4dZy9pWwqkydLi1pcCOoTa2ZvKERYLUR
         pG7mxtlxy+XDjRXMGNIIGInv2+Gbj77/TpzogPsE4P5xjfkXrvTy29XrWH/5IYoEulR2
         WLzqJEIAV+UZm27qgpUtlk5A70jKowesVCSiEy1AXiJNcazZmJBolWq1AeG4tfBkf+0W
         1cSHuPfX3hzJ+aeE3rIDtBPPB5gy90JvxEc1GnBlsBiso7UmVCtB42SjX8rsDLQQmG2r
         pdOw==
X-Gm-Message-State: AOJu0YzVi8pbiTT0N88x7DY+X2ypVwfj9oG+0+XpN5nDDNlBxPHwGaqO
	y8wdT7q4bMjRpWIFmIxQ2+A/r0XZKGYKQbarAF5uTvvmCm8AlyTXZGKMcF/UDNA/Z8XP2wOh+wL
	EptqwxqhHV4489ShSSgGP22o/7VQnZ43nz1fmC5jceP3qvLtHIpbQ/FBPg/RvxWDsEA==
X-Gm-Gg: ASbGncuFQg0o7848PdYen3y4qXBmckhFP3/ud9wXRTt/8XroB8sPSMzfJsnu8yPUlcR
	ITqQM2kj1oDXlu4Arzt9wecLvNYwdXZ4kbP6Fc/y0Ge2CFT46k7ajmcvEDa/iuT86KDyEFByx+Y
	StwTX/2kSXFO/dhpnKJtGtwfGY7I0/BwjusyMaR/GZjCNfSj1c3D+Vw6F38/QTAcLxlqjMw06sN
	O3iz+YY7L1KGl8Flh9APYKP5sXjFbcpvaHzCx+0PrDrCO6qxOWs+0cXpBNrpvES01STcVPEqws9
	vtCm2maYYEXRSUh2zYDijoxGpSfgZoEHr0wMrwvMtkuAHNY65OIC6fzNul+CzRZdR+WQDICssq1
	MSaLTMeDFzXokHvZ+bEOMCtWM3jIU5+lp
X-Received: by 2002:a17:90b:3ec2:b0:330:68e3:ce7e with SMTP id 98e67ed59e1d1-339c276da6amr451947a91.2.1759441941683;
        Thu, 02 Oct 2025 14:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT8xRXZ+4q0hThcIHkyNTAl5biizcaSooNRPVF8MFksLOncOW7VixIeqV7oJFecz027FfPsg==
X-Received: by 2002:a17:90b:3ec2:b0:330:68e3:ce7e with SMTP id 98e67ed59e1d1-339c276da6amr451936a91.2.1759441941234;
        Thu, 02 Oct 2025 14:52:21 -0700 (PDT)
Received: from [10.71.110.242] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701bf79sm5849439a91.20.2025.10.02.14.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 14:52:20 -0700 (PDT)
Message-ID: <bebe83bf-bfd7-437f-9820-c907a12d5624@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 14:52:19 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: uapi: videodev2: Add support for AV1 stateful
 decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
 <20251001-av1_irisdecoder-v1-1-9fb08f3b96a0@oss.qualcomm.com>
 <dfe8bdbbf12ec54c7a27888f911082ab63d6030f.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <dfe8bdbbf12ec54c7a27888f911082ab63d6030f.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX9k/Bg2uo70M7
 0ySq8cI1Rn19B2SGRZhyHk1lrwO7C9Wx+IJ+VNHig1E2Cp0tkRyxfKT+N0YRooWyjRsQxk2tsr9
 Adha3LhWU+vMyIV8abVoIq7++pZbe83gxHHmYwvm6uDil3+EiSBczia3l6Pw5O0WzqQ3UZuhtgw
 OSaacxjPL+dn9khHCCP4Orf4Gz4d0NyQcOnBT0+K93lxyD5D4KAwHDliY4BOrKbQekmGEunkz5g
 8B6KaPDa8hhs8dVU56trNigx+MSyvehSly40NZ22A5LxbwQKcCif9gQ7hCL8MZV+yk9gwxDNUVv
 gkA/D4pSu2ouDLZpMVqkJ1ISXzFeeGYBGHPmarDA7GsqePpxfEMtvs2QNHdXTnrQ7+jWDOEf9cd
 fSvZynUYSONBI5/ivbJ1YOGBv4qZuw==
X-Proofpoint-GUID: na_sO4h9Ltr2ltpBlev0WuUazHDCQsSK
X-Proofpoint-ORIG-GUID: na_sO4h9Ltr2ltpBlev0WuUazHDCQsSK
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68def416 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KIgxDb2ibSJr1G8uLA8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_08,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041


On 10/2/2025 12:42 PM, Nicolas Dufresne wrote:
> Hi,
>
> Le mercredi 01 octobre 2025 à 12:00 -0700, Deepa Guthyappa Madivalara a écrit :
>> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
>> Video4Linux2(V4L2) API. This format is intended for AV1
>> bitstreams in stateful decoding/encoding workflows.
>> The fourcc code 'AV10' is used to distinguish
>> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
>> which is used for stateless AV1 decoder implementation.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
>>   include/uapi/linux/videodev2.h                              | 1 +
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> index
>> 806ed73ac474ce0e6df00f902850db9fd0db240e..043ec57d7d48a36005f2a0121a5bc7b733d0
>> 6590 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> @@ -274,6 +274,14 @@ Compressed Formats
>>           of macroblocks to decode a full corresponding frame to the matching
>>           capture buffer.
>>   
>> +    * .. _V4L2-PIX-FMT-AV1:
>> +
>> +      - ``V4L2_PIX_FMT_AV1``
>> +      - 'AV10'
>> +      - AV1 compressed video frame. This format is adapted for implementing
>> AV1
>> +        pipeline as stateful video decoder. The decoder expects one Temporal
> I would do a small edit here. Instead of stating that this is for decoders, I
> would rather document the intended behaviour for video codec. This way the spec
> remains open for CAPTURE driver to produce AV1 in the future, or OUTPUT driver
> consuming it in the future.
>
>> +        Unit per buffer from OBU-stream or AnnexB.
>> +        The encoder generates one Temporal Unit per buffer.
> Otherwise I'm fine with the proposal of using TU aligned. Similar to other
> codecs, we can always allow adapting the behaviour using controls, keeping this
> as the mandatory default so it just works regardless of the HW we run on.
>
> regards,
> Nicolas

Agreed. Thank you. I will update it in the next patch.

Regards,
Deepa

>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index
>> becd08fdbddb857f8f2bf205d2164dc6e20e80b2..4c07ad6afd45d6a56d19d65fd25f091d8172
>> 5823 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264
>> parsed slices */
>>   #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC
>> parsed slices */
>>   #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed
>> frame */
>> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '1', '0') /* AV1
>> (stateful) */
>>   #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson
>> Spark */
>>   #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8
>> */
>>   #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9
>> & 10 */

