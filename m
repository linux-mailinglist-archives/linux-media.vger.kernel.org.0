Return-Path: <linux-media+bounces-44736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D64FBBE3848
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 81D30358929
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7848E33439D;
	Thu, 16 Oct 2025 12:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1j8sX15"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F70334381
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619327; cv=none; b=P15YkQD0+7y0D1qcOhmlP+bKnD22jTtS8MIdRBXdFo3DE8xqM+/MCIqM4dE+xfPGea2SI4ol8FH92akre78ui0n3bfyKWklmhpSitYOxlYxuzwEx5z/JXEscS+uzv4bRdbJnGloZ/DwcNc64OF1nHL/HrNh/Fqq2AkuIytN/R0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619327; c=relaxed/simple;
	bh=clsrzR5Vf5s8LPOIJDRYghGThBzL1fUXD8xnKPLwPis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCHpOCFKWaESGZO8eVl6KDF4GW8Slb5PCKiZUS8k1mxMlXe9E5eH+A5JJeAe2lVu3spuH/Fj1+QTNnwA6TZpCdRR3C7DMoA2cQKbNwN46tnDeE7lLhzxIOnP2cMFylny1+yDp8rGYUeKtkmJxfhwjFOJCB8nny3ZgSWWPa5DOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1j8sX15; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6UP48003609
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3vY8/z/UqrVuq0K34arFvPC60E1Tg8WRiYrpR7jbwY=; b=M1j8sX15hr3KLCUV
	pZ/etIUDdMnsnc7bg4qjM345R/QghA8M4JC8/dMj3M71ZGyexF/2uklHL3KU6Iql
	QjmzLakdvN4LnzwxDlsFMgz1qmG4Ice6yYnIHZHwHwionGeKXbiU8Y+OISGzM000
	C6emcbGdG9UbplaE38WcdtSUUBkG0iUAUsADNn80qorfuCceDx6CEHL4pC6yi3Oh
	0rfI7oR1lLRzCysII7JP6I6fYT4s9tVIS3PKKeKmHKOkN2oWkCRxja8vMetLX0ju
	o+HUCFYU/qV8s36Vvr9m4EnvaFKuth69QYI3rlRW/UzTVSepUiGVwHTaHckRtL8N
	TA9qFw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8q007-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:55:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c0f8cbe6fso28120066d6.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 05:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760619324; x=1761224124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3vY8/z/UqrVuq0K34arFvPC60E1Tg8WRiYrpR7jbwY=;
        b=keBP6wWVWpvKX1ndmW9qQGPshLPxpDwrzKPQ0fLmzlHUY3LmZcyJXNHfLvEF1zGP/8
         wjIPaBpQdTCp/EwMEf9udO4slVu2wB7M42jO0m66Q+xQSG/TCVdJ0hdMY5x5c9Cn4HAk
         F800RkH2gXNcdPWcX/bRajLQGXnPdu5X1X9bahtqJkwam/yqM2360SoVBTL7KM/EZCGn
         WWHDTWSXBmbV6trGvAduyRUuE5D1rKcbzbYcojMaqj3VXyVgEUq4LGxkZaHPvjARhR0B
         A9ZlHkf+SoZDwXjeIl/m4fN4a191Pld1m18vuU2FvX+i2W8zE8nFwBMHG4oHRx9o7j+8
         f00g==
X-Forwarded-Encrypted: i=1; AJvYcCX5k6Bx6HLHHa+jOgSTBJZCBP1W2Hfdg2EbGJtGv3mdT3KutKmYe7t8GA9brici/sLUS6vxmMOwzuA/lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6BIMpkybGmu3wpDQOwyxd4wvkKxPm0sC4YXJp1xRSLMGLGfIe
	7/HfwF73bCNHqIdcoxwQbbpVFB3BOhEmK16EcLDXeLfAmpk/W/dcTz4BzDfHuolpI55GRYE4y/D
	AdfuRPralvQehzN12qCF0AiEiUdZHpE0AgYeo6Mfuqp87g7HgZfnj8Q3p4mBYzjHzacmsP40NjB
	Pk
X-Gm-Gg: ASbGncuX8uOeo8W4RONbfbZOI8l0uavzvmkfFIA/Q/FKHIyVu/0KdtrQxDdiatEBfWV
	5A9BKtgWNB/nTlYe4ZM5SEBY+2dFm86w6Vc32dKiF0X4edqm9cnAEdIOmTj7BiwqTLmKvHuR7t4
	El6ishBCDs1nN4wisWLWxMzMahv5FDVt/QtpISGqn+qjq2BYXUQdnxD/TVdtJTE/CqoRm+BAOKK
	vIbcjRSQUO6ZfcDc/Ulksb7wLYQwsFBa1QwEpsbCLa/lZw6RKF87d/oR0QeVEsmsrK8MqLwchxq
	GFbJYO5RKGyZO9/k4C1E36nY6jhfytQUEDoVenIPsZqezCE4Q8algbHga9sfScfk1WzXtyRBnbD
	rc+LVh/rDbbu0UaNKVV4YDh208tc3llG1Io0Z/6G618Uqh/w+06JCFywl9k/K1dg=
X-Received: by 2002:a05:6214:e6e:b0:792:51e1:b85d with SMTP id 6a1803df08f44-87c20579555mr105426d6.27.1760619323968;
        Thu, 16 Oct 2025 05:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCINHqSjdqPrtWSzz1lwFMNKgk5OolR0NkDAfI6x6QPEI6lX9MNTVCACPvGDsRcS/LfopbfA==
X-Received: by 2002:a05:6214:e6e:b0:792:51e1:b85d with SMTP id 6a1803df08f44-87c20579555mr104996d6.27.1760619323420;
        Thu, 16 Oct 2025 05:55:23 -0700 (PDT)
Received: from [10.111.161.126] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0120cc36sm39651696d6.2.2025.10.16.05.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:55:22 -0700 (PDT)
Message-ID: <1377934a-fb68-4c16-8f7e-ec9610883d93@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 20:55:14 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: qcom: camss: Add support for TPG common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
 <20250925-camss_tpg-v4-1-d2eb099902c8@oss.qualcomm.com>
 <0b7e71eb-1143-412e-a76e-b6f146cb60ed@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <0b7e71eb-1143-412e-a76e-b6f146cb60ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9BzsBFwXW_edNJcV_iXtUvQgD99SxSno
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f0eb3d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7DvS_owX7E3HmoQsnjUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX/qc/rkbJB8yh
 zll283e5m8tPMjrNuDmDnOKCYlR33w5wjl6ixUveFk5wK5LKlZWLahNEGaym35TpwZBYks/dj0Q
 3kQ4r34BOWT5bkrWk7e/NiLXs0Ttswf3kAQbvN2UYPxtKRKyApYbx3fScYgz6a8Vb1xRNwstFLK
 pVN0vSCGr+m/Ue2+Qp7A5VV4lW1vaN5E+4aKfaSOH7bNu0Zynq1w2EWmI3xnjFZ0gTbxA4ZfRc2
 ASxN4+rXe86gxC89DagJPciU5nCIYhXQj5nu5qNDXjKeElbPb/Z+HqXMrZ9sWr08WTSVvDcdOdZ
 x3tJeaMs/Xk53Iu8+T39KFpmu8QFapkXFVL6EC30LDduYAYWvl481h+ZYOggldkOLrP1r19e72a
 l8ke7Kx59zbTd6O7jxH5gaJCiPM2kQ==
X-Proofpoint-ORIG-GUID: 9BzsBFwXW_edNJcV_iXtUvQgD99SxSno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134



On 10/7/2025 6:44 PM, Konrad Dybcio wrote:
> On 9/25/25 2:31 AM, Wenmeng Liu wrote:
>> Add support for TPG common, unlike CSID TPG, this TPG can
> 
> Is "TPG common" the actual name of the IP?
> 
> Konrad

No, it's just a description of the TPG universal code. The updated 
description will be included in the next version.

Thanks,
Wenmeng

