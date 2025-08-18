Return-Path: <linux-media+bounces-40060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469FB2975D
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66CB24E1F5B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 03:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760E325F97C;
	Mon, 18 Aug 2025 03:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c47OxqGV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C705DF59;
	Mon, 18 Aug 2025 03:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487709; cv=none; b=t7pMIm/RqtPYcqB3pm0rGLqoLmLACYpDx1AaVhxMKb7qk67xAEXxCLym7PFeaIm7d4LGwRJQts1bSBDA6ImkXI4BjyGg4bMm2/TJXbDQPxzAKKuLmsDPLayH1PHZHz1pnsB3JKh2inIx71Gm33PUDoT47nGMCeBy6he7eo7MrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487709; c=relaxed/simple;
	bh=VEdmm8Ly9rd5GgdWQijBdnCM8PhJeNKqtW5R3z9XprE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lBQzzAmPhTTX8z7H6fpYBHNJzT3oDxgUsEa7qeQVbqLFiTz438okB7OjZAKk30rGX8LCS0jV1YzQFTMfwYv92P1OPgpv/evTwTDr6FveGLiSdj+T2JG8eD6f5lo/0Hbqak1o3lzWkSbvWzyHRVoAd1mrenpDKETV76EwDP7+GKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c47OxqGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HNWTro009258;
	Mon, 18 Aug 2025 03:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HOClPwCZBAzYCHxsO6Lv+hpRwszaNAO4tX05QwrBaw=; b=c47OxqGVL5TPVXi6
	bvROd+ldghiOVfj1B2R+iLGQvyLFEIrm/i1Bf1tfOrcQPToydWmsHe4Vno4KrqOz
	74PXJEQrtDtHJtavZfNe6AvJ0C7JCZbL43uetSWyKIQN1qrChzw9sNgwUmEXxCpH
	ClTR/PZIA36YDimpPN2jexLMpqobghFnpI+/8J9gR8xsM+J18sygWx541HSkQSKW
	BD6Yrt4UyD9qQ9oeLNjfB6udxAGqyDktR6aZ6yRsKGfRKxS5S6z9qBuroyK7q64T
	k//G+sfiHdhbytVScEXPkIKNsHpFvQ55FMoxTLZGEXYRpRlLiQusc6/qmskZ7g+T
	CtvVsw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbnbawn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:28:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I3SMJL004801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:28:22 GMT
Received: from [10.50.13.61] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 20:28:17 -0700
Message-ID: <6b3a247f-5d54-0e5b-adf7-68a126d08c8b@quicinc.com>
Date: Mon, 18 Aug 2025 08:58:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 11/24] media: iris: Add support for video encoder
 device
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-11-c725ff673078@quicinc.com>
 <e4dd20ac-84d8-422a-95a3-4d5c77b875a0@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <e4dd20ac-84d8-422a-95a3-4d5c77b875a0@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfX9XXuHCQLIBJa
 006TZds4LzU7ied11IQ9Z3eIaf62zBZDuFYpfxhOmIl5nfkEsoiY6+zDaYXb4+GCNSlhnfVEnX4
 Ofh74+HBqXleqtpogdihBdpLO6A5Wu7RVNn6FbXL5TQpw1XIsF9sRP0VW/TFG3tVZccrn9nX2gM
 qAGWbzJeJpB5WY5Ls2QD9Ine5rWnlDdieWCIHlyPXW+C4f1wjogM/l7biCyA2n1OTg5LSP6sgIi
 USDSUddFFca0KfllzMmpDjN3+0fExsgHMkYA6GuI5p8zZPdI1Q1RlZa4ngYMUz/H/pysLctgye+
 jcFmIt07tst+LqaHejRgnv+FPWwimMJUC7V3MeFBYtA6DgA/uFtArCRkbrERQPYT5CAwhoSi2Co
 Mu22yiZ2
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a29dd7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=YjSu5EbHJjcfT-LQ2oYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UR8NsWowYyEyKePGgoJUyaP737wQB-B8
X-Proofpoint-ORIG-GUID: UR8NsWowYyEyKePGgoJUyaP737wQB-B8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001



On 8/16/2025 4:51 PM, Bryan O'Donoghue wrote:
> On 13/08/2025 10:38, Dikshita Agarwal wrote:
>> +    if (type == DECODER) {
>> +        strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
>> +        ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>> +        if (ret)
>> +            goto err_vdev_release;
>> +        core->vdev_dec = vdev;
>> +    } else if (type == ENCODER) {
>> +        strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
>> +        ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>> +        if (ret)
>> +            goto err_vdev_release;
>> +        core->vdev_enc = vdev;
>> +    } else {
> 
> A bit of duplicate reduction.
> 
> if (type == DECODER) {
>     strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
>     core->vdev_dec = vdev;
> } else if (type == ENCODER) {
>     strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
>     core->vdev_enc = vdev;
> } else {
>     ret = -EINVAL;
>     goto err_vdev_release;
> }
> 
> ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> if (ret)
>     goto err_vdev_release;
> 
> once done

Sure, will fix.

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

