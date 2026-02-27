Return-Path: <linux-media+bounces-53659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPnIHII/oWnsrQQAu9opvQ
	(envelope-from <linux-media+bounces-53659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:53:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1871B38A7
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E7CC3182298
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB6B38A28F;
	Fri, 27 Feb 2026 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ga1a0gqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGJEIvdQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16B361DD1
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175082; cv=none; b=W5Guu/nmlE156qYtWGRA8Ms2mkd1qiK8Pyfe2a8Spx2Qn3p9DXXVZOB+tSOqxDMmcSNoJOdE/ublQosMug28NReV4QMXhIN7uFOj1llZDkVmrA2Uc4B45klZEVvOVFB81Jo1w850vY3A3wgUZHZKc07Bp6pT9ubZiuKCJOlFfEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175082; c=relaxed/simple;
	bh=8VozCV/2rqeb8HwSXjLaGMIBVeiwoVjkWPiyO4/S4bY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdlkCk3p20CM8/CGZXix/C3oYgrzgEgkTOde/YtddjGy2EBAooGXhyI0oRox31T+cAl9BJ67oEbpvKZR0a0YVN+CDGWEiHL5IRIrDeuQ1jBDzVAWap/3rU3B3lgqJcocO4267jysRd5LPcSuRkWzmHgtsGE2hJ+lMd3D1AWOwH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga1a0gqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGJEIvdQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K2gs3762419
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/y/jEWO9QGQ6VPkqMP+OneRNyGFI7YPepN29QNGjaw=; b=Ga1a0gqa7YPTvIFY
	si2PVFJPjHMv8ocrAJxSEn8pEJ0z9/cjgN5iaMGm+dD8uIP4rWdEJBac7QkS57Vq
	F1qXNdy3ZfaBYh4dc9+VuNmp+7q+pumy0pfT2IlQ0q6CbimByn6XA9X8KBVRDAKo
	bBCBrOU3xdGWWgIngSunTI/fDVxTcY0wPG7KsBYuOrUtNmQBnRE/NiuC1Dokc8AB
	/KmJdGexzAg5SrSYag9B/4Pbit1nx8M3o2nQ7PzXkgNuIJYGRrz+ey7tDtnKgh3N
	SipRvyklm6R6vQjd4axSuSg9IDsG8DiIDUbOdxJixmXGx1TQnBPoje23GBxL3Ge2
	j5iIzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7yag5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so1553108a91.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 22:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772175079; x=1772779879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/y/jEWO9QGQ6VPkqMP+OneRNyGFI7YPepN29QNGjaw=;
        b=ZGJEIvdQ0wWwiQZAT8vuKNnA3ED/o0SaJyPEfFU8aWkkaGtaGc5252lxgryulC/ZYo
         1A8rx1iYY7xAVFhyBMPGwO9cVT3DE5HxXZj9qEY8Zcoy0PJxJLCGqZZDwzHbHE/STfLs
         6k/I+dEmmm1AYQxbwk/fhHK0PmojgJhT32MMvJAIxo+E5CDO7hrPtNa2drwzvEJ8vzVP
         rJTaGHisiULFhNkkpidWDKs0i/dT0zDpWJfHnbwS87HYpa7Flo++ivBbsRP9bLxY8WFN
         g0vKwa6wLeH5x8akfQnwgLDj2OOLe76tnm5GaJwm0ANjLw7ZI3wgCas63NuEu1Hj5ovQ
         JP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175079; x=1772779879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+/y/jEWO9QGQ6VPkqMP+OneRNyGFI7YPepN29QNGjaw=;
        b=ZNsdye74rq1oHgnPWeMtHHmySWGG6B6fc5V2zgcG8C/3tGZ8LDJ0FS5mHcbVKQDxGE
         8MT6k3Uwf9hTWBgVypp2GQ9UIbFScKb9LiCP5t57YWfOSs11Cbfwjm+aNZOZbK5wBnl/
         yPIq6KvdUcfWwNXiAmtAh95uA33drND9Ift2aY3mvPcMtPiw+0OGWT8mNGhCgm75EGKi
         6im94jac6SZxCY8ZeMTncuuIjMHUpaTdJ3CtZpfTkoehL/v2MGXsRnJORCBirJfKdZMT
         cEqsvi4krndwhKqa0Ip/O5QDd48RJu424Iv0XIy0srVL9bt2c3AsN8OwgiRU9pUjS59J
         d72w==
X-Gm-Message-State: AOJu0YyXO5l2RGTN3O1yu7x7+b1aPsZ4SASh45Sg8KDmvIqeFtLMGMhQ
	2eF9BQKbgUidgPj7YeZXZ71gPvXTDO9lEEM9Vs+397ytSB8XRBU616Hy3vi9Em0jIEubK7EJgKR
	4GImhRkERfoWoP2W/SikpqyvWAbDYIH/cZmmk7eiNOqJkKM4HxdslRGOBJlBwHKtxqg==
X-Gm-Gg: ATEYQzwRpBbUdSarNskYkaPyqcZqdt1UOpDEhXa4j1l6oA6lU+0uVd93rrLTgHTzu8X
	tdAI2GkM2w8S/4EB+jZQztlpKP8wQJ83NB+NFWQ+XSX2KjJ7nAGdPE/8/A02U7ewXRBGAncgQyI
	O4mR3ZBPZCCaKs/awgTiQvmmm4k55FMOBjUTPcfHhl5lWquqk0psMwHv+q2FWnj3T5HMdaznwzT
	OlBBVZ19/HZTDkp0myqrPqarQbzYQJo805ARLA88Vw9hcYh8KGz4buZ4/qbpqxl7QpcLxvl9Tz8
	H4Zbr68YlQEj6V77X0b98Pjb9Ej1mZy/nUV0RQHHP7109BVGl/WjMlnoSVLAzJq3YEcNrPbJ/sc
	1rEWL0Yp+S2zF16cF+K89WOjhZzMTNs48z9d6v/551R9X+3UJBaruRq5Kkh4=
X-Received: by 2002:a05:6a20:6a21:b0:366:14b2:30f with SMTP id adf61e73a8af0-395c3b51f2amr1806979637.66.1772175079251;
        Thu, 26 Feb 2026 22:51:19 -0800 (PST)
X-Received: by 2002:a05:6a20:6a21:b0:366:14b2:30f with SMTP id adf61e73a8af0-395c3b51f2amr1806948637.66.1772175078697;
        Thu, 26 Feb 2026 22:51:18 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm3455880a12.3.2026.02.26.22.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:51:18 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:21:03 +0530
Subject: [PATCH v2 3/3] media: iris: Add support for Gen2 firmware
 detection and loading on SC7280
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-iris_sc7280_gen2_support-v2-3-7e5b13d26542@oss.qualcomm.com>
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
In-Reply-To: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175063; l=13505;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=8VozCV/2rqeb8HwSXjLaGMIBVeiwoVjkWPiyO4/S4bY=;
 b=EIsRgrboJqBUjtXyHYmcfrf96pJ+3eJWauzNpXzdfzut6AuDGa4GvTCigjkaxrcsjtk1DmSTo
 Uv4G8HSXtiXB7H3V0BBG1tKY1JetpsoUlbM26TO6c/NiwiiHzOo9wwF
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: 4n0AmVb3bjVTt4KDZpCbOAhiIAK8PsGP
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a13ee8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vAhLNi6rj8_hoSnI:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IrGTtLzU1_bVHTQOxnMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4n0AmVb3bjVTt4KDZpCbOAhiIAK8PsGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1NyBTYWx0ZWRfX6J9fJVuYkvDS
 FRDH/1Z9kV6QVvpssJ0DYQ438ZtWt7QbhCZN6I6eatnllUZOCtbILjv1m1S3rKrh8PYEI500Po9
 eZyK1Jppw3R856uDW0gg8y+eUouGz5QtvSwuG+2B1o3OsD07VzfucSDPuWSP2SkpSTZCgDGpBTc
 hvmquQXXoY6cnzdhGfZXZepKRtbwwzjHil/aIMv6HEkZvcQWUrxzFJVZewQR83eFsjsq9x9kIi7
 JAQT9v8AAMVaQI6oe0Xpj8W3G7Ch5BCx0D3/tq/5jjDfs3kjNvtr3LImQvuedef1lB/5BdAa7bm
 aPr/Fny6V5q3VBACFvy6qMuWAdRAor0OVlEQ5XFSduMhCMTU8zlTSQoPWAa+7upr/h5jMN8fHI8
 jppzOmkLvGFya+UglKxCWAVBISa/CrHPoApAvCWdXUfwFUXaVM5fy/ZlgwN2g61C8zgeBMtwDn4
 zlcFYAPyMBlQD3yuC+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53659-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A1871B38A7
X-Rspamd-Action: no action

SC7280 supports both Gen1 and Gen2 HFI firmware. To support both
dynamically, update the firmware loading mechanism to prioritize
Gen2 availability and detect the loaded firmware version at runtime.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 Autodetect (SC7280 only): If no DT property exists, attempt to
   load the specific Gen2 firmware image (`vpu20_p1_gen2_s6.mbn`).
3. Default Fallback: If Gen2 loading fails or is not applicable, use
   the default firmware name defined in the default platform data.

Additionally, introduce `iris_update_platform_data` to inspect the
loaded firmware memory before authentication. This function scans for
`QC_IMAGE_VERSION_STRING`. If the version string starts with "vfw" or
matches "video-firmware.N.M" (where N >= 2), it identifies the
firmware as Gen2.

If Gen2 firmware is detected on SC7280, the driver switches the
internal platform data pointer to the Gen2 configuration.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c   | 70 +++++++++++++++++-
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
 7 files changed, 171 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967fd21ade66cc3fa377d8507f9002e..f6ee7f58d4ce215ad9f7fb5fdcadec17f99c8848 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -14,6 +14,53 @@
 
 #define MAX_FIRMWARE_NAME_SIZE	128
 
+static void iris_update_platform_data(struct iris_core *core)
+{
+	const char *marker = "QC_IMAGE_VERSION_STRING=";
+	struct device_node *node = core->dev->of_node;
+	const char *found = NULL;
+	int major = 0, minor = 0;
+	char version_buf[64];
+	struct resource res;
+	void *mem_virt;
+	size_t i;
+
+	if (!of_device_is_compatible(node, "qcom,sc7280-venus"))
+		return;
+
+	if (of_reserved_mem_region_to_resource(node, 0, &res)) {
+		dev_err(core->dev, "Failed to get reserved memory for version check\n");
+		return;
+	}
+
+	mem_virt = memremap(res.start, resource_size(&res), MEMREMAP_WC);
+	if (!mem_virt) {
+		dev_err(core->dev, "Failed to remap memory for version check\n");
+		return;
+	}
+
+	for (i = 0; i < resource_size(&res) - strlen(marker); i++) {
+		if (memcmp(mem_virt + i, marker, strlen(marker)) == 0) {
+			found = (const char *)(mem_virt + i + strlen(marker));
+			break;
+		}
+	}
+
+	if (found) {
+		strscpy(version_buf, found, sizeof(version_buf));
+
+		/* Check for gen2 version string: "vfw..." OR "video-firmware.N..." (N>=2) */
+		if (strncmp(version_buf, "vfw", 3) == 0 ||
+		    (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
+			    major >= 2)) {
+			dev_info(core->dev, "Gen2 FW Detected: %s\n", version_buf);
+			core->iris_platform_data = &sc7280_gen2_data;
+		}
+	}
+
+	memunmap(mem_virt);
+}
+
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
 	u32 pas_id = core->iris_platform_data->pas_id;
@@ -64,21 +111,38 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 
 int iris_fw_load(struct iris_core *core)
 {
+	struct device_node *node = core->dev->of_node;
 	const struct tz_cp_config *cp_config;
 	const char *fwpath = NULL;
 	int i, ret;
 
 	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
 					    &fwpath);
-	if (ret)
-		fwpath = core->iris_platform_data->fwname;
+	if (!ret) {
+		ret = iris_load_fw_to_memory(core, fwpath);
+	} else {
+		bool fw_loaded = false;
+
+		if (of_device_is_compatible(node, "qcom,sc7280-venus")) {
+			ret = iris_load_fw_to_memory(core, "qcom/vpu/vpu20_p1_gen2_s6.mbn");
+			if (!ret)
+				fw_loaded = true;
+		}
+
+		if (!fw_loaded) {
+			fwpath = core->iris_platform_data->fwname;
+			dev_dbg(core->dev, "loading default fw: %s\n", fwpath);
+			ret = iris_load_fw_to_memory(core, fwpath);
+		}
+	}
 
-	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
 		dev_err(core->dev, "firmware download failed\n");
 		return -ENOMEM;
 	}
 
+	iris_update_platform_data(core);
+
 	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..f1bbbe043e3a3ccc5eebf67091162678eb83bf45 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,6 +43,7 @@ enum pipe_type {
 
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
+extern const struct iris_platform_data sc7280_gen2_data;
 extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430ed2a070e092edae9ef998d092cb5e..6dbdd0833dcdc7dfac6d7b35f99837c883e188e7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -414,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 	.pas_id = IRIS_PAS_ID,
-	.inst_iris_fmts = platform_fmts_sm8250_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_iris_fmts = platform_fmts_sc7280_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
 	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..5f3be22a003fe5d80b683b43a1b2386497785fb1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -15,6 +15,7 @@
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_sc7280.h"
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
@@ -1317,3 +1318,85 @@ const struct iris_platform_data qcs8300_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+const struct iris_platform_data sc7280_gen2_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	/* Gen2 FW for SC7280 requires bigger size for line buffer for encoder */
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.bw_tbl_dec = sc7280_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sc7280_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
+	.clk_tbl = sc7280_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
+	.opp_clk_tbl = sc7280_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sc7280_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.core_arch = VIDEO_ARCH_LX,
+	.num_vpp_pipe = 1,
+	.no_aon = true,
+	.max_session_count = 16,
+	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
+	/* max spec for SC7280 is 4096x2176@60fps */
+	.max_core_mbps = 4096 * 2176 / 256 * 60,
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.enc_input_config_params = sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.dec_output_config_params = sm8550_vdec_output_config_params,
+	.dec_output_config_params_size = ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.enc_output_config_params = sm8550_venc_output_config_params,
+	.enc_output_config_params_size = ARRAY_SIZE(sm8550_venc_output_config_params),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
index 0ec8f334df670c3c1548a5ee3b8907b333e34db3..6e05f2542a5457bd0b3b6acced3bd54d166b2023 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -6,6 +6,21 @@
 #ifndef __IRIS_PLATFORM_SC7280_H__
 #define __IRIS_PLATFORM_SC7280_H__
 
+static struct iris_fmt platform_fmts_sc7280_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
 static const struct bw_info sc7280_bw_table_dec[] = {
 	{ ((3840 * 2160) / 256) * 60, 1896000, },
 	{ ((3840 * 2160) / 256) * 30,  968000, },
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 22c7b3410710328b900fc49459cd399aa0e89b02..1f44d3ea337df63fbf5317b9b99139a0867267c3 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -12,7 +12,6 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
-#include "iris_ctrls.h"
 #include "iris_vidc.h"
 
 static int iris_init_icc(struct iris_core *core)
@@ -257,8 +256,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc79d15585ed5dd5f905a37521cb6dc..0727d5d19cb9b7ed1f72ab840ae5dfda0162e23d 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -196,6 +197,8 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
+	iris_session_init_caps(core);
+
 	if (inst->domain == DECODER)
 		ret = iris_vdec_inst_init(inst);
 	else if (inst->domain == ENCODER)

-- 
2.34.1


