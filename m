Return-Path: <linux-media+bounces-28049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9357A5CCF0
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 18:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D23189EFFD
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 17:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3DA262D18;
	Tue, 11 Mar 2025 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="klp8U3fW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA2C41C72;
	Tue, 11 Mar 2025 17:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741715886; cv=none; b=o7KmYrFcPuz+pgR4NYI4r7CmWUlL5KKy4Le4KbmqJq3qFqeFBSV89bMq9OPZtZmiDoKqY28jOJM+Hmx7PBOmFuE1/vTSx8wVALQNv/oYrCQjIAMQhVNsqcg/UKLAgEqpQI3W6waWAmVEgbaVUfICrFgEZ3fkJ7zfO1vcH//qLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741715886; c=relaxed/simple;
	bh=jRvoZP0Oi6bF9k4nRjhziJ092oLdVTH/sDpdR4RT6k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=be8V+10QMn7Gzwb5/5knIvHadZUcNdiogAepKfxPJ2pE6UOpQdSkrFES879J6FQCP4P7cxLfc6naIy5ruSWg7Vy+CnKdP+dxx8brYjxTiPdpJvadn4ZIOhBKsp3XZ/NrZEqAV0W35EdgLbSAuw5Kw1NPsMsb14VUxZ1oZLTQ5tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=klp8U3fW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BG0Twk022356;
	Tue, 11 Mar 2025 17:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRvoZP0Oi6bF9k4nRjhziJ092oLdVTH/sDpdR4RT6k8=; b=klp8U3fWX97UfEgV
	91dgP5ZwKG344nh+cyW5J1mHybkt2q/SQb04YdVL8EUNJ+/j2sVTTXmWRbxiyP16
	/fbGpDzV0SFLvkwgq4rFM9RZ36fAqeOGu/NQnxt69kPJ4QvS1HaaGF4j5f7wQFPD
	RLkntOWp3n0QmpVtKDIKwI53pX68gjHZeZK9txCgDm/lG6LzFriyyjwMi+AQtZ72
	POyPkHI5klVYYmpkxnYiVm08pgu+FudC5bUlblDAUPr1dSR6qn8URErkIcEcK3LJ
	87AgEOyhjamL57lsK7IqpuJXmm528f7ZDrWpITq4HQMXOKekNjdq4lVWnVsjZBRq
	oO3yOw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyuhh3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 17:58:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BHvxqt009748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 17:57:59 GMT
Received: from [10.216.38.182] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 10:57:55 -0700
Message-ID: <6de6ed76-d3fa-1939-d6b4-c11112751406@quicinc.com>
Date: Tue, 11 Mar 2025 23:27:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-2-5c807d33f7ae@quicinc.com>
 <7e8350dc-dab4-4306-877c-59139b049e26@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <7e8350dc-dab4-4306-877c-59139b049e26@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67d079a8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=lQSGFeR0kZEl4yj-dxwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 5DeqLIdU0XdF8PSLRKvgZoCnhDBB1-nE
X-Proofpoint-GUID: 5DeqLIdU0XdF8PSLRKvgZoCnhDBB1-nE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=973
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110115



On 3/11/2025 11:05 PM, Krzysztof Kozlowski wrote:
> On 11/03/2025 13:03, Vikash Garodia wrote:
>> Document the IRIS video decoder and encoder accelerator found in the
>> SA8775P platform. SA8775P has collapsible MX compared to SM8550.
> Does this make interface incompatible? Does not look like.
Just the phandle specifier in the DT property, otherwise same.

Regards,
Vikash

