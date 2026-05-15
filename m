Return-Path: <linux-media+bounces-61669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB67Ca8CB2qVqgIAu9opvQ
	(envelope-from <linux-media+bounces-61669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:25:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9D554E603
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E865B3022B7C
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E5B47D954;
	Fri, 15 May 2026 11:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DE1yCxuz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IysSYmDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FE347B436
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844214; cv=none; b=WL17q2c9i7pOvzZNhRJsuVELbadLGF+NpGSDWVx4C5e6ZdED9G/YeOAtnTx10jyUBp5w2PWnfCql/xy+2G4LwHBsdm8VzlQNfhbJpT9QQrtXzpo7+Q5VMYj0ojaSGvfEs01ga6ExuI+qTaV6B5QZVXWUygJTXllM9JfIjGVbpBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844214; c=relaxed/simple;
	bh=j0MWzPvgoLPGw6n8S8L+DpK+l56gsLOdQ6ijqkKlcaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiH6k6cYeNGrLmTcZ03mmYHsGNC5GtIqMoOmrHmYqaMbPabhcdO/Ecox6T++oV+JClCNEC2/Zej/tEpSaLB9JPyr2MkhNSQg+ugC3jLd+LI2tLAIkRP76jgLhiEg4CaB8WfK/oQ8eIGSh7aGwXCb2kcyRf/7Pbdu9QboT8ovG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DE1yCxuz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IysSYmDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9HqvE1715145
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HLJq5uY1ZDp7/ijaCB204uGa/x909UxX1syJvDVWjDE=; b=DE1yCxuzCQlmubmL
	V3AtreGvA5kmrCbctl4ONQd4Hv99zpbZdPhqDHAHzE7wWUOXpo6Mk4x3OttiUnox
	dOwt2riXsdhnFEKCIagHez2OfQWmbWzzHfM4JcNrvhjuNu9szp26eTrzByqtecwT
	Q+gCN0J/xeGpUBEXBXewdbszX+6lo6iBf4VT7XS1V4ymn+lup6l8hgTgIne2zErL
	8Oe7BqUQB91wp8KWA26cHyp1q1BNG/pcOY21jZqo5wsXgaYP6mp87TkdekxS/lRL
	Z4WANSVf+DZlE4KgBOolQ+Cu25kV+eIWeZdOGEkLdfqjfT8JiY5tavhuh1XrP1v5
	rBqhSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxst2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36603ad6709so9581463a91.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844212; x=1779449012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLJq5uY1ZDp7/ijaCB204uGa/x909UxX1syJvDVWjDE=;
        b=IysSYmDxUblNc2KKGwCTFlFkyunuKJ/WEVo+DyYWwEYuU2weCZbLL9jQflbMllMD3r
         NDhkMGuK0dQoHyQJNXBAoJNPEFsmzXc28UfrLiZghXV969F3nFkvQiLJm6biMsiQSqS/
         KHRwGg7vVaxXMNEwJNTcQ83yjsuPknoLC/+nugEPWjedgOc8tHDaLvtfqZThx/zKiJyv
         9Qhb+F4hY9cP0EJVV+aTJq8Rk0PGBteGfw7ZgCHs28BWnATvcuoj0YlPKlwHXdRWCKIX
         w3K61dpvNvgTTydpjBgD3q1k8CBvEpVNTRSMlQt5KdhRzq97nSWFPB6ig7Zfjj9kjFMW
         F+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844212; x=1779449012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HLJq5uY1ZDp7/ijaCB204uGa/x909UxX1syJvDVWjDE=;
        b=O11gFIn5J3j/MF+Iim1pA34kdvWyJ5dsEO4K7xi+N4aDvVKOuUeHCLAq4kmuy50Nrc
         vS6GFlmYBdMVmbnc83Ryab7QtrBrrl74v1ibEdmR3pvOWwMDcyNft0EVUu+Z7rQrC8YP
         yNyQ1qvHDV7dzJaI1LTSL7q3iWRUlpK/IxtlCHmLVAVfUY+/Z01oKt3P0P7u9nq24uDs
         pBnSEgBPFAAFKBm0lVbf4mKmRY+WfKsJ3D4dxOZrjbN1qJ10YPx8WhWX2yocB6FcalP+
         gEmt3FL3h44f7XlZ7e8wmkPo3dProH4ISJCuUHHHb80JHfUspT/FRC2J0f/aL/Z+1MsY
         Ue8w==
X-Forwarded-Encrypted: i=1; AFNElJ9begW2ULliDlEwWItQEFkVQREjnwjH9+LAGedFLmttnuXsGsdvo/zgMjuzcMTeIFiNr1/+21Yr57sSiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JGQbiI2dLiEoGnz9dmOnL3WmzHwUEOWszlOYG5yvZuJgVPoq
	5xaifo8mZV5VYQ6KfeVI30HbUIu/SsVeutT8UNMgwBTRZQKmL0t3+CET3AlZunl5iEhD8bFRSd8
	bKXwRte2TAtixaJvWIeSHyvV+4K6kzYX7mvsI0uB7pToeaE6zqJBWClZitqjDhypBKRlC7UXKNA
	==
X-Gm-Gg: Acq92OF4NxoPCLmN3LABR7CnlrkZuQep6/pH2T9a5QtLnYAyCsIj1UPbYuCj/6rBXir
	dbJ5WCWiE6dApnvTxv0xPV71XB66ljElKgAa4Dw80rEo9Cy0ky1Z7L017LOvh7LiQk4jWmVH54r
	nkKPzggxdwKTjruoD16RHK8i2slSJb/bh+0yuzc1WvH02MHKB+64d6gcmagsSgyWIXMg/1auA2A
	ltQPi5gmZhgqejGoQ8tj3LG+vgj6rYcM2UhwT3SXpnkq8JrRvNvEtiyKoXMjoowvg/W2D9DPIhm
	oeCI0J2xV3us4VbrbU950KTBsB5gr3mZoZpW4GPkWZFe7F7trNCA6fnpCRNJ+YdKW2tWP+tVYFb
	8hInLrCDNVH4wV+OHVWCCSQrDiBswEDpNxC0YQ0sJJkwXiKw/Gg3b7Lo=
X-Received: by 2002:a17:90b:1f8c:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-369518b2048mr3565613a91.6.1778844211648;
        Fri, 15 May 2026 04:23:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8c:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-369518b2048mr3565574a91.6.1778844211141;
        Fri, 15 May 2026 04:23:31 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:30 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:16 +0530
Subject: [PATCH v6 01/14] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-1-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
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
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=5399;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=3STlk6tvEix+1H4qQRvpao3EQf0zCnIXrlwAJ17Tn1k=;
 b=i0pFyI/Xy2g3DshYTpkqE43Hm9w2B0URHMhKQCpyXlASJB5XLVb03c9Wv48D4C7dl75y83XIj
 YrGBuu+ZQt4B80BO6lFqEekM9fhjrybhqCUEmyv7XrCUx/ih/YU3Hbh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a070234 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=6cGehGV22KE80QuxIsQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Irew_1Bo0DgoJmTZFHeH7eNmtVl8PItZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXynpLEwFgFIUt
 ceSQGnsRKAyuyab9sJfEhpdd8E+aTEPsHCWNt0L7TVXTHzDVAh4Za8onKKV8DjXkLOX0RcrLJ63
 m3kfkmRGdNPGZpJsEOuBmTma0t+4AKGBuL2g15bynnv+0sJsduBzqI68VrBS/zBD1S/hIzrWc+2
 4niNK2jxoiZntEXWu/B2gd0EhujbSerSNp7P97S2WOW85/X1Iit7l8y0RE361SI2Mon6lcSbGo8
 8RdZLiM/sz4+9wg4oeZ1ZpEL2nNQo6EaTa0g/x7jUGVrqRF+0XYh2EYkw99zox5CDxe7IfiBgQA
 3RSQi0ctOxuHVk2Eh0IGy7p2083pG5wWjCgp8pVbFC17fBzPA0tGtjbwsC5LLT6R/S8nwTnGCXY
 FzbAApqe8zmmHALqFPiq8dy+9za4YxuP11zVaR/GUK51kihU9p48VJGTZI/pdPn1/ShW49IPjw7
 XVzPyOAXyqZc+ycLMug==
X-Proofpoint-GUID: Irew_1Bo0DgoJmTZFHeH7eNmtVl8PItZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 0F9D554E603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61669-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
associated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 MAINTAINERS                                     |  1 +
 drivers/media/platform/qcom/iris/Kconfig        |  4 ++
 drivers/media/platform/qcom/iris/Makefile       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 ++++++++++
 5 files changed, 92 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63389fea5d15..c53d94d7b153 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22017,6 +22017,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
+F:	include/linux/iris_vpu_bus.h
 
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index af78a1775937..76c9fcd253df 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -1,3 +1,6 @@
+config QCOM_IRIS_VPU_BUS
+        bool
+
 config VIDEO_QCOM_IRIS
         tristate "Qualcomm iris V4L2 decoder driver"
         depends on VIDEO_DEV
@@ -5,6 +8,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER
         select QCOM_SCM
+        select QCOM_IRIS_VPU_BUS
         select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..6deadd531c8e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -30,3 +30,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..e3327b227332
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = (const u32 *)dev_get_platdata(dev);
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static void iris_vpu_bus_release_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = iris_vpu_bus_release_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+	dev->platform_data = (void *)iommu_fid;
+	dev_set_name(dev, "%s", name);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(iris_vpu_bus_create_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	return bus_register(&iris_vpu_bus_type);
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..62af9ee7e288
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_IRIS_VPU_BUS_H
+#define _LINUX_IRIS_VPU_BUS_H
+
+#include <linux/device.h>
+
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *iris_vpu_bus_create_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1


