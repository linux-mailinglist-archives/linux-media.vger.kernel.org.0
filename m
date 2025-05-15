Return-Path: <linux-media+bounces-32613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3478DAB8F11
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 20:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14097505A46
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 18:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62A8279323;
	Thu, 15 May 2025 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HMGHT2Lb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E1278758;
	Thu, 15 May 2025 18:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333573; cv=none; b=J9uw4GyDP8lR1ijL7X2cGpsBLXzRCxZYqti54GL/SzGvTyKN5tI/ao5948SUSgYQ6CEkqsUcvenPHN9577WdaHWVwAmY3MHHDUWvrT3LulEI+fNNBtXcBoZXNY3k0EeMWrd4974D5r8xIHESfo1gTNt4a1ct0Rd9PGzNJs8fn+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333573; c=relaxed/simple;
	bh=Mpt2D5SW3J+JXAsIavOCVQrlEtSXBxBsbs2nOTFBqOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p5VQ6WuaWNvQ4x+Doeq02L2v0Z1lBWY0up0TKVy8xcMq5r0IQv0sX7Bt2i5NMOWzxDn5yjSsxHJowsewqH4ZPoa0JN89562Qt2fKOv5aoSFehNOoGeofBcxCxFpKBiNL3s/wlfDLWAt2//b/hXbjzucBUFcUVXspO9dHicaP+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HMGHT2Lb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFBvS014558;
	Thu, 15 May 2025 18:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYwF+dxBGbym+utNkNA9FAO3g4d9P4COqwdlmhWtfzo=; b=HMGHT2Lbdwad1oAK
	bwuFw6s24Oh1T3nlYBCrnGDO+aH2FqeiCI8W1qLi5ogfyRs//Y8rP38SuG1LdxP1
	NkUAFb506vbJ2+f4JjoazuHZctGmHC7/5NlbDUKjGImJ/6KLoVYJVDuGaMj9hjk1
	TDZeaLpAQBK1r/zhyOK2zYExN8vQXML9OYvDYvX21ilzSKj4nMeBLg7VMGPcuEXb
	tX1dautjsAiiK6pCeBB1X29SLIyfZC/tPDs0fD5L+2eW8+LafGqAr+Krpr2owslC
	LaF0R/6E5s9awSG1QQAcIfYoHidr9PELWkFyIvS7CcxkEKmFIVFO3QVqqRFZbY/m
	y6Jnsw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpfby9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 18:26:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54FIQ44f006684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 18:26:04 GMT
Received: from [10.50.16.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 11:26:00 -0700
Message-ID: <13887de6-4f84-9d0c-bd48-de6f0472d9ef@quicinc.com>
Date: Thu, 15 May 2025 23:55:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when
 reading packets from shared memory
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil
	<hans.verkuil@cisco.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
 <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
 <0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com>
 <b0c48989-4ce7-4338-b4bb-565ea8b6cd82@linaro.org>
 <b663539d-5ad6-399b-1e7b-0b8b9daca10d@quicinc.com>
 <bd704149-694f-4d89-90d9-a22307488743@linaro.org>
 <f7df808c-0724-3f4d-b910-6e44637c7aaf@quicinc.com>
 <767909a0-70ea-47d3-b6bf-b57e5d7e7c5c@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <767909a0-70ea-47d3-b6bf-b57e5d7e7c5c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HJSC8DRvi1wUVZtNB1-YMeXVPBfFsiYw
X-Proofpoint-ORIG-GUID: HJSC8DRvi1wUVZtNB1-YMeXVPBfFsiYw
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=682631bc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=LHdP8VfB__zOBVWt8VYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE4MSBTYWx0ZWRfXwEzwy6WIeaCS
 DYLOnHMxFIiQ0Vy2Cmwz6owdGc/sS6WbZdnrUTwj0j+dDN744VjTMmOh7ge1M5J+vGuS6aVZhVh
 xsY1z8TIATtj7Z56fD33xwREcAElE1wbRrGJm83iq53M9aw73bL0OHMZM/+VCjw2z8nu+eGaUks
 zhJhxHXb/XHMBxEnBvZo0Z5IWyS1WIwFkPLwA6pdwJ1ZMHSX4UJtjwbSbiUG9cLj3mo2NsosUGs
 N6Txh8iUGz3l9g0LeWsuVWjWTkLdDCxCzPZI9oL0KK6cmZFDbNLZS4psq5Ov6ma5eRQHIej6Uc5
 KRvN8RuueJuQS5pM6A68RJjz0T50HLsa2GgaizNA2S/knGh54q5V5btxD2ZY8s82ViGfviLYkeK
 2N0lGpkurpoVYb0e+P9r+AWnQ4T1tG43qas1SgaPUe8/Wtm7SWpuAfiDh/xAjCKEOTAi0n79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=992 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150181



On 5/15/2025 11:21 PM, Bryan O'Donoghue wrote:
> On 15/05/2025 14:23, Vikash Garodia wrote:
>>> Re-reading to see if the firmware wrote new bad data to the transmitted packet
>>> in-memory is not a fix before or after the memcpy() because the time you do that
>>> re-read is not fixed - locked wrt the freerunning firmware.
>> It would be more meaningful if you can suggest the vulnerability you see with
>> the changes suggested i.e adding the check in local packet against the size read
>> from shared queue. Based on that we can see how to fix it, otherwise this
>> discussion in not leading to any conclusion.
> 
> So to re-iterate.
> 
> TOCTOU is this
> 
> if (*ptr_val >> 2 >= MAX)
>     return -EBAD;
> 
> memcpy(dst, src, *ptr_val >> 2);
> 
> Here a malicious actor can change *ptr_val between our check and our use.
> 
> not
> 
> data_value = *ptr_val >> 2;
> 
> if (data_value >= MAX)
>     return -EBAD;
> 
> memcpy(dst, src, data_value);
> 
> Here the taking a copy of the value and subsequently relying on that value
> mitigates TOCTOU, because the value *ptr_val is latched - read into a local
> variable which cannot be manipulated from an outside agent i.e. venus firmware.
> 
> The example in the commit log is not a TOCTOU for that reason.
> 
> Adding an additional check _after_ the memcpy() seems silly to me because
> 
> data_value = *ptr_val >> 2;
> 
> if (data_value >= MAX)
>     return -EBAD;
> 
> memcpy(dst, src, data_value);
> 
> // This statement could be false
> if (data_value != *ptr_value >> 2)
>     return -EBAD;
> 
> // while this subsequent statement is true
> if (data_value != *ptr_value >> 2)
>     return -EBAD;
> 
Check the pseudo code which i proposed earlier in this conversation [1]. It does
not rely on ptr_val at all to check the sanity after memcpy.

[1] https://lore.kernel.org/all/0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com/
> And in any case this is a post-use sanity check not a mitigation for TOCTOU
> which we don't have.
> 
> ---
> bod

