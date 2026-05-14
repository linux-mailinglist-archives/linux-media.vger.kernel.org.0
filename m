Return-Path: <linux-media+bounces-61592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KMEN7GgBWo1ZAIAu9opvQ
	(envelope-from <linux-media+bounces-61592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:15:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43797540435
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F40EF307FB1B
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D1638C2B0;
	Thu, 14 May 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCmMlk4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX5oEPJg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96F7390219
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753401; cv=none; b=K/A8M6diwA75no+AmzJx0AGiv1MBOz1AsQbnRu2sTtJNHqG/9b2H9nnac51xfyJm1JGp57bQ6ZToVc2Dcv1VgDYuh61KZLEHY12h6BOUDvkyo61rst0K/cXkG1UyKaeSVBtz82dEolFGKgalxOtom/V26NhDpFeuw5gQH01IVqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753401; c=relaxed/simple;
	bh=Lo3+EqRmidcRv20rL12nzMZqvqEoAWfi9u1LSMD1tcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nULwayVBboyWPRmWgmGETnqzoLv0VBY9QZH+8cJWCsB9llFLnhh19EILlNXpfhZEM0h3rMmC0IAuK+c2i2Zd1AE6wYBtKG9RMV1vjxg+gh8zOBEYzgGOgIPX97FyvyqIe9j81XGlfpzfz1PI2HUoWCR4PV6PZPJAad4lM/jMdgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCmMlk4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX5oEPJg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kKWe3641070
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX29oi6WWeJJBl5pgdWXHMArI5N5aynqx/FYbRtltxQ=; b=mCmMlk4O2qB3tWah
	T6cebLdZ2Lzg7Zmf+XGsUNGTxhMoRxl/JHiyd+CzmMTmRy+oEB4CmCKVKg4Vuj9f
	Oj77jFQt8teYBZbMhargBJJlJ2qM4oiQd1RjzDhzR3SLdJwTJjTXL9zv7pxzkchI
	iBCF3vYFoIEiKhAzARhyjU5IxgPS7eakEM0TlOIX31m5YsYF8gbOlL8zI9oDb3rq
	R+nM69lGTJb5pK/W9uPE1wGurmxUi9f0ebm/KNda2geQWaggTOT9T+WQraPbywfb
	RcAsSHUtepnL29YHWT88Vv85ajWeQmA3XBgKBKDa1OyukdubhZMmFsurg+90y4J/
	njOtSA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tuhpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c802545ae0eso4631296a12.2
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753398; x=1779358198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX29oi6WWeJJBl5pgdWXHMArI5N5aynqx/FYbRtltxQ=;
        b=NX5oEPJgas6Su4b+AFa8H9RVBzdIA/VqcYaXwaatZ0MC8s2qdzgww8D8ovDwrG2TjY
         velSfREBzxN5phXSy13zL2R8a4KHXxC99ngEepQKW35X2nUF+6tIE1hwbTMc0QGBUEeA
         kyYZmCwBpDhxOngFSXvIEz29/C6ZqoD+Kc6m8zhnpPjou8sIS9rAStxyaByY0sPACwws
         CyI1c2VYU3Ne310l9ErqaKj1eGvP0KObYal9uVNRAHJnIqQHcdlGI0nKZY4/HSHz4a7M
         FS7bkNc1L6aKvQ+1BDhX+kSuweyTFKdy6O6uWIj455dCUZZp5dhFKG9TS9P9nMTO8q9i
         ALhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753398; x=1779358198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GX29oi6WWeJJBl5pgdWXHMArI5N5aynqx/FYbRtltxQ=;
        b=E46V6RnDggic7J+CnPulvdbzYZfRxgjrVHx/OXtUmKER0ob2WnjvOSIE/oHktVU3nN
         lAZFGKxfArbV/QZclz78XqCaFVvxDCOUKPzClHlX8gUHhOsm3dOfOc80S2HEuNBWlIOT
         AHLkIyAiPcuOtBFChV9QsxUJU6jus+EsvUizJCBP7ySfCsvmMPgWw0KeU1blfmqc61Po
         jx+NgVd1Ekz0ht0vBLo5wlEueJyP5UIpDKjMm+hUFKng6k7eZ+QMp+MWA3imjyXe8DTN
         S1V6EEXwnFb5lWdva1+4EAqHRKRrJqpM8MFg5S3vtJTUczL4YGFkPVXj24ZcEkuRPUpH
         nrKw==
X-Gm-Message-State: AOJu0YzhHrx1m7pctFlu4Ff8hN0gdt93+3zQVymoxD2gztkBGORQDhBY
	0LLqAASR3R3+rT2UdrrGvZ4SZfI4suEtR6qU8v4I6tI+6BKPLLyIFXsmH0bf14WVQOCZxOA98AB
	BRVkDzPuaUN6x9MGQicgzzuHfAiwb6tLZg5rQavWkcTfl7lu5DF3ED/qLCNx6xfwT8Q==
X-Gm-Gg: Acq92OEEJuL2GGO+C1dUoRLD4JIItMKA/H2E1GP7D/le2s3PCsSC2c/w8rG5VicGfPk
	gxeG4WUoF4dlIg/ADbKIojlMb5JEr+tFA8mfcozGc6TnlDUB4xzC55Z/p/HkMmFMPmCjqrZP9zz
	b1ZZnGWUNxseAmVLKbJ/U8tEdQquTz5UdZ3O4C9lFps8ltXfooZi1RD/cVvj16LldvqnW1TaPeR
	cZTcDz6qFomZp4S2iYOzXDBmcRPFGKVVbJxxl59+S6o895M3OHLc2cENQV9xZcf8TwrMFSlrhrG
	QznwVi71ozA2qTTuNL6eJ1hn7W52a0V1JLbpNVE/NACWYJJkUEKQZri1dzi6dU64cGyvEgPQoKr
	1VWurJjhEnToyz+pMdp1BxTpPLjhTqlHGasoPq2Xk1awFsameiw85W8gpx/srSTkmvudlEne0IW
	i2pUQ42DrcCKVz2nyYCdwMG2jVO5b3SMQ=
X-Received: by 2002:a05:6a20:3d90:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3af8077bc22mr7964287637.12.1778753397865;
        Thu, 14 May 2026 03:09:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d90:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3af8077bc22mr7964241637.12.1778753397239;
        Thu, 14 May 2026 03:09:57 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:09:56 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:35 +0800
Subject: [PATCH v7 3/5] media: iris: Add platform data for X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-3-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=5454;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Lo3+EqRmidcRv20rL12nzMZqvqEoAWfi9u1LSMD1tcg=;
 b=807NVkxkEvWjZtg8qvyuMDn7zJmOdRVBPq3S+kLZf3OMLYBdvj/phK1buLECp23cuWiCHQ1zl
 eqfTruVVBdcBVwEeELiTZ5cN9wO/3jbL3DXBECVzoO4xv4ec6fP96v6
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a059f76 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7846H_0ANTkhO8RSUocA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfXzvfO6yDjCd3R
 wLT/s9AXje7y+4/hhb/UwvDcws3D/BXEr7+yH8+36r041XTT6lEn35WUEya8wZDK/kwwQ8/sszn
 qxGcZEsHgNdBq3xPds4ZcQ01jwkqeZXYGa58LSAXQr//9AANC8VwVfZMuAk7mUI5sCi5wa65ace
 Y/gkifU1L60G2cAPlFyT5I+OiEWNXSsMg2hZEfnock3EsTvYiNTB0MOKubmLd8V6QTcgjiklxDM
 wLfR565UnDNYdWcNSIpgBpLEYUtwF2eubO1bC+eSPpzkyCoUFcVdBeaaQ1BzYIc+luLfQ8r5HwR
 PbxxKZ6s4JxhkyVmvsnL+H9G8gxgvY/PPqoylvZ46j/f95/EZ0qYoQLJd7zxXNxqu2EGrjjzkRT
 6fu6ycdpVP0urBmy9O2AlLyY1faCAUKYeZOBrPDikHFjUL/5GTaLs6G/xS4PA8yX2Xg8PcGEAbe
 EH9CAq7vqbcG5QjbAMg==
X-Proofpoint-ORIG-GUID: Rk0AGGyX1bZGs2kteBBBEXn2mnFnten0
X-Proofpoint-GUID: Rk0AGGyX1bZGs2kteBBBEXn2mnFnten0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140100
X-Rspamd-Queue-Id: 43797540435
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61592-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce platform data for X1P42100, derived from SM8550 but using a
different clock configuration and a dedicated OPP setup.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 42 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +++
 4 files changed, 69 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a108173be3548af9868697c2557e353136d147d..8d42d60dfc4710875f9dfacfc44216535d0a00aa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -49,6 +49,7 @@ extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data x1p42100_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index c249ff8275414a355339ec8edb6856f292b5cff2..541ddc40e3aeef349f1ae68e216d398b3b4fba78 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -16,6 +16,7 @@
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_x1p42100.h"
 
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
@@ -29,6 +30,12 @@ static const struct iris_firmware_desc iris_vpu30_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu30_p1_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p1_s7.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
@@ -217,3 +224,38 @@ const struct iris_platform_data sm8750_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - clk_tbl and opp_clk_tbl for x1p42100
+ * - different firmware
+ * - different num_vpp_pipe
+ */
+const struct iris_platform_data x1p42100_data = {
+	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.vpu_ops = &iris_vpu3_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = x1p42100_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
+	.opp_clk_tbl = x1p42100_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
new file mode 100644
index 0000000000000000000000000000000000000000..d89acfbc1233dad0692f6c13c3fc22b10e5bdd80
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_X1P42100_H__
+#define __IRIS_PLATFORM_X1P42100_H__
+
+static const struct platform_clk_data x1p42100_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
+};
+
+static const char *const x1p42100_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec0_bse",
+	NULL,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b7de0e3527e0a824942db0fb79133..9f8113ec7a508a5a26cf275408165d34684d3e0b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -385,6 +385,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8750-iris",
 		.data = &sm8750_data,
 	},
+	{
+		.compatible = "qcom,x1p42100-iris",
+		.data = &x1p42100_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.43.0


