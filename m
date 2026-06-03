Return-Path: <linux-media+bounces-63609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cPu6D2U9IGpOzAAAu9opvQ
	(envelope-from <linux-media+bounces-63609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:42:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351A638B65
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:42:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YeVMENjn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Lyv/mfFr";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63609-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63609-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18C763138567
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120F7396D2C;
	Wed,  3 Jun 2026 14:20:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9264397E91
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 14:20:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496446; cv=none; b=XSckw0ajEWGAb6Jf/qPRkhrLcOvCM+hP7Brae7inx3jRH8m1oNZALpuTFaBqm7B7+SaL5M8+yVuZ7yJvCqCCn3ToRLSdWyhRzJ7E/9PEfc85PJrVkyr2UA/TWbc+HnpYDcbEgc0bOw+A2Dipf83sa6mde8KIJRSbFTZZpDZKR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496446; c=relaxed/simple;
	bh=PuMrtg0kXudsgBTKAPN0KLjJcY60dOingG5L6cBwKzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXkxEFyWyfd0svX2Qvput9Jvob/mEV/jc0n3GScSXgmivxFpXYgFZs+fkx54QdSIL9eFX9E8KAJdh0F3wSprP1qlViSCHP+YNu505NzRbwwNHNUxJJ9QlT/8N6egD6OwmQnZNGrjT60Db4/aCvDQUkyrTVTFxdURmd4Q0zDrx7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeVMENjn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lyv/mfFr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395qrA780719
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 14:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f3qz5dCqPWjHtxCe7c5xxtbgRMST42WBTL9nTD2Ij+s=; b=YeVMENjnBWQmrFyP
	+1uuS7BWiskrHzBkPXIuJPW1kOKQxFQ7WjoqN8LPviGbpOhcu/8ztJppoE+2Aid7
	QNxszLXYtKLQ7v//ZwEV3IxUFZeOH0fPuHfaJ1dIVk2FQoGlYBYpLu9vTZWLCb65
	YspUIqzqI4/EyGDbesz81yFtpH/tsC/IjZ85WHsSbCov6hqp4epQrEZExJKGXfxF
	XX0NU0NdpK6QKKq//HJ7nI94b1gyk5COUF8lWx26SNFoAcH/2VqEnXyBSHbNiXUa
	2+/QowN6dpnC8wmMBZHEasRcSzx2t3f0hHVwi1b1qPSrKGjsAbrZ1PExDVvu4/ZM
	lzg11A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb16qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:20:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf3636d6c0so50015985ad.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496443; x=1781101243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3qz5dCqPWjHtxCe7c5xxtbgRMST42WBTL9nTD2Ij+s=;
        b=Lyv/mfFrfuOWZQUfxKk746N5LbNuXzw8PKwrkLueAOJi97kLyJzWFa6wx6SHSjKEFg
         KTYcvX3xf3iuagY2nMe32BLa+rFSOkPC4moku+aQAJrRu5Bo5z63jdZYXL+VvUoNDSQ6
         Rh1eAMy7eFpvWDVgag/L+zHdOrZCj8GwoIWokczp/8Zq/+GaF6RKGXZmnDc8WMXqUI5L
         IsE7hdORhqL1y8IUwoRH5dLCSFzyJEADKXons70X9Kikbzt5rUxmzgSkb4Coaz39RUFo
         cB7hBKlVqu7iMkh0hii79aFYKiKPqkMGap12b78nxtwnMPdfOSYr2kXLxdQ5KyokY2j3
         i5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496443; x=1781101243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f3qz5dCqPWjHtxCe7c5xxtbgRMST42WBTL9nTD2Ij+s=;
        b=egZXeGcDHVxH0Ms/3xRsUdOHv5quQYoG8EFPO1mSo6+YvSiE8K+ygdmYjicQMJymn2
         f8k5Q5kMuFu7SiYOa6vog8UMfHiwfpLuMOBBsl/GQDiDLJdfHC8xk/VHL1qesa8IWIcF
         vWHu+7L7QgaY3XJF6vk4MDza8txxDn0EmLxKczhoYCH0PFBSYF5Xh+IQMiHZL4U3FpHl
         0CPL05RdOrFU6Fp3y6iRsAE+ko1Bw5Mn1451be2aTcxSS1y29ZGOve3J/maeEPEG7TMy
         r1m6N0pVgaUxljnRoiLxo/hKzyN9T9/mNE7uYtu21u1E2EBbqUHB0RPYW/cmrEggbGLr
         z6TQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lsZ5P7HjICFBveSZ6RHqbkiaIkRVfvvepp1n707IS1rr3cF9U5lGIhCO6c/EHv6egmYCFzeZP43rGng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQ/9liCICEdgdR+XF+5ZWavZ7Qqa/k9tOauZOPVWxj8uWoslk
	dmKa5lim4YtbeYVSBMJ8/2W5EA3DycfxBNrvS3VUWp45yYYJjf4+9FTySnAy1i6nRQvexFvdVHY
	FBMQcXh7SlMOUkrxtB/jsAZNzJhO5uYwtj7/fufiJAhIbKsTCrZg17WoxvJcoN7iS3rfCPBULLw
	==
X-Gm-Gg: Acq92OEC2rfg2f6j0xuOrqPMEUw+1XNCF0zZXYSDIj6aBsN+lxqULLlGqlzAVRYsh4x
	F2IOnmKu0qpTVt4dM451FEz9RDd8CiAnSf1oNwEv2sOuB/XuRg+OVxsntjhepEZmy8fjGG5Ikhm
	nhjKMkN596hmbASS8AGK5MVVIYRalMlOstDOlcsNHWb7sKMTsyuzVZFzkgGiMDIrNfOnvCcxKM4
	M35/ErbRZvi13rpCVQYlf8gI1uoPIQ02a1M+AqjKPAYV4cJQqLXldorZg9Q1Q+2gaZX7xOxfm72
	bEtyPIusdiu4bgSDF3GQ1vINetEBE61YUTsQDw1le4hJX/B3THQ0drjJmSUo6hWDtGbDv/lDPMT
	y+n8IlFnLPv6lUA850iu2PWK6uHMejBpKS+7kxpBx/xUlTPZ/IxbI2q+yRhheoAArVw==
X-Received: by 2002:a17:902:d48d:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2c163c527c5mr36692555ad.15.1780496442735;
        Wed, 03 Jun 2026 07:20:42 -0700 (PDT)
X-Received: by 2002:a17:902:d48d:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2c163c527c5mr36692235ad.15.1780496442248;
        Wed, 03 Jun 2026 07:20:42 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:20:41 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:42 +0530
Subject: [PATCH v7 04/12] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-4-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=3955;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PuMrtg0kXudsgBTKAPN0KLjJcY60dOingG5L6cBwKzg=;
 b=7JmGH5FUMoJdANbTLdv601LbY01dHrrguK95asQPYHBDW39sAXKNEk96RLOS9UnFMalL4vuw6
 Gb1VFN/2sagDYKgssxyssKQskUmJYaDOHEcwtf+LfXwXiSk115DSfu7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: Q62SOvwc9uUBXWA6mJusBiwnlITxTevl
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a20383b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZwZBACt1qYONU4SPBGcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Q62SOvwc9uUBXWA6mJusBiwnlITxTevl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfX2AQK6vPSkUaQ
 R9YjoppSzVku4PxrzfFD//8oAi9gXkU1f0OsHRU4KdhHHy25K8cp6M2TUyTs14U0ahydf90XdZ3
 ITsg6JQFzBn3klPLrsuT+60VvT1ll56ITKiFoH0sRoSxQl5RLoyAh8ovcMqIvpc4Z0tJQeyX2Wz
 j4lZLdeUppOUK/U24fwye0aVwCxb8iAUpZgPCCXfOqTtpEAIXvGomqCyZ71iPZw3utxp/ANvgej
 Q7pBXQ78OOnyX1609pUsrG1PGGs2LZt93+pSOas6jxajn9y5wWfnja1W/Mv/rh3eIpUaF2xxnLZ
 AoHPhbJDiCPwLWSUW8dc45j2ZBy6l+AyAbnk8uLJtV3dvtN1TtzavjuZydFw/TqaYPfJrar/wJC
 7uI1oDbbBEYwG513x+/85qWQ8x2oa0yxj1AAi3dPHtfOdc4rB+QU40L0L7QleiHH6rodGFBJ6UK
 qJzLAMkALQyzggy83CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63609-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9351A638B65

The glymur platform requires a dedicated firmware context bank device to
boot firmware where linux runs as the hypervisor and driver needs to
manually manage the firmware IOMMU mapping.

Add init and deinit hooks in the vpu ops for context bank setup. These
hooks allow platform specific code to initialize and tear down context
banks.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  9 ++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..89dbe9bbf6b0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -19,6 +19,7 @@ void iris_core_deinit(struct iris_core *core)
 		iris_fw_unload(core);
 		iris_vpu_power_off(core);
 		iris_hfi_queues_deinit(core);
+		iris_deinit_cb_devs(core);
 		core->state = IRIS_CORE_DEINIT;
 	}
 	mutex_unlock(&core->lock);
@@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
 
 	core->state = IRIS_CORE_INIT;
 
-	ret = iris_hfi_queues_init(core);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		goto error;
 
+	ret = iris_hfi_queues_init(core);
+	if (ret)
+		goto error_deinit_cb_devs;
+
 	ret = iris_vpu_power_on(core);
 	if (ret)
 		goto error_queue_deinit;
@@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
 	iris_vpu_power_off(core);
 error_queue_deinit:
 	iris_hfi_queues_deinit(core);
+error_deinit_cb_devs:
+	iris_deinit_cb_devs(core);
 error:
 	core->state = IRIS_CORE_DEINIT;
 exit:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index b6acab5a8978..23a7ce3ecb2d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -319,6 +319,20 @@ int iris_vpu_switch_to_hwmode(struct iris_core *core)
 	return core->iris_platform_data->vpu_ops->set_hwmode(core);
 }
 
+int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 {
 	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..e0dc109bbe6a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -33,6 +35,8 @@ int iris_vpu_power_on_controller(struct iris_core *core);
 int iris_vpu_power_on_hw(struct iris_core *core);
 int iris_vpu_set_hwmode(struct iris_core *core);
 int iris_vpu_switch_to_hwmode(struct iris_core *core);
+int iris_init_cb_devs(struct iris_core *core);
+void iris_deinit_cb_devs(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.34.1


