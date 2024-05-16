Return-Path: <linux-media+bounces-11510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB518C7273
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 10:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9A71C21841
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 08:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F24131BA3;
	Thu, 16 May 2024 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Udmyx05N"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A124120A;
	Thu, 16 May 2024 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715846798; cv=none; b=awuKunsgi9IbXNNXisFP5kpgAC5j+hVpzPMsAkK2bAftPLKdUCJ3fcWrZBSRa271qa1vAXBPkgpE0Tz5nP+cZxViRq4K7cYoKtDa2z1koM3jbS9dKrm116n3DfSlRhLGhyN67VNkg5HLHCP72ZUv14W4BFNZvBk8BnyvVKorzxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715846798; c=relaxed/simple;
	bh=zmrYzsDBzvTZniaVCCeuBZSYiuTRObWwzzeoGzPyFQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hGz6Dxsw7YoZHIC+TU9P4ptBEV84OEduB+HlpAWAPa1MEuYcNQlZCfewNa5ckCEuOww6ueazUK+SjXJXQ7hXAIA7BJeYtTIdpwIM2T7qzpFKq/WPxk0vdptJ7CIbcKImyAQItQDRlXtAMcWvhIa0fFw45NnzgL26gGruuw5gMD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Udmyx05N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G5QUrZ015678;
	Thu, 16 May 2024 08:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EvtDLPUioGQv95bvrfcXzbPUlQC83IW0glY8CjGmWTY=; b=Ud
	myx05NrrKbkJFGLEzZzURHVvM6Fc1pOGQASRp18jJZsTeE/yAqBlMh6X8M/+Z245
	Xs+4DaMRG4qQlJfmGR10l5grCiqJkeV6CJG9iz8ZOanBnC+KUDzCc56lTQPN1peF
	oaefIaIGmNBj1yprowkCu1Z4oqMIsHa0e4iUg5qQR3sI5lXZloHLlo8lw4a05wGQ
	8R+k3FStWUFjmr9ftzfxf9xmsc0pOObuilhd+FXTASc/Tw/OEPLHI+BFgv0uIo4C
	017imQotTGS+cszipyrSCyVtGy2Xj9KHRStYPFeblo0OnLQ70r6Q+P1g01lMoWRc
	l0guDuVSUwqOhBVa4B1A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y5c05rbsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 08:06:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G86LN9011028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 08:06:21 GMT
Received: from [10.216.55.40] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 May
 2024 01:06:17 -0700
Message-ID: <20d7b8e9-ab72-6a4a-ea04-728cd289bf12@quicinc.com>
Date: Thu, 16 May 2024 13:36:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/34] Qualcomm video encoder and decoder driver
To: Hyunjun Ko <zzoon@igalia.com>, <quic_dikshita@quicinc.com>
CC: <agross@kernel.org>, <andersson@kernel.org>, <bryan.odonoghue@linaro.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <quic_abhinavk@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <20240516075732.105878-1-zzoon@igalia.com>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240516075732.105878-1-zzoon@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vg9UdyFDzi2gOuNGAtya5FVdAo57Ki2-
X-Proofpoint-ORIG-GUID: vg9UdyFDzi2gOuNGAtya5FVdAo57Ki2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_03,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=759 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160056

Hi,

On 5/16/2024 1:27 PM, Hyunjun Ko wrote:
> Hi,
> 
> Thanks for this series of patches. I successfully adjusted these patches and tried to test video features with gstreamer or ffmpeg.
> But I found this provides staetful interfaces while I need stateless, which might cause an issue for my side..
> 
> My question is do you have any plan to implement stateless interfaces or already you have somewhere?
There is no plan to implement stateless interfaces.

Regards,
Vikash

