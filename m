Return-Path: <linux-media+bounces-64355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pjFhOIsFKWrAOwMAu9opvQ
	(envelope-from <linux-media+bounces-64355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:34:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3196666495
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:34:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bn2ozLG2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ff8ccdJL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64355-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64355-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FB1A3037487
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C014377545;
	Wed, 10 Jun 2026 06:30:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA061376BD5
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073030; cv=none; b=e19GpnNb3Y79rHcxHVKPjmxpfzO5+ncCE3KLH9hQ1PBxbN1epD3h5rc9dG7e9sv293zWN2aWv7JxQ6+Xa5e80YhnH7zGI5IVZmuvOHecXHqMeCSMg8lGvwBIaijA62O785s5bvKIRQ3p5V/l/iPVrSUrFHbhq2689xRUy0sU5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073030; c=relaxed/simple;
	bh=uXvxBqV29dnRWJEGEW3qlSEg81UU7hjiwTjaC3X/PPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqnH5QE2Onqw2cmGQQCjRTeFmZmExFJinaIwzoCbPPCDiP7ImEP69Nah6zX2A4GBXIEd+HWez/t6teFMFz8IYyFtkuXVO7OSPnZ2iCEecWXDGDQGjEUoNjiPzdGJlN1HedPKewJsCXnx6bYnLDMnXWH6PnNNUQm9+4g6JhD0K5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn2ozLG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ff8ccdJL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A45D6k387410
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=; b=bn2ozLG2Q0OZwFOS
	44BQQmAZoR/awXUtfuJvAFjE3ueINXC5wTUaWgQ7zsLhnBjVetZp1cjXe0PnGmmj
	BZnfGerdibrPKRfUvKrlzfGsqZhB9368UEIT7dOqDsbv2JW0GRYua9nu2iJEUB2K
	6wBZQkGgSnGaZjvVlHEUpRkugWmuOIwPrUNhMX1B5O+cD73b9BAbNpbi98CyrVRm
	Jbq2uWXyB9Da26vtDWV2PvyM6y5cItXVpu8Yv5qQuZjr2rjNYHZ3mcIuA5eP2P8a
	7QK0LO6neJHPghiSaoE6//VjUS5FqCJalWNEcmHrJX3LJ5VrT5DL2n+YgPnLEHZQ
	RNIPlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8eg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b7c55406bso4581272a91.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 23:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073025; x=1781677825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=ff8ccdJLLTRLOVuLhpHRyYqffqc1EfF4DGEK8+u0VTlHCE/u2zkLcFciM7cDG47TPm
         R5J/Iuyh9mDAwTesBhp85lb7K4Iwfb/pHOZbEFISWZzmcU3FxaJ1EHpGzmfrmBLTcuSJ
         5mCGsEtpqE6bky6uwO2RIY8YtbwVvMviwUwnx93RmIni69hJzENw9QEOqIU3kPszr4Pt
         NhZcG8kZ9d7u+ogEzsSNjhJNVkwOiJrC5T+RdzlQbQVw8qrddlmAhG1YJeCmqtDEteee
         3ZWFCs2rXNKbYiSz/yAbnMj1R0GKPZ6HbWoSEsEoH7pu72DwPKA2S9BTz8j2N8iPBNTc
         3ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073025; x=1781677825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=RiQXPRHs2nfkW3NS4j52zDyXYTwDbKK6CeFrWRX1eqZ59m6yp3Z29gRwKt5B2PSwJ3
         BxxSFfG1lOVY/pcv28qlLtZAVJSDa6Yy7Z+e8SuEzWLcLI+JFIaQyVfEij1+E5lxJ0pS
         pebI927v5csz65Krdz2IJseYT1eUL6LMMaUJTjhZ4h9kSJGpaVFw/lzrsSbsYYAQMI5Z
         K4c4aOMPohzEEEC1MdOWkUMDK3EI2L51iSS9MpgXUQmcSje9NTHN4uELpvT+MWVNOpZ7
         EUbtb2oeHv+cQa0iZp6cx2dEwUjn77SWGUomwTAMgb/ccCV2A3d5j3DwjluGK5oBqd+K
         X4Qw==
X-Forwarded-Encrypted: i=1; AFNElJ8bdA0DqeuF90d1AL0L121M26E3jERF2+nB91BNSioKpmqdvkJrwzUfKbFEso21QZytVl79bQmDKjmPAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlF5RQ5KkXws8heB8ons0iYfZx//g1Cy3937+tkoy9HwVljtfr
	Ee1UGRhZWKIFMDeKytcM9Wj68Vo8mj6of9BLiIUBqc70KlcWdSTtzN4/P3i9NgTKEXuNQiUpRGa
	+vVpmd6mb3ecD6tDQkdveM6k0RFitanqQuDYeWNH/TglOeE50DZtq5/vh+FAFSj3N2g==
X-Gm-Gg: Acq92OELxhEoFYnUCEf7Y1HOcopJh2WkX7ooO3+ZjfDWkSF6fmD8vOMndD2LHzFJLXr
	iAzBMH/muoAmdTCjS3RY3lVQnnRSo8hiPUZfICEJoG82FkAAMtXmlvoe2Xpym+wdPNaOHHvPOnA
	45Gn8BJ9iAMUR1CkmVqbed+NvWwKv5j9dhYplZ1h3p+h7dY8G1mYFAUdUXscUmzE2xaHuFoJyIR
	4mYvTw242ft8DjA6Sv1BidLj3Bb0TEvSaB1+S9LTFpDRhIBO+mSyVJADt3dd9a5dYkIgiY40d55
	1K1HOJglNSAwT+UXeS/nppFNA9z+Irundi7XpmTKC4vl3jWdjPgC22p+0L7ayqceUR9pJ5+zx1q
	oqZruG9gBAjbCx9D35n1ih+m4MQYU78Gl1LAvmUxYSZxAh/uEM09Zps4oGfyVi01OTw==
X-Received: by 2002:a17:90b:390e:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-370ee33cfabmr25153440a91.6.1781073022560;
        Tue, 09 Jun 2026 23:30:22 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-370ee33cfabmr25153401a91.6.1781073022095;
        Tue, 09 Jun 2026 23:30:22 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:21 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:38 +0530
Subject: [PATCH v8 02/12] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-2-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=1090;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=dJOak676jq9xOdkTjWpAc2d8f8wOtUNP7aR0VoiKGvo=;
 b=S9EKZEnlUVudfAeNMawwOgx3xZjxEe4Uly9qIotiCiFYLgCm2Xd0BitDRJblxarJ/scgDi4/b
 kltOGKh//x7B2Wl7ZpC/saFu4AKaXr0cCGtMJwTbOZRxNu8agdyHKIG
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a290482 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: PzZEhA-T9e1YO9c99_EmhiqrVwOv3CSO
X-Proofpoint-ORIG-GUID: PzZEhA-T9e1YO9c99_EmhiqrVwOv3CSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX5OPocWW3tuJd
 rlo292QxWCZrZnYLoDe73feGcchxv3OIpZWNqi14tq+wq2z41rp6KbBvjkQUsspSovvIXc0LXgA
 dAy9HOImxPaFeupNAG1rZwJYpPJ8qETnsjyKa6NvNIw3/pwu0dmQxwbIyfsQuGP8Lp+0J51ppca
 MlcZCkr/HRajDU+4mx1ZxTBHkhDTZJ3N0/9/mkoy/Gg8ULk/X6hUXCRSNZffW0pvaQ6yqd/ikU6
 kcDJKVxq5zF3oo0dFp3VGfLYkLFWdS6Hd//z30ltz2hBkvjR7RlUWRMr4YMgKYhpisv6IHZk0Oi
 lw/EtOFEPl+0F8AqIXm1ZH9m0Faf2dDbG3BkT7dOj1+Swj7A5iJLiNi116WHPGsX5fNzAaQ97FZ
 Jz/y/u68xdG5Tpr5z3syeE/WprahZRrX64UDBORUyUUSXMqIDAyYgiV9epevPz1hmsBb0BQ+Xrp
 kShJWH4MLkMbsuOjUWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64355-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3196666495

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
subsystem so that the bus notifier callbacks are registered for
device addition and removal events.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..fe51600953ce 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


