Return-Path: <linux-media+bounces-64417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MK0eEvJIKWp3TgMAu9opvQ
	(envelope-from <linux-media+bounces-64417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:22:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF63668B4A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:22:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hxZbFVmB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64417-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64417-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4EF4308C825
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DBF402422;
	Wed, 10 Jun 2026 11:11:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F095E406285
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:11:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089903; cv=none; b=mxVJ1mU5XGmzGjdgWFYY2heJiKyx/egI53+20KIE69dkeSrK3XFtJfM3j9KgZtkVImAiNGE10fj3Tga5OQbITasVk1nLU5UlgXCWZmFO1k+g/Cs0KwMNNIM5XzsnmkFGfZcMikyVg9dJ8SPySRjKBDtRxsbPxHi17/fyyFrL7ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089903; c=relaxed/simple;
	bh=u/ihBuRn411q7r2cqeHRKnXLHVg1nNx7cEQIFjgZxiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sc2HdOXomPU/rocuxAF4H5sz6US+bZ6Mu/v5fnMHSXfKBEVK3OlYgtkYGB+4DtRKN0q73vy5gouqv8wJmEjwkFQHeo1CIV//vorm0P3Bt+1akgFYofgrgRnhc4vAgsprRxzgNoNbUKdk9C3Ai6/3hku/fQ5ZSAcsJoteIUNDqa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxZbFVmB; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf36a6905cso47222375ad.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089898; x=1781694698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cQ+ac5l+4cyouLoZKEF9xKzE/GgGPCqhOFMn5EQIOQ=;
        b=hxZbFVmBPe5cJm7ekFWvttb0yatdBGvl3udE2OfzaGd6VTl108m2fbldPUceXGQQKc
         87e9JZQjGXqLsKKmBRXxl8eEeR5ddVHnN5H9OS58bQPSN7lkapJ2WX3YOeseitAOPc8g
         Mjk4sMwi5JUsZN9eiN9tIDgE8+zN7/DLERgT2STodoE+ozcx+7MlXhM4BogBl4hFGSMf
         UzLcpmDohaUbHMyfHDPM37FzbUT1jezfcDVB73NKfwJ8Nk66U+B1E6vVN9zcPvMJBj/E
         Jo9myV5zEQ2/2mNPrgK8BplH5iW+qeQkUblvIttF9XYXvxj/gEJe/H/WXSLaFeHy4lI7
         Hw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089898; x=1781694698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2cQ+ac5l+4cyouLoZKEF9xKzE/GgGPCqhOFMn5EQIOQ=;
        b=ajUsoWkkcru0UbO1jlnP1eTM1+T1J6BQOSne7vJxMexrZ3w2Ja0DAHDV5E87wnM/DS
         H48A+Y9pbhQDetW54HKJWTvhFerVdtRlgNxt0Z4ddon2jfFhXc7niEoaK9auIJXgrKjw
         kf+lXhnRf6A5N8H6OPvEj+mIX/BuXORrjcWOo/qP4d91PilVqRz/zimVqTF43zeJx/gz
         LNBFlo0XZJiv7hXN+vYK0y9eEjNDjU6AviWpUTKGs1THGwPyJwC4F281kVUH0UV6dX4T
         b0hotKJMx3jmmNodQmLcF9UaEmsQCBdZhw4oU7MIRcVj222ufngJgsneqmqmp3hQ/GA6
         je/A==
X-Forwarded-Encrypted: i=1; AFNElJ8LzDJok6+m7kcUYoybNnzUuAdlndtGuJoIt/RtoOd1fDpNaz8FCE0c6mvxc7eXYvAjWJ5gfTEKPn7asQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw85n8CwWu7btdUUmfUtd1Yb7fZSsWmBQ9GRDwk/1+BK8dFF6OQ
	x84Om6FmE3gELCS07Mb2Axg4va4PBit1phoweYn/v8pHSH4WY26x1lsm
X-Gm-Gg: Acq92OEFQlLjjB8ts8iUCRTx3I757+tntFNIH4WQy9b/NUj9pq99eHqhVN/U1CMaJaV
	iI/NfJdWoBTpFQTEzuPWB8a2v6nD9g9ErtKRRwq+ldlcvbse1ssn37e2kHsypjC9yJEQlJ+YhTv
	mUM8pAMlTDu00onsGAmLZoD9f82xteYEerbBpL+fzt6akp1MCVcvogoBjLvUUTunGakrcdxdvO+
	r+CYDf/evZjVak179t3j4GXcLGh+gBQ3htyYpG56fvCJvty3Vww+Y9+mux5/e0A8UDNssBV6hWI
	z0zLryePQ00Ic5n7as4qeBdxONGiUCkuo2U1gu+mogKEoa6krHwEtkvuvDWxjLBO/qbvPmHPBNM
	opuXb8WNHpRIVOR2N6RsAO7vw0y+3SRPAnUoYsUf+lfHfHDuEHjGBFurkhi26aJJpbqg4agUCJ7
	X9L3jvknEYasJjN99NGFBOjOhDsovRmn1hQ8YAvA==
X-Received: by 2002:a17:902:f541:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c2a1bb43e7mr80521495ad.1.1781089898069;
        Wed, 10 Jun 2026 04:11:38 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:37 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:33 +0530
Subject: [PATCH 8/9] dt-bindings: phy: qcom: add MIPI CSI2 mode constants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-8-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=u/ihBuRn411q7r2cqeHRKnXLHVg1nNx7cEQIFjgZxiI=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYQ/WfQ91PlBPr5CIEMS+b24iqufT/+lTQZV
 lRTuKzhDL2JAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGEAAKCRAVlYpeERwF
 3ux5EAComyAGYJYXSz0Kedtwa3VvHC+ooYDXeq57/vamu1NAvwb4diNkw53gmBkSW4le5AFIYdL
 pHh1QptSN1zemv0sXpOlV6geujC7WRUKsD2a5hWAmhaIxH8wClbp3IN29xy6R/eECch4+TLsbpH
 dWurBuTLHJ3mANXIUwlSh5dpyOuwFWbbEXsMO7yMu9gv6tjlRauhXsFoPyTm7kQ5YowStSgNkxc
 k9Un+ZPq/mb6lSsVRpB5BoWutb6zfnJea028Ye7pVswDOv5Y/vZbTRVhRlE5b4kcz+dIzML710j
 w1wzQl1MW/EX0m7RHE5RtuiBb8IefH25HpxZatEoX1ATBMT3cFbGTh1mj/e38VA4eR/HuafsK/7
 +9XDw4IQ3R8aIp0m5O6qxnCapXCaaGD/DEHXQKE3YBFpviAIka+fG5mwdgxSRjGcoBRQ5DU8KTl
 8KYQVmtArETg4k1WRyxxlgFITfCPIWRrk1ym9SbXsdTSA6RH+BrYDJl+WP1mQ4PUKv/hI7ZkUgc
 BdZ/4LADyfMMkstYmtmF/tXffcTDoqWwDhkOf0M7QdEGlfTNgm0x0lfTByC6t229zVzOmkAWOwg
 +llY8eYurHAkSLTFUU4jXAC3itej7SHqcMgvP1VH76rSQ77fAAVljR541n6AJn267f+3tmjgH/d
 vxLeWjWyurqs//w==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64417-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EF63668B4A

The CSI2-PHY binding references <dt-bindings/phy/phy-qcom-mipi-csi2.h>
and consumers (the x1e80100/hamoa camss DTSI) select D-PHY mode with
PHY_QCOM_CSI2_MODE_DPHY, but the v8 CSI2-PHY series does not ship the
header, so any DT that includes it fails to build.

Add the header with the CSI2 mode constants and cover it in MAINTAINERS.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 MAINTAINERS                                  |  1 +
 include/dt-bindings/phy/phy-qcom-mipi-csi2.h | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ece71732e6dd..a7ee9f0aaaa8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22280,6 +22280,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/phy/qcom,*-csi2-phy.yaml
 F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
 F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
+F:	include/dt-bindings/phy/phy-qcom-mipi-csi2*
 
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
diff --git a/include/dt-bindings/phy/phy-qcom-mipi-csi2.h b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
new file mode 100644
index 000000000000..fa48fd75c58d
--- /dev/null
+++ b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Qualcomm MIPI CSI2 PHY constants
+ *
+ * Copyright (C) 2026 Linaro Limited
+ */
+
+#ifndef __DT_BINDINGS_PHY_MIPI_CSI2__
+#define __DT_BINDINGS_PHY_MIPI_CSI2__
+
+#define PHY_QCOM_CSI2_MODE_DPHY		0
+#define PHY_QCOM_CSI2_MODE_CPHY		1
+#define PHY_QCOM_CSI2_MODE_SPLIT_DPHY	2
+
+#endif /* __DT_BINDINGS_PHY_MIPI_CSI2__ */

-- 
2.53.0


