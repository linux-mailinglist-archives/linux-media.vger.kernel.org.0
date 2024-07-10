Return-Path: <linux-media+bounces-14858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD61D92D2E7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 15:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5496FB27C4F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6BB193448;
	Wed, 10 Jul 2024 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k2TSwLen"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA411922C9;
	Wed, 10 Jul 2024 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720618431; cv=none; b=E8tlmXdd/T6sSN1w7X54mK2bhxDjNm9T10WHz7LQfFKqsLRkCAFeYssv9oyCu/qr9m/YzeVWVzwuuzrAYgMyjuMvM3If37n/gzDBIUaLPft2pcFw7QzjlVPPmq1QjuSYKpzq0aLtddOOfq+oLfJaiFdvmU4tP1bsCceXL2tUwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720618431; c=relaxed/simple;
	bh=JxC1b1DOzM6+22LaPEwtC9M+vPgX91o112/b/28+6Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ODJjfD1LWUW2siq20H9YCn1yXJxuU24QaJ2dSSOPyAavYIW+uGR7yJxLC4OvXd2eN/hyFq/rDy1i0HXIhvcMCwD1NC/83roXWqBDUdNrm6mARtpvnUH7EeJ7MfyVK8Aw2csDUU//MXhFQs0qKPCLf1A8phu1/89uC7w14RQZAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k2TSwLen; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A7ngLF026708;
	Wed, 10 Jul 2024 13:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CHTQcGxnfbCSKtvZW1zamqa2/4lL+6xBB0Ei/bCngs=; b=k2TSwLenybgB6JfU
	GvrIf9Hgr6+yl5QONA8DteaNYmwx7k79pdZdL+1u9GSSfsJ2XBN7tk8n4aI0VPep
	qKUi/tCrv1mfaJV2apS1EdYBNHo/i4WWkOri8+YrgxKe+/LErT3HDOT8GkzxuIbe
	6pVQSTzLOGP81etdxO1Z1JQ/CVS0alyrKc2s4xQERaydP6Ju2ZiNIT//1NZsVHOl
	p3vf5/ujfyoyDk3v9EXCOho3CoxNVJbYiuQv6RQj0fgE2kxPmQigGvYfu0KFLG9V
	sNgNq7nvAyA7Gh9YY+wwFcJIyKVd7YOyphPkdnRMRXFXokhQfAajiOl1RzBfSJK0
	o0kXig==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdkrcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 13:33:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46ADXjsB015226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 13:33:45 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 06:33:39 -0700
Message-ID: <70cb6434-76af-42f7-9bb4-810ac561c0e3@quicinc.com>
Date: Wed, 10 Jul 2024 21:33:37 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2
 two-phase MIPI CSI-2 DPHY init
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-9-quic_depengs@quicinc.com>
 <02e34bdd-3e84-4f93-b9a8-a814fcfd465b@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <02e34bdd-3e84-4f93-b9a8-a814fcfd465b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WKTpgsn9z9sADuTfwZP6HXZtzKU-smjN
X-Proofpoint-ORIG-GUID: WKTpgsn9z9sADuTfwZP6HXZtzKU-smjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_09,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=901
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407100094



On 7/10/2024 7:13 PM, Bryan O'Donoghue wrote:
> On 09/07/2024 17:06, Depeng Shao wrote:
>> +/* GEN2 1.2 2PH */
>> +static const struct
>> +csiphy_lane_regs lane_regs_sm8550[] = {
>> +    {0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> 
> Definitely not DPHY 1.2 init sequence.
> 
> Could you update to something like /* GEN2 2.x - two phase 5 Gbps DPHY 
> mode 4 lanes */
> 
> Since the PHY can be in DPHY or CPHY mode at different data-rates it 
> would be nice to call out the exact mode we are upstreaming here.
> 
> ---
> bod


Yes, this isn't 1.2, it should be GEN2 2.1.2, thanks for catching this.

Thanks,
Depeng

