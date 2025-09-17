Return-Path: <linux-media+bounces-42660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD8B7EB56
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26DBA1C0291E
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 10:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963493570DA;
	Wed, 17 Sep 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0uIKsaU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F76ADD;
	Wed, 17 Sep 2025 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758104230; cv=none; b=LQR21EmbZtpDumu4OkFuUQQE1mlBeXNjKjpJ3cLodA1cc/ClkliBFcwN319Ckh+vQp957Fx1c3oKOsKQgR6iI3dK0Jb2r49QjF6S7JLIuyiYJ1gVBgxjPWOTiHmImvozGMaVXGJVh2pG1Mb/YRl3V0rrbeKSTzyuRqWdXvpocqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758104230; c=relaxed/simple;
	bh=I1gr9r69jlTdi7WrDbcTVQMuxftBJAz2+Ve90aHs+vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bft6z6uxRatOppMIf+DHJUwbNNct81IozkGWrwrFGV3V18GdcEmtxlqPWfciaOnjWXKJOgcr7qUi5ea4LFEz7d5lJziwgr0P/31lEtDsDgu4ZP9y9gpkdg7BNbb1KbKTM4IpRtvZooqacS2cBB8oFeAm+wzUS/A1K1fnp21BH8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0uIKsaU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZqH021413;
	Wed, 17 Sep 2025 10:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S96CBZmI5ch+MiqlOIvzqqQqE9xu7ajb8Vt6h82T5OU=; b=a0uIKsaUOj1Or+0s
	UB9U6QZP7hUOPHlXzkdkPYIv6moU5MnJGQD59Y0T8czqYuSi1/EcIcbZYNAXKOM8
	5Ldscp/Pc3pKNOSLCD89kA//QondBgPw2Uaq7DZ31KOrTY8yu8CyG9PD5MPn9R/3
	2sNypl6Quiu5qlvAqTtloX11LWlaXgjQBazFW6cgPSi4hmqkd92JVDFv5KVxY4B1
	Pusb4bPFzkAk6PmqYOzJB0ASqzWTDNg+4damQvnjA5Ysyv38xkwr7UYo4NAy8r/R
	1AiabdvW5jarxpyR5df43Y4ScYyqc31t4SZn0SLKX3xGb8p+Q7NhQj1F+xp4+gDl
	v+AKDA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy59wd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 10:17:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HAH2TK015659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 10:17:02 GMT
Received: from [10.64.69.186] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 17 Sep
 2025 03:16:59 -0700
Message-ID: <cdcc53e9-c616-405c-85c7-f65e83bd4918@qualcomm.com>
Date: Wed, 17 Sep 2025 18:16:57 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
In-Reply-To: <20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eFLV-Wijl7nmYVNtly7q0-ouNTLoPrs-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX01U6X3gdu2kb
 MCkSk8ZL3+GwAR4koFl1gKSqN/SIANQOPbjSJ1tEZizCoR4vk4ZPZpsONq+6wDomzwqUaQ/pAXO
 DfwhDpLgvpqiW1BGTNWzg7FsPBnJVDS5ob66PjD7xmpG8APJfuB4dfzccTouK7BxJtF38vpiWv/
 pHSTKki618fbaf9cOZOP9piO6/N18EoQQS5FdVBepwjAEvRxrmqwlOklf7UzMx+kMI9d1TfsFyR
 C7mMaqb2lSDFE5WIAAxLZle5Yhp8wRReOqgDM9xLF/zvizIRgJ9Y52/PuS/QoVsJfSBBQL8fgB0
 LoW8L29HPD8UreSObfc0w3J1/6wom/fUMECgaZfeF5ORNu6YjnpX6u4+2I19+SH0QC2IwArd5ZG
 O5cqvdJ/
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68ca8aa0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=Olb3F6Lyt1vXxSobhcoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eFLV-Wijl7nmYVNtly7q0-ouNTLoPrs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202



On 8/22/2025 8:09 PM, Wenmeng Liu wrote:
> SA8775P is a Qualcomm SoC. This series adds driver changes to
> bring up the TPG interfaces in SA8775P.
> 
> We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
> Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and sensor.
> 
> Tested with following commands:
> - media-ctl --reset
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
>    --capture=7
> 
> Dependencies:
> https://lore.kernel.org/all/20250814101615.1102795-10-quic_vikramsa@quicinc.com/
> https://lore.kernel.org/all/20250813053724.232494-1-quic_vikramsa@quicinc.com/
> 
> changes in v3:
> - Change the payload mode string
> - Change the method for setting the TPG clock rate
> - Remove the TPG IRQ
> - Format correction
> - Remove unused variables
> - Merge functions and eliminate redundancy
> - Modify the register write method
> - Change TPG matching method to use grp_id
> - Encapsulate magic numbers as macros
> - Link to v2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/
> 
> Changes in v2:
> - rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
> - Link to v1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/
> 
> ---
> Wenmeng Liu (3):
>        media: qcom: camss: Add support for TPG common
>        media: qcom: camss: Add link support for TPG common
>        media: qcom: camss: tpg: Add TPG support for SA8775P and QCS8300
> 
>   drivers/media/platform/qcom/camss/Makefile         |   2 +
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  17 +
>   drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 219 +++++++
>   drivers/media/platform/qcom/camss/camss-tpg.c      | 696 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-tpg.h      | 125 ++++
>   drivers/media/platform/qcom/camss/camss.c          | 130 ++++
>   drivers/media/platform/qcom/camss/camss.h          |   5 +
>   10 files changed, 1226 insertions(+), 14 deletions(-)
> ---
> base-commit: 6afac82056e38e02266cd30f458b25a1f9017508
> change-id: 20250822-camss_tpg-718db678d984
> 
> Best regards,

Gently reminder to Bryan.

Thanks,
Wenmeng



