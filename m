Return-Path: <linux-media+bounces-32698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6DABADBB
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 05:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E00D3AA4B0
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 03:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12871CAA7B;
	Sun, 18 May 2025 03:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fasRE915"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B51581F0;
	Sun, 18 May 2025 03:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747540594; cv=none; b=ukrt8ajCzEJ2yoQ3+NgFKMKhAWDFek1+Z+7lceA3SM74K+wjJhflFtQ7XFoW7hwlVt4PvFF9koclSQRe1FH5R64iVp/SLVHmJwNr8eGDY/2YTyASGlCwTxSM1cnCPlLAqcIdMbeV1WnvM7VRN0OwOSzOaSfKcTrLEoSeKSRmy/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747540594; c=relaxed/simple;
	bh=JDoH10AAqImfoopqF0vvPHRY8M8EOjDJ2zuOpycXiII=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SG+03R1zgJpHaWJ1iamu0lc1k1YaH48jFXyfOZuMnKmNwDJ2Sp4Saz6/YCZUEHEUjtFs1mQWP5Axx42IqVZcp6n4prgotOdulIf0aM9Ia8+/R0gWa/1dqMcSoQU0caZT58tv/FCEc2Fv5OFg3YUTyyb2T06yZBySy0zAOA6uToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fasRE915; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I2Sm4m007718;
	Sun, 18 May 2025 03:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWBtb0+tQAUtbJ0/eESo5d6JUUJp+MptflPYz82Vd1g=; b=fasRE915mDUUcncH
	P7zSaZflUA+pD108BW5Zm6HlMIUJrBJ60CGPJUotAGz6JGJIuFYGTVZ4IsTJTlVI
	x2LBq7iropOnDimoIypag2URZ8GC4mPd1IO7YWlVUL6SUYSqJ1Rh1Wu6AqkvAByB
	7tdKk6PzcSf5Rfriy+oK9+pIU5MWwf9ObQfV1gehpi0GOjREXlVd+JyNJwuyV9UO
	xZh0+0wMON3WSAf6Tq7UcFlpKNFKVYOAElM3j13P2u/RBXeMaTGMWL2EtupcWEAf
	0kxAzbF+0Lup7B64HEedUunMfFV7u42Tp+wOABYO66JF2D2f+u+P4S+r5MM3y6aO
	YoGetA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhfrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:56:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54I3uPpD031306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:56:25 GMT
Received: from [10.50.16.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 17 May
 2025 20:56:22 -0700
Message-ID: <a7bbf0cd-f1b6-c1bc-016d-dcefeb4666fb@quicinc.com>
Date: Sun, 18 May 2025 09:26:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] media: venus: Fix OOB read due to missing payload
 bound check
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil
	<hans.verkuil@cisco.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMiBTYWx0ZWRfX607qZaEI8N3E
 o9KK1P4DRvCMrOe0YLwsM265O0yBwBehzjX5z2t/+1YS+6+ikBvbOJP7mnPk1/AWvpX+VmMZSHe
 X6r4A9RFrahv+Kc/hacmhEm1lTbcCIlNKT8VYNqP1q5joAOTJQmqotL/Y9b/HUb8JLfc95wFCtE
 eVEwj5HsSTmzkJDsyfEUuJDLABwV9vUHjDsfcVNSQtIs14A4bmbOJAKmLWlvxRVBdNEDWHFzGPL
 GBTj/chOn9aCkkZ/9+Bec2dvpbMxflAQx73bAa6/42gbwdXD4cHbymWMrV/h+E9ZFdT7KvKMdLG
 AhiKsScY0CbLI89IW0rDyMddCT4qOmecR1TO+bbluNVwJwtiXOgVvBa5+xB1alBRgwMma4x/Vax
 Gf94eCM5M7Hb9kR9HB1Q4JfFh5uuWNw0r1+ZS5o2M798lym3Ef6000kHQOHGGcr/72bb5QuQ
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=68295a6a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=8aEOFhq6cl1fJjfOtgIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wYoyZywxuQ5yTzXG5Yxn0lSm6y6rzyY3
X-Proofpoint-ORIG-GUID: wYoyZywxuQ5yTzXG5Yxn0lSm6y6rzyY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=931 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180032


On 5/14/2025 7:08 PM, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Currently, The event_seq_changed() handler processes a variable number
> of properties sent by the firmware. The number of properties is indicated
> by the firmware and used to iterate over the payload. However, the
> payload size is not being validated against the actual message length.
> 
> This can lead to out-of-bounds memory access if the firmware provides a
> property count that exceeds the data available in the payload. Such a
> condition can result in kernel crashes or potential information leaks if
> memory beyond the buffer is accessed.
> 
> Fix this by properly validating the remaining size of the payload before
> each property access and updating bounds accordingly as properties are
> parsed.
> 
> This ensures that property parsing is safely bounded within the received
> message buffer and protects against malformed or malicious firmware
> behavior.
> 
> Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

