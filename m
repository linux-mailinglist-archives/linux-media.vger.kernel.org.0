Return-Path: <linux-media+bounces-40859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FA8B3362C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2753616BC4E
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9454E277C8A;
	Mon, 25 Aug 2025 06:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PjW5eUsr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948F31E4AE;
	Mon, 25 Aug 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756102030; cv=none; b=CSXMWN3ZwLpDnjcrrTMHHvESqEGH72/zGstXtJ1jk1MNZn3kHgk2AmequXtsqFDAtBt6qIuTUU42EPymgIeGcxSBTdR8/0EqJwon0P+2dQpPFmqmLJC8EQjdT6oiJe/ki43e61PQK5pY0479/hAUkrjqYhmJsncphW8mVPFwt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756102030; c=relaxed/simple;
	bh=XKi17EJQlTi9QMvpcLkRitn8YDhRL7iGReyRb1bF8CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XWvkw+CbJO/nTK5M73nxU65w1qDa+tKJWdwui6JcOAnJf63h7EacmrPhSgf1z19N6V0zK9HnVR9sAhKzBR5irpjqfF9p6K0AtYuXX4dKmYvHwiLckMSAtgJZooGBU47piHeQxryZ6K082+H2gbhXgSNpZWLGRcbc5+T/3clbRvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PjW5eUsr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMaf13000801;
	Mon, 25 Aug 2025 06:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9f6rV+IYigPe++eKcVPJJC48KsBByGwuqa9iDv0Tog=; b=PjW5eUsrLDYCfkMa
	FQkziroYP7LUFxQ2hhs/HpPkZ2D6VwEGOrXUHSCl+WkCm2xBwjc1hrf/es+4gvJy
	7o+JWvxTSReauUgJfV0SgHQW9AvU/opieQ2TKMAnULbqS2mb+4CtSOVG5uv/zYRi
	cF0OuXrnuiQv9YzD6Gf2dQhMI9a1DOy0p+fUB9oTyJeVMn/xwSo8FXZvG2c1st22
	FC7cduhzM/lI9ykLciEJIpiyyt6Lx1DbQd5/VC1qfzvDgZhxK+NzcwC0NXH5BfXb
	soXa0NarohV6Hyt8+YmfpHM23SCqInFCq0dKKiLjpVXvUBh4hBy8xB1dZUf17y7P
	J9YW7g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpm0ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:07:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P6735p013729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:07:03 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 23:06:59 -0700
Message-ID: <68772022-6ab6-9379-5d26-72de704654ff@quicinc.com>
Date: Mon, 25 Aug 2025 11:36:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 22/26] media: iris: Add V4L2 streaming support for
 encoder video device
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <20250820-iris-video-encoder-v3-22-80ab0ba58b3d@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-22-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68abfd87 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=DCjrh_-oH4wV5huAld4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T1vTNdaXmpeYUKtQ4EnjbMe1q-fqkGdQ
X-Proofpoint-ORIG-GUID: T1vTNdaXmpeYUKtQ4EnjbMe1q-fqkGdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwJoCOAR/Wz0m
 WRv24jZccW1Fgkv2pZnok0KzxbADMTw6mHiuLqmt+Fy/M2TR0xjUQe3npvOM+KemFvIVxagVGeg
 Q5MJmkV5ksk7+iYAdBBS63u/bMhG/NI+RVT+Lb96J22Y2Wdw3Ibp4+XT3nJcW0E/7JHK8KZxw/X
 2E5jbWeGhaGl6WO2HH7bdktBeawPmbehLTPbDdTSKyMGwtLqcY+1NLFOuoNwAQVjwppA/lfgAT6
 j/gLRqDn4TiOob1P+yVoC01O2KbVxZDeU8rzFQhkODGiSkB+L00bBkcUgI5pEAARkRzEE6DGfY2
 e4uV5ey/yGYQCSxX8ybG1/xlpdSLoe17t5lQBdBBuxLk5DSQHTTmWOiPTKD1Pv6w1eSZ6hnp8R/
 8nnO+h2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033


On 8/20/2025 2:38 PM, Dikshita Agarwal wrote:
> Add support for V4L2 streaming operations on the encoder video device.
> During stream-on, configure mandatory properties on the respective
> planes and notify the firmware to initiate an encode session.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   4 +-
>  drivers/media/platform/qcom/iris/iris_common.c     | 196 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_common.h     |  16 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 269 +++++++++++++-------
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  18 ++
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 280 ++++++++++++++-------
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
>  .../platform/qcom/iris/iris_platform_common.h      |  20 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  92 +++++--
>  .../platform/qcom/iris/iris_platform_sm8250.c      |  23 +-
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  36 ++-
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 190 +-------------
>  drivers/media/platform/qcom/iris/iris_vdec.h       |   1 -
>  drivers/media/platform/qcom/iris/iris_venc.c       |  32 +++
>  drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
>  17 files changed, 778 insertions(+), 408 deletions(-)

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

