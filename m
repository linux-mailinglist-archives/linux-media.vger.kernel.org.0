Return-Path: <linux-media+bounces-50876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30CD30CE0
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A33E1303868F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7150A37F8DA;
	Fri, 16 Jan 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYUwEjFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="if3zA7e6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD98F1E0DCB
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768564933; cv=none; b=PAgmSYTe+EX48Tp+QcoO4AMCjA4e6En3BNaXo7DiO3D3DMY9czCY1pT4+CvBgxU6PSTmqnp+UCxsX3PN2VVoR0Jj9TAmVJSfi/8UHv2s8OfFVJRy/SuGsxbqRO1hRGU/+CxI/nHSFBAQo3SkHkt3sYlGaV65IOk0i7sYVXXGedI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768564933; c=relaxed/simple;
	bh=g9yTDMRNF2DODGavKUZr+2pS4X1lADzQgLeEJfJULF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFvBL6pLJgajyY3ZMua1b4N1ozznMwcR8MZQ0XyyQrELbSWs6DXfsROBxV4R2/CtFscuw4YxC+9h8aaQRUDc1tK1A/Vln9+/o4xWFdVTIoG478y5TiSaL/FjG9ZxK+X8Y1bteMAxPzDM2So+8D3z74m5EbyalqyWSTN+5jhgU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYUwEjFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=if3zA7e6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7Z22M2615131
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kU78RTYNRRYUuCJk4rxAAozdFpO+FACWKdvbzgwMhZU=; b=EYUwEjFt6xGD7tee
	kc5GDWk0MppKGx+3o4gXLh88JI3xIwdkrBfUI02xhyvaafhsUa3fLF7B5mwjLLSI
	tuU2pL3S3iY0a7TQI2li+EbRnxaidxnmTkn/ucdaSZPuXzVeV5Ky0Bnlnyh7kOdu
	5YCKU5gsB7huI+pLabYAm5ozBT3KKEbN+RnYiwSzsCODDmV0xcWimihUwLntPRel
	Nqz9FiknJVKHql4ww29jruh2jVfAkj5UEcUeHdjGvUS9PKrxFU77BmEkDra4hiBc
	reeV4OhxpOD/n9NJBXE/MxNC7/UQXwMeBgqlfFNBlw6zFGr4DVz6P9F8QNUwhgPu
	PfVf/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977t411-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:02:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0c495fc7aso19636335ad.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 04:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768564930; x=1769169730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kU78RTYNRRYUuCJk4rxAAozdFpO+FACWKdvbzgwMhZU=;
        b=if3zA7e6FMRgjKtlixC/srggSPgTK8tjgQBCwyyFqdO8TpAMKmx/jfOvrK2AogXZRH
         97vtdWflEMqhF7C4Q4fBkcQDWRCtOLOGuw3RfUGEsLBgVYKL3iI4rc8g7j7du2f1RF6Q
         XPZDcBnSNSywoDw6XG9TtOnZQk96uZPH1tf1oStA9W/WZhdWMqXEFgcPjpRNsNLLFkA5
         4MTIKRuGjLJd87Tc4xwDtauA7Wq3hj+6nZ8z0BGuC5Naw/kOdjVNr1P9e3nBwbXD9n4O
         yEPgbQuG+o6NjaEuuS1ci7RAKY9SzBv3fDDsXzWChTENlx67TEjJ181LgJNHXjS/Vg3b
         oqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768564930; x=1769169730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU78RTYNRRYUuCJk4rxAAozdFpO+FACWKdvbzgwMhZU=;
        b=XIY64DoNtjvT66IkB7zyHWniMZOGq3Z5LOVSyTENUQ6WgJYjA2N1pU70umD8xZrLYZ
         TkUv+F/vVCTjcLuUkD1pu2yRczfjk+IYILF1m957RBzKjwVtNg6VltDnwQH/coMdJjXU
         9gVwB59vjJML0AjxzzcCQGpP9MPwTduTWH4j7CcR566ksDo5hYEHx9DAIUjy3gfyX2hU
         fz2i5kDPA20H0udzwovHUAbXJ+7i3RLlBgNRsj4v/hF9t0yGVB9GUud6beF4O1RWXNS7
         ufdbhcQmbhVOKkQpRHy1+ZIM2tU0viIJRV7TYpYgf11S6mLtTA1D+h6gPxYLK5LVJHC9
         L9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUMaQmpxJPgwiyvdrqY+jnk3fAlIJmi4Lv25NFSbzskfmLJU0s2icIEUQ9KwweuV++j4kLOmdfOkuNw2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmn8StqML+7Oxqsddp8ee333a75WCfida0BcWvtVGo7t6k5Yx
	OL8ZcFz68sjLWvc0vqHciXDNbkb3gaxJ/czvEUQxny3pI0T5dGqzlUXN7OcxmzkLcbac3xRT0cJ
	4pGQDg4/cLbIN6brehTLPPKlkl4FOYaaqVP12zTgVmmfAIvWLK9pKtaYlGxBd4xi16w==
X-Gm-Gg: AY/fxX4wuSTSAKDoUA7QgmWpyBcawwcqJ0yyePcbnkz5W9RqHYIjQpKb250TdprTM4T
	rrKQ2Bq/4cp6ZQUhMOhc3q74elC8/nopTjwoLA/rO8m8NWTcG6PICJQVb5FXgvuv0ThoYvYdRqz
	cKkaivtRkHclwViEtAdCQsyiKnxgjL5CodRpwATbwSo9Ldw5RiGcUh0vCS/x5CySWpeseDykWv9
	opFKNvI8sx9pilg/Te+GvtUH79WfuJ/F0pbj6t77GNOvMoDFfkjrTZ7uaC1yALwqWT2sPpLEQhW
	4Eie7eUEdT9X6TsA07UCZwmLPArD0lKoTP3D2Gupc3P3OQC8pqBtR+ZVvujCUAaFXLYiIWeY9CX
	29RuhbFZK+K8JNlolTjHs3NAeehRYlQNEgGYV/8d6xA==
X-Received: by 2002:a17:903:ac6:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a7174f9377mr30898875ad.2.1768564929708;
        Fri, 16 Jan 2026 04:02:09 -0800 (PST)
X-Received: by 2002:a17:903:ac6:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a7174f9377mr30898325ad.2.1768564929118;
        Fri, 16 Jan 2026 04:02:09 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab921sm19955365ad.8.2026.01.16.04.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 04:02:08 -0800 (PST)
Message-ID: <da56729b-8829-13de-6e16-de5f116806d6@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 17:32:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-1-196855ef32ba@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-1-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F428dGmlj6XMeKd5LgvlkoT-vxKpqtuo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4NSBTYWx0ZWRfX02GPv50EtroS
 uTfAzo16bOpTr97CEhp6jFq1IYsO4yiKWNzAfxkpfSgYTECXR0y/IF8ZyXs3DS5kdJVhINmyG/4
 8T9233bXl812dqVSba31l/q2Vid3uPVykGVpfjUTDDxoLUO9YLR//0Kd8sWvCMl2oN6glqyrmdM
 z20jku0XQvK2FSUgpGM52gDS7kZmtQ0Yp5RKXcuNii4NAPnCYS+lYfWcsP4Q3dZUQuZwwReLsWa
 KHq6geD/6O4jqRfiy64kc545XjQHic8xiJFUePkTd6AWPVbFFmFFc13i2Mj+5P7FMIvxOBlFuwr
 sdSvTYxHw9VlTXlgkFkMrZvjypBb2/BzyS2r1vG4ojaWPAwy1lXKROkVv3SUe3S7bjxxeUOlXrG
 BAA8FaGMGgLYX3ijFIekh+iLQctlV8bZFuhEvqz3A3FQE73hph99ksA01nRMmBTDVPey1tuuyhR
 2ncF1dv5HJoJn5SfCRQ==
X-Proofpoint-GUID: F428dGmlj6XMeKd5LgvlkoT-vxKpqtuo
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=696a28c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160085



On 1/9/2026 1:12 PM, Wangao Wang wrote:
> Add support for intra refresh configuration on gen1 encoder by enabling
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 +++++++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +-
>  6 files changed, 81 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

