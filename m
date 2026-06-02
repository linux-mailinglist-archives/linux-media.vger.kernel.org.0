Return-Path: <linux-media+bounces-63356-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB8vCImXHmoAlQkAu9opvQ
	(envelope-from <linux-media+bounces-63356-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:42:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 921A062AC39
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2ECF53080E45
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342BD3CBE7C;
	Tue,  2 Jun 2026 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jSqPVgGz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8A3C8C69
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389572; cv=none; b=IdUyJmPnThJjot5PykgCzrTOgncBcKsoa33Gvx+9eFQ05ny0NWKWUN2jYWMrhdgD8JvMbA7C2hWv4vs9PCmwfHys/w/edIppDr6DxmEO29NLDOXFM28s/hwICNEY85WAuygFytWDO/ROkcJ7Sv7KarGmeLxAXKqcSjOTj81pwnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389572; c=relaxed/simple;
	bh=FSRjjiwubMsbmGQlFv02cRDb8aSDoT7TLY94ZGqccOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hh9vzXyRI1z3JYH/t0xWI4czVYzT5MS/3Y+ssEYI4+WV1PJ58SEX5H+esY13OJ5ZU7X50GtPYN4Hn5dDMjojdNDP7lYGfQPJXVWGmxesMWmCPGa47+e8A+JraBotQQUZjpxjjyUniBKvZiZcJjlttVToCly1oJNmWcjjOAI+d6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jSqPVgGz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49050bfe053so79754575e9.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780389565; x=1780994365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yU+v1GlIbb9kozfDeAVXVrzHJKOrtEBHh4oL/P0WE9U=;
        b=jSqPVgGzQZb5HEz5M2AyF/iI3UvUO+1q+gIo8+SzelCnveGOeFimrDO9Fp8HEmOfSd
         MSAKhD4OQMsOaiH4T5aWLo/XstN+90QOidvgG56mqWxxWCPjA8iDh2wyNfwUSQeuLIhB
         wxbV2PAcjHDMYaxrCQYjXBU/H2efSpG0+u50fRwUUmnfPMgQ5WH5s6xemxlew1NlGIx6
         jN1aQKB6wbK11blTV/BKrpPr984Bt3l9TE/hrTnz9UAPrC5HUXjODSrPiJmSatiOAC8S
         dz5izXSNfNu3BoJNmc/27M54ZFRFQsZOlwI1q3iUfGJkX7O4mVTkf7tIGlpFLH3COT0h
         CzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389565; x=1780994365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yU+v1GlIbb9kozfDeAVXVrzHJKOrtEBHh4oL/P0WE9U=;
        b=k4QLERaEr/cYb55JDauGlVUIcRbm9bFq1bb8Ac9Y4xYTsxF+OttPnjqDeIzgYVPI5Z
         Sfdvh2gh9CmFxiQV8PJWIZejF9mrKrSAwosjpS7dOUGuyL/vqLaNa7zrfZ/VFAteNBAL
         yhdAAjlzJ0mjnYfObL4tC8rp9bGF5LPJi3AI3rYXYKPtmx17/Qzf6RWVzZoZP5omH6Q5
         4wqRqppoy5PTzLl5WU+FAoHovwUp6mfb0ypUYWCpOitZZfgTsLitZtrSEuNKhxnvVty0
         GX8WfkXj+9sgHxnAWJu7T/FxloRrkT4EpoIwBs8ylnJjF5hdR+zi8OA15Dl3FaOQnRFi
         8eng==
X-Gm-Message-State: AOJu0YwhUJAZ+ArGP73X+2OvJr/RKUiaIwuqQ7jqTz3YvHex7KMLl/3m
	Fa3O6sSee3IjDL3TCUiKTIwhzpFlqErDTMK0HUUnndU5QvhxYWxkjE9gSSzVTIns8+Uj92TkY3s
	N7Gxw
X-Gm-Gg: Acq92OHwGt1Ye7/49nVaDqbZ4EHwrUl5enmOFL6EvTeLmDzLI0N+ZTsbILNZCscK0ih
	jY5AXa6QjEyuABO8hS9yPhCAFsL9z8ubnowCh7UtFnYnoEFaYCVdPcevoWZ4REbN6ptJz1HrIw7
	QfydOlD7ABDSlDqWSSV8EvGe+jZQtTgTZjTJ/sSmUG77tJjP9spYmKg/dO0c0zHMzEhuCV8oOXJ
	CCuCTsH3K3lAmzmizNSaANehyILXV/B1Y9OfKvGd0X0XbPgbtxqrPcs1Nkcb6JgChPpMUt2DK+g
	lflFAHKbc2bBAuWI3b0rX71Qj6cEAStshSNlCylqLJeLOoWstwqU+tUm5VpyGzQ7+tKOAnVt2F+
	SyiTUfGFX1oA7IZTHr6J2+4MXzvSSO2tkpukvewqztXYrJrGkHleD2oyz70Wd/OrFTQMbczGkrO
	YaVJTXMZQNsQ/cPuay7GGRY8NY6ANP1NUZd7GeiwByy/ncWcXUXHMNUlk=
X-Received: by 2002:a05:600c:8b01:b0:48a:563c:c8c5 with SMTP id 5b1f17b1804b1-490a29127c0mr55625555e9.8.1780389565427;
        Tue, 02 Jun 2026 01:39:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm43879425e9.9.2026.06.02.01.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:39:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Jun 2026 10:39:21 +0200
Subject: [PATCH v5 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-topic-sm8x50-iris-10bit-decoding-v5-6-c2b32474ed67@linaro.org>
References: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
In-Reply-To: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4850;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FSRjjiwubMsbmGQlFv02cRDb8aSDoT7TLY94ZGqccOE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqHpa3tphMfFq2aRbEGfi12mhSrXo+E1GzA7nnkPUP
 k+QIH7SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCah6WtwAKCRB33NvayMhJ0UP/D/
 4rKpp40CWrMs+OayqZM3J1qkp6ktiWk8FQvq6bdiWqZlo6X522U5dNui+tgvUxN2Bn8KOIt93GDdU0
 Nz9+4AQAukp0MMbg9JVVBx5vdArlTS3VZ3HimVO4DZXPzYUXM9FUJdqNgA+0EflfW+svmq2Le8SdyP
 zMdbFGz7CtlmT1iurqRWaXLcxv5rrHiho89ZsAsiZBU2tZdDCq4KHxzrr0v86+yS1Iv7Rwur4lm2CL
 U0w1caAvK/wMwVc3oJ1XbN5eDit+K/2D6MekvFW9qLeP0GUwVMcwr3xiFNETS8eyB9IRms8Tr4nj6D
 5AboIgx2GitTl3HoV7/HkXuwUCOcVvd8r/IKhtFgi+8HM2N/ACA34ZQ/XiJwu2VDlqKST2oJvez0Si
 oG4im2hSU5PP1ddlqBx8asU94iG23xCW5nOxytwKCUIW4X8SbJhUhWm+pW/NDj6MfnKvHODwCPbpr1
 i8tTK2DmGdwbfBlwSQ2pOdI4AGlz8shAilC+y4OfLke9Ei2ZV8AgNZ5SXod9PU7S7W3SAa9bIIaVWz
 JQ/PjK53TWxxuTa4iyPEEpa3RVS9kwfci0UL05nMGea7IvEUpYiegQ8B1+w9sjiGblEF9JS03CGTsx
 hs835IHfqmgk6UfUINjJ99L4vcB27yC3i1FHhwDvjUwATbnUcf/ZbuxblTiA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63356-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 921A062AC39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the necessary bits into the gen2 platforms tables and handlers
to allow decoding streams into 10bit pixel formats.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         |  8 +++++---
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
 drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c             |  2 ++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 7a85c1d4e5e6..acc0ed8adda1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -31,9 +31,10 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_HEVC,
 		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
 		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
 		.hfi_id = HFI_PROP_PROFILE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
@@ -262,7 +263,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = BIT_DEPTH,
 		.min = BIT_DEPTH_8,
-		.max = BIT_DEPTH_8,
+		.max = BIT_DEPTH_10,
 		.step_or_mask = 1,
 		.value = BIT_DEPTH_8,
 		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -996,6 +997,7 @@ static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_OPB_ENABLE,
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+	HFI_PROP_UBWC_STRIDE_SCANLINE,
 };
 
 static const u32 sm8550_venc_output_config_params[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index aca90aab8548..25162ae71357 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	pixmp_ip->width = width;
 	pixmp_ip->height = height;
 
+	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
+	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
+	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
+		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
+	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
+		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
+		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
+		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
+
 	switch (pixmp_op->pixelformat) {
 	case V4L2_PIX_FMT_P010:
 		pixmp_op->width = ALIGN(width, 128);
@@ -625,7 +634,12 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
 	inst->fw_caps[TIER].value = subsc_params.tier;
 
-	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
+	if (subsc_params.bit_depth == BIT_DEPTH_8)
+		inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_8;
+	else
+		inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_10;
+
+	if ((subsc_params.bit_depth != BIT_DEPTH_8 && subsc_params.bit_depth != BIT_DEPTH_10) ||
 	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
 		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
 			subsc_params.bit_depth, subsc_params.coded_frames);
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index c54d8ec8562a..a770331d1675 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -27,6 +27,8 @@ enum iris_fmt_type_out {
 enum iris_fmt_type_cap {
 	IRIS_FMT_NV12,
 	IRIS_FMT_QC08C,
+	IRIS_FMT_TP10,
+	IRIS_FMT_QC10C,
 };
 
 /**
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d55671340600..a8d6354bee28 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -71,6 +71,8 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 static const u32 iris_vdec_formats_cap[] = {
 	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
 	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
+	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
+	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)

-- 
2.34.1


