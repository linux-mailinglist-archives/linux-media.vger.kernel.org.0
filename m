Return-Path: <linux-media+bounces-25783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6CBA2BDD5
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959CB163764
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBF41A9B3B;
	Fri,  7 Feb 2025 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kx3T3vma"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150621A9B48;
	Fri,  7 Feb 2025 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916728; cv=none; b=VlaFhJW/3KnoBatrJ7oM9AtlNb459FRRMlDVY/klKyZZk2Ld4i09C12sVfgNzRhkou8IsygURKRhe55coBMcOHbTel2IDOZ7mt//VW3XsTg0+T3ic539C5WiFeofym/PItAiea20E5/7+jI5MJWFNcqv1WMYqAbvDVn/aqLJ+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916728; c=relaxed/simple;
	bh=h69xQWDlVCeJgtx99vJE37PHHUj9+x9rRYvg/JuH6Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=d3onFgulu93Kq0GtgMzoI9tcLBwu/jJ2vyjS5ebmo2glcn3EQHm30Irfw11/87GsgbQMbWtrWDeQwX+JxgGuIFNcBELJFDf2MG9lZFrxDM+rp+JOtvTc0AUD4aRAzoj5Unb0UxT9qGd69Un6dFqHc9XQMya09+gKrgRPKdsAyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kx3T3vma; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5176Wpmh009106;
	Fri, 7 Feb 2025 08:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOb5TgqCFzwhBxScYsWszn9e3TuxfKity9gzuqUwkZI=; b=Kx3T3vmaZpG4k1Zt
	9MStIGBpmr3rbtZ3SO6SCZc5k/dsP2OyMRisf8QlgpJK7cqrTUb4rJFd/CPG0gFy
	tMLNusSL8m9/i7S9j/oPUiuTFFRghpCem/bOj2HKDO/e5sFgn67hcMsQTYy2mwP9
	jGxLAB9pvDlbyElgMDWACvqBAEqhrmJqFyudSiXml5m+nFEGaEqwnF4YYu174qSe
	mFk9UckyqDMb7SWpsTOLiRymCaPcxDXZjMnmaiRTTcyIlOd4U8wXC7A6uVFRRVEu
	WyD21wVbbgFzJ1p7fcIvDmddFrLBEb1AvR3hAisS8iWL/QZt22WcZOEgStNpLxUr
	jF7B5g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nd0f0976-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 08:25:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5178PKTK010826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 08:25:20 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 00:25:16 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 7 Feb 2025 13:54:50 +0530
Subject: [PATCH v4 2/4] media: venus: hfi_parser: refactor hfi packet
 parsing logic
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-venus_oob_2-v4-2-522da0b68b22@quicinc.com>
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
In-Reply-To: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738916708; l=8769;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=h69xQWDlVCeJgtx99vJE37PHHUj9+x9rRYvg/JuH6Xs=;
 b=A37UfDk6QkNGkHW+o+rLN5RnnUMNZ5JS7LZLiAX/6IqG7uOCsI1x+OhlCjuzK6ybMYuTxwEHd
 hIDJjNI7i31DRch0ZlzCuJxG7kU2x1N0IYzopq2uv1w7ureFRATu1nN
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jg4ute3uk9RMRQd78hbSHwLgQpu7wOYX
X-Proofpoint-GUID: jg4ute3uk9RMRQd78hbSHwLgQpu7wOYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070063

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
 drivers/media/platform/qcom/venus/hfi_parser.c | 95 +++++++++++++++++++-------
 1 file changed, 69 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 1cc17f3dc8948160ea6c3015d2c03e475b8aa29e..404c527329c5fa89ee885a6ad15620c9c90a99e4 100644
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
@@ -163,7 +169,8 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
 	u32 entries = fmt->format_entries;
 	unsigned int i = 0;
-	u32 num_planes;
+	u32 num_planes = 0;
+	u32 size;
 
 	while (entries) {
 		num_planes = pinfo->num_planes;
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


