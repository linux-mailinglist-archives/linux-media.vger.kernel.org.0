Return-Path: <linux-media+bounces-55300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFcrLIb5sGkRpQIAu9opvQ
	(envelope-from <linux-media+bounces-55300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:11:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275625C422
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF2B2310A3AB
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 05:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50418322B8A;
	Wed, 11 Mar 2026 05:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoG6iY+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVPmSIQK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705C1F2B88
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205810; cv=none; b=DatHGItuuFxlWO42IKCqxvoOw58RLkRWIyUSuKV+hXbOGD42Njb/22E0hH4RShhJnDjTFLbJYkeJ47yfp8hovIVnL8F4kUQd78AUXNHg+fzn2tSgsfFWpqWtT/uK3Qp3fBPW0Yx0ftBy/ogv092xlAu477+9jF5MFae82qQbRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205810; c=relaxed/simple;
	bh=td6gJ6eXpvP/Kx00f50jNWJIpNLaYr5gEHKsNbia0hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsnsHbHI+jkLJmlDqn545LrjYa4QKk3vwm5khw3zONlx+nF5Bhdqf5SsMhGIOYSZfurUlRofimLZBlndzd36zNjXdjHMpK9o2yO2HfBRMNdCzUCm2dEATGFVnhZtTGSzaJ0VE/x2pxehNHdpBQvhpKDiFx3PLU2ukJCUKbn1guM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoG6iY+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVPmSIQK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4WLhg3893457
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2vxDD57Naur3Mm4cBUoFi+QY13c6vSbwvJCxcHx9nA=; b=EoG6iY+s6kF3enB6
	VNo6aNw2J+u3bgdlrpea3Vy180/YApnT3vkb0ug7oCxrruveWn5SpfDgDzguEsTi
	/SQNCiMT9XyNYyGM0PgX2X4f0M4x/nE9EYqsNH+iFqlI0isrt4NMGm7cIHn3XGJI
	H9QL/LR/FVshPYqXa01yL6dzB56mGm1sjwjBf8yVekhypx2SzFd7SRH7OcwfMKB+
	IVPguu13peaEK7jzbXn0uhXI69PN9ml2l9H6EYY9loiqxIPHy6kHjR6lJDeRglBQ
	LF/vPGHQduEdCLpQWMHwj3kSEHg+txaeVxlFaA1LR1H68serBXbIY5mq5xiNAP63
	U9uRtw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyu6d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:10:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adc527eaf5so84497245ad.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205808; x=1773810608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2vxDD57Naur3Mm4cBUoFi+QY13c6vSbwvJCxcHx9nA=;
        b=bVPmSIQK/Dez31iW07y/iJoZoPNY/QsQt4/7aISFDaSmXteFs1i6VrCzDmhBzkjyDG
         B2/PcspiIQ/MQrhztmxsVV49JFfilBiY1UWzcATKAhbkAOeJk5zWkx6SaNp+RMD1L2fK
         mUr2+eK/UGL5EZBdVwL4AMMaCZzfsaFPIFbSx9i2DjAs0dkWwvfq5sBqntEj8zWiTBPn
         eJejucRPUwEy6TkJAWbP/xRCNp857G0HIrhbxTWtF6GP4+QFKa+eWTZKIn7QSv99OvG4
         kvYFmeUY4Z47ItY2BYpSRWApqNiHQqLft/RImlD3gpL3nfkJp59Dpk5TVZM/stScmILD
         cQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205808; x=1773810608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2vxDD57Naur3Mm4cBUoFi+QY13c6vSbwvJCxcHx9nA=;
        b=qh7JhtlSvBCOn7cFi4zZrEUHPGffMKjIjGxMQdup16oCb1ZRga8z2WCnh7n9ucF1mN
         hTyMFHgKZs3EU749R0THvfBafMd0LE3DoIet02G00mAGYMUf+IPDaiy5zfjKB1leoiOF
         NMT5gB0PHrbeZGDn4XqJLJ48XrgSfDFL+DQhLHYNR1oqxM5LovsXMeXFhZgb/1jgevZB
         TZex395qQWixLHjJvBTwhvi1rAK9nKhdw+ZVqK+AFMdFJx8u1v2cQkeomEDaUxvu/WQN
         /lp6D6mDsflQYcTcmRkI3kIa9jqkx8Y0Y7+/qiE6MyQHsB/c+54FtdU+/QkuS4r2v59R
         kWSw==
X-Forwarded-Encrypted: i=1; AJvYcCVzXXDCsIZhVz0GjfTCNGoFFmgecn2xBskkIh5zL7hXhV4nEIOELm59vpjLmyDasNuhcYss/FG/bbV0jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt91hTPNa7afa1DGFfRI8GqUSuByH5TJW49Vovv7Oyi9iicgTJ
	IctJSX24ZC/OqbV5NQm+S3/1O4n1aM+MkXl741rr0xIwucEH8V2HEJoGX4jpu02tFQuknjyOgJg
	fwU3cDYwjE9QPNJKDNof0Hdt7TlwESlyZF8VNWrZBsi7odqHcUVp5RrKivbfK/CrLaA==
X-Gm-Gg: ATEYQzzwMvw4W/q6Yv3T6E4vM8QyJweiMgnrzuMQwRHUWypi1rxnWui5ErwV75CKMCy
	ZKJmyETbF01PZkn54HQOd6W5K61+0k/b3zSv7k5pxNINgsoavyMji5L+ClqFf+tCg/fX/sxWt1X
	DOXZXma/WA+FeJKaVHtwLFLh//IjKMbDsPD+LyAafRlax815xp2FcJqQ/iAeVKjN7Ldwktdbo9A
	+9dwRj6XuWoUUT8VxA+2l8irmqt44VrdjRGjfFhhjO9DO9K4d4mjyh1kPg3oMSP2AhMSzXeFZPj
	FpM7ZGmOFmJPfEKps9J3ZYpEvKkpVHDZ1obKwjZoXUXwsSntww3f8pTxuwgy4lQ82udAS17KGRl
	LKsKnq2UdvFjsc5UKt5xW57ioX2u+5o0F5nuHCLtzHnX/PXoOj/Uz5Q==
X-Received: by 2002:a17:903:41c3:b0:2ae:7f3a:b213 with SMTP id d9443c01a7336-2aeae8ad04bmr13377235ad.47.1773205808349;
        Tue, 10 Mar 2026 22:10:08 -0700 (PDT)
X-Received: by 2002:a17:903:41c3:b0:2ae:7f3a:b213 with SMTP id d9443c01a7336-2aeae8ad04bmr13376965ad.47.1773205807850;
        Tue, 10 Mar 2026 22:10:07 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22287dsm9501685ad.12.2026.03.10.22.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 22:10:07 -0700 (PDT)
Message-ID: <23d6a9d2-7102-78d2-053d-037227edcd69@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:39:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 10/11] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-10-acf036a3c84c@oss.qualcomm.com>
 <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
 <2w4urjzvo3ccmwoggjzzxxjhfgmplfgd7ojj765yulnlkesoit@nfancaoqqvzf>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <2w4urjzvo3ccmwoggjzzxxjhfgmplfgd7ojj765yulnlkesoit@nfancaoqqvzf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0f931 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=eRBfbRx1O6b1X7uP3MjCRw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=720-SxrjJScskddFLLkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7XihWKZ4UMB10fh0XMG9zhNXVb7pB2VJ
X-Proofpoint-ORIG-GUID: 7XihWKZ4UMB10fh0XMG9zhNXVb7pB2VJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfX2o0PmeW9ZREg
 z7lYw2y9DDbXBB3fON7+deF39cS6nKHpwA4eu0hqkp38yuSe5dnHLBmEPPU6ubqyPZlvHg42TVL
 GwTPz73jTj1WPtygXgmHbnxC91Nuuyq388YTQDFLlMSTuFib+SwHI5SxW81tfaqXAsYI/u2JSZN
 cYX0rg9ckx6XgyMofQ4nkmbg9LwzYB4htrVkog+I8ukcs1fktqrYxq4XHE1xaBeTODDJ5MIivpU
 p9j+Ey1mPRHrNZyoi5w4guGMioyNFfeIWdn7uwyNCFCWC++npm/hMQxChWFUiN2APfL001VCb4Q
 2p0jfGLLLEckvlcXTEHv09GvwYJ3LaaMGD92OgGN5h0OE/mpArf6xSyvdhmLlRk8z7ZD1lmuqvM
 NGULU2WVKtFne8zqI8CyeKrwyuXvtumtrEcIlFdb3SRlSNJyKSsfqQa0TGpB1LTNrAhn6Yy3BtN
 vKScjGZKu+XRMptjUFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110041
X-Rspamd-Queue-Id: 1275625C422
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55300-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/11/2026 5:53 AM, Dmitry Baryshkov wrote:
> On Fri, Mar 06, 2026 at 04:28:48PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> index a936ab2aedaf..be3449861993 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> @@ -201,9 +201,32 @@ enum platform_pm_domain_type {
>>>  	IRIS_APV_HW_POWER_DOMAIN,
>>>  };
>>>  
>>> -struct iris_platform_data {
>>> +struct iris_firmware_data {
>>>  	void (*init_hfi_ops)(struct iris_core *core);
>>> +
>>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>
>> Makes sense to split firmware-related data out of iris_platform_data into a
>> dedicated iris_firmware_data, one comment though, get_vpu_buffer_size
>> should be in iris_platform_data since it describes the VPU’s buffer
>> requirements independent of whether the SoC runs gen1/gen2 HFI firmware.
> 
> Not really... Your patchset to bringup Gen2 on Kodiak points out that
> this callback depends on the firmware: we currently use
> iris_vpu_buf_size() for Gen1, your patch have used iris_vpu33_buf_size()
> with an explicit comment that it requires a bigger buffer.

Agreed. However, that case is somewhat unique because the firmware code
changed significantly between the Gen1 and Gen2 releases. In general, the
buffer size is determined primarily by the VPU architecture, as well as by
the features being supported—especially when specific features require
updated buffer allocations.

Thanks,
Dikshita

> 
> 

