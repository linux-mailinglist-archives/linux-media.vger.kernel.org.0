Return-Path: <linux-media+bounces-62848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DekJFifFmqBnwcAu9opvQ
	(envelope-from <linux-media+bounces-62848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 09:38:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E085E0883
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 09:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21F2A300D6B9
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C903C9ED9;
	Wed, 27 May 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b="doZqlcQQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y2sDJXMr"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55CB3C5523;
	Wed, 27 May 2026 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779867445; cv=none; b=A8Sp+9T1R4C/YfWVIIPjTWz7K54sXWcd9ZlZPBbP8QVoUIeCEAratq7MD1PG7UtJw09IGRuOeeNRZGAchj7f150ywpj+Kzq/lZlaWaV9+y1+yU6Yz1ERdLqOa5pT/bbIASh/HNLn4O8yYQ6kaXm0qhHht8CAY3A0mnlC3HCRGKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779867445; c=relaxed/simple;
	bh=9peMDbQrmb540gBVVIfkqGBvNS3jiYkxpRc8g+Gms3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqzqMXFaWFickb17OBJDemqxhyuBlrEEKKn209/AngOXE45ognWb+2/Stohmg8czyDtzQQOkES7vzpzW4EyTpOujLjXry34FjAXCtkgyqd7w1x9q92EVwS8sl+NNyLA3ADrGot/Z2tVQmY5jh+ibXeArKuSJvHgwdphpUs84qA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=doZqlcQQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y2sDJXMr; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luaberry.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 28177140005F;
	Wed, 27 May 2026 03:37:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 27 May 2026 03:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1779867442; x=1779953842; bh=pftRh1hNKYuB0aVObT6yg
	zb0FoctksUaJHC3LvnKA/Q=; b=doZqlcQQwEB9uvxlMqfzw2R1KVPl/f+N1/69f
	DtH0uVl0Wl4L7m64vM7MQ88xKfKYHW3qv2ETR9R1pdOBdBpeCr7WuJMyPwGfINGF
	qRKhbgQipDkU9DVrWsnV1GbCKmZHz8bkCC/3YVIToJpuwZzvqTgSGdjzDCArlegs
	VOWCErmM79T+dW1opr01Bn7UFJvICaqwSWR/FO+L0i6rbQ5jvaeyPOAq7ghd6vET
	3BmD3L9saY5XlBntY80vXHYdSiAKg9cEQVl2vKAV7+6SiCvjb42BXONv4qed1ckR
	h8K25/HjKT3kUGnrHZHGjVfzqzyDPsaEDzzumQdUrlWNVsT6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779867442; x=1779953842; bh=pftRh1hNKYuB0aVObT6ygzb0FoctksUaJHC
	3LvnKA/Q=; b=Y2sDJXMrrhz92vocm1V4vpHdzHk8J8kiQt4eCRtpBf3qTPSxQBp
	4ANN8RntFJD8ALtKErU0hOrnth5tQnKThcm7j080qlWPfZCQsgqMZodflGki5HXF
	Sik4bAR5lVCfxP0/+RTRupiNSYPgBAKPxNc0kBwJgCubzEFNr4PK8iJTRzfSZIjs
	kxXtg+ZEKOHjczJHbfhLo7oD1dqgT+lxVRBJdtjr9uQoGJnomAbQIWj+E9mnYARr
	p9Gam0KwHzqqzfPDdVZ4a6WplPBmesfiKHc8yfz3MhULZx+pWATkYLOPCz5wtY6b
	gvzqZXOWV1ERev/Xl1FieEIfxofyunw2ixw==
X-ME-Sender: <xms:MZ8WavKVwKjfcMofFQSOHwf1n3esQGlZ3DHPU58MJcmZnFEIyqsP2Q>
    <xme:MZ8Wau-uALXIS5NHGEu3gsG-U6eUKQ-uekE1mOZJq8akTHGDtrXtbToPJW6GhTILl
    t-jmZ6_bVIVmng-4v-ZYNTXfY8VsRN5w6BVQxDeA16DkaPwINO26oo>
X-ME-Received: <xmr:MZ8WajFvGv2oJOzZVu4SzpX-XNqmKc065nLW1wXcqI-9UrWjdBeRltBHs5Ec-eAqqsHAiJu-wc_IpgI>
X-ME-Proxy-Cause: dmFkZTFHpRPo9qHiSx7q9pUshMxyk4a5QDBhkpifbIFatRX5HcTPZp62E06/ES4zz6Dt1E
    io0joxfStEL7eUVcegJdkPCQ3X9zQKVkgz1FARJLQRCM6eQXCouIZBGGKaYZvyh2vE66Jf
    V0M0Odc0b4Xd6bzoEwGYQl2APCr17juXlmuSBbhni0xicxE/n1uKi+mTy+X0HEJ6z5ANaZ
    Og8GRw6OJJHiR+3yNmvlh54N4cKBmo5PuAoCOqFKK5kMijpLiZVjcBlG91zT19Esu/YDIx
    RhJn72PCpiaV3GKk5c9D6S8x1NWniptJPLRzI/b5hA+l96/4FEzkxuokjn3rm/Lvfrc7Xt
    DCFBtXUTYJzxl6lzyNxtQStjRw2RuNZV+hajWqi/CV02kWB8yz/LkkzF4EpeVv9lmu4Io9
    SxKoTO1wfGQkbxv/F0NStk0uSk/zEyKCA5IkYIvgsfIZ7D/92H5IAJT5tTY0PeQSZe0kkT
    asyM+NnNFkxQP9/imot+9cJdVTRpJICBcClPcJs3fNaNrY8udJaTkbyzCNu3T4ogfAKYeG
    mjeRrcIEL5D46ELlIqUc9s0/KzSr1J5i2m2r7X2rxiFnmt5gQ73uUZvsg0zG3Sw+YiAdIZ
    C3RhanMjVjP/0mQP9EUYfyW5XAyTTK600MSjOr6zPhR2t57Mwri99A71ny3w
X-ME-Proxy: <xmx:MZ8Wah6bAbbO0XhOqcBIYWaNd1VcGmVFAsMM6VF6kah6XEm-g0O2lQ>
    <xmx:MZ8WakaWPjqJq0M-g2uamddME9M6a6ViQ3DUSnRR8LpnrvGQLmv36A>
    <xmx:MZ8WanixL29Yx8bieb6y1RFiCJ9eYAnvUUmNKerRqUblJQInDa1SbQ>
    <xmx:MZ8Waudt-aTCfd8hbE7ssD3ISJehxy1DYuUOWkiZHCtQL2HVkkjvBQ>
    <xmx:Mp8WarrLOEAjHDpS3hsLoPgIC82Hw1kBGSTBYJ5AFKA-XUBI8RjnVTSN>
Feedback-ID: i372e487a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 May 2026 03:37:18 -0400 (EDT)
From: Jeongin Yeo <jeongin.yeo@luaberry.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com,
	andy.shevchenko@gmail.com,
	andy@kernel.org,
	matt@mattwardle.net,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jeongin Yeo <jeongin.yeo@luaberry.com>
Subject: [PATCH v3] media: atomisp: remove redundant prefix from dev_dbg calls
Date: Wed, 27 May 2026 07:37:05 +0000
Message-ID: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[luaberry.com:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62848-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	DMARC_NA(0.00)[luaberry.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linux.intel.com,gmail.com,kernel.org,mattwardle.net,vger.kernel.org,lists.linux.dev,luaberry.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jeongin.yeo@luaberry.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[luaberry.com:+,messagingengine.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 07E085E0883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the hardcoded function name and line number prefix from
dev_dbg() output strings within ia_css_binary_find(). dev_dbg()
can already emit the function name and line number via dynamic_debug's
'f' and 'l' flags, so embedding it in the format string is redundant.

This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
introducing __func__ to format strings.

No functional changes.

Signed-off-by: Jeongin Yeo <jeongin.yeo@luaberry.com>
---
Changes in v3:
- Remove the __LINE__ argument and "[%d]" prefix from dev_dbg() calls.
  Like __func__, line numbers are provided by dynamic_debug via the 'l' flag.
- Link to v2: https://lore.kernel.org/r/20260526200222.330280-1-jeongin.yeo@luaberry.com

Changes in v2:
- Remove the function name strings entirely instead of converting
  them to __func__, per feedback from Greg KH. dev_dbg() can already
  emit function names via dynamic_debug's 'f' flag.
- Link to v1: https://lore.kernel.org/r/20260526104750.1284935-1-jeongin.yeo@luaberry.com

 .../atomisp/pci/runtime/binary/src/binary.c   | 133 ++++++++----------
 1 file changed, 58 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index e9016d7775dc3..ef766a02b460b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -925,7 +925,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 	/* MW: used after an error check, may accept NULL, but doubtful */
 	assert(binary);
 
-	dev_dbg(atomisp_dev, "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
+	dev_dbg(atomisp_dev, "enter: descr=%p, (mode=%d), binary=%p\n",
 		descr, descr->mode, binary);
 
 	mode = descr->mode;
@@ -991,8 +991,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		struct ia_css_binary_info *candidate = &xcandidate->sp;
 		/* printf("sh_css_binary_find: evaluating candidate:
 		 * %d\n",candidate->id); */
-		dev_dbg(atomisp_dev,
-			"ia_css_binary_find() candidate = %p, mode = %d ID = %d\n",
+		dev_dbg(atomisp_dev, "candidate = %p, mode = %d ID = %d\n",
 			candidate, candidate->pipeline.mode, candidate->id);
 
 		/*
@@ -1002,16 +1001,13 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		*/
 		if (!candidate->enable.continuous &&
 		    continuous && (mode != IA_CSS_BINARY_MODE_COPY)) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
-				__LINE__, candidate->enable.continuous,
-				continuous, mode, IA_CSS_BINARY_MODE_COPY);
+			dev_dbg(atomisp_dev, "continue: !%d && %d && (%d != %d)\n",
+				candidate->enable.continuous, continuous,
+				mode, IA_CSS_BINARY_MODE_COPY);
 			continue;
 		}
 		if (striped && candidate->iterator.num_stripes == 1) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: binary is not striped\n",
-				__LINE__);
+			dev_dbg(atomisp_dev, "continue: binary is not striped\n");
 			continue;
 		}
 
@@ -1019,38 +1015,38 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    (mode != IA_CSS_BINARY_MODE_COPY) &&
 		    (mode != IA_CSS_BINARY_MODE_CAPTURE_PP) &&
 		    (mode != IA_CSS_BINARY_MODE_VF_PP)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d != %d)\n",
-				__LINE__, candidate->pipeline.isp_pipe_version, isp_pipe_version);
+			dev_dbg(atomisp_dev, "continue: (%d != %d)\n",
+				candidate->pipeline.isp_pipe_version, isp_pipe_version);
 			continue;
 		}
 		if (!candidate->enable.reduced_pipe && enable_reduced_pipe) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, candidate->enable.reduced_pipe, enable_reduced_pipe);
+			dev_dbg(atomisp_dev, "continue: !%d && %d\n",
+				candidate->enable.reduced_pipe, enable_reduced_pipe);
 			continue;
 		}
 		if (!candidate->enable.dvs_6axis && enable_dvs_6axis) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, candidate->enable.dvs_6axis, enable_dvs_6axis);
+			dev_dbg(atomisp_dev, "continue: !%d && %d\n",
+				candidate->enable.dvs_6axis, enable_dvs_6axis);
 			continue;
 		}
 		if (candidate->enable.high_speed && !enable_high_speed) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
-				__LINE__, candidate->enable.high_speed, enable_high_speed);
+			dev_dbg(atomisp_dev, "continue: %d && !%d\n",
+				candidate->enable.high_speed, enable_high_speed);
 			continue;
 		}
 		if (!candidate->enable.xnr && need_xnr) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
-				__LINE__, candidate->enable.xnr, need_xnr);
+			dev_dbg(atomisp_dev, "continue: %d && !%d\n",
+				candidate->enable.xnr, need_xnr);
 			continue;
 		}
 		if (!(candidate->enable.ds & 2) && enable_yuv_ds) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, ((candidate->enable.ds & 2) != 0), enable_yuv_ds);
+			dev_dbg(atomisp_dev, "continue: !%d && %d\n",
+				((candidate->enable.ds & 2) != 0), enable_yuv_ds);
 			continue;
 		}
 		if ((candidate->enable.ds & 2) && !enable_yuv_ds) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: %d && !%d\n",
-				__LINE__, ((candidate->enable.ds & 2) != 0), enable_yuv_ds);
+			dev_dbg(atomisp_dev, "continue: %d && !%d\n",
+				((candidate->enable.ds & 2) != 0), enable_yuv_ds);
 			continue;
 		}
 
@@ -1064,85 +1060,77 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 				       candidate->vf_dec.is_variable ||
 				       /* or more than one output pin. */
 				       xcandidate->num_output_pins > 1)) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%p != NULL) && !(%d || %d || (%d >%d))\n",
-				__LINE__, req_vf_info, candidate->enable.vf_veceven,
+			dev_dbg(atomisp_dev, "continue: (%p != NULL) && !(%d || %d || (%d >%d))\n",
+				req_vf_info, candidate->enable.vf_veceven,
 				candidate->vf_dec.is_variable, xcandidate->num_output_pins, 1);
 			continue;
 		}
 		if (!candidate->enable.dvs_envelope && need_dvs) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, candidate->enable.dvs_envelope, (int)need_dvs);
+			dev_dbg(atomisp_dev, "continue: !%d && %d\n",
+				candidate->enable.dvs_envelope, (int)need_dvs);
 			continue;
 		}
 		/* internal_res check considers input, output, and dvs envelope sizes */
 		ia_css_binary_internal_res(req_in_info, req_bds_out_info,
 					   req_bin_out_info, &dvs_env, candidate, &internal_res);
 		if (internal_res.width > candidate->internal.max_width) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-				__LINE__, internal_res.width, candidate->internal.max_width);
+			dev_dbg(atomisp_dev, "continue: (%d > %d)\n",
+				internal_res.width, candidate->internal.max_width);
 			continue;
 		}
 		if (internal_res.height > candidate->internal.max_height) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-				__LINE__, internal_res.height, candidate->internal.max_height);
+			dev_dbg(atomisp_dev, "continue: (%d > %d)\n",
+				internal_res.height, candidate->internal.max_height);
 			continue;
 		}
 		if (!candidate->enable.ds && need_ds && !(xcandidate->num_output_pins > 1)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d && %d\n",
-				__LINE__, candidate->enable.ds, (int)need_ds);
+			dev_dbg(atomisp_dev, "continue: !%d && %d\n",
+				candidate->enable.ds, (int)need_ds);
 			continue;
 		}
 		if (!candidate->enable.uds && !candidate->enable.dvs_6axis && need_dz) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && !%d && %d\n",
-				__LINE__, candidate->enable.uds, candidate->enable.dvs_6axis,
+			dev_dbg(atomisp_dev, "continue: !%d && !%d && %d\n",
+				candidate->enable.uds, candidate->enable.dvs_6axis,
 				(int)need_dz);
 			continue;
 		}
 		if (online && candidate->input.source == IA_CSS_BINARY_INPUT_MEMORY) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: %d && (%d == %d)\n",
-				__LINE__, online, candidate->input.source,
+			dev_dbg(atomisp_dev, "continue: %d && (%d == %d)\n",
+				online, candidate->input.source,
 				IA_CSS_BINARY_INPUT_MEMORY);
 			continue;
 		}
 		if (!online && candidate->input.source == IA_CSS_BINARY_INPUT_SENSOR) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: !%d && (%d == %d)\n",
-				__LINE__, online, candidate->input.source,
+			dev_dbg(atomisp_dev, "continue: !%d && (%d == %d)\n",
+				online, candidate->input.source,
 				IA_CSS_BINARY_INPUT_SENSOR);
 			continue;
 		}
 		if (req_bin_out_info->res.width < candidate->output.min_width ||
 		    req_bin_out_info->res.width > candidate->output.max_width) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d > %d) || (%d < %d)\n",
-				__LINE__, req_bin_out_info->padded_width,
-				candidate->output.min_width, req_bin_out_info->padded_width,
-				candidate->output.max_width);
+			dev_dbg(atomisp_dev, "continue: (%d > %d) || (%d < %d)\n",
+				req_bin_out_info->padded_width, candidate->output.min_width,
+				req_bin_out_info->padded_width, candidate->output.max_width);
 			continue;
 		}
 		if (xcandidate->num_output_pins > 1 &&
 		    /* in case we have a second output pin, */
 		    req_vf_info) { /* and we need vf output. */
 			if (req_vf_info->res.width > candidate->output.max_width) {
-				dev_dbg(atomisp_dev,
-					"ia_css_binary_find() [%d] continue: (%d < %d)\n",
-					__LINE__, req_vf_info->res.width,
-					candidate->output.max_width);
+				dev_dbg(atomisp_dev, "continue: (%d < %d)\n",
+					req_vf_info->res.width, candidate->output.max_width);
 				continue;
 			}
 		}
 		if (req_in_info->padded_width > candidate->input.max_width) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-				__LINE__, req_in_info->padded_width, candidate->input.max_width);
+			dev_dbg(atomisp_dev, "continue: (%d > %d)\n",
+				req_in_info->padded_width, candidate->input.max_width);
 			continue;
 		}
 		if (!binary_supports_output_format(xcandidate, req_bin_out_info->format)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: !%d\n",
-				__LINE__, binary_supports_output_format(xcandidate,
-									req_bin_out_info->format));
+			dev_dbg(atomisp_dev, "continue: !%d\n",
+				binary_supports_output_format(xcandidate,
+							      req_bin_out_info->format));
 			continue;
 		}
 		if (xcandidate->num_output_pins > 1 &&
@@ -1151,9 +1139,8 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		    /* check if the required vf format
 		    is supported. */
 		    !binary_supports_output_format(xcandidate, req_vf_info->format)) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d > %d) && (%p != NULL) && !%d\n",
-				__LINE__, xcandidate->num_output_pins, 1, req_vf_info,
+			dev_dbg(atomisp_dev, "continue: (%d > %d) && (%p != NULL) && !%d\n",
+				xcandidate->num_output_pins, 1, req_vf_info,
 				binary_supports_output_format(xcandidate, req_vf_info->format));
 			continue;
 		}
@@ -1162,9 +1149,8 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		if (xcandidate->num_output_pins == 1 &&
 		    req_vf_info && candidate->enable.vf_veceven &&
 		    !binary_supports_vf_format(xcandidate, req_vf_info->format)) {
-			dev_dbg(atomisp_dev,
-				"ia_css_binary_find() [%d] continue: (%d == %d) && (%p != NULL) && %d && !%d\n",
-				__LINE__, xcandidate->num_output_pins, 1,
+			dev_dbg(atomisp_dev, "continue: (%d == %d) && (%p != NULL) && %d && !%d\n",
+				xcandidate->num_output_pins, 1,
 				req_vf_info, candidate->enable.vf_veceven,
 				binary_supports_vf_format(xcandidate, req_vf_info->format));
 			continue;
@@ -1174,31 +1160,28 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		if (xcandidate->num_output_pins == 1 &&
 		    req_vf_info && candidate->enable.vf_veceven) { /* and we need vf output. */
 			if (req_vf_info->res.width > candidate->output.max_width) {
-				dev_dbg(atomisp_dev,
-					"ia_css_binary_find() [%d] continue: (%d < %d)\n",
-					__LINE__, req_vf_info->res.width,
-					candidate->output.max_width);
+				dev_dbg(atomisp_dev, "continue: (%d < %d)\n",
+					req_vf_info->res.width, candidate->output.max_width);
 				continue;
 			}
 		}
 
 		if (!supports_bds_factor(candidate->bds.supported_bds_factors,
 					 descr->required_bds_factor)) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-				__LINE__, candidate->bds.supported_bds_factors,
-				descr->required_bds_factor);
+			dev_dbg(atomisp_dev, "continue: 0x%x & 0x%x)\n",
+				candidate->bds.supported_bds_factors, descr->required_bds_factor);
 			continue;
 		}
 
 		if (!candidate->enable.dpc && need_dpc) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-				__LINE__, candidate->enable.dpc, descr->enable_dpc);
+			dev_dbg(atomisp_dev, "continue: 0x%x & 0x%x)\n",
+				candidate->enable.dpc, descr->enable_dpc);
 			continue;
 		}
 
 		if (candidate->uds.use_bci && enable_capture_pp_bli) {
-			dev_dbg(atomisp_dev, "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-				__LINE__, candidate->uds.use_bci, descr->enable_capture_pp_bli);
+			dev_dbg(atomisp_dev, "continue: 0x%x & 0x%x)\n",
+				candidate->uds.use_bci, descr->enable_capture_pp_bli);
 			continue;
 		}
 
-- 
2.43.0


