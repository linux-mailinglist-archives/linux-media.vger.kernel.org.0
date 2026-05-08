Return-Path: <linux-media+bounces-60947-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO0CCuwz/mmHnwAAu9opvQ
	(envelope-from <linux-media+bounces-60947-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:05:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 971B64FAE8F
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DDDB30A8280
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81BC421F1F;
	Fri,  8 May 2026 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+CjV61q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7PzmwKw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075493FE34D
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266903; cv=none; b=sVqtbHoFEtW1FoqnIVfgxUa7L99X9ZAiF4i6l9sDrd6c1DLQEewOQg0qdPjjYj78O4JFpMg+92fXYIb6ptFcBn9Pwef9wDTvQqjYc6A5csr5cBOySBmttwLhKfHG7NZgyAkRbxHktZV7DR+34zlunMPJauzmfhgWmwHFR1CDbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266903; c=relaxed/simple;
	bh=2FrychMIG3LHR9amZA9Bhyd149/t+cV8/TYXT9nsgoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DyPDlhql++RvmU17C06SEVy0tsMXM1Z7gOriiyEaq3PNvo/IQdZt+fMou1VzBraSxt54TBZoV68TqPyiayunL5F7W0G4xYlIJNJwLhFghf+f+k1Md6yGlwYNd9MZjjY6IO7FHmftmuKjxjyrMt/OpV20mwcA3FxTfm7d6GzJXUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+CjV61q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7PzmwKw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648Hed0T1661877
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dn3CzzlpHtBN1CICIkLhbSzmIcgQM8PPO9ueTKjRmq4=; b=J+CjV61qhcCvq2DY
	nZd2eo9lQeK/2x/HQzhpBteFjbsmnCSj6r/z2ddHQXrCKtSg2CQ25bsH8ZskXc+2
	SLPCNB7ki11GN7K3g8Ul+ow9ZaaFbZw0JHIS9c2IUBZSGoPXIQb0yvDN6vARn4Wa
	9qkY6h0Q9wJEzy5+N3Kgkq7+7UXK//+s7znAdf/E7ZBQtJrxR6Vvbsfvz0ZaWWqj
	BsyyXLoCQQO5cHue7ovuf5D4UbfIjhI+R1/cEoD9ASQ+2Q8y5QRyWKRaTu2Rap6t
	CZrpvmbrTU2j5PfsioLBAVHWwXdzmeG/ni7aWc7zUW9B6PwK+4vMgODzmLWa258W
	rO1+aA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1men08t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:01:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso1646230b3a.3
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266900; x=1778871700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dn3CzzlpHtBN1CICIkLhbSzmIcgQM8PPO9ueTKjRmq4=;
        b=e7PzmwKwofl9k+a9H2eRu7IVMowwC8L6zGEamPYazLqH0PKyKsI2CNwk7LHT3aA8TD
         KboSI8vZwL2lIBZQwnM86mPFH3tWGyztW1fPFkcC1WIyP0BqX5XinJ0qTCwGURbdoqJ6
         aU6ZlJaqurWbqLhz6AKzRelqBN6u3nvZGgeYlHYqwMjibxYzHwvc7+OjMyAA920K29MM
         toX5PtHAh+iRgpOkBk7MW1TX+268YANyTh3xgklCS5++znFVMQj1V3uby0ygAs0hh5VI
         mUraiW3Ci1WlvwI87QLfckcHPcwszhBIP8EOSyXlfRMH5lWSDFWE2Jwl0mPxotBaapiS
         OKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266900; x=1778871700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dn3CzzlpHtBN1CICIkLhbSzmIcgQM8PPO9ueTKjRmq4=;
        b=ddXC62tmP2pWaM+rnECRXnQy+sGYChmxt8KSy50S5WTeY1zix+sLL48bJI2z0RGaTN
         fVnWyl+oYY6wQRcw60bvKeCLXZZv/9wtAxswDlE0+ToY0CHzr7DpGaHWxcPs/6V5rqbE
         c9hnvX20qcJspPBC+ljtA/2VDbUOVm1Tox8sNnOEMxeE8l77CANcjc7gmJGRmcwnO8pc
         rHcYEl53YjJnbMmIWyVWltFkuRO3Bi+hUCPrxgcunsRD7z86y0PaZnlYtxjJSF1cz4I/
         LOWVeSdSmnOwpT2IFxq6Zc+uvk/1EgldSdZDK71T6oq3YOKb/qUArwJI2D1KdSRRYG7o
         xa0w==
X-Forwarded-Encrypted: i=1; AFNElJ8ZbXRI4iTl2l5vwTszeWoxS8WOUgaTYebdl8uijxqtqCLCQ7LbP+Do/Ju6i2nQ0NaoAIAygxUgaBXrqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydqhlIvMgI/PMvfpkWm/KPMFoSRJUiXz5ztWNuCb+uBEqVtVxe
	U1/cR2tYPsuuhCdOfMSaDDUCgHLiYznG2Gzl2P9bJhlOPq53CT83biGcl4fveLFAUmo5mDTwwc3
	xxlS6CnXbr4gPZ8ec89I3elJ5SpJCSD+IeG4Hap1+lXGFIVO210bUf+6x7IC6ZszxPj6I4QknRQ
	==
X-Gm-Gg: Acq92OFsCpGC2HIucryBzU38G/MCszfH4vsNAAG+PfyWBl4XtBPSqGV+V+mbKjtwZ9t
	bNEsjdjg7OS/l+MUmRmckJ93zKa5Qikm3jq7Yu3dyTBG3TXFy2qw5ubQAN3SzvQZa8P1RrF5/zh
	kPl32VuTxFpwbONP2jXH7inoFWR7SFE3PqZpcSFAQCvQN8ru9vdZk+zZp7gLAfRW0IF0fCUANMz
	BKz3w1mZ/XgSDqYRmrvclp30pipSIgr85ScHPK4xP7kz/LMXIo2f18eNK4O/zOlxaXMPaGTAnq4
	Ci44yakHVUvs7xdgsD33FgCEUjVhI5+GqLdy6E+CaliAyRQ4GKzQs5189vuDwiisyixMT+0N2QP
	YG4Fw9ZTcqfw07IHw6nJQoFTJJfAn9q+txaAHufbufw4EfTW2NJWNCb4=
X-Received: by 2002:a05:6a00:2e90:b0:82f:b0:28f0 with SMTP id d2e1a72fcca58-83a5d96f560mr14458727b3a.34.1778266899422;
        Fri, 08 May 2026 12:01:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e90:b0:82f:b0:28f0 with SMTP id d2e1a72fcca58-83a5d96f560mr14458559b3a.34.1778266897986;
        Fri, 08 May 2026 12:01:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:55 +0530
Subject: [PATCH v5 06/14] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-6-7fbb340c5dbd@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=3079;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2FrychMIG3LHR9amZA9Bhyd149/t+cV8/TYXT9nsgoY=;
 b=7wLjzMkpFTKevjusI3lfqR/03jJoonRzKWGH2n3/qQquIs5JISQIbUxn1gQV/9+NlOhlNPlUM
 CoUC+yZXZRqAfcrViDbh13LB5NZx+epsQfEZJfy9HGOr6KrF+Gec1T+
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX0BUCwrteGhE2
 LMtL76s4KeBwTQAjzmz80uGhutewMxBw6IikGjy2gQ2RYiTJEorWHHojSZ3jatmU/J+zRxdJzv+
 kafyAbd4NQ6N+D86vqIMCrpcaomHvKeDpYQVZFuxhSB7ks4CboIp8ciM/FpFX35P82IXl0MBv6p
 xtUdRW9h/X75UYjrTNBreUR23p89BVfb0EcXyBUDkGIaJkBmHeNKTlu+FeY5nMkdvlaGUTf9uzX
 oop2h/HWFUXYObadwH+pv0hQ7aNnkNH+eNhgTLsCRJJ3sMt/NHrlSEEFY6qH7D5LV/ldkzw8OP0
 XJ/5M6GP54RMIHd9GoFLxqqq0j0ltWam1QjkOm0EDpb6O8yZwkuLCn0DWqxvAkJOtVX4pqGyCQt
 Jx9i6VnF7nDyzV/MkSl/y8RZgNIhMt7ctxFR+TZlYJieDFw7q50fRp5vmL6IhE1Ws9iNNiGWLE1
 ncjf/AxL0OlWdVacIRQ==
X-Authority-Analysis: v=2.4 cv=LORWhpW9 c=1 sm=1 tr=0 ts=69fe3314 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: JKcsDI6uWxwZrSpe-LMYGKDyHNqbY5VG
X-Proofpoint-GUID: JKcsDI6uWxwZrSpe-LMYGKDyHNqbY5VG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: 971B64FAE8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60947-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..55ff6137d9a9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -219,6 +219,8 @@ struct iris_platform_data {
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..34751912f871 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -142,6 +142,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->init_cb_devs)
+		return core->iris_platform_data->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->deinit_cb_devs)
+		core->iris_platform_data->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -193,6 +207,7 @@ static void iris_remove(struct platform_device *pdev)
 		return;
 
 	iris_core_deinit(core);
+	iris_deinit_cb_devs(core);
 
 	video_unregister_device(core->vdev_dec);
 	video_unregister_device(core->vdev_enc);
@@ -259,11 +274,15 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		return ret;
+
 	iris_session_init_caps(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		return ret;
+		goto err_deinit_cb;
 
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
@@ -298,6 +317,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_deinit_cb:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1


