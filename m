Return-Path: <linux-media+bounces-39561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC479B22342
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A7133BF24A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B162E8E1F;
	Tue, 12 Aug 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AfUjRdMF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0946C2DECD8;
	Tue, 12 Aug 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990951; cv=none; b=R6oRKyZfmAnJ5ozNGX1nWg0DPovt7H0xnd1rc15lTY2Zzw+Ja1qahGArISXnj/dFPIQHglV2Qa0ZGJ6C7131e3Y5BiumT9k0dCqvSfNGNygLJJ7cSPnuJSVoFtlSLXMayTsO94DNzd1jPdhIzydGcZl1el76Go5KyWQlh0HkBAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990951; c=relaxed/simple;
	bh=HJ0KxG5lbLaI5hiEc8MtSryj/4T4H3dyzApWoG552iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XwwBBfi2EMWvTcEC49vgS/0p46gjAHLj7Oh1wYtWd6jtE/zbExU+hhhlf/0t31pT5kGgliCJKwMRsUXKx9FHDfid8UVFzypFVGLnHBJNc5FvpLKh67V9V2ZuF0o7rzGyNmU65KoXgroO1nyAxr2Z7slCwkoElCwW9xnr5y1+Pqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AfUjRdMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5cOfl021620;
	Tue, 12 Aug 2025 09:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hY8bI4WiZJyN9ZrRHaTZK1FNG9pHOnKhL0nDCGU3KD4=; b=AfUjRdMFwXGLm/1b
	Ey67L4soNMcREcuALH4GRSa6UOpIDNKodcpnggYD6MEeEd0zBVHLNea6JxyLn3bm
	XmUeclFofHpEmBIqboz+3Uq68fDS3khVIft45eoF55Vunr+wgFhyCXs+K2hLtVMG
	W5lXwPFwPdCQTlKc/UyW0hCGVd8rw/mHdyMYRqUV6+Ih4Sy+hbV1FQVygZmLO7Oi
	SWC0Eiv1/ywdtEo2uShfgjcKmH8u5bldp+qxo9dsB/7ds5ZdW6KacRlEEJ+39hhs
	VeOz+Y5Kf71tkQ+BPrgtmWeW/i534Ya7OQXDbA1iTQpHXyDFeylsEITT3cR9LUng
	6AkjBQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj47jr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:29:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C9T0r8030208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:29:00 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 02:28:55 -0700
Message-ID: <76731f2a-d120-ed3d-6a1c-e339b0a6ad10@quicinc.com>
Date: Tue, 12 Aug 2025 14:58:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/3] media: iris: Add support for SM8750 (VPU v3.5)
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <c009fe77-8590-c467-a0a4-76bd6ec7cba4@quicinc.com>
 <363cfc88-9664-483f-9503-9eca7c8e617c@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <363cfc88-9664-483f-9503-9eca7c8e617c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX+hKYD1oleovm
 KVPWpZszY7bMwxaB5n7mQ49UxhWpU4ME9x74HrUhZ5Lpt4Vhae0BeNlb7Itx56Uz12crUL0g5la
 SMTtwPlevcDO1nXg5N8Hdf4GjmYdy8rxwwxYpM20qFv3SdIBveHPkEIiwxbOcMm6W2j5HSgohmG
 L8yV2ybe5rtoAHU/fVSjg4NUag5jeeYZz3DY07kiZwHL3hKSLI0iyPTbNqR0y+nWALIGqSteGr4
 4GCfn/SdpRfZK39/JP/JtCcrE2Ouw1wyK03+U4YU9gqwppnZ8BMg6gaWZZyLD1bTtmzfFABI4/P
 pAT9RilD9/gYeJ7OgGyuvJQRjt+HGLTbVg/0gy7SEDLgmVLZWMB9WyIMfGs58hPsuIAXXXk4ej9
 OUDvtyRw
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689b095c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=S3NbW_dMZBFmUMV749MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: V-o9tBp_jgO2FBk4F_6rdr1N7abrqWlo
X-Proofpoint-GUID: V-o9tBp_jgO2FBk4F_6rdr1N7abrqWlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027



On 8/12/2025 1:29 PM, Krzysztof Kozlowski wrote:
> On 12/08/2025 09:52, Dikshita Agarwal wrote:
>>>
>>> v4l2-compliance report:
>>>
>>> v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38
>>>
>>
>> Thank you for running the v4l2 compliance tests with your patches. While
>> these tests are helpful for verifying API compliance, they do not cover the
>> actual functional aspects of the new SOC support being added.
>>
>> Please run a decoder use-case using either v4l2-ctl or GStreamer (GST) and
>> add the results in this cover letter.
> You did not provide such details on your submission:
> https://lore.kernel.org/all/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com/

I have mentioned in my series that I have used both v4l2-ctl and GStreamer
(GST) for encoder testing, in addition to running v4l2-compliance. That is
what I am asking you to do as well.

Your cover letter only mentions v4l2-compliance, which does not verify the
actual functionality of the driver.

As a maintainer, I believe it is my responsibility to ensure that anyone
enabling support for any SoC with this driver has tested its basic
functionality. Please note, my intention is not to block anyone’s patches.

To clarify, I am not asking you to provide any test reports. If you have
already tested this series with v4l2-ctl or GST, please just mention it in
your cover letter.

Thanks,
Dikshita
> 
> so asking others of this is just unfair and unjustified obstacle. If you
> have technical comments, then share. If you are just making fake
> obstacles to stop some patchset then refrain from commenting.
> 
> Unless you want statement like:
> 
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and
> Gstreamer on SM8750.
> 
> Then I can give you such statement, just like you did for your patchset:
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and
> Gstreamer on SM8750.
> 
> Best regards,
> Krzysztof

