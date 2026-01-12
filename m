Return-Path: <linux-media+bounces-50390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A69D11279
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A4393022D14
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 08:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8B533C1BE;
	Mon, 12 Jan 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbX4B3ZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ds02Nuk+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C123E33C50A
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205481; cv=none; b=HzaWetangXuMNWjWE0N0dgGSmz35rtSfaeM4jxD3gLbrlmr47gaMJvPxx0uRA7YnTMhHzYH0A6LvjeJDAr/tuk3fwhQOn5bmC1ABYCMy0ec2tYuhoTSkuQJbBF0bFHIZjRF8heHAonxVE46w9YY5aeJpAZnTKgTfFHT2sBwBxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205481; c=relaxed/simple;
	bh=7T8vgAkN1iRq56eTJtnuXnjThKJcOshuvvlIvEcslgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tSDIxOJn/ENJQt5oPhgP1xb2E78B+cXP1GMaKLKs0AVkXdsCa30Xx+3rHXCGZLHlbR1CUPPcQZEA2rIaz4B14X709ysCMrikQMfY9NdceN3QgmffSJOnEL1wjLoOTpxunsO1B/f78oeYtlTQpHBLScNHUeMU+64z0c+DOfFAp6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbX4B3ZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ds02Nuk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C85a8Z4186301
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+aW01MHjFglmw8m1Dm+eiQ
	DA4p0GQEOO6R0QXAKCp4Q=; b=FbX4B3ZHvD2bjnnLPBhvwioZD1ZCSXhFMAtxst
	ClB4AZVq6feErliqVKQGWE1a7VZQ/XAgxPukbkG8Fc0XORkq19kmKrfUMdt+N3wk
	ezvMxhsndhcEsTAqxfOvJa22N0RAVv9gS/yOqC65GX6eLzry/+m9h33fTEtbC2Ki
	8GLBWD3rz5U+WsaY9UAMONnNTjKKC9TR90AY6j3o3h+mzJ2mpoI/JIM8CHj0P4Yj
	pAk9gf9lMNhKN4j9XHtEOwglNxzehYpWnGytMwGZCOzIwj+Xlch2DW/LGmirNxUW
	ipNEkS974NVv4n7JPTHP264CtJiAyVUi9uWxTxjWMiSP9czw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu4646-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:11:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11f4500c7ebso7957836c88.0
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 00:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768205477; x=1768810277; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aW01MHjFglmw8m1Dm+eiQDA4p0GQEOO6R0QXAKCp4Q=;
        b=Ds02Nuk+CRDSBrMi+Iq2sEK9WU2p8BIQTS0+0utdNoKGULmpZA0wM2K4MPThNb8IxZ
         73ge3N6pwbxhrdYLdAoUkL1iRXRuf1H61UR/uI4j6XkNTJbAC0j23CE9GSuxjmQwsf5/
         TZO2uDhSSeC0QsgDNSJi52o1/4O3lQKzzm85xY1a7nkLdoU21ifU1G8wGZ0W61znBjo4
         wBvlpyPyxs6NqPLeWfGeDhKyYrdMI/vdNL8Xsd+1fPHsFUrIR4CN+bcEGKXLII1rtrQ4
         Av6nK3gnuC48N6nkX7naBgCofYTPG36Qsbfk8jKeSnanKOH0Uvb9kEit9w6T3T8K/C1U
         yGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205477; x=1768810277;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aW01MHjFglmw8m1Dm+eiQDA4p0GQEOO6R0QXAKCp4Q=;
        b=sqV2KrCdqNCjhJCIxD7VCfgpsRcZT+qBzzgJTZ8WekzKY/+Dj4Ywzx7Uj7DhgO+uuD
         8JDGXt6CAx3KSyh29Ut99ClGiKrOgxw0fJJzo/JrD+fkAC32DxEg6R6qu5j4g9fws8ui
         RqNuljt8E2j7GgvwT9ecJMgl8cYYRGOOa68mLu6lbkeVOV9j8lkd7VbyzUPyGwSLi8AF
         VoFMKeFzKEy8D+XJ/q21leUDJGru2KuBjGPpLXacNAHUBdDG2PtxqI/CWcOb2FpsoYsa
         Vl59+5Pl24M+6WtpZO+h2JsLcwN9mRWYfhlAEtY+IYg8j3kaBsTuf1lXXtQ1r30ONY0E
         uvNw==
X-Gm-Message-State: AOJu0Yz0ko4EoQ4W+KTdUQtnvR5WnVHPZEzWwBAnDvsQccA5kbQXp63l
	jpp1YJKuxqFZqJfnHkIwi17FkPdWB6EKchoisknj+PlWvW0HgdDGD4EXXJhUlgXz1CPSZanqLkH
	Bbxe8TfJ10FmAtJ6asD4k4IAcOozdk+wFG042qP6E97IF9rzDQ1+0vA6vqoloPeZ+1sspUzyRdg
	==
X-Gm-Gg: AY/fxX75Ya2vMN7cs299WOYS41j3yv05qfTM7hPxe59zlcbnockLSxwpa6YURNwAcPz
	7E4+BCQJnHMwTwFby6c/B/LT/wh7f9HPXtTj9vJswDwURDCJyUGH6QUX7CVPtrkoSymJR4wpvmP
	DYa23+DehFwpJcfu3RO0irne1QB7+hp8ZqBrNfFO57ZNuj+pQE77wtOUtI88rLlNDDdKXqeMXsU
	R0uWWY4pcpMQiVa1qdTfcefilE8ZsDNnquIPt/z3kDtGS8hpnZGVUCdPfDPZfdCKYzXLPwRRA2c
	nsII+kgr5QpshVZaNF0/hNGO+zz/0HFx7GzV3sx9KcGDZYYtw+Ul2Mm7eX4anpXqMKTXAT6SwNG
	0PRPkFtB07a8erp62DEP1ga3QKuBw5aXtNAfWPF9vONyFL41AfIpcPGOsU2cv6SJs
X-Received: by 2002:a05:7022:41a8:b0:11e:3e9:3ea2 with SMTP id a92af1059eb24-121f8b9ff28mr16780792c88.49.1768205477218;
        Mon, 12 Jan 2026 00:11:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0dh1tKE35w+qhEQZR0WEWIHO46+PK3rynuF8rypSXo2l6vQvT+YkeZQSk6zTDK210PtB9ug==
X-Received: by 2002:a05:7022:41a8:b0:11e:3e9:3ea2 with SMTP id a92af1059eb24-121f8b9ff28mr16780777c88.49.1768205476586;
        Mon, 12 Jan 2026 00:11:16 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24985d1sm23991992c88.16.2026.01.12.00.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:11:16 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 00:11:09 -0800
Subject: [PATCH v2] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-camss-extended-csiphy-macro-v2-1-ee7342f2aaf5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJysZGkC/zWP3Q7CIAyFX2Xh2hqYG7pd+R7GCwbFEWVMyozG+
 O42/ly0yUnb7/Q8BWEOSKKvniLjLVBIE4t6VQk7mumEEBxrUctaS6UUWBOJAO8FJ4cOLIV5fEA
 0Nidodnro/GboWukFE+aMPtw/9MORtc8pQhkzmj+zVbLe8PUZ/yQqpiz0A3Kx2Xwxxacc4aZAQ
 bttdNNo553Vex6vr4u52BTjmtvPNeN14Sjlay0GQ8znlVD6auLf4RtHduL4er0BNn8A4AQBAAA
 =
X-Change-ID: 20260111-camss-extended-csiphy-macro-486b9f3b950f
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: zP2tz617JG2sVaaC6XBnjZfehv-QTyS9
X-Proofpoint-ORIG-GUID: zP2tz617JG2sVaaC6XBnjZfehv-QTyS9
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6964aca6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9Q_BnDspRnD-vgfqZOIA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MyBTYWx0ZWRfX4CcRBMw2OBN9
 m4N7JjDvylZUwZyWoOjYvAJR1LOE1le9hScIpOriv38/u9TLvZWf8c9+Yz2Mr0aaviot22vFfJb
 1TJLIqvyKZDYox+VAeRkt6s4JjlF01fN/SvBjujD4WNfNDai+7bD505FFK1lvwsG/cRyL054ium
 lnvljJH6krVCvqyf6FCFwqd62HNf7iujQWQ05zP2nw34yKnlbcStZVVOJBuPeTrRYHTZDdFCYZ9
 UDgEYf12ZKiF92Ctw2bGFEAEvU0aGIBWFhCNP854ArD7dXsf05qaohcDmCEm9kHlzJuURLrVzbO
 407ySbgWQslhGr/UUsAdf8JfVpzwD60L7obFkXouIL7QBWjM6iksE/b0VQRsaPumeGJDHBFdQpd
 WQnxLykOeMMbS/UVoNyEuOQgvEMPBgqxx7yuqGi46A4B90KB2lJ1m64Vr2Fk+LI4zylvDsH5ox3
 U1RFD3ANXBCPJpgHScw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120063

The current value of '0xb0' that represents the offset to the status
registers within the common registers of the CSIPHY has been changed on
the newer SOCs and it requires generalizing the macro using a new
variable 'common_status_offset'. This variable is initialized in the
csiphy_init() function.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change introduces common_status_offset to replace the hardcoded
offset in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn.
---
Changes in v2:
- Rebase this series due to conflict - bod
- Link to v1: https://lore.kernel.org/r/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 19 +++++++++++++------
 drivers/media/platform/qcom/camss/camss-csiphy.h      |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 619abbf60781..d70d4f611798 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -46,7 +46,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_DEFAULT_PARAMS		0
 #define CSIPHY_LANE_ENABLE		1
@@ -810,13 +811,17 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
 	hw_version = readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 12));
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 13)) << 8;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 14)) << 16;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 15)) << 24;
 
 	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
@@ -845,7 +850,8 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
 	for (i = 0; i < 11; i++) {
 		int c = i + 22;
 		u8 val = readl_relaxed(csiphy->base +
-				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
+			CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+							  regs->common_status_offset, i));
 
 		writel_relaxed(val, csiphy->base +
 			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
@@ -1086,6 +1092,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 
 	csiphy->regs = regs;
 	regs->offset = 0x800;
+	regs->common_status_offset = 0xb0;
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c44..2d5054819df7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -90,6 +90,7 @@ struct csiphy_device_regs {
 	const struct csiphy_lane_regs *lane_regs;
 	int lane_array_size;
 	u32 offset;
+	u32 common_status_offset;
 };
 
 struct csiphy_device {

---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20260111-camss-extended-csiphy-macro-486b9f3b950f

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


