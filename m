Return-Path: <linux-media+bounces-18498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8FD9841C9
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 11:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68891F24895
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 09:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98284155726;
	Tue, 24 Sep 2024 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NfeFf3Lz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956E61547D8;
	Tue, 24 Sep 2024 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169224; cv=none; b=LtY6tWyGwOFBjwf/WG6aoI8Zzcx2ImXzY1YshF1nca7HuiQIhL3YBMxb+K2KbA4VrCGP9SBboOo0Bc3RHYV6rJFEWbV97ujKM12T/4gwRDNMPoMU6yAZ84X50gOky4MXXx+XcboOyYeTzJ3y8blhgUyKN/sbGjQO48zTLbzWwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169224; c=relaxed/simple;
	bh=lTJFEX70Tnr0Fw5lsQ72ydPKnO3WrZEIIZkapGteRCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TNjVicql/+xMhQUwnTZkuRU37FgDnGNKEyjrlMwmY/8A1ZQIryk9SW1n5DdL/ES0X2tO/wcXj0RS4oP9I2K8L0wVg01qDTfbDSWwSNNZkte8K9mYLgOUqFacAfZzLlEZGeQQqWeMhB+hq2UTiV+lRhp2eoUKB/yWBnDwdHDMPoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NfeFf3Lz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NNkhHF031702;
	Tue, 24 Sep 2024 09:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0oaTA2N1s7C2vWalnp91IkLu0tiSvZcDmbqZbmr0eE=; b=NfeFf3LzgaVH71Zn
	y0r+M1Xc1l6PbVMD6z5qqgICraNKNwfGdHEjCwjTDbZmkNIzXz/LTdUECnA5mFCL
	zlzKYdgb0qkFiy0dreXcKmgYUU9SX4Hxf1ohA2Q52lbgrYhmcl6cAQJ0Oef44P5N
	FDDNNY0J+9oXhdOaLI3gEEMNGSJGVFltLkOD/0Di0VX+kuRU5VmTtQyPRVqTkR4g
	acjE8G2GVgpLjX1snGQwSgAdD0idSZLvrbyUb999OzCoLr3U/O1bXr7zteBFn5kx
	eMDuzCk3oHkBx51KkUg0WvTXOTKrfmSUSNYmhOF6qC1iqQ/UYfS/wUcs1VolG1lE
	5FQL7A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6r07d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 09:13:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O9DZtp005104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 09:13:35 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 02:13:31 -0700
Message-ID: <d82ee974-ead8-5729-ec04-4ed039f6045a@quicinc.com>
Date: Tue, 24 Sep 2024 14:43:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 09/29] media: iris: introduce Host firmware interface
 with necessary hooks
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-9-c5fdbbe65e70@quicinc.com>
 <06036309-a7cd-4eb8-b7bf-1704f49ffdf1@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <06036309-a7cd-4eb8-b7bf-1704f49ffdf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kzn99QocKUDptBJMORb7II7zCGR7iRSW
X-Proofpoint-ORIG-GUID: kzn99QocKUDptBJMORb7II7zCGR7iRSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=601
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240063



On 9/5/2024 6:06 PM, Bryan O'Donoghue wrote:
> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>> +enum hfi_packet_port_type {
>> +    HFI_PORT_NONE        = 0x00000000,
>> +    HFI_PORT_BITSTREAM    = 0x00000001,
>> +    HFI_PORT_RAW        = 0x00000002,
>> +};
>> +
>> +enum hfi_packet_payload_info {
>> +    HFI_PAYLOAD_NONE    = 0x00000000,
>> +    HFI_PAYLOAD_U32        = 0x00000001,
>> +    HFI_PAYLOAD_S32        = 0x00000002,
>> +    HFI_PAYLOAD_U64        = 0x00000003,
>> +    HFI_PAYLOAD_S64        = 0x00000004,
>> +    HFI_PAYLOAD_STRUCTURE    = 0x00000005,
>> +    HFI_PAYLOAD_BLOB    = 0x00000006,
>> +    HFI_PAYLOAD_STRING    = 0x00000007,
>> +    HFI_PAYLOAD_Q16        = 0x00000008,
>> +    HFI_PAYLOAD_U32_ENUM    = 0x00000009,
>> +    HFI_PAYLOAD_32_PACKED    = 0x0000000a,
>> +    HFI_PAYLOAD_U32_ARRAY    = 0x0000000b,
>> +    HFI_PAYLOAD_S32_ARRAY    = 0x0000000c,
>> +    HFI_PAYLOAD_64_PACKED    = 0x0000000d,
>> +};
>> +
>> +enum hfi_packet_host_flags {
>> +    HFI_HOST_FLAGS_NONE            = 0x00000000,
> 
> Are these NONE flags used/necessary ?
> 
> If they are dead enum values, please drop in the next version.
Sure, will check and remove if not needed.
> 
> ---
> bod

