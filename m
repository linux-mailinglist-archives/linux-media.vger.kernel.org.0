Return-Path: <linux-media+bounces-58342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLMTMvOv12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:56:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAC43CBA23
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB825301B170
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D3B376481;
	Thu,  9 Apr 2026 13:55:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1123D333C;
	Thu,  9 Apr 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742939; cv=none; b=kbgHE+lQ+Zq39bnG9tJTmbKgvhFIiR4oeXAzbYnTlNUXBli6mmhFBHvs7LKbN0JuFq1eJfcikMGUMAB/wnGPexkpCxM15IExckDIHV4JiYd5rda9z8UD4utcwIibLI0d/5fv12Zc2QUebv7w4N58HpKWRzCYx2gpeOTWwVWDWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742939; c=relaxed/simple;
	bh=/wyN074ozyoyiY3SXF9S2Zxhqlxqtyee4oZd5bQXtI8=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=CgW0fD3UAur/3S9Q9bC0jAFGIdGxIk65+Md9EAONaRxqVxkCopVbZsDki2yQNVD522IF/3tjr1njrFgkJNPxOLhbsntalHOVvk2y3wOaWRrIBKgI35X+C8rrSByEy3weYNkS4/Z89UZAlmv6e9vKKiIaF0omhVIa1F8a7TqHlkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-cedrus-h264-active-v2.eml (unknown [111.196.245.116])
	by APP-01 (Coremail) with SMTP id qwCowADHM2_Er9dpNYa+DA--.16410S2;
	Thu, 09 Apr 2026 21:55:17 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Thu, 9 Apr 2026 21:30:00 +0800
Message-ID: <20260409223001.1-cedrus-h264-active-v2-pengpeng@iscas.ac.cn>
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
Subject: [PATCH v2] media: cedrus: reject invalid active H.264 ref indices
X-CM-TRANSID:qwCowADHM2_Er9dpNYa+DA--.16410S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF1DAr1ftF13Gr4rKr15Jwb_yoW7tr1kpF
	45Cr1DJF4UJr15GFW8JFW8Z3WakFyrXry7JryrKw1jvFy7try7tF1ak34Yvr45Z3yDCrsa
	yF4ay3y8Cr48ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUZYFZUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58342-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,linuxfoundation.org,gmail.com,sholland.org,collabora.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 4CAC43CBA23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Cedrus consumes the active ref_pic_list0/ref_pic_list1 entries and uses
their indices to look up decode->dpb[] in _cedrus_write_ref_list().

Those active portions are the first
num_ref_idx_l0_active_minus1 + 1 / num_ref_idx_l1_active_minus1 + 1
entries in the two reference lists.

An out-of-range index in that active portion can therefore read past the
fixed V4L2_H264_NUM_DPB_ENTRIES array.

Checking this in cedrus_try_ctrl() is awkward because the request-local
DPB state may not have been applied yet. Instead, validate the active
entries at the actual Cedrus use site and fail setup with -EINVAL if one
points past decode->dpb[].

Entries beyond the active reference counts remain ignored as before, so
this does not change how Cedrus treats unused tail data in the
reference-list controls.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- reject invalid indices in the active reference list entries instead of
  silently skipping them
- keep the validation at the Cedrus use site, but propagate -EINVAL back
  through setup

 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 32 ++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 3e2843ef6cce..58c411c580f3 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -186,10 +186,10 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 
 #define CEDRUS_MAX_REF_IDX	32
 
-static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
-				   struct cedrus_run *run,
-				   const struct v4l2_h264_reference *ref_list,
-				   u8 num_ref, enum cedrus_h264_sram_off sram)
+static int _cedrus_write_ref_list(struct cedrus_ctx *ctx,
+				  struct cedrus_run *run,
+				  const struct v4l2_h264_reference *ref_list,
+				  u8 num_ref, enum cedrus_h264_sram_off sram)
 {
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	struct vb2_queue *cap_q;
@@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
 		u8 dpb_idx;
 
 		dpb_idx = ref_list[i].index;
+		if (dpb_idx >= V4L2_H264_NUM_DPB_ENTRIES)
+			return -EINVAL;
+
 		dpb = &decode->dpb[dpb_idx];
 
 		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
@@ -229,28 +232,30 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
 
 	size = min_t(size_t, ALIGN(num_ref, 4), sizeof(sram_array));
 	cedrus_h264_write_sram(dev, sram, &sram_array, size);
+
+	return 0;
 }
 
-static void cedrus_write_ref_list0(struct cedrus_ctx *ctx,
-				   struct cedrus_run *run)
+static int cedrus_write_ref_list0(struct cedrus_ctx *ctx,
+				  struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_h264_slice_params *slice = run->h264.slice_params;
 
-	_cedrus_write_ref_list(ctx, run,
-			       slice->ref_pic_list0,
-			       slice->num_ref_idx_l0_active_minus1 + 1,
-			       CEDRUS_SRAM_H264_REF_LIST_0);
+	return _cedrus_write_ref_list(ctx, run,
+				      slice->ref_pic_list0,
+				      slice->num_ref_idx_l0_active_minus1 + 1,
+				      CEDRUS_SRAM_H264_REF_LIST_0);
 }
 
-static void cedrus_write_ref_list1(struct cedrus_ctx *ctx,
-				   struct cedrus_run *run)
+static int cedrus_write_ref_list1(struct cedrus_ctx *ctx,
+				  struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_h264_slice_params *slice = run->h264.slice_params;
 
-	_cedrus_write_ref_list(ctx, run,
-			       slice->ref_pic_list1,
-			       slice->num_ref_idx_l1_active_minus1 + 1,
-			       CEDRUS_SRAM_H264_REF_LIST_1);
+	return _cedrus_write_ref_list(ctx, run,
+				      slice->ref_pic_list1,
+				      slice->num_ref_idx_l1_active_minus1 + 1,
+				      CEDRUS_SRAM_H264_REF_LIST_1);
 }
 
 static void cedrus_write_scaling_lists(struct cedrus_ctx *ctx,
@@ -338,8 +343,8 @@ static void cedrus_skip_bits(struct cedrus_dev *dev, int num)
 	}
 }
 
-static void cedrus_set_params(struct cedrus_ctx *ctx,
-			      struct cedrus_run *run)
+static int cedrus_set_params(struct cedrus_ctx *ctx,
+			     struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	const struct v4l2_ctrl_h264_slice_params *slice = run->h264.slice_params;
@@ -351,6 +356,7 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	size_t slice_bytes = vb2_get_plane_payload(src_buf, 0);
 	unsigned int pic_width_in_mbs;
 	bool mbaff_pic;
+	int ret;
 	u32 reg;
 
 	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
@@ -393,11 +399,17 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 
 	if ((slice->slice_type == V4L2_H264_SLICE_TYPE_P) ||
 	    (slice->slice_type == V4L2_H264_SLICE_TYPE_SP) ||
-	    (slice->slice_type == V4L2_H264_SLICE_TYPE_B))
-		cedrus_write_ref_list0(ctx, run);
+	    (slice->slice_type == V4L2_H264_SLICE_TYPE_B)) {
+		ret = cedrus_write_ref_list0(ctx, run);
+		if (ret)
+			return ret;
+	}
 
-	if (slice->slice_type == V4L2_H264_SLICE_TYPE_B)
-		cedrus_write_ref_list1(ctx, run);
+	if (slice->slice_type == V4L2_H264_SLICE_TYPE_B) {
+		ret = cedrus_write_ref_list1(ctx, run);
+		if (ret)
+			return ret;
+	}
 
 	// picture parameters
 	reg = 0;
@@ -478,6 +490,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 		     VE_H264_CTRL_SLICE_DECODE_INT |
 		     VE_H264_CTRL_DECODE_ERR_INT |
 		     VE_H264_CTRL_VLD_DATA_REQ_INT);
+
+	return 0;
 }
 
 static enum cedrus_irq_status
@@ -531,9 +545,7 @@ static int cedrus_h264_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	if (ret)
 		return ret;
 
-	cedrus_set_params(ctx, run);
-
-	return 0;
+	return cedrus_set_params(ctx, run);
 }
 
 static int cedrus_h264_start(struct cedrus_ctx *ctx)
-- 
2.50.1


