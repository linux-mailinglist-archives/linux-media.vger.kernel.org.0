Return-Path: <linux-media+bounces-66634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DkvgEqVxSmrwDAEAu9opvQ
	(envelope-from <linux-media+bounces-66634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 17:00:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B8570A675
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 17:00:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Juvuxx7L;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66634-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66634-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00CBE301F5CE
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 15:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AAB38AC7C;
	Sun,  5 Jul 2026 15:00:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04F389452
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 15:00:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783263615; cv=none; b=bWPIBg+nzDhuPzTHl7YeWys0msf9ObmscFnO+C0hnMw2nacPSxtBJn7BLvvY0jLhAom7zq5fSn/9RzmeGrNa7Hz34grUccyTUeqeDQE+TjZcTIcAPuhjdJaq8P2eBR7bk7+urFBTNeCTbQujmM4kMvw90iBTEvWiOrWeOSGhoaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783263615; c=relaxed/simple;
	bh=AQQ8arOnwsTKVNmILafG0/78IabwyPhANTCMHvwwHzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lc7CoSM8SLXGBxiAS0W6ckvp61BpUhUNCKLeqcleYAbZke1/gcnESAtOnlQgTKilxrgtSiXN47nt38+BVmAWV8yz+xadLZ7CHFuszwz3LA3t4xUEjU0bGBxYyPHrobnXtQZmMQFHHotFZyLYwwqcdn5XWckR31OwvecpvGZsK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Juvuxx7L; arc=none smtp.client-ip=209.85.210.177
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847a483e344so1672018b3a.0
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783263614; x=1783868414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+Y+5Nnc05M3zVhqlGvJI6S9n9OUSM9GKpP4UQiBjwc=;
        b=Juvuxx7LVUS992ktnSU/I+rJoOCYgsC8+ahDLf11Lfi4KHIVMj769AqN6n61GRkV6j
         vUVwKbRl+fTv/K/JTbouVmFuTlImAaRYuqnM6vM1lLexxsX3k9Qc5XY1T3wgg/sgpVHf
         ip6bjgnFY9+uJtQFhXlYzndIaqNE9jOFEzyP3ZLV8zMMAXOYSIZuuTFyrFOq3Nyf1fZ+
         YC+zCsTzjQZOJ9xJ45v9RFAC4+wspldgT4zMd9hHTqhbeJSpluEtaHBI1xEQhEXprygo
         w6PHprA/3iis2V6nxleefQSZU3l9MHM4HUo/nlTc1pvdkQPy6XSIs8o8pDVoKFzu5Yao
         osmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783263614; x=1783868414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+Y+5Nnc05M3zVhqlGvJI6S9n9OUSM9GKpP4UQiBjwc=;
        b=Jt57/BDorslFvu3W3Eai4u/5G68E5XHAaOpEHt4HPlyStT5FYNoOtgE252Gc4h+U7e
         3qw7QtHcBzm8cOZn1SR12T5vffQsd2/mkoLVjYeSR4yVVdoHNgyWwhTuib1zWe6zipO3
         QodlV8c9V7hAqSoocCYa8PZomTjANMlpAtHR1Lf4ASfZrjU0hAwVRoS0cmu4iEORoJb1
         TZlR0OmRzNw1yUMCWN8uy+/3Fi6f0SIGuurkq4MODD45WS9FFo5Gr0eCk3EQl5nLApwE
         3XIjNj0Xfk5ZSrkpVNosUlgSQTPFVsdvqBC1JEamCZ9ca4TIT3yY75/cIb3BT6vdAmEr
         h+Fg==
X-Forwarded-Encrypted: i=1; AHgh+RrzidtCY2jSeLTVcOF+1azN6a6bEPI2JO+Rvv8lmziNws2KxQeTpRA1s/K2w4ac6xdexGYDpE9lMAUEbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqmd2r0DZKckfzzujCZReZj47p+9Qgqc5OiXLXxLkjzAyF0KpF
	MoeYSk9yBrqX3T8WWFELowh9VHxPk8FdP/qx6O4d93/fUGWD8lTYabl5
X-Gm-Gg: AfdE7cnb1XhrnSqFwGZ13fJC95Vt8BBfE6fxbdy+yIg624A+8p9Z9qLW9E3GqgsuHXW
	hC0yZdRNz+D2yy01++5NXm4ZQ4Li209/HZQ/Ryludes5dQme2PZ2IWjAIQUft1Bs5N7E3+O6whC
	8ILnSdyZ6ulLJ4LYdezuNQNUiAC2D+H00H6Izm8JVw0Qk3NaYUyMPFPTtuA1CatXJzznGg+j+Ev
	smyplGcptU7KGv4pm9Kb61lEeNK7NSm4LrOUHHM9yETrZmkJS109V0nYcRNZeFisUN6DCWpF/oh
	W0Qf+wEcauVTQnvrsD9aj7oZy+Bjvq7Q/1So5E9drOm5BEnjQU/iffFanR29qcB4qwnPl0i26TI
	gRwLVGkl2xN27dT9YMAbO0KabsYFHvv/fMgVn5azRnNCFbZbpYC7kGjLrvQo0ISTAy0O2oTY=
X-Received: by 2002:a05:6a00:440c:b0:847:888f:9b0f with SMTP id d2e1a72fcca58-847f8675f1emr5248033b3a.15.1783263613747;
        Sun, 05 Jul 2026 08:00:13 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44cfbsm2381574b3a.37.2026.07.05.08.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:00:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: chips-media: wave5: Check decoder qbuf runtime resume
Date: Sun,  5 Jul 2026 22:57:54 +0800
Message-ID: <20260705145754.290132-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66634-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nas.chung@chipsnmedia.com,m:jackson.lee@chipsnmedia.com,m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lgs201920130244@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0B8570A675

wave5_vpu_dec_buf_queue_dst() resumes the VPU before it may clear a
decoder display flag. This is needed because clearing the display flag
accesses VPU registers.

However, the return value from pm_runtime_resume_and_get() is ignored.
If the resume fails, pm_runtime_resume_and_get() has already dropped the
runtime PM usage count it acquired before returning the error. The
unconditional pm_runtime_put_autosuspend() at the end of the function
then drops the usage count again.

The failed resume path can also continue into
wave5_vpu_dec_clr_disp_flag() while the device is still suspended,
reopening the powered-off register access that the runtime PM get was
meant to prevent.

Check the return value from pm_runtime_resume_and_get(). If the resume
fails, complete the queued buffer with an error and return without
touching the hardware or dropping an unmatched runtime PM reference.

Fixes: cbb9c0d50e47 ("media: chips-media: wave5: Fix SError of kernel panic when closed")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index bb2ba9204a83..03d108b808ba 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1290,8 +1290,14 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+		return;
+	}
 
-	pm_runtime_resume_and_get(inst->dev->dev);
 	vbuf->sequence = inst->queued_dst_buf_num++;
 
 	if (inst->state == VPU_INST_STATE_PIC_RUN) {
-- 
2.43.0


