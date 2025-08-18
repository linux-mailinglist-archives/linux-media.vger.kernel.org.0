Return-Path: <linux-media+bounces-40120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 274C5B29E45
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E73053BB878
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A3E30F557;
	Mon, 18 Aug 2025 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F1LHUpnQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CCD19D08F;
	Mon, 18 Aug 2025 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510339; cv=none; b=g8KWGGi27q1+LSozZ0CtHDEGQT3mwV95YXSTl/d7sK5gmddWfBJfKMRFsg83ilHpZZOTWX8aCEi7ts9FiRW0PoN9yYfYowe57TrpGOCmobLEjNBEeM3MDls+WvgsiupJ6izfdmJhN4eqccfzML4lSYYPd5q/PJsmLrzFa81gXj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510339; c=relaxed/simple;
	bh=5kAT0OWo7P4LGhMfJP3ArGBSGYUcaY2kpGd3mYOE1jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=egyQXpQNM5+OuS9Tt5kHldgSSnZ+9RtxOlIPkaYZ6175zO5S+6e4VT7hGaa7Cjlftf2pAIPGLn4/j0tugd+mga8+hfGDwJqBJHxwRa+NOJQlmhrV29JbZv8NkSSGwfYvn9PtnJ27xnNS9Mw2/86a2ZS69ffg7BTRA3ZNFUYSY9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F1LHUpnQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8PMqI007011;
	Mon, 18 Aug 2025 09:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjdKFhdo/XRz24AO4XqnqKp90raRq20cSpgOgOQtG0E=; b=F1LHUpnQZdfKSEzF
	9F0V+CFNbOgakJQkLdVJn7J7ScVSCW3shDfa1m06OsVrmy7RiKVLcgs4nfq4XwIb
	QDRNOW8rN6SI+tRD2/qSf+eZCKsAmwqdTOG9AJyMCxNT0FvonRLlQgl6vOzszGc2
	jIKw+GwfCdq2O6yPdLA4Chze13zE/0J43I6n/MIl2p7BHwtF/Zm7fwaBVj2IZRuK
	mYC0X4bjGuCMqSiTuXamqexaWHZB8qYq8rkK7S1p4D0i+Z+iJ0sJSeqB+mL98/sp
	kyW5XNwBEjIqQSfTC/uOhjzk+XkziYc39tiEIiclCyK0kIPoEOY3Zm/1gg5XUNGm
	wCENIw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfv4nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 09:45:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I9jKBV016097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 09:45:20 GMT
Received: from [10.206.107.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 Aug
 2025 02:45:16 -0700
Message-ID: <8b9d5f6e-ee95-e4d1-3fac-fdcb277a7af3@quicinc.com>
Date: Mon, 18 Aug 2025 15:15:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/24] media: iris: Fix port streaming handling
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
 <20250813-iris-video-encoder-v2-4-c725ff673078@quicinc.com>
 <40673a17-a19c-4722-ae5b-272082af917b@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <40673a17-a19c-4722-ae5b-272082af917b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6950qAdc8-on-qkZ6cwyGARp5d121ptF
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a2f631 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=m1fW5MQtX9GvYy8ZqkAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX+9z6UZh4+ODA
 /jE5/9xUCSPK+Kjgjv3m3SeCe3hZotJlIkQ1tHBmZXFGmRPHVLYlVHvKUBMAJVuc+OsR4dSP2M2
 6jjaevX1hrXKWVY3TTnQ0WrRAibB6Ao3+3omcBU+JM8m2d5ziquv2bs3jmrxAe3XbxKt4hiKQGm
 KrnplDuiBOvt7vr8equCuypx2iU6R8ujwShE8tSYQ2GwWgbPEzu5XhQjAYiQkCNj0PuCuq1uRaU
 lIp9Y8d4tO3gNJSEY2ncmOQIrHVindUGVex+ePf7LjUNLyyjux6X2Sfjzsm55VwiNCW3JuTQTaT
 3hEeczFPT8SNtQeDBo6SPRQrTSoagqBDRUxdY3dWAOdrR6GgR0hbQQSwjPhKt2HjCQbPugTlDYb
 +0/K+x0J
X-Proofpoint-ORIG-GUID: 6950qAdc8-on-qkZ6cwyGARp5d121ptF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039



On 8/16/2025 4:10 PM, Bryan O'Donoghue wrote:
> On 13/08/2025 10:37, Dikshita Agarwal wrote:
>> +    if (!ret)
> 
> I think you should have a consistent error pattern
> 
> if (ret)
>     goto error;
> 
Its done to avoid duplication of code, otherwise it would look like

if (inst->state == IRIS_INST_STREAMING)
	ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
	if (ret)
		goto error;
	
	ret = iris_queue_deferred_buffers(inst, buf_type);
	if (ret)
		goto error;

and more duplication when encoder is added.

Thanks,
Dikshita
> Once amended
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

