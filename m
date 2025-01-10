Return-Path: <linux-media+bounces-24627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0DFA09895
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 18:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A663168510
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 17:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB40214216;
	Fri, 10 Jan 2025 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bdVMzjub"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B22135A2;
	Fri, 10 Jan 2025 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530357; cv=none; b=DB+J7YzCjp3KV2QAMveFogr3yrFNCRCfOhpRuLX2OU3JAeYlpdbUhZiiR69V89T9g9jmmq4G5bAg+4pxu8My1W1F/LuC5jH9zcIX8EQfeJDufxUw5Z50JjPJbxj1LCX6a9+26X9YOdMtja7RBrO70aqtxZRhhm/drMmRyXgOouw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530357; c=relaxed/simple;
	bh=dM+2vnpmJp3AqGLlEAz9jnebFZZx4fTC060lnXim3sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MatU0iy1rMvdhcAy7PpemgonUmUF+cF0L+JMFLJoJQyf6H+rh2YoY2FYp0Bvdn5BGIFkdSunqnI+kb+qCsmPTRbuApy7ZQqV7m5AegKhmt0ZpOxM5tFTViVReFFdIUJ51gZcGqgYGUeSGT8SNdpaAsZ2mU8tJt1LftvfN3dAvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bdVMzjub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AH4ZUv001582;
	Fri, 10 Jan 2025 17:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vpk32ttY1jm+05hbAzzx98Npe7sv9EWHMi+q082wJcQ=; b=bdVMzjub+qKXfr2s
	iTWiBWhfdmJ/iwTXCZNZ0Y3TygTSbfoRW0X/vUNwpsdojMxw3UXEn+wz07XCLISF
	772ju3WmWEbMrpCcC2bqmTYFupnqE5JmttwDkSqXIQyWIUEEvFsU+fSUpZCisWPf
	uk55k9YNiCQhHasy+ST6sfG7Lu0tURRzWeI+06ETzEsvQ8WQH4+aW/vWS+m/fCZg
	tVIjC/THvc8ne/950HswzZuWAzozkQCgwCZ4zbiL+7FeS6CTCSyc6IDrQ02e+uSx
	eeT00xEA1/jxGwWQ5PkMymmdDL0oaJxVVvYeLfA/jTRaLzW+GtZ/WbhO+8fNKtPw
	9yGrfg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4437mr0217-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 17:32:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AHWNXW026163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 17:32:23 GMT
Received: from [10.50.21.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 09:32:19 -0800
Message-ID: <c5887fa3-7ab5-bc6e-846a-f61e76cd459c@quicinc.com>
Date: Fri, 10 Jan 2025 23:02:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] media: iris: fix memory leak and improve driver
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>, Joel Stanley <joel@jms.id.au>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>
References: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
 <Z3_og9XpRgYvKTcM@hovoldconsulting.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <Z3_og9XpRgYvKTcM@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pQJhWBPA_dW5FEcX727IlT017CvBNd3e
X-Proofpoint-ORIG-GUID: pQJhWBPA_dW5FEcX727IlT017CvBNd3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=681 lowpriorityscore=0 clxscore=1011 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100136



On 1/9/2025 8:47 PM, Johan Hovold wrote:
> On Thu, Jan 09, 2025 at 04:56:39PM +0530, Dikshita Agarwal wrote:
>> This series fixes a memory leak and improves the representation of 
>> dma mask to set upper bound of DMA address space.
> 
> Both of these issues were pointed out to you during review of v9 of the
> series adding this driver, and as the driver hasn't been merged yet this
> can be fixed in a v10.
> 
Sure, will send v10 soon with these 2 patches plus the Kconfig change for
selection of driver.

Thanks,
Dikshita
> Also looks like something went wrong when you posted this series as it
> is CCed to:
> 
> 	20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com
> 
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>> Dikshita Agarwal (2):
>>       media: iris: represent dma_mask in more readable form
>>       media: iris: fix memory leak while freeing queue memory
> 
> Johan

