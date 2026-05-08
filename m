Return-Path: <linux-media+bounces-60948-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHlqDugz/mmHnwAAu9opvQ
	(envelope-from <linux-media+bounces-60948-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:05:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFF54FAE87
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7074302B2F5
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDBD41B370;
	Fri,  8 May 2026 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uu1roemS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsgxmGqR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E7F345CD8
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266911; cv=none; b=BuUI7jpw6fm26pduYaM9F61GP3WpO6m9YSwWY19Xh3H93dMM4FlGqkKCLXaT8xfFSlNZCpGegBmzwY6GVzHSMUZnpcPqnurgKSfFXU4g78rfc4zfnMq5J2UBAmQ583BYdjBF2/KPk83iHJ3eUz7VIK859acpq/aUDujzZ5X39zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266911; c=relaxed/simple;
	bh=kiHl1lLYV4nKXfICCZXuAhM4nH0bXvbb/KB+ab5VHpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uoJuSwdJbwb7ScTnefqlanwv9zIzb1sBPJc30A817JK9TTs45VsGsRqQzLHxYJ3guPvfMYvtsr6pDPjFYmB5w8yTg+2xu9yIkTWRuJ2HSG7sE59gHTzRuN/ged6o32dap0VQBISbi2A0XUuBUg+gnu6ucN5u3dBKQ49cHGd1LSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uu1roemS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsgxmGqR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G2uNH724321
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYPsAM9GyVf9eOjiRO6hKDynS22g8zyxVf3Jn1km8YU=; b=Uu1roemSq+rFj4Ml
	ihM70tTc6X/TIgMny2WrqMeePGk4go51ipl/8XU41N+WRi1VEUgA0qWF6JRtVRnE
	J1y27sblqHiFD7WZ2AReowo5YO0ZLZQuiiNwQ8zuzqVbYgeFLQqt9Lr83I3ewEqr
	6eyxFoGDFCMKtkhhkr0X5UAdkwqDvpXmd45AEWyUtE1I7KfdmTr/c4sKQ8u+W0OB
	0FE7LQdUN/EheV/eJE9rqk4ejPhqcGcDamjxu+SR1D93OBl9nweu/A1x+lSZ7oyL
	2JALS+ZTTafwG37gERKXetAX10Ksdgz0tYPCKo6SOu7hJ3ceR1yGlwOKMp+H5Ads
	SMTWPA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0ugmmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:01:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8354503d9acso2679086b3a.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266907; x=1778871707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYPsAM9GyVf9eOjiRO6hKDynS22g8zyxVf3Jn1km8YU=;
        b=KsgxmGqRIng/S0Aa9lL7994BcMXw0JeF/X+Od+D2DvmvK5+r3O2pfL5o58K4bgHIwy
         ytcX4OTwVsQdGArIKU3ZF+8tozqI8QK9ojHm94GQ7SxuOGhXeC0IWyCx9stLvW3aNyiO
         Ynzoysx9xObi/a8V+zw2bvEWv9qiaqtRPmLWc8x32VXLCM6SHfyF3ymbv+NWi9jLPsuc
         gFiNBJusXUd+72lZ4trkONirprr3Wgmuh4KlGBD3jxTCCjcr/L2acc5UuCuPDWTpHt7P
         fujKQH+Q3jT3TgpAwnlEDbN8RtAqdy+xfZ3/Oq9MAAJPwCLw5XRmH1SXn7TKb7isb/b9
         60AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266907; x=1778871707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RYPsAM9GyVf9eOjiRO6hKDynS22g8zyxVf3Jn1km8YU=;
        b=mAdGtTQSDoeMF1UXkcCEQfmEzb7/PTZ61lRIJ23IS7ZQ8iHb+A+SQ0ig5ggjAda1Ua
         smITJXPSG0mDtwy4vcOyNTTK27UWaXgTgN+VGHzz//U/kNc6lrJhXOw7Zhh9+ad/b8mU
         kLqjQcAR8+IvhQO2TLqZ9Mu9no3o60t8YgxGAfEzhYOMaweNARNi6z8K5EopQEGMIdkk
         laHhDbD6LzNq/L4KPcHpMgV0u1YIRFi0zDznaAHQNa469WetAG+7t4zMXRAWRCrN0UZU
         qDMwsCdmMKMLIlYebjZneotIKET4Xmcr/gMgQRrlkxZyKkvzbtaJOdDWSa+LHAu4e40F
         TkqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ww08292f9GiE66bqF3mvUh1smJ1tmtOnpIxBkKzDuPYrpOFkb3QxiJHPBHlQUOrBI1jH4ox1+KD/fLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhr3IuNRLo4CG06E58L35DGvnhae+lGgh+xZGO8U9dDMD391n0
	xYsWlb9e2KTLHWdojpZFQdFXuudGokAsgzgfl23laluvNWbInjdeTkhXu/z8I6T9tzugj+a/Bg3
	gbv/JYdC3NlJsFtrmMPtrqZ9McGbE5Hx1fNihMPaW3hjJxutK5Bu5AwaPVGo3n4sgxq3d4sKyNQ
	==
X-Gm-Gg: Acq92OG9OywSxLhubOSKQIZ9SteVn+o3HWP6yKgBJku4HFlAmZDv8MDepABKPqb8GNU
	W9W/3qyIxSmmP53RnrdDHMqsjLt0LrcVcNE+hkWYetvRO69nc9uQKmYyGIozhyFMJAMXYjX/Olb
	ApKW/cgnrWqrLqvNP2Y4uHpD/9B7H1dfkhyH8cdnOo+MwCO+OHWeTZoOPtTYsII7Dh5tbWdn3op
	lNiA7EBtzYjkRz8ltn+dC7d90uCETZFtXYmG/Ef1Wx8DeK0FX4Rd4ezB45r9ZHy80qf1cXRn4Ap
	tiIsnjHZMrDYA3nEZv6lXq/S1pqy4RXT0jv/fnBvBd+LUbniVc9vo3P4gJnu7JEk0G6kU4/6Lhv
	BMlmsNE4A9ejz8wW5GVPbMViVa6f4+bzEgi3jdjQT8vpIEQq7QCmOL38=
X-Received: by 2002:a05:6a00:1d8c:b0:834:ea1a:4b25 with SMTP id d2e1a72fcca58-83a5c0c170bmr13964821b3a.12.1778266906788;
        Fri, 08 May 2026 12:01:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8c:b0:834:ea1a:4b25 with SMTP id d2e1a72fcca58-83a5c0c170bmr13964762b3a.12.1778266906217;
        Fri, 08 May 2026 12:01:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:45 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:56 +0530
Subject: [PATCH v5 07/14] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=6647;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=UaR2dTIxtzS/tNKuFtSFzOFmr6sz1nG53anx21+ucME=;
 b=ksbDBtsaICiCigSCrJueomIT4etgGvpPl4AHZ9fo7TnEzQZabzy2Qc2SiaSQsPHJHoFsiTsF8
 iR5CCyMyX72BoruM0Pe+FJu6oa8abHugW0rRs7eEHYy4bEic0pOsNke
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe331c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gbwaY6mYjfx-u0ET_fsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 1krW51CqV4Kc9QvqjbcsAcwrkVwdUV40
X-Proofpoint-GUID: 1krW51CqV4Kc9QvqjbcsAcwrkVwdUV40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfXxL2AE6UtVF5g
 baZmCKGHnYlycV7yaEIif77/gCCIQ3zTHJUdAJBLgu5lDFcDso5nRka8junqw+VxC3t7/mdWflP
 3A2pHm0jPn3WXVRkJp6bHIxigDKwRyrYvWDuwAaadGF3x5ry4XDSp/y7f5xWlQcPq8gY7aH/rU+
 EB9X1Hcv2s21VR8VGmGjJrnE7UvlnanXATTSmH+NEC8ccp5J9WGJ7ODxpOW4sgAixTPPMxg9Qmo
 jOKu2zixwPHYzHmTSgYOc4yFMMWOyFalbTUL7jaQZU5TqLmR/CaY/bGymn32z+fD9BH4//1OzY7
 fj+Jnhp6pNJSOIoKG3NALmxL5/M1Xc8Lb3xBVx+IAemjz/IqSXvGsooqHGrMvfceRtcyOqojgx1
 MIJH2vs0Th4sY/iw9YH58IqygAaI/T4r7mgHVUDzr60A2aI8D2wkM0ahQqmet3O1Av3qqhvRyDS
 7sEePZwyhURXK8+x0zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: 2FFF54FAE87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60948-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is required
to enable memory protection for both remoteproc metadata and its memory
regions.

When the hypervisor is absent, the operating system must perform these
configurations instead.

Support for handling IOMMU and SHM setup in the absence of a hypervisor
is now in place. Extend the Iris driver to enable this functionality on
platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).

Additionally, the Iris driver must map the firmware and its required
resources to the firmware SID, which is now specified via iommu-map in
the device tree.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
 2 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..b396c8cf595e 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -34,6 +34,8 @@ enum domain_type {
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @fw_dev: reference to the context bank device used for firmware load
+ * @pas_ctx: SCM PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -77,6 +79,8 @@ enum domain_type {
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*fw_dev;
+	struct qcom_scm_pas_context		*pas_ctx;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..0085dd7ec052 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -13,12 +14,15 @@
 #include "iris_firmware.h"
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_scm_pas_context *pas_ctx;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -29,14 +33,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
+	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, pas_id, mem_phys, res_size);
+	if (IS_ERR(pas_ctx))
+		return PTR_ERR(pas_ctx);
+
+	ret = request_firmware(&firmware, fw_name, fw_dev);
 	if (ret)
 		return ret;
 
@@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+	pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(pas_ctx, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+		if (ret)
+			goto err_mem_unmap;
+	}
 
+	core->pas_ctx = pas_ctx;
+
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -62,6 +88,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	struct iommu_domain *domain;
+
+	if (!core->pas_ctx->use_tzmem)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->fw_dev);
+	if (domain)
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -79,10 +117,10 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -93,17 +131,31 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+	if (ret)
+		return ret;
+
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)

-- 
2.34.1


