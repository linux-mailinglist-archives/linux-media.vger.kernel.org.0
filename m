Return-Path: <linux-media+bounces-62777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BAZHax6FWp8VgcAu9opvQ
	(envelope-from <linux-media+bounces-62777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:49:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E368D5D4628
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB2E6301954A
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22B43DDDA1;
	Tue, 26 May 2026 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b="U/JjSTBg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nmK+J+mH"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-c2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389C63DD853;
	Tue, 26 May 2026 10:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792513; cv=none; b=I6MuB2wo7kXCFO0tZ/YvF5IzKuYfivsYiaaQH2EG1ZO2CYA3QArV8MMCDaABZOWoNhzb1RFlZ9wxIBu9xLaHb2sWUTbcawjSZpHcs14ojwymo76yLYfAAbyWHgQo+XeozRxWrj/APSKfA4AG9Pz/QlRCeDcms/1hkuuYsILccW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792513; c=relaxed/simple;
	bh=i7Lhl7OlZHoKLfsw3sAvAf3zv6ipzq0DPddi72Jrcag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pRXFv3GSFe/gKMRbnuuEx/62s5jDQq1jfCSqReECECe/nSJ4x9LIE2GFG12i6Gec07WYGkMRuuP5G82MxyraZ8OhYtcyqRBs1GSHzPC8n3CKUm0xWTsQ4MJK4fQzdt7wSUGK5MWI2xJFSMHupZr3Iy/sZt0iOjYP20Xiu20/BT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=U/JjSTBg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nmK+J+mH; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luaberry.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1A1217A01AA;
	Tue, 26 May 2026 06:48:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 26 May 2026 06:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1779792508; x=1779878908; bh=EFhzle0ktyjcNkkrAymk8
	NC01kPOhQiOdfzOiKecAPE=; b=U/JjSTBg32Z2mtg6TtdV2SJTQIsY8sVH1bn/E
	lLfqhF8nQr7k34GT9huXmYvARa93v2Wuz4eofeKLhJMxYc4c9yxyJZrTGYeqoHpC
	kLO2gDuunzkTukH1F1tQtcQmN10AbuexbTJle2r+QlaZqB361lSWw+xt319FYPb1
	Kjhrxg0V5+hRVema4baJvZpONN+dwCZYY+Oxsr8RutJWlpnqkhrdzZFjarHdttH4
	ODKPaOgdnoHc5xUOyvaFca8ri+5QRO062vYgTTwECqW93CVrS0711diiu32VzAqw
	29xnArmf1XtNcSgjONYnL3OZBM2IFshf/NU3WbIIImgiqWyYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779792508; x=1779878908; bh=EFhzle0ktyjcNkkrAymk8NC01kPOhQiOdfz
	OiKecAPE=; b=nmK+J+mHQs1fQCymTafG3P1bLepYhfKuZf8Of6u2B2vAFLI/GkX
	DuKg/EyFPbkLthBFhX4ljHqKyhuTvWhA4EN4Qfr7gxKhy4ojtzXat0eYFpdfbCok
	M4S5PO6VrcLCxePFvVzlWX2yNgNhjAJGVPeA2wLu01LkGqJQtenj/90/1AsHR+cl
	0pKKZdbaMhdlBj+A+j2oclvMYV0Qlt5GkwUTy2afTI+fYo8AiDg5PE0uQKpymocy
	Y0HIJwFNlHZR4qO4+SwTKIWGplfcUqubWxRe96v1oGSUqGpBLR3907gLKYPHqra6
	PBNoXlYqJ/82alYbLlqIoF636CZfLDFc8zg==
X-ME-Sender: <xms:fHoVarfYF0cNbm1GfnQO0cIs75JV0benrq-EdSNBpZTwBkK91PFVng>
    <xme:fHoVag5yCrYTNcaYxyyCMiaNzpqWyI_noyR4MNB7E4bzen3rIEYmoCF1F3DZYxFB1
    irrvJ1Pu9ttLRGDybqJAWHknnBdwuuKJYS-m5ZSbf7cMrHr9FIU6pE>
X-ME-Received: <xmr:fHoVagKqS5B4AyuOzG4jYhDkbeDxdlIBJ3tWWEU1pYL4fhQ6edWkez-D6A>
X-ME-Proxy-Cause: dmFkZTFl2plj/3z0Am/GoCr3MwQYulNUg70/EyrykRDgCniArcqMdAJ8Xnmiv7ukiGvRWR
    msrk29DZP1Z2D4UN9NpbW1PtK0gyzZjTISeh0j6sw2TqukhPFg44rCITagcYb1Lh82iqUp
    DlNQQfsZmDT9EguOGOlllHLPqzMUmRIyxP+bipOZRXD8flmeQUHQ0Is0q9ofO/loSbiDqV
    OoJFhcBlXS9S2g31bCdtXeTIPeksm5JHqVrVBYDFjXT//0JlIJmdd2hTx89JalLbsrimXw
    cmmF1gUZHtSjWS391MfAJjfrZHuuTEmspHaO4v/ZSRSLeDlFGPVHsUqHtFdkrnw/EupAWO
    xYwfv10meDcVSLLGN+g6Fm6ME47cdnQhqem3sbNYFRzbJ6bNIIFLlYm6Lj+wsrLqZ09CCA
    0uxqa/Hm3tvVy2x2znAG20U57IDlwZvVINgBw40lXLxHFFGt/i2yeOir3p/l8Bi4/m0FDh
    DYrMrQkAYz8tNQuvv4gtBTPItk0+JYqTUA/5SzXyIUpSQ8YQWi4EPI4rQSUfsG4FlpwNXj
    3tV9UD0JY2RCBaBmX+o3+1xdsS897ffq2aCY52GRfKfcq3tQ31wxCtjCJX1IX3h5Wlu9o+
    86FvWCkW+0JSBknq/0iPCO5JuMbOKiIwTh/dbLCvsJMODvGGlgAJf4ZnTVew
X-ME-Proxy: <xmx:fHoVaoxyG9gGTTYr1Abva218rs2-dL-f06pTYGQOsQxNJX9RQ9H8Sg>
    <xmx:fHoVaoJgjqTeq2DZAQHpYld33QHMQqLYwiXfTM7DgJNir66vvGMJcw>
    <xmx:fHoVanX-9n4e8UalP2CRudvomJDPRP1SK219QKB5LmIHPyPpbyrn1Q>
    <xmx:fHoVarbg1L4GxcZCONTQgnPSZ5mHjSVN0mMVkwEutp_Mih8mgigNgw>
    <xmx:fHoVaqLBrTTcXWKuLcxalg5HKnEFin58bCd7saUQFIoVNfAOzOUTJjh->
Feedback-ID: i372e487a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 May 2026 06:48:25 -0400 (EDT)
From: Jeongin Yeo <jeongin.yeo@luaberry.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andy@kernel.org,
	matt@mattwardle.net,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jeongin Yeo <jeongin.yeo@luaberry.com>
Subject: [PATCH] media: atomisp: use __func__ in debug messages in binary.c
Date: Tue, 26 May 2026 10:47:50 +0000
Message-ID: <20260526104750.1284935-1-jeongin.yeo@luaberry.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[luaberry.com:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[luaberry.com:+,messagingengine.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62777-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[luaberry.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeongin.yeo@luaberry.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E368D5D4628
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace hardcoded function name strings with __func__ macro in
dev_dbg() calls within ia_css_binary_find() as recommended by
kernel coding style.

No functional changes.

Signed-off-by: Jeongin Yeo <jeongin.yeo@luaberry.com>
---
 .../atomisp/pci/runtime/binary/src/binary.c   | 127 ++++++++++--------
 1 file changed, 68 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index e9016d7775dc3..2355fdf357fcd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -925,8 +925,8 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 	/* MW: used after an error check, may accept NULL, but doubtful */
 	assert(binary);
 
-	dev_dbg(atomisp_dev, "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
-		descr, descr->mode, binary);
+	dev_dbg(atomisp_dev, "%s() enter: descr=%p, (mode=%d), binary=%p\n",
+		__func__, descr, descr->mode, binary);
 
 	mode = descr->mode;
 	online = descr->online;
@@ -992,8 +992,8 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		/* printf("sh_css_binary_find: evaluating candidate:
 		 * %d\n",candidate->id); */
 		dev_dbg(atomisp_dev,
-			"ia_css_binary_find() candidate = %p, mode = %d ID = %d\n",
-			candidate, candidate->pipeline.mode, candidate->id);
+			"%s() candidate = %p, mode = %d ID = %d\n",
+			__func__, candidate, candidate->pipeline.mode, candidate->id);
 
 		/*
 		 * MW: Only a limited set of jointly configured binaries can
@@ -1003,15 +1003,15 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		if (!candidate->enable.continuous &&
 		    continuous && (mode != IA_CSS_BINARY_MODE_COPY)) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
-				__LINE__, candidate->enable.continuous,
+				"%s() [%d] continue: !%d && %d && (%d != %d)\n",
+				__func__, __LINE__, candidate->enable.continuous,
 				continuous, mode, IA_CSS_BINARY_MODE_COPY);
 			continue;
 		}
 		if (striped && candidate->iterator.num_stripes == 1) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: binary is not striped\n",
-				__LINE__);
+				"%s() [%d] continue: binary is not striped\n",
+				__func__, __LINE__);
 			continue;
 		}
 
@@ -1019,38 +1019,43 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    (mode != IA_CSS_BINARY_MODE_COPY) &&
 		    (mode != IA_CSS_BINARY_MODE_CAPTURE_PP) &&
 		    (mode != IA_CSS_BINARY_MODE_VF_PP)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d != %d)\n",
-				__LINE__, candidate->pipeline.isp_pipe_version, isp_pipe_version);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: (%d != %d)\n",
+				__func__, __LINE__, candidate->pipeline.isp_pipe_version,
+				isp_pipe_version);
 			continue;
 		}
 		if (!candidate->enable.reduced_pipe && enable_reduced_pipe) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, candidate->enable.reduced_pipe, enable_reduced_pipe);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: !%d && %d\n",
+				__func__, __LINE__, candidate->enable.reduced_pipe,
+				enable_reduced_pipe);
 			continue;
 		}
 		if (!candidate->enable.dvs_6axis && enable_dvs_6axis) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, candidate->enable.dvs_6axis, enable_dvs_6axis);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: !%d && %d\n",
+				__func__, __LINE__, candidate->enable.dvs_6axis, enable_dvs_6axis);
 			continue;
 		}
 		if (candidate->enable.high_speed && !enable_high_speed) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
-				__LINE__, candidate->enable.high_speed, enable_high_speed);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: %d && !%d\n",
+				__func__, __LINE__, candidate->enable.high_speed,
+				enable_high_speed);
 			continue;
 		}
 		if (!candidate->enable.xnr && need_xnr) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
-				__LINE__, candidate->enable.xnr, need_xnr);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: %d && !%d\n",
+				__func__, __LINE__, candidate->enable.xnr, need_xnr);
 			continue;
 		}
 		if (!(candidate->enable.ds & 2) && enable_yuv_ds) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, ((candidate->enable.ds & 2) != 0), enable_yuv_ds);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: !%d && %d\n",
+				__func__, __LINE__, ((candidate->enable.ds & 2) != 0),
+				enable_yuv_ds);
 			continue;
 		}
 		if ((candidate->enable.ds & 2) && !enable_yuv_ds) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
-				__LINE__, ((candidate->enable.ds & 2) != 0), enable_yuv_ds);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: %d && !%d\n",
+				__func__, __LINE__, ((candidate->enable.ds & 2) != 0),
+				enable_yuv_ds);
 			continue;
 		}
 
@@ -1065,60 +1070,62 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 				       /* or more than one output pin. */
 				       xcandidate->num_output_pins > 1)) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%p != NULL) && !(%d || %d || (%d >%d))\n",
-				__LINE__, req_vf_info, candidate->enable.vf_veceven,
+				"%s() [%d] continue: (%p != NULL) && !(%d || %d || (%d >%d))\n",
+				__func__, __LINE__, req_vf_info, candidate->enable.vf_veceven,
 				candidate->vf_dec.is_variable, xcandidate->num_output_pins, 1);
 			continue;
 		}
 		if (!candidate->enable.dvs_envelope && need_dvs) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, candidate->enable.dvs_envelope, (int)need_dvs);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: !%d && %d\n",
+				__func__, __LINE__, candidate->enable.dvs_envelope, (int)need_dvs);
 			continue;
 		}
 		/* internal_res check considers input, output, and dvs envelope sizes */
 		ia_css_binary_internal_res(req_in_info, req_bds_out_info,
 					   req_bin_out_info, &dvs_env, candidate, &internal_res);
 		if (internal_res.width > candidate->internal.max_width) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-				__LINE__, internal_res.width, candidate->internal.max_width);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: (%d > %d)\n",
+				__func__, __LINE__, internal_res.width,
+				candidate->internal.max_width);
 			continue;
 		}
 		if (internal_res.height > candidate->internal.max_height) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-				__LINE__, internal_res.height, candidate->internal.max_height);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: (%d > %d)\n",
+				__func__, __LINE__, internal_res.height,
+				candidate->internal.max_height);
 			continue;
 		}
 		if (!candidate->enable.ds && need_ds && !(xcandidate->num_output_pins > 1)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, candidate->enable.ds, (int)need_ds);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: !%d && %d\n",
+				__func__, __LINE__, candidate->enable.ds, (int)need_ds);
 			continue;
 		}
 		if (!candidate->enable.uds && !candidate->enable.dvs_6axis && need_dz) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && !%d && %d\n",
-				__LINE__, candidate->enable.uds, candidate->enable.dvs_6axis,
-				(int)need_dz);
+				"%s() [%d] continue: !%d && !%d && %d\n",
+				__func__, __LINE__, candidate->enable.uds,
+				candidate->enable.dvs_6axis, (int)need_dz);
 			continue;
 		}
 		if (online && candidate->input.source == IA_CSS_BINARY_INPUT_MEMORY) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: %d && (%d == %d)\n",
-				__LINE__, online, candidate->input.source,
+				"%s() [%d] continue: %d && (%d == %d)\n",
+				__func__, __LINE__, online, candidate->input.source,
 				IA_CSS_BINARY_INPUT_MEMORY);
 			continue;
 		}
 		if (!online && candidate->input.source == IA_CSS_BINARY_INPUT_SENSOR) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && (%d == %d)\n",
-				__LINE__, online, candidate->input.source,
+				"%s() [%d] continue: !%d && (%d == %d)\n",
+				__func__, __LINE__, online, candidate->input.source,
 				IA_CSS_BINARY_INPUT_SENSOR);
 			continue;
 		}
 		if (req_bin_out_info->res.width < candidate->output.min_width ||
 		    req_bin_out_info->res.width > candidate->output.max_width) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d > %d) || (%d < %d)\n",
-				__LINE__, req_bin_out_info->padded_width,
+				"%s() [%d] continue: (%d > %d) || (%d < %d)\n",
+				__func__, __LINE__, req_bin_out_info->padded_width,
 				candidate->output.min_width, req_bin_out_info->padded_width,
 				candidate->output.max_width);
 			continue;
@@ -1128,20 +1135,21 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    req_vf_info) { /* and we need vf output. */
 			if (req_vf_info->res.width > candidate->output.max_width) {
 				dev_dbg(atomisp_dev,
-					"ia_css_binary_find() [%d] continue: (%d < %d)\n",
-					__LINE__, req_vf_info->res.width,
+					"%s() [%d] continue: (%d < %d)\n",
+					__func__, __LINE__, req_vf_info->res.width,
 					candidate->output.max_width);
 				continue;
 			}
 		}
 		if (req_in_info->padded_width > candidate->input.max_width) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-				__LINE__, req_in_info->padded_width, candidate->input.max_width);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: (%d > %d)\n",
+				__func__, __LINE__, req_in_info->padded_width,
+				candidate->input.max_width);
 			continue;
 		}
 		if (!binary_supports_output_format(xcandidate, req_bin_out_info->format)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d\n",
-				__LINE__, binary_supports_output_format(xcandidate,
+			dev_dbg(atomisp_dev, "%s() [%d] continue: !%d\n",
+				__func__, __LINE__, binary_supports_output_format(xcandidate,
 									req_bin_out_info->format));
 			continue;
 		}
@@ -1152,8 +1160,8 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    is supported. */
 		    !binary_supports_output_format(xcandidate, req_vf_info->format)) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d > %d) && (%p != NULL) && !%d\n",
-				__LINE__, xcandidate->num_output_pins, 1, req_vf_info,
+				"%s() [%d] continue: (%d > %d) && (%p != NULL) && !%d\n",
+				__func__, __LINE__, xcandidate->num_output_pins, 1, req_vf_info,
 				binary_supports_output_format(xcandidate, req_vf_info->format));
 			continue;
 		}
@@ -1163,8 +1171,8 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    req_vf_info && candidate->enable.vf_veceven &&
 		    !binary_supports_vf_format(xcandidate, req_vf_info->format)) {
 			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d == %d) && (%p != NULL) && %d && !%d\n",
-				__LINE__, xcandidate->num_output_pins, 1,
+				"%s() [%d] continue: (%d == %d) && (%p != NULL) && %d && !%d\n",
+				__func__, __LINE__, xcandidate->num_output_pins, 1,
 				req_vf_info, candidate->enable.vf_veceven,
 				binary_supports_vf_format(xcandidate, req_vf_info->format));
 			continue;
@@ -1175,8 +1183,8 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    req_vf_info && candidate->enable.vf_veceven) { /* and we need vf output. */
 			if (req_vf_info->res.width > candidate->output.max_width) {
 				dev_dbg(atomisp_dev,
-					"ia_css_binary_find() [%d] continue: (%d < %d)\n",
-					__LINE__, req_vf_info->res.width,
+					"%s() [%d] continue: (%d < %d)\n",
+					__func__, __LINE__, req_vf_info->res.width,
 					candidate->output.max_width);
 				continue;
 			}
@@ -1184,21 +1192,22 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 
 		if (!supports_bds_factor(candidate->bds.supported_bds_factors,
 					 descr->required_bds_factor)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-				__LINE__, candidate->bds.supported_bds_factors,
+			dev_dbg(atomisp_dev, "%s() [%d] continue: 0x%x & 0x%x)\n",
+				__func__, __LINE__, candidate->bds.supported_bds_factors,
 				descr->required_bds_factor);
 			continue;
 		}
 
 		if (!candidate->enable.dpc && need_dpc) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-				__LINE__, candidate->enable.dpc, descr->enable_dpc);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: 0x%x & 0x%x)\n",
+				__func__, __LINE__, candidate->enable.dpc, descr->enable_dpc);
 			continue;
 		}
 
 		if (candidate->uds.use_bci && enable_capture_pp_bli) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-				__LINE__, candidate->uds.use_bci, descr->enable_capture_pp_bli);
+			dev_dbg(atomisp_dev, "%s() [%d] continue: 0x%x & 0x%x)\n",
+				__func__, __LINE__, candidate->uds.use_bci,
+				descr->enable_capture_pp_bli);
 			continue;
 		}
 
-- 
2.43.0


