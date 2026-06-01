Return-Path: <linux-media+bounces-63274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPldBgecHWpucgkAu9opvQ
	(envelope-from <linux-media+bounces-63274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:49:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E7621297
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD27B3024193
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 14:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E61A3C0617;
	Mon,  1 Jun 2026 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3G2gQBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJFsckr4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066923AFB07
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325042; cv=none; b=ayFIQOAXadkw6oZZggBUh8W99DyKhMa/zEnTTdege/809DMY7b0L8lldU/I6aEOtXhBDK2SHS7Js1u5JUBTpBDqj65Mz3XTs6sX6iIBl1e+VXm8pOlDt2EuGlvpiy0OS+zHp7bqc+53zqfqfLxMjdUpcUghjXuC+/v6284v3iRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325042; c=relaxed/simple;
	bh=N6c38JRUAszf5/liy1AJCAUPHKkM078LMV0KgQRiJVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m2vBB1P1GIP6PQC2cvdf6WMHY3N4TWIhQyszkQeWBnFWA+MY14A6yol7LDUdZkIMPfMiXOxxseYd39i+o/Tfh2ZaBDLPL77ISE59ftpS/FKlgxC20T84AJT7a/zPa2uXT/0aWA54U9tzvf5nmSwTvL2KvvMtyRfMlhiPzYp1gcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3G2gQBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJFsckr4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EakjH2740445
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 14:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s/dVAMDYklnIjRMwsKkL0V
	rHnKFzaoTe8yhRBOtC8rk=; b=W3G2gQBdWPvl37KcjkkQBNttGkhSdp8u25YB+5
	rtkLyjcel6izKcBw+93N4KYwXeSEz/YwxnkkOnBke/LOykkuKH6S4pgHA8xasI46
	a0mgP244RnaG+Ksy0o7cESCQhitEQ/uSAngigViC7Pl+h9xnyvSjDDk26XYAtDul
	yF0MotpZ3XHK5tcgb9dHteHVcRj+5CKZxLssbL+Iff/TEsCRZUQmKReiNfisBHW2
	5Gx3/gEEaRYy52fcy763UllypRCt0t2i9BQDmaZnmMMf8kIjKzD/LlnOF1eJkCr+
	INdAF9eRJeUbJemimHpNeVrJ5KrvORQ4fwaUMAHYjpXTsehQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqhgm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 14:44:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ea42b025so1434369eec.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780325039; x=1780929839; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/dVAMDYklnIjRMwsKkL0VrHnKFzaoTe8yhRBOtC8rk=;
        b=WJFsckr4y72zUuBF6E974aBjskCjCmlnSIavzeIi/sOVx4OVvWxLd4jP7Sse+TPITn
         boSM9rGRBY3DXdnxSzz+ErQCouU4C/xPwaFeRJxnJp8Lutx0gB8jbSu6J9LWGl8RUH3L
         i0WLjDj2kenThAyOkAos923eecGCo/3EopvaD1aYpKMv/eri17TT+xUB6YyypV0RGrE1
         vPKei9T58WQ8aU2AoFblQS8YOyOw2spkfAKuT9o/yisAQGeyhTqnD30uQsK092W+iq+Y
         yWvmyUQMpVEMC2a36sVD1LPw/3HtXtWgw6rjESP4a5T5/nVKTf5kyi34bvZfbN73atS6
         EkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325039; x=1780929839;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/dVAMDYklnIjRMwsKkL0VrHnKFzaoTe8yhRBOtC8rk=;
        b=DNmvEiZ6xXiAimrLI4eepNo2lZN5veqRiarYdrQkz3U9G6elOzHDqsEFKKWBkqBAfo
         +Uy0uDdjL00+3MVkYukuEcQ7wcnu2v+W9zx0na8xjANUODYIr7Pabhii8ScN2J9vWP2Z
         Viwl+2iUooKmX3rXLWdfCemwEdhDlcvoFRvkLR0RAeefNN2w46WCUQyQAVfNEexBqtn5
         /+WaMRycYKBwo3R3AoDw82QL5ePxzgkLj/s0sqoEMFqQfkfbYszq+okclNfsRHNQOs1J
         ZFYuQY5fr9G4WwFg+dgFdOfiyYzMoCeQx+0Uj/n/DPp8BnT+cI8JX/+AU1VkMj9WJTJ7
         M1bA==
X-Gm-Message-State: AOJu0YwRWp4yl1qi73DC/GyIKKKV3dUlrUJ4MqPa/vxNEPNvP6abSEAL
	z3FSbdc2TZv1ZnD/4tW/UuCjH2K41swpkw1UReLpf5+m6PO90jax6hpEhLP180w+LwNnNKBwvgR
	gBZ2xUz+/Btz+WjVjOqaji//0M5dQlkRztVcclxmwjpEBI1Hblu/1IonRcj1L3d9PFg==
X-Gm-Gg: Acq92OHZYRMFCYGUMSjQAsZL52fJBd7KkyIkI/XQZBr5YYGu2nzJ8+AGfVgfQmrI1IK
	dXMReEaGABeX45UXnA1AN+5Nxfdb7ZSI2BLPlUM1xaE0lMDZVzT7v/jShrCcyu/IgH2IN4NM8Sa
	OX78zK4BqgNXH2ybOr25OJJdiRSEoDenCJmuxLUyo3iF1uI1q375RGfHyMbgHGGA2tWL5PlNvAH
	Ju6g52SJZB2oYv3wRhC8YUYfgCxFfm/NPTQFN7UMSvbXhlvPYeHhFKoz3qPLXFzEsiZYDHS/sn/
	sCSa/v5Rm8k16X3gZmFJhya8X9Deoaq8ZOzZvlatgSnICTkrTldZUxP/vYfYR4H85wvReO5rYpo
	f4RIzQJTlgXsGQ/ACNUoit9U5ToazEvm16Vcrt4r4nlUJacfTLcHA8NSjfezoNu1VU6Qzidpkxg
	eIgFjN0Z7tG7A=
X-Received: by 2002:a05:7300:5b9e:b0:2c6:67b6:3acc with SMTP id 5a478bee46e88-304eb1e9955mr6425781eec.15.1780325039444;
        Mon, 01 Jun 2026 07:43:59 -0700 (PDT)
X-Received: by 2002:a05:7300:5b9e:b0:2c6:67b6:3acc with SMTP id 5a478bee46e88-304eb1e9955mr6425758eec.15.1780325038871;
        Mon, 01 Jun 2026 07:43:58 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c154fsm8169661eec.3.2026.06.01.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:43:58 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 07:43:53 -0700
Subject: [PATCH] media: qcom: camss: csid: Consolidate
 CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKiaHWoC/yXMQQ6DIBCF4auQWXcSRGqiV2lcUJi2swBaBhsT4
 90luvxf8r4NhAqTwKQ2KPRn4ZxadDcF/uPSm5BDazDaDHrQHXoXRTA6XzL2wWpvg6VRB2iPb6E
 Xr6f2mK8u9FsaWq8Rnk4IfY6R66QSrRVP+G5GmPf9AE6ELIOOAAAA
X-Change-ID: 20260601-camss-macro-3d40c4d4e90d
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: ybeKsxd2SAOWN10IrSj0fHNXuvMM4szO
X-Proofpoint-GUID: ybeKsxd2SAOWN10IrSj0fHNXuvMM4szO
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d9ab0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DR9wR5qphd0UyIk5iGcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE0NyBTYWx0ZWRfX9BtGjb8m7yYL
 vjgOq1R62AkqsJYm1JUHr4RWZOABRSNhi28MqTdVnhv7Hms/Hf8bK09B09bQ7MoXGQVsIIPDHde
 TyPwMhYxSZGBnkkaxcnJbmwhWp/+5ajpbUuhrmplSVDCQgjPl0Ge39MkNUAZdID+qd+xHGG67Zg
 BKj2Oh3YoOde5ZQfL4zEaJh7lziLo3hUOyevuGmFxySUVPvq4+4KfJwTv2+v5bdL3mzyCm1/DQ5
 /aVRk3m1933jHRY1bA5w6X6TbzFL/PJOyVda2tJfysMCfpHNcwHqsh/wlfSxWNWJ53iyfv8jtAT
 cSXY+p4+o1Xy6tFu2w71M3KvuOKvmnp6/sPLiGzWTJltPKjjFU4CZ+HOtrF1lnfn8hBuImDLyTf
 EAgtkV9MiLQjp2OcRqWZCQ5G0jV9Fiybh2BXBIckKFIcZpEPxToammUydGLcQqbkGopV35CvDBi
 DPUibbLgcRn79hpF4Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010147
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-63274-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 222E7621297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
header. This eliminates redundancy and makes the constant available
to future CSID implementations.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
header. This eliminates redundancy and makes the constant available
to future CSID implementations.
---
 drivers/media/platform/qcom/camss/camss-csid-680.c  | 1 -
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 1 -
 drivers/media/platform/qcom/camss/camss-csid.h      | 2 ++
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb94..bf7164085ddb 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -101,7 +101,6 @@
 #define		CSI2_RX_CFG0_DL2_INPUT_SEL			12
 #define		CSI2_RX_CFG0_DL3_INPUT_SEL			16
 #define		CSI2_RX_CFG0_PHY_NUM_SEL			20
-#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
 #define		CSI2_RX_CFG0_PHY_TYPE_SEL			24
 #define		CSI2_RX_CFG0_TPG_MUX_EN				BIT(27)
 #define		CSI2_RX_CFG0_TPG_MUX_SEL			GENMASK(29, 28)
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27d..da9458cd178b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -105,7 +105,6 @@
 #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 							(0x34C + 0x100 * (rdi)) :\
 							(0x54C + 0x100 * (rdi)))
-#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
 
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..059ac94ad1be 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -27,6 +27,8 @@
 /* CSID hardware can demultiplex up to 4 outputs */
 #define MSM_CSID_MAX_SRC_STREAMS	4
 
+/* CSIPHY to hardware PHY selector mapping */
+#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
 #define CSID_RESET_TIMEOUT_MS 500
 
 enum csid_testgen_mode {

---
base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
change-id: 20260601-camss-macro-3d40c4d4e90d

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


