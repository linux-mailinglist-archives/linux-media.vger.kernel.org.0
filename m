Return-Path: <linux-media+bounces-38861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54EB1A45C
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 16:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EA91180DA7
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 14:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B98271472;
	Mon,  4 Aug 2025 14:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbNECHKS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764BA271459
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754317034; cv=none; b=VARsopWR0vDMHSeyFUWpaWPk0lWeH9aEhONszgebcFNCGx+2IbdL8hSWeo3Cx2Vz1uPn9dpCV8+zeJRxA0X4bHV4hh6OxdZ/DrMqs4aIylHarmbvST/LoI015cmzpvuCYcV9Cf5LamXb7a7bPVxRaoXQh88juPCNo7GmQV5/iHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754317034; c=relaxed/simple;
	bh=A8DC5GZiezWSG87vEws0C6j85Kf6YPZuvC+TN+JTLpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+cUe8FPmBZPN4eLMe6IOBs0wMaFwzB725EVCrVmsYYgpjZS5OIPcbvK5GGohHR8wMGCXIKqKxu7dMi6d3eK+JdARhRfMNqI/uADUMRyNin+GPRJM0x16eF9FZf7XsGR226baHRBFW4EHaW7znVSTL6PMKLHs1WSoY5ISkERjG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbNECHKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574E295W016608
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 14:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gvpm8a+Po3AvQHyqTVypgq8YhFb8qXLB0jdSvQ5uttg=; b=FbNECHKSPMlvxaR8
	+1TSgffV1F63Cw3pBysSRWE9dSLwjhlmI38dZO7d5+Jqc0QI3LNC71UP5oyfzjtH
	U7xCmKbE7z7Too77s3Y6z8NNOyMJcQ7++P/yiPnavxDkEFpZWazXr7HJr3jYh+Lq
	J++xkirzs7DGhQgqnzB0Lj5JhSjnmjWQ4XfL0Oq6giJowZ4arispTlZdSwPiCQy0
	4f91W0VNc4vW4j5/6+I2wTwn5W0McWr0FiCjhBr9rSQbqSxViluw4/UbwXOhjAby
	P/tR6sbAV3I1rMbRakVDTzel2h8rhXk98hp0G2ZSpOGGJaan8/2OnyF3rpZb70XU
	ALC5OQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a5522-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 14:17:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b42218e4a59so2893664a12.0
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 07:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754317026; x=1754921826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gvpm8a+Po3AvQHyqTVypgq8YhFb8qXLB0jdSvQ5uttg=;
        b=Ev6gN/3StMHO0WIlQI6YnvtPZJLDXytK2OvTDUrzFJwGbRM2iiqkFTz9wJUzxPWFHU
         PrpepNBEoCY0NndSPW0IjUaZ8KPR85v/Na+lLxh7GV4WCZF8v2jryT7AssVAKuL/l4rH
         NRAR0Qge68WqV/irZBoAn2M0iBeJfwiQsoCBnMHVg7k8ggQBcJNeNxYvDu5jqQOGge+a
         WMTb76yZ+xw4ML0qabnAQB/wasQydFYNBpCt8JqHSpCX2bjT4rbnWUxkXKzuqdjHe/iN
         TzeXHjljoMX0nqQvW/Va7Bzfrlc+3TvZmImKSLkhwpKHaXo848sT3uFz/rf4sepXiAz9
         l5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjUY59Hq/lYS7lxOOr5IVJGRSTvZE1/dcr1ZGJG45cK/vXCheuvJEcmSoOlzE5U/VJXyCFGPvrjmVSXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlIhpU4wqyPsCkCQfdukdFtyEqKBtZJYTgZY8dDRgHE1BQcJFC
	tyDHu22yGXcaQOTdzvmZ/LnvOCWPCMa4ijBN1YQBWs7p68CG5XIy8aPvdX4b4dxUZn/VnWmtZ/+
	jRJrccoZ8L7lo+DQe4nmRJUmvovpXGSv0GJEELdvYfd2zhrqdMVx16lo/DXuXrWGtSw==
X-Gm-Gg: ASbGncsJQDJ3xfAokSc+Hsn1V7aPa0PJgIzzCxxscEp+H+52Gs4i8ETdnc+gyLodhqU
	Rwf/9fOvHJyuw70XH/BIXlqRd2GhAd1fLwYpQO6DoZG7f19kyveN1hcwlBV+SKqFME2C/Yp1/wi
	7U/gtO+9fQ3hSKf5aALQ4ZBhucL2DhahDMsgL6pPM2Wk7AcLp1GJMZFHXXrqtD5WkB3xFEPY7VW
	TS4vPH6cd5vlHB78HL2HyRCiKGMt10OeZdJvzB9Ltahm8jzNiKVVz8hXU49N/BKNIo77fbe+VLe
	R4I9jPKCI6XW4juPMJgdufEUDAR67pB0GcXMyTGv7dRQEB8NfX2H2k/42rDx1NDvSvmAA8iZ6o9
	FmFXCnTPumsn4w9SAbNxTXwDW087xFVe3
X-Received: by 2002:a17:902:ef45:b0:240:3dea:b269 with SMTP id d9443c01a7336-24247033fc0mr139082335ad.48.1754317025695;
        Mon, 04 Aug 2025 07:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHaeEa9NWdmU9v/K3+J+uYiBAHxa0ZMd4TXiIz+8nIet/FavC5/MvKeVD+zMUzhg/+SbvBVg==
X-Received: by 2002:a17:902:ef45:b0:240:3dea:b269 with SMTP id d9443c01a7336-24247033fc0mr139081745ad.48.1754317025156;
        Mon, 04 Aug 2025 07:17:05 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a81fsm110766825ad.120.2025.08.04.07.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 07:17:04 -0700 (PDT)
Message-ID: <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 07:17:02 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=6890c0e6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: gtnnfxtQxgq19fVWhZbELNQe5sZ8DyDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3OSBTYWx0ZWRfXxprAGUFyofOq
 Y1s9Dkge42OHNupX5UPvbk1UCNixG1nlzB0kDHFzEtQ2bX1XfSx4g1e2/CUDz7dvj9JSo+FGbi2
 b9nAWTkAjlPASDxqzQA/qMvro+dF6cRmKyJJEUuYKXU9oL6wTKsNXsChNMT9w9rTbuRIyv550Rs
 5Rok99zFQNTfmKI23I/6qED+J4+P4iVdIA4W7Ic2s9CmqZ0+2CxmK9wRwofEsG2JKFVx5oeOQ8D
 wbZ91HaOc1w/TkPjOeBWQ3RUUS8u8oj5gXhek4Wu4O80xIzuaHVX4FoXd/NeCbfz3ep7Vrg1HP6
 f298c1uQUvJi3SEV7pXMscnsD349QXMdU1kRxAyVOs8Np3lDfDoCy9nSdD0/JC4i+hCAWV71rQE
 +XdNGddBHOPR/bQngjruDOvvbLwQ2peNcQbgHI2kytMvxm3iVniKnpsJxazn5rVw9TSTqD+c
X-Proofpoint-GUID: gtnnfxtQxgq19fVWhZbELNQe5sZ8DyDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_06,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=913 clxscore=1011
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040079

On 8/4/2025 5:41 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
>  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
>  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
>  drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
>  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
>  7 files changed, 17 insertions(+), 21 deletions(-)

Since this patch touches files which go through different maintainers, do you
have a plan on how this will be merged?

I can ack the drivers/net/wireless/ath change once I know how it will be handled.

/jeff

