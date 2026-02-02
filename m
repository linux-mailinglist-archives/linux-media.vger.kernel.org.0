Return-Path: <linux-media+bounces-51984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMN6OkN3gGmo8gIAu9opvQ
	(envelope-from <linux-media+bounces-51984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:06:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6E0CA7D6
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F00AF305CAA6
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A487357736;
	Mon,  2 Feb 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXZtJiR+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D62DAFAA
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026620; cv=none; b=OApcPSHU1X6d2meTqg06EimfIHQtrqbao+CwfuEk1jMOU+PXTgs3bm/WsrckB0ai6J7nbcOk94d0IwMEARZq7A5Cr3yiF/18j+rvDRdFR7Un+ot0nYPwkKqS1IUfUhuBn1hZSROM5r9Run542zd0MOHhwV6tXhE5qQTMaPXItz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026620; c=relaxed/simple;
	bh=RVym36iHa0D9PB8wcICXIbzfqYxAUHus/xA6pircK8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=suUBb2o8roZKSrG7uY8gbsJtQLR1A7tTajIx1dEnZBldUblP6B1rt7/XsjjvHKG1891kKlMefavI8vPMIA1b22Qeu5oZ5tJTDA7PXLw5nSiOdd9AwLvVENUaeqHEfMTmNI3yGC54LB8EctiW+8Ua7laP0Zj6r2LCHwAdk7midkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXZtJiR+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so33743055e9.3
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770026617; x=1770631417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xlH5d3Pp8tQ/A6zHD9El45ieDfHm2GOFvP06basgclY=;
        b=TXZtJiR+Ie+z2vXhEDlkwy4UUq0lkHIrKsG+YG08glYP8LQSaNffEPTi7QAGZYhzyz
         xzAHXi9CxRWp8ipH7IFWXzWoIt+w7AetPVwuR1A6UWCi941t5jS0y2tCDSOscMKPDqJX
         RCztY3ovaT7Bj5uFde99kVb7S71md7gNFuLeHlRKMXsrr/MI5RgiHi82jpQQwD7vgyn7
         yIBYk8ioUcTCihR5ojWeOiEs6CkKtena7HRL1HEb35f7T5V7MemV39CNY+cJRwC9xera
         OY9diBK3JTstZBxLh8mr1o2XE/cwfSNJc5Go3ZNtRlGY9/dCUQcXK5YDHZNlr56JVpv+
         n7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026617; x=1770631417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlH5d3Pp8tQ/A6zHD9El45ieDfHm2GOFvP06basgclY=;
        b=eLc9U2C14b9eKwrivOyc2dnkYJGCV914ck5HyinhmDn0pl6ByylTUvUHgHb4XKCKMN
         Kn9atJDpvKt9eM33I09yo54WnO5LDiy2Kp75f0sf/rmU0LZBZ8WEwOW4Wu2gYUROUDfJ
         H2pHzmT+clbO98f69iQgaNtPs1z6PRkUHY7cs5soVFbcf2OO2+pq/+j2usCwggp+gVWD
         wprtGZmIO79ge9WxCB39XNZ4MuUuL1bLYhPcSgR8w7GPTfjeQnphFhP14TGdp8UEX5R+
         GC7yFconQbICxC7bBGKRRziEmfUJh8CGwRiTp7UrQYDvwGnig9dOqjSnuZGkdPnkpJ+5
         ZjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA4ti865jhI34OoQZPOYe76I+BUV7bOpgZd0wKQgxr/Vam1hjNQRkKxTm/PfMVMFi+vRthIQJ+9vFzBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6HdCSKQXApoLsaaq8MM19AmXZLLnYSUfUSGOT1xNVVbJOrUH
	oYTex9TYYemk6sqM7knWUxZylL0e805+hXTm3G6ohhdxMVX3pL6TLJtc
X-Gm-Gg: AZuq6aLw9/DtLv+nakflZ2tFcPziM2+xgTJsmVcGO3fI6WXwJr6MHZfoSCz5OCGqVWR
	fqWyf5vQ4MkIn6EZGHRDDuPVs4fWLTGDdA/q3eTswlXpQSf2XwRq3Lbh/qB78vRJN92J+3iu1Ew
	pQfMQTpOkWBeDQvRi27QRqWkYC0uPI4Ul8I+jUugdixyfwgv5jWKmw57db0XG/jYb7LpIrIvfxj
	sdvwLuqQSXEeLYi4UIu/GMQkJ3iXarRVzVH/01vdPDpm6sBeY74UqPuYuAna4Gf+Pia4tCleckx
	qqRvjBtVAWAEPNgyUKS7A0asP6GBLCcWjVGyUaHedXv+PjfRg7tH8Y09OR0NMje0apb1LjnBaS9
	AbKBDFGGwWyOwSXwNte3klPtzRtx1z/3Yf0kpf8Mq/3iRSGNAiQCDFnrXOz8TNr8SqfMvF0akGe
	JeK04eV6hDfDss0/y8sk2i/BtIObpkzJUIxZjyyA==
X-Received: by 2002:a05:600c:3586:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-482db45237cmr176015855e9.4.1770026616531;
        Mon, 02 Feb 2026 02:03:36 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm40974340f8f.6.2026.02.02.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:03:36 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bogdanelsandu2011@gmail.com
Subject: [PATCH] Cleanup ipu3 driver
Date: Mon,  2 Feb 2026 12:03:11 +0200
Message-ID: <20260202100310.4425-2-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-51984-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E6E0CA7D6
X-Rspamd-Action: no action

Clean up warnings generated by ./scripts/checkpatch.pl regarding the ipu3 driver at /drivers/staging/media/ipu3

More specifically, the following files have been affected: ipu3-css.c, ipu3-mmu.c, ipu3-mmu.h, ipu3-v4l2.c, ipu3.c, ipu3.h

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c  | 39 ++++++++++++--------------
 drivers/staging/media/ipu3/ipu3-mmu.c  |  2 +-
 drivers/staging/media/ipu3/ipu3-mmu.h  |  4 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c | 11 ++++----
 drivers/staging/media/ipu3/ipu3.c      |  7 ++---
 5 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 777cac1c2..832581547 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -118,7 +118,8 @@ static const struct {
 
 /* Initialize queue based on given format, adjust format as needed */
 static int imgu_css_queue_init(struct imgu_css_queue *queue,
-			       struct v4l2_pix_format_mplane *fmt, u32 flags)
+			       struct v4l2_pix_format_mplane *fmt,
+			       u32 flags)
 {
 	struct v4l2_pix_format_mplane *const f = &queue->fmt.mpix;
 	unsigned int i;
@@ -1033,8 +1034,8 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 			       3 * cfg_dvs->num_horizontal_blocks / 2 *
 			       cfg_dvs->num_vertical_blocks) ||
 	    imgu_css_pool_init(imgu, &css_pipe->pool.obgrid,
-			       imgu_css_fw_obgrid_size(
-			       &css->fwp->binary_header[css_pipe->bindex])))
+			       imgu_css_fw_obgrid_size
+			       (&css->fwp->binary_header[css_pipe->bindex])))
 		goto out_of_memory;
 
 	for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++)
@@ -1225,8 +1226,7 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 
 	for (j = IMGU_ABI_PARAM_CLASS_CONFIG; j < IMGU_ABI_PARAM_CLASS_NUM; j++)
 		for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++) {
-			if (imgu_css_dma_buffer_resize(
-			    imgu,
+			if (imgu_css_dma_buffer_resize(imgu,
 			    &css_pipe->binary_params_cs[j - 1][i],
 			    bi->info.isp.sp.mem_initializers.params[j][i].size))
 				goto out_of_memory;
@@ -1241,6 +1241,7 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 	css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].height =
 				ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].height,
 				      IMGU_DVS_BLOCK_H) + 2 * IMGU_GDC_BUF_Y;
+
 	h = css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].height;
 	w = ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width,
 		  2 * IPU3_UAPI_ISP_VEC_ELEMS) + 2 * IMGU_GDC_BUF_X;
@@ -1248,10 +1249,9 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 		css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].bytesperpixel * w;
 	size = w * h * BYPC + (w / 2) * (h / 2) * BYPC * 2;
 	for (i = 0; i < IPU3_CSS_AUX_FRAMES; i++)
-		if (imgu_css_dma_buffer_resize(
-			imgu,
-			&css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].mem[i],
-			size))
+		if (imgu_css_dma_buffer_resize(imgu,
+					       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].mem[i],
+					       size))
 			goto out_of_memory;
 
 	/* TNR frames for temporal noise reduction, FRAME_FORMAT_YUV_LINE */
@@ -1269,10 +1269,9 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 	h = css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].height;
 	size = w * ALIGN(h * 3 / 2 + 3, 2);	/* +3 for vf_pp prefetch */
 	for (i = 0; i < IPU3_CSS_AUX_FRAMES; i++)
-		if (imgu_css_dma_buffer_resize(
-			imgu,
-			&css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].mem[i],
-			size))
+		if (imgu_css_dma_buffer_resize(imgu,
+					       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].mem[i],
+					       size))
 			goto out_of_memory;
 
 	return 0;
@@ -2036,7 +2035,7 @@ struct imgu_css_buffer *imgu_css_buf_dequeue(struct imgu_css *css)
 				     struct imgu_css_buffer, list);
 		if (queue != b->queue ||
 		    daddr != css_pipe->abi_buffers
-			[b->queue][b->queue_pos].daddr) {
+		    [b->queue][b->queue_pos].daddr) {
 			spin_unlock(&css_pipe->qlock);
 			dev_err(css->dev, "dequeued bad buffer 0x%x\n", daddr);
 			return ERR_PTR(-EIO);
@@ -2169,7 +2168,7 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
 		map = imgu_css_pool_last(&css_pipe->pool.acc, 1);
 		/* user acc */
 		r = imgu_css_cfg_acc(css, pipe, use, acc, map->vaddr,
-			set_params ? &set_params->acc_param : NULL);
+				     set_params ? &set_params->acc_param : NULL);
 		if (r < 0)
 			goto fail;
 	}
@@ -2298,13 +2297,11 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
 	if (obgrid)
 		imgu_css_pool_put(&css_pipe->pool.obgrid);
 	if (vmem0)
-		imgu_css_pool_put(
-			&css_pipe->pool.binary_params_p
-			[IMGU_ABI_MEM_ISP_VMEM0]);
+		imgu_css_pool_put(&css_pipe->pool.binary_params_p
+				  [IMGU_ABI_MEM_ISP_VMEM0]);
 	if (dmem0)
-		imgu_css_pool_put(
-			&css_pipe->pool.binary_params_p
-			[IMGU_ABI_MEM_ISP_DMEM0]);
+		imgu_css_pool_put(&css_pipe->pool.binary_params_p
+				  [IMGU_ABI_MEM_ISP_DMEM0]);
 
 fail_no_put:
 	return r;
diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index cb9bf5fb2..95ce34ad8 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -21,7 +21,7 @@
 #include "ipu3-mmu.h"
 
 #define IPU3_PT_BITS		10
-#define IPU3_PT_PTES		(1UL << IPU3_PT_BITS)
+#define IPU3_PT_PTES		(BIT(IPU3_PT_BITS))
 #define IPU3_PT_SIZE		(IPU3_PT_PTES << 2)
 #define IPU3_PT_ORDER		(IPU3_PT_SIZE >> PAGE_SHIFT)
 
diff --git a/drivers/staging/media/ipu3/ipu3-mmu.h b/drivers/staging/media/ipu3/ipu3-mmu.h
index a5f0bca7e..990482f10 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.h
+++ b/drivers/staging/media/ipu3/ipu3-mmu.h
@@ -5,8 +5,10 @@
 #ifndef __IPU3_MMU_H
 #define __IPU3_MMU_H
 
+#include <linux/bitops.h>
+
 #define IPU3_PAGE_SHIFT		12
-#define IPU3_PAGE_SIZE		(1UL << IPU3_PAGE_SHIFT)
+#define IPU3_PAGE_SIZE		(BIT(IPU3_PAGE_SHIFT))
 
 /**
  * struct imgu_mmu_info - Describes mmu geometry
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 2f6041d34..8ebfcddab 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -245,9 +245,9 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
-		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
-		 imgu_sd->pipe, sel->which, sel->target,
-		 sel->r.width, sel->r.height);
+		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
+		imgu_sd->pipe, sel->which, sel->target,
+		sel->r.width, sel->r.height);
 
 	if (sel->pad != IMGU_NODE_IN)
 		return -EINVAL;
@@ -288,7 +288,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -303,7 +303,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
@@ -750,7 +750,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index bdf5a4577..fe343d368 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -151,7 +151,7 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
 
 /* May be called from atomic context */
 static struct imgu_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
-						   int queue, unsigned int pipe)
+						  int queue, unsigned int pipe)
 {
 	unsigned int i;
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
@@ -556,8 +556,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 			buf->vid_buf.vbb.vb2_buf.timestamp = ns;
 			buf->vid_buf.vbb.field = V4L2_FIELD_NONE;
 			buf->vid_buf.vbb.sequence =
-				atomic_inc_return(
-				&imgu_pipe->nodes[node].sequence);
+				atomic_inc_return(&imgu_pipe->nodes[node].sequence);
 			dev_dbg(&imgu->pci_dev->dev, "vb2 buffer sequence %d",
 				buf->vid_buf.vbb.sequence);
 		}
@@ -774,7 +773,7 @@ static int __maybe_unused imgu_suspend(struct device *dev)
 	synchronize_irq(pci_dev->irq);
 	/* Wait until all buffers in CSS are done. */
 	if (!wait_event_timeout(imgu->buf_drain_wq,
-	    imgu_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
+				imgu_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
 		dev_err(dev, "wait buffer drain timeout.\n");
 
 	imgu_css_stop_streaming(&imgu->css);
-- 
2.51.0


