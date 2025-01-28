Return-Path: <linux-media+bounces-25330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14BA207CE
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C73168A6F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 09:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9688719E971;
	Tue, 28 Jan 2025 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OoPr7VNS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FCF19DF81;
	Tue, 28 Jan 2025 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058233; cv=none; b=pFjWEP6AGk0+x+M+IvOwFVqJ/rWqo7gNedYtiPk16L9PIdtNXspU7RnC7BLQ0N9QIJfmzHOrUbDM3YJuNnHVkSXLQZ+DnrNy0LRH68lOuyUk0OQ37Dize72MlaTk7fvEMCFt2n2QQHCq8WxFDVZArswhZNWVQpVA38eMZpberF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058233; c=relaxed/simple;
	bh=ciddBgcbZTei72yBBeR/j2uNYtRjLUNCzWt8uA11w0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OExgHBMfIsFOnZ/CDvKDxcZH+M2zpgh+etRg2D0txqxAFBuZRtnjMuMzsU28+iQvy6vor0QJA3zHwbPyOJQ8gw0MnwliLlWQ6SE2+pHoS3TFa8RDuclnxEwtFRYNmuPYuEYb8yGqSM0DEvdoPQTcHb6n2vFCJZMdZpd6hxlszPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OoPr7VNS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1sUQi032214;
	Tue, 28 Jan 2025 09:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAU7Aq+J8qYgpSWAov/EVxbTRIDhaVqzPRCDyHY1GVg=; b=OoPr7VNSndZmkHPR
	NXwYRiHiKJI56kPe6wCRc/y/aGF0Cv5ciQpGyokiRJocmFmevH5auzOse2anVCbJ
	eYql730e7v9eTfv0gi82BNyxV83UyXiLoqWczIAF41Yw/bGSuGTIjgMILmbZl+47
	MbGwmUZa2vsd+NTyjPN4ks2gl4ggfj+OFWC+4aOyf0DDqnlS1TDYiYPO1Qi6Qk6e
	xnW54JrfABy3IhLHUnSrHgs28kJPuxsxd+ePzKQTKeRCothIN4ZHkcvTwBNr4F8y
	YWM6xiV/bDiflgdGP/cLdL6eBK82aEugRefJsQNGZ8cpw5uEcJ0WUAxcDxBXFZQB
	s6VPnw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enyq0u3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:57:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S9v5N4025906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:57:05 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 01:57:01 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 28 Jan 2025 15:24:37 +0530
Subject: [PATCH v3 2/4] media: venus: hfi_parser: refactor hfi packet
 parsing logic
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-venus_oob_2-v3-2-0144ecee68d8@quicinc.com>
References: <20250128-venus_oob_2-v3-0-0144ecee68d8@quicinc.com>
In-Reply-To: <20250128-venus_oob_2-v3-0-0144ecee68d8@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738058213; l=8710;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=ciddBgcbZTei72yBBeR/j2uNYtRjLUNCzWt8uA11w0M=;
 b=wwGGExHNibEhO/8u3FJjbKO6q8AZps34PDML9Fnr9M3vaMV7fxKR1FWWWvRouozFPSKUHyEdf
 qw7Nja8EXobD8ZXWSSjuFsc+x53bxKq+n7Y6A+0fnz0nrDoXoPojHFW
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VmrHRcdoc0drnaZ1zkQe068hrCLIPx72
X-Proofpoint-GUID: VmrHRcdoc0drnaZ1zkQe068hrCLIPx72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280077

words_count denotes the number of words in total payload, while data
points to payload of various property within it. When words_count
reaches last word, data can access memory beyond the total payload. This
can lead to OOB access. With this patch, the utility api for handling
individual properties now returns the size of data consumed. Accordingly
remaining bytes are calculated before parsing the payload, thereby
eliminates the OOB access possibilities.

Cc: stable@vger.kernel.org
Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 93 +++++++++++++++++++-------
 1 file changed, 68 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 1cc17f3dc8948160ea6c3015d2c03e475b8aa29e..e0b58386f339b765daa55c992c660fa5fb79f202 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -63,7 +63,7 @@ fill_buf_mode(struct hfi_plat_caps *cap, const void *data, unsigned int num)
 		cap->cap_bufs_mode_dynamic = true;
 }
 
-static void
+static int
 parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
 {
 	struct hfi_buffer_alloc_mode_supported *mode = data;
@@ -71,7 +71,7 @@ parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	u32 *type;
 
 	if (num_entries > MAX_ALLOC_MODE_ENTRIES)
-		return;
+		return -EINVAL;
 
 	type = mode->data;
 
@@ -83,6 +83,8 @@ parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
 
 		type++;
 	}
+
+	return sizeof(*mode);
 }
 
 static void fill_profile_level(struct hfi_plat_caps *cap, const void *data,
@@ -97,7 +99,7 @@ static void fill_profile_level(struct hfi_plat_caps *cap, const void *data,
 	cap->num_pl += num;
 }
 
-static void
+static int
 parse_profile_level(struct venus_core *core, u32 codecs, u32 domain, void *data)
 {
 	struct hfi_profile_level_supported *pl = data;
@@ -105,12 +107,14 @@ parse_profile_level(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	struct hfi_profile_level pl_arr[HFI_MAX_PROFILE_COUNT] = {};
 
 	if (pl->profile_count > HFI_MAX_PROFILE_COUNT)
-		return;
+		return -EINVAL;
 
 	memcpy(pl_arr, proflevel, pl->profile_count * sizeof(*proflevel));
 
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_profile_level, pl_arr, pl->profile_count);
+
+	return pl->profile_count * sizeof(*proflevel) + sizeof(u32);
 }
 
 static void
@@ -125,7 +129,7 @@ fill_caps(struct hfi_plat_caps *cap, const void *data, unsigned int num)
 	cap->num_caps += num;
 }
 
-static void
+static int
 parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
 {
 	struct hfi_capabilities *caps = data;
@@ -134,12 +138,14 @@ parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	struct hfi_capability caps_arr[MAX_CAP_ENTRIES] = {};
 
 	if (num_caps > MAX_CAP_ENTRIES)
-		return;
+		return -EINVAL;
 
 	memcpy(caps_arr, cap, num_caps * sizeof(*cap));
 
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_caps, caps_arr, num_caps);
+
+	return sizeof(*caps);
 }
 
 static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,
@@ -154,7 +160,7 @@ static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,
 	cap->num_fmts += num_fmts;
 }
 
-static void
+static int
 parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 {
 	struct hfi_uncompressed_format_supported *fmt = data;
@@ -163,6 +169,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
 	u32 entries = fmt->format_entries;
 	unsigned int i = 0;
+	u32 size;
 	u32 num_planes;
 
 	while (entries) {
@@ -173,7 +180,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 		i++;
 
 		if (i >= MAX_FMT_ENTRIES)
-			return;
+			return -EINVAL;
 
 		if (pinfo->num_planes > MAX_PLANES)
 			break;
@@ -185,9 +192,13 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_raw_fmts, rawfmts, i);
+	size = fmt->format_entries * (sizeof(*constr) * num_planes + 2 * sizeof(u32))
+		+ 2 * sizeof(u32);
+
+	return size;
 }
 
-static void parse_codecs(struct venus_core *core, void *data)
+static int parse_codecs(struct venus_core *core, void *data)
 {
 	struct hfi_codec_supported *codecs = data;
 
@@ -199,21 +210,27 @@ static void parse_codecs(struct venus_core *core, void *data)
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
 		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 	}
+
+	return sizeof(*codecs);
 }
 
-static void parse_max_sessions(struct venus_core *core, const void *data)
+static int parse_max_sessions(struct venus_core *core, const void *data)
 {
 	const struct hfi_max_sessions_supported *sessions = data;
 
 	core->max_sessions_supported = sessions->max_sessions;
+
+	return sizeof(*sessions);
 }
 
-static void parse_codecs_mask(u32 *codecs, u32 *domain, void *data)
+static int parse_codecs_mask(u32 *codecs, u32 *domain, void *data)
 {
 	struct hfi_codec_mask_supported *mask = data;
 
 	*codecs = mask->codecs;
 	*domain = mask->video_domains;
+
+	return sizeof(*mask);
 }
 
 static void parser_init(struct venus_inst *inst, u32 *codecs, u32 *domain)
@@ -282,8 +299,9 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 	       u32 size)
 {
-	unsigned int words_count = size >> 2;
-	u32 *word = buf, *data, codecs = 0, domain = 0;
+	u32 *words = buf, *payload, codecs = 0, domain = 0;
+	u32 *frame_size = buf + size;
+	u32 rem_bytes = size;
 	int ret;
 
 	ret = hfi_platform_parser(core, inst);
@@ -300,38 +318,63 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 		memset(core->caps, 0, sizeof(core->caps));
 	}
 
-	while (words_count) {
-		data = word + 1;
+	while (words < frame_size) {
+		payload = words + 1;
 
-		switch (*word) {
+		switch (*words) {
 		case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
-			parse_codecs(core, data);
+			if (rem_bytes <= sizeof(struct hfi_codec_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			ret = parse_codecs(core, payload);
 			init_codecs(core);
 			break;
 		case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
-			parse_max_sessions(core, data);
+			if (rem_bytes <= sizeof(struct hfi_max_sessions_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			ret = parse_max_sessions(core, payload);
 			break;
 		case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
-			parse_codecs_mask(&codecs, &domain, data);
+			if (rem_bytes <= sizeof(struct hfi_codec_mask_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			ret = parse_codecs_mask(&codecs, &domain, payload);
 			break;
 		case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
-			parse_raw_formats(core, codecs, domain, data);
+			if (rem_bytes <= sizeof(struct hfi_uncompressed_format_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			ret = parse_raw_formats(core, codecs, domain, payload);
 			break;
 		case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
-			parse_caps(core, codecs, domain, data);
+			if (rem_bytes <= sizeof(struct hfi_capabilities))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			ret = parse_caps(core, codecs, domain, payload);
 			break;
 		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_SUPPORTED:
-			parse_profile_level(core, codecs, domain, data);
+			if (rem_bytes <= sizeof(struct hfi_profile_level_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			ret = parse_profile_level(core, codecs, domain, payload);
 			break;
 		case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE_SUPPORTED:
-			parse_alloc_mode(core, codecs, domain, data);
+			if (rem_bytes <= sizeof(struct hfi_buffer_alloc_mode_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			ret = parse_alloc_mode(core, codecs, domain, payload);
 			break;
 		default:
+			ret = sizeof(u32);
 			break;
 		}
 
-		word++;
-		words_count--;
+		if (ret < 0)
+			return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+		words += ret / sizeof(u32);
+		rem_bytes -= ret;
 	}
 
 	if (!core->max_sessions_supported)

-- 
2.34.1


