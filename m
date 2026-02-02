Return-Path: <linux-media+bounces-52050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDWBE/jjgGleCAMAu9opvQ
	(envelope-from <linux-media+bounces-52050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:50:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ACBCFC56
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22C993004CBB
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 17:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB0E387595;
	Mon,  2 Feb 2026 17:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wy3URoxH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D75388873
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054639; cv=none; b=li5prwot1OWuvgQJqdyuO0K5qOTqv9EcRjthCQgtEIehkT1E/Wh90H0scZQzPPcEpo0l4ftRcAuZgtHGjBVJkjXgCJdbFzMFuI25jYUbz6H7nST5niQPDJZ8Zc5D+bpUcDT16RiOzIz9SAruXIw1KbUOs6JOsfMH72QFr3O6gr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054639; c=relaxed/simple;
	bh=67FGknsMfng/MTFvpicG64FoyMmv+280N/yN3heul6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4PtmvYtNmsBbBDMaIgyZbSzm3VdX/PJeaT0Usqrma2uWxnFbo+6CuSbN2Lci3etRz3UMjopYAZMITaw2WvKTJ+ckfCxE1oIC3k5I83954Hx1XS205kNl7dgQ+3vRCGNaDIrWQEI5SMLjcRqxCFyPqaZrcl85Pnvq5tBeJtxtA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wy3URoxH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359228b7c6so3338919f8f.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 09:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054636; x=1770659436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NgEps2wOELAEwlp8ckdt6gcYIwzRG7NzifNjPq19H0=;
        b=Wy3URoxHJ4+E9b8uumjhWaA4DoJMkmRIKLz0r+28m+mPTIRM/kaSfSoV36LF/ftpbf
         sid1KjDtAohelafya5gjK8DIvSiWedOOf+/6HV/92vximUI/oX2CVnMQeTY4suOCB+qr
         2Y7SWM9b55bgIUnqisEiHq2uDwuyQPiyIstq9cv39AtC5hLN9yjjzhA0bbbZFCg8lTTF
         acmFRuGzEGW2FejmwnGiswkRg+tEA7aLaIgXOjk/V0ySrqX/4SDDuJ0iJhH5Oh7zBOTN
         sfumBTq51w717aTdnpYVQueStI1x+lxo9mcV4ZNML6eT0oZz6f6WC2nky/rQl/Wy7unE
         ricg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054636; x=1770659436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NgEps2wOELAEwlp8ckdt6gcYIwzRG7NzifNjPq19H0=;
        b=ZCvNZjq4kQnNLYXz63lAyxfxSSgTVVhuPVHXjcafAsw2i3NxxwFqyTamGu07ha4q99
         3hbIwmss468CHo+LF99ML1h21ylvEg2SFYEfEqWqDGRmNXXGJgtTsS7v+bvDPnHeozE1
         Mc/LFUamk7XyhxzKQxRox74s/8srwGnwQpiJQlN8HMujr9BD8dC3KwDHz0QJWYLyMUxU
         AU7PzrdAhJQ8AA+18ywCKvG2Pimrrc+/KdIqDyXnaeM+foCv+giM4pjoGq2kQFTh1xwg
         hKOh2tX1ESQ58XylYAXVHGBoMII3WQwyWlv9nsGvX49m+HFbDOKkKYvDyfU2ovmfmC6g
         2xyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJDfX/z+Sxkv91hxSI28HVTMyDVtzukI2olenMgs9Citg34frQsnHpsCBWLBFPAFirX1KVyPqNnVYxfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtmCgfpD0cwQws4m8hFxDqJtUK8gx8yYjln8jPYFNHVpGS+VU
	CYlFKU1y/vJkYKwNkJEZ8IVZ3YUcYX/2ie2Zi9pfyharb369uNad7WXw
X-Gm-Gg: AZuq6aKOXmEMz1D4eDqQtvfAOybEA7YzmJDqMS693PwriO2bxtIJMvtlOBPFm6NXKcW
	e14iyfTWIelw1A4CcRVH5NuKLMTKJt9fuP/SHKNOkpfsjO2T8J9m9OYGzaaoIn3BD56rF06g35Q
	GifhGpMStja5jfTyxy9PQwaS4qGuVLBQNGMeiPHbbbz6XITt1n3JVQXuOoXo1MBs2aOPtaNLQY9
	EHsytWbJNRlcToADbFyhsc/rGiQqnXKCN+ZHpCNUP94x8rdhC9EBarsd3WMAlEer/IRxcvoXMJH
	b5FhFleRz01r8PjnnVqbBCkqkf7Gu9FBKIK6cxrF6oevFeaBjterBxqnhWtvWEtr2nhEuLcn31l
	5n+npeyTrYro81CipKliw1WJRetsFof9sZ8rNGfvFTjHtYsQBtP4OSNLGfbMOrX2XZBHF1qrpWQ
	UndXZlrO44+b4o9+T6eNUFDD6vAOaP11jy+PSW1FxzU2oJBqES
X-Received: by 2002:a05:6000:400e:b0:435:e3fe:7409 with SMTP id ffacd0b85a97d-435f3ab5239mr19103841f8f.44.1770054636222;
        Mon, 02 Feb 2026 09:50:36 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:35 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 1/4] media: ipu3: fix alignment
Date: Mon,  2 Feb 2026 19:50:30 +0200
Message-ID: <20260202175033.8640-2-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-52050-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52ACBCFC56
X-Rspamd-Action: no action

Fix alignment with parentheses.

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c  | 22 +++++++++++-----------
 drivers/staging/media/ipu3/ipu3-v4l2.c | 11 +++++------
 drivers/staging/media/ipu3/ipu3.c      |  4 ++--
 3 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 777cac1c2..145501e90 100644
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
@@ -1241,6 +1242,7 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
 	css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].height =
 				ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].height,
 				      IMGU_DVS_BLOCK_H) + 2 * IMGU_GDC_BUF_Y;
+
 	h = css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].height;
 	w = ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width,
 		  2 * IPU3_UAPI_ISP_VEC_ELEMS) + 2 * IMGU_GDC_BUF_X;
@@ -1248,10 +1250,9 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
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
@@ -1269,10 +1270,9 @@ static int imgu_css_binary_setup(struct imgu_css *css, unsigned int pipe)
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
@@ -2036,7 +2036,7 @@ struct imgu_css_buffer *imgu_css_buf_dequeue(struct imgu_css *css)
 				     struct imgu_css_buffer, list);
 		if (queue != b->queue ||
 		    daddr != css_pipe->abi_buffers
-			[b->queue][b->queue_pos].daddr) {
+		    [b->queue][b->queue_pos].daddr) {
 			spin_unlock(&css_pipe->qlock);
 			dev_err(css->dev, "dequeued bad buffer 0x%x\n", daddr);
 			return ERR_PTR(-EIO);
@@ -2169,7 +2169,7 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
 		map = imgu_css_pool_last(&css_pipe->pool.acc, 1);
 		/* user acc */
 		r = imgu_css_cfg_acc(css, pipe, use, acc, map->vaddr,
-			set_params ? &set_params->acc_param : NULL);
+				     set_params ? &set_params->acc_param : NULL);
 		if (r < 0)
 			goto fail;
 	}
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
index bdf5a4577..c33186208 100644
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
@@ -774,7 +774,7 @@ static int __maybe_unused imgu_suspend(struct device *dev)
 	synchronize_irq(pci_dev->irq);
 	/* Wait until all buffers in CSS are done. */
 	if (!wait_event_timeout(imgu->buf_drain_wq,
-	    imgu_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
+				imgu_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
 		dev_err(dev, "wait buffer drain timeout.\n");
 
 	imgu_css_stop_streaming(&imgu->css);
-- 
2.51.0


