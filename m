Return-Path: <linux-media+bounces-56792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OVAG+3ywWlzYQQAu9opvQ
	(envelope-from <linux-media+bounces-56792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:11:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70B301015
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EF2E303C2FB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E87C37C931;
	Tue, 24 Mar 2026 02:05:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD137B010;
	Tue, 24 Mar 2026 02:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317909; cv=none; b=NlqiA/4KVCLWKKNrwP7vQG3ulNaLFKag/D0LNzs0yGurpnOGVe1keNb2kMH/EvdX6BpHNAahrJBshRhNEH5AqF0yDLHJjRG83ssR1Bh1s9Yshs4lzmRv3JG3Aj21BREefN6Quibw+Y6K8zOBEmiYQYpsQ8+vhOIDLiSRRbwkdmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317909; c=relaxed/simple;
	bh=DAwIrXebhENqL23L45uimbqY/43wBEmFqnRddH3bpLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bv+mc6Yp65nfVCeGWVAT3VFddpzAyarV6YIU4cRBsJ/q6PBS0tqO1FLpHgG8B0Z/bUp7768LDTVq38gcqpH7aLY5jQOM0KrDU+cjBOeCaf5nro5coISAuwRT4eV+99XaLhUejK0a8oMPlcve+0vdQURspBXK4sa0T3p9SqxAT8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAAXrA8v8cFpkBFKCw--.34865S2;
	Tue, 24 Mar 2026 10:04:54 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] media: cedrus: validate H.264 reference list indices
Date: Tue, 24 Mar 2026 10:04:31 +0800
Message-ID: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAXrA8v8cFpkBFKCw--.34865S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF48WFykJr4fGrW3ZFyDGFg_yoW8tFyxpF
	45Cr13ZayUXF43KF43Zr4kXa4a9as3AFsxKrWag3W3X3W3GFy7Xr4rKw1UZrn8Aa15C3ya
	yrn5J3yUKFyUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUO9N3UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-56792-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E70B301015
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Cedrus validates HEVC slice reference lists in cedrus_try_ctrl(), but
the H.264 path still consumes ref_pic_list0/ref_pic_list1 indices
straight from the stateless slice control. Those indices are later
used to index the fixed-size decode_params->dpb[] array in
_cedrus_write_ref_list().

Reject H.264 slice controls whose active reference counts or
reference indices exceed V4L2_H264_NUM_DPB_ENTRIES before the driver
reaches the DPB lookup. This keeps the validation next to the existing
Cedrus stateless control checks and avoids driver-specific
out-of-bounds reads from malformed userspace control payloads.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index d68da1eaa7aa..905084c097a9 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -42,6 +42,29 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_H264_SLICE_PARAMS) {
+		const struct v4l2_ctrl_h264_slice_params *slice = ctrl->p_new.p_h264_slice_params;
+		unsigned int i;
+
+		if (slice->num_ref_idx_l0_active_minus1 >=
+		    V4L2_H264_NUM_DPB_ENTRIES)
+			return -EINVAL;
+
+		for (i = 0; i <= slice->num_ref_idx_l0_active_minus1; i++)
+			if (slice->ref_pic_list0[i].index >=
+			    V4L2_H264_NUM_DPB_ENTRIES)
+				return -EINVAL;
+
+		if (slice->slice_type == V4L2_H264_SLICE_TYPE_B) {
+			if (slice->num_ref_idx_l1_active_minus1 >=
+			    V4L2_H264_NUM_DPB_ENTRIES)
+				return -EINVAL;
+
+			for (i = 0; i <= slice->num_ref_idx_l1_active_minus1; i++)
+				if (slice->ref_pic_list1[i].index >=
+				    V4L2_H264_NUM_DPB_ENTRIES)
+					return -EINVAL;
+		}
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
-- 
2.50.1 (Apple Git-155)


