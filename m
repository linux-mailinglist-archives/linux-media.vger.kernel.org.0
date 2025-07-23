Return-Path: <linux-media+bounces-38229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A00B0EAB6
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 08:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F43544761
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 06:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9579A26E70C;
	Wed, 23 Jul 2025 06:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h772aOx1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5AE185E4A;
	Wed, 23 Jul 2025 06:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252853; cv=none; b=Bm9MM2wi5imRg8cimSJiwRxHqftq7NW8HDafZ+ULcelDZMnGi7SHSTxor5T7fdOYKbCmc9REyuIdDJI48RAfQJh+LeCxOyWWOBH4uzG31cLa3pfW89XCNEz7GczazSd1bbHGsOj6qwXG0bxGfsbH2KQpxMdLVfTn62i0bZj7qdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252853; c=relaxed/simple;
	bh=92k96N1KUNqdTJWu3C5fjjdWTHuQXlO14hQn5vUbckI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=txNQP/MfJ+cXwDrrLpDbhOxIMIsKqin8MBDUUADAhgBx9ZpgVr59ogOihpVc7G6Vb9Yrz/1IF5ENOobQP9UYXfUPyCPppbOyuC2r904EIwJBCA+Lq/TXSa+X+unES8mrHnb3OVwU5PfncUSGmwY7V0CYsgs318Ep1PTzMn1n9g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h772aOx1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMP3vW031357;
	Wed, 23 Jul 2025 06:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfisOvoh576HRQexqjSB446E638RAVtM6Q6ZO9cdfjw=; b=h772aOx1uzNnNc3G
	0WNuUGF0g6GiX9hRS68Ffy7kg4ZsmwNfNerNnW7nAVxY/aJF+oLG8Eyw5uIGoH25
	4b2t+dHn9MfCKtFNxokVwXD52D4uIuzr1sM0PuaGjF8zHl08U4LdUH24Ua7znL0z
	fADvRMJ6vz49jZTDfm5jB+UpNbXgR1l+m0qKlinKs49k+XK+5XRtA7cw7nsdfiwx
	3qGmQVmRejiJST0PTe5LDchaoWm2ZiHNsguG6IhI4fkfCt9E5Amv7GHL6/DLFl/H
	NXmicrWUbOJMhu54CRJ52wfxJ+YzLRdowTr1LaIQcrgqARoNcP7Ihpzrw7XSVsX+
	xzY70Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s44ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 06:40:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56N6eikW004316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 06:40:44 GMT
Received: from [10.206.107.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 22 Jul
 2025 23:40:41 -0700
Message-ID: <f48ac2fc-2239-7ece-730c-342b495b8986@quicinc.com>
Date: Wed, 23 Jul 2025 12:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/25] Enable H.264/H.265 encoder support and fixes in
 common code
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA1NSBTYWx0ZWRfX4qllKSCXWKuz
 sUyHJwTukdBKw3WtgI1XD0RD20Yu/C3wtvGPStpjP6LUbjh+qEAd7lr7ZGi0VBAh4HnHzGjP9FC
 WIiLMeCItNddEQ2uhUSJockY+69DPjIXPLQ0fGEz+qL902WFWNEz1G5XnmcDfcldlaYdnuRsaD4
 Gq377dTTC+2NXGYuDl9ssjXMFSIlrENzaG+ACezIYBBFax9vqYzxmmUkp+mx8zcEPmLrK53H4jb
 kjXC6T6trdKbNSYjTmA8Bs7kzYS2xkrOuwAmL87CP3fSPLGreIaNBVGTZThAbqd+ldCpRnfQF3i
 0mFy7+rZJ98MmxjCRAXkLkB/2WOToeDllysrMJaqUby1lX4avyaeLpirJcwz5AoPvgnuEuirD6a
 pObPwAL4evKSRgZayV9NVKfZJZ2xPHQqn0Czf++Oe47HPB+ZgTGwfZzJ+L8HsWOnlcBEq5VD
X-Proofpoint-ORIG-GUID: QGoB9zqs04fm-K8RM7SFlayQmwbrOXfS
X-Proofpoint-GUID: QGoB9zqs04fm-K8RM7SFlayQmwbrOXfS
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=688083ed cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=fSTb7FvrLMLh5MOGqSAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=650 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230055



On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> Hi All,
> 
> This patch series adds support for H.264 and H.265 encoder in iris 
> driver and includes a few fixes and cleanup in the common code that were 
> identified during encoder bring-up process.
> 
> The changes include:
> - Enabling support for H.264 and H.265 encoding.
> - Fixes and improvements in shared componenets used by both encoder and 
> decoder paths.
> - Ensuring compatibility and stability with the existing decoder flow.
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and 
> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured 
> that the existing decoder functionality remains uneffected.
> 

@bryan/@vikash
do you have any further comments on this series, I have few smatch/cocci
fixes which I plan to push with v2.
If you have any comments, I can address them as well in v2.

Thanks,
Dikshita

