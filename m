Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C6D3E0276
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 15:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238377AbhHDNx7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 09:53:59 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36781 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237800AbhHDNx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 09:53:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BHL5mKNk14JsbBHL6moiDs; Wed, 04 Aug 2021 15:53:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628085224; bh=XZx/51YuZg9AyML1XLnSfIRcYqEjDnYo65rTyvBPMvs=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aEdDyRhQ4Hlnmscjvl57xufGhRdu6/IGZ0dTnP4IGlpsApcCXCNMwZe+S2y3ugDsC
         r1nFcwDB+aD+h0PQiMGezMjwNZ/KW3J/uP+vNCFObmiPl6+N9CQv1NscDvELuBeReT
         9ka8r2Uip3nJZilBFnluZZuNHrayHAVbqHPob/r/LdNPOPuKTT9hZDGAnE8ZrDd8o+
         LtCCDv1hZFW8eTMWzHOHftIQAsdJzTmeqxTxiyt06eD/WJxJGh6bMiKRae3dVfV38Z
         4cH4/kp6i4Z9KJB8yiEZWyCmsT1XWo41WglTpaErBt3qy8/sa44w53cbM/rGgBKcTo
         88nnJhmft02+Q==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] staging/media/meson: vdec.h: fix kerneldoc warnings
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <2c2914d0-288c-3e0e-a343-fc1b856ce5e3@xs4all.nl>
Date:   Wed, 4 Aug 2021 15:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKrmKmRRDlZfcqi73qFdNIurvKtABzb2oqyPfIC2IZDKhbqhBmpUB0I7OsAge4ewZvAkoByaDbkSMil65IEKMWTwl8fmtJeuEbNjgIS9FGELzxO5Mkzh
 A1k/AiblkghNwgXDgybjd9/v3CkcFRx/uvHYNTTKt490qMdhAGKZ+/1Qz6mJFiFzNtginXfYCiaKESktDQ/CfL8Lj4udQnuY5+3znfyaCbvktYwLu4Z2XRFO
 3wV4NQxdmD6TqVrp9QyZYXTAprd2EXxPbyO+5r6V+ag4Z3uddytfLryJ9HKSKtf/5Zy6rhO8LMd2bBeR5QCdz7BP0haHDvIudkGt3vfdUQA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a bunch of kernel-doc warnings:

drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'core' not described in 'esparser_queue_eos'
drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'data' not described in 'esparser_queue_eos'
drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'len' not described in 'esparser_queue_eos'
drivers/staging/media/meson/vdec/esparser.h:28: warning: Function parameter or member 'work' not described in 'esparser_queue_all_src'
drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'vdec_hevcf_clk' not described in 'amvdec_core'
drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'vdev_dec' not described in 'amvdec_core'
drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'lock' not described in 'amvdec_core'
drivers/staging/media/meson/vdec/vdec.h:141: warning: Function parameter or member 'resume' not described in 'amvdec_codec_ops'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'lock' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'sequence_out' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'num_dst_bufs' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'changed_format' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'last_offset' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'wrap_count' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'fw_idx_to_vb2_idx' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec_helpers.h:59: warning: Function parameter or member 'tc' not described in 'amvdec_add_ts'
drivers/staging/media/meson/vdec/vdec_helpers.h:59: warning: Function parameter or member 'flags' not described in 'amvdec_add_ts'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/staging/media/meson/vdec/esparser.h b/drivers/staging/media/meson/vdec/esparser.h
index ff51fe7fda66..9351e62c70e6 100644
--- a/drivers/staging/media/meson/vdec/esparser.h
+++ b/drivers/staging/media/meson/vdec/esparser.h
@@ -17,13 +17,17 @@ int esparser_power_up(struct amvdec_session *sess);
 /**
  * esparser_queue_eos() - write End Of Stream sequence to the ESPARSER
  *
- * @core vdec core struct
+ * @core: vdec core struct
+ * @data: EOS sequence
+ * @len: length of EOS sequence
  */
 int esparser_queue_eos(struct amvdec_core *core, const u8 *data, u32 len);

 /**
  * esparser_queue_all_src() - work handler that writes as many src buffers
  * as possible to the ESPARSER
+ *
+ * @work: work struct
  */
 void esparser_queue_all_src(struct work_struct *work);

diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index f95445ac0658..0906b8fb5cc6 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -60,10 +60,12 @@ struct amvdec_session;
  * @dos_clk: DOS clock
  * @vdec_1_clk: VDEC_1 clock
  * @vdec_hevc_clk: VDEC_HEVC clock
+ * @vdec_hevcf_clk: VDEC_HEVCF clock
  * @esparser_reset: RESET for the PARSER
- * @vdec_dec: video device for the decoder
+ * @vdev_dec: video device for the decoder
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
+ * @lock: video device lock
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -88,7 +90,7 @@ struct amvdec_core {
 	struct v4l2_device v4l2_dev;

 	struct amvdec_session *cur_sess;
-	struct mutex lock; /* video device lock */
+	struct mutex lock;
 };

 /**
@@ -120,6 +122,7 @@ struct amvdec_ops {
  * @recycle: optional call to tell the codec to recycle a dst buffer. Must go
  *	     in pair with @can_recycle
  * @drain: optional call if the codec has a custom way of draining
+ * @resume: optional call to resume after a resolution change
  * @eos_sequence: optional call to get an end sequence to send to esparser
  *		  for flush. Mutually exclusive with @drain.
  * @isr: mandatory call when the ISR triggers
@@ -185,6 +188,7 @@ enum amvdec_status {
  * @m2m_ctx: v4l2 m2m context
  * @ctrl_handler: V4L2 control handler
  * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
+ * @lock: cap & out queues lock
  * @fmt_out: vdec pixel format for the OUTPUT queue
  * @pixfmt_cap: V4L2 pixel format for the CAPTURE queue
  * @src_buffer_size: size in bytes of the OUTPUT buffers' only plane
@@ -200,9 +204,12 @@ enum amvdec_status {
  * @streamon_cap: stream on flag for capture queue
  * @streamon_out: stream on flag for output queue
  * @sequence_cap: capture sequence counter
+ * @sequence_out: output sequence counter
  * @should_stop: flag set if userspace signaled EOS via command
  *		 or empty buffer
  * @keyframe_found: flag set once a keyframe has been parsed
+ * @num_dst_bufs: number of destination buffers
+ * @changed_format: the format changed
  * @canvas_alloc: array of all the canvas IDs allocated
  * @canvas_num: number of canvas IDs allocated
  * @vififo_vaddr: virtual address for the VIFIFO
@@ -214,6 +221,9 @@ enum amvdec_status {
  * @timestamps: chronological list of src timestamps
  * @ts_spinlock: spinlock for the timestamps list
  * @last_irq_jiffies: tracks last time the vdec triggered an IRQ
+ * @last_offset: tracks last offset of vififo
+ * @wrap_count: number of times the vififo wrapped around
+ * @fw_idx_to_vb2_idx: firmware buffer index to vb2 buffer index
  * @status: current decoding status
  * @priv: codec private data
  */
@@ -225,7 +235,7 @@ struct amvdec_session {
 	struct v4l2_m2m_ctx *m2m_ctx;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *ctrl_min_buf_capture;
-	struct mutex lock; /* cap & out queues lock */
+	struct mutex lock;

 	const struct amvdec_format *fmt_out;
 	u32 pixfmt_cap;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index cfaed52ab526..88137d15aa3a 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -52,8 +52,9 @@ void amvdec_dst_buf_done_offset(struct amvdec_session *sess,
  *
  * @sess: current session
  * @ts: timestamp to add
+ * @tc: timecode to add
  * @offset: offset in the VIFIFO where the associated packet was written
- * @flags the vb2_v4l2_buffer flags
+ * @flags: the vb2_v4l2_buffer flags
  */
 void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
 		   struct v4l2_timecode tc, u32 offset, u32 flags);

