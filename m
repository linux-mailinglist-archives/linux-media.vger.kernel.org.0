Return-Path: <linux-media+bounces-61686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPn7AxERB2rgrQIAu9opvQ
	(envelope-from <linux-media+bounces-61686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:26:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB3B54F852
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 459C0317800F
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D328247F2C9;
	Fri, 15 May 2026 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZd9CvgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsoNKHkD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9D47DFA8
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845659; cv=none; b=Bd815uTngKcNHBtIFmz9uQ1QYzTIVXiKDjBoofL5pZT6lCpvioP5R0+tukdJMsfvkzcqGIR6OSFKY0kuUf714O0WqqkR4vSrM/DN4G/MnETQzJBGT0qIo8hIbVX5ctxYkF0+wQ6rfimQCsZKHtF2U3Pc1PjNNopwKDlP1O/stV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845659; c=relaxed/simple;
	bh=orLV6kn+9+K6w9tdux9WKeahE4raE+biRA+lJQo9s2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5eKHOhFyPcSwd1EsBvMK+xBabDSb+mem7/1F8LQsINf53dl8PLKbk5Ff/OBF3w7dveuC+F4l6PU9FsTf0tY4Ju77Klo+b/14qNRiBvNfeZ4a9dj4HrgdtKnXfI4oyZKveN+GcjeMrvSY31p/oaHbkd8nW5t6Scupo30d6qe37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZd9CvgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsoNKHkD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBI1EB655050
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SauN1pTepC/2fYxF8uqpME4TXA8Xxx3ubwdXzV+QKKg=; b=DZd9CvgVwHBcQSSZ
	b8rte54rXIV2QCQGwJNKSBiRV5OftMKD+qqVbTOKp3FE8/9cw/XaW6J3xrr3RM7d
	JDUBYW/cHLnpkJk8TaBxdetSkOCIq2LMlBvR/PbOvlmT0136cboRWmiAEcNczsb4
	eyntESiAz11yOux0xV975a6/uk+ezfsidrdqg4G4gx6YzoXkK/R62t+roQ45TZQY
	cZNE/RsCASV0UbhkPC4pZb5jC2tTcP7fWTGoPUAP5dxmS9+eKW/qRmwwKNSTtFNq
	YbElrF/3P9UQ70l7XW/ZIDbcLvyD3/IV4o/wDrOVAaHxIqxZPAjdTeqZ3MiqnADY
	Mq6Now==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu5dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575c3a362f4so9559058e0c.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845634; x=1779450434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SauN1pTepC/2fYxF8uqpME4TXA8Xxx3ubwdXzV+QKKg=;
        b=OsoNKHkDrIqS7cGW6SQzA5vNMUl+cmcrd1ielw4JIonsrX+yU9/3oelHbSl7RY0Dvh
         PDpU/nB/WaJvq1UtiJClP1skokMamWvRFKNKE971ZiFyqS39qcBjhOPKlpq2kBMKd5ad
         ndbDQjlUgqj8/TcvtqquXXRbTn9Cqe+fEq8n/ROfFu8LikiXpWfduLlWlM/hSMUh+WVi
         OhGQfUSitu5XRKky7xw886FsQVgUI/rscULa+Vuy9ISEHTvnJXsw7aqtgykEU1QVlhOl
         7PDEk11VMQ6ozmp07h4v4u4+9d3YHpB9O+asrSoQQNlrJkrgH1bHNrAXcahbtVyNRL1y
         qOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845634; x=1779450434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SauN1pTepC/2fYxF8uqpME4TXA8Xxx3ubwdXzV+QKKg=;
        b=IZMXtXB21DObHZtjoFAFigk5A5ovdYfFygysSXCDOQ7yyb126unfYErOtxN0Q/+M8d
         uZx0pVc8KhL1JkE2VEq4F8XPIPqgZ7HyIgOv6biayX5IACjb0G/i1zmULHZU+jV4SEn5
         z++ZL4xJZzLb9XFnc6CS05a1zPIkNVo2H/SDS1oPUhXAYKzPC3S+fKkZm8f7XUiOwgcl
         TZAxlF/X5yeRkMWJG/j94YlS+uXOP8hmImL3srOYPaiBK9OtTgKk3TBEoz81zlNOfb6/
         kg1bVQJ+GiOLb06Cx+KX6M9pZQ41s3t5TYCRgoOykkgJJoMr2tHLsMUFsQn+R6pRbwwi
         0ZrA==
X-Gm-Message-State: AOJu0Ywt6vo9ybeJIpwb0leolCUcia0o0PKjLKaPbY7jwgzGBriVOJtM
	orNAIe1tHK8GDz14Kn0Cd3IMHMEX0gaB2beloIDh4BuhMhta0NNmLhSRhLKtBHbMwYWHNhUSGl1
	FTWtXCHO2yMqsWkBYFMpXkUGftrREGA6JWoangp0AC3Tqn1Jk34fpAgOYnzpkVJibFJp1Ln0z5K
	FBsrY=
X-Gm-Gg: Acq92OGG++i1VwwDiTM26KzWS+F2qK9+EhCsjX18J53abgIiN66cJr2NrJ7DKUY7Okb
	uShW2lI7e+osP8dunWF+UVIIb/0FxcN6BTujeWzbEJ3YudK36KpK5zemd76qbHY4eAJWjDjY3yU
	4oLmUAz/mPT73ke3z8/cLspshsnP7i9FL7ltvU88H8Lkf7gf3swFnDF/h+e7euccOqO4S+mN+/E
	e+x4s5Ldf+rKLWMQidhukSWcZXLR9RaH94OSlwCoo5KF06SJx/RNWW9jSWJM5v4pGWeXw0t9fJ4
	AlrAjkPPuCjbUqub1eMVcln5Pe3rcnTObUeNX/oUQKISeJzLL/qY7kek4wna6dE2WShCLLB4bQB
	mtJZEJKjIRawJpVDucH4HO47L8slyiIUT
X-Received: by 2002:a05:6122:1c85:b0:56a:fcbf:8aa4 with SMTP id 71dfb90a1353d-5760bfb9623mr2165525e0c.2.1778845633160;
        Fri, 15 May 2026 04:47:13 -0700 (PDT)
X-Received: by 2002:a05:6122:1c85:b0:56a:fcbf:8aa4 with SMTP id 71dfb90a1353d-5760bfb9623mr2165479e0c.2.1778845631952;
        Fri, 15 May 2026 04:47:11 -0700 (PDT)
Received: from [127.0.1.1] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm216853366b.24.2026.05.15.04.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:47:10 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:47:00 +0300
Subject: [PATCH 2/3] qcom: media: jpeg: Add Qualcomm JPEG V4L2 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-qcom-jpeg-v4l2-v1-2-f38c2e1b3555@oss.qualcomm.com>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: I_kwuBWcZ7l0D4j-JgR9XpakH6cVxsyu
X-Proofpoint-ORIG-GUID: I_kwuBWcZ7l0D4j-JgR9XpakH6cVxsyu
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a0707c4 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SSmOFEACAAAA:8 a=EUspDBNiAAAA:8 a=AQolYa86ga2h4Or4hIEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfXxua38DfFwMaa
 ftxJXrTnzcUcd4QOrCZdcyy+/RIxjyFVw/QCfSnkTncHkmg6r5ODRYkneKyQc3E2hcqwi2bry2J
 npnYuNcal5W989CfQ6YVrp+bZjGCJSqTELQxbUqJ7JHH1GKl3ufA5xo8V4L6H429HdDFCVU5Itt
 SrWQx0P0DbPm/zQUUDiLT7E2F0rj8RUSEEugL6pC4mnU6sCNqOSDCJf2WtCCgpOTWcELOXOIHhz
 6Cylqp7ngbCR5TbJmgmsoadDcpDFaaHbRjzJSOnmI1mLfyKuk30z1xYXnYLGM5rCchdNztoMcol
 JIiOcji5EsgWposuk8VfTemrZoexFrC/CqNZP9GcoRdzPk+rNBKocIQbJYFiPDELGnba0k1n6Xl
 URvQDvrtzE8nu87OGx37/8pG5bSlEbS4QVNveNfzRX5BJRtLgdaaKg660e3WKTf3nXmScf1VX/T
 3v4tvfD9fw0ES4owB+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: BDB3B54F852
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-61686-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Implementation of a V4L2 JPEG encoder device driver supporting
Qualcomm SC7180, SM8250, SM7280, and SM8550 chipsets.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/Kconfig                |    1 +
 drivers/media/platform/qcom/Makefile               |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig           |   17 +
 drivers/media/platform/qcom/jpeg/Makefile          |    9 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h  |  253 ++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c   |  370 +++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h   |  111 ++
 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c   |  388 +++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h   |  130 ++
 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c   | 1522 ++++++++++++++++++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h   |   49 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c   |  268 ++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h   |   70 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c  | 1082 ++++++++++++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h  |   27 +
 .../platform/qcom/jpeg/qcom_v165_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v580_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v680_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v780_jenc_hw_info.h    |  509 +++++++
 19 files changed, 6334 insertions(+)

diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
index 4f4d3a68e6e5..f33d53a754a0 100644
--- a/drivers/media/platform/qcom/Kconfig
+++ b/drivers/media/platform/qcom/Kconfig
@@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
 source "drivers/media/platform/qcom/camss/Kconfig"
 source "drivers/media/platform/qcom/iris/Kconfig"
 source "drivers/media/platform/qcom/venus/Kconfig"
+source "drivers/media/platform/qcom/jpeg/Kconfig"
diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
index ea2221a202c0..30c94949e9de 100644
--- a/drivers/media/platform/qcom/Makefile
+++ b/drivers/media/platform/qcom/Makefile
@@ -2,3 +2,4 @@
 obj-y += camss/
 obj-y += iris/
 obj-y += venus/
+obj-y += jpeg/
diff --git a/drivers/media/platform/qcom/jpeg/Kconfig b/drivers/media/platform/qcom/jpeg/Kconfig
new file mode 100644
index 000000000000..51846aeafaf3
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_QCOM_JENC
+	tristate "Qualcomm V4L2 JPEG Encoder driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	depends on VIDEO_DEV
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_SG
+	select V4L2_MEM2MEM_DEV
+	help
+	  Qualcomm JPEG memory-to-memory V4L2 encoder driver.
+
+	  Provides:
+	    - qcom-jenc (encode)
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qcom-jenc
diff --git a/drivers/media/platform/qcom/jpeg/Makefile b/drivers/media/platform/qcom/jpeg/Makefile
new file mode 100644
index 000000000000..310f6c3c1f19
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_VIDEO_QCOM_JENC) += qcom-jenc.o
+
+qcom-jenc-objs += \
+	qcom_jenc_dev.o \
+	qcom_jenc_v4l2.o \
+	qcom_jenc_ops.o \
+	qcom_jenc_res.o \
+	qcom_jenc_hdr.o
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
new file mode 100644
index 000000000000..40e46820c546
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
@@ -0,0 +1,253 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_DEFS_H_
+#define QCOM_JENC_DEFS_H_
+
+#include <linux/types.h>
+#include <linux/io.h>
+#include <linux/bitfield.h>
+#include <linux/videodev2.h>
+#include <media/videobuf2-core.h>
+
+/* Offline JPEG encoder constraints */
+#define QCOM_JPEG_HW_MAX_WIDTH	9248
+#define QCOM_JPEG_HW_MAX_HEIGHT	8192
+#define QCOM_JPEG_HW_MIN_WIDTH	128
+#define QCOM_JPEG_HW_MIN_HEIGHT	96
+
+#define QCOM_JPEG_HW_DEF_HSTEP	16
+#define QCOM_JPEG_HW_DEF_VSTEP	16
+
+#define QCOM_JPEG_HW_DEF_WIDTH	1920
+#define QCOM_JPEG_HW_DEF_HEIGHT	1080
+
+#define QCOM_JPEG_MAX_PLANES	3
+
+#define QCOM_JPEG_QUALITY_MIN	1
+#define QCOM_JPEG_QUALITY_DEF	95
+#define QCOM_JPEG_QUALITY_MAX	100
+#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
+#define QCOM_JPEG_QUALITY_UNT	1
+
+enum qcom_jpeg_soc_id {
+	QCOM_V165_SOC_ID = 0,
+	QCOM_V580_SOC_ID,
+	QCOM_V680_SOC_ID,
+	QCOM_V780_SOC_ID,
+	QCOM_UNKNOWN_SOC_ID,
+};
+
+enum qcom_soc_perf_level {
+	QCOM_SOC_PERF_SUSPEND = 0,
+	QCOM_SOC_PERF_LOWSVS,
+	QCOM_SOC_PERF_SVS,
+	QCOM_SOC_PERF_SVS_L1,
+	QCOM_SOC_PERF_NOMINAL,
+	QCOM_SOC_PERF_TURBO,
+	QCOM_SOC_PERF_LEVEL_MAX,
+};
+
+enum qcom_jpeg_mask_id {
+	JMSK_HW_VER_STEP,
+	JMSK_HW_VER_MINOR,
+	JMSK_HW_VER_MAJOR,
+
+	JMSK_HW_CAP_ENCODE,
+	JMSK_HW_CAP_DECODE,
+	JMSK_HW_CAP_UPSCALE,
+	JMSK_HW_CAP_DOWNSCALE,
+
+	JMSK_RST_CMD_COMMON,
+	JMSK_RST_CMD_FE_RESET,
+	JMSK_RST_CMD_WE_RESET,
+	JMSK_RST_CMD_ENCODER_RESET,
+	JMSK_RST_CMD_DECODER_RESET,
+	JMSK_RST_CMD_BLOCK_FORMATTER_RST,
+	JMSK_RST_CMD_SCALE_RESET,
+	JMSK_RST_CMD_REGISTER_RESET,
+	JMSK_RST_CMD_MISR_RESET,
+	JMSK_RST_CMD_CORE_RESET,
+	JMSK_RST_CMD_JMSK_DOMAIN_RESET,
+	JMSK_RST_CMD_RESET_BYPASS,
+
+	JMSK_CMD_HW_START,
+	JMSK_CMD_HW_STOP,
+	JMSK_CMD_CLR_RD_PLNS_QUEUE,
+	JMSK_CMD_CLR_WR_PLNS_QUEUE,
+	JMSK_CMD_APPLY_SWC_RD_PARAMS,
+
+	JMSK_CORE_CFG_FE_ENABLE,
+	JMSK_CORE_CFG_WE_ENABLE,
+	JMSK_CORE_CFG_ENC_ENABLE,
+	JMSK_CORE_CFG_SCALE_ENABLE,
+	JMSK_CORE_CFG_TESTBUS_ENABLE,
+	JMSK_CORE_CFG_MODE,
+	JMSK_CORE_CFG_CGC_DISABLE,
+
+	JMSK_CORE_STATUS_ENCODE_STATE,
+	JMSK_CORE_STATUS_SCALE_STATE,
+	JMSK_CORE_STATUS_RT_STATE,
+	JMSK_CORE_STATUS_BUS_STATE,
+	JMSK_CORE_STATUS_CGC_STATE,
+
+	JMSK_IRQ_ENABLE_ALL,
+	JMSK_IRQ_DISABLE_ALL,
+	JMSK_IRQ_CLEAR_ALL,
+
+	JMSK_IRQ_STATUS_SESSION_DONE,
+	JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE,
+	JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE,
+	JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE,
+	JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN,
+	JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE,
+	JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE,
+	JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE,
+	JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN,
+	JMSK_IRQ_STATUS_SESSION_ERROR,
+	JMSK_IRQ_STATUS_STOP_ACK,
+	JMSK_IRQ_STATUS_RESET_ACK,
+
+	JMSK_FE_CFG_BYTE_ORDERING,
+	JMSK_FE_CFG_BURST_LENGTH_MAX,
+	JMSK_FE_CFG_MEMORY_FORMAT,
+	JMSK_FE_CFG_CBCR_ORDER,
+	JMSK_FE_CFG_BOTTOM_VPAD_EN,
+	JMSK_FE_CFG_PLN0_EN,
+	JMSK_FE_CFG_PLN1_EN,
+	JMSK_FE_CFG_PLN2_EN,
+	JMSK_FE_CFG_SIXTEEN_MCU_EN,
+	JMSK_FE_CFG_MCUS_PER_BLOCK,
+	JMSK_FE_CFG_MAL_BOUNDARY,
+	JMSK_FE_CFG_MAL_EN,
+
+	JMSK_FE_VBPAD_CFG_BLOCK_ROW,
+
+	JMSK_PLNS_RD_OFFSET,
+	JMSK_PLNS_RD_BUF_SIZE_WIDTH,
+	JMSK_PLNS_RD_BUF_SIZE_HEIGHT,
+	JMSK_PLNS_RD_STRIDE,
+	JMSK_PLNS_RD_HINIT,
+	JMSK_PLNS_RD_VINIT,
+
+	JMSK_WE_CFG_BYTE_ORDERING,
+	JMSK_WE_CFG_BURST_LENGTH_MAX,
+	JMSK_WE_CFG_MEMORY_FORMAT,
+	JMSK_WE_CFG_CBCR_ORDER,
+	JMSK_WE_CFG_PLN0_EN,
+	JMSK_WE_CFG_PLN1_EN,
+	JMSK_WE_CFG_PLN2_EN,
+	JMSK_WE_CFG_MAL_BOUNDARY,
+	JMSK_WE_CFG_MAL_EN,
+	JMSK_WE_CFG_POP_BUFF_ON_EOS,
+
+	JMSK_PLNS_WR_BUF_SIZE_WIDTH,
+	JMSK_PLNS_WR_BUF_SIZE_HEIGHT,
+
+	JMSK_PLNS_WR_STRIDE,
+	JMSK_PLNS_WR_HINIT,
+	JMSK_PLNS_WR_VINIT,
+	JMSK_PLNS_WR_HSTEP,
+	JMSK_PLNS_WR_VSTEP,
+	JMSK_PLNS_WR_BLOCK_CFG_PER_COL,
+	JMSK_PLNS_WR_BLOCK_CFG_PER_RAW,
+
+	JMSK_ENC_CFG_IMAGE_FORMAT,
+	JMSK_ENC_CFG_APPLY_EOI,
+	JMSK_ENC_CFG_HUFFMAN_SEL,
+	JMSK_ENC_CFG_FSC_ENABLE,
+	JMSK_ENC_CFG_OUTPUT_DISABLE,
+	JMSK_ENC_CFG_RST_MARKER_PERIOD,
+	JMSK_ENC_IMAGE_SIZE_WIDTH,
+	JMSK_ENC_IMAGE_SIZE_HEIGHT,
+
+	JMSK_SCALE_CFG_HSCALE_ENABLE,
+	JMSK_SCALE_CFG_VSCALE_ENABLE,
+	JMSK_SCALE_CFG_UPSAMPLE_EN,
+	JMSK_SCALE_CFG_SUBSAMPLE_EN,
+	JMSK_SCALE_CFG_HSCALE_ALGO,
+	JMSK_SCALE_CFG_VSCALE_ALGO,
+	JMSK_SCALE_CFG_H_SCALE_FIR_ALGO,
+	JMSK_SCALE_CFG_V_SCALE_FIR_ALGO,
+
+	JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH,
+	JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT,
+
+	JMSK_SCALE_PLNS_HSTEP_FRACTIONAL,
+	JMSK_SCALE_PLNS_HSTEP_INTEGER,
+	JMSK_SCALE_PLNS_VSTEP_FRACTIONAL,
+	JMSK_SCALE_PLNS_VSTEP_INTEGER,
+
+	JMSK_DMI_CFG,
+	JMSK_DMI_ADDR,
+	JMSK_DMI_DATA,
+
+	JMSK_TESTBUS_CFG,
+	JMSK_FE_VBPAD_CFG,
+
+	JMSK_PLN0_RD_HINIT_INT,
+	JMSK_PLN1_RD_HINIT_INT,
+	JMSK_PLN2_RD_HINIT_INT,
+	JMSK_PLN0_RD_VINIT_INT,
+	JMSK_PLN1_RD_VINIT_INT,
+	JMSK_PLN2_RD_VINIT_INT,
+	JMSK_ID_MAX
+};
+
+struct qcom_jpeg_reg_offs {
+	u32 hw_version;
+	u32 hw_capability;
+	u32 reset_cmd;
+	u32 core_cfg;
+	u32 int_mask;
+	u32 int_clr;
+	u32 int_status;
+	u32 hw_cmd;
+	u32 enc_core_state;
+
+	struct {
+		u32 pntr[QCOM_JPEG_MAX_PLANES];
+		u32 offs[QCOM_JPEG_MAX_PLANES];
+		u32 cnsmd[QCOM_JPEG_MAX_PLANES];
+		u32 bsize[QCOM_JPEG_MAX_PLANES];
+		u32 stride[QCOM_JPEG_MAX_PLANES];
+		u32 hinit[QCOM_JPEG_MAX_PLANES];
+		u32 vinit[QCOM_JPEG_MAX_PLANES];
+		u32 pntr_cnt;
+		u32 vbpad_cfg;
+	} fe;
+	u32 fe_cfg;
+
+	struct {
+		u32 pntr[QCOM_JPEG_MAX_PLANES];
+		u32 cnsmd[QCOM_JPEG_MAX_PLANES];
+		u32 bsize[QCOM_JPEG_MAX_PLANES];
+		u32 stride[QCOM_JPEG_MAX_PLANES];
+		u32 hinit[QCOM_JPEG_MAX_PLANES];
+		u32 hstep[QCOM_JPEG_MAX_PLANES];
+		u32 vinit[QCOM_JPEG_MAX_PLANES];
+		u32 vstep[QCOM_JPEG_MAX_PLANES];
+		u32 blocks[QCOM_JPEG_MAX_PLANES];
+		u32 pntr_cnt;
+	} we;
+	u32 we_cfg;
+
+	struct {
+		u32 hstep[QCOM_JPEG_MAX_PLANES];
+		u32 vstep[QCOM_JPEG_MAX_PLANES];
+	} scale;
+	u32 scale_cfg;
+	u32 scale_out_cfg[QCOM_JPEG_MAX_PLANES];
+
+	u32 enc_cfg;
+	u32 enc_img_size;
+	u32 enc_out_size;
+
+	u32 dmi_cfg;
+	u32 dmi_data;
+	u32 dmi_addr;
+} __packed;
+
+#endif /* QCOM_JENC_DEFS_H_ */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
new file mode 100644
index 000000000000..4ef6bf9fd48d
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include <media/v4l2-mem2mem.h>
+
+#include "qcom_jenc_dev.h"
+
+#include "qcom_jenc_defs.h"
+#include "qcom_jenc_ops.h"
+#include "qcom_jenc_res.h"
+#include "qcom_jenc_v4l2.h"
+
+static int qcom_jpeg_match_data(struct qcom_jenc_dev *jenc)
+{
+	struct device *dev = jenc->dev;
+	const struct qcom_dev_resources *res;
+
+	res = device_get_match_data(dev);
+	if (!res)
+		return dev_err_probe(dev, -ENODEV, "unsupported SoC\n");
+
+	jenc->res = res;
+
+	return 0;
+}
+
+static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_dev_resources *res = jenc->res;
+	int c_idx;
+
+	jenc->clks = devm_kcalloc(jenc->dev, ARRAY_SIZE(res->clk_names), sizeof(*jenc->clks),
+				  GFP_KERNEL);
+	if (!jenc->clks)
+		return -ENOMEM;
+
+	for (c_idx = 0; c_idx < ARRAY_SIZE(res->clk_names); c_idx++) {
+		if (!res->clk_names[c_idx])
+			break;
+
+		jenc->clks[c_idx].clk = devm_clk_get(jenc->dev, res->clk_names[c_idx]);
+		if (IS_ERR(jenc->clks[c_idx].clk)) {
+			return dev_err_probe(jenc->dev, PTR_ERR(jenc->clks[c_idx].clk),
+					     "failed to get clock %s\n", res->clk_names[c_idx]);
+		}
+
+		jenc->clks[c_idx].id = res->clk_names[c_idx];
+		jenc->num_clks++;
+	}
+
+	return 0;
+}
+
+static int qcom_jpeg_clk_rate(struct qcom_jenc_dev *jenc, enum qcom_soc_perf_level level)
+{
+	const struct qcom_dev_resources	*res = jenc->res;
+	const struct qcom_perf_resource	*perf = &res->perf_cfg[level];
+	int c_idx;
+	int rc = 0;
+
+	for (c_idx = 0; c_idx < jenc->num_clks; c_idx++) {
+		/* skip clocks with fixed or default frequency */
+		if (!perf->clk_rate[c_idx])
+			continue;
+
+		/* setup frequency according to performance level */
+		rc = clk_set_rate(jenc->clks[c_idx].clk, perf->clk_rate[c_idx]);
+		if (rc < 0) {
+			dev_err(jenc->dev, "clock set rate failed: %d\n", rc);
+			return rc;
+		}
+
+		dev_dbg(jenc->dev, "clock %s current rate: %ld\n",
+			jenc->clks[c_idx].id, clk_get_rate(jenc->clks[c_idx].clk));
+	}
+
+	return rc;
+}
+
+static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
+{
+	int rc;
+
+	rc = qcom_jpeg_clk_rate(jenc, jenc->perf);
+	if (rc)
+		return rc;
+
+	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
+{
+	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
+}
+
+static int qcom_jpeg_icc_on(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_dev_resources	*res = jenc->res;
+	int p_idx;
+	int rc;
+
+	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++) {
+		rc = icc_set_bw(jenc->icc_paths[p_idx], res->icc_res[p_idx].pair.aggr,
+				res->icc_res[p_idx].pair.peak);
+		if (rc) {
+			dev_err(jenc->dev, "%s failed for path %s: %d\n", __func__,
+				res->icc_res[p_idx].icc_id, rc);
+			goto err_icc_set_bw;
+		}
+	}
+
+	return 0;
+
+err_icc_set_bw:
+	while (--p_idx >= 0)
+		icc_set_bw(jenc->icc_paths[p_idx], 0, 0);
+
+	return rc;
+}
+
+static void qcom_jpeg_icc_off(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_dev_resources	*res = jenc->res;
+	int p_idx;
+
+	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++)
+		icc_set_bw(jenc->icc_paths[p_idx], 0, 0);
+}
+
+static int qcom_jpeg_icc_init(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_dev_resources	*res = jenc->res;
+	int p_idx;
+
+	jenc->icc_paths = devm_kcalloc(jenc->dev, res->num_of_icc, sizeof(*jenc->icc_paths),
+				       GFP_KERNEL);
+	if (!jenc->icc_paths)
+		return -ENOMEM;
+
+	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++) {
+		jenc->icc_paths[p_idx] = devm_of_icc_get(jenc->dev, res->icc_res[p_idx].icc_id);
+		if (IS_ERR(jenc->icc_paths[p_idx])) {
+			return dev_err_probe(jenc->dev, PTR_ERR(jenc->icc_paths[p_idx]),
+					     "failed to get ICC path: %ld\n",
+					     PTR_ERR(jenc->icc_paths[p_idx]));
+		}
+	}
+
+	return 0;
+}
+
+static __maybe_unused int qcom_jpeg_pm_suspend(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+
+	qcom_jpeg_clk_off(jenc);
+
+	qcom_jpeg_icc_off(jenc);
+
+	return 0;
+}
+
+static __maybe_unused int qcom_jpeg_pm_resume(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+	int rc;
+
+	rc = qcom_jpeg_icc_on(jenc);
+	if (rc)
+		return rc;
+
+	return qcom_jpeg_clk_on(jenc);
+}
+
+static __maybe_unused int qcom_jpeg_suspend(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+
+	v4l2_m2m_suspend(jenc->m2m_dev);
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static __maybe_unused int qcom_jpeg_resume(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_resume(dev);
+	if (rc)
+		return rc;
+
+	v4l2_m2m_resume(jenc->m2m_dev);
+
+	return rc;
+}
+
+static const struct dev_pm_ops qcom_jpeg_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(qcom_jpeg_suspend, qcom_jpeg_resume)
+	SET_RUNTIME_PM_OPS(qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL)
+};
+
+static int qcom_jpeg_probe(struct platform_device *pdev)
+{
+	struct qcom_jenc_dev *jenc;
+	int rc;
+
+	jenc = devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
+	if (!jenc)
+		return -ENOMEM;
+
+	jenc->dev = &pdev->dev;
+	mutex_init(&jenc->dev_mutex);
+	spin_lock_init(&jenc->hw_lock);
+	init_completion(&jenc->reset_complete);
+	init_completion(&jenc->stop_complete);
+
+	rc = qcom_jpeg_match_data(jenc);
+	if (rc)
+		return dev_err_probe(jenc->dev, rc, "failed to attach hardware\n");
+
+	if (!jenc->res->hw_offs || !jenc->res->hw_ops)
+		return dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
+
+	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
+	if (rc)
+		return dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
+
+	platform_set_drvdata(pdev, jenc);
+
+	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(jenc->jpeg_base)) {
+		rc = PTR_ERR(jenc->jpeg_base);
+		return dev_err_probe(jenc->dev, rc, "failed to map JPEG resource\n");
+	}
+
+	jenc->cpas_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(jenc->cpas_base)) {
+		rc = PTR_ERR(jenc->cpas_base);
+		return dev_err_probe(jenc->dev, rc, "failed to map CPAS resource\n");
+	}
+
+	rc = qcom_jpeg_clk_init(jenc);
+	if (rc)
+		return dev_err_probe(jenc->dev, rc, "failed to init bulk clocks\n");
+
+	jenc->irq = platform_get_irq(pdev, 0);
+	if (jenc->irq < 0)
+		return dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
+
+	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
+				       jenc->res->hw_ops->hw_irq_top,
+				       jenc->res->hw_ops->hw_irq_bot,
+				       IRQF_ONESHOT, dev_name(jenc->dev), jenc);
+	if (rc)
+		return dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
+
+	rc = qcom_jpeg_icc_init(jenc);
+	if (rc)
+		return dev_err_probe(jenc->dev, rc, "failed to get ICC resources\n");
+
+	rc = kfifo_alloc(&jenc->kfifo_inst, sizeof(jenc->enc_status) * VB2_MAX_FRAME, GFP_KERNEL);
+	if (rc) {
+		dev_err(jenc->dev, "failed to allocate kfifo\n");
+		return rc;
+	}
+
+	spin_lock_init(&jenc->kfifo_lock);
+
+	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
+	if (rc) {
+		dev_err(jenc->dev, "failed to register V4L2 device\n");
+		goto err_kfifo_free;
+	}
+
+	rc = qcom_jpeg_v4l2_register(jenc);
+	if (rc) {
+		dev_err(jenc->dev, "failed to register video device\n");
+		goto err_v4l2_device_unregister;
+	}
+
+	jenc->perf = QCOM_SOC_PERF_NOMINAL;
+
+	pm_runtime_enable(jenc->dev);
+
+	dev_info(jenc->dev, "Qualcomm JPEG encoder registered\n");
+
+	return 0;
+
+err_v4l2_device_unregister:
+	v4l2_device_unregister(&jenc->v4l2_dev);
+err_kfifo_free:
+	kfifo_free(&jenc->kfifo_inst);
+
+	return rc;
+}
+
+static void qcom_jpeg_remove(struct platform_device *pdev)
+{
+	struct qcom_jenc_dev *jenc = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	qcom_jpeg_v4l2_unregister(jenc);
+
+	v4l2_device_unregister(&jenc->v4l2_dev);
+
+	kfifo_free(&jenc->kfifo_inst);
+
+	dev_info(jenc->dev, "Qualcomm JPEG encoder deregistered\n");
+}
+
+static const struct of_device_id qcom_jpeg_of_match[] = {
+	{
+		.compatible	= "qcom,sc7180-jenc",
+		.data		= &qcom_jpeg_v165_drvdata
+	},
+	{
+		.compatible	= "qcom,sm8250-jenc",
+		.data		= &qcom_jpeg_v580_drvdata
+	},
+	{
+		.compatible	= "qcom,sm7325-jenc",
+		.data		= &qcom_jpeg_v580_drvdata
+	},
+	{
+		.compatible	= "qcom,sc7280-jenc",
+		.data		= &qcom_jpeg_v680_drvdata
+	},
+	{
+		.compatible	= "qcom,qcm6490-jenc",
+		.data		= &qcom_jpeg_v680_drvdata
+	},
+	{
+		.compatible	= "qcom,sm8550-jenc",
+		.data		= &qcom_jpeg_v780_drvdata
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_jpeg_of_match);
+
+static struct platform_driver qcom_jpeg_platform_driver = {
+	.probe  = qcom_jpeg_probe,
+	.remove = qcom_jpeg_remove,
+	.driver = {
+		.name = QCOM_JPEG_ENC_NAME,
+		.of_match_table = qcom_jpeg_of_match,
+		.pm             = &qcom_jpeg_pm_ops,
+	},
+};
+
+module_platform_driver(qcom_jpeg_platform_driver);
+
+MODULE_DESCRIPTION("QCOM JPEG mem2mem V4L2 encoder");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
new file mode 100644
index 000000000000..cf0c1a933163
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_DEV_H
+#define QCOM_JENC_DEV_H
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/irqreturn.h>
+#include <linux/interconnect.h>
+#include <linux/kfifo.h>
+#include <linux/irq_work.h>
+#include <media/videobuf2-core.h>
+
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/v4l2-ctrls.h>
+
+#include "qcom_jenc_res.h"
+#include "qcom_jenc_hdr.h"
+#include "qcom_jenc_defs.h"
+
+#define QCOM_JPEG_ENC_NAME "qcom-jpeg-enc"
+
+#define TYPE2QID(t) \
+	(V4L2_TYPE_IS_OUTPUT(t) ? JENC_SRC_QUEUE : JENC_DST_QUEUE)
+
+enum qcom_enc_qid {
+	JENC_SRC_QUEUE = 0,
+	JENC_DST_QUEUE,
+	JENC_QUEUE_MAX
+};
+
+struct jenc_enc_format {
+	u32 type;
+	u32 fourcc;
+};
+
+struct qcom_jpeg_buff {
+	struct {
+		struct sg_table		*sgt;
+		dma_addr_t		dma;
+		unsigned long		size;
+
+	} plns[QCOM_JPEG_MAX_PLANES];
+};
+
+struct qcom_jenc_queue {
+	struct v4l2_pix_format_mplane	vf;
+	u32				sequence;
+	struct qcom_jpeg_buff		buff[VB2_MAX_FRAME];
+	int				buff_id;
+};
+
+struct qcom_jenc_dev {
+	struct device			*dev;
+	struct v4l2_device		v4l2_dev;
+	struct v4l2_m2m_dev		*m2m_dev;
+	struct video_device		*vdev;
+	const struct qcom_dev_resources	*res;
+	enum qcom_soc_perf_level	perf;
+	int				irq;
+	void __iomem			*jpeg_base;
+	void __iomem			*cpas_base;
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+	/* device mutex lock */
+	struct mutex			dev_mutex;
+	atomic_t			ref_count;
+	struct completion		reset_complete;
+	struct completion		stop_complete;
+	/* decoder hardware lock */
+	spinlock_t			hw_lock;
+	struct jenc_context		*actx;
+	struct icc_path			**icc_paths;
+
+	struct kfifo			kfifo_inst;
+	/* lock kfifo operations */
+	spinlock_t			kfifo_lock;
+	u32				enc_status;
+
+	void (*enc_hw_irq_cb)
+		(void *data, enum vb2_buffer_state ev, size_t out_size);
+};
+
+struct jenc_context {
+	struct device		 *dev;
+	struct qcom_jenc_dev	 *jenc;
+	struct v4l2_fh		 fh;
+
+	/* quality update lock */
+	struct mutex		 quality_mutex;
+	struct v4l2_ctrl	 *quality_ctl;
+	u32			 quality_requested;
+	u32			 quality_programmed;
+	struct v4l2_ctrl_handler ctrl_hdl;
+
+	/* session context lock */
+	struct mutex		 ctx_lock;
+
+	/* decoder state lock */
+	struct mutex		 stop_lock;
+	bool			 is_stopping;
+
+	struct qcom_jenc_queue	bufq[JENC_QUEUE_MAX];
+	struct qcom_jenc_header	hdr_cache;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
new file mode 100644
index 000000000000..5a794882b980
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/string.h>
+#include <linux/errno.h>
+
+#include "qcom_jenc_hdr.h"
+#include "qcom_jenc_dev.h"
+
+/*
+ * The elements defined in this header are specified
+ * in the ITU-T T.81 / JPEG specification.
+ *
+ * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+
+#define JFIF_HEADER_WIDTH_OFFS	0x07
+#define JFIF_HEADER_HEIGHT_OFFS	0x05
+
+struct jpeg_header_buf {
+	u8  *ptr;
+	u32 size;
+	u32 pos;
+};
+
+static const struct jpeg_soi_app0 soi_app0 = {
+	.soi		= { 0xff, 0xd8 },
+	.app0_marker	= { 0xff, 0xe0 },
+	.app0_length	= { 0x00, 0x10 },
+	.jfif_id	= { 'J', 'F', 'I', 'F', 0x00 },
+	.version	= { 0x01, 0x01 },
+	.units		= 0x00,
+	.density_x	= { 0x00, 0x01 },
+	.density_y	= { 0x00, 0x01 },
+	.thumb_x	= 0x00,
+	.thumb_y	= 0x00,
+};
+
+static const struct jpeg_record_hdr dqt_luma_hdr = {
+	.marker = { 0xff, 0xdb },
+	.length = { 0, 0x43 }
+};
+
+/* Luminance quantization table */
+static const struct jpeg_dqt_header dqt_luma_data = {
+	.index = 0x00,
+};
+
+static const struct jpeg_record_hdr  dqt_chroma_hdr = {
+	.marker = { 0xff, 0xdb },
+	.length = { 0, 0x84 }
+};
+
+/* Chrominance quantization table */
+static const struct jpeg_dqt_header dqt_chroma_data = {
+	.index = 0x01,
+};
+
+static const struct jpeg_record_hdr  sof0_mono_hdr = {
+	.marker	= { 0xff, 0xc0 },
+	.length	= { 0x00, 0x0b },
+};
+
+static const struct jpeg_sof0_mono sof0_mono_data = {
+	.precision	= 0x08,
+	.height		= { 0x00, 0x00 },
+	.width		= { 0x00, 0x00 },
+	.components	= 1,
+	.y_id		= 1,
+	.y_sampling	= 0x11,
+	.y_qtable	= 0,
+};
+
+static const struct jpeg_record_hdr  sof0_color_hdr = {
+	.marker	= { 0xff, 0xc0 },
+	.length	= { 0x00, 0x11 },
+};
+
+static const struct jpeg_sof0_color sof0_color_data = {
+	.precision	= 0x08,
+	.height		= { 0x00, 0x00 },
+	.width		= { 0x00, 0x00 },
+	.components	= 3,
+	.y_id		= 1,
+	.y_sampling	= 0x22,
+	.y_qtable	= 0,
+	.cb_id		= 2,
+	.cb_sampling	= 0x11,
+	.cb_qtable	= 1,
+	.cr_id		= 3,
+	.cr_sampling	= 0x11,
+	.cr_qtable	= 1,
+};
+
+static const struct jpeg_record_hdr luma_coeff_hdr = {
+	.marker	= { 0xff, 0xc4 },
+	.length	= { 0x00, 0xb5 },
+};
+
+/*
+ * DC Luminance
+ *
+ * Typical tables for DC difference coding from  CCITT T.81
+ * specification K.3.3.1, page 162.
+ */
+static const struct jpeg_dc_coeff_desc luma_dc_coeff = {
+	.index	= 0,
+	.bits	= {
+		0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
+		0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+	},
+	.values	= {
+		0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+		0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b
+	}
+};
+
+/*
+ * AC Luminance
+ *
+ * Typical tables for AC coefficient coding from  CCITT T.81
+ * specification K.3.3.2, page 162.
+ */
+static const struct jpeg_ac_coeff_desc luma_ac_coeff = {
+	.index	= 0x10,
+	.bits	= {
+		0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
+		0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7d
+	},
+	.values	= {
+		0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12, 0x21,
+		0x31, 0x41, 0x06, 0x13, 0x51, 0x61, 0x07, 0x22, 0x71,
+		0x14, 0x32, 0x81, 0x91, 0xa1, 0x08, 0x23, 0x42, 0xb1,
+		0xc1, 0x15, 0x52, 0xd1, 0xf0, 0x24, 0x33, 0x62, 0x72,
+		0x82, 0x09, 0x0a, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x25,
+		0x26, 0x27, 0x28, 0x29, 0x2a, 0x34, 0x35, 0x36, 0x37,
+		0x38, 0x39, 0x3a, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48,
+		0x49, 0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59,
+		0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a,
+		0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0x83,
+		0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x92, 0x93,
+		0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0xa2, 0xa3,
+		0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xb2, 0xb3,
+		0xb4, 0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xc2, 0xc3,
+		0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xd2, 0xd3,
+		0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda, 0xe1, 0xe2,
+		0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea, 0xf1,
+		0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xfa
+	}
+};
+
+static const struct jpeg_record_hdr coeff_mono_hdr = {
+	.marker = { 0xff, 0xc4 },
+	.length = { 0x00, 0xd2 },
+};
+
+static const struct jpeg_record_hdr coeff_color_hdr = {
+	.marker	= { 0xff, 0xc4 },
+	.length	= { 0x01, 0xa2 },
+};
+
+/* DC Chrominance */
+static const struct jpeg_dc_coeff_desc chroma_dc_coeff = {
+	.index	= 1,
+	.bits	= {
+		0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+		0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
+	},
+	.values	= {
+		0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+		0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b
+	}
+};
+
+/* AC Chrominance */
+static const struct jpeg_ac_coeff_desc chroma_ac_coeff = {
+	.index	= 0x11,
+	.bits	= {
+		0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04,
+		0x07, 0x05, 0x04, 0x04, 0x00, 0x01, 0x02, 0x77
+	},
+	.values	= {
+		0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21, 0x31,
+		0x06, 0x12, 0x41, 0x51, 0x07, 0x61, 0x71, 0x13, 0x22,
+		0x32, 0x81, 0x08, 0x14, 0x42, 0x91, 0xa1, 0xb1, 0xc1,
+		0x09, 0x23, 0x33, 0x52, 0xf0, 0x15, 0x62, 0x72, 0xd1,
+		0x0a, 0x16, 0x24, 0x34, 0xe1, 0x25, 0xf1, 0x17, 0x18,
+		0x19, 0x1a, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x35, 0x36,
+		0x37, 0x38, 0x39, 0x3a, 0x43, 0x44, 0x45, 0x46, 0x47,
+		0x48, 0x49, 0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
+		0x59, 0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69,
+		0x6a, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a,
+		0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a,
+		0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a,
+		0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa,
+		0xb2, 0xb3, 0xb4, 0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba,
+		0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca,
+		0xd2, 0xd3, 0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda,
+		0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea,
+		0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xfa
+	}
+};
+
+static const struct jpeg_record_hdr sos_mono_hdr = {
+	.marker	= { 0xff, 0xda },
+	.length	= { 0x00, 0x08 },
+};
+
+static const struct jpeg_sos_mono sos_mono_data = {
+	.components	= 1,
+	.y_id		= 1,
+	.y_tables	= 0x00,
+	.spectral	= { 0x00, 0x3f },
+	.approx		= 0x00,
+};
+
+static const struct jpeg_record_hdr sos_color_hdr = {
+	.marker	= { 0xff, 0xda },
+	.length	= { 0x00, 0x0c },
+};
+
+static const struct jpeg_sos_color sos_color_data = {
+	.components	= 3,
+	.y_id		= 1,
+	.y_tables	= 0x00,
+	.cb_id		= 2,
+	.cb_tables	= 0x11,
+	.cr_id		= 3,
+	.cr_tables	= 0x11,
+	.spectral	= { 0x00, 0x3f },
+	.approx		= 0x00,
+};
+
+static inline int jb_put_mem(struct jpeg_header_buf *b, const void *src, u32 len)
+{
+	if (len > b->size - b->pos)
+		return -ENOSPC;
+
+	memcpy(b->ptr + b->pos, src, len);
+	b->pos += len;
+
+	return 0;
+}
+
+static inline void patch_u16be(u8 *buf, u32 off, u16 v)
+{
+	buf[off]	= (v >> 8) & 0xff;
+	buf[off + 1]	=  v & 0xff;
+}
+
+int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc)
+{
+	int rc;
+	struct jpeg_header_buf b = {
+		.ptr = c->data,
+		.size = sizeof(c->data),
+		.pos = 0,
+	};
+
+	c->sof_offset	= 0;
+	c->dqt_one_offs = 0;
+	c->dqt_two_offs = 0;
+
+	rc = jb_put_mem(&b, &soi_app0, sizeof(soi_app0));
+	if (rc)
+		return rc;
+
+	if (fourcc != V4L2_PIX_FMT_GREY) {
+		rc = jb_put_mem(&b, &dqt_chroma_hdr, sizeof(dqt_chroma_hdr));
+		if (rc)
+			return rc;
+
+		/* Store the offset of the first DQT table for later use. */
+		c->dqt_one_offs = b.pos;
+		rc = jb_put_mem(&b, &dqt_luma_data, sizeof(dqt_luma_data));
+		if (rc)
+			return rc;
+
+		/* Store the offset of the second DQT table for later use. */
+		c->dqt_two_offs = b.pos;
+		rc = jb_put_mem(&b, &dqt_chroma_data, sizeof(dqt_chroma_data));
+		if (rc)
+			return rc;
+	} else {
+		rc = jb_put_mem(&b, &dqt_luma_hdr, sizeof(dqt_luma_hdr));
+		if (rc)
+			return rc;
+
+		/* Store the offset of the first DQT table for later use. */
+		c->dqt_one_offs = b.pos;
+		rc = jb_put_mem(&b, &dqt_luma_data, sizeof(dqt_luma_data));
+		if (rc)
+			return rc;
+	}
+
+	/* Store the offset of the SOF record for later use. */
+	c->sof_offset = b.pos;
+
+	if (fourcc != V4L2_PIX_FMT_GREY) {
+		rc = jb_put_mem(&b, &sof0_color_hdr, sizeof(sof0_color_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &sof0_color_data, sizeof(sof0_color_data));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &coeff_color_hdr, sizeof(coeff_color_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &luma_dc_coeff, sizeof(luma_dc_coeff));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &luma_ac_coeff, sizeof(luma_ac_coeff));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &chroma_dc_coeff, sizeof(chroma_dc_coeff));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &chroma_ac_coeff, sizeof(chroma_ac_coeff));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &sos_color_hdr, sizeof(sos_color_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &sos_color_data, sizeof(sos_color_data));
+		if (rc)
+			return rc;
+	} else {
+		rc = jb_put_mem(&b, &sof0_mono_hdr, sizeof(sof0_mono_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &sof0_mono_data, sizeof(sof0_mono_data));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &coeff_mono_hdr, sizeof(coeff_mono_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &luma_dc_coeff, sizeof(luma_dc_coeff));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &luma_ac_coeff, sizeof(luma_ac_coeff));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &sos_mono_hdr, sizeof(sos_mono_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&b, &sos_mono_data, sizeof(sos_mono_data));
+		if (rc)
+			return rc;
+	}
+
+	c->size = b.pos;
+
+	return 0;
+}
+
+void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst)
+{
+	/* Propagate DQT tables into the JPEG header */
+	if (c->dqt_one_offs) {
+		u32 one_offs = c->dqt_one_offs + sizeof(dqt_luma_data.index);
+
+		memcpy(dst + one_offs, &c->data[one_offs], sizeof(dqt_luma_data.value));
+	}
+
+	if (c->dqt_two_offs) {
+		u32 two_offs = c->dqt_two_offs + sizeof(dqt_chroma_data.index);
+
+		memcpy(dst + two_offs, &c->data[two_offs], sizeof(dqt_chroma_data.value));
+	}
+}
+
+u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u32 dst_size, u16 width,
+			  u16 height)
+{
+	/* Copy JFIF into JPEG header and update actual image size */
+	if (dst_size < c->size)
+		return 0;
+
+	memcpy(dst, c->data, c->size);
+
+	/* Update output image size */
+	patch_u16be(dst, c->sof_offset + JFIF_HEADER_WIDTH_OFFS, width);
+	patch_u16be(dst, c->sof_offset + JFIF_HEADER_HEIGHT_OFFS, height);
+
+	return c->size;
+}
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
new file mode 100644
index 000000000000..0c5fcc69e7cd
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_HDR_H
+#define QCOM_JENC_HDR_H
+
+#include <linux/types.h>
+
+#include "qcom_jenc_defs.h"
+
+#define JPEG_QDT_LENGTH	64
+#define JPEG_HEADER_MAX	1024
+
+struct qcom_jenc_header {
+	u8  data[JPEG_HEADER_MAX];
+	u32 size;
+	u32 sof_offset;
+	u32 dqt_one_offs;
+	u32 dqt_two_offs;
+};
+
+struct jpeg_record_hdr {
+	u8 marker[2];
+	u8 length[2];
+} __packed;
+
+struct jpeg_dqt_header {
+	u8 index;
+	u8 value[JPEG_QDT_LENGTH];
+} __packed;
+
+struct jpeg_soi_app0 {
+	u8 soi[2];
+	u8 app0_marker[2];
+	u8 app0_length[2];
+	u8 jfif_id[5];
+	u8 version[2];
+	u8 units;
+	u8 density_x[2];
+	u8 density_y[2];
+	u8 thumb_x;
+	u8 thumb_y;
+} __packed;
+
+struct jpeg_sof0_mono {
+	u8 precision;
+	u8 height[2];
+	u8 width[2];
+	u8 components;
+
+	u8 y_id;
+	u8 y_sampling;
+	u8 y_qtable;
+} __packed;
+
+struct jpeg_sof0_color {
+	u8 precision;
+	u8 height[2];
+	u8 width[2];
+	u8 components;
+
+	u8 y_id;
+	u8 y_sampling;
+	u8 y_qtable;
+
+	u8 cb_id;
+	u8 cb_sampling;
+	u8 cb_qtable;
+
+	u8 cr_id;
+	u8 cr_sampling;
+	u8 cr_qtable;
+} __packed;
+
+struct jpeg_dc_coeff_desc {
+	u8 index;
+	u8 bits[16];
+	u8 values[12];
+} __packed;
+
+struct jpeg_ac_coeff_desc {
+	u8 index;
+	u8 bits[16];
+	u8 values[162];
+} __packed;
+
+struct jpeg_sos_hdr {
+	u8 sos_marker[2];
+	u8 sos_length[2];
+	u8 components;
+} __packed;
+
+struct jpeg_sos_mono {
+	u8 components;
+
+	u8 y_id;
+	u8 y_tables;
+
+	u8 spectral[2];
+	u8 approx;
+} __packed;
+
+struct jpeg_sos_color {
+	u8 components;
+
+	u8 y_id;
+	u8 y_tables;
+
+	u8 cb_id;
+	u8 cb_tables;
+
+	u8 cr_id;
+	u8 cr_tables;
+
+	u8 spectral[2];
+	u8 approx;
+} __packed;
+
+struct jenc_context;
+
+int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc);
+
+void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst);
+
+u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u32 dst_size, u16 width,
+			  u16 height);
+
+#endif /* QCOM_JENC_HDR_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
new file mode 100644
index 000000000000..92e3c09df3d1
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
@@ -0,0 +1,1522 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <asm/div64.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_ops.h"
+#include "qcom_jenc_defs.h"
+
+#define JPEG_RESET_TIMEOUT_MS	300
+#define JPEG_STOP_TIMEOUT_MS	200
+
+#define JPEG_DQT_SHIFT		20
+#define JPEG_Q5_21_SHIFT	21
+
+#define JPEG_MCU_BLOCK_8	8
+#define JPEG_MCU_BLOCK_16	16
+#define JPEG_MCU_BLOCK_128	128
+#define JPEG_MCU_BLOCK_256	256
+
+#define JPEG_DEFAULT_SCALE_STEP	0x200000
+
+#define JPEG_U32_CLR	(0U)
+#define JPEG_U32_SET	(~0U)
+
+/*
+ *  JPEG | V4L2
+ *  ---- | -------
+ *  H1V1 | GREY
+ *  H1V2 | YUV422M
+ *  H2V1 | NV16M
+ *  H2V2 | NV12M
+ */
+enum qcom_jpeg_encode_fmt {
+	JPEG_ENCODE_H1V1 = 0,
+	JPEG_ENCODE_H1V2,
+	JPEG_ENCODE_H2V1,
+	JPEG_ENCODE_H2V2,
+	JPEG_ENCODE_MONO,
+};
+
+enum qcom_jpeg_memory_fmt {
+	JPEG_MEM_FMT_PLANAR	 = 0x0,
+	JPEG_MEM_FMT_PPLANAR	 = 0x1,
+	JPEG_MEM_FMT_MONO	 = 0x2,
+	JPEG_MEM_FMT_COEFFICIENT = 0x3
+};
+
+enum jpeg_mal_bounds {
+	JPEG_CFG_MAL_BOUND_32_BYTES	= 0x0,
+	JPEG_CFG_MAL_BOUND_64_BYTES	= 0x1,
+	JPEG_CFG_MAL_BOUND_128_BYTES	= 0x2,
+	JPEG_CFG_MAL_BOUND_256_BYTES	= 0x3,
+	JPEG_CFG_MAL_BOUND_512_BYTES	= 0x4,
+	JPEG_CFG_MAL_BOUND_1K_BYTES	= 0x5,
+	JPEG_CFG_MAL_BOUND_2K_BYTES	= 0x6,
+	JPEG_CFG_MAL_BOUND_4K_BYTES	= 0x7
+};
+
+struct qcom_jpeg_scale_blocks {
+	u8 w_block[QCOM_JPEG_MAX_PLANES];
+	u8 h_block[QCOM_JPEG_MAX_PLANES];
+};
+
+struct qcom_jpeg_mal_boundary {
+	u32 bytes;
+	int boundary;
+};
+
+struct qcom_jpeg_formats {
+	u32 fourcc;
+	enum qcom_jpeg_encode_fmt encode;
+	enum qcom_jpeg_memory_fmt memory;
+};
+
+/*
+ * Luminance quantization table defined by CCITT T.81.
+ * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+static const u8 t81k1_dct_luma_table[JPEG_QDT_LENGTH] = {
+	16,  11,  10,  16,  24,  40,  51,  61,
+	12,  12,  14,  19,  26,  58,  60,  55,
+	14,  13,  16,  24,  40,  57,  69,  56,
+	14,  17,  22,  29,  51,  87,  80,  62,
+	18,  22,  37,  56,  68, 109, 103,  77,
+	24,  35,  55,  64,  81, 104, 113,  92,
+	49,  64,  78,  87, 103, 121, 120, 101,
+	72,  92,  95,  98, 112, 100, 103,  99
+};
+
+/*
+ * Chrominance quantization table defined by CCITT T.81.
+ * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+static const u8 t81k2_dct_chroma_table[JPEG_QDT_LENGTH] = {
+	17,  18,  24,  47,  99,  99,  99,  99,
+	18,  21,  26,  66,  99,  99,  99,  99,
+	24,  26,  56,  99,  99,  99,  99,  99,
+	47,  66,  99,  99,  99,  99,  99,  99,
+	99,  99,  99,  99,  99,  99,  99,  99,
+	99,  99,  99,  99,  99,  99,  99,  99,
+	99,  99,  99,  99,  99,  99,  99,  99,
+	99,  99,  99,  99,  99,  99,  99,  99
+};
+
+/*
+ * Zig-zag scan order for quantized DCT coefficients
+ * as defined by CCITT T.81.
+ * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+static const u8 t81a6_dct_zig_zag_table[] = {
+	 0,  1,  5,  6, 14, 15, 27, 28,
+	 2,  4,  7, 13, 16, 26, 29, 42,
+	 3,  8, 12, 17, 25, 30, 41, 43,
+	 9, 11, 18, 24, 31, 40, 44, 53,
+	10, 19, 23, 32, 39, 45, 52, 54,
+	20, 22, 33, 38, 46, 51, 55, 60,
+	21, 34, 37, 47, 50, 56, 59, 61,
+	35, 36, 48, 49, 57, 58, 62, 63
+};
+
+static const u8 jpeg_mcu_per_ratio[] = {
+	0, /* MCU = 1, Ratio < 2x	 */
+	3, /* MCU = 0, 2x <= Ratio < 4x	 */
+	2, /* MCU = 0, 4x <= Ratio < 8x	 */
+	1, /* MCU = 0, 8x <= Ratio < 16x */
+	0, /* MCU = 0, Ratio > 16x	 */
+};
+
+static const struct qcom_jpeg_formats jpeg_encode_fmt[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.encode = JPEG_ENCODE_MONO,
+		.memory = JPEG_MEM_FMT_MONO
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_JPEG,
+		.encode = JPEG_ENCODE_H1V1,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUV422M,
+		.encode = JPEG_ENCODE_H1V2,
+		.memory = JPEG_MEM_FMT_PLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVU422M,
+		.encode = JPEG_ENCODE_H1V2,
+		.memory = JPEG_MEM_FMT_PLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16M,
+		.encode = JPEG_ENCODE_H2V1,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61M,
+		.encode = JPEG_ENCODE_H2V1,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.encode = JPEG_ENCODE_H2V2,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.encode = JPEG_ENCODE_H2V2,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	}
+};
+
+static const struct qcom_jpeg_mal_boundary jpeg_mal_bounds[] = {
+	{ .bytes =   32, .boundary = JPEG_CFG_MAL_BOUND_32_BYTES  },
+	{ .bytes =   64, .boundary = JPEG_CFG_MAL_BOUND_64_BYTES  },
+	{ .bytes =  128, .boundary = JPEG_CFG_MAL_BOUND_128_BYTES },
+	{ .bytes =  256, .boundary = JPEG_CFG_MAL_BOUND_256_BYTES },
+	{ .bytes =  512, .boundary = JPEG_CFG_MAL_BOUND_512_BYTES },
+	{ .bytes = 1024, .boundary = JPEG_CFG_MAL_BOUND_1K_BYTES  },
+	{ .bytes = 4096, .boundary = JPEG_CFG_MAL_BOUND_4K_BYTES  }
+};
+
+static const struct qcom_jpeg_scale_blocks jpeg_mcu_blocks[] = {
+	[JPEG_ENCODE_H1V1] = {
+		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_H1V2] = {
+		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
+		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_H2V1] = {
+		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
+	},
+	[JPEG_ENCODE_H2V2] = {
+		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_MONO] = {
+		.w_block = { JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8 }
+	},
+};
+
+static inline int jpeg_get_memory_fmt(u32 fourcc)
+{
+	u32 fi;
+
+	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
+		if (jpeg_encode_fmt[fi].fourcc == fourcc)
+			return jpeg_encode_fmt[fi].memory;
+	}
+
+	return -EINVAL;
+}
+
+static inline int jpeg_get_encode_fmt(u32 fourcc)
+{
+	u32 fi;
+
+	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
+		if (jpeg_encode_fmt[fi].fourcc == fourcc)
+			return jpeg_encode_fmt[fi].encode;
+	}
+
+	return -EINVAL;
+}
+
+static inline int jpeg_get_mal_boundary(u32 width, const struct qcom_jpeg_mal_boundary *table,
+					u32 count)
+{
+	u32 bi;
+
+	if (!table || !count)
+		return -EINVAL;
+
+	for (bi = 0; bi < count; bi++) {
+		if (table[bi].bytes > width)
+			break;
+	}
+
+	if (!bi)
+		return table[0].boundary;
+
+	return table[bi - 1].boundary;
+}
+
+static inline u8 jpeg_get_mcu_per_block(u32 src_size, u32 dst_size)
+{
+	u8 h_rto;
+
+	if (!src_size || !dst_size)
+		return 0;
+
+	/* Calculate scale factor */
+	h_rto = max(src_size, dst_size) / min(src_size, dst_size);
+
+	if (h_rto >= 0 && h_rto < 2)
+		return jpeg_mcu_per_ratio[0];
+	else if (h_rto >= 2 && h_rto < 4)
+		return jpeg_mcu_per_ratio[1];
+	else if (h_rto >= 4 && h_rto < 8)
+		return jpeg_mcu_per_ratio[2];
+	else if (h_rto >= 8 && h_rto < 16)
+		return jpeg_mcu_per_ratio[3];
+
+	return jpeg_mcu_per_ratio[4];
+}
+
+static inline int jpeg_get_mcu_geometry(enum qcom_jpeg_encode_fmt fmt, u32 width, u32 height,
+					u32 *blk_w, u32 *blk_h, u32 *mcu_cols, u32 *mcu_rows)
+{
+	const struct qcom_jpeg_scale_blocks *blks;
+	u32 bw = 0, bh = 0;
+	u8 pln;
+
+	if (!width || !height)
+		return -EINVAL;
+
+	blks = &jpeg_mcu_blocks[fmt];
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		bw = max(bw, blks->w_block[pln]);
+		bh = max(bh, blks->h_block[pln]);
+	}
+
+	if (!bw || !bh)
+		return -EINVAL;
+
+	if (blk_w)
+		*blk_w = bw;
+	if (blk_h)
+		*blk_h = bh;
+
+	if (mcu_cols)
+		*mcu_cols = ALIGN(width, bw) / bw;
+
+	if (mcu_rows)
+		*mcu_rows = ALIGN(height, bh) / bh;
+
+	return 0;
+}
+
+/* Integer part of scale */
+static inline s32 jpeg_calc_scale_int(u32 in_width, u32 out_width)
+{
+	if (!out_width)
+		return 0;
+
+	return (s32)(in_width / out_width);
+}
+
+/* Fractional part od scale */
+static inline u32 jpeg_calc_scale_frac(u32 in_width, u32 out_width)
+{
+	u32 remainder = in_width % out_width;
+
+	if (!out_width)
+		return 0;
+
+	/* 64-bit to avoid overflow during shift */
+	return (u32)(((u64)remainder << JPEG_Q5_21_SHIFT) / out_width);
+}
+
+static inline s32 jpeg_calc_q5_21(s32 int_part, u32 frac_part)
+{
+	return ((s32)((u32)int_part << JPEG_Q5_21_SHIFT)) | (frac_part & ((1u << 21) - 1));
+}
+
+static inline u32 jpeg_io_read(struct qcom_jenc_dev *jenc, u32 offset)
+{
+	u32 data;
+
+	rmb();	/* Preventing concurrency read/write interference */
+	data = readl_relaxed(jenc->jpeg_base + offset);
+
+	return data;
+}
+
+static inline void jpeg_io_write(struct qcom_jenc_dev *jenc, u32 offset, u32 value)
+{
+	wmb();	/* Preventing concurrency read/write interference */
+	writel_relaxed(value, jenc->jpeg_base + offset);
+}
+
+/*
+ * Runtime bitfield helpers (for non-constant masks).
+ *
+ * Requirements:
+ *  - mask must be non-zero
+ *  - mask must be contiguous (e.g. 0x7u << n)
+ */
+
+static inline u32 jpeg_bits_get(u32 mask, u32 reg)
+{
+	return (reg & mask) >> __builtin_ctz(mask);
+}
+
+static inline u32 jpeg_bits_set(u32 mask, u32 val)
+{
+	return (val << __builtin_ctz(mask)) & mask;
+}
+
+static inline u32 jpeg_rd_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid)
+{
+	u32 reg  = jpeg_io_read(jenc, offs);
+	u32 mask = jenc->res->hw_mask[mid];
+
+	return jpeg_bits_get(mask, reg);
+}
+
+/*
+ * Read-modify-write (for R/W registers)
+ */
+static inline void jpeg_rw_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid,
+				u32 val)
+{
+	u32 reg  = jpeg_io_read(jenc, offs);
+	u32 mask = jenc->res->hw_mask[mid];
+
+	reg &= ~mask;
+	reg |= jpeg_bits_set(mask, val);
+
+	jpeg_io_write(jenc, offs, reg);
+}
+
+/*
+ * Write-only variant (for write only registers)
+ */
+static inline void jpeg_wo_bits(struct qcom_jenc_dev *jenc, u32 offs, enum qcom_jpeg_mask_id mid,
+				u32 val)
+{
+	u32 mask = jenc->res->hw_mask[mid];
+
+	jpeg_io_write(jenc, offs, jpeg_bits_set(mask, val));
+}
+
+static u8 jpeg_calculate_dqt(struct jenc_context *ectx, u8 dqt_value)
+{
+	u64 ratio;
+	u8 calc_val;
+
+	ratio = (QCOM_JPEG_QUALITY_MAX - ectx->quality_requested) << JPEG_DQT_SHIFT;
+	ratio = max_t(u64, 1, ratio);
+	do_div(ratio, QCOM_JPEG_QUALITY_MID);
+
+	calc_val = DIV64_U64_ROUND_CLOSEST(ratio * dqt_value, 1LU << JPEG_DQT_SHIFT);
+
+	return max_t(u8, 1, calc_val);
+}
+
+static void jpeg_apply_dmi_table(struct jenc_context *ectx)
+{
+	const struct qcom_jpeg_reg_offs *offs = ectx->jenc->res->hw_offs;
+	u32 pcfg = { 0x00000011 };
+	u32 addr = { 0x00000000 };
+	u8 *base;
+	u8 dqt_val, idx;
+	u32 reg_val;
+	int i;
+
+	/* DMI upload start sequence */
+	jpeg_io_write(ectx->jenc, offs->dmi_addr, addr);
+	jpeg_io_write(ectx->jenc, offs->dmi_cfg, pcfg);
+
+	/* DMI Luma upload */
+	base = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_one_offs + 1];
+	for (i = 0; i < ARRAY_SIZE(t81k1_dct_luma_table); i++) {
+		dqt_val = jpeg_calculate_dqt(ectx, t81k1_dct_luma_table[i]);
+		/*
+		 * Store the luma to be propagated to the JPEG header at a later stage.
+		 * If offs == 0, no DQT is present in the header and the write
+		 * should be skipped.
+		 */
+		if (ectx->hdr_cache.dqt_one_offs) {
+			idx = t81a6_dct_zig_zag_table[i];
+			/* Perform reordering to arrange transformed DQT in a zigzag pattern */
+			base[idx] = dqt_val;
+		}
+		/* The calculated DQT value cannot be less than 1 */
+		reg_val = div_u64(U16_MAX + 1U, dqt_val);
+		jpeg_io_write(ectx->jenc, offs->dmi_data, clamp_t(u32, reg_val, 0, U16_MAX));
+	}
+
+	/* DMI Chroma upload */
+	base = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_two_offs + 1];
+	for (i = 0; i < ARRAY_SIZE(t81k2_dct_chroma_table); i++) {
+		dqt_val = jpeg_calculate_dqt(ectx, t81k2_dct_chroma_table[i]);
+		/*
+		 * Store the chroma to be propagated to the JPEG header at a later stage.
+		 * If offs == 0, no DQT is present in the header and the write
+		 * should be skipped.
+		 */
+		if (ectx->hdr_cache.dqt_two_offs) {
+			idx = t81a6_dct_zig_zag_table[i];
+			/* Perform reordering to arrange transformed DQT in a zigzag pattern */
+			base[idx] = dqt_val;
+		}
+		/* The calculated DQT value cannot be less than 1 */
+		reg_val = div_u64(U16_MAX + 1U, dqt_val);
+		jpeg_io_write(ectx->jenc, offs->dmi_data, clamp_t(u32, reg_val, 0, U16_MAX));
+	}
+
+	/* DMI upload end sequence */
+	jpeg_io_write(ectx->jenc, offs->dmi_cfg, addr);
+
+	ectx->quality_programmed = ectx->quality_requested;
+
+	dev_dbg(ectx->dev, "%s: ctx=%p quality_programmed=%d\n", __func__, ectx,
+		ectx->quality_programmed);
+}
+
+static void jpeg_cpu_access(struct device *dev, struct qcom_jpeg_buff *frame,
+			    enum dma_data_direction direction)
+{
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		struct sg_table	*sgt = frame->plns[pln].sgt;
+
+		if (!frame->plns[pln].dma || !sgt)
+			break;
+
+		dma_sync_sg_for_cpu(dev, sgt->sgl, sgt->orig_nents, direction);
+	}
+}
+
+static void jpeg_dev_access(struct device *dev, struct qcom_jpeg_buff *frame,
+			    enum dma_data_direction direction)
+{
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		struct sg_table	*sgt = frame->plns[pln].sgt;
+
+		if (!frame->plns[pln].dma || !sgt)
+			continue;
+
+		dma_sync_sg_for_device(dev, sgt->sgl, sgt->orig_nents, direction);
+	}
+}
+
+static int jpeg_init(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_jpeg_reg_offs *offs;
+	void __iomem *mem_base;
+	unsigned long rtime;
+	u32 hw_ver;
+
+	if (!jenc || !jenc->dev || !jenc->jpeg_base || !jenc->res->hw_offs) {
+		pr_err("encoder HW init failed\n");
+		return -EINVAL;
+	}
+
+	offs	 = jenc->res->hw_offs;
+	mem_base = jenc->jpeg_base;
+
+	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
+	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_RESET_ACK, JPEG_U32_SET);
+
+	reinit_completion(&jenc->reset_complete);
+
+	jpeg_wo_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_COMMON, JPEG_U32_SET);
+
+	rtime = wait_for_completion_timeout(&jenc->reset_complete,
+					    msecs_to_jiffies(JPEG_RESET_TIMEOUT_MS));
+	if (!rtime) {
+		dev_err(jenc->dev, "encoder HW reset timeout\n");
+		disable_irq(jenc->irq);
+		return -ETIME;
+	}
+
+	hw_ver = jpeg_io_read(jenc, offs->hw_version);
+	dev_info(jenc->dev, "JPEG HW encoder version %d.%d.%d\n",
+		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_MAJOR], hw_ver),
+		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_MINOR], hw_ver),
+		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_STEP], hw_ver));
+
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32_SET);
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32_CLR);
+
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32_SET);
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32_CLR);
+
+	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
+	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_ENABLE_ALL, JPEG_U32_SET);
+
+	return 0;
+}
+
+static int jpeg_exec(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 1);
+
+	return 0;
+}
+
+static void jpeg_stop(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 0);
+
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32_SET);
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32_CLR);
+
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32_SET);
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32_CLR);
+
+	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
+	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_ENABLE_ALL, JPEG_U32_SET);
+}
+
+static int jpeg_deinit(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	unsigned long rtime;
+
+	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
+	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_STOP_ACK, JPEG_U32_SET);
+
+	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_STOP, 1);
+
+	reinit_completion(&jenc->stop_complete);
+	rtime = wait_for_completion_timeout(&jenc->stop_complete,
+					    msecs_to_jiffies(JPEG_STOP_TIMEOUT_MS));
+	if (!rtime) {
+		dev_err(jenc->dev, "encoder HW stop timeout\n");
+		return -ETIME;
+	}
+
+	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_DISABLE_ALL, JPEG_U32_CLR);
+	jpeg_rw_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
+
+	return 0;
+}
+
+static int jpeg_apply_fe_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
+			      struct vb2_buffer *vb)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
+	struct v4l2_pix_format_mplane *fmt = &q->vf;
+	u8 pln = 0;
+
+	if (WARN_ON_ONCE(!frame->plns[pln].dma))
+		return -EPERM;
+
+	for (pln = 0; pln < fmt->num_planes; pln++) {
+		if (!frame->plns[pln].sgt || !frame->plns[pln].sgt->sgl)
+			break;
+
+		jpeg_io_write(jenc, offs->fe.pntr[pln], frame->plns[pln].dma);
+		jpeg_io_write(jenc, offs->fe.offs[pln], 0);
+
+		dev_dbg(jenc->dev, "%s: pln=%d addr=0x%llx idx:%d\n", __func__,
+			pln, frame->plns[pln].dma, vb->index);
+	}
+
+	q->buff_id = vb->index;
+
+	jpeg_dev_access(jenc->dev, frame, DMA_TO_DEVICE);
+
+	return 0;
+}
+
+static int jpeg_store_fe_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
+	struct qcom_jpeg_buff *buff = &q->buff[vb2->index];
+	u8 pln = 0;
+
+	buff->plns[pln].sgt = vb2_dma_sg_plane_desc(vb2, pln);
+	if (WARN_ON_ONCE(!buff->plns[pln].sgt))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(!buff->plns[pln].sgt->sgl))
+		return -EINVAL;
+
+	buff->plns[pln].dma = sg_dma_address(buff->plns[pln].sgt->sgl);
+	if (WARN_ON_ONCE(!buff->plns[pln].dma))
+		return -EINVAL;
+
+	buff->plns[pln].size = vb2_plane_size(vb2, pln);
+	if (WARN_ON_ONCE(!buff->plns[pln].size))
+		return -EINVAL;
+
+	for (pln = 1; pln < q->vf.num_planes; pln++) {
+		buff->plns[pln].sgt = vb2_dma_sg_plane_desc(vb2, pln);
+		if (WARN_ON_ONCE(!buff->plns[pln].sgt || !buff->plns[pln].sgt->sgl))
+			return -EINVAL;
+
+		buff->plns[pln].dma = sg_dma_address(buff->plns[pln].sgt->sgl);
+		if (WARN_ON_ONCE(!buff->plns[pln].dma))
+			return -EINVAL;
+
+		buff->plns[pln].size = vb2_plane_size(vb2, pln);
+		if (WARN_ON_ONCE(!buff->plns[pln].size))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int jpeg_setup_fe_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	struct v4l2_pix_format_mplane *sfmt = &q->vf;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH, 0);
+		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT, 0);
+		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_STRIDE, 0);
+	}
+
+	for (pln = 0; pln < sfmt->num_planes; pln++) {
+		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH,
+			     sfmt->width  - 1);
+		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT,
+			     sfmt->height  - 1);
+		jpeg_rw_bits(jenc, offs->fe.stride[pln], JMSK_PLNS_RD_STRIDE,
+			     sfmt->plane_fmt[pln].bytesperline);
+
+		dev_dbg(ectx->dev, "%s: ctx=%p pln=%d width=%d height=%d stride=%d\n",
+			__func__, ectx, pln,
+			jpeg_rd_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH),
+			jpeg_rd_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT),
+			jpeg_rd_bits(jenc, offs->fe.stride[pln], JMSK_PLNS_RD_STRIDE));
+	}
+
+	return 0;
+}
+
+static int jpeg_setup_fe_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	struct v4l2_pix_format_mplane *sfmt = &q->vf;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	u8 pln;
+
+	if (!sfmt->width) {
+		dev_err(ectx->dev, "%s: invalid source width=%d\n", __func__, sfmt->width);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_io_write(jenc, offs->fe.hinit[pln], 0);
+
+	return 0;
+}
+
+static int jpeg_setup_fe_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	struct v4l2_pix_format_mplane *sfmt = &q->vf;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	u8 pln;
+
+	if (!sfmt->height) {
+		dev_err(ectx->dev, "%s: invalid source height=%d\n", __func__, sfmt->height);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_io_write(jenc, offs->fe.vinit[pln], 0);
+
+	return 0;
+}
+
+static int jpeg_setup_fe_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	struct v4l2_pix_format_mplane *sfmt = &q->vf;
+	struct v4l2_pix_format_mplane *dfmt = &ectx->bufq[JENC_DST_QUEUE].vf;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	u8 expected_planes, pln;
+	int rval;
+
+	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_EN, 1);
+	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_BOTTOM_VPAD_EN, 1);
+
+	rval = jpeg_get_memory_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: invalid memory format for v4l2 format:0x%x\n",
+			__func__, sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	switch (rval) {
+	case JPEG_MEM_FMT_MONO:
+		expected_planes = 1;
+		break;
+	case JPEG_MEM_FMT_PPLANAR:
+		expected_planes = 2;
+		break;
+	case JPEG_MEM_FMT_PLANAR:
+		expected_planes = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (sfmt->num_planes != expected_planes) {
+		dev_err(ectx->dev, "%s: plane mismatch fmt=%u expected=%u got=%u\n",
+			__func__, rval, expected_planes, sfmt->num_planes);
+		return -EINVAL;
+	}
+
+	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MEMORY_FORMAT, rval);
+
+	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN0_EN, 0);
+	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN1_EN, 0);
+	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN2_EN, 0);
+
+	if (sfmt->width == dfmt->width && sfmt->height == dfmt->height) {
+		/* No scaling */
+		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN, 1);
+		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK, 0);
+	} else {
+		u8 mcu_per_blks;
+
+		/* Scaling */
+		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN, 0);
+		/* get value according to image width */
+		mcu_per_blks = jpeg_get_mcu_per_block(sfmt->width, dfmt->width);
+		/* get value according to image height assign the bigger */
+		mcu_per_blks = max_t(u8, mcu_per_blks,
+				     jpeg_get_mcu_per_block(sfmt->height, dfmt->height));
+
+		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK, mcu_per_blks);
+	}
+
+	dev_dbg(ectx->dev, "%s: sixteen MCU enabled=%d, %d MCU per blocks\n", __func__,
+		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN),
+		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK));
+
+	rval = jpeg_get_mal_boundary(sfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: failed to get FE mal boundary width=%u\n", __func__,
+			sfmt->width);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_BOUNDARY, rval);
+
+	dev_dbg(ectx->dev, "%s: optimal FE mal boundary=%d\n", __func__,
+		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_BOUNDARY));
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n",
+			__func__, sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	switch (rval) {
+	case JPEG_ENCODE_MONO:
+	case JPEG_ENCODE_H1V1:
+	case JPEG_ENCODE_H2V1:
+		jpeg_rw_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW,
+			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_8));
+		break;
+	case JPEG_ENCODE_H1V2:
+	case JPEG_ENCODE_H2V2:
+		jpeg_rw_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW,
+			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_16));
+		break;
+	default:
+		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n", __func__, rval);
+		return -EINVAL;
+	}
+
+	if (sfmt->pixelformat == V4L2_PIX_FMT_NV21 || sfmt->pixelformat == V4L2_PIX_FMT_NV61)
+		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_CBCR_ORDER, 1);
+	else
+		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_CBCR_ORDER, 0);
+
+	for (pln = 0; pln < sfmt->num_planes; pln++) {
+		if (sfmt->width && sfmt->height) {
+			switch (pln) {
+			case 0:
+				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN0_EN, 1);
+				break;
+			case 1:
+				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN1_EN, 1);
+				break;
+			case 2:
+				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN2_EN, 1);
+				break;
+			}
+		}
+	}
+
+	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_FE_ENABLE, 1);
+
+	return 0;
+}
+
+static int jpeg_setup_fe(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	int rc;
+
+	rc = jpeg_setup_fe_size(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_fe_hinit(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_fe_vinit(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_fe_params(ectx, q);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
+			      struct vb2_buffer *vb)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
+	u8 pln = 0;
+
+	if (WARN_ON_ONCE(!frame->plns[pln].dma))
+		return -EPERM;
+
+	jpeg_io_write(jenc, offs->we.pntr[pln], frame->plns[pln].dma);
+
+	dev_dbg(jenc->dev, "%s: pln=%d addr=0x%llx idx:%d\n", __func__,
+		pln, frame->plns[pln].dma, vb->index);
+
+	q->buff_id = vb->index;
+
+	return 0;
+}
+
+static int jpeg_store_we_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
+	struct qcom_jpeg_buff *frame = &q->buff[vb2->index];
+	struct qc_jfif *mptr;
+	struct sg_table *sgt;
+	dma_addr_t dma;
+
+	sgt = vb2_dma_sg_plane_desc(vb2, 0);
+	if (WARN_ON_ONCE(!sgt || !sgt->sgl))
+		return -EINVAL;
+
+	dma = sg_dma_address(sgt->sgl);
+	if (WARN_ON_ONCE(!dma))
+		return -EINVAL;
+
+	mptr = vb2_plane_vaddr(vb2, 0);
+	if (WARN_ON_ONCE(!mptr))
+		return -EINVAL;
+
+	mutex_lock(&ectx->quality_mutex);
+	if (ectx->quality_programmed != ectx->quality_requested)
+		jpeg_apply_dmi_table(ectx);
+	mutex_unlock(&ectx->quality_mutex);
+
+	dma += qcom_jenc_header_emit(&ectx->hdr_cache, (void *)mptr,
+				     min_t(size_t, vb2->planes[0].length, ectx->hdr_cache.size),
+				     q->vf.width, q->vf.height);
+	qcom_jenc_dqts_emit(&ectx->hdr_cache, (void *)mptr);
+
+	frame->plns[0].sgt	= sgt;
+	frame->plns[0].dma	= dma;
+	frame->plns[0].size	= vb2_plane_size(vb2, 0);
+
+	jpeg_dev_access(jenc->dev, frame, DMA_TO_DEVICE);
+
+	return 0;
+}
+
+static int jpeg_setup_we_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	u8 pln;
+
+	if (!dfmt->plane_fmt[0].sizeimage) {
+		dev_err(ectx->dev, "%s: invalid destination buffer size=0\n", __func__);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_rw_bits(jenc, offs->we.stride[pln], JMSK_PLNS_WR_STRIDE, 0);
+
+	jpeg_io_write(jenc, offs->we.bsize[0], dfmt->plane_fmt[0].sizeimage);
+
+	dev_dbg(ectx->dev, "%s: ctx=%p size=%u\n", __func__,
+		ectx, dfmt->plane_fmt[0].sizeimage);
+
+	return 0;
+}
+
+static int jpeg_setup_we_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	u8 pln;
+
+	if (!dfmt->width) {
+		dev_err(ectx->dev, "%s: invalid destination width=%d\n", __func__, dfmt->width);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, offs->we.hinit[pln], JMSK_PLNS_WR_HINIT, 0);
+		jpeg_rw_bits(jenc, offs->we.hstep[pln], JMSK_PLNS_WR_HSTEP, 0);
+	}
+
+	jpeg_rw_bits(jenc, offs->we.hstep[0], JMSK_PLNS_WR_HSTEP, dfmt->width);
+
+	dev_dbg(ectx->dev, "%s: ctx=%p hstep=%u\n", __func__, ectx,
+		jpeg_rd_bits(jenc, offs->we.hstep[0], JMSK_PLNS_WR_HSTEP));
+
+	return 0;
+}
+
+static int jpeg_setup_we_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	u8 pln;
+
+	if (!dfmt->height) {
+		dev_err(ectx->dev, "%s: invalid destination height=%d\n", __func__, dfmt->height);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, offs->we.vinit[pln], JMSK_PLNS_WR_VINIT, 0);
+		jpeg_rw_bits(jenc, offs->we.vstep[pln], JMSK_PLNS_WR_VSTEP, 0);
+	}
+
+	jpeg_rw_bits(jenc, offs->we.vstep[0], JMSK_PLNS_WR_VSTEP, dfmt->height);
+
+	dev_dbg(ectx->dev, "%s: ctx=%p vstep=%u\n", __func__, ectx,
+		jpeg_rd_bits(jenc, offs->we.vstep[0], JMSK_PLNS_WR_VSTEP));
+
+	return 0;
+}
+
+static int jpeg_setup_we_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	u32 blk_w, blk_h, mcu_cols, mcu_rows;
+	int rval;
+
+	rval = jpeg_get_memory_fmt(dfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: invalid memory format for v4l2 format:0x%x\n",
+			__func__, dfmt->pixelformat);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MEMORY_FORMAT, rval);
+
+	rval = jpeg_get_mal_boundary(dfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: failed to get WE mal boundary width=%u\n",
+			__func__, dfmt->width);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_BOUNDARY, rval);
+
+	dev_dbg(ectx->dev, "%s: optimal WE mal boundary=%d\n", __func__,
+		jpeg_rd_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_BOUNDARY));
+
+	rval = jpeg_get_encode_fmt(dfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n",
+			__func__, dfmt->pixelformat);
+		return rval;
+	}
+
+	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
+				     &mcu_cols, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
+			__func__, mcu_cols, mcu_rows);
+		return rval;
+	}
+
+	dev_dbg(ectx->dev, "%s blk_w=%u blk_h=%u cols=%u rows=%u\n", __func__,
+		blk_w, blk_h, mcu_cols, mcu_rows);
+
+	jpeg_rw_bits(jenc, offs->we.blocks[0], JMSK_PLNS_WR_BLOCK_CFG_PER_RAW, mcu_rows - 1);
+	jpeg_rw_bits(jenc, offs->we.blocks[0], JMSK_PLNS_WR_BLOCK_CFG_PER_COL, mcu_cols - 1);
+
+	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_CBCR_ORDER, 1);
+	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_EN, 1);
+	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_POP_BUFF_ON_EOS, 1);
+	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_PLN0_EN, 1);
+
+	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_MODE, 1);
+	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_WE_ENABLE, 1);
+
+	return 0;
+}
+
+static int jpeg_setup_we(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	int rc;
+
+	rc = jpeg_setup_we_size(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_we_hinit(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_we_vinit(ectx, q);
+	if (rc)
+		return rc;
+
+	return jpeg_setup_we_params(ectx, q);
+}
+
+static int jpeg_setup_scale(struct jenc_context *ectx)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
+	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
+	struct v4l2_pix_format_mplane *dfmt = &dq->vf;
+	u32 blk_w, blk_h, mcu_cols, mcu_rows;
+	int rval;
+	u8 pln;
+
+	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_SCALE_RESET, 1);
+
+	/* explicit no scaling */
+	jpeg_rw_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE, 0);
+	jpeg_rw_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE, 0);
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_io_write(jenc, offs->scale.hstep[pln], JPEG_DEFAULT_SCALE_STEP);
+		jpeg_io_write(jenc, offs->scale.vstep[pln], JPEG_DEFAULT_SCALE_STEP);
+	}
+
+	if (jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE)) {
+		for (pln = 0; pln < sq->vf.num_planes; pln++) {
+			jpeg_rw_bits(jenc, offs->scale.hstep[pln],
+				     JMSK_SCALE_PLNS_HSTEP_INTEGER,
+				     jpeg_calc_scale_int(sfmt->width, dfmt->width));
+			jpeg_rw_bits(jenc, offs->scale.hstep[pln],
+				     JMSK_SCALE_PLNS_HSTEP_FRACTIONAL,
+				     jpeg_calc_scale_frac(sfmt->width, dfmt->width));
+
+			dev_dbg(ectx->dev, "%s: ctx=%p hint=%d hfrac=%d\n",
+				__func__, ectx,
+				jpeg_rd_bits(jenc, offs->scale.hstep[pln],
+					     JMSK_SCALE_PLNS_HSTEP_INTEGER),
+				jpeg_rd_bits(jenc, offs->scale.hstep[pln],
+					     JMSK_SCALE_PLNS_HSTEP_FRACTIONAL));
+		}
+	}
+
+	if (jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE)) {
+		for (pln = 0; pln < sq->vf.num_planes; pln++) {
+			jpeg_rw_bits(jenc, offs->scale.vstep[pln],
+				     JMSK_SCALE_PLNS_VSTEP_INTEGER,
+				     jpeg_calc_scale_int(sfmt->height, dfmt->height));
+			jpeg_rw_bits(jenc, offs->scale.vstep[pln],
+				     JMSK_SCALE_PLNS_VSTEP_FRACTIONAL,
+				     jpeg_calc_scale_frac(sfmt->height, dfmt->height));
+
+			dev_dbg(ectx->dev, "%s: ctx=%p vint=%d vfrac=%d\n",
+				__func__, ectx,
+				jpeg_rd_bits(jenc, offs->scale.vstep[pln],
+					     JMSK_SCALE_PLNS_VSTEP_INTEGER),
+				jpeg_rd_bits(jenc, offs->scale.vstep[pln],
+					     JMSK_SCALE_PLNS_VSTEP_FRACTIONAL));
+		}
+	}
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n",
+			__func__, sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
+				     &mcu_cols, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: invalid MCU geometry blk_w=%d blk_h=%d\n",
+			__func__, blk_w, blk_h);
+		return -EINVAL;
+	}
+
+	dev_dbg(ectx->dev, "%s blk_w=%u blk_h=%u cols=%u rows=%u\n", __func__, blk_w, blk_h,
+		mcu_cols, mcu_rows);
+
+	for (pln = 0; pln < sq->vf.num_planes; pln++) {
+		jpeg_rw_bits(jenc, offs->scale_out_cfg[pln],
+			     JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH, mcu_cols - 1);
+		jpeg_rw_bits(jenc, offs->scale_out_cfg[pln],
+			     JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT, mcu_rows - 1);
+	}
+
+	dev_dbg(ectx->dev, "%s: ctx=%p scale src=%ux%u dst=%ux%u enable=%d/%d\n",
+		__func__, ectx, sfmt->width, sfmt->height, dfmt->width, dfmt->height,
+		jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE),
+		jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE));
+
+	/* Disabled, but must be configured */
+	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_SCALE_ENABLE, 0);
+
+	return 0;
+}
+
+static int jpeg_setup_encode(struct jenc_context *ectx)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	u32 blk_w, blk_h, mcu_cols, mcu_rows;
+	int rval;
+
+	if (!sfmt->width || !sfmt->height)
+		return -EINVAL;
+
+	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_ENCODER_RESET, 1);
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: unsupported encode format fourcc=0x%x\n",
+			__func__, sfmt->pixelformat);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, offs->enc_cfg, JMSK_ENC_CFG_IMAGE_FORMAT, rval);
+
+	rval = jpeg_get_mcu_geometry(rval, sfmt->width, sfmt->height, &blk_w, &blk_h,
+				     &mcu_cols, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "%s: invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
+			__func__, mcu_cols, mcu_rows);
+		return -EINVAL;
+	}
+
+	dev_dbg(ectx->dev, "%s blk_w=%u blk_h=%u cols=%u rows=%u\n", __func__,
+		blk_w, blk_h, mcu_cols, mcu_rows);
+
+	jpeg_rw_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_WIDTH, mcu_cols - 1);
+	jpeg_rw_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_HEIGHT, mcu_rows - 1);
+
+	dev_dbg(ectx->dev, "%s: ctx=%p width=%d height=%d\n", __func__, ectx,
+		jpeg_rd_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_WIDTH),
+		jpeg_rd_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_HEIGHT));
+
+	jpeg_rw_bits(jenc, offs->enc_cfg, JMSK_ENC_CFG_APPLY_EOI, 1);
+	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_ENC_ENABLE, 1);
+
+	return 0;
+}
+
+static irqreturn_t op_jpeg_irq_bot(int irq, void *data)
+{
+	struct qcom_jenc_dev *jenc = data;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	u32 irq_status;
+	u32 irq_mask;
+	unsigned long flags;
+	int rc;
+
+	rc = kfifo_out_spinlocked(&jenc->kfifo_inst, &irq_status, sizeof(irq_status),
+				  &jenc->kfifo_lock);
+	if (rc != sizeof(irq_status)) {
+		dev_err(jenc->dev, "IRQ status: FIFO empty\n");
+		return IRQ_HANDLED;
+	}
+
+	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_DONE];
+	if (jpeg_bits_get(irq_mask, irq_status)) {
+		struct jenc_context *ctx = jenc->actx;
+		struct qcom_jenc_queue *dq = &ctx->bufq[JENC_DST_QUEUE];
+		size_t out_size;
+
+		spin_lock_irqsave(&jenc->hw_lock, flags);
+		jenc->actx = NULL;
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+		if (ctx && dq->buff_id >= 0) {
+			struct qcom_jpeg_buff *frame;
+			unsigned long flags;
+
+			spin_lock_irqsave(&jenc->hw_lock, flags);
+			frame = &dq->buff[dq->buff_id];
+			out_size = jpeg_io_read(jenc, offs->enc_out_size);
+			spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+			dev_dbg(jenc->dev, "complete idx:%d addr=0x%llx size=%zu\n",
+				dq->buff_id, frame->plns[0].dma, out_size);
+
+			jpeg_cpu_access(jenc->dev, frame, DMA_FROM_DEVICE);
+			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
+					    out_size + JPEG_HEADER_MAX);
+			jpeg_stop(jenc);
+		}
+	}
+
+	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_ERROR];
+	if (jpeg_bits_get(irq_mask, irq_status)) {
+		struct jenc_context *ctx = jenc->actx;
+
+		spin_lock_irqsave(&jenc->hw_lock, flags);
+		jenc->actx = NULL;
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+		dev_err(jenc->dev, "encoder hardware failure=0x%x\n",
+			jpeg_bits_get(JMSK_IRQ_STATUS_SESSION_ERROR, irq_status));
+		if (ctx)
+			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_ERROR, 0);
+
+		jpeg_stop(jenc);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t op_jpeg_irq_top(int irq, void *data)
+{
+	struct qcom_jenc_dev *jenc = data;
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	u32 irq_status;
+	u32 irq_mask;
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+
+	irq_status = jpeg_io_read(jenc, offs->int_status);
+	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, irq_status);
+
+	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_RESET_ACK];
+	if (jpeg_bits_get(irq_mask, irq_status)) {
+		complete(&jenc->reset_complete);
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	irq_mask = jenc->res->hw_mask[JMSK_IRQ_STATUS_STOP_ACK];
+	if (jpeg_bits_get(irq_mask, irq_status)) {
+		complete(&jenc->stop_complete);
+		dev_dbg(jenc->dev, "hardware stop acknowledged\n");
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	rc = kfifo_in(&jenc->kfifo_inst, &irq_status, sizeof(irq_status));
+	if (rc != sizeof(irq_status))
+		dev_err(jenc->dev, "IRQ status: FIFO full\n");
+
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static void op_jpeg_get_hw_caps(struct qcom_jenc_dev *jenc, u32 *caps)
+{
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+	u32 hw_caps;
+
+	hw_caps = jpeg_io_read(jenc, offs->hw_capability);
+	dev_dbg(jenc->dev, "CAPS: encode=%d decode=%d upscale=%d downscale=%d\n",
+		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_ENCODE], hw_caps),
+		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_DECODE], hw_caps),
+		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_UPSCALE], hw_caps),
+		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_DOWNSCALE], hw_caps));
+
+	*caps = hw_caps;
+}
+
+static struct qcom_jenc_queue *op_jpeg_get_buff_queue(struct jenc_context *ectx,
+						      enum qcom_enc_qid id)
+{
+	return &ectx->bufq[id];
+}
+
+static int op_jpeg_queue_setup(struct jenc_context *ectx, enum qcom_enc_qid id)
+{
+	int rc;
+
+	if (id == JENC_SRC_QUEUE) {
+		struct qcom_jenc_queue *q = &ectx->bufq[id];
+
+		rc = qcom_jenc_header_init(&ectx->hdr_cache, q->vf.pixelformat);
+		if (rc) {
+			dev_err(ectx->dev, "JFIF header init failed\n");
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static int op_jpeg_buffer_prepare(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	int rc;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb2->type)) {
+		rc = jpeg_store_fe_next(ectx, vb2);
+		if (rc)
+			dev_err(ectx->dev, "%s: cannot set up fetch addr\n", __func__);
+	} else {
+		rc = jpeg_store_we_next(ectx, vb2);
+		if (rc)
+			dev_err(ectx->dev, "%s: cannot set up write addr\n", __func__);
+	}
+
+	return rc;
+}
+
+static int op_jpeg_process_exec(struct qcom_jenc_dev *jenc, struct jenc_context *ectx,
+				struct vb2_buffer *vb)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	jenc->actx = ectx;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+		rc = jpeg_setup_fe(ectx, sq);
+		if (rc)
+			return rc;
+
+		jpeg_apply_fe_addr(ectx, sq, vb);
+
+	} else {
+		rc = jpeg_setup_we(ectx, dq);
+		if (rc)
+			return rc;
+
+		jpeg_apply_we_addr(ectx, dq, vb);
+	}
+
+	if (sq->sequence == dq->sequence) {
+		rc = jpeg_setup_scale(ectx);
+		if (rc)
+			return rc;
+
+		rc = jpeg_setup_encode(ectx);
+		if (rc)
+			return rc;
+
+		jpeg_exec(jenc);
+	}
+
+	return 0;
+}
+
+static int op_jpeg_prepare(struct qcom_jenc_dev *jenc)
+{
+	const struct qcom_jpeg_reg_offs *offs = jenc->res->hw_offs;
+
+	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_DECODER_RESET, 1);
+	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_BLOCK_FORMATTER_RST, 1);
+	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_CORE_RESET, 1);
+
+	return 0;
+}
+
+static int op_jpeg_acquire(struct jenc_context *ectx, struct vb2_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	struct qcom_jenc_queue *sq, *dq;
+	int rc;
+
+	if (atomic_inc_return(&jenc->ref_count) == 1) {
+		rc = pm_runtime_resume_and_get(jenc->dev);
+		if (rc < 0) {
+			dev_err(jenc->dev, "PM runtime get failed\n");
+			atomic_dec(&jenc->ref_count);
+			return rc;
+		}
+
+		rc = jpeg_init(jenc);
+		if (rc) {
+			dev_err(jenc->dev, "hardware init failed\n");
+			atomic_dec(&jenc->ref_count);
+			pm_runtime_put(jenc->dev);
+			return rc;
+		}
+
+		sq = &ectx->bufq[JENC_SRC_QUEUE];
+		sq->sequence = 0;
+		sq->buff_id   = -1;
+		dq = &ectx->bufq[JENC_DST_QUEUE];
+		dq->sequence = 0;
+		dq->buff_id   = -1;
+	}
+
+	return 0;
+}
+
+static int op_jpeg_release(struct jenc_context *ectx, struct vb2_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	int rc;
+
+	if (!atomic_dec_if_positive(&jenc->ref_count)) {
+		rc = jpeg_deinit(jenc);
+		if (rc)
+			dev_err(jenc->dev, "hardware exit failed\n");
+
+		rc =  pm_runtime_put_sync(jenc->dev);
+		if (rc < 0)
+			dev_err(jenc->dev, "PM runtime put failed\n");
+
+		dev_dbg(jenc->dev, "JPEG HW encoder released\n");
+	}
+
+	return 0;
+}
+
+const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops = {
+	.hw_get_cap	= op_jpeg_get_hw_caps,
+	.hw_acquire	= op_jpeg_acquire,
+	.hw_release	= op_jpeg_release,
+	.hw_prepare	= op_jpeg_prepare,
+	.get_queue	= op_jpeg_get_buff_queue,
+	.queue_setup	= op_jpeg_queue_setup,
+	.buf_prepare	= op_jpeg_buffer_prepare,
+	.process_exec	= op_jpeg_process_exec,
+	.hw_irq_top	= op_jpeg_irq_top,
+	.hw_irq_bot	= op_jpeg_irq_bot
+};
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
new file mode 100644
index 000000000000..751a045a3486
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_OPS_H
+#define QCOM_JENC_OPS_H
+
+#include <linux/types.h>
+#include <linux/device.h>
+#include <media/videobuf2-core.h>
+
+#include "qcom_jenc_dev.h"
+
+/*
+ * JENC encoder hardware operations.
+ */
+struct qcom_jpeg_hw_ops {
+	void (*hw_get_cap)
+		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
+
+	int (*hw_acquire)
+		(struct jenc_context *ectx, struct vb2_queue *queue);
+
+	int (*hw_release)
+		(struct jenc_context *ectx, struct vb2_queue *queue);
+
+	int (*hw_prepare)
+		(struct qcom_jenc_dev *jenc);
+
+	struct qcom_jenc_queue * (*get_queue)
+		(struct jenc_context *ectx, enum qcom_enc_qid id);
+
+	int (*queue_setup)
+		(struct jenc_context *ectx, enum qcom_enc_qid id);
+
+	int (*buf_prepare)
+		(struct jenc_context *ectx, struct vb2_buffer *vb2);
+
+	int (*process_exec)
+		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_buffer *vb2);
+
+	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
+	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);
+};
+
+extern const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops;
+
+#endif /* QCOM_JENC_OPS_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
new file mode 100644
index 000000000000..c935ea690837
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+
+#include "qcom_jenc_ops.h"
+#include "qcom_jenc_res.h"
+
+#include "qcom_v165_jenc_hw_info.h"
+#include "qcom_v580_jenc_hw_info.h"
+#include "qcom_v680_jenc_hw_info.h"
+#include "qcom_v780_jenc_hw_info.h"
+
+#define QCOM_PERF_ROW(_axi_rate, _jpeg_rate) \
+{ \
+	.clk_rate = { \
+		[JPEG_CAMNOC_AXI_CLK]	= (_axi_rate),	\
+		[JPEG_CORE_CLK]		= (_jpeg_rate),	\
+	}, \
+}
+
+/*
+ * Baseline AXI clock rates shared across v165/v580, reused by later
+ * derivatives where the hardware does not change these domains.
+ */
+static const u64 cnoc_axi_clk_base[] = {
+	[QCOM_SOC_PERF_SUSPEND]	=  19200000,
+	[QCOM_SOC_PERF_LOWSVS]	= 300000000,
+	[QCOM_SOC_PERF_SVS]	= 300000000,
+	[QCOM_SOC_PERF_SVS_L1]	= 300000000,
+	[QCOM_SOC_PERF_NOMINAL]	= 400000000,
+	[QCOM_SOC_PERF_TURBO]	= 400000000,
+};
+
+/*
+ * Derivative with an improved CAMNOC AXI frequency range
+ */
+static const u64 cnoc_axi_clk_v680[] = {
+	[QCOM_SOC_PERF_SUSPEND]	=  19200000,
+	[QCOM_SOC_PERF_LOWSVS]	= 150000000,
+	[QCOM_SOC_PERF_SVS]	= 240000000,
+	[QCOM_SOC_PERF_SVS_L1]	= 320000000,
+	[QCOM_SOC_PERF_NOMINAL]	= 400000000,
+	[QCOM_SOC_PERF_TURBO]	= 480000000,
+};
+
+/*
+ * Baseline JPEG clock rates shared across v165/v680, reused by later
+ * derivatives where the hardware does not change these domains.
+ */
+static const u64 qcom_jpeg_clk_base[] = {
+	[QCOM_SOC_PERF_SUSPEND]	=  19200000,
+	[QCOM_SOC_PERF_LOWSVS]	= 300000000,
+	[QCOM_SOC_PERF_SVS]	= 400000000,
+	[QCOM_SOC_PERF_SVS_L1]	= 480000000,
+	[QCOM_SOC_PERF_NOMINAL]	= 600000000,
+	[QCOM_SOC_PERF_TURBO]	= 600000000,
+};
+
+/*
+ * Derivative with an improved maximum JPEG frequency
+ */
+static const u64 qcom_jpeg_clk_v780[] = {
+	[QCOM_SOC_PERF_SUSPEND]	=  19200000,
+	[QCOM_SOC_PERF_LOWSVS]	= 200000000,
+	[QCOM_SOC_PERF_SVS]	= 200000000,
+	[QCOM_SOC_PERF_SVS_L1]	= 400000000,
+	[QCOM_SOC_PERF_NOMINAL]	= 480000000,
+	[QCOM_SOC_PERF_TURBO]	= 785000000,
+};
+
+static const struct qcom_perf_resource qcom_perf_rates_base[] = {
+	[QCOM_SOC_PERF_SUSPEND]	=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SUSPEND],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_SUSPEND]),
+
+	[QCOM_SOC_PERF_LOWSVS]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_LOWSVS],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_LOWSVS]),
+
+	[QCOM_SOC_PERF_SVS]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SVS],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_SVS]),
+
+	[QCOM_SOC_PERF_SVS_L1]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SVS_L1],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_SVS_L1]),
+
+	[QCOM_SOC_PERF_NOMINAL]	=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_NOMINAL],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_NOMINAL]),
+
+	[QCOM_SOC_PERF_TURBO]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_TURBO],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_TURBO]),
+};
+
+static const struct qcom_perf_resource qcom_perf_rates_v680[] = {
+	[QCOM_SOC_PERF_SUSPEND]	=
+		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_SUSPEND],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_SUSPEND]),
+
+	[QCOM_SOC_PERF_LOWSVS]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_LOWSVS],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_LOWSVS]),
+
+	[QCOM_SOC_PERF_SVS]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_SVS],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_SVS]),
+
+	[QCOM_SOC_PERF_SVS_L1]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_SVS_L1],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_SVS_L1]),
+
+	[QCOM_SOC_PERF_NOMINAL]	=
+		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_NOMINAL],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_NOMINAL]),
+
+	[QCOM_SOC_PERF_TURBO]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_TURBO],
+			      qcom_jpeg_clk_base[QCOM_SOC_PERF_TURBO]),
+};
+
+static const struct qcom_perf_resource qcom_perf_rates_v780[] = {
+	[QCOM_SOC_PERF_SUSPEND]	=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SUSPEND],
+			      qcom_jpeg_clk_v780[QCOM_SOC_PERF_SUSPEND]),
+
+	[QCOM_SOC_PERF_LOWSVS]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_LOWSVS],
+			      qcom_jpeg_clk_v780[QCOM_SOC_PERF_LOWSVS]),
+
+	[QCOM_SOC_PERF_SVS]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SVS],
+			      qcom_jpeg_clk_v780[QCOM_SOC_PERF_SVS]),
+
+	[QCOM_SOC_PERF_SVS_L1]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SVS_L1],
+			      qcom_jpeg_clk_v780[QCOM_SOC_PERF_SVS_L1]),
+
+	[QCOM_SOC_PERF_NOMINAL]	=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_NOMINAL],
+			      qcom_jpeg_clk_v780[QCOM_SOC_PERF_NOMINAL]),
+
+	[QCOM_SOC_PERF_TURBO]		=
+		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_TURBO],
+			      qcom_jpeg_clk_v780[QCOM_SOC_PERF_TURBO]),
+};
+
+static const struct qcom_icc_resource qcom_jpeg_default_icc[] = {
+	{
+		.icc_id = "cam_ahb",
+		.pair	= { 38400, 76800 }
+	},
+	{
+		.icc_id = "cam_hf_0_mnoc",
+		.pair	= { 2097152, 2097152 }
+	},
+	{
+		.icc_id = "cam_sf_0_mnoc",
+		.pair	= { 0, 2097152 }
+	},
+	{
+		.icc_id	= "cam_sf_icp_mnoc",
+		.pair	= { 2097152, 2097152 }
+	},
+};
+
+static const struct qcom_mem_resource qcom_jpeg_default_mem[] = {
+	{
+		.map_id	= 0,
+		.res_id	= "JPEG"
+	},
+	{
+		.map_id	= 1,
+		.res_id	= "CPAS"
+	}
+};
+
+/*
+ * Resources for T165, T170 JPEG version and derivatives
+ */
+const struct qcom_dev_resources qcom_jpeg_v165_drvdata = {
+	.hw_ops		= &qcom_jpeg_default_ops,
+	.hw_offs	= &qcom_v165_jpeg_hw_reg_offs,
+	.hw_mask	= &qcom_v165_jpeg_hw_reg_mask[0],
+	.icc_res	= qcom_jpeg_default_icc,
+	.num_of_icc	= ARRAY_SIZE(qcom_jpeg_default_icc),
+	.mem_res	= qcom_jpeg_default_mem,
+	.num_of_mem	= ARRAY_SIZE(qcom_jpeg_default_mem),
+	.perf_cfg	= qcom_perf_rates_base,
+	.clk_names = {
+		[JPEG_CAMNOC_AXI_CLK]	= "camnoc_axi_clk",
+		[JPEG_CORE_CLK]		= "jpeg_clk",
+		[JPEG_CORE_AHB_CLK]	= "core_ahb_clk",
+		[JPEG_CPAS_AHB_CLK]	= "cpas_ahb_clk",
+		[JPEG_GCC_HF_AXI]	= "gcc_hf_axi_clk",
+		[JPEG_GCC_SF_AXI]	= "gcc_sf_axi_clk",
+	}
+};
+
+/*
+ * Resources for T480, T580 JPEG version and derivatives
+ */
+const struct qcom_dev_resources qcom_jpeg_v580_drvdata = {
+	.hw_ops		= &qcom_jpeg_default_ops,
+	.hw_offs	= &qcom_v580_jpeg_hw_reg_offs,
+	.hw_mask	= &qcom_v580_jpeg_hw_reg_mask[0],
+	.icc_res	= qcom_jpeg_default_icc,
+	.num_of_icc	= ARRAY_SIZE(qcom_jpeg_default_icc),
+	.mem_res	= qcom_jpeg_default_mem,
+	.num_of_mem	= ARRAY_SIZE(qcom_jpeg_default_mem),
+	.perf_cfg	= qcom_perf_rates_base,
+	.clk_names = {
+		[JPEG_CAMNOC_AXI_CLK]	= "camnoc_axi_clk",
+		[JPEG_CORE_CLK]		= "jpeg_clk",
+		[JPEG_CORE_AHB_CLK]	= "core_ahb_clk",
+		[JPEG_CPAS_AHB_CLK]	= "cpas_ahb_clk",
+		[JPEG_GCC_HF_AXI]	= "gcc_hf_axi_clk",
+		[JPEG_GCC_SF_AXI]	= "gcc_sf_axi_clk",
+	}
+};
+
+/*
+ * Resources for T680 JPEG version and derivatives
+ */
+const struct qcom_dev_resources qcom_jpeg_v680_drvdata = {
+	.hw_ops		= &qcom_jpeg_default_ops,
+	.hw_offs	= &qcom_v680_jpeg_hw_reg_offs,
+	.hw_mask	= &qcom_v680_jpeg_hw_reg_mask[0],
+	.icc_res	= qcom_jpeg_default_icc,
+	.num_of_icc	= ARRAY_SIZE(qcom_jpeg_default_icc),
+	.mem_res	= qcom_jpeg_default_mem,
+	.num_of_mem	= ARRAY_SIZE(qcom_jpeg_default_mem),
+	.perf_cfg	= qcom_perf_rates_v680,
+	.clk_names = {
+		[JPEG_CAMNOC_AXI_CLK]	= "camnoc_axi_clk",
+		[JPEG_CORE_CLK]		= "jpeg_clk",
+		[JPEG_CORE_AHB_CLK]	= "core_ahb_clk",
+		[JPEG_CPAS_AHB_CLK]	= "cpas_ahb_clk",
+		[JPEG_GCC_HF_AXI]	= "gcc_hf_axi_clk",
+		[JPEG_GCC_SF_AXI]	= "gcc_sf_axi_clk",
+	}
+};
+
+/*
+ * Resources for T780 JPEG version and derivatives
+ */
+const struct qcom_dev_resources qcom_jpeg_v780_drvdata = {
+	.hw_ops		= &qcom_jpeg_default_ops,
+	.hw_offs	= &qcom_v780_jpeg_hw_reg_offs,
+	.hw_mask	= &qcom_v780_jpeg_hw_reg_mask[0],
+	.icc_res	= qcom_jpeg_default_icc,
+	.num_of_icc	= ARRAY_SIZE(qcom_jpeg_default_icc),
+	.mem_res	= qcom_jpeg_default_mem,
+	.num_of_mem	= ARRAY_SIZE(qcom_jpeg_default_mem),
+	.perf_cfg	= qcom_perf_rates_v780,
+	.clk_names = {
+		[JPEG_CAMNOC_AXI_CLK]	= "camnoc_axi_clk",
+		[JPEG_CORE_CLK]		= "jpeg_clk",
+		[JPEG_CORE_AHB_CLK]	= "core_ahb_clk",
+		[JPEG_CPAS_AHB_CLK]	= "cpas_ahb_clk",
+		[JPEG_GCC_HF_AXI]	= "gcc_hf_axi_clk",
+		[JPEG_GCC_SF_AXI]	= "gcc_sf_axi_clk",
+	}
+};
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
new file mode 100644
index 000000000000..5152594b0f47
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_RES_H
+#define QCOM_JENC_RES_H
+
+#include "qcom_jenc_defs.h"
+
+/*
+ * clk_rate == 0 means: do not change this clock rate.
+ * Clock is still enabled/disabled normally.
+ */
+enum qcom_jpeg_clock_ids {
+	JPEG_CAMNOC_AXI_CLK,
+	JPEG_CORE_CLK,
+	JPEG_CORE_AHB_CLK,
+	JPEG_CPAS_AHB_CLK,
+	JPEG_GCC_HF_AXI,
+	JPEG_GCC_SF_AXI,
+	JPEG_MAX_CLOCKS
+};
+
+struct qcom_freq_resource {
+	const u64 *freq;
+	u8	  num_of_freq;
+};
+
+struct qcom_icc_resource {
+	const char *icc_id;
+	struct {
+		u32 aggr;
+		u32 peak;
+	} pair;
+};
+
+struct qcom_mem_resource {
+	unsigned int map_id;
+	const char   *res_id;
+};
+
+struct qcom_perf_resource {
+	u64 clk_rate[JPEG_MAX_CLOCKS];
+};
+
+struct qcom_dev_resources {
+	const struct qcom_jpeg_hw_ops	*hw_ops;
+	const struct qcom_jpeg_reg_offs	*hw_offs;
+	const u32			*hw_mask;
+
+	const struct qcom_icc_resource	*icc_res;
+	unsigned int			num_of_icc;
+	const struct qcom_mem_resource	*mem_res;
+	unsigned int			num_of_mem;
+	const struct qcom_perf_resource	*perf_cfg;
+	const char			*clk_names[JPEG_MAX_CLOCKS];
+};
+
+int qcom_find_clk_id(const struct qcom_dev_resources *res, const char *clk_name);
+
+extern const struct qcom_dev_resources qcom_jpeg_v165_drvdata;
+
+extern const struct qcom_dev_resources qcom_jpeg_v580_drvdata;
+
+extern const struct qcom_dev_resources qcom_jpeg_v680_drvdata;
+
+extern const struct qcom_dev_resources qcom_jpeg_v780_drvdata;
+
+#endif	/* QCOM_JENC_RES_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
new file mode 100644
index 000000000000..8f5e4bd8a36e
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
@@ -0,0 +1,1082 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+#include <linux/vmalloc.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_v4l2.h"
+#include "qcom_jenc_ops.h"
+#include "qcom_jenc_defs.h"
+
+static const struct v4l2_frmsizeenum jpeg_def_frmsize = {
+	.stepwise = {
+		.min_width	= QCOM_JPEG_HW_MIN_WIDTH,
+		.max_width	= QCOM_JPEG_HW_MAX_WIDTH,
+		.step_width	= QCOM_JPEG_HW_DEF_HSTEP,
+		.min_height	= QCOM_JPEG_HW_MIN_HEIGHT,
+		.max_height	= QCOM_JPEG_HW_MAX_HEIGHT,
+		.step_height	= QCOM_JPEG_HW_DEF_VSTEP,
+	},
+	.type = V4L2_FRMSIZE_TYPE_STEPWISE
+};
+
+static const struct jenc_enc_format jpeg_src_formats[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_NV12M,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_NV21M,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_GREY,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
+#define JPEG_SRC_FMT_COUNT ARRAY_SIZE(jpeg_src_formats)
+
+static const struct jenc_enc_format jpeg_dst_formats[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_JPEG,
+		.type	= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	}
+};
+
+#define JPEG_DST_FMT_COUNT ARRAY_SIZE(jpeg_dst_formats)
+
+static inline struct jenc_context *jpeg_file2ctx(struct file *file)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	if (!fh)
+		return NULL;
+
+	return container_of(fh, struct jenc_context, fh);
+}
+
+static struct qcom_jenc_queue *jpeg_get_bufq(struct jenc_context *ectx, enum qcom_enc_qid id)
+{
+	return &ectx->bufq[id];
+}
+
+static bool jpeg_v4l2_queues_busy(struct jenc_context *ctx)
+{
+	struct vb2_queue *out_q;
+	struct vb2_queue *cap_q;
+
+	out_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	cap_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	return vb2_is_busy(out_q) || vb2_is_busy(cap_q);
+}
+
+static bool jpeg_is_invalid_src(struct jenc_context *ectx, u32 type)
+{
+	bool is_invalid = (type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	if (is_invalid)
+		dev_err(ectx->dev, "invalid src type or format\n");
+
+	return is_invalid;
+}
+
+static bool jpeg_is_invalid_dst(struct jenc_context *ectx, u32 type)
+{
+	bool is_invalid = (type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	if (is_invalid)
+		dev_err(ectx->dev, "invalid dst type or format\n");
+
+	return is_invalid;
+}
+
+static const struct jenc_enc_format *jpeg_find_pix_format(enum qcom_enc_qid id, u32 fourcc)
+{
+	const struct jenc_enc_format *efmt;
+	unsigned int i, count;
+
+	if (id == JENC_SRC_QUEUE) {
+		count = JPEG_SRC_FMT_COUNT;
+		efmt = &jpeg_src_formats[0];
+	} else {
+		count = JPEG_DST_FMT_COUNT;
+		efmt = &jpeg_dst_formats[0];
+	}
+
+	for (i = 0; i < count; i++) {
+		if (efmt[i].fourcc == fourcc)
+			return &efmt[i];
+	}
+
+	return NULL;
+}
+
+static const struct jenc_enc_format *jpeg_get_format(struct jenc_context *ectx,
+						     enum qcom_enc_qid qid, u32 pixelformat)
+{
+	const struct jenc_enc_format *efmt;
+
+	if (qid == JENC_SRC_QUEUE) {
+		efmt = jpeg_find_pix_format(qid, pixelformat);
+		if (!efmt)
+			efmt = &jpeg_src_formats[0];
+	} else {
+		efmt = jpeg_find_pix_format(qid, pixelformat);
+		if (!efmt)
+			efmt = &jpeg_dst_formats[0];
+	}
+
+	return efmt;
+}
+
+static int jpeg_update_src_planes(const struct jenc_enc_format *ef, struct v4l2_format *v4f)
+{
+	struct v4l2_pix_format_mplane *f = &v4f->fmt.pix_mp;
+	const struct v4l2_format_info *info = v4l2_format_info(ef->fourcc);
+	int rc;
+
+	if (!info)
+		return -EINVAL;
+
+	f->pixelformat = ef->fourcc;
+
+	f->field	= V4L2_FIELD_NONE;
+	f->colorspace	= V4L2_COLORSPACE_SRGB;
+	f->xfer_func	= V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
+	f->ycbcr_enc	= V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
+	f->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc == V4L2_YCBCR_ENC_601,
+					      f->colorspace, f->ycbcr_enc);
+
+	v4l2_apply_frmsize_constraints(&f->width, &f->height, &jpeg_def_frmsize.stepwise);
+
+	rc = v4l2_fill_pixfmt_mp(f, ef->fourcc, f->width, f->height);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static void jpeg_update_dst_plane(const struct jenc_enc_format *ef, struct v4l2_format *v4f)
+{
+	struct v4l2_pix_format_mplane *f = &v4f->fmt.pix_mp;
+	u64 size;
+	u32 nbx, nby;
+
+	f->pixelformat  = ef->fourcc;
+	f->field	= V4L2_FIELD_NONE;
+	f->colorspace	= V4L2_COLORSPACE_SRGB;
+	f->xfer_func	= V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
+	f->ycbcr_enc	= V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
+	f->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc == V4L2_YCBCR_ENC_601,
+					      f->colorspace, f->ycbcr_enc);
+
+	v4l2_apply_frmsize_constraints(&f->width, &f->height, &jpeg_def_frmsize.stepwise);
+
+	/*
+	 * JPEG is a variable-size format. The output size cannot be derived
+	 * from bits per point or line stride.
+	 *
+	 * Provide a conservative upper bound based on worst-case entropy
+	 * coding of 8x8 DCT blocks:
+	 *
+	 * - Each 8x8 block has 64 coefficients (1 DC + 63 AC).
+	 * - In worst-case (high-entropy input, low quantization), all
+	 *   coefficients may be non-zero.
+	 * - Huffman coding then emits (code + magnitude bits) per coefficient,
+	 *   which can approach ~2 bytes per coefficient in the worst case.
+	 *
+	 * => Worst-case is 64 coefficients * 2 bytes = 128 bytes per 8x8 block
+	 * => approximately 2 bytes per point
+	 *
+	 * This bound implicitly covers byte stuffing (0xFF escaping) and is
+	 * conservative with respect to subsampled formats (e.g. 4:2:0).
+	 *
+	 * Additional margin is added for headers and alignment.
+	 *
+	 * Note: This is a conservative upper bound, not an exact size.
+	 */
+
+	nbx = DIV_ROUND_UP(f->width,  8);
+	nby = DIV_ROUND_UP(f->height, 8);
+
+	size = nbx * nby * 128;
+	size += SZ_4K; /* header + safety margin */
+
+	f->plane_fmt[0].bytesperline = 0;
+	f->plane_fmt[0].sizeimage    = ALIGN(size, SZ_4K);
+}
+
+static int jpeg_enum_fmt_src(struct v4l2_fmtdesc *f)
+{
+	if (f->index >= JPEG_SRC_FMT_COUNT)
+		return -EINVAL;
+
+	f->pixelformat = jpeg_src_formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int jpeg_enum_fmt_dst(struct v4l2_fmtdesc *f)
+{
+	if (f->index >= JPEG_DST_FMT_COUNT)
+		return -EINVAL;
+
+	f->pixelformat = jpeg_dst_formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int jpeg_v4l2_try_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pm = &f->fmt.pix_mp;
+	const struct jenc_enc_format *ef;
+	int rc;
+
+	/* The function always returns valid driver format */
+	ef = jpeg_get_format(ectx, TYPE2QID(f->type), pm->pixelformat);
+
+	dev_dbg(ectx->dev, "type=%d %c%c%c%c\n",
+		TYPE2QID(f->type),
+		(ef->fourcc >>  0) & 0xff,
+		(ef->fourcc >>  8) & 0xff,
+		(ef->fourcc >> 16) & 0xff,
+		(ef->fourcc >> 24) & 0xff);
+
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		f->fmt.pix_mp.num_planes = 1;
+
+		jpeg_update_dst_plane(ef, f);
+
+		dev_dbg(ectx->dev, "\tImage: %dx%d Size:%9d\n", f->fmt.pix_mp.width,
+			f->fmt.pix_mp.height, f->fmt.pix_mp.plane_fmt[0].sizeimage);
+	} else {
+		/*
+		 * The used format is an internal driver format that must be
+		 * present in the V4L2 common formats; therefore, the errors
+		 * below should never occur.
+		 */
+		const struct v4l2_format_info *info = v4l2_format_info(ef->fourcc);
+		u8 pln = 0;
+
+		if (WARN_ON_ONCE(!info))
+			return -EINVAL;
+
+		f->fmt.pix_mp.num_planes = info->comp_planes;
+
+		rc = jpeg_update_src_planes(ef, f);
+		if (WARN_ON_ONCE(rc))
+			return -EINVAL;
+
+		for (pln = 0; pln < f->fmt.pix_mp.num_planes; pln++)
+			dev_dbg(ectx->dev, "\tImage: %dx%d BPL:%5d Size:%9d\n",
+				pm->width, pm->height, pm->plane_fmt[pln].bytesperline,
+				pm->plane_fmt[pln].sizeimage);
+	}
+
+	return 0;
+}
+
+static int jpeg_v4l2_set_defaults(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+	struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+	struct v4l2_format f = {0};
+	int rc;
+
+	f.type			 = jpeg_src_formats->type;
+	f.fmt.pix_mp.pixelformat = jpeg_src_formats->fourcc;
+	f.fmt.pix_mp.width	 = QCOM_JPEG_HW_DEF_WIDTH;
+	f.fmt.pix_mp.height	 = QCOM_JPEG_HW_DEF_HEIGHT;
+
+	rc = jpeg_v4l2_try_format(ectx, &f);
+	if (rc)
+		return rc;
+
+	sq->vf = f.fmt.pix_mp;
+
+	f.type			 = jpeg_dst_formats->type;
+	f.fmt.pix_mp.pixelformat = jpeg_dst_formats->fourcc;
+	f.fmt.pix_mp.width	 = QCOM_JPEG_HW_DEF_WIDTH;
+	f.fmt.pix_mp.height	 = QCOM_JPEG_HW_DEF_HEIGHT;
+
+	rc = jpeg_v4l2_try_format(ectx, &f);
+	if (rc)
+		return rc;
+
+	dq->vf = f.fmt.pix_mp;
+
+	return 0;
+}
+
+static int jpeg_v4l2_set_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	struct qcom_jenc_queue *q = jpeg_get_bufq(ectx, TYPE2QID(f->type));
+	struct v4l2_pix_format_mplane *pm = &f->fmt.pix_mp;
+	int rc;
+
+	if (jpeg_v4l2_queues_busy(ectx))
+		return -EBUSY;
+
+	if (!v4l2_m2m_get_vq(ectx->fh.m2m_ctx, f->type)) {
+		dev_err(ectx->dev, "cannot get video queue\n");
+		return -EINVAL;
+	}
+
+	rc = jpeg_v4l2_try_format(ectx, f);
+	if (rc)
+		return rc;
+
+	/*
+	 * Because scaling is not supported, source and destination image
+	 * sizes must be equal.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+
+		/* Adjust source size to match capture size */
+		if (pm->width != sq->vf.width || pm->height != sq->vf.height) {
+			struct v4l2_format nf = {0};
+
+			nf.type			  = jpeg_src_formats->type;
+			nf.fmt.pix_mp.pixelformat = sq->vf.pixelformat;
+			nf.fmt.pix_mp.width	  = pm->width;
+			nf.fmt.pix_mp.height	  = pm->height;
+
+			rc = jpeg_v4l2_try_format(ectx, &nf);
+			if (rc)
+				return rc;
+
+			sq->vf = nf.fmt.pix_mp;
+		}
+
+	} else {
+		struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+		struct v4l2_format nf = {0};
+
+		/* Adjust destination size to match source size */
+		if (pm->width != dq->vf.width || pm->height != dq->vf.height) {
+			nf.type			  = jpeg_dst_formats->type;
+			nf.fmt.pix_mp.pixelformat = dq->vf.pixelformat;
+			nf.fmt.pix_mp.width	  = pm->width;
+			nf.fmt.pix_mp.height	  = pm->height;
+
+			rc = jpeg_v4l2_try_format(ectx, &nf);
+			if (rc)
+				return rc;
+
+			dq->vf = nf.fmt.pix_mp;
+
+			/*
+			 * The horizontal alignment of the destination is larger, and the
+			 * result after adjustment may still differ. In this case, the
+			 * requested image size should also be modified.
+			 */
+			if (pm->width != nf.fmt.pix_mp.width ||
+			    pm->height != nf.fmt.pix_mp.height) {
+				pm->width  = nf.fmt.pix_mp.width;
+				pm->height = nf.fmt.pix_mp.height;
+			}
+		}
+	}
+
+	q->vf = *pm;
+
+	return 0;
+}
+
+static void jpeg_v4l2_get_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	struct qcom_jenc_queue *q = jpeg_get_bufq(ectx, TYPE2QID(f->type));
+
+	f->fmt.pix_mp = q->vf;
+}
+
+static void jpeg_v4l2_work_done(struct qcom_jenc_dev *jenc, struct jenc_context *ctx,
+				size_t out_size)
+{
+	struct vb2_v4l2_buffer *vb;
+
+	vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	if (vb)
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+
+	vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	if (vb) {
+		vb2_set_plane_payload(&vb->vb2_buf, 0, out_size);
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+	}
+
+	v4l2_m2m_job_finish(jenc->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static void jpeg_v4l2_work_stop(struct qcom_jenc_dev *jenc, struct jenc_context *ctx,
+				enum vb2_buffer_state buff_state)
+{
+	struct vb2_v4l2_buffer *vb;
+
+	while ((vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
+		if (v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {
+			mutex_lock(&ctx->stop_lock);
+			if (ctx->is_stopping) {
+				ctx->is_stopping = false;
+				vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
+			}
+			mutex_unlock(&ctx->stop_lock);
+			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
+		} else {
+			v4l2_m2m_buf_done(vb, buff_state);
+		}
+	}
+
+	while ((vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
+		v4l2_m2m_buf_done(vb, buff_state);
+
+	v4l2_m2m_job_finish(jenc->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static void jpeg_v4l2_process_cb(void *priv, enum vb2_buffer_state ev, size_t out_size)
+{
+	struct jenc_context *ctx = priv;
+	struct qcom_jenc_dev *jenc = ctx->jenc;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	if (ev == VB2_BUF_STATE_DONE && out_size)
+		jpeg_v4l2_work_done(ctx->jenc, ctx, out_size);
+	else
+		jpeg_v4l2_work_stop(ctx->jenc, ctx, ev);
+
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static int cop_jpeg_v4l2_set_ctrls(struct v4l2_ctrl *ctrl)
+{
+	struct jenc_context *ectx = container_of(ctrl->handler, struct jenc_context, ctrl_hdl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
+		mutex_lock(&ectx->quality_mutex);
+		ectx->quality_requested = ctrl->val;
+		mutex_unlock(&ectx->quality_mutex);
+		break;
+	default:
+		dev_err(ectx->dev, "%s: invalid control=%#x\n", __func__, ctrl->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops qcom_jpeg_v4l2_ctrl_ops = {
+	.s_ctrl = cop_jpeg_v4l2_set_ctrls,
+};
+
+static int bop_jpeg_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				    unsigned int *plns_per_buff, unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vq);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	struct qcom_jenc_queue *q;
+	int pln;
+
+	q = hw->get_queue(ectx, TYPE2QID(vq->type));
+	if (!q || !q->vf.num_planes)
+		return -EINVAL;
+
+	if (*plns_per_buff) {
+		if (*plns_per_buff != q->vf.num_planes)
+			return -EINVAL;
+
+		for (pln = 0; pln < q->vf.num_planes; ++pln) {
+			if (sizes[pln] < q->vf.plane_fmt[pln].sizeimage)
+				return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	*plns_per_buff = q->vf.num_planes;
+	for (pln = 0; pln < q->vf.num_planes; ++pln) {
+		sizes[pln] = q->vf.plane_fmt[pln].sizeimage;
+		dev_dbg(ectx->dev, "%s: queue=%d size[%d]=%d\n", __func__, TYPE2QID(vq->type),
+			pln, sizes[pln]);
+	}
+
+	if (V4L2_TYPE_IS_CAPTURE(vq->type))
+		sizes[0] += JPEG_HEADER_MAX;
+
+	return hw->queue_setup(ectx, TYPE2QID(vq->type));
+}
+
+static int bop_jpeg_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (vbuf->field == V4L2_FIELD_ANY)
+		vbuf->field = V4L2_FIELD_NONE;
+
+	if (vbuf->field != V4L2_FIELD_NONE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int bop_jpeg_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vb->vb2_queue);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb->type)];
+	int pln;
+	int rc;
+
+	if (vb->num_planes != q->vf.num_planes)
+		return -EINVAL;
+
+	for (pln = 0; pln < q->vf.num_planes; pln++) {
+		if (q->vf.plane_fmt[pln].sizeimage == 0)
+			return -EINVAL;
+
+		if (vb2_plane_size(vb, pln) < q->vf.plane_fmt[pln].sizeimage)
+			return -EINVAL;
+	}
+
+	rc = hw->buf_prepare(ectx, vb);
+	if (rc) {
+		dev_err_ratelimited(ectx->dev, "buffer prepare failed\n");
+		jpeg_v4l2_process_cb(ectx, VB2_BUF_STATE_ERROR, 0);
+		return rc;
+	}
+
+	return 0;
+}
+
+static void bop_jpeg_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_m2m_buf_queue(ectx->fh.m2m_ctx, vbuf);
+}
+
+static int bop_jpeg_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(q);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+	struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+	u32 hw_caps;
+	u8 pln;
+	int rc;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		dev_dbg(ectx->dev, "%c%c%c%c %dx%d\n",
+			(sq->vf.pixelformat >>  0) & 0xff,
+			(sq->vf.pixelformat >>  8) & 0xff,
+			(sq->vf.pixelformat >> 16) & 0xff,
+			(sq->vf.pixelformat >> 24) & 0xff,
+			sq->vf.width, sq->vf.height);
+
+		for (pln = 0; pln < sq->vf.num_planes; pln++) {
+			dev_dbg(ectx->dev, "\tpln=%d %dx%d bpl:%d size:%d\n", pln,
+				sq->vf.width, sq->vf.height,
+				sq->vf.plane_fmt[pln].bytesperline,
+				sq->vf.plane_fmt[pln].sizeimage);
+		}
+	} else {
+		dev_dbg(ectx->dev, "%c%c%c%c %dx%d\n",
+			(dq->vf.pixelformat >>  0) & 0xff,
+			(dq->vf.pixelformat >>  8) & 0xff,
+			(dq->vf.pixelformat >> 16) & 0xff,
+			(dq->vf.pixelformat >> 24) & 0xff,
+			dq->vf.width, dq->vf.height);
+	}
+
+	mutex_lock(&jenc->dev_mutex);
+
+	ectx->quality_requested = QCOM_JPEG_QUALITY_MAX;
+
+	rc = hw->hw_acquire(ectx, q);
+
+	hw->hw_get_cap(jenc, &hw_caps);
+	dev_dbg(ectx->dev, "hw_caps=0x%x\n", hw_caps);
+
+	mutex_unlock(&jenc->dev_mutex);
+
+	return rc;
+}
+
+static void bop_jpeg_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(q);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	jpeg_v4l2_work_stop(jenc, ectx, VB2_BUF_STATE_ERROR);
+
+	hw->hw_release(ectx, q);
+
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static const struct vb2_ops qcom_jpeg_v4l2_vb2_ops = {
+	.queue_setup		= bop_jpeg_vb2_queue_setup,
+	.buf_out_validate	= bop_jpeg_vb2_buf_out_validate,
+	.buf_prepare		= bop_jpeg_vb2_buf_prepare,
+	.buf_queue		= bop_jpeg_vb2_buf_queue,
+	.start_streaming	= bop_jpeg_vb2_start_streaming,
+	.stop_streaming		= bop_jpeg_vb2_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+};
+
+static void mop_jpeg_m2m_job_abort(void *priv)
+{
+	struct jenc_context *ectx = priv;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	jpeg_v4l2_work_stop(jenc, ectx, VB2_BUF_STATE_ERROR);
+
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static void mop_jpeg_m2m_job_run(void *priv)
+{
+	struct jenc_context *ectx = priv;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	struct vb2_v4l2_buffer *src_vb, *dst_vb;
+	struct qcom_jenc_queue *sq, *dq;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	src_vb = v4l2_m2m_next_src_buf(ectx->fh.m2m_ctx);
+	dst_vb = v4l2_m2m_next_dst_buf(ectx->fh.m2m_ctx);
+
+	if (!src_vb || !dst_vb) {
+		jpeg_v4l2_work_stop(jenc, ectx, VB2_BUF_STATE_ERROR);
+		mutex_unlock(&jenc->dev_mutex);
+		return;
+	}
+
+	ectx->quality_requested = QCOM_JPEG_QUALITY_MAX;
+
+	hw->hw_prepare(jenc);
+
+	sq = hw->get_queue(ectx, TYPE2QID(src_vb->vb2_buf.type));
+	src_vb->sequence = sq->sequence++;
+	hw->process_exec(jenc, ectx, &src_vb->vb2_buf);
+
+	dq = hw->get_queue(ectx, TYPE2QID(dst_vb->vb2_buf.type));
+	dst_vb->sequence = dq->sequence++;
+	hw->process_exec(jenc, ectx, &dst_vb->vb2_buf);
+
+	v4l2_m2m_buf_copy_metadata(src_vb, dst_vb, false);
+
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static const struct v4l2_m2m_ops qcom_jpeg_v4l2_m2m_ops = {
+	.device_run	= mop_jpeg_m2m_job_run,
+	.job_abort	= mop_jpeg_m2m_job_abort,
+};
+
+static int iop_jpeg_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, QCOM_JPEG_ENC_NAME, sizeof(cap->driver));
+	strscpy(cap->card, QCOM_JPEG_ENC_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", QCOM_JPEG_ENC_NAME);
+
+	return 0;
+}
+
+static int iop_jpeg_enum_fmt_vid_dst(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_enum_fmt_dst(f);
+}
+
+static int iop_jpeg_enum_framesizes(struct file *file, void *priv, struct v4l2_frmsizeenum *fsize)
+{
+	const struct jenc_enc_format *efmt;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	efmt = jpeg_find_pix_format(JENC_SRC_QUEUE, fsize->pixel_format);
+	if (efmt) {
+		fsize->type	= jpeg_def_frmsize.type;
+		fsize->stepwise	= jpeg_def_frmsize.stepwise;
+		return 0;
+	}
+
+	efmt = jpeg_find_pix_format(JENC_DST_QUEUE, fsize->pixel_format);
+	if (efmt) {
+		fsize->type	= jpeg_def_frmsize.type;
+		fsize->stepwise	= jpeg_def_frmsize.stepwise;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int iop_jpeg_enum_fmt_vid_src(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_enum_fmt_src(f);
+}
+
+static int iop_jpeg_get_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	jpeg_v4l2_get_format(ectx, f);
+
+	return 0;
+}
+
+static int iop_jpeg_try_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_try_format(ectx, f);
+}
+
+static int iop_jpeg_set_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_set_format(ectx, f);
+}
+
+static int iop_jpeg_get_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	jpeg_v4l2_get_format(ectx, f);
+
+	return 0;
+}
+
+static int iop_jpeg_try_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_try_format(ectx, f);
+}
+
+static int iop_jpeg_set_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_set_format(ectx, f);
+}
+
+static int iop_jpeg_encoder_command(struct file *file, void *priv, struct v4l2_encoder_cmd *ec)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+	struct vb2_queue *vq;
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP) {
+		vq = v4l2_m2m_get_src_vq(ectx->fh.m2m_ctx);
+		if (!vb2_is_streaming(vq))
+			return 0;
+
+		vq = v4l2_m2m_get_dst_vq(ectx->fh.m2m_ctx);
+		if (!vb2_is_streaming(vq))
+			return 0;
+
+		mutex_lock(&ectx->stop_lock);
+		ectx->is_stopping = true;
+		mutex_unlock(&ectx->stop_lock);
+		jpeg_v4l2_work_stop(ectx->jenc, ectx, VB2_BUF_STATE_ERROR);
+
+		return 0;
+	}
+
+	return v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
+}
+
+static const struct v4l2_ioctl_ops qcom_jpeg_v4l2_ioctl_ops = {
+	.vidioc_querycap		= iop_jpeg_querycap,
+	.vidioc_enum_fmt_vid_cap	= iop_jpeg_enum_fmt_vid_dst,
+	.vidioc_enum_fmt_vid_out	= iop_jpeg_enum_fmt_vid_src,
+	.vidioc_enum_framesizes		= iop_jpeg_enum_framesizes,
+
+	.vidioc_g_fmt_vid_cap_mplane	= iop_jpeg_get_fmt_vid_dst,
+	.vidioc_try_fmt_vid_cap_mplane	= iop_jpeg_try_fmt_vid_dst,
+	.vidioc_s_fmt_vid_cap_mplane	= iop_jpeg_set_fmt_vid_dst,
+	.vidioc_g_fmt_vid_out_mplane	= iop_jpeg_get_fmt_vid_src,
+	.vidioc_try_fmt_vid_out_mplane	= iop_jpeg_try_fmt_vid_src,
+	.vidioc_s_fmt_vid_out_mplane	= iop_jpeg_set_fmt_vid_src,
+
+	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
+	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
+	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+
+	.vidioc_encoder_cmd		= iop_jpeg_encoder_command,
+	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
+};
+
+static int jpeg_v4l2_init_queue(void *priv, struct vb2_queue *sq, struct vb2_queue *dq)
+{
+	struct jenc_context *ectx = priv;
+	int rc;
+
+	sq->drv_priv		= ectx;
+	sq->dev			= ectx->dev;
+	sq->type		= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	sq->io_modes		= VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	sq->buf_struct_size	= sizeof(struct v4l2_m2m_buffer);
+	sq->ops			= &qcom_jpeg_v4l2_vb2_ops;
+	sq->mem_ops		= &vb2_dma_sg_memops;
+	sq->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	sq->lock		= &ectx->ctx_lock;
+	sq->min_queued_buffers	= 1;
+
+	rc = vb2_queue_init(sq);
+	if (rc)
+		return rc;
+
+	dq->drv_priv		= ectx;
+	dq->dev			= ectx->dev;
+	dq->type		= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dq->io_modes		= VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	dq->buf_struct_size	= sizeof(struct v4l2_m2m_buffer);
+	dq->ops			= &qcom_jpeg_v4l2_vb2_ops;
+	dq->mem_ops		= &vb2_dma_sg_memops;
+	dq->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dq->lock		= &ectx->ctx_lock;
+	dq->min_queued_buffers	= 1;
+
+	rc = vb2_queue_init(dq);
+	if (rc) {
+		vb2_queue_release(sq);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int fop_jpeg_file_open(struct file *file)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct qcom_jenc_dev *jenc = video_drvdata(file);
+	struct jenc_context *ectx;
+	int rc;
+
+	ectx = kzalloc(sizeof(*ectx), GFP_KERNEL);
+	if (!ectx)
+		return -ENOMEM;
+
+	ectx->dev  = jenc->dev;
+	ectx->jenc = jenc;
+
+	mutex_init(&ectx->ctx_lock);
+	mutex_init(&ectx->quality_mutex);
+	mutex_init(&ectx->stop_lock);
+
+	rc = jpeg_v4l2_set_defaults(ectx);
+	if (rc)
+		goto err_unlock_free;
+
+	v4l2_fh_init(&ectx->fh, vdev);
+	v4l2_fh_add(&ectx->fh, file);
+
+	v4l2_ctrl_handler_init(&ectx->ctrl_hdl, 1);
+	ectx->quality_ctl = v4l2_ctrl_new_std(&ectx->ctrl_hdl,
+					      &qcom_jpeg_v4l2_ctrl_ops,
+					      V4L2_CID_JPEG_COMPRESSION_QUALITY,
+					      QCOM_JPEG_QUALITY_MIN,
+					      QCOM_JPEG_QUALITY_MAX,
+					      QCOM_JPEG_QUALITY_UNT,
+					      QCOM_JPEG_QUALITY_DEF);
+	if (ectx->ctrl_hdl.error) {
+		rc = ectx->ctrl_hdl.error;
+		goto err_fh_exit;
+	}
+
+	ectx->fh.ctrl_handler = &ectx->ctrl_hdl;
+
+	rc = v4l2_ctrl_handler_setup(&ectx->ctrl_hdl);
+	if (rc)
+		goto err_ctrl_handler_free;
+
+	ectx->fh.m2m_ctx = v4l2_m2m_ctx_init(jenc->m2m_dev, ectx, &jpeg_v4l2_init_queue);
+	if (IS_ERR(ectx->fh.m2m_ctx)) {
+		rc = PTR_ERR(ectx->fh.m2m_ctx);
+		goto err_ctrl_handler_free;
+	}
+
+	return 0;
+
+err_ctrl_handler_free:
+	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
+err_fh_exit:
+	v4l2_fh_del(&ectx->fh, file);
+	v4l2_fh_exit(&ectx->fh);
+err_unlock_free:
+
+	kfree(ectx);
+
+	return rc;
+}
+
+static int fop_jpeg_file_release(struct file *file)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	v4l2_m2m_ctx_release(ectx->fh.m2m_ctx);
+	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
+	v4l2_fh_del(&ectx->fh, file);
+	v4l2_fh_exit(&ectx->fh);
+	kfree(ectx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations qcom_jpeg_v4l2_file_ops = {
+	.owner		= THIS_MODULE,
+	.open		= fop_jpeg_file_open,
+	.release	= fop_jpeg_file_release,
+	.poll		= v4l2_m2m_fop_poll,
+	.mmap		= v4l2_m2m_fop_mmap,
+	.unlocked_ioctl = video_ioctl2,
+};
+
+int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc)
+{
+	int rc;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	jenc->enc_hw_irq_cb = jpeg_v4l2_process_cb;
+
+	jenc->m2m_dev = v4l2_m2m_init(&qcom_jpeg_v4l2_m2m_ops);
+	if (IS_ERR(jenc->m2m_dev)) {
+		dev_err(jenc->dev, "failed to init mem2mem device\n");
+		rc = PTR_ERR(jenc->m2m_dev);
+		goto err_mutex_unlock;
+	}
+
+	jenc->vdev = video_device_alloc();
+	if (!jenc->vdev) {
+		rc = -ENOMEM;
+		goto err_video_device_release;
+	}
+
+	snprintf(jenc->vdev->name, sizeof(jenc->vdev->name), "%s", QCOM_JPEG_ENC_NAME);
+	jenc->vdev->fops	= &qcom_jpeg_v4l2_file_ops;
+	jenc->vdev->ioctl_ops	= &qcom_jpeg_v4l2_ioctl_ops;
+	jenc->vdev->minor	= -1;
+	jenc->vdev->release	= video_device_release;
+	jenc->vdev->lock	= &jenc->dev_mutex;
+	jenc->vdev->v4l2_dev	= &jenc->v4l2_dev;
+	jenc->vdev->vfl_dir	= VFL_DIR_M2M;
+	jenc->vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
+
+	rc = video_register_device(jenc->vdev, VFL_TYPE_VIDEO, -1);
+	if (rc) {
+		dev_err(jenc->dev, "failed to register video device\n");
+		goto err_video_device_release;
+	}
+
+	video_set_drvdata(jenc->vdev, jenc);
+
+	mutex_unlock(&jenc->dev_mutex);
+
+	dev_info(jenc->dev, "device registered as /dev/video%d\n", jenc->vdev->num);
+
+	return rc;
+
+err_video_device_release:
+	if (jenc->vdev)
+		video_device_release(jenc->vdev);
+	v4l2_m2m_release(jenc->m2m_dev);
+err_mutex_unlock:
+	mutex_unlock(&jenc->dev_mutex);
+
+	return rc;
+}
+
+void qcom_jpeg_v4l2_unregister(struct qcom_jenc_dev *jenc)
+{
+	mutex_lock(&jenc->dev_mutex);
+
+	video_unregister_device(jenc->vdev);
+
+	v4l2_m2m_release(jenc->m2m_dev);
+
+	mutex_unlock(&jenc->dev_mutex);
+}
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
new file mode 100644
index 000000000000..0305d2911717
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_V4L2_H
+#define QCOM_JENC_V4L2_H
+
+#include <linux/types.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-ctrls.h>
+
+struct qcom_jenc_dev;
+
+struct jenc_context;
+
+int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc);
+
+void qcom_jpeg_v4l2_unregister(struct qcom_jenc_dev *jenc);
+
+#endif /* QCOM_JENC_V4L2_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_v165_jenc_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_v165_jenc_hw_info.h
new file mode 100644
index 000000000000..16e4eae04d5f
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_v165_jenc_hw_info.h
@@ -0,0 +1,509 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_HW_INFO_V165_H
+#define QCOM_JENC_HW_INFO_V165_H
+
+#include "qcom_jenc_defs.h"
+
+#define JPEG_V165_HW_VER_STEP_POS 0
+#define JPEG_V165_HW_VER_STEP_MSK \
+	(0xffff << JPEG_V165_HW_VER_STEP_POS)
+
+#define JPEG_V165_HW_VER_MINOR_POS 16
+#define JPEG_V165_HW_VER_MINOR_MSK \
+	(0x0fff << JPEG_V165_HW_VER_MINOR_POS)
+
+#define JPEG_V165_HW_VER_MAJOR_POS 28
+#define JPEG_V165_HW_VER_MAJOR_MSK \
+	(0xf << JPEG_V165_HW_VER_MAJOR_POS)
+
+#define JPEG_V165_HW_CAP_ENCODE_MSK BIT(0)
+#define JPEG_V165_HW_CAP_DECODE_MSK BIT(1)
+
+#define JPEG_V165_HW_CAP_UPSCALE_POS 4
+#define JPEG_V165_HW_CAP_UPSCALE_MSK \
+	(0x7 << JPEG_V165_HW_CAP_UPSCALE_POS)
+
+#define JPEG_V165_HW_CAP_DOWNSCALE_POS 8
+#define JPEG_V165_HW_CAP_DOWNSCALE_MSK \
+	(0x7 << JPEG_V165_HW_CAP_DOWNSCALE_POS)
+
+#define JPEG_V165_RST_CMD_FE_RESET_MSK			BIT(0)
+#define JPEG_V165_RST_CMD_WE_RESET_MSK			BIT(1)
+#define JPEG_V165_RST_CMD_ENCODER_RESET_MSK		BIT(4)
+#define JPEG_V165_RST_CMD_DECODER_RESET_MSK		BIT(5)
+#define JPEG_V165_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT(6)
+#define JPEG_V165_RST_CMD_SCALE_RESET_MSK		BIT(7)
+#define JPEG_V165_RST_CMD_REGISTER_RESET_MSK		BIT(13)
+#define JPEG_V165_RST_CMD_MISR_RESET_MSK		BIT(16)
+#define JPEG_V165_RST_CMD_CORE_RESET_MSK		BIT(17)
+#define JPEG_V165_RST_CMD_JPEG_V165_DOMAIN_RESET_MSK	BIT(29)
+#define JPEG_V165_RST_CMD_RESET_BYPASS_MSK		BIT(31)
+
+#define JPEG_V165_CORE_CFG_FE_ENABLE_MSK	BIT(0)
+#define JPEG_V165_CORE_CFG_WE_ENABLE_MSK	BIT(1)
+#define JPEG_V165_CORE_CFG_ENC_ENABLE_MSK	BIT(4)
+#define JPEG_V165_CORE_CFG_SCALE_ENABLE_MSK	BIT(7)
+#define JPEG_V165_CORE_CFG_TESTBUS_ENABLE_MSK	BIT(19)
+#define JPEG_V165_CORE_CFG_MODE_MSK		BIT(24)
+#define JPEG_V165_CORE_CFG_CGC_DISABLE_MSK	BIT(31)
+
+#define JPEG_V165_CMD_HW_START_MSK		BIT(0)
+#define JPEG_V165_CMD_HW_STOP_MSK		BIT(1)
+#define JPEG_V165_CMD_CLR_RD_PLN0_QUEUE_MSK	BIT(4)
+#define JPEG_V165_CMD_CLR_RD_PLN1_QUEUE_MSK	BIT(5)
+#define JPEG_V165_CMD_CLR_RD_PLN2_QUEUE_MSK	BIT(6)
+#define JPEG_V165_CMD_CLR_WR_PLN0_QUEUE_MSK	BIT(8)
+#define JPEG_V165_CMD_CLR_WR_PLN1_QUEUE_MSK	BIT(9)
+#define JPEG_V165_CMD_CLR_WR_PLN2_QUEUE_MSK	BIT(10)
+#define JPEG_V165_CMD_APPLY_SWC_RD_PARAMS_MSK	BIT(11)
+
+#define JPEG_V165_CORE_STATE_STATUS_ENCODE_STATE_MSK	BIT(0)
+#define JPEG_V165_CORE_STATE_STATUS_SCALE_STATE_MSK	BIT(2)
+#define JPEG_V165_CORE_STATE_STATUS_REALTIME_STATE_MSK	BIT(4)
+#define JPEG_V165_CORE_STATE_STATUS_BUS_STATE_MSK	BIT(8)
+#define JPEG_V165_CORE_STATE_STATUS_CGC_STATE_MSK	BIT(9)
+
+#define JPEG_V165_FE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V165_FE_CFG_BYTE_ORDERING_MSK \
+	(0xf << JPEG_V165_FE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V165_FE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V165_FE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xf << JPEG_V165_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V165_FE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V165_FE_CFG_MEMORY_FORMAT_MSK \
+	(0x3 << JPEG_V165_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V165_FE_CFG_CBCR_ORDER_MSK		BIT(12)
+#define JPEG_V165_FE_CFG_BOTTOM_VPAD_EN_MSK	BIT(13)
+#define JPEG_V165_FE_CFG_PLN0_EN_MSK		BIT(16)
+#define JPEG_V165_FE_CFG_PLN1_EN_MSK		BIT(17)
+#define JPEG_V165_FE_CFG_PLN2_EN_MSK		BIT(18)
+#define JPEG_V165_FE_CFG_SIXTEEN_MCU_EN_MSK	BIT(21)
+#define JPEG_V165_FE_CFG_MCUS_PER_BLOCK_MSK	BIT(22)
+#define JPEG_V165_FE_CFG_MAL_BOUNDARY_MSK	BIT(24)
+#define JPEG_V165_FE_CFG_MAL_EN_MSK		BIT(27)
+
+#define JPEG_V165_PLN_RD_OFFS_OFFSET_POS 0
+#define JPEG_V165_PLN_RD_OFFS_OFFSET_MSK \
+	(0x1fffffff << JPEG_V165_PLN_RD_OFFS_OFFSET_POS)
+
+#define JPEG_V165_PLN_RD_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V165_PLN_RD_BUFF_SIZE_WIDTH_MSK \
+	(0xffff << JPEG_V165_PLN_RD_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V165_PLN_RD_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V165_PLN_RD_BUFF_SIZE_HEIGHT_MSK \
+	(0xffff << JPEG_V165_PLN_RD_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V165_PLN_RD_STRIDE_STRIDE_POS 0
+#define JPEG_V165_PLN_RD_STRIDE_STRIDE_MSK \
+	(0xffff << JPEG_V165_PLN_RD_STRIDE_STRIDE_POS)
+
+#define JPEG_V165_PLN_RD_HINIT_FRACTIONAL_POS 0
+#define JPEG_V165_PLN_RD_HINIT_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V165_PLN_RD_HINIT_FRACTIONAL_POS)
+
+#define JPEG_V165_PLN_RD_VINIT_FRACTIONAL_POS 0
+#define JPEG_V165_PLN_RD_VINIT_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V165_PLN_RD_VINIT_FRACTIONAL_POS)
+
+#define JPEG_V165_WE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V165_WE_CFG_BYTE_ORDERING_MSK \
+	(0xf << JPEG_V165_WE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V165_WE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V165_WE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xf << JPEG_V165_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V165_WE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V165_WE_CFG_MEMORY_FORMAT_MSK \
+	(0x3 << JPEG_V165_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V165_WE_CFG_CBCR_ORDER_MSK		BIT(12)
+#define JPEG_V165_WE_CFG_PLN0_EN_MSK		BIT(16)
+#define JPEG_V165_WE_CFG_PLN1_EN_MSK		BIT(17)
+#define JPEG_V165_WE_CFG_PLN2_EN_MSK		BIT(18)
+#define JPEG_V165_WE_CFG_MAL_BOUNDARY_MSK	BIT(24)
+#define JPEG_V165_WE_CFG_MAL_EN_MSK		BIT(27)
+#define JPEG_V165_WE_CFG_POP_BUFF_ON_EOS_MSK	BIT(28)
+
+#define JPEG_V165_PLN_WR_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V165_PLN_WR_BUFF_SIZE_WIDTH_MSK \
+	(0xffff << JPEG_V165_PLN_WR_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V165_PLN_WR_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V165_PLN_WR_BUFF_SIZE_HEIGHT_MSK \
+	(0xffff << JPEG_V165_PLN_WR_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V165_PLN_WR_STRIDE_STRIDE_POS 0
+#define JPEG_V165_PLN_WR_STRIDE_STRIDE_MSK \
+	(0xffff << JPEG_V165_PLN_WR_STRIDE_STRIDE_POS)
+
+#define JPEG_V165_PLN_WR_HINIT_INTEGER_POS 0
+#define JPEG_V165_PLN_WR_HINIT_INTEGER_MSK \
+	(0xffff << JPEG_V165_PLN_WR_HINIT_INTEGER_POS)
+
+#define JPEG_V165_PLN_WR_VINIT_INTEGER_POS 0
+#define JPEG_V165_PLN_WR_VINIT_INTEGER_MSK \
+	(0xffff << JPEG_V165_PLN_WR_VINIT_INTEGER_POS)
+
+#define JPEG_V165_PLN_WR_HSTEP_INTEGER_POS 0
+#define JPEG_V165_PLN_WR_HSTEP_INTEGER_MSK \
+	(0x1ffff << JPEG_V165_PLN_WR_HSTEP_INTEGER_POS)
+
+#define JPEG_V165_PLN_WR_VSTEP_INTEGER_POS 0
+#define JPEG_V165_PLN_WR_VSTEP_INTEGER_MSK \
+	(0x1ffff << JPEG_V165_PLN_WR_VSTEP_INTEGER_POS)
+
+#define JPEG_V165_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS 0
+#define JPEG_V165_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK \
+	(0xffff << JPEG_V165_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS)
+
+#define JPEG_V165_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS 16
+#define JPEG_V165_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK \
+	(0xffff << JPEG_V165_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS)
+
+#define JPEG_V165_ENC_CFG_IMAGE_FORMAT_POS 0
+#define JPEG_V165_ENC_CFG_IMAGE_FORMAT_MSK \
+	(0x7 << JPEG_V165_ENC_CFG_IMAGE_FORMAT_POS)
+
+#define JPEG_V165_ENC_CFG_APPLY_EOI_MSK		BIT(7)
+#define JPEG_V165_ENC_CFG_HUFFMAN_SEL_MSK	BIT(8)
+#define JPEG_V165_ENC_CFG_FSC_ENABLE_MSK	BIT(11)
+#define JPEG_V165_ENC_CFG_OUTPUT_DISABLE_MSK	BIT(15)
+#define JPEG_V165_ENC_CFG_RST_MARKER_PERIOD_MSK	BIT(16)
+
+#define JPEG_V165_ENC_IMG_SIZE_ENCODE_WIDTH_POS 0u
+#define JPEG_V165_ENC_IMG_SIZE_ENCODE_WIDTH_MSK \
+	(0x1fffu << JPEG_V165_ENC_IMG_SIZE_ENCODE_WIDTH_POS)
+
+#define JPEG_V165_ENC_IMG_SIZE_ENCODE_HEIGHT_POS 16u
+#define JPEG_V165_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK \
+	(0x1fffu << JPEG_V165_ENC_IMG_SIZE_ENCODE_HEIGHT_POS)
+
+#define JPEG_V165_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS 0
+#define JPEG_V165_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_MSK \
+	(0x1fffffff << JPEG_V165_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS)
+
+#define JPEG_V165_SCALE_CFG_HSCALE_ENABLE_MSK		BIT(4)
+#define JPEG_V165_SCALE_CFG_VSCALE_ENABLE_MSK		BIT(5)
+#define JPEG_V165_SCALE_CFG_UPSAMPLE_EN_MSK		BIT(6)
+#define JPEG_V165_SCALE_CFG_SUBSAMPLE_EN_MSK		BIT(7)
+#define JPEG_V165_SCALE_CFG_HSCALE_ALGO_MSK		BIT(8)
+#define JPEG_V165_SCALE_CFG_VSCALE_ALGO_MSK		BIT(9)
+
+#define JPEG_V165_SCALE_CFG_H_SCALE_FIR_ALGO_POS  12u
+#define JPEG_V165_SCALE_CFG_H_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V165_SCALE_CFG_H_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V165_SCALE_CFG_V_SCALE_FIR_ALGO_POS  16u
+#define JPEG_V165_SCALE_CFG_V_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V165_SCALE_CFG_V_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V165_SCALE_OUT_CFG_BLOCK_WIDTH_POS 0
+#define JPEG_V165_SCALE_OUT_CFG_BLOCK_WIDTH_MSK \
+	(0xff << JPEG_V165_SCALE_OUT_CFG_BLOCK_WIDTH_POS)
+
+#define JPEG_V165_SCALE_OUT_CFG_BLOCK_HEIGHT_POS 16
+#define JPEG_V165_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK \
+	(0xf << JPEG_V165_SCALE_OUT_CFG_BLOCK_HEIGHT_POS)
+
+#define JPEG_V165_SCALE_PLN_HSTEP_FRACTIONAL_POS 0
+#define JPEG_V165_SCALE_PLN_HSTEP_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V165_SCALE_PLN_HSTEP_FRACTIONAL_POS)
+
+#define JPEG_V165_SCALE_PLN_HSTEP_INTEGER_POS 21
+#define JPEG_V165_SCALE_PLN_HSTEP_INTEGER_MSK \
+	(0x3f << JPEG_V165_SCALE_PLN_HSTEP_INTEGER_POS)
+
+#define JPEG_V165_SCALE_PLN_VSTEP_FRACTIONAL_POS 0
+#define JPEG_V165_SCALE_PLN_VSTEP_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V165_SCALE_PLN_VSTEP_FRACTIONAL_POS)
+
+#define JPEG_V165_SCALE_PLN_VSTEP_INTEGER_POS 21
+#define JPEG_V165_SCALE_PLN_VSTEP_INTEGER_MSK \
+	(0x3f << JPEG_V165_SCALE_PLN_VSTEP_INTEGER_POS)
+
+#define JPEG_V165_DMI_CFG_MEM_SEL_POS 0
+#define JPEG_V165_DMI_CFG_MEM_SEL_MSK \
+	(0x7 << JPEG_V165_DMI_CFG_MEM_SEL_POS)
+
+#define JPEG_V165_DMI_CFG_AUTO_INC_EN_MSK	BIT(4)
+
+#define JPEG_V165_DMI_ADDR_ADDR_POS 0
+#define JPEG_V165_DMI_ADDR_ADDR_MSK \
+	(0x3ff << JPEG_V165_DMI_ADDR_ADDR_POS)
+
+#define JPEG_V165_TESTBUS_CFG_BUS_SEL_POS 0
+#define JPEG_V165_TESTBUS_CFG_BUS_SEL_MSK \
+	(0x3f << JPEG_V165_TESTBUS_CFG_BUS_SEL_POS)
+
+#define JPEG_V165_FE_VBPAD_CFG_BLOCK_ROW_POS 0
+#define JPEG_V165_FE_VBPAD_CFG_BLOCK_ROW_MSK \
+	(0x1fff << JPEG_V165_FE_VBPAD_CFG_BLOCK_ROW_POS)
+
+#define JPEG_V165_PLN_RD_HINIT_INT_INTEGER_POS 0
+#define JPEG_V165_PLN_RD_HINIT_INT_INTEGER_MSK \
+	(0x1ffff << JPEG_V165_PLN_RD_HINIT_INT_INTEGER_POS)
+
+#define JPEG_V165_PLN_RD_VINIT_INT_INTEGER_POS 0
+#define JPEG_V165_PLN_RD_VINIT_INT_INTEGER_MSK \
+	(0x1ffff << JPEG_V165_PLN_RD_VINIT_INT_INTEGER_POS)
+
+#define JPEG_V165_IRQ_STATUS_SESSION_DONE_MSK		BIT(0)
+#define JPEG_V165_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	BIT(4)
+#define JPEG_V165_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	BIT(5)
+#define JPEG_V165_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK	BIT(6)
+#define JPEG_V165_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	BIT(7)
+#define JPEG_V165_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	BIT(8)
+#define JPEG_V165_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK	BIT(9)
+#define JPEG_V165_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	BIT(10)
+#define JPEG_V165_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	BIT(11)
+#define JPEG_V165_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK	BIT(12)
+#define JPEG_V165_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	BIT(13)
+#define JPEG_V165_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	BIT(14)
+#define JPEG_V165_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK	BIT(15)
+#define JPEG_V165_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	BIT(19)
+#define JPEG_V165_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	BIT(20)
+#define JPEG_V165_IRQ_STATUS_DCD_COEFF_ERROR_MSK	BIT(21)
+#define JPEG_V165_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	BIT(22)
+#define JPEG_V165_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	BIT(23)
+#define JPEG_V165_IRQ_STATUS_DCD_INVALID_RSM_MSK	BIT(24)
+#define JPEG_V165_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	BIT(25)
+#define JPEG_V165_IRQ_STATUS_DCD_MISSING_RSM_MSK	BIT(26)
+#define JPEG_V165_IRQ_STATUS_STOP_ACK_MSK		BIT(27)
+#define JPEG_V165_IRQ_STATUS_RESET_ACK_MSK		BIT(28)
+
+#define JPEG_V165_IRQ_STATUS_ENABLE_ALL_MSK		~0
+#define JPEG_V165_IRQ_STATUS_DISABLE_ALL_MSK		0
+#define JPEG_V165_IRQ_STATUS_CLEAR_ALL_MSK		JPEG_V165_IRQ_STATUS_ENABLE_ALL_MSK
+
+const u32 qcom_v165_jpeg_hw_reg_mask[] = {
+	[JMSK_HW_VER_STEP]			= JPEG_V165_HW_VER_STEP_MSK,
+	[JMSK_HW_VER_MINOR]			= JPEG_V165_HW_VER_MINOR_MSK,
+	[JMSK_HW_VER_MAJOR]			= JPEG_V165_HW_VER_MAJOR_MSK,
+
+	[JMSK_HW_CAP_ENCODE]			= JPEG_V165_HW_CAP_ENCODE_MSK,
+	[JMSK_HW_CAP_DECODE]			= JPEG_V165_HW_CAP_DECODE_MSK,
+	[JMSK_HW_CAP_UPSCALE]			= JPEG_V165_HW_CAP_UPSCALE_MSK,
+	[JMSK_HW_CAP_DOWNSCALE]		= JPEG_V165_HW_CAP_DOWNSCALE_MSK,
+
+	[JMSK_RST_CMD_COMMON]			=
+		(JPEG_V165_RST_CMD_FE_RESET_MSK			|
+		 JPEG_V165_RST_CMD_WE_RESET_MSK			|
+		 JPEG_V165_RST_CMD_ENCODER_RESET_MSK		|
+		 JPEG_V165_RST_CMD_BLOCK_FORMATTER_RST_MSK	|
+		 JPEG_V165_RST_CMD_SCALE_RESET_MSK		|
+		 JPEG_V165_RST_CMD_REGISTER_RESET_MSK		|
+		 JPEG_V165_RST_CMD_MISR_RESET_MSK		|
+		 JPEG_V165_RST_CMD_CORE_RESET_MSK		|
+		 JPEG_V165_RST_CMD_JPEG_V165_DOMAIN_RESET_MSK),
+
+	[JMSK_RST_CMD_FE_RESET]			= JPEG_V165_RST_CMD_FE_RESET_MSK,
+	[JMSK_RST_CMD_WE_RESET]			= JPEG_V165_RST_CMD_WE_RESET_MSK,
+	[JMSK_RST_CMD_ENCODER_RESET]		= JPEG_V165_RST_CMD_ENCODER_RESET_MSK,
+	[JMSK_RST_CMD_DECODER_RESET]		= JPEG_V165_RST_CMD_DECODER_RESET_MSK,
+	[JMSK_RST_CMD_BLOCK_FORMATTER_RST]	= JPEG_V165_RST_CMD_BLOCK_FORMATTER_RST_MSK,
+	[JMSK_RST_CMD_SCALE_RESET]		= JPEG_V165_RST_CMD_SCALE_RESET_MSK,
+	[JMSK_RST_CMD_REGISTER_RESET]		= JPEG_V165_RST_CMD_REGISTER_RESET_MSK,
+	[JMSK_RST_CMD_MISR_RESET]		= JPEG_V165_RST_CMD_MISR_RESET_MSK,
+	[JMSK_RST_CMD_CORE_RESET]		= JPEG_V165_RST_CMD_CORE_RESET_MSK,
+	[JMSK_RST_CMD_JMSK_DOMAIN_RESET]	= JPEG_V165_RST_CMD_JPEG_V165_DOMAIN_RESET_MSK,
+	[JMSK_RST_CMD_RESET_BYPASS]		= JPEG_V165_RST_CMD_RESET_BYPASS_MSK,
+
+	[JMSK_CORE_CFG_FE_ENABLE]		= JPEG_V165_CORE_CFG_FE_ENABLE_MSK,
+	[JMSK_CORE_CFG_WE_ENABLE]		= JPEG_V165_CORE_CFG_WE_ENABLE_MSK,
+	[JMSK_CORE_CFG_ENC_ENABLE]		= JPEG_V165_CORE_CFG_ENC_ENABLE_MSK,
+	[JMSK_CORE_CFG_SCALE_ENABLE]		= JPEG_V165_CORE_CFG_SCALE_ENABLE_MSK,
+	[JMSK_CORE_CFG_TESTBUS_ENABLE]		= JPEG_V165_CORE_CFG_TESTBUS_ENABLE_MSK,
+	[JMSK_CORE_CFG_MODE]			= JPEG_V165_CORE_CFG_ENC_ENABLE_MSK,
+	[JMSK_CORE_CFG_CGC_DISABLE]		= JPEG_V165_CORE_CFG_CGC_DISABLE_MSK,
+
+	[JMSK_CMD_HW_START]			= JPEG_V165_CMD_HW_START_MSK,
+	[JMSK_CMD_HW_STOP]			= JPEG_V165_CMD_HW_STOP_MSK,
+
+	[JMSK_CMD_CLR_RD_PLNS_QUEUE]		=
+		(JPEG_V165_CMD_CLR_RD_PLN0_QUEUE_MSK |
+		 JPEG_V165_CMD_CLR_RD_PLN1_QUEUE_MSK |
+		 JPEG_V165_CMD_CLR_RD_PLN2_QUEUE_MSK),
+	[JMSK_CMD_CLR_WR_PLNS_QUEUE]		=
+		(JPEG_V165_CMD_CLR_WR_PLN0_QUEUE_MSK |
+		 JPEG_V165_CMD_CLR_WR_PLN1_QUEUE_MSK |
+		 JPEG_V165_CMD_CLR_WR_PLN2_QUEUE_MSK),
+
+	[JMSK_CMD_APPLY_SWC_RD_PARAMS]	= JPEG_V165_CMD_APPLY_SWC_RD_PARAMS_MSK,
+
+	[JMSK_CORE_STATUS_ENCODE_STATE]	= JPEG_V165_CORE_STATE_STATUS_ENCODE_STATE_MSK,
+	[JMSK_CORE_STATUS_SCALE_STATE]	= JPEG_V165_CORE_STATE_STATUS_SCALE_STATE_MSK,
+	[JMSK_CORE_STATUS_RT_STATE]	= JPEG_V165_CORE_STATE_STATUS_REALTIME_STATE_MSK,
+	[JMSK_CORE_STATUS_BUS_STATE]	= JPEG_V165_CORE_STATE_STATUS_BUS_STATE_MSK,
+	[JMSK_CORE_STATUS_CGC_STATE]	= JPEG_V165_CORE_STATE_STATUS_CGC_STATE_MSK,
+
+	[JMSK_IRQ_ENABLE_ALL]		= JPEG_V165_IRQ_STATUS_ENABLE_ALL_MSK,
+	[JMSK_IRQ_DISABLE_ALL]		= JPEG_V165_IRQ_STATUS_DISABLE_ALL_MSK,
+	[JMSK_IRQ_CLEAR_ALL]		= JPEG_V165_IRQ_STATUS_CLEAR_ALL_MSK,
+
+	[JMSK_IRQ_STATUS_SESSION_DONE]	= JPEG_V165_IRQ_STATUS_SESSION_DONE_MSK,
+
+	[JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE]	= JPEG_V165_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE]	= JPEG_V165_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE]	= JPEG_V165_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN]	=
+		(JPEG_V165_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	|
+		 JPEG_V165_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	|
+		 JPEG_V165_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK),
+
+	[JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE]	= JPEG_V165_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE]	= JPEG_V165_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE]	= JPEG_V165_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN]	=
+		(JPEG_V165_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	|
+		 JPEG_V165_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	|
+		 JPEG_V165_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK),
+
+	[JMSK_IRQ_STATUS_SESSION_ERROR]	=
+		(JPEG_V165_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	|
+		 JPEG_V165_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	|
+		 JPEG_V165_IRQ_STATUS_DCD_COEFF_ERROR_MSK	|
+		 JPEG_V165_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	|
+		 JPEG_V165_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	|
+		 JPEG_V165_IRQ_STATUS_DCD_INVALID_RSM_MSK	|
+		 JPEG_V165_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	|
+		 JPEG_V165_IRQ_STATUS_DCD_MISSING_RSM_MSK),
+
+	[JMSK_IRQ_STATUS_STOP_ACK]		= JPEG_V165_IRQ_STATUS_STOP_ACK_MSK,
+	[JMSK_IRQ_STATUS_RESET_ACK]		= JPEG_V165_IRQ_STATUS_RESET_ACK_MSK,
+
+	[JMSK_FE_CFG_BYTE_ORDERING]		= JPEG_V165_FE_CFG_BYTE_ORDERING_MSK,
+	[JMSK_FE_CFG_BURST_LENGTH_MAX]	= JPEG_V165_FE_CFG_BURST_LENGTH_MAX_MSK,
+	[JMSK_FE_CFG_MEMORY_FORMAT]		= JPEG_V165_FE_CFG_MEMORY_FORMAT_MSK,
+	[JMSK_FE_CFG_CBCR_ORDER]		= JPEG_V165_FE_CFG_CBCR_ORDER_MSK,
+	[JMSK_FE_CFG_BOTTOM_VPAD_EN]		= JPEG_V165_FE_CFG_BOTTOM_VPAD_EN_MSK,
+	[JMSK_FE_CFG_PLN0_EN]			= JPEG_V165_FE_CFG_PLN0_EN_MSK,
+	[JMSK_FE_CFG_PLN1_EN]			= JPEG_V165_FE_CFG_PLN1_EN_MSK,
+	[JMSK_FE_CFG_PLN2_EN]			= JPEG_V165_FE_CFG_PLN2_EN_MSK,
+	[JMSK_FE_CFG_SIXTEEN_MCU_EN]		= JPEG_V165_FE_CFG_SIXTEEN_MCU_EN_MSK,
+	[JMSK_FE_CFG_MCUS_PER_BLOCK]		= JPEG_V165_FE_CFG_MCUS_PER_BLOCK_MSK,
+	[JMSK_FE_CFG_MAL_BOUNDARY]		= JPEG_V165_FE_CFG_MAL_BOUNDARY_MSK,
+	[JMSK_FE_CFG_MAL_EN]			= JPEG_V165_FE_CFG_MAL_EN_MSK,
+
+	[JMSK_FE_VBPAD_CFG_BLOCK_ROW]		= JPEG_V165_FE_VBPAD_CFG_BLOCK_ROW_MSK,
+
+	[JMSK_PLNS_RD_OFFSET]			= JPEG_V165_PLN_RD_OFFS_OFFSET_MSK,
+	[JMSK_PLNS_RD_BUF_SIZE_WIDTH]	= JPEG_V165_PLN_RD_BUFF_SIZE_WIDTH_MSK,
+	[JMSK_PLNS_RD_BUF_SIZE_HEIGHT]	= JPEG_V165_PLN_RD_BUFF_SIZE_HEIGHT_MSK,
+	[JMSK_PLNS_RD_STRIDE]			= JPEG_V165_PLN_RD_STRIDE_STRIDE_MSK,
+	[JMSK_PLNS_RD_HINIT]			= JPEG_V165_PLN_RD_HINIT_FRACTIONAL_MSK,
+	[JMSK_PLNS_RD_VINIT]			= JPEG_V165_PLN_RD_VINIT_FRACTIONAL_MSK,
+
+	[JMSK_WE_CFG_BYTE_ORDERING]		= JPEG_V165_WE_CFG_BYTE_ORDERING_MSK,
+	[JMSK_WE_CFG_BURST_LENGTH_MAX]	= JPEG_V165_WE_CFG_BURST_LENGTH_MAX_MSK,
+	[JMSK_WE_CFG_MEMORY_FORMAT]		= JPEG_V165_WE_CFG_MEMORY_FORMAT_MSK,
+	[JMSK_WE_CFG_CBCR_ORDER]		= JPEG_V165_WE_CFG_CBCR_ORDER_MSK,
+	[JMSK_WE_CFG_PLN0_EN]			= JPEG_V165_WE_CFG_PLN0_EN_MSK,
+	[JMSK_WE_CFG_PLN1_EN]			= JPEG_V165_WE_CFG_PLN1_EN_MSK,
+	[JMSK_WE_CFG_PLN2_EN]			= JPEG_V165_WE_CFG_PLN2_EN_MSK,
+	[JMSK_WE_CFG_MAL_BOUNDARY]		= JPEG_V165_WE_CFG_MAL_BOUNDARY_MSK,
+	[JMSK_WE_CFG_MAL_EN]			= JPEG_V165_WE_CFG_MAL_EN_MSK,
+	[JMSK_WE_CFG_POP_BUFF_ON_EOS]		= JPEG_V165_WE_CFG_POP_BUFF_ON_EOS_MSK,
+
+	[JMSK_PLNS_WR_BUF_SIZE_WIDTH]	= JPEG_V165_PLN_WR_BUFF_SIZE_WIDTH_MSK,
+	[JMSK_PLNS_WR_BUF_SIZE_HEIGHT]	= JPEG_V165_PLN_WR_BUFF_SIZE_HEIGHT_MSK,
+
+	[JMSK_PLNS_WR_STRIDE]			= JPEG_V165_PLN_WR_STRIDE_STRIDE_MSK,
+	[JMSK_PLNS_WR_HINIT]			= JPEG_V165_PLN_WR_HINIT_INTEGER_MSK,
+	[JMSK_PLNS_WR_VINIT]			= JPEG_V165_PLN_WR_VINIT_INTEGER_MSK,
+	[JMSK_PLNS_WR_HSTEP]			= JPEG_V165_PLN_WR_HSTEP_INTEGER_MSK,
+	[JMSK_PLNS_WR_VSTEP]			= JPEG_V165_PLN_WR_VSTEP_INTEGER_MSK,
+
+	[JMSK_PLNS_WR_BLOCK_CFG_PER_COL]	= JPEG_V165_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK,
+	[JMSK_PLNS_WR_BLOCK_CFG_PER_RAW]	= JPEG_V165_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK,
+
+	[JMSK_SCALE_CFG_HSCALE_ENABLE]	= JPEG_V165_SCALE_CFG_HSCALE_ENABLE_MSK,
+	[JMSK_SCALE_CFG_VSCALE_ENABLE]	= JPEG_V165_SCALE_CFG_VSCALE_ENABLE_MSK,
+	[JMSK_SCALE_CFG_UPSAMPLE_EN]		= JPEG_V165_SCALE_CFG_UPSAMPLE_EN_MSK,
+	[JMSK_SCALE_CFG_SUBSAMPLE_EN]		= JPEG_V165_SCALE_CFG_SUBSAMPLE_EN_MSK,
+	[JMSK_SCALE_CFG_HSCALE_ALGO]		= JPEG_V165_SCALE_CFG_HSCALE_ALGO_MSK,
+	[JMSK_SCALE_CFG_VSCALE_ALGO]		= JPEG_V165_SCALE_CFG_VSCALE_ALGO_MSK,
+	[JMSK_SCALE_CFG_H_SCALE_FIR_ALGO]	= JPEG_V165_SCALE_CFG_H_SCALE_FIR_ALGO_MSK,
+	[JMSK_SCALE_CFG_V_SCALE_FIR_ALGO]	= JPEG_V165_SCALE_CFG_V_SCALE_FIR_ALGO_MSK,
+
+	[JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH]	= JPEG_V165_SCALE_OUT_CFG_BLOCK_WIDTH_MSK,
+	[JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT]	= JPEG_V165_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK,
+
+	[JMSK_SCALE_PLNS_HSTEP_FRACTIONAL]	= JPEG_V165_SCALE_PLN_HSTEP_FRACTIONAL_MSK,
+	[JMSK_SCALE_PLNS_HSTEP_INTEGER]	= JPEG_V165_SCALE_PLN_HSTEP_INTEGER_MSK,
+	[JMSK_SCALE_PLNS_VSTEP_FRACTIONAL]	= JPEG_V165_SCALE_PLN_VSTEP_FRACTIONAL_MSK,
+	[JMSK_SCALE_PLNS_VSTEP_INTEGER]	= JPEG_V165_SCALE_PLN_VSTEP_INTEGER_MSK,
+
+	[JMSK_ENC_CFG_IMAGE_FORMAT]		= JPEG_V165_ENC_CFG_IMAGE_FORMAT_MSK,
+	[JMSK_ENC_CFG_APPLY_EOI]		= JPEG_V165_ENC_CFG_APPLY_EOI_MSK,
+	[JMSK_ENC_CFG_HUFFMAN_SEL]		= JPEG_V165_ENC_CFG_HUFFMAN_SEL_MSK,
+	[JMSK_ENC_CFG_FSC_ENABLE]		= JPEG_V165_ENC_CFG_FSC_ENABLE_MSK,
+	[JMSK_ENC_CFG_OUTPUT_DISABLE]		= JPEG_V165_ENC_CFG_OUTPUT_DISABLE_MSK,
+	[JMSK_ENC_CFG_RST_MARKER_PERIOD]	= JPEG_V165_ENC_CFG_RST_MARKER_PERIOD_MSK,
+	[JMSK_ENC_IMAGE_SIZE_WIDTH]		= JPEG_V165_ENC_IMG_SIZE_ENCODE_WIDTH_MSK,
+	[JMSK_ENC_IMAGE_SIZE_HEIGHT]		= JPEG_V165_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK,
+};
+
+const struct qcom_jpeg_reg_offs qcom_v165_jpeg_hw_reg_offs = {
+	.hw_version	= 0x000,
+	.hw_capability	= 0x004,
+	.reset_cmd	= 0x008,
+	.core_cfg	= 0x00c,
+	.hw_cmd		= 0x010,
+	.int_mask	= 0x018,
+	.int_clr	= 0x01c,
+	.int_status	= 0x020,
+	.enc_core_state = 0x014,
+
+	.fe = {
+		.pntr	= { 0x038, 0x044, 0x050 },
+		.offs	= { 0x03c, 0x048, 0x054 },
+		.cnsmd	= { 0x040, 0x04c, 0x058 },
+		.bsize	= { 0x060, 0x068, 0x070 },
+		.stride	= { 0x064, 0x06c, 0x08c },
+		.hinit	= { 0x074, 0x078, 0x07c },
+		.vinit	= { 0x080, 0x084, 0x088 },
+		.pntr_cnt	= 0x05c,
+		.vbpad_cfg	= 0x2e8
+	},
+	.fe_cfg	= 0x024,
+
+	.we = {
+		.pntr	= { 0x0cc, 0x0d0, 0x0d4 },
+		.cnsmd	= { 0x0d8, 0x0dc, 0x0e0 },
+		.bsize	= { 0x0e8, 0x0ec, 0x0f0 },
+		.stride	= { 0x0f4, 0x0f8, 0x0fc },
+		.hinit	= { 0x100, 0x104, 0x108 },
+		.hstep	= { 0x118, 0x11c, 0x120 },
+		.vinit	= { 0x10c, 0x110, 0x114 },
+		.vstep	= { 0x124, 0x128, 0x12c },
+		.blocks	= { 0x130, 0x134, 0x138 },
+		.pntr_cnt = 0x0e4
+	},
+	.we_cfg	= 0x0c0,
+
+	.scale = {
+		.hstep	= { 0x27c, 0x280, 0x284 },
+		.vstep	= { 0x28c, 0x290, 0x294 },
+	},
+	.scale_cfg	= 0x26c,
+	.scale_out_cfg	= { 0x270, 0x274, 0x278 },
+
+	.enc_cfg	= 0x13c,
+	.enc_img_size	= 0x140,
+	.enc_out_size	= 0x180,
+
+	.dmi_cfg	= 0x298,
+	.dmi_data	= 0x2a0,
+	.dmi_addr	= 0x29c,
+};
+
+#endif /* QCOM_JENC_HW_INFO_V165_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_v580_jenc_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_v580_jenc_hw_info.h
new file mode 100644
index 000000000000..2fb779530c6c
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_v580_jenc_hw_info.h
@@ -0,0 +1,509 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_HW_INFO_V580_H
+#define QCOM_JENC_HW_INFO_V580_H
+
+#include "qcom_jenc_defs.h"
+
+#define JPEG_V580_HW_VER_STEP_POS 0
+#define JPEG_V580_HW_VER_STEP_MSK \
+	(0xffff << JPEG_V580_HW_VER_STEP_POS)
+
+#define JPEG_V580_HW_VER_MINOR_POS 16
+#define JPEG_V580_HW_VER_MINOR_MSK \
+	(0x0fff << JPEG_V580_HW_VER_MINOR_POS)
+
+#define JPEG_V580_HW_VER_MAJOR_POS 28
+#define JPEG_V580_HW_VER_MAJOR_MSK \
+	(0xf << JPEG_V580_HW_VER_MAJOR_POS)
+
+#define JPEG_V580_HW_CAP_ENCODE_MSK BIT(0)
+#define JPEG_V580_HW_CAP_DECODE_MSK BIT(1)
+
+#define JPEG_V580_HW_CAP_UPSCALE_POS 4
+#define JPEG_V580_HW_CAP_UPSCALE_MSK \
+	(0x7 << JPEG_V580_HW_CAP_UPSCALE_POS)
+
+#define JPEG_V580_HW_CAP_DOWNSCALE_POS 8
+#define JPEG_V580_HW_CAP_DOWNSCALE_MSK \
+	(0x7 << JPEG_V580_HW_CAP_DOWNSCALE_POS)
+
+#define JPEG_V580_RST_CMD_FE_RESET_MSK			BIT(0)
+#define JPEG_V580_RST_CMD_WE_RESET_MSK			BIT(1)
+#define JPEG_V580_RST_CMD_ENCODER_RESET_MSK		BIT(4)
+#define JPEG_V580_RST_CMD_DECODER_RESET_MSK		BIT(5)
+#define JPEG_V580_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT(6)
+#define JPEG_V580_RST_CMD_SCALE_RESET_MSK		BIT(7)
+#define JPEG_V580_RST_CMD_REGISTER_RESET_MSK		BIT(13)
+#define JPEG_V580_RST_CMD_MISR_RESET_MSK		BIT(16)
+#define JPEG_V580_RST_CMD_CORE_RESET_MSK		BIT(17)
+#define JPEG_V580_RST_CMD_JPEG_V580_DOMAIN_RESET_MSK	BIT(29)
+#define JPEG_V580_RST_CMD_RESET_BYPASS_MSK		BIT(31)
+
+#define JPEG_V580_CORE_CFG_FE_ENABLE_MSK	BIT(0)
+#define JPEG_V580_CORE_CFG_WE_ENABLE_MSK	BIT(1)
+#define JPEG_V580_CORE_CFG_ENC_ENABLE_MSK	BIT(4)
+#define JPEG_V580_CORE_CFG_SCALE_ENABLE_MSK	BIT(7)
+#define JPEG_V580_CORE_CFG_TESTBUS_ENABLE_MSK	BIT(19)
+#define JPEG_V580_CORE_CFG_MODE_MSK		BIT(24)
+#define JPEG_V580_CORE_CFG_CGC_DISABLE_MSK	BIT(31)
+
+#define JPEG_V580_CMD_HW_START_MSK		BIT(0)
+#define JPEG_V580_CMD_HW_STOP_MSK		BIT(1)
+#define JPEG_V580_CMD_CLR_RD_PLN0_QUEUE_MSK	BIT(4)
+#define JPEG_V580_CMD_CLR_RD_PLN1_QUEUE_MSK	BIT(5)
+#define JPEG_V580_CMD_CLR_RD_PLN2_QUEUE_MSK	BIT(6)
+#define JPEG_V580_CMD_CLR_WR_PLN0_QUEUE_MSK	BIT(8)
+#define JPEG_V580_CMD_CLR_WR_PLN1_QUEUE_MSK	BIT(9)
+#define JPEG_V580_CMD_CLR_WR_PLN2_QUEUE_MSK	BIT(10)
+#define JPEG_V580_CMD_APPLY_SWC_RD_PARAMS_MSK	BIT(11)
+
+#define JPEG_V580_CORE_STATE_STATUS_ENCODE_STATE_MSK	BIT(0)
+#define JPEG_V580_CORE_STATE_STATUS_SCALE_STATE_MSK	BIT(2)
+#define JPEG_V580_CORE_STATE_STATUS_REALTIME_STATE_MSK	BIT(4)
+#define JPEG_V580_CORE_STATE_STATUS_BUS_STATE_MSK	BIT(8)
+#define JPEG_V580_CORE_STATE_STATUS_CGC_STATE_MSK	BIT(9)
+
+#define JPEG_V580_FE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V580_FE_CFG_BYTE_ORDERING_MSK \
+	(0xf << JPEG_V580_FE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V580_FE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V580_FE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xf << JPEG_V580_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V580_FE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V580_FE_CFG_MEMORY_FORMAT_MSK \
+	(0x3 << JPEG_V580_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V580_FE_CFG_CBCR_ORDER_MSK		BIT(12)
+#define JPEG_V580_FE_CFG_BOTTOM_VPAD_EN_MSK	BIT(13)
+#define JPEG_V580_FE_CFG_PLN0_EN_MSK		BIT(16)
+#define JPEG_V580_FE_CFG_PLN1_EN_MSK		BIT(17)
+#define JPEG_V580_FE_CFG_PLN2_EN_MSK		BIT(18)
+#define JPEG_V580_FE_CFG_SIXTEEN_MCU_EN_MSK	BIT(21)
+#define JPEG_V580_FE_CFG_MCUS_PER_BLOCK_MSK	BIT(22)
+#define JPEG_V580_FE_CFG_MAL_BOUNDARY_MSK	BIT(24)
+#define JPEG_V580_FE_CFG_MAL_EN_MSK		BIT(27)
+
+#define JPEG_V580_PLN_RD_OFFS_OFFSET_POS 0
+#define JPEG_V580_PLN_RD_OFFS_OFFSET_MSK \
+	(0x1fffffff << JPEG_V580_PLN_RD_OFFS_OFFSET_POS)
+
+#define JPEG_V580_PLN_RD_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V580_PLN_RD_BUFF_SIZE_WIDTH_MSK \
+	(0xffff << JPEG_V580_PLN_RD_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V580_PLN_RD_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V580_PLN_RD_BUFF_SIZE_HEIGHT_MSK \
+	(0xffff << JPEG_V580_PLN_RD_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V580_PLN_RD_STRIDE_STRIDE_POS 0
+#define JPEG_V580_PLN_RD_STRIDE_STRIDE_MSK \
+	(0xffff << JPEG_V580_PLN_RD_STRIDE_STRIDE_POS)
+
+#define JPEG_V580_PLN_RD_HINIT_FRACTIONAL_POS 0
+#define JPEG_V580_PLN_RD_HINIT_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V580_PLN_RD_HINIT_FRACTIONAL_POS)
+
+#define JPEG_V580_PLN_RD_VINIT_FRACTIONAL_POS 0
+#define JPEG_V580_PLN_RD_VINIT_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V580_PLN_RD_VINIT_FRACTIONAL_POS)
+
+#define JPEG_V580_WE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V580_WE_CFG_BYTE_ORDERING_MSK \
+	(0xf << JPEG_V580_WE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V580_WE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V580_WE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xf << JPEG_V580_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V580_WE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V580_WE_CFG_MEMORY_FORMAT_MSK \
+	(0x3 << JPEG_V580_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V580_WE_CFG_CBCR_ORDER_MSK		BIT(12)
+#define JPEG_V580_WE_CFG_PLN0_EN_MSK		BIT(16)
+#define JPEG_V580_WE_CFG_PLN1_EN_MSK		BIT(17)
+#define JPEG_V580_WE_CFG_PLN2_EN_MSK		BIT(18)
+#define JPEG_V580_WE_CFG_MAL_BOUNDARY_MSK	BIT(24)
+#define JPEG_V580_WE_CFG_MAL_EN_MSK		BIT(27)
+#define JPEG_V580_WE_CFG_POP_BUFF_ON_EOS_MSK	BIT(28)
+
+#define JPEG_V580_PLN_WR_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V580_PLN_WR_BUFF_SIZE_WIDTH_MSK \
+	(0xffff << JPEG_V580_PLN_WR_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V580_PLN_WR_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V580_PLN_WR_BUFF_SIZE_HEIGHT_MSK \
+	(0xffff << JPEG_V580_PLN_WR_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V580_PLN_WR_STRIDE_STRIDE_POS 0
+#define JPEG_V580_PLN_WR_STRIDE_STRIDE_MSK \
+	(0xffff << JPEG_V580_PLN_WR_STRIDE_STRIDE_POS)
+
+#define JPEG_V580_PLN_WR_HINIT_INTEGER_POS 0
+#define JPEG_V580_PLN_WR_HINIT_INTEGER_MSK \
+	(0xffff << JPEG_V580_PLN_WR_HINIT_INTEGER_POS)
+
+#define JPEG_V580_PLN_WR_VINIT_INTEGER_POS 0
+#define JPEG_V580_PLN_WR_VINIT_INTEGER_MSK \
+	(0xffff << JPEG_V580_PLN_WR_VINIT_INTEGER_POS)
+
+#define JPEG_V580_PLN_WR_HSTEP_INTEGER_POS 0
+#define JPEG_V580_PLN_WR_HSTEP_INTEGER_MSK \
+	(0x1ffff << JPEG_V580_PLN_WR_HSTEP_INTEGER_POS)
+
+#define JPEG_V580_PLN_WR_VSTEP_INTEGER_POS 0
+#define JPEG_V580_PLN_WR_VSTEP_INTEGER_MSK \
+	(0x1ffff << JPEG_V580_PLN_WR_VSTEP_INTEGER_POS)
+
+#define JPEG_V580_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS 0
+#define JPEG_V580_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK \
+	(0xffff << JPEG_V580_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS)
+
+#define JPEG_V580_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS 16
+#define JPEG_V580_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK \
+	(0xffff << JPEG_V580_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS)
+
+#define JPEG_V580_ENC_CFG_IMAGE_FORMAT_POS 0
+#define JPEG_V580_ENC_CFG_IMAGE_FORMAT_MSK \
+	(0x7 << JPEG_V580_ENC_CFG_IMAGE_FORMAT_POS)
+
+#define JPEG_V580_ENC_CFG_APPLY_EOI_MSK		BIT(7)
+#define JPEG_V580_ENC_CFG_HUFFMAN_SEL_MSK	BIT(8)
+#define JPEG_V580_ENC_CFG_FSC_ENABLE_MSK	BIT(11)
+#define JPEG_V580_ENC_CFG_OUTPUT_DISABLE_MSK	BIT(15)
+#define JPEG_V580_ENC_CFG_RST_MARKER_PERIOD_MSK	BIT(16)
+
+#define JPEG_V580_ENC_IMG_SIZE_ENCODE_WIDTH_POS 0u
+#define JPEG_V580_ENC_IMG_SIZE_ENCODE_WIDTH_MSK \
+	(0x1fffu << JPEG_V580_ENC_IMG_SIZE_ENCODE_WIDTH_POS)
+
+#define JPEG_V580_ENC_IMG_SIZE_ENCODE_HEIGHT_POS 16u
+#define JPEG_V580_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK \
+	(0x1fffu << JPEG_V580_ENC_IMG_SIZE_ENCODE_HEIGHT_POS)
+
+#define JPEG_V580_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS 0
+#define JPEG_V580_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_MSK \
+	(0x1fffffff << JPEG_V580_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS)
+
+#define JPEG_V580_SCALE_CFG_HSCALE_ENABLE_MSK		BIT(4)
+#define JPEG_V580_SCALE_CFG_VSCALE_ENABLE_MSK		BIT(5)
+#define JPEG_V580_SCALE_CFG_UPSAMPLE_EN_MSK		BIT(6)
+#define JPEG_V580_SCALE_CFG_SUBSAMPLE_EN_MSK		BIT(7)
+#define JPEG_V580_SCALE_CFG_HSCALE_ALGO_MSK		BIT(8)
+#define JPEG_V580_SCALE_CFG_VSCALE_ALGO_MSK		BIT(9)
+
+#define JPEG_V580_SCALE_CFG_H_SCALE_FIR_ALGO_POS  12u
+#define JPEG_V580_SCALE_CFG_H_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V580_SCALE_CFG_H_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V580_SCALE_CFG_V_SCALE_FIR_ALGO_POS  16u
+#define JPEG_V580_SCALE_CFG_V_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V580_SCALE_CFG_V_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V580_SCALE_OUT_CFG_BLOCK_WIDTH_POS 0
+#define JPEG_V580_SCALE_OUT_CFG_BLOCK_WIDTH_MSK \
+	(0xff << JPEG_V580_SCALE_OUT_CFG_BLOCK_WIDTH_POS)
+
+#define JPEG_V580_SCALE_OUT_CFG_BLOCK_HEIGHT_POS 16
+#define JPEG_V580_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK \
+	(0xf << JPEG_V580_SCALE_OUT_CFG_BLOCK_HEIGHT_POS)
+
+#define JPEG_V580_SCALE_PLN_HSTEP_FRACTIONAL_POS 0
+#define JPEG_V580_SCALE_PLN_HSTEP_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V580_SCALE_PLN_HSTEP_FRACTIONAL_POS)
+
+#define JPEG_V580_SCALE_PLN_HSTEP_INTEGER_POS 21
+#define JPEG_V580_SCALE_PLN_HSTEP_INTEGER_MSK \
+	(0x3f << JPEG_V580_SCALE_PLN_HSTEP_INTEGER_POS)
+
+#define JPEG_V580_SCALE_PLN_VSTEP_FRACTIONAL_POS 0
+#define JPEG_V580_SCALE_PLN_VSTEP_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V580_SCALE_PLN_VSTEP_FRACTIONAL_POS)
+
+#define JPEG_V580_SCALE_PLN_VSTEP_INTEGER_POS 21
+#define JPEG_V580_SCALE_PLN_VSTEP_INTEGER_MSK \
+	(0x3f << JPEG_V580_SCALE_PLN_VSTEP_INTEGER_POS)
+
+#define JPEG_V580_DMI_CFG_MEM_SEL_POS 0
+#define JPEG_V580_DMI_CFG_MEM_SEL_MSK \
+	(0x7 << JPEG_V580_DMI_CFG_MEM_SEL_POS)
+
+#define JPEG_V580_DMI_CFG_AUTO_INC_EN_MSK	BIT(4)
+
+#define JPEG_V580_DMI_ADDR_ADDR_POS 0
+#define JPEG_V580_DMI_ADDR_ADDR_MSK \
+	(0x3ff << JPEG_V580_DMI_ADDR_ADDR_POS)
+
+#define JPEG_V580_TESTBUS_CFG_BUS_SEL_POS 0
+#define JPEG_V580_TESTBUS_CFG_BUS_SEL_MSK \
+	(0x3f << JPEG_V580_TESTBUS_CFG_BUS_SEL_POS)
+
+#define JPEG_V580_FE_VBPAD_CFG_BLOCK_ROW_POS 0
+#define JPEG_V580_FE_VBPAD_CFG_BLOCK_ROW_MSK \
+	(0x1fff << JPEG_V580_FE_VBPAD_CFG_BLOCK_ROW_POS)
+
+#define JPEG_V580_PLN_RD_HINIT_INT_INTEGER_POS 0
+#define JPEG_V580_PLN_RD_HINIT_INT_INTEGER_MSK \
+	(0x1ffff << JPEG_V580_PLN_RD_HINIT_INT_INTEGER_POS)
+
+#define JPEG_V580_PLN_RD_VINIT_INT_INTEGER_POS 0
+#define JPEG_V580_PLN_RD_VINIT_INT_INTEGER_MSK \
+	(0x1ffff << JPEG_V580_PLN_RD_VINIT_INT_INTEGER_POS)
+
+#define JPEG_V580_IRQ_STATUS_SESSION_DONE_MSK		BIT(0)
+#define JPEG_V580_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	BIT(4)
+#define JPEG_V580_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	BIT(5)
+#define JPEG_V580_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK	BIT(6)
+#define JPEG_V580_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	BIT(7)
+#define JPEG_V580_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	BIT(8)
+#define JPEG_V580_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK	BIT(9)
+#define JPEG_V580_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	BIT(10)
+#define JPEG_V580_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	BIT(11)
+#define JPEG_V580_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK	BIT(12)
+#define JPEG_V580_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	BIT(13)
+#define JPEG_V580_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	BIT(14)
+#define JPEG_V580_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK	BIT(15)
+#define JPEG_V580_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	BIT(19)
+#define JPEG_V580_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	BIT(20)
+#define JPEG_V580_IRQ_STATUS_DCD_COEFF_ERROR_MSK	BIT(21)
+#define JPEG_V580_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	BIT(22)
+#define JPEG_V580_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	BIT(23)
+#define JPEG_V580_IRQ_STATUS_DCD_INVALID_RSM_MSK	BIT(24)
+#define JPEG_V580_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	BIT(25)
+#define JPEG_V580_IRQ_STATUS_DCD_MISSING_RSM_MSK	BIT(26)
+#define JPEG_V580_IRQ_STATUS_STOP_ACK_MSK		BIT(27)
+#define JPEG_V580_IRQ_STATUS_RESET_ACK_MSK		BIT(28)
+
+#define JPEG_V580_IRQ_STATUS_ENABLE_ALL_MSK		~0
+#define JPEG_V580_IRQ_STATUS_DISABLE_ALL_MSK		0
+#define JPEG_V580_IRQ_STATUS_CLEAR_ALL_MSK		JPEG_V580_IRQ_STATUS_ENABLE_ALL_MSK
+
+const u32 qcom_v580_jpeg_hw_reg_mask[] = {
+	[JMSK_HW_VER_STEP]			= JPEG_V580_HW_VER_STEP_MSK,
+	[JMSK_HW_VER_MINOR]			= JPEG_V580_HW_VER_MINOR_MSK,
+	[JMSK_HW_VER_MAJOR]			= JPEG_V580_HW_VER_MAJOR_MSK,
+
+	[JMSK_HW_CAP_ENCODE]			= JPEG_V580_HW_CAP_ENCODE_MSK,
+	[JMSK_HW_CAP_DECODE]			= JPEG_V580_HW_CAP_DECODE_MSK,
+	[JMSK_HW_CAP_UPSCALE]			= JPEG_V580_HW_CAP_UPSCALE_MSK,
+	[JMSK_HW_CAP_DOWNSCALE]		= JPEG_V580_HW_CAP_DOWNSCALE_MSK,
+
+	[JMSK_RST_CMD_COMMON]			=
+		(JPEG_V580_RST_CMD_FE_RESET_MSK			|
+		 JPEG_V580_RST_CMD_WE_RESET_MSK			|
+		 JPEG_V580_RST_CMD_ENCODER_RESET_MSK		|
+		 JPEG_V580_RST_CMD_BLOCK_FORMATTER_RST_MSK	|
+		 JPEG_V580_RST_CMD_SCALE_RESET_MSK		|
+		 JPEG_V580_RST_CMD_REGISTER_RESET_MSK		|
+		 JPEG_V580_RST_CMD_MISR_RESET_MSK		|
+		 JPEG_V580_RST_CMD_CORE_RESET_MSK		|
+		 JPEG_V580_RST_CMD_JPEG_V580_DOMAIN_RESET_MSK),
+
+	[JMSK_RST_CMD_FE_RESET]			= JPEG_V580_RST_CMD_FE_RESET_MSK,
+	[JMSK_RST_CMD_WE_RESET]			= JPEG_V580_RST_CMD_WE_RESET_MSK,
+	[JMSK_RST_CMD_ENCODER_RESET]		= JPEG_V580_RST_CMD_ENCODER_RESET_MSK,
+	[JMSK_RST_CMD_DECODER_RESET]		= JPEG_V580_RST_CMD_DECODER_RESET_MSK,
+	[JMSK_RST_CMD_BLOCK_FORMATTER_RST]	= JPEG_V580_RST_CMD_BLOCK_FORMATTER_RST_MSK,
+	[JMSK_RST_CMD_SCALE_RESET]		= JPEG_V580_RST_CMD_SCALE_RESET_MSK,
+	[JMSK_RST_CMD_REGISTER_RESET]		= JPEG_V580_RST_CMD_REGISTER_RESET_MSK,
+	[JMSK_RST_CMD_MISR_RESET]		= JPEG_V580_RST_CMD_MISR_RESET_MSK,
+	[JMSK_RST_CMD_CORE_RESET]		= JPEG_V580_RST_CMD_CORE_RESET_MSK,
+	[JMSK_RST_CMD_JMSK_DOMAIN_RESET]	= JPEG_V580_RST_CMD_JPEG_V580_DOMAIN_RESET_MSK,
+	[JMSK_RST_CMD_RESET_BYPASS]		= JPEG_V580_RST_CMD_RESET_BYPASS_MSK,
+
+	[JMSK_CORE_CFG_FE_ENABLE]		= JPEG_V580_CORE_CFG_FE_ENABLE_MSK,
+	[JMSK_CORE_CFG_WE_ENABLE]		= JPEG_V580_CORE_CFG_WE_ENABLE_MSK,
+	[JMSK_CORE_CFG_ENC_ENABLE]		= JPEG_V580_CORE_CFG_ENC_ENABLE_MSK,
+	[JMSK_CORE_CFG_SCALE_ENABLE]		= JPEG_V580_CORE_CFG_SCALE_ENABLE_MSK,
+	[JMSK_CORE_CFG_TESTBUS_ENABLE]		= JPEG_V580_CORE_CFG_TESTBUS_ENABLE_MSK,
+	[JMSK_CORE_CFG_MODE]			= JPEG_V580_CORE_CFG_ENC_ENABLE_MSK,
+	[JMSK_CORE_CFG_CGC_DISABLE]		= JPEG_V580_CORE_CFG_CGC_DISABLE_MSK,
+
+	[JMSK_CMD_HW_START]			= JPEG_V580_CMD_HW_START_MSK,
+	[JMSK_CMD_HW_STOP]			= JPEG_V580_CMD_HW_STOP_MSK,
+
+	[JMSK_CMD_CLR_RD_PLNS_QUEUE]		=
+		(JPEG_V580_CMD_CLR_RD_PLN0_QUEUE_MSK |
+		 JPEG_V580_CMD_CLR_RD_PLN1_QUEUE_MSK |
+		 JPEG_V580_CMD_CLR_RD_PLN2_QUEUE_MSK),
+	[JMSK_CMD_CLR_WR_PLNS_QUEUE]		=
+		(JPEG_V580_CMD_CLR_WR_PLN0_QUEUE_MSK |
+		 JPEG_V580_CMD_CLR_WR_PLN1_QUEUE_MSK |
+		 JPEG_V580_CMD_CLR_WR_PLN2_QUEUE_MSK),
+
+	[JMSK_CMD_APPLY_SWC_RD_PARAMS]	= JPEG_V580_CMD_APPLY_SWC_RD_PARAMS_MSK,
+
+	[JMSK_CORE_STATUS_ENCODE_STATE]	= JPEG_V580_CORE_STATE_STATUS_ENCODE_STATE_MSK,
+	[JMSK_CORE_STATUS_SCALE_STATE]	= JPEG_V580_CORE_STATE_STATUS_SCALE_STATE_MSK,
+	[JMSK_CORE_STATUS_RT_STATE]	= JPEG_V580_CORE_STATE_STATUS_REALTIME_STATE_MSK,
+	[JMSK_CORE_STATUS_BUS_STATE]	= JPEG_V580_CORE_STATE_STATUS_BUS_STATE_MSK,
+	[JMSK_CORE_STATUS_CGC_STATE]	= JPEG_V580_CORE_STATE_STATUS_CGC_STATE_MSK,
+
+	[JMSK_IRQ_ENABLE_ALL]		= JPEG_V580_IRQ_STATUS_ENABLE_ALL_MSK,
+	[JMSK_IRQ_DISABLE_ALL]		= JPEG_V580_IRQ_STATUS_DISABLE_ALL_MSK,
+	[JMSK_IRQ_CLEAR_ALL]		= JPEG_V580_IRQ_STATUS_CLEAR_ALL_MSK,
+
+	[JMSK_IRQ_STATUS_SESSION_DONE]	= JPEG_V580_IRQ_STATUS_SESSION_DONE_MSK,
+
+	[JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE]	= JPEG_V580_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE]	= JPEG_V580_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE]	= JPEG_V580_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN]	=
+		(JPEG_V580_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	|
+		 JPEG_V580_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	|
+		 JPEG_V580_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK),
+
+	[JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE]	= JPEG_V580_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE]	= JPEG_V580_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE]	= JPEG_V580_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN]	=
+		(JPEG_V580_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	|
+		 JPEG_V580_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	|
+		 JPEG_V580_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK),
+
+	[JMSK_IRQ_STATUS_SESSION_ERROR]	=
+		(JPEG_V580_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	|
+		 JPEG_V580_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	|
+		 JPEG_V580_IRQ_STATUS_DCD_COEFF_ERROR_MSK	|
+		 JPEG_V580_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	|
+		 JPEG_V580_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	|
+		 JPEG_V580_IRQ_STATUS_DCD_INVALID_RSM_MSK	|
+		 JPEG_V580_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	|
+		 JPEG_V580_IRQ_STATUS_DCD_MISSING_RSM_MSK),
+
+	[JMSK_IRQ_STATUS_STOP_ACK]		= JPEG_V580_IRQ_STATUS_STOP_ACK_MSK,
+	[JMSK_IRQ_STATUS_RESET_ACK]		= JPEG_V580_IRQ_STATUS_RESET_ACK_MSK,
+
+	[JMSK_FE_CFG_BYTE_ORDERING]		= JPEG_V580_FE_CFG_BYTE_ORDERING_MSK,
+	[JMSK_FE_CFG_BURST_LENGTH_MAX]	= JPEG_V580_FE_CFG_BURST_LENGTH_MAX_MSK,
+	[JMSK_FE_CFG_MEMORY_FORMAT]		= JPEG_V580_FE_CFG_MEMORY_FORMAT_MSK,
+	[JMSK_FE_CFG_CBCR_ORDER]		= JPEG_V580_FE_CFG_CBCR_ORDER_MSK,
+	[JMSK_FE_CFG_BOTTOM_VPAD_EN]		= JPEG_V580_FE_CFG_BOTTOM_VPAD_EN_MSK,
+	[JMSK_FE_CFG_PLN0_EN]			= JPEG_V580_FE_CFG_PLN0_EN_MSK,
+	[JMSK_FE_CFG_PLN1_EN]			= JPEG_V580_FE_CFG_PLN1_EN_MSK,
+	[JMSK_FE_CFG_PLN2_EN]			= JPEG_V580_FE_CFG_PLN2_EN_MSK,
+	[JMSK_FE_CFG_SIXTEEN_MCU_EN]		= JPEG_V580_FE_CFG_SIXTEEN_MCU_EN_MSK,
+	[JMSK_FE_CFG_MCUS_PER_BLOCK]		= JPEG_V580_FE_CFG_MCUS_PER_BLOCK_MSK,
+	[JMSK_FE_CFG_MAL_BOUNDARY]		= JPEG_V580_FE_CFG_MAL_BOUNDARY_MSK,
+	[JMSK_FE_CFG_MAL_EN]			= JPEG_V580_FE_CFG_MAL_EN_MSK,
+
+	[JMSK_FE_VBPAD_CFG_BLOCK_ROW]		= JPEG_V580_FE_VBPAD_CFG_BLOCK_ROW_MSK,
+
+	[JMSK_PLNS_RD_OFFSET]			= JPEG_V580_PLN_RD_OFFS_OFFSET_MSK,
+	[JMSK_PLNS_RD_BUF_SIZE_WIDTH]	= JPEG_V580_PLN_RD_BUFF_SIZE_WIDTH_MSK,
+	[JMSK_PLNS_RD_BUF_SIZE_HEIGHT]	= JPEG_V580_PLN_RD_BUFF_SIZE_HEIGHT_MSK,
+	[JMSK_PLNS_RD_STRIDE]			= JPEG_V580_PLN_RD_STRIDE_STRIDE_MSK,
+	[JMSK_PLNS_RD_HINIT]			= JPEG_V580_PLN_RD_HINIT_FRACTIONAL_MSK,
+	[JMSK_PLNS_RD_VINIT]			= JPEG_V580_PLN_RD_VINIT_FRACTIONAL_MSK,
+
+	[JMSK_WE_CFG_BYTE_ORDERING]		= JPEG_V580_WE_CFG_BYTE_ORDERING_MSK,
+	[JMSK_WE_CFG_BURST_LENGTH_MAX]	= JPEG_V580_WE_CFG_BURST_LENGTH_MAX_MSK,
+	[JMSK_WE_CFG_MEMORY_FORMAT]		= JPEG_V580_WE_CFG_MEMORY_FORMAT_MSK,
+	[JMSK_WE_CFG_CBCR_ORDER]		= JPEG_V580_WE_CFG_CBCR_ORDER_MSK,
+	[JMSK_WE_CFG_PLN0_EN]			= JPEG_V580_WE_CFG_PLN0_EN_MSK,
+	[JMSK_WE_CFG_PLN1_EN]			= JPEG_V580_WE_CFG_PLN1_EN_MSK,
+	[JMSK_WE_CFG_PLN2_EN]			= JPEG_V580_WE_CFG_PLN2_EN_MSK,
+	[JMSK_WE_CFG_MAL_BOUNDARY]		= JPEG_V580_WE_CFG_MAL_BOUNDARY_MSK,
+	[JMSK_WE_CFG_MAL_EN]			= JPEG_V580_WE_CFG_MAL_EN_MSK,
+	[JMSK_WE_CFG_POP_BUFF_ON_EOS]		= JPEG_V580_WE_CFG_POP_BUFF_ON_EOS_MSK,
+
+	[JMSK_PLNS_WR_BUF_SIZE_WIDTH]	= JPEG_V580_PLN_WR_BUFF_SIZE_WIDTH_MSK,
+	[JMSK_PLNS_WR_BUF_SIZE_HEIGHT]	= JPEG_V580_PLN_WR_BUFF_SIZE_HEIGHT_MSK,
+
+	[JMSK_PLNS_WR_STRIDE]			= JPEG_V580_PLN_WR_STRIDE_STRIDE_MSK,
+	[JMSK_PLNS_WR_HINIT]			= JPEG_V580_PLN_WR_HINIT_INTEGER_MSK,
+	[JMSK_PLNS_WR_VINIT]			= JPEG_V580_PLN_WR_VINIT_INTEGER_MSK,
+	[JMSK_PLNS_WR_HSTEP]			= JPEG_V580_PLN_WR_HSTEP_INTEGER_MSK,
+	[JMSK_PLNS_WR_VSTEP]			= JPEG_V580_PLN_WR_VSTEP_INTEGER_MSK,
+
+	[JMSK_PLNS_WR_BLOCK_CFG_PER_COL]	= JPEG_V580_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK,
+	[JMSK_PLNS_WR_BLOCK_CFG_PER_RAW]	= JPEG_V580_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK,
+
+	[JMSK_SCALE_CFG_HSCALE_ENABLE]	= JPEG_V580_SCALE_CFG_HSCALE_ENABLE_MSK,
+	[JMSK_SCALE_CFG_VSCALE_ENABLE]	= JPEG_V580_SCALE_CFG_VSCALE_ENABLE_MSK,
+	[JMSK_SCALE_CFG_UPSAMPLE_EN]		= JPEG_V580_SCALE_CFG_UPSAMPLE_EN_MSK,
+	[JMSK_SCALE_CFG_SUBSAMPLE_EN]		= JPEG_V580_SCALE_CFG_SUBSAMPLE_EN_MSK,
+	[JMSK_SCALE_CFG_HSCALE_ALGO]		= JPEG_V580_SCALE_CFG_HSCALE_ALGO_MSK,
+	[JMSK_SCALE_CFG_VSCALE_ALGO]		= JPEG_V580_SCALE_CFG_VSCALE_ALGO_MSK,
+	[JMSK_SCALE_CFG_H_SCALE_FIR_ALGO]	= JPEG_V580_SCALE_CFG_H_SCALE_FIR_ALGO_MSK,
+	[JMSK_SCALE_CFG_V_SCALE_FIR_ALGO]	= JPEG_V580_SCALE_CFG_V_SCALE_FIR_ALGO_MSK,
+
+	[JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH]	= JPEG_V580_SCALE_OUT_CFG_BLOCK_WIDTH_MSK,
+	[JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT]	= JPEG_V580_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK,
+
+	[JMSK_SCALE_PLNS_HSTEP_FRACTIONAL]	= JPEG_V580_SCALE_PLN_HSTEP_FRACTIONAL_MSK,
+	[JMSK_SCALE_PLNS_HSTEP_INTEGER]	= JPEG_V580_SCALE_PLN_HSTEP_INTEGER_MSK,
+	[JMSK_SCALE_PLNS_VSTEP_FRACTIONAL]	= JPEG_V580_SCALE_PLN_VSTEP_FRACTIONAL_MSK,
+	[JMSK_SCALE_PLNS_VSTEP_INTEGER]	= JPEG_V580_SCALE_PLN_VSTEP_INTEGER_MSK,
+
+	[JMSK_ENC_CFG_IMAGE_FORMAT]		= JPEG_V580_ENC_CFG_IMAGE_FORMAT_MSK,
+	[JMSK_ENC_CFG_APPLY_EOI]		= JPEG_V580_ENC_CFG_APPLY_EOI_MSK,
+	[JMSK_ENC_CFG_HUFFMAN_SEL]		= JPEG_V580_ENC_CFG_HUFFMAN_SEL_MSK,
+	[JMSK_ENC_CFG_FSC_ENABLE]		= JPEG_V580_ENC_CFG_FSC_ENABLE_MSK,
+	[JMSK_ENC_CFG_OUTPUT_DISABLE]		= JPEG_V580_ENC_CFG_OUTPUT_DISABLE_MSK,
+	[JMSK_ENC_CFG_RST_MARKER_PERIOD]	= JPEG_V580_ENC_CFG_RST_MARKER_PERIOD_MSK,
+	[JMSK_ENC_IMAGE_SIZE_WIDTH]		= JPEG_V580_ENC_IMG_SIZE_ENCODE_WIDTH_MSK,
+	[JMSK_ENC_IMAGE_SIZE_HEIGHT]		= JPEG_V580_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK,
+};
+
+const struct qcom_jpeg_reg_offs qcom_v580_jpeg_hw_reg_offs = {
+	.hw_version	= 0x000,
+	.hw_capability	= 0x004,
+	.reset_cmd	= 0x008,
+	.core_cfg	= 0x00c,
+	.hw_cmd		= 0x010,
+	.int_mask	= 0x018,
+	.int_clr	= 0x01c,
+	.int_status	= 0x020,
+	.enc_core_state = 0x014,
+
+	.fe = {
+		.pntr	= { 0x038, 0x044, 0x050 },
+		.offs	= { 0x03c, 0x048, 0x054 },
+		.cnsmd	= { 0x040, 0x04c, 0x058 },
+		.bsize	= { 0x060, 0x068, 0x070 },
+		.stride	= { 0x064, 0x06c, 0x08c },
+		.hinit	= { 0x074, 0x078, 0x07c },
+		.vinit	= { 0x080, 0x084, 0x088 },
+		.pntr_cnt	= 0x05c,
+		.vbpad_cfg	= 0x2e8
+	},
+	.fe_cfg		= 0x024,
+
+	.we = {
+		.pntr	= { 0x0cc, 0x0d0, 0x0d4 },
+		.cnsmd	= { 0x0d8, 0x0dc, 0x0e0 },
+		.bsize	= { 0x0e8, 0x0ec, 0x0f0 },
+		.stride	= { 0x0f4, 0x0f8, 0x0fc },
+		.hinit	= { 0x100, 0x104, 0x108 },
+		.hstep	= { 0x118, 0x11c, 0x120 },
+		.vinit	= { 0x10c, 0x110, 0x114 },
+		.vstep	= { 0x124, 0x128, 0x12c },
+		.blocks	= { 0x130, 0x134, 0x138 },
+		.pntr_cnt = 0x0e4
+	},
+	.we_cfg		= 0x0c0,
+
+	.scale = {
+		.hstep	= { 0x27c, 0x280, 0x284 },
+		.vstep	= { 0x28c, 0x290, 0x294 },
+	},
+	.scale_cfg	= 0x26c,
+	.scale_out_cfg	= { 0x270, 0x274, 0x278 },
+
+	.enc_cfg	= 0x13c,
+	.enc_img_size	= 0x140,
+	.enc_out_size	= 0x180,
+
+	.dmi_cfg	= 0x298,
+	.dmi_data	= 0x2a0,
+	.dmi_addr	= 0x29c,
+};
+
+#endif /* QCOM_JENC_HW_INFO_V580_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_v680_jenc_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_v680_jenc_hw_info.h
new file mode 100644
index 000000000000..7e02cb587019
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_v680_jenc_hw_info.h
@@ -0,0 +1,509 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_HW_INFO_V680_H
+#define QCOM_JENC_HW_INFO_V680_H
+
+#include "qcom_jenc_defs.h"
+
+#define JPEG_V680_HW_VER_STEP_POS 0
+#define JPEG_V680_HW_VER_STEP_MSK \
+	(0xffff << JPEG_V680_HW_VER_STEP_POS)
+
+#define JPEG_V680_HW_VER_MINOR_POS 16
+#define JPEG_V680_HW_VER_MINOR_MSK \
+	(0x0fff << JPEG_V680_HW_VER_MINOR_POS)
+
+#define JPEG_V680_HW_VER_MAJOR_POS 28
+#define JPEG_V680_HW_VER_MAJOR_MSK \
+	(0xf << JPEG_V680_HW_VER_MAJOR_POS)
+
+#define JPEG_V680_HW_CAP_ENCODE_MSK BIT(0)
+#define JPEG_V680_HW_CAP_DECODE_MSK BIT(1)
+
+#define JPEG_V680_HW_CAP_UPSCALE_POS 4
+#define JPEG_V680_HW_CAP_UPSCALE_MSK \
+	(0x7 << JPEG_V680_HW_CAP_UPSCALE_POS)
+
+#define JPEG_V680_HW_CAP_DOWNSCALE_POS 8
+#define JPEG_V680_HW_CAP_DOWNSCALE_MSK \
+	(0x7 << JPEG_V680_HW_CAP_DOWNSCALE_POS)
+
+#define JPEG_V680_RST_CMD_FE_RESET_MSK			BIT(0)
+#define JPEG_V680_RST_CMD_WE_RESET_MSK			BIT(1)
+#define JPEG_V680_RST_CMD_ENCODER_RESET_MSK		BIT(4)
+#define JPEG_V680_RST_CMD_DECODER_RESET_MSK		BIT(5)
+#define JPEG_V680_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT(6)
+#define JPEG_V680_RST_CMD_SCALE_RESET_MSK		BIT(7)
+#define JPEG_V680_RST_CMD_REGISTER_RESET_MSK		BIT(13)
+#define JPEG_V680_RST_CMD_MISR_RESET_MSK		BIT(16)
+#define JPEG_V680_RST_CMD_CORE_RESET_MSK		BIT(17)
+#define JPEG_V680_RST_CMD_JPEG_V680_DOMAIN_RESET_MSK	BIT(29)
+#define JPEG_V680_RST_CMD_RESET_BYPASS_MSK		BIT(31)
+
+#define JPEG_V680_CORE_CFG_FE_ENABLE_MSK	BIT(0)
+#define JPEG_V680_CORE_CFG_WE_ENABLE_MSK	BIT(1)
+#define JPEG_V680_CORE_CFG_ENC_ENABLE_MSK	BIT(4)
+#define JPEG_V680_CORE_CFG_SCALE_ENABLE_MSK	BIT(7)
+#define JPEG_V680_CORE_CFG_TESTBUS_ENABLE_MSK	BIT(19)
+#define JPEG_V680_CORE_CFG_MODE_MSK		BIT(24)
+#define JPEG_V680_CORE_CFG_CGC_DISABLE_MSK	BIT(31)
+
+#define JPEG_V680_CMD_HW_START_MSK		BIT(0)
+#define JPEG_V680_CMD_HW_STOP_MSK		BIT(1)
+#define JPEG_V680_CMD_CLR_RD_PLN0_QUEUE_MSK	BIT(4)
+#define JPEG_V680_CMD_CLR_RD_PLN1_QUEUE_MSK	BIT(5)
+#define JPEG_V680_CMD_CLR_RD_PLN2_QUEUE_MSK	BIT(6)
+#define JPEG_V680_CMD_CLR_WR_PLN0_QUEUE_MSK	BIT(8)
+#define JPEG_V680_CMD_CLR_WR_PLN1_QUEUE_MSK	BIT(9)
+#define JPEG_V680_CMD_CLR_WR_PLN2_QUEUE_MSK	BIT(10)
+#define JPEG_V680_CMD_APPLY_SWC_RD_PARAMS_MSK	BIT(11)
+
+#define JPEG_V680_CORE_STATE_STATUS_ENCODE_STATE_MSK	BIT(0)
+#define JPEG_V680_CORE_STATE_STATUS_SCALE_STATE_MSK	BIT(2)
+#define JPEG_V680_CORE_STATE_STATUS_REALTIME_STATE_MSK	BIT(4)
+#define JPEG_V680_CORE_STATE_STATUS_BUS_STATE_MSK	BIT(8)
+#define JPEG_V680_CORE_STATE_STATUS_CGC_STATE_MSK	BIT(9)
+
+#define JPEG_V680_FE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V680_FE_CFG_BYTE_ORDERING_MSK \
+	(0xf << JPEG_V680_FE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V680_FE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V680_FE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xf << JPEG_V680_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V680_FE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V680_FE_CFG_MEMORY_FORMAT_MSK \
+	(0x3 << JPEG_V680_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V680_FE_CFG_CBCR_ORDER_MSK		BIT(12)
+#define JPEG_V680_FE_CFG_BOTTOM_VPAD_EN_MSK	BIT(13)
+#define JPEG_V680_FE_CFG_PLN0_EN_MSK		BIT(16)
+#define JPEG_V680_FE_CFG_PLN1_EN_MSK		BIT(17)
+#define JPEG_V680_FE_CFG_PLN2_EN_MSK		BIT(18)
+#define JPEG_V680_FE_CFG_SIXTEEN_MCU_EN_MSK	BIT(21)
+#define JPEG_V680_FE_CFG_MCUS_PER_BLOCK_MSK	BIT(22)
+#define JPEG_V680_FE_CFG_MAL_BOUNDARY_MSK	BIT(24)
+#define JPEG_V680_FE_CFG_MAL_EN_MSK		BIT(27)
+
+#define JPEG_V680_PLN_RD_OFFS_OFFSET_POS 0
+#define JPEG_V680_PLN_RD_OFFS_OFFSET_MSK \
+	(0x1fffffff << JPEG_V680_PLN_RD_OFFS_OFFSET_POS)
+
+#define JPEG_V680_PLN_RD_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V680_PLN_RD_BUFF_SIZE_WIDTH_MSK \
+	(0xffff << JPEG_V680_PLN_RD_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V680_PLN_RD_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V680_PLN_RD_BUFF_SIZE_HEIGHT_MSK \
+	(0xffff << JPEG_V680_PLN_RD_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V680_PLN_RD_STRIDE_STRIDE_POS 0
+#define JPEG_V680_PLN_RD_STRIDE_STRIDE_MSK \
+	(0xffff << JPEG_V680_PLN_RD_STRIDE_STRIDE_POS)
+
+#define JPEG_V680_PLN_RD_HINIT_FRACTIONAL_POS 0
+#define JPEG_V680_PLN_RD_HINIT_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V680_PLN_RD_HINIT_FRACTIONAL_POS)
+
+#define JPEG_V680_PLN_RD_VINIT_FRACTIONAL_POS 0
+#define JPEG_V680_PLN_RD_VINIT_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V680_PLN_RD_VINIT_FRACTIONAL_POS)
+
+#define JPEG_V680_WE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V680_WE_CFG_BYTE_ORDERING_MSK \
+	(0xf << JPEG_V680_WE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V680_WE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V680_WE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xf << JPEG_V680_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V680_WE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V680_WE_CFG_MEMORY_FORMAT_MSK \
+	(0x3 << JPEG_V680_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V680_WE_CFG_CBCR_ORDER_MSK		BIT(12)
+#define JPEG_V680_WE_CFG_PLN0_EN_MSK		BIT(16)
+#define JPEG_V680_WE_CFG_PLN1_EN_MSK		BIT(17)
+#define JPEG_V680_WE_CFG_PLN2_EN_MSK		BIT(18)
+#define JPEG_V680_WE_CFG_MAL_BOUNDARY_MSK	BIT(24)
+#define JPEG_V680_WE_CFG_MAL_EN_MSK		BIT(27)
+#define JPEG_V680_WE_CFG_POP_BUFF_ON_EOS_MSK	BIT(28)
+
+#define JPEG_V680_PLN_WR_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V680_PLN_WR_BUFF_SIZE_WIDTH_MSK \
+	(0xffff << JPEG_V680_PLN_WR_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V680_PLN_WR_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V680_PLN_WR_BUFF_SIZE_HEIGHT_MSK \
+	(0xffff << JPEG_V680_PLN_WR_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V680_PLN_WR_STRIDE_STRIDE_POS 0
+#define JPEG_V680_PLN_WR_STRIDE_STRIDE_MSK \
+	(0xffff << JPEG_V680_PLN_WR_STRIDE_STRIDE_POS)
+
+#define JPEG_V680_PLN_WR_HINIT_INTEGER_POS 0
+#define JPEG_V680_PLN_WR_HINIT_INTEGER_MSK \
+	(0xffff << JPEG_V680_PLN_WR_HINIT_INTEGER_POS)
+
+#define JPEG_V680_PLN_WR_VINIT_INTEGER_POS 0
+#define JPEG_V680_PLN_WR_VINIT_INTEGER_MSK \
+	(0xffff << JPEG_V680_PLN_WR_VINIT_INTEGER_POS)
+
+#define JPEG_V680_PLN_WR_HSTEP_INTEGER_POS 0
+#define JPEG_V680_PLN_WR_HSTEP_INTEGER_MSK \
+	(0x1ffff << JPEG_V680_PLN_WR_HSTEP_INTEGER_POS)
+
+#define JPEG_V680_PLN_WR_VSTEP_INTEGER_POS 0
+#define JPEG_V680_PLN_WR_VSTEP_INTEGER_MSK \
+	(0x1ffff << JPEG_V680_PLN_WR_VSTEP_INTEGER_POS)
+
+#define JPEG_V680_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS 0
+#define JPEG_V680_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK \
+	(0xffff << JPEG_V680_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS)
+
+#define JPEG_V680_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS 16
+#define JPEG_V680_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK \
+	(0xffff << JPEG_V680_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS)
+
+#define JPEG_V680_ENC_CFG_IMAGE_FORMAT_POS 0
+#define JPEG_V680_ENC_CFG_IMAGE_FORMAT_MSK \
+	(0x7 << JPEG_V680_ENC_CFG_IMAGE_FORMAT_POS)
+
+#define JPEG_V680_ENC_CFG_APPLY_EOI_MSK		BIT(7)
+#define JPEG_V680_ENC_CFG_HUFFMAN_SEL_MSK	BIT(8)
+#define JPEG_V680_ENC_CFG_FSC_ENABLE_MSK	BIT(11)
+#define JPEG_V680_ENC_CFG_OUTPUT_DISABLE_MSK	BIT(15)
+#define JPEG_V680_ENC_CFG_RST_MARKER_PERIOD_MSK	BIT(16)
+
+#define JPEG_V680_ENC_IMG_SIZE_ENCODE_WIDTH_POS 0u
+#define JPEG_V680_ENC_IMG_SIZE_ENCODE_WIDTH_MSK \
+	(0x1fffu << JPEG_V680_ENC_IMG_SIZE_ENCODE_WIDTH_POS)
+
+#define JPEG_V680_ENC_IMG_SIZE_ENCODE_HEIGHT_POS 16u
+#define JPEG_V680_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK \
+	(0x1fffu << JPEG_V680_ENC_IMG_SIZE_ENCODE_HEIGHT_POS)
+
+#define JPEG_V680_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS 0
+#define JPEG_V680_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_MSK \
+	(0x1fffffff << JPEG_V680_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS)
+
+#define JPEG_V680_SCALE_CFG_HSCALE_ENABLE_MSK		BIT(4)
+#define JPEG_V680_SCALE_CFG_VSCALE_ENABLE_MSK		BIT(5)
+#define JPEG_V680_SCALE_CFG_UPSAMPLE_EN_MSK		BIT(6)
+#define JPEG_V680_SCALE_CFG_SUBSAMPLE_EN_MSK		BIT(7)
+#define JPEG_V680_SCALE_CFG_HSCALE_ALGO_MSK		BIT(8)
+#define JPEG_V680_SCALE_CFG_VSCALE_ALGO_MSK		BIT(9)
+
+#define JPEG_V680_SCALE_CFG_H_SCALE_FIR_ALGO_POS  12u
+#define JPEG_V680_SCALE_CFG_H_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V680_SCALE_CFG_H_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V680_SCALE_CFG_V_SCALE_FIR_ALGO_POS  16u
+#define JPEG_V680_SCALE_CFG_V_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V680_SCALE_CFG_V_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V680_SCALE_OUT_CFG_BLOCK_WIDTH_POS 0
+#define JPEG_V680_SCALE_OUT_CFG_BLOCK_WIDTH_MSK \
+	(0xff << JPEG_V680_SCALE_OUT_CFG_BLOCK_WIDTH_POS)
+
+#define JPEG_V680_SCALE_OUT_CFG_BLOCK_HEIGHT_POS 16
+#define JPEG_V680_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK \
+	(0xf << JPEG_V680_SCALE_OUT_CFG_BLOCK_HEIGHT_POS)
+
+#define JPEG_V680_SCALE_PLN_HSTEP_FRACTIONAL_POS 0
+#define JPEG_V680_SCALE_PLN_HSTEP_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V680_SCALE_PLN_HSTEP_FRACTIONAL_POS)
+
+#define JPEG_V680_SCALE_PLN_HSTEP_INTEGER_POS 21
+#define JPEG_V680_SCALE_PLN_HSTEP_INTEGER_MSK \
+	(0x3f << JPEG_V680_SCALE_PLN_HSTEP_INTEGER_POS)
+
+#define JPEG_V680_SCALE_PLN_VSTEP_FRACTIONAL_POS 0
+#define JPEG_V680_SCALE_PLN_VSTEP_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V680_SCALE_PLN_VSTEP_FRACTIONAL_POS)
+
+#define JPEG_V680_SCALE_PLN_VSTEP_INTEGER_POS 21
+#define JPEG_V680_SCALE_PLN_VSTEP_INTEGER_MSK \
+	(0x3f << JPEG_V680_SCALE_PLN_VSTEP_INTEGER_POS)
+
+#define JPEG_V680_DMI_CFG_MEM_SEL_POS 0
+#define JPEG_V680_DMI_CFG_MEM_SEL_MSK \
+	(0x7 << JPEG_V680_DMI_CFG_MEM_SEL_POS)
+
+#define JPEG_V680_DMI_CFG_AUTO_INC_EN_MSK	BIT(4)
+
+#define JPEG_V680_DMI_ADDR_ADDR_POS 0
+#define JPEG_V680_DMI_ADDR_ADDR_MSK \
+	(0x3ff << JPEG_V680_DMI_ADDR_ADDR_POS)
+
+#define JPEG_V680_TESTBUS_CFG_BUS_SEL_POS 0
+#define JPEG_V680_TESTBUS_CFG_BUS_SEL_MSK \
+	(0x3f << JPEG_V680_TESTBUS_CFG_BUS_SEL_POS)
+
+#define JPEG_V680_FE_VBPAD_CFG_BLOCK_ROW_POS 0
+#define JPEG_V680_FE_VBPAD_CFG_BLOCK_ROW_MSK \
+	(0x1fff << JPEG_V680_FE_VBPAD_CFG_BLOCK_ROW_POS)
+
+#define JPEG_V680_PLN_RD_HINIT_INT_INTEGER_POS 0
+#define JPEG_V680_PLN_RD_HINIT_INT_INTEGER_MSK \
+	(0x1ffff << JPEG_V680_PLN_RD_HINIT_INT_INTEGER_POS)
+
+#define JPEG_V680_PLN_RD_VINIT_INT_INTEGER_POS 0
+#define JPEG_V680_PLN_RD_VINIT_INT_INTEGER_MSK \
+	(0x1ffff << JPEG_V680_PLN_RD_VINIT_INT_INTEGER_POS)
+
+#define JPEG_V680_IRQ_STATUS_SESSION_DONE_MSK		BIT(0)
+#define JPEG_V680_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	BIT(4)
+#define JPEG_V680_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	BIT(5)
+#define JPEG_V680_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK	BIT(6)
+#define JPEG_V680_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	BIT(7)
+#define JPEG_V680_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	BIT(8)
+#define JPEG_V680_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK	BIT(9)
+#define JPEG_V680_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	BIT(10)
+#define JPEG_V680_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	BIT(11)
+#define JPEG_V680_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK	BIT(12)
+#define JPEG_V680_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	BIT(13)
+#define JPEG_V680_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	BIT(14)
+#define JPEG_V680_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK	BIT(15)
+#define JPEG_V680_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	BIT(19)
+#define JPEG_V680_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	BIT(20)
+#define JPEG_V680_IRQ_STATUS_DCD_COEFF_ERROR_MSK	BIT(21)
+#define JPEG_V680_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	BIT(22)
+#define JPEG_V680_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	BIT(23)
+#define JPEG_V680_IRQ_STATUS_DCD_INVALID_RSM_MSK	BIT(24)
+#define JPEG_V680_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	BIT(25)
+#define JPEG_V680_IRQ_STATUS_DCD_MISSING_RSM_MSK	BIT(26)
+#define JPEG_V680_IRQ_STATUS_STOP_ACK_MSK		BIT(27)
+#define JPEG_V680_IRQ_STATUS_RESET_ACK_MSK		BIT(28)
+
+#define JPEG_V680_IRQ_STATUS_ENABLE_ALL_MSK		~0
+#define JPEG_V680_IRQ_STATUS_DISABLE_ALL_MSK		0
+#define JPEG_V680_IRQ_STATUS_CLEAR_ALL_MSK		JPEG_V680_IRQ_STATUS_ENABLE_ALL_MSK
+
+const u32 qcom_v680_jpeg_hw_reg_mask[] = {
+	[JMSK_HW_VER_STEP]			= JPEG_V680_HW_VER_STEP_MSK,
+	[JMSK_HW_VER_MINOR]			= JPEG_V680_HW_VER_MINOR_MSK,
+	[JMSK_HW_VER_MAJOR]			= JPEG_V680_HW_VER_MAJOR_MSK,
+
+	[JMSK_HW_CAP_ENCODE]			= JPEG_V680_HW_CAP_ENCODE_MSK,
+	[JMSK_HW_CAP_DECODE]			= JPEG_V680_HW_CAP_DECODE_MSK,
+	[JMSK_HW_CAP_UPSCALE]			= JPEG_V680_HW_CAP_UPSCALE_MSK,
+	[JMSK_HW_CAP_DOWNSCALE]		= JPEG_V680_HW_CAP_DOWNSCALE_MSK,
+
+	[JMSK_RST_CMD_COMMON]			=
+		(JPEG_V680_RST_CMD_FE_RESET_MSK			|
+		 JPEG_V680_RST_CMD_WE_RESET_MSK			|
+		 JPEG_V680_RST_CMD_ENCODER_RESET_MSK		|
+		 JPEG_V680_RST_CMD_BLOCK_FORMATTER_RST_MSK	|
+		 JPEG_V680_RST_CMD_SCALE_RESET_MSK		|
+		 JPEG_V680_RST_CMD_REGISTER_RESET_MSK		|
+		 JPEG_V680_RST_CMD_MISR_RESET_MSK		|
+		 JPEG_V680_RST_CMD_CORE_RESET_MSK		|
+		 JPEG_V680_RST_CMD_JPEG_V680_DOMAIN_RESET_MSK),
+
+	[JMSK_RST_CMD_FE_RESET]			= JPEG_V680_RST_CMD_FE_RESET_MSK,
+	[JMSK_RST_CMD_WE_RESET]			= JPEG_V680_RST_CMD_WE_RESET_MSK,
+	[JMSK_RST_CMD_ENCODER_RESET]		= JPEG_V680_RST_CMD_ENCODER_RESET_MSK,
+	[JMSK_RST_CMD_DECODER_RESET]		= JPEG_V680_RST_CMD_DECODER_RESET_MSK,
+	[JMSK_RST_CMD_BLOCK_FORMATTER_RST]	= JPEG_V680_RST_CMD_BLOCK_FORMATTER_RST_MSK,
+	[JMSK_RST_CMD_SCALE_RESET]		= JPEG_V680_RST_CMD_SCALE_RESET_MSK,
+	[JMSK_RST_CMD_REGISTER_RESET]		= JPEG_V680_RST_CMD_REGISTER_RESET_MSK,
+	[JMSK_RST_CMD_MISR_RESET]		= JPEG_V680_RST_CMD_MISR_RESET_MSK,
+	[JMSK_RST_CMD_CORE_RESET]		= JPEG_V680_RST_CMD_CORE_RESET_MSK,
+	[JMSK_RST_CMD_JMSK_DOMAIN_RESET]	= JPEG_V680_RST_CMD_JPEG_V680_DOMAIN_RESET_MSK,
+	[JMSK_RST_CMD_RESET_BYPASS]		= JPEG_V680_RST_CMD_RESET_BYPASS_MSK,
+
+	[JMSK_CORE_CFG_FE_ENABLE]		= JPEG_V680_CORE_CFG_FE_ENABLE_MSK,
+	[JMSK_CORE_CFG_WE_ENABLE]		= JPEG_V680_CORE_CFG_WE_ENABLE_MSK,
+	[JMSK_CORE_CFG_ENC_ENABLE]		= JPEG_V680_CORE_CFG_ENC_ENABLE_MSK,
+	[JMSK_CORE_CFG_SCALE_ENABLE]		= JPEG_V680_CORE_CFG_SCALE_ENABLE_MSK,
+	[JMSK_CORE_CFG_TESTBUS_ENABLE]		= JPEG_V680_CORE_CFG_TESTBUS_ENABLE_MSK,
+	[JMSK_CORE_CFG_MODE]			= JPEG_V680_CORE_CFG_ENC_ENABLE_MSK,
+	[JMSK_CORE_CFG_CGC_DISABLE]		= JPEG_V680_CORE_CFG_CGC_DISABLE_MSK,
+
+	[JMSK_CMD_HW_START]			= JPEG_V680_CMD_HW_START_MSK,
+	[JMSK_CMD_HW_STOP]			= JPEG_V680_CMD_HW_STOP_MSK,
+
+	[JMSK_CMD_CLR_RD_PLNS_QUEUE]		=
+		(JPEG_V680_CMD_CLR_RD_PLN0_QUEUE_MSK |
+		 JPEG_V680_CMD_CLR_RD_PLN1_QUEUE_MSK |
+		 JPEG_V680_CMD_CLR_RD_PLN2_QUEUE_MSK),
+	[JMSK_CMD_CLR_WR_PLNS_QUEUE]		=
+		(JPEG_V680_CMD_CLR_WR_PLN0_QUEUE_MSK |
+		 JPEG_V680_CMD_CLR_WR_PLN1_QUEUE_MSK |
+		 JPEG_V680_CMD_CLR_WR_PLN2_QUEUE_MSK),
+
+	[JMSK_CMD_APPLY_SWC_RD_PARAMS]	= JPEG_V680_CMD_APPLY_SWC_RD_PARAMS_MSK,
+
+	[JMSK_CORE_STATUS_ENCODE_STATE]	= JPEG_V680_CORE_STATE_STATUS_ENCODE_STATE_MSK,
+	[JMSK_CORE_STATUS_SCALE_STATE]	= JPEG_V680_CORE_STATE_STATUS_SCALE_STATE_MSK,
+	[JMSK_CORE_STATUS_RT_STATE]	= JPEG_V680_CORE_STATE_STATUS_REALTIME_STATE_MSK,
+	[JMSK_CORE_STATUS_BUS_STATE]	= JPEG_V680_CORE_STATE_STATUS_BUS_STATE_MSK,
+	[JMSK_CORE_STATUS_CGC_STATE]	= JPEG_V680_CORE_STATE_STATUS_CGC_STATE_MSK,
+
+	[JMSK_IRQ_ENABLE_ALL]		= JPEG_V680_IRQ_STATUS_ENABLE_ALL_MSK,
+	[JMSK_IRQ_DISABLE_ALL]		= JPEG_V680_IRQ_STATUS_DISABLE_ALL_MSK,
+	[JMSK_IRQ_CLEAR_ALL]		= JPEG_V680_IRQ_STATUS_CLEAR_ALL_MSK,
+
+	[JMSK_IRQ_STATUS_SESSION_DONE]	= JPEG_V680_IRQ_STATUS_SESSION_DONE_MSK,
+
+	[JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE]	= JPEG_V680_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE]	= JPEG_V680_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE]	= JPEG_V680_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN]	=
+		(JPEG_V680_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	|
+		 JPEG_V680_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	|
+		 JPEG_V680_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK),
+
+	[JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE]	= JPEG_V680_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE]	= JPEG_V680_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE]	= JPEG_V680_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN]	=
+		(JPEG_V680_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	|
+		 JPEG_V680_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	|
+		 JPEG_V680_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK),
+
+	[JMSK_IRQ_STATUS_SESSION_ERROR]	=
+		(JPEG_V680_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	|
+		 JPEG_V680_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	|
+		 JPEG_V680_IRQ_STATUS_DCD_COEFF_ERROR_MSK	|
+		 JPEG_V680_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	|
+		 JPEG_V680_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	|
+		 JPEG_V680_IRQ_STATUS_DCD_INVALID_RSM_MSK	|
+		 JPEG_V680_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	|
+		 JPEG_V680_IRQ_STATUS_DCD_MISSING_RSM_MSK),
+
+	[JMSK_IRQ_STATUS_STOP_ACK]		= JPEG_V680_IRQ_STATUS_STOP_ACK_MSK,
+	[JMSK_IRQ_STATUS_RESET_ACK]		= JPEG_V680_IRQ_STATUS_RESET_ACK_MSK,
+
+	[JMSK_FE_CFG_BYTE_ORDERING]		= JPEG_V680_FE_CFG_BYTE_ORDERING_MSK,
+	[JMSK_FE_CFG_BURST_LENGTH_MAX]	= JPEG_V680_FE_CFG_BURST_LENGTH_MAX_MSK,
+	[JMSK_FE_CFG_MEMORY_FORMAT]		= JPEG_V680_FE_CFG_MEMORY_FORMAT_MSK,
+	[JMSK_FE_CFG_CBCR_ORDER]		= JPEG_V680_FE_CFG_CBCR_ORDER_MSK,
+	[JMSK_FE_CFG_BOTTOM_VPAD_EN]		= JPEG_V680_FE_CFG_BOTTOM_VPAD_EN_MSK,
+	[JMSK_FE_CFG_PLN0_EN]			= JPEG_V680_FE_CFG_PLN0_EN_MSK,
+	[JMSK_FE_CFG_PLN1_EN]			= JPEG_V680_FE_CFG_PLN1_EN_MSK,
+	[JMSK_FE_CFG_PLN2_EN]			= JPEG_V680_FE_CFG_PLN2_EN_MSK,
+	[JMSK_FE_CFG_SIXTEEN_MCU_EN]		= JPEG_V680_FE_CFG_SIXTEEN_MCU_EN_MSK,
+	[JMSK_FE_CFG_MCUS_PER_BLOCK]		= JPEG_V680_FE_CFG_MCUS_PER_BLOCK_MSK,
+	[JMSK_FE_CFG_MAL_BOUNDARY]		= JPEG_V680_FE_CFG_MAL_BOUNDARY_MSK,
+	[JMSK_FE_CFG_MAL_EN]			= JPEG_V680_FE_CFG_MAL_EN_MSK,
+
+	[JMSK_FE_VBPAD_CFG_BLOCK_ROW]		= JPEG_V680_FE_VBPAD_CFG_BLOCK_ROW_MSK,
+
+	[JMSK_PLNS_RD_OFFSET]			= JPEG_V680_PLN_RD_OFFS_OFFSET_MSK,
+	[JMSK_PLNS_RD_BUF_SIZE_WIDTH]	= JPEG_V680_PLN_RD_BUFF_SIZE_WIDTH_MSK,
+	[JMSK_PLNS_RD_BUF_SIZE_HEIGHT]	= JPEG_V680_PLN_RD_BUFF_SIZE_HEIGHT_MSK,
+	[JMSK_PLNS_RD_STRIDE]			= JPEG_V680_PLN_RD_STRIDE_STRIDE_MSK,
+	[JMSK_PLNS_RD_HINIT]			= JPEG_V680_PLN_RD_HINIT_FRACTIONAL_MSK,
+	[JMSK_PLNS_RD_VINIT]			= JPEG_V680_PLN_RD_VINIT_FRACTIONAL_MSK,
+
+	[JMSK_WE_CFG_BYTE_ORDERING]		= JPEG_V680_WE_CFG_BYTE_ORDERING_MSK,
+	[JMSK_WE_CFG_BURST_LENGTH_MAX]	= JPEG_V680_WE_CFG_BURST_LENGTH_MAX_MSK,
+	[JMSK_WE_CFG_MEMORY_FORMAT]		= JPEG_V680_WE_CFG_MEMORY_FORMAT_MSK,
+	[JMSK_WE_CFG_CBCR_ORDER]		= JPEG_V680_WE_CFG_CBCR_ORDER_MSK,
+	[JMSK_WE_CFG_PLN0_EN]			= JPEG_V680_WE_CFG_PLN0_EN_MSK,
+	[JMSK_WE_CFG_PLN1_EN]			= JPEG_V680_WE_CFG_PLN1_EN_MSK,
+	[JMSK_WE_CFG_PLN2_EN]			= JPEG_V680_WE_CFG_PLN2_EN_MSK,
+	[JMSK_WE_CFG_MAL_BOUNDARY]		= JPEG_V680_WE_CFG_MAL_BOUNDARY_MSK,
+	[JMSK_WE_CFG_MAL_EN]			= JPEG_V680_WE_CFG_MAL_EN_MSK,
+	[JMSK_WE_CFG_POP_BUFF_ON_EOS]		= JPEG_V680_WE_CFG_POP_BUFF_ON_EOS_MSK,
+
+	[JMSK_PLNS_WR_BUF_SIZE_WIDTH]	= JPEG_V680_PLN_WR_BUFF_SIZE_WIDTH_MSK,
+	[JMSK_PLNS_WR_BUF_SIZE_HEIGHT]	= JPEG_V680_PLN_WR_BUFF_SIZE_HEIGHT_MSK,
+
+	[JMSK_PLNS_WR_STRIDE]			= JPEG_V680_PLN_WR_STRIDE_STRIDE_MSK,
+	[JMSK_PLNS_WR_HINIT]			= JPEG_V680_PLN_WR_HINIT_INTEGER_MSK,
+	[JMSK_PLNS_WR_VINIT]			= JPEG_V680_PLN_WR_VINIT_INTEGER_MSK,
+	[JMSK_PLNS_WR_HSTEP]			= JPEG_V680_PLN_WR_HSTEP_INTEGER_MSK,
+	[JMSK_PLNS_WR_VSTEP]			= JPEG_V680_PLN_WR_VSTEP_INTEGER_MSK,
+
+	[JMSK_PLNS_WR_BLOCK_CFG_PER_COL]	= JPEG_V680_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK,
+	[JMSK_PLNS_WR_BLOCK_CFG_PER_RAW]	= JPEG_V680_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK,
+
+	[JMSK_SCALE_CFG_HSCALE_ENABLE]	= JPEG_V680_SCALE_CFG_HSCALE_ENABLE_MSK,
+	[JMSK_SCALE_CFG_VSCALE_ENABLE]	= JPEG_V680_SCALE_CFG_VSCALE_ENABLE_MSK,
+	[JMSK_SCALE_CFG_UPSAMPLE_EN]		= JPEG_V680_SCALE_CFG_UPSAMPLE_EN_MSK,
+	[JMSK_SCALE_CFG_SUBSAMPLE_EN]		= JPEG_V680_SCALE_CFG_SUBSAMPLE_EN_MSK,
+	[JMSK_SCALE_CFG_HSCALE_ALGO]		= JPEG_V680_SCALE_CFG_HSCALE_ALGO_MSK,
+	[JMSK_SCALE_CFG_VSCALE_ALGO]		= JPEG_V680_SCALE_CFG_VSCALE_ALGO_MSK,
+	[JMSK_SCALE_CFG_H_SCALE_FIR_ALGO]	= JPEG_V680_SCALE_CFG_H_SCALE_FIR_ALGO_MSK,
+	[JMSK_SCALE_CFG_V_SCALE_FIR_ALGO]	= JPEG_V680_SCALE_CFG_V_SCALE_FIR_ALGO_MSK,
+
+	[JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH]	= JPEG_V680_SCALE_OUT_CFG_BLOCK_WIDTH_MSK,
+	[JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT]	= JPEG_V680_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK,
+
+	[JMSK_SCALE_PLNS_HSTEP_FRACTIONAL]	= JPEG_V680_SCALE_PLN_HSTEP_FRACTIONAL_MSK,
+	[JMSK_SCALE_PLNS_HSTEP_INTEGER]	= JPEG_V680_SCALE_PLN_HSTEP_INTEGER_MSK,
+	[JMSK_SCALE_PLNS_VSTEP_FRACTIONAL]	= JPEG_V680_SCALE_PLN_VSTEP_FRACTIONAL_MSK,
+	[JMSK_SCALE_PLNS_VSTEP_INTEGER]	= JPEG_V680_SCALE_PLN_VSTEP_INTEGER_MSK,
+
+	[JMSK_ENC_CFG_IMAGE_FORMAT]		= JPEG_V680_ENC_CFG_IMAGE_FORMAT_MSK,
+	[JMSK_ENC_CFG_APPLY_EOI]		= JPEG_V680_ENC_CFG_APPLY_EOI_MSK,
+	[JMSK_ENC_CFG_HUFFMAN_SEL]		= JPEG_V680_ENC_CFG_HUFFMAN_SEL_MSK,
+	[JMSK_ENC_CFG_FSC_ENABLE]		= JPEG_V680_ENC_CFG_FSC_ENABLE_MSK,
+	[JMSK_ENC_CFG_OUTPUT_DISABLE]		= JPEG_V680_ENC_CFG_OUTPUT_DISABLE_MSK,
+	[JMSK_ENC_CFG_RST_MARKER_PERIOD]	= JPEG_V680_ENC_CFG_RST_MARKER_PERIOD_MSK,
+	[JMSK_ENC_IMAGE_SIZE_WIDTH]		= JPEG_V680_ENC_IMG_SIZE_ENCODE_WIDTH_MSK,
+	[JMSK_ENC_IMAGE_SIZE_HEIGHT]		= JPEG_V680_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK,
+};
+
+const struct qcom_jpeg_reg_offs qcom_v680_jpeg_hw_reg_offs = {
+	.hw_version	= 0x000,
+	.hw_capability	= 0x004,
+	.reset_cmd	= 0x008,
+	.core_cfg	= 0x00c,
+	.hw_cmd		= 0x010,
+	.int_mask	= 0x018,
+	.int_clr	= 0x01c,
+	.int_status	= 0x020,
+	.enc_core_state = 0x014,
+
+	.fe = {
+		.pntr	= { 0x038, 0x044, 0x050 },
+		.offs	= { 0x03c, 0x048, 0x054 },
+		.cnsmd	= { 0x040, 0x04c, 0x058 },
+		.bsize	= { 0x060, 0x068, 0x070 },
+		.stride	= { 0x064, 0x06c, 0x08c },
+		.hinit	= { 0x074, 0x078, 0x07c },
+		.vinit	= { 0x080, 0x084, 0x088 },
+		.pntr_cnt	= 0x05c,
+		.vbpad_cfg	= 0x2e8
+	},
+	.fe_cfg		= 0x024,
+
+	.we = {
+		.pntr	= { 0x0cc, 0x0d0, 0x0d4 },
+		.cnsmd	= { 0x0d8, 0x0dc, 0x0e0 },
+		.bsize	= { 0x0e8, 0x0ec, 0x0f0 },
+		.stride	= { 0x0f4, 0x0f8, 0x0fc },
+		.hinit	= { 0x100, 0x104, 0x108 },
+		.hstep	= { 0x118, 0x11c, 0x120 },
+		.vinit	= { 0x10c, 0x110, 0x114 },
+		.vstep	= { 0x124, 0x128, 0x12c },
+		.blocks	= { 0x130, 0x134, 0x138 },
+		.pntr_cnt = 0x0e4
+	},
+	.we_cfg		= 0x0c0,
+
+	.scale = {
+		.hstep	= { 0x27c, 0x280, 0x284 },
+		.vstep	= { 0x28c, 0x290, 0x294 },
+	},
+	.scale_cfg	= 0x26c,
+	.scale_out_cfg	= { 0x270, 0x274, 0x278 },
+
+	.enc_cfg	= 0x13c,
+	.enc_img_size	= 0x140,
+	.enc_out_size	= 0x180,
+
+	.dmi_cfg	= 0x298,
+	.dmi_data	= 0x2a0,
+	.dmi_addr	= 0x29c,
+};
+
+#endif /* QCOM_JENC_HW_INFO_V680_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_v780_jenc_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_v780_jenc_hw_info.h
new file mode 100644
index 000000000000..bf9b4f603cd1
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_v780_jenc_hw_info.h
@@ -0,0 +1,509 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_HW_INFO_V780_H
+#define QCOM_JENC_HW_INFO_V780_H
+
+#include "qcom_jenc_defs.h"
+
+#define JPEG_V780_HW_VER_STEP_POS 0
+#define JPEG_V780_HW_VER_STEP_MSK \
+	(0xffff << JPEG_V780_HW_VER_STEP_POS)
+
+#define JPEG_V780_HW_VER_MINOR_POS 16
+#define JPEG_V780_HW_VER_MINOR_MSK \
+	(0x0fff << JPEG_V780_HW_VER_MINOR_POS)
+
+#define JPEG_V780_HW_VER_MAJOR_POS 28
+#define JPEG_V780_HW_VER_MAJOR_MSK \
+	(0xf << JPEG_V780_HW_VER_MAJOR_POS)
+
+#define JPEG_V780_HW_CAP_ENCODE_MSK BIT(0)
+#define JPEG_V780_HW_CAP_DECODE_MSK BIT(1)
+
+#define JPEG_V780_HW_CAP_UPSCALE_POS 4
+#define JPEG_V780_HW_CAP_UPSCALE_MSK \
+	(0x7 << JPEG_V780_HW_CAP_UPSCALE_POS)
+
+#define JPEG_V780_HW_CAP_DOWNSCALE_POS 8
+#define JPEG_V780_HW_CAP_DOWNSCALE_MSK \
+	(0x7 << JPEG_V780_HW_CAP_DOWNSCALE_POS)
+
+#define JPEG_V780_RST_CMD_FE_RESET_MSK			BIT(0)
+#define JPEG_V780_RST_CMD_WE_RESET_MSK			BIT(1)
+#define JPEG_V780_RST_CMD_ENCODER_RESET_MSK		BIT(4)
+#define JPEG_V780_RST_CMD_DECODER_RESET_MSK		BIT(5)
+#define JPEG_V780_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT(6)
+#define JPEG_V780_RST_CMD_SCALE_RESET_MSK		BIT(7)
+#define JPEG_V780_RST_CMD_REGISTER_RESET_MSK		BIT(13)
+#define JPEG_V780_RST_CMD_MISR_RESET_MSK		BIT(16)
+#define JPEG_V780_RST_CMD_CORE_RESET_MSK		BIT(17)
+#define JPEG_V780_RST_CMD_JPEG_V780_DOMAIN_RESET_MSK	BIT(29)
+#define JPEG_V780_RST_CMD_RESET_BYPASS_MSK		BIT(31)
+
+#define JPEG_V780_CORE_CFG_FE_ENABLE_MSK	BIT(0)
+#define JPEG_V780_CORE_CFG_WE_ENABLE_MSK	BIT(1)
+#define JPEG_V780_CORE_CFG_ENC_ENABLE_MSK	BIT(4)
+#define JPEG_V780_CORE_CFG_SCALE_ENABLE_MSK	BIT(7)
+#define JPEG_V780_CORE_CFG_TESTBUS_ENABLE_MSK	BIT(19)
+#define JPEG_V780_CORE_CFG_MODE_MSK		BIT(24)
+#define JPEG_V780_CORE_CFG_CGC_DISABLE_MSK	BIT(31)
+
+#define JPEG_V780_CMD_HW_START_MSK		BIT(0)
+#define JPEG_V780_CMD_HW_STOP_MSK		BIT(1)
+#define JPEG_V780_CMD_CLR_RD_PLN0_QUEUE_MSK	BIT(4)
+#define JPEG_V780_CMD_CLR_RD_PLN1_QUEUE_MSK	BIT(5)
+#define JPEG_V780_CMD_CLR_RD_PLN2_QUEUE_MSK	BIT(6)
+#define JPEG_V780_CMD_CLR_WR_PLN0_QUEUE_MSK	BIT(8)
+#define JPEG_V780_CMD_CLR_WR_PLN1_QUEUE_MSK	BIT(9)
+#define JPEG_V780_CMD_CLR_WR_PLN2_QUEUE_MSK	BIT(10)
+#define JPEG_V780_CMD_APPLY_SWC_RD_PARAMS_MSK	BIT(11)
+
+#define JPEG_V780_CORE_STATE_STATUS_ENCODE_STATE_MSK	BIT(0)
+#define JPEG_V780_CORE_STATE_STATUS_SCALE_STATE_MSK	BIT(2)
+#define JPEG_V780_CORE_STATE_STATUS_REALTIME_STATE_MSK	BIT(4)
+#define JPEG_V780_CORE_STATE_STATUS_BUS_STATE_MSK	BIT(8)
+#define JPEG_V780_CORE_STATE_STATUS_CGC_STATE_MSK	BIT(9)
+
+#define JPEG_V780_FE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V780_FE_CFG_BYTE_ORDERING_MSK \
+	(0xf << JPEG_V780_FE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V780_FE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V780_FE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xf << JPEG_V780_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V780_FE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V780_FE_CFG_MEMORY_FORMAT_MSK \
+	(0x3 << JPEG_V780_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V780_FE_CFG_CBCR_ORDER_MSK		BIT(12)
+#define JPEG_V780_FE_CFG_BOTTOM_VPAD_EN_MSK	BIT(13)
+#define JPEG_V780_FE_CFG_PLN0_EN_MSK		BIT(16)
+#define JPEG_V780_FE_CFG_PLN1_EN_MSK		BIT(17)
+#define JPEG_V780_FE_CFG_PLN2_EN_MSK		BIT(18)
+#define JPEG_V780_FE_CFG_SIXTEEN_MCU_EN_MSK	BIT(21)
+#define JPEG_V780_FE_CFG_MCUS_PER_BLOCK_MSK	BIT(22)
+#define JPEG_V780_FE_CFG_MAL_BOUNDARY_MSK	BIT(24)
+#define JPEG_V780_FE_CFG_MAL_EN_MSK		BIT(27)
+
+#define JPEG_V780_PLN_RD_OFFS_OFFSET_POS 0
+#define JPEG_V780_PLN_RD_OFFS_OFFSET_MSK \
+	(0x1fffffff << JPEG_V780_PLN_RD_OFFS_OFFSET_POS)
+
+#define JPEG_V780_PLN_RD_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V780_PLN_RD_BUFF_SIZE_WIDTH_MSK \
+	(0xffff << JPEG_V780_PLN_RD_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V780_PLN_RD_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V780_PLN_RD_BUFF_SIZE_HEIGHT_MSK \
+	(0xffff << JPEG_V780_PLN_RD_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V780_PLN_RD_STRIDE_STRIDE_POS 0
+#define JPEG_V780_PLN_RD_STRIDE_STRIDE_MSK \
+	(0xffff << JPEG_V780_PLN_RD_STRIDE_STRIDE_POS)
+
+#define JPEG_V780_PLN_RD_HINIT_FRACTIONAL_POS 0
+#define JPEG_V780_PLN_RD_HINIT_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V780_PLN_RD_HINIT_FRACTIONAL_POS)
+
+#define JPEG_V780_PLN_RD_VINIT_FRACTIONAL_POS 0
+#define JPEG_V780_PLN_RD_VINIT_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V780_PLN_RD_VINIT_FRACTIONAL_POS)
+
+#define JPEG_V780_WE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V780_WE_CFG_BYTE_ORDERING_MSK \
+	(0xf << JPEG_V780_WE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V780_WE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V780_WE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xf << JPEG_V780_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V780_WE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V780_WE_CFG_MEMORY_FORMAT_MSK \
+	(0x3 << JPEG_V780_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V780_WE_CFG_CBCR_ORDER_MSK		BIT(12)
+#define JPEG_V780_WE_CFG_PLN0_EN_MSK		BIT(16)
+#define JPEG_V780_WE_CFG_PLN1_EN_MSK		BIT(17)
+#define JPEG_V780_WE_CFG_PLN2_EN_MSK		BIT(18)
+#define JPEG_V780_WE_CFG_MAL_BOUNDARY_MSK	BIT(24)
+#define JPEG_V780_WE_CFG_MAL_EN_MSK		BIT(27)
+#define JPEG_V780_WE_CFG_POP_BUFF_ON_EOS_MSK	BIT(28)
+
+#define JPEG_V780_PLN_WR_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V780_PLN_WR_BUFF_SIZE_WIDTH_MSK \
+	(0xffff << JPEG_V780_PLN_WR_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V780_PLN_WR_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V780_PLN_WR_BUFF_SIZE_HEIGHT_MSK \
+	(0xffff << JPEG_V780_PLN_WR_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V780_PLN_WR_STRIDE_STRIDE_POS 0
+#define JPEG_V780_PLN_WR_STRIDE_STRIDE_MSK \
+	(0xffff << JPEG_V780_PLN_WR_STRIDE_STRIDE_POS)
+
+#define JPEG_V780_PLN_WR_HINIT_INTEGER_POS 0
+#define JPEG_V780_PLN_WR_HINIT_INTEGER_MSK \
+	(0xffff << JPEG_V780_PLN_WR_HINIT_INTEGER_POS)
+
+#define JPEG_V780_PLN_WR_VINIT_INTEGER_POS 0
+#define JPEG_V780_PLN_WR_VINIT_INTEGER_MSK \
+	(0xffff << JPEG_V780_PLN_WR_VINIT_INTEGER_POS)
+
+#define JPEG_V780_PLN_WR_HSTEP_INTEGER_POS 0
+#define JPEG_V780_PLN_WR_HSTEP_INTEGER_MSK \
+	(0x1ffff << JPEG_V780_PLN_WR_HSTEP_INTEGER_POS)
+
+#define JPEG_V780_PLN_WR_VSTEP_INTEGER_POS 0
+#define JPEG_V780_PLN_WR_VSTEP_INTEGER_MSK \
+	(0x1ffff << JPEG_V780_PLN_WR_VSTEP_INTEGER_POS)
+
+#define JPEG_V780_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS 0
+#define JPEG_V780_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK \
+	(0xffff << JPEG_V780_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS)
+
+#define JPEG_V780_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS 16
+#define JPEG_V780_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK \
+	(0xffff << JPEG_V780_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS)
+
+#define JPEG_V780_ENC_CFG_IMAGE_FORMAT_POS 0
+#define JPEG_V780_ENC_CFG_IMAGE_FORMAT_MSK \
+	(0x7 << JPEG_V780_ENC_CFG_IMAGE_FORMAT_POS)
+
+#define JPEG_V780_ENC_CFG_APPLY_EOI_MSK		BIT(7)
+#define JPEG_V780_ENC_CFG_HUFFMAN_SEL_MSK	BIT(8)
+#define JPEG_V780_ENC_CFG_FSC_ENABLE_MSK	BIT(11)
+#define JPEG_V780_ENC_CFG_OUTPUT_DISABLE_MSK	BIT(15)
+#define JPEG_V780_ENC_CFG_RST_MARKER_PERIOD_MSK	BIT(16)
+
+#define JPEG_V780_ENC_IMG_SIZE_ENCODE_WIDTH_POS 0u
+#define JPEG_V780_ENC_IMG_SIZE_ENCODE_WIDTH_MSK \
+	(0x1fffu << JPEG_V780_ENC_IMG_SIZE_ENCODE_WIDTH_POS)
+
+#define JPEG_V780_ENC_IMG_SIZE_ENCODE_HEIGHT_POS 16u
+#define JPEG_V780_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK \
+	(0x1fffu << JPEG_V780_ENC_IMG_SIZE_ENCODE_HEIGHT_POS)
+
+#define JPEG_V780_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS 0
+#define JPEG_V780_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_MSK \
+	(0x1fffffff << JPEG_V780_OUTPUT_SIZE_STATUS_OUT_SIZE_BYTES_POS)
+
+#define JPEG_V780_SCALE_CFG_HSCALE_ENABLE_MSK		BIT(4)
+#define JPEG_V780_SCALE_CFG_VSCALE_ENABLE_MSK		BIT(5)
+#define JPEG_V780_SCALE_CFG_UPSAMPLE_EN_MSK		BIT(6)
+#define JPEG_V780_SCALE_CFG_SUBSAMPLE_EN_MSK		BIT(7)
+#define JPEG_V780_SCALE_CFG_HSCALE_ALGO_MSK		BIT(8)
+#define JPEG_V780_SCALE_CFG_VSCALE_ALGO_MSK		BIT(9)
+
+#define JPEG_V780_SCALE_CFG_H_SCALE_FIR_ALGO_POS  12u
+#define JPEG_V780_SCALE_CFG_H_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V780_SCALE_CFG_H_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V780_SCALE_CFG_V_SCALE_FIR_ALGO_POS  16u
+#define JPEG_V780_SCALE_CFG_V_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V780_SCALE_CFG_V_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V780_SCALE_OUT_CFG_BLOCK_WIDTH_POS 0
+#define JPEG_V780_SCALE_OUT_CFG_BLOCK_WIDTH_MSK \
+	(0xff << JPEG_V780_SCALE_OUT_CFG_BLOCK_WIDTH_POS)
+
+#define JPEG_V780_SCALE_OUT_CFG_BLOCK_HEIGHT_POS 16
+#define JPEG_V780_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK \
+	(0xf << JPEG_V780_SCALE_OUT_CFG_BLOCK_HEIGHT_POS)
+
+#define JPEG_V780_SCALE_PLN_HSTEP_FRACTIONAL_POS 0
+#define JPEG_V780_SCALE_PLN_HSTEP_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V780_SCALE_PLN_HSTEP_FRACTIONAL_POS)
+
+#define JPEG_V780_SCALE_PLN_HSTEP_INTEGER_POS 21
+#define JPEG_V780_SCALE_PLN_HSTEP_INTEGER_MSK \
+	(0x3f << JPEG_V780_SCALE_PLN_HSTEP_INTEGER_POS)
+
+#define JPEG_V780_SCALE_PLN_VSTEP_FRACTIONAL_POS 0
+#define JPEG_V780_SCALE_PLN_VSTEP_FRACTIONAL_MSK \
+	(0x1fffff << JPEG_V780_SCALE_PLN_VSTEP_FRACTIONAL_POS)
+
+#define JPEG_V780_SCALE_PLN_VSTEP_INTEGER_POS 21
+#define JPEG_V780_SCALE_PLN_VSTEP_INTEGER_MSK \
+	(0x3f << JPEG_V780_SCALE_PLN_VSTEP_INTEGER_POS)
+
+#define JPEG_V780_DMI_CFG_MEM_SEL_POS 0
+#define JPEG_V780_DMI_CFG_MEM_SEL_MSK \
+	(0x7 << JPEG_V780_DMI_CFG_MEM_SEL_POS)
+
+#define JPEG_V780_DMI_CFG_AUTO_INC_EN_MSK	BIT(4)
+
+#define JPEG_V780_DMI_ADDR_ADDR_POS 0
+#define JPEG_V780_DMI_ADDR_ADDR_MSK \
+	(0x3ff << JPEG_V780_DMI_ADDR_ADDR_POS)
+
+#define JPEG_V780_TESTBUS_CFG_BUS_SEL_POS 0
+#define JPEG_V780_TESTBUS_CFG_BUS_SEL_MSK \
+	(0x3f << JPEG_V780_TESTBUS_CFG_BUS_SEL_POS)
+
+#define JPEG_V780_FE_VBPAD_CFG_BLOCK_ROW_POS 0
+#define JPEG_V780_FE_VBPAD_CFG_BLOCK_ROW_MSK \
+	(0x1fff << JPEG_V780_FE_VBPAD_CFG_BLOCK_ROW_POS)
+
+#define JPEG_V780_PLN_RD_HINIT_INT_INTEGER_POS 0
+#define JPEG_V780_PLN_RD_HINIT_INT_INTEGER_MSK \
+	(0x1ffff << JPEG_V780_PLN_RD_HINIT_INT_INTEGER_POS)
+
+#define JPEG_V780_PLN_RD_VINIT_INT_INTEGER_POS 0
+#define JPEG_V780_PLN_RD_VINIT_INT_INTEGER_MSK \
+	(0x1ffff << JPEG_V780_PLN_RD_VINIT_INT_INTEGER_POS)
+
+#define JPEG_V780_IRQ_STATUS_SESSION_DONE_MSK		BIT(0)
+#define JPEG_V780_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	BIT(4)
+#define JPEG_V780_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	BIT(5)
+#define JPEG_V780_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK	BIT(6)
+#define JPEG_V780_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	BIT(7)
+#define JPEG_V780_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	BIT(8)
+#define JPEG_V780_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK	BIT(9)
+#define JPEG_V780_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	BIT(10)
+#define JPEG_V780_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	BIT(11)
+#define JPEG_V780_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK	BIT(12)
+#define JPEG_V780_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	BIT(13)
+#define JPEG_V780_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	BIT(14)
+#define JPEG_V780_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK	BIT(15)
+#define JPEG_V780_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	BIT(19)
+#define JPEG_V780_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	BIT(20)
+#define JPEG_V780_IRQ_STATUS_DCD_COEFF_ERROR_MSK	BIT(21)
+#define JPEG_V780_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	BIT(22)
+#define JPEG_V780_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	BIT(23)
+#define JPEG_V780_IRQ_STATUS_DCD_INVALID_RSM_MSK	BIT(24)
+#define JPEG_V780_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	BIT(25)
+#define JPEG_V780_IRQ_STATUS_DCD_MISSING_RSM_MSK	BIT(26)
+#define JPEG_V780_IRQ_STATUS_STOP_ACK_MSK		BIT(27)
+#define JPEG_V780_IRQ_STATUS_RESET_ACK_MSK		BIT(28)
+
+#define JPEG_V780_IRQ_STATUS_ENABLE_ALL_MSK		~0
+#define JPEG_V780_IRQ_STATUS_DISABLE_ALL_MSK		0
+#define JPEG_V780_IRQ_STATUS_CLEAR_ALL_MSK		JPEG_V780_IRQ_STATUS_ENABLE_ALL_MSK
+
+const u32 qcom_v780_jpeg_hw_reg_mask[] = {
+	[JMSK_HW_VER_STEP]			= JPEG_V780_HW_VER_STEP_MSK,
+	[JMSK_HW_VER_MINOR]			= JPEG_V780_HW_VER_MINOR_MSK,
+	[JMSK_HW_VER_MAJOR]			= JPEG_V780_HW_VER_MAJOR_MSK,
+
+	[JMSK_HW_CAP_ENCODE]			= JPEG_V780_HW_CAP_ENCODE_MSK,
+	[JMSK_HW_CAP_DECODE]			= JPEG_V780_HW_CAP_DECODE_MSK,
+	[JMSK_HW_CAP_UPSCALE]			= JPEG_V780_HW_CAP_UPSCALE_MSK,
+	[JMSK_HW_CAP_DOWNSCALE]		= JPEG_V780_HW_CAP_DOWNSCALE_MSK,
+
+	[JMSK_RST_CMD_COMMON]			=
+		(JPEG_V780_RST_CMD_FE_RESET_MSK			|
+		 JPEG_V780_RST_CMD_WE_RESET_MSK			|
+		 JPEG_V780_RST_CMD_ENCODER_RESET_MSK		|
+		 JPEG_V780_RST_CMD_BLOCK_FORMATTER_RST_MSK	|
+		 JPEG_V780_RST_CMD_SCALE_RESET_MSK		|
+		 JPEG_V780_RST_CMD_REGISTER_RESET_MSK		|
+		 JPEG_V780_RST_CMD_MISR_RESET_MSK		|
+		 JPEG_V780_RST_CMD_CORE_RESET_MSK		|
+		 JPEG_V780_RST_CMD_JPEG_V780_DOMAIN_RESET_MSK),
+
+	[JMSK_RST_CMD_FE_RESET]			= JPEG_V780_RST_CMD_FE_RESET_MSK,
+	[JMSK_RST_CMD_WE_RESET]			= JPEG_V780_RST_CMD_WE_RESET_MSK,
+	[JMSK_RST_CMD_ENCODER_RESET]		= JPEG_V780_RST_CMD_ENCODER_RESET_MSK,
+	[JMSK_RST_CMD_DECODER_RESET]		= JPEG_V780_RST_CMD_DECODER_RESET_MSK,
+	[JMSK_RST_CMD_BLOCK_FORMATTER_RST]	= JPEG_V780_RST_CMD_BLOCK_FORMATTER_RST_MSK,
+	[JMSK_RST_CMD_SCALE_RESET]		= JPEG_V780_RST_CMD_SCALE_RESET_MSK,
+	[JMSK_RST_CMD_REGISTER_RESET]		= JPEG_V780_RST_CMD_REGISTER_RESET_MSK,
+	[JMSK_RST_CMD_MISR_RESET]		= JPEG_V780_RST_CMD_MISR_RESET_MSK,
+	[JMSK_RST_CMD_CORE_RESET]		= JPEG_V780_RST_CMD_CORE_RESET_MSK,
+	[JMSK_RST_CMD_JMSK_DOMAIN_RESET]	= JPEG_V780_RST_CMD_JPEG_V780_DOMAIN_RESET_MSK,
+	[JMSK_RST_CMD_RESET_BYPASS]		= JPEG_V780_RST_CMD_RESET_BYPASS_MSK,
+
+	[JMSK_CORE_CFG_FE_ENABLE]		= JPEG_V780_CORE_CFG_FE_ENABLE_MSK,
+	[JMSK_CORE_CFG_WE_ENABLE]		= JPEG_V780_CORE_CFG_WE_ENABLE_MSK,
+	[JMSK_CORE_CFG_ENC_ENABLE]		= JPEG_V780_CORE_CFG_ENC_ENABLE_MSK,
+	[JMSK_CORE_CFG_SCALE_ENABLE]		= JPEG_V780_CORE_CFG_SCALE_ENABLE_MSK,
+	[JMSK_CORE_CFG_TESTBUS_ENABLE]		= JPEG_V780_CORE_CFG_TESTBUS_ENABLE_MSK,
+	[JMSK_CORE_CFG_MODE]			= JPEG_V780_CORE_CFG_ENC_ENABLE_MSK,
+	[JMSK_CORE_CFG_CGC_DISABLE]		= JPEG_V780_CORE_CFG_CGC_DISABLE_MSK,
+
+	[JMSK_CMD_HW_START]			= JPEG_V780_CMD_HW_START_MSK,
+	[JMSK_CMD_HW_STOP]			= JPEG_V780_CMD_HW_STOP_MSK,
+
+	[JMSK_CMD_CLR_RD_PLNS_QUEUE]		=
+		(JPEG_V780_CMD_CLR_RD_PLN0_QUEUE_MSK |
+		 JPEG_V780_CMD_CLR_RD_PLN1_QUEUE_MSK |
+		 JPEG_V780_CMD_CLR_RD_PLN2_QUEUE_MSK),
+	[JMSK_CMD_CLR_WR_PLNS_QUEUE]		=
+		(JPEG_V780_CMD_CLR_WR_PLN0_QUEUE_MSK |
+		 JPEG_V780_CMD_CLR_WR_PLN1_QUEUE_MSK |
+		 JPEG_V780_CMD_CLR_WR_PLN2_QUEUE_MSK),
+
+	[JMSK_CMD_APPLY_SWC_RD_PARAMS]	= JPEG_V780_CMD_APPLY_SWC_RD_PARAMS_MSK,
+
+	[JMSK_CORE_STATUS_ENCODE_STATE]	= JPEG_V780_CORE_STATE_STATUS_ENCODE_STATE_MSK,
+	[JMSK_CORE_STATUS_SCALE_STATE]	= JPEG_V780_CORE_STATE_STATUS_SCALE_STATE_MSK,
+	[JMSK_CORE_STATUS_RT_STATE]	= JPEG_V780_CORE_STATE_STATUS_REALTIME_STATE_MSK,
+	[JMSK_CORE_STATUS_BUS_STATE]	= JPEG_V780_CORE_STATE_STATUS_BUS_STATE_MSK,
+	[JMSK_CORE_STATUS_CGC_STATE]	= JPEG_V780_CORE_STATE_STATUS_CGC_STATE_MSK,
+
+	[JMSK_IRQ_ENABLE_ALL]		= JPEG_V780_IRQ_STATUS_ENABLE_ALL_MSK,
+	[JMSK_IRQ_DISABLE_ALL]		= JPEG_V780_IRQ_STATUS_DISABLE_ALL_MSK,
+	[JMSK_IRQ_CLEAR_ALL]		= JPEG_V780_IRQ_STATUS_CLEAR_ALL_MSK,
+
+	[JMSK_IRQ_STATUS_SESSION_DONE]	= JPEG_V780_IRQ_STATUS_SESSION_DONE_MSK,
+
+	[JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE]	= JPEG_V780_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE]	= JPEG_V780_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE]	= JPEG_V780_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK,
+	[JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN]	=
+		(JPEG_V780_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	|
+		 JPEG_V780_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	|
+		 JPEG_V780_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK),
+
+	[JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE]	= JPEG_V780_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE]	= JPEG_V780_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE]	= JPEG_V780_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK,
+	[JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN]	=
+		(JPEG_V780_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	|
+		 JPEG_V780_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	|
+		 JPEG_V780_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK),
+
+	[JMSK_IRQ_STATUS_SESSION_ERROR]	=
+		(JPEG_V780_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	|
+		 JPEG_V780_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	|
+		 JPEG_V780_IRQ_STATUS_DCD_COEFF_ERROR_MSK	|
+		 JPEG_V780_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	|
+		 JPEG_V780_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	|
+		 JPEG_V780_IRQ_STATUS_DCD_INVALID_RSM_MSK	|
+		 JPEG_V780_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	|
+		 JPEG_V780_IRQ_STATUS_DCD_MISSING_RSM_MSK),
+
+	[JMSK_IRQ_STATUS_STOP_ACK]		= JPEG_V780_IRQ_STATUS_STOP_ACK_MSK,
+	[JMSK_IRQ_STATUS_RESET_ACK]		= JPEG_V780_IRQ_STATUS_RESET_ACK_MSK,
+
+	[JMSK_FE_CFG_BYTE_ORDERING]		= JPEG_V780_FE_CFG_BYTE_ORDERING_MSK,
+	[JMSK_FE_CFG_BURST_LENGTH_MAX]	= JPEG_V780_FE_CFG_BURST_LENGTH_MAX_MSK,
+	[JMSK_FE_CFG_MEMORY_FORMAT]		= JPEG_V780_FE_CFG_MEMORY_FORMAT_MSK,
+	[JMSK_FE_CFG_CBCR_ORDER]		= JPEG_V780_FE_CFG_CBCR_ORDER_MSK,
+	[JMSK_FE_CFG_BOTTOM_VPAD_EN]		= JPEG_V780_FE_CFG_BOTTOM_VPAD_EN_MSK,
+	[JMSK_FE_CFG_PLN0_EN]			= JPEG_V780_FE_CFG_PLN0_EN_MSK,
+	[JMSK_FE_CFG_PLN1_EN]			= JPEG_V780_FE_CFG_PLN1_EN_MSK,
+	[JMSK_FE_CFG_PLN2_EN]			= JPEG_V780_FE_CFG_PLN2_EN_MSK,
+	[JMSK_FE_CFG_SIXTEEN_MCU_EN]		= JPEG_V780_FE_CFG_SIXTEEN_MCU_EN_MSK,
+	[JMSK_FE_CFG_MCUS_PER_BLOCK]		= JPEG_V780_FE_CFG_MCUS_PER_BLOCK_MSK,
+	[JMSK_FE_CFG_MAL_BOUNDARY]		= JPEG_V780_FE_CFG_MAL_BOUNDARY_MSK,
+	[JMSK_FE_CFG_MAL_EN]			= JPEG_V780_FE_CFG_MAL_EN_MSK,
+
+	[JMSK_FE_VBPAD_CFG_BLOCK_ROW]		= JPEG_V780_FE_VBPAD_CFG_BLOCK_ROW_MSK,
+
+	[JMSK_PLNS_RD_OFFSET]			= JPEG_V780_PLN_RD_OFFS_OFFSET_MSK,
+	[JMSK_PLNS_RD_BUF_SIZE_WIDTH]	= JPEG_V780_PLN_RD_BUFF_SIZE_WIDTH_MSK,
+	[JMSK_PLNS_RD_BUF_SIZE_HEIGHT]	= JPEG_V780_PLN_RD_BUFF_SIZE_HEIGHT_MSK,
+	[JMSK_PLNS_RD_STRIDE]			= JPEG_V780_PLN_RD_STRIDE_STRIDE_MSK,
+	[JMSK_PLNS_RD_HINIT]			= JPEG_V780_PLN_RD_HINIT_FRACTIONAL_MSK,
+	[JMSK_PLNS_RD_VINIT]			= JPEG_V780_PLN_RD_VINIT_FRACTIONAL_MSK,
+
+	[JMSK_WE_CFG_BYTE_ORDERING]		= JPEG_V780_WE_CFG_BYTE_ORDERING_MSK,
+	[JMSK_WE_CFG_BURST_LENGTH_MAX]	= JPEG_V780_WE_CFG_BURST_LENGTH_MAX_MSK,
+	[JMSK_WE_CFG_MEMORY_FORMAT]		= JPEG_V780_WE_CFG_MEMORY_FORMAT_MSK,
+	[JMSK_WE_CFG_CBCR_ORDER]		= JPEG_V780_WE_CFG_CBCR_ORDER_MSK,
+	[JMSK_WE_CFG_PLN0_EN]			= JPEG_V780_WE_CFG_PLN0_EN_MSK,
+	[JMSK_WE_CFG_PLN1_EN]			= JPEG_V780_WE_CFG_PLN1_EN_MSK,
+	[JMSK_WE_CFG_PLN2_EN]			= JPEG_V780_WE_CFG_PLN2_EN_MSK,
+	[JMSK_WE_CFG_MAL_BOUNDARY]		= JPEG_V780_WE_CFG_MAL_BOUNDARY_MSK,
+	[JMSK_WE_CFG_MAL_EN]			= JPEG_V780_WE_CFG_MAL_EN_MSK,
+	[JMSK_WE_CFG_POP_BUFF_ON_EOS]		= JPEG_V780_WE_CFG_POP_BUFF_ON_EOS_MSK,
+
+	[JMSK_PLNS_WR_BUF_SIZE_WIDTH]	= JPEG_V780_PLN_WR_BUFF_SIZE_WIDTH_MSK,
+	[JMSK_PLNS_WR_BUF_SIZE_HEIGHT]	= JPEG_V780_PLN_WR_BUFF_SIZE_HEIGHT_MSK,
+
+	[JMSK_PLNS_WR_STRIDE]			= JPEG_V780_PLN_WR_STRIDE_STRIDE_MSK,
+	[JMSK_PLNS_WR_HINIT]			= JPEG_V780_PLN_WR_HINIT_INTEGER_MSK,
+	[JMSK_PLNS_WR_VINIT]			= JPEG_V780_PLN_WR_VINIT_INTEGER_MSK,
+	[JMSK_PLNS_WR_HSTEP]			= JPEG_V780_PLN_WR_HSTEP_INTEGER_MSK,
+	[JMSK_PLNS_WR_VSTEP]			= JPEG_V780_PLN_WR_VSTEP_INTEGER_MSK,
+
+	[JMSK_PLNS_WR_BLOCK_CFG_PER_COL]	= JPEG_V780_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK,
+	[JMSK_PLNS_WR_BLOCK_CFG_PER_RAW]	= JPEG_V780_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK,
+
+	[JMSK_SCALE_CFG_HSCALE_ENABLE]	= JPEG_V780_SCALE_CFG_HSCALE_ENABLE_MSK,
+	[JMSK_SCALE_CFG_VSCALE_ENABLE]	= JPEG_V780_SCALE_CFG_VSCALE_ENABLE_MSK,
+	[JMSK_SCALE_CFG_UPSAMPLE_EN]		= JPEG_V780_SCALE_CFG_UPSAMPLE_EN_MSK,
+	[JMSK_SCALE_CFG_SUBSAMPLE_EN]		= JPEG_V780_SCALE_CFG_SUBSAMPLE_EN_MSK,
+	[JMSK_SCALE_CFG_HSCALE_ALGO]		= JPEG_V780_SCALE_CFG_HSCALE_ALGO_MSK,
+	[JMSK_SCALE_CFG_VSCALE_ALGO]		= JPEG_V780_SCALE_CFG_VSCALE_ALGO_MSK,
+	[JMSK_SCALE_CFG_H_SCALE_FIR_ALGO]	= JPEG_V780_SCALE_CFG_H_SCALE_FIR_ALGO_MSK,
+	[JMSK_SCALE_CFG_V_SCALE_FIR_ALGO]	= JPEG_V780_SCALE_CFG_V_SCALE_FIR_ALGO_MSK,
+
+	[JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH]	= JPEG_V780_SCALE_OUT_CFG_BLOCK_WIDTH_MSK,
+	[JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT]	= JPEG_V780_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK,
+
+	[JMSK_SCALE_PLNS_HSTEP_FRACTIONAL]	= JPEG_V780_SCALE_PLN_HSTEP_FRACTIONAL_MSK,
+	[JMSK_SCALE_PLNS_HSTEP_INTEGER]	= JPEG_V780_SCALE_PLN_HSTEP_INTEGER_MSK,
+	[JMSK_SCALE_PLNS_VSTEP_FRACTIONAL]	= JPEG_V780_SCALE_PLN_VSTEP_FRACTIONAL_MSK,
+	[JMSK_SCALE_PLNS_VSTEP_INTEGER]	= JPEG_V780_SCALE_PLN_VSTEP_INTEGER_MSK,
+
+	[JMSK_ENC_CFG_IMAGE_FORMAT]		= JPEG_V780_ENC_CFG_IMAGE_FORMAT_MSK,
+	[JMSK_ENC_CFG_APPLY_EOI]		= JPEG_V780_ENC_CFG_APPLY_EOI_MSK,
+	[JMSK_ENC_CFG_HUFFMAN_SEL]		= JPEG_V780_ENC_CFG_HUFFMAN_SEL_MSK,
+	[JMSK_ENC_CFG_FSC_ENABLE]		= JPEG_V780_ENC_CFG_FSC_ENABLE_MSK,
+	[JMSK_ENC_CFG_OUTPUT_DISABLE]		= JPEG_V780_ENC_CFG_OUTPUT_DISABLE_MSK,
+	[JMSK_ENC_CFG_RST_MARKER_PERIOD]	= JPEG_V780_ENC_CFG_RST_MARKER_PERIOD_MSK,
+	[JMSK_ENC_IMAGE_SIZE_WIDTH]		= JPEG_V780_ENC_IMG_SIZE_ENCODE_WIDTH_MSK,
+	[JMSK_ENC_IMAGE_SIZE_HEIGHT]		= JPEG_V780_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK,
+};
+
+const struct qcom_jpeg_reg_offs qcom_v780_jpeg_hw_reg_offs = {
+	.hw_version	= 0x000,
+	.hw_capability	= 0x004,
+	.reset_cmd	= 0x008,
+	.core_cfg	= 0x00c,
+	.hw_cmd		= 0x010,
+	.int_mask	= 0x018,
+	.int_clr	= 0x01c,
+	.int_status	= 0x020,
+	.enc_core_state = 0x014,
+
+	.fe = {
+		.pntr	= { 0x038, 0x044, 0x050 },
+		.offs	= { 0x03c, 0x048, 0x054 },
+		.cnsmd	= { 0x040, 0x04c, 0x058 },
+		.bsize	= { 0x060, 0x068, 0x070 },
+		.stride	= { 0x064, 0x06c, 0x08c },
+		.hinit	= { 0x074, 0x078, 0x07c },
+		.vinit	= { 0x080, 0x084, 0x088 },
+		.pntr_cnt	= 0x05c,
+		.vbpad_cfg	= 0x2e8
+	},
+	.fe_cfg		= 0x024,
+
+	.we = {
+		.pntr	= { 0x0cc, 0x0d0, 0x0d4 },
+		.cnsmd	= { 0x0d8, 0x0dc, 0x0e0 },
+		.bsize	= { 0x0e8, 0x0ec, 0x0f0 },
+		.stride	= { 0x0f4, 0x0f8, 0x0fc },
+		.hinit	= { 0x100, 0x104, 0x108 },
+		.hstep	= { 0x118, 0x11c, 0x120 },
+		.vinit	= { 0x10c, 0x110, 0x114 },
+		.vstep	= { 0x124, 0x128, 0x12c },
+		.blocks	= { 0x130, 0x134, 0x138 },
+		.pntr_cnt = 0x0e4
+	},
+	.we_cfg		= 0x0c0,
+
+	.scale = {
+		.hstep	= { 0x27c, 0x280, 0x284 },
+		.vstep	= { 0x28c, 0x290, 0x294 },
+	},
+	.scale_cfg	= 0x26c,
+	.scale_out_cfg	= { 0x270, 0x274, 0x278 },
+
+	.enc_cfg	= 0x13c,
+	.enc_img_size	= 0x140,
+	.enc_out_size	= 0x180,
+
+	.dmi_cfg	= 0x298,
+	.dmi_data	= 0x2a0,
+	.dmi_addr	= 0x29c,
+};
+
+#endif /* QCOM_JENC_HW_INFO_V780_H */

-- 
2.34.1


