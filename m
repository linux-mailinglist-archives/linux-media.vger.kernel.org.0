Return-Path: <linux-media+bounces-63026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI4XIedtGWpzwggAu9opvQ
	(envelope-from <linux-media+bounces-63026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 12:43:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E460102A
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 12:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5973F3288CEE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C445C3C7DE1;
	Fri, 29 May 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ne1m8zNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hclZ0CLI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1C309F1D
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050832; cv=none; b=T6fzj5lGujDSBs4ny62jzwA+f3N5OyvjssHR2LaIChcIdxhVmitUB1uQK2xiN0fha92S7l4/opk+lKj8sTbOSckisbjrkXs3hIOiZhSYO9YNtWvxlEP68fkHBmkggKTquz6nTS/kOwPspVwf2ND6cAdG6TrEx7kDw8AAnzQ1ffU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050832; c=relaxed/simple;
	bh=zA5Zzg3scA62UZ+GPKbXvySfdfwWIZ11E8Pim5Tijag=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T031HIGNWgabayfaj2ekjwM7ahO3JdTwBHxE2f6OyWmRACzv+oBkHCGnR/w/MaZbIFrSrdY28e7tEZl4Xc4EOfftkSakcurjqSchLr1fgUjWtr1/haIPWCtYZsiL9Y9Nfu1R0zpHTSzTYmfbjcbSIDpDpGjl27sV4f0aQM4iWw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ne1m8zNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hclZ0CLI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6VL0S1540734
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVOH3S350bc3gtGmDt91G3i4+ZPEDkzPwkGm6W/trzo=; b=Ne1m8zNNtugZzJac
	a+Q4qbFOkDUiFpxgMRuIEN0P2ncA+ygqQaoJHUFeEQsJN387PMih7VWaxuwvyJ4g
	AkcwuEqnKih6mYpQTooEX/cJhtHMhnfVJQtJTraEvK7d4go7a3CYzhlHMjDWb/5i
	Iy4ORHO5VzfisJO/p7Clo03xerc+Qor5bJm99b8rLHsTU/Mlfy1Fw69w1SHy+R3k
	g1OJsLFwfHzhy2rwwOMssevqp2gBLZHv3CvEpwZIAwpqwxlh6TUOkJi8DHFgj3r3
	S0zravCA/Tv82Xp8VK1HziFcB9bDz68cbpQSjMPmoRbDaOcvrGYoNYjzzk/D6Tut
	qtFi8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4upjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 10:33:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7378ad0so150242515ad.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780050829; x=1780655629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVOH3S350bc3gtGmDt91G3i4+ZPEDkzPwkGm6W/trzo=;
        b=hclZ0CLIxQPgQynt6WXtlKnyjYX48jxF60+TJljduU9Dmo3nO1cJO7gXyqrHm96XH5
         lPYw9yE3pJfVrOGyVhrq+HAU5c4X7l3AcpfVfE0g2W2f5HrXz2oJubCWyvmYBkQPMVMY
         /zQE5sm4VjF/mL4OBU43WXccIhlXIjUAuh72W3rWsTJ5GG/lhlhNjc4lgstEIFHvSQ/5
         MlZeNlgW0EvCrXi10Ttxgo7/3bclLIoqZ/IPdXK8hUzdvRvRlC9KlfxslkBtBWMQaqqq
         SQA8mQh9VNH1ReMetVT1MIG8pCzb8NW0CMUB7/iY+Vn+dvzFtwIW5YpsocskqdHjbX5B
         QxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050829; x=1780655629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVOH3S350bc3gtGmDt91G3i4+ZPEDkzPwkGm6W/trzo=;
        b=mfmbv7Np3TL6ueC+mkWB5u3JKgsX7joX/11307b32Be+Wti09hKRjQ9fYA3/HgQr9e
         AMUpve0kR2VTaNlr2KM5JZ7+mQyVL0/UdYSvNLxqOxZzbc92H3Es+oStGdz9DXwkGzuc
         PbH14KlxJKVoMx5lbOzk/Szf9VeG+md9wSG9XXUQa8rkFX2nBd/kgd7faQTGCLUsUP94
         5jWbjWFgB3obAwaHTH6W/bTH4qsVGPh+2h9D7I92R+2LcYOj7/e7CeUdxZs76pHlu667
         Fph0ws5pH/tr2cweZTrOzRQsFg3hHF6Hq5Yob3PDlyLbHGQ/6zlKBHrit+EzlDx5J9sd
         Vj3w==
X-Forwarded-Encrypted: i=1; AFNElJ/5g/oLew6k9C06gpDQSpEUjU0xi3W4kO3DG/7kKPI+bzihcdtys+S3t9cFhe6xlQznTOFyuCJmBq0oag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJ2AWIUPWJRyEOckRsMWlnB3SrNdp+gkcmkY2TAehKoE2AV+U
	2cAFHYhbLqto1xVliE7dz+lKRVahzGcTjFUJdHc/j3OpZRCRrDC5Wz00wT5op4Fm1GQI9ACWh5r
	L2tIcOgm2IYVHVgujd1u1RayC4KtBc1Eep2FMOMB03BeE3wE2PGYnXE5Fwsc3VZSf6g==
X-Gm-Gg: Acq92OH/uTJaMOBwIfmqgkK4sEJFONpvyNG+Ylx0trGZ+0mSqniRBcfwaHpBkPBObqy
	OYkDZCp44RaVYFM5bsuSkZtAct9waDY1ujJTFUV7lMkMWS7Rb6rfbR74YIG5LebCCwXLv0i5iKd
	xDlSla5LgpWBGsFOIlOWmDBfLwRFb11Pu5USJqidlNpq7L//ewGLOQPWEE8pE3ox7xUAtdSOosV
	k0ymqAm0s+nqACVrV6MltZ6VRefa+nPoKa+DDQtNEaXAMVFl7I2MZiJj/CUg6C0ESOVchVPJ/d3
	skUo8BSS0bp1Fx8PRxUEC2jozFP408hIMrsTzud6qqCJyo7lzz8j4Um6eiKq2UvhwdqGY6wky2w
	fAPTG+Mh8kRvgEMXh9wHsOA2SN8JuysfB3L+zkMXz7N9KebLHkSBCEKCUQUfsYbA4sVZqK9RXzv
	+A9Y33w8xb4lY2X31IrAE6aBeAWjs=
X-Received: by 2002:a17:903:350c:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2bf203dbc13mr30925765ad.0.1780050828668;
        Fri, 29 May 2026 03:33:48 -0700 (PDT)
X-Received: by 2002:a17:903:350c:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2bf203dbc13mr30925465ad.0.1780050828164;
        Fri, 29 May 2026 03:33:48 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a10165sm14363475ad.31.2026.05.29.03.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:33:47 -0700 (PDT)
Message-ID: <88f8519f-31d8-47db-b0d1-f1d0d8c9df1f@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:33:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
 <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
 <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
 <3baa753a-f716-45da-b1aa-7406f4092578@linaro.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <3baa753a-f716-45da-b1aa-7406f4092578@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4JqLIktkq8-POye11sPl7cC6TJgB4k6O
X-Proofpoint-GUID: 4JqLIktkq8-POye11sPl7cC6TJgB4k6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwNCBTYWx0ZWRfX3463aDnpQ8SU
 /nmf9MsXlWyUhPMls4E+ugSndgplicFZ+JaXgua3SP6W0fAo7qDdxfkKZJ6+ltQsBb8sF2pSbeE
 jEw2X2CqF3xMR9Y6607kXW6ITiOfnKEDcBsfOwPMdbImt7WS50qkl7+m1ECARQOybF3steanp+Z
 avRozeJo37oYyf6r6tZGD0RDfRNjogoZnn9Y6tyuhLL+siV0LAtLHPN43X9ZabKibyRRATwGoxN
 z8GOZ9P3AIjM4EM55ByC/6jrYZH36JgwFQtL1EVOW9Tp6Ce/iQgBLVCUU/T2UV81fhiuGGn1EMw
 1jF9AkI1CYQirG71TAmfcfM445CJjXo7GJqIwik7DE5tXQ2AY/MSbdz/zUJh2vBTDB37eDb9ZWq
 amK5/aPEGRXaSQUMYR3JjRUQVCDazWr4UeiUdLkIUyFtnim7Ju0p1JjiYGoZigAU9+lu8UxeYI2
 GSYrnly720z/fmRm3cg==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a196b8d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=785Dn-WPAAAA:8 a=akCJxHDeTGvkA0VKt8oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=b7-gl1MdSEcY02uTy1GE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290104
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-63026-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,larmoire.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D60E460102A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/29 17:55, Neil Armstrong wrote:
> Hi,
> 
> On 5/29/26 10:21, Wangao Wang wrote:
>>
>>
>> On 2026/5/28 21:26, Neil Armstrong wrote:
>>> Hi Wangao,
>>>
>>> On 5/27/26 06:15, Wangao Wang wrote:
>>>> I tested the v4 patch using the gst command you provided earlier. 
>>>> The decoded output still has the previous plane misalignment issue, 
>>>> but all frames are decoded successfully. When viewing the raw data 
>>>> with an image player at 1920x1080 resolution, the first frame looks 
>>>> correct but subsequent frames appear shifted. If viewed at 1920x1088 
>>>> resolution, there are artifacts at the bottom of each frame. I've 
>>>> attached the images.
>>>>
>>>> Also, have you tested the 720p case? I can't get it to run on my end.
>>>
>>> Thanks for the report but I don't have access to the Purwa platform 
>>> you use,
>>> I've run test with multiple resolutions with display using P010
>>> and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.
>>>
>>> I'll test it on the Hamoa T14S I have which should be the closest to 
>>> purwa,
>>> but it uses the same driver setup as SM8550 so I expected it to work 
>>> the same.
>>>
>>> Could you indicate which iris firmware you're using ?
>>>
>>> Could you try passing the fluster h265 main10 test suite with 
>>> gstreamer ?
>>>
>>> fluster download -c h.265
>>> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
>>>
>>> The picture you send looks like there's a mismatch with the kernel
>>> and firmware setup of planes offsets.
>>> Could you check if there's a Purwa specific firmware property
>>> to set for 10bit decoding ?
>>>
>>> Neil
>>>
>>>>
>>
>> Hi Neil,
>>
>> I also tested on hamoa, and it has the same issue as purwa. The 
>> firmware used on purwa is vpu30_p1_s7.mbn.
>>
>> This is the result of fluster:
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_MAIN10_B_Toshiba_3 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN10_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN10_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN10_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN10_2 
>>       ... Error
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN_2 
>>       ... Error
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN10_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN10_2 
>>       ... Success
>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN_2 
>>       ... Success
>>
> 
> Ok so this works fine, so I'm really wondering if your main10 HEVC is 
> not properly encoded.
> 
> Could you try playing a well know HEVC main10 files ?
> 
> For example I just tried the 1080p and 4k 10bit files on Hamoa + fluster 
> and it just worked as expected:
> https://larmoire.org/jellyfish/
> https://larmoire.org/jellyfish/media/jellyfish-10-mbps-hd-hevc-10bit.mkv
> https://larmoire.org/jellyfish/media/jellyfish-120-mbps-4k-uhd- 
> hevc-10bit.mkv
> 
> Neil
> 
> 
>>
> 

Could you provide the test commands? I tried both files and the results 
from gst still show anomalies, but the results from iris_test_app are 
normal. I'm wondering if there are any additional settings needed on the 
client side.

Here are my test commands:
gst-launch-1.0 -v -m filesrc 
location=jellyfish-10-mbps-hd-hevc-10bit.mkv ! matroskademux ! h265parse 
! v4l2h265dec ! filesink location=1080P_out.yuv
gst-launch-1.0 -v -m filesrc 
location=jellyfish-120-mbps-4k-uhd-hevc-10bit.mkv ! matroskademux ! 
h265parse ! v4l2h265dec ! filesink location=4K_out.yuv

-- 
Best Regards,
Wangao


