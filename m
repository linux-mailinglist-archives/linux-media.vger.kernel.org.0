Return-Path: <linux-media+bounces-63220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDIIO3hGHWpbXwkAu9opvQ
	(envelope-from <linux-media+bounces-63220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:44:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867661BADB
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48AD6302A43C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 08:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB55F38D3E0;
	Mon,  1 Jun 2026 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kije7Vny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrEh4QFt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56538657A
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303280; cv=none; b=jtddJ1ymex4ASfVa4K7OygNVKinCGzADEFIZhrVS9dOE8O2Xox0jmreSu4zs2HJ479w1RFKhqazGi1CLHtJREf4K3yXe7A9vvbjEND05i/RgdFSta6pm2PQEAyD1WprnxWugaZOWpKVV5EumJAX4tAPun44GxBXd1AAJg7CJki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303280; c=relaxed/simple;
	bh=FAe1TTeXB/wf4FY/upQUFO7lPWEm3eKXvYi2TIJKSB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvi82hL/7GNjAi9KdjIheRlyixv5U4hghhs/7RUFqY3U8+EF4vE/kJjkkaKYB1d/IaRh01imt/MsHgIdcpG+G4yLPyq7pJQzehaeQhLHWSWcTxa7xuLxwCXcP/gItQuYwuOwjrCDSWvC6H4b+rCbDoBIlLieZbQvN0g5GyDNmG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kije7Vny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrEh4QFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6516r8D51073320
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 08:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddLw5H24WRkJUgkUQGt/x5/4oKPT/MTVNGwDHrIL2qk=; b=Kije7VnyEPDpBDDX
	i74jZIHbNXXYwCwOxBNF5/ngVelMLQwSJJr4SPZVAK7iLG8GbMG/aBxVAG2eUofP
	u9f5+NQiImEZ3iiGVGVkOGds7ybf2YiGL0rrmaGzXeWDwJkph8XNB0L2nwNKzLVK
	x6h6xlOixHreMESEzn5J+NYFKp7TRTHMPJhLZELHh5WSwZmg98hefc03AGekxIWT
	j7jScj6GXoavJ6c3hDES1FIOt47p4jC1COCT/LbVDKsXldoXkhnWsLxzAAUqz0qo
	DReqou6iKzV9NeKXZ66TV66w5Mi5dlE3xmLAcaZAie1TEMvPXyEK2Pbuiq23//py
	ICc/9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7prnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:41:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84235f9b91fso1030701b3a.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 01:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780303276; x=1780908076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ddLw5H24WRkJUgkUQGt/x5/4oKPT/MTVNGwDHrIL2qk=;
        b=MrEh4QFt/1/FIChvgR+8WP+X421hADdEDbV1i4QVnFiu8TALIQmOmcsTv/smyMfvbJ
         TlSYQTNq8rwoAA1740InGMtNX7uDnUeELb2Usp7/yLa8CwSDqJhZFk6YQKRUof1gvpGu
         UsLFbrZAihZMzE2iSrw8xtQr7ma0wpyAZIlcU0jSzRR02K12+fhJIsJ0lQ5irBaZ9f21
         AZeQl84u3nE/2eM0wWyV2FYP0TI0CfslStag2Plka9GHeKiAxVD8wbY+cqfpnEVYiow0
         Sut8eIR633grUQUgBdi0L8PbgB1W4liH1MZUOJrYd/SwLXsNFWxbxeQGnlF8abbt6e8K
         PnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303276; x=1780908076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddLw5H24WRkJUgkUQGt/x5/4oKPT/MTVNGwDHrIL2qk=;
        b=NUqeRsgMDRtUnjmWYuzM85URkEqY1B4/zM8I180SU9bjzrLGWPNVgJ1Xl+kJc3RW2Y
         gvEPbQK+qkylbWWW9vwPk3xTPvvKmuv6i5okfFOgdPedwii37B0hedC8hLVuh/DBK/Id
         9gTtnAJ1XDgATTRVTBCnyUXd4p+KVTUn9MJLwb0eA/rbX624UgLdjX1Xi7c5bBWP0SfW
         esG46+oMj7Q12g3DTczvoSSjd8WrVopPQvV2rlgHn1mP7RoXywxrDofxTsgd5qieFcLD
         QElWHBf/Bmp+H2xGKujqxxanf6b81lokHIWa7jIXFZ6fo8vGOFx3AkldigB2CmRL8dl+
         MTWg==
X-Gm-Message-State: AOJu0YyCSG5wrnP5RCgfQjaW9ltp6KpMylJc3Y6Tb79k6AidxvIIocgp
	XnL+aPGohtAOqUjYncyDW9JznUaXlpyuGLmHDNAHUD2SKD67LW5R7JTO0FVBmlgS3cyIpCi1a1h
	ftPBku/eOnuyKg3FLvmByKDdnLcm35UfSpEfwSrBQkJWlAN5tRGS3HCgjdBS4J9w0Mg==
X-Gm-Gg: Acq92OGdaQd+gRLSngWV3TdElUIMWFyvk9NqB4ZSmMhE+vIYI+KwihX7DTaLgkYS9v9
	URcf/F23cxAP1fIoI94We++9kuBoGfrND2eGtAuh0UdpaI718S4HP0BqPNC+SIvqur+NIN7zgMy
	DxLWJkq1+cqBfabJmMXkPY5EpEHwRrTXWtMgWy2c7hjJvlbwPe13rFoATU5I1chuW5JkVgQt2x3
	z0ong52PEW/dmhxpJOYmuKBeCvJS1P8gDO6S7n4Eco1sTdbQz3aXBSdM4fytmZPOfRFdm+HP5ue
	aqRM2x7a1/Cd6wK5/8UKxfkg2oRBG/PvWSNs/L3SYPvaMwlTKzOSP6BVfJkSvM9rZ7ePIxpnKr7
	3TXRqXhX4tvTLZfr66bgg+wlT8A+HzjwHKZbn/R7NaS0J5dmnL1KwuRBRz3CB+UNx
X-Received: by 2002:a05:6a00:6f03:b0:842:2f05:ea64 with SMTP id d2e1a72fcca58-8422f05ec78mr6825722b3a.36.1780303276304;
        Mon, 01 Jun 2026 01:41:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:6f03:b0:842:2f05:ea64 with SMTP id d2e1a72fcca58-8422f05ec78mr6825701b3a.36.1780303275815;
        Mon, 01 Jun 2026 01:41:15 -0700 (PDT)
Received: from [10.204.101.69] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423f419128sm4920564b3a.21.2026.06.01.01.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:41:15 -0700 (PDT)
Message-ID: <7e8315c8-9255-4a88-81ac-5363dc05336a@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 14:11:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
 <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
 <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
 <3baa753a-f716-45da-b1aa-7406f4092578@linaro.org>
 <88f8519f-31d8-47db-b0d1-f1d0d8c9df1f@oss.qualcomm.com>
 <0fb85345-ea8c-4294-bf4b-220617c9f089@linaro.org>
 <e6df389b-cca9-481a-b2b9-5915cd6ff88a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <e6df389b-cca9-481a-b2b9-5915cd6ff88a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6jrZ4pcWT-NOueSwNKCiYrjoBsJ5WQsD
X-Proofpoint-ORIG-GUID: 6jrZ4pcWT-NOueSwNKCiYrjoBsJ5WQsD
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d45ad cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=785Dn-WPAAAA:8 a=TmxWA70rf8N71SPJt34A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=b7-gl1MdSEcY02uTy1GE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NiBTYWx0ZWRfX7FSTyalzeLc2
 N9Pe2NtnJiDQDAZMpiAUZcvGqo7JoS+D8G/TVEFhJYLfIOr8uu6rljbYDWCRYMfBxh7u6tFGOS/
 8k8yez0qrpxWj3Bv2iOT9UH2Tpu+jyA4hGKY1ITLpOF+HrSTWTApzp/+C7V2ZLY6NC5f0Vf6xjE
 mQUrnYbD7xN6xuDZLAcGmLLWPrZMYCY8Sg1ul3PftSCf6xysIVHd9d9AK/JlTkGD3DTXXiXxLhR
 2rFfbn2daIlzxKNI8CihJccX3FXo/QwfEpOm/hCJ86IYth1UsjY2lqpsvBJP3FpqDjg5hobZoql
 2qAizc/xDgYMn71GvpDFVGrm2OsdRlvFthJMM/ofxSoiHg/QyeX1CLYZqRA8BJK3ycJ2cJdLDIa
 YKE9xLk73fWP1MHckcyTdPc0lNOXtVrLoPaGq9ewwoQmkkFLti5xBc3HhU3AtLU6cOAi0aillL9
 X1pROssaeyVBAqN2Ijw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63220-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8867661BADB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 6/1/2026 11:22 AM, Wangao Wang wrote:
> 
> 
> On 2026/5/29 21:25, Neil Armstrong wrote:
>> On 5/29/26 12:33, Wangao Wang wrote:
>>>
>>>
>>> On 2026/5/29 17:55, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 5/29/26 10:21, Wangao Wang wrote:
>>>>>
>>>>>
>>>>> On 2026/5/28 21:26, Neil Armstrong wrote:
>>>>>> Hi Wangao,
>>>>>>
>>>>>> On 5/27/26 06:15, Wangao Wang wrote:
>>>>>>> I tested the v4 patch using the gst command you provided earlier. 
>>>>>>> The decoded output still has the previous plane misalignment 
>>>>>>> issue, but all frames are decoded successfully. When viewing the 
>>>>>>> raw data with an image player at 1920x1080 resolution, the first 
>>>>>>> frame looks correct but subsequent frames appear shifted. If 
>>>>>>> viewed at 1920x1088 resolution, there are artifacts at the bottom 
>>>>>>> of each frame. I've attached the images.
>>>>>>>
>>>>>>> Also, have you tested the 720p case? I can't get it to run on my 
>>>>>>> end.
>>>>>>
>>>>>> Thanks for the report but I don't have access to the Purwa 
>>>>>> platform you use,
>>>>>> I've run test with multiple resolutions with display using P010
>>>>>> and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.
>>>>>>
>>>>>> I'll test it on the Hamoa T14S I have which should be the closest 
>>>>>> to purwa,
>>>>>> but it uses the same driver setup as SM8550 so I expected it to 
>>>>>> work the same.
>>>>>>
>>>>>> Could you indicate which iris firmware you're using ?
>>>>>>
>>>>>> Could you try passing the fluster h265 main10 test suite with 
>>>>>> gstreamer ?
>>>>>>
>>>>>> fluster download -c h.265
>>>>>> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
>>>>>>
>>>>>> The picture you send looks like there's a mismatch with the kernel
>>>>>> and firmware setup of planes offsets.
>>>>>> Could you check if there's a Purwa specific firmware property
>>>>>> to set for 10bit decoding ?
>>>>>>
>>>>>> Neil
>>>>>>
>>>>>>>
>>>>>
>>>>> Hi Neil,
>>>>>
>>>>> I also tested on hamoa, and it has the same issue as purwa. The 
>>>>> firmware used on purwa is vpu30_p1_s7.mbn.
>>>>>
>>>>> This is the result of fluster:
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WP_MAIN10_B_Toshiba_3       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_A_ericsson_MAIN10_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_A_ericsson_MAIN_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_B_ericsson_MAIN10_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_B_ericsson_MAIN_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_C_ericsson_MAIN10_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_C_ericsson_MAIN_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_D_ericsson_MAIN10_2       ... Error
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_D_ericsson_MAIN_2       ... Error
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_E_ericsson_MAIN10_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_E_ericsson_MAIN_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_F_ericsson_MAIN10_2       ... Success
>>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>>> WPP_F_ericsson_MAIN_2       ... Success
>>>>>
>>>>
>>>> Ok so this works fine, so I'm really wondering if your main10 HEVC 
>>>> is not properly encoded.
>>>>
>>>> Could you try playing a well know HEVC main10 files ?
>>>>
>>>> For example I just tried the 1080p and 4k 10bit files on Hamoa + 
>>>> fluster and it just worked as expected:
>>>> https://larmoire.org/jellyfish/
>>>> https://larmoire.org/jellyfish/media/jellyfish-10-mbps-hd- 
>>>> hevc-10bit.mkv
>>>> https://larmoire.org/jellyfish/media/jellyfish-120-mbps-4k-uhd- 
>>>> hevc-10bit.mkv
>>>>
>>>> Neil
>>>
>>> Could you provide the test commands? I tried both files and the 
>>> results from gst still show anomalies, but the results from 
>>> iris_test_app are normal. I'm wondering if there are any additional 
>>> settings needed on the client side.
>>>
>>> Here are my test commands:
>>> gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd- 
>>> hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! filesink 
>>> location=1080P_out.yuv
>>> gst-launch-1.0 -v -m filesrc location=jellyfish-120-mbps-4k-uhd- 
>>> hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! filesink 
>>> location=4K_out.yuv
>>>
>>
>> If I run those exact commands, I can correctly visualize the files with:
>> gst-launch-1.0 -v -m filesrc location=1080P_out.yuv ! rawvideoparse 
>> format=p010-10le width=1920 height=1080 frame-size=6266880 ! waylandsink
>> gst-launch-1.0 -v -m filesrc location=4K_out.yuv ! rawvideoparse 
>> format=p010-10le width=3840 height=2160 frame-size=25067520 ! waylandsink
>>
>> I have to use the decoder full aligned buffer size because gst just 
>> dumps the whole v4l2 buffer into filesink and frames are not tighly 
>> packed together.
>>
>> If you want to output tighly packed frames, this worked for me:
>> gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd- 
>> hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! 
>> rawvideoparse format=p010-10le width=1920 height=1080 frame- 
>> size=6266880 ! filesink location=1080P_out.yuv
>> gst-launch-1.0 -v -m filesrc location=jellyfish-120-mbps-4k-uhd- 
>> hevc-10bit.mkv.1 ! matroskademux ! h265parse ! v4l2h265dec ! 
>> rawvideoparse format=p010-10le width=3840 height=2160 frame- 
>> size=25067520 ! filesink location=4K_out.yuv
>>
>> There's probably a better way I don't know, but in any case gstreamer 
>> will only use the "frame-size" portion of each frame and process it.
>>
>> For example, you can convert it nv12 and dump to file, it will then 
>> dump only the nv12 data:
>> gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd- 
>> hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! 
>> videoconvert ! video/x-raw, format=NV12 ! filesink location=1080P_out.yuv
>> gst-launch-1.0 -v -m filesrc location=1080P_out.yuv ! rawvideoparse 
>> format=nv12 width=1920 height=1080 ! waylandsink
>>
>> If the plane offset/alignment was wrong, the convert frames would be 
>> wrong and playback would also be wrong.
>>
>> Neil
> 
> Thanks. Using the commands you provided, the output file no longer has 
> the previous issues.
> 

Thanks Wangao and Neil.

Wangao, pls add your tested-by.



