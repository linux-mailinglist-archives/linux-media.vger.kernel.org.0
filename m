Return-Path: <linux-media+bounces-51905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEe9NUB8fmnsZgIAu9opvQ
	(envelope-from <linux-media+bounces-51905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 23:03:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3759CC419D
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 23:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B1B301AD1D
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 22:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E49C38945B;
	Sat, 31 Jan 2026 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="2Isq1ed6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F79329C78
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 22:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769897010; cv=none; b=cQez25VNNcAYwSzNL4aBGxSy8G7UXD4s2QallG0vQTpkHSWGTeOCPHz6Mk7hr3IusyEn/Ewi9uCqvVc6Lf/wjqB2ulBWdnjCoD/+YakCDKn8//qg9m9175nNyIF0o5HR/WGDh8BV+X0ueu1pqfzXiNx1mMGT+9uEvGeLCMdzv90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769897010; c=relaxed/simple;
	bh=E42NkKsr43w5UW0DNDJA+dJWmKoqjJY/ccAHt9R9JeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j//W6fC31gaa+a4kVTzqWe2z88UwrISt3kTnW4sdUR9I6VoCihURcJdF79mhEfbHXI9Hvrwr9eIw0ecfdwJSisZ0ZSnmO53HTFdeuayL4dg/SBIkXLUAycq26OaehQkjA+kTxZ8gB/G+1TRK73zyR6apN18y+EGxDzX9oIa3om4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=2Isq1ed6; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d1866473b0so2071945a34.1
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 14:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769897007; x=1770501807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOiOO+E/AKv1Oz2TckUZfapY9aw2SozPHvqV8UDpspM=;
        b=2Isq1ed6EENkpgrQQxHFYXBoP9nWyQMAQ24MnjX4PQMcZtni5S7HUxu2KeCgk3aqla
         ddaMwzjiU84WJ1YIUZjrij3QJ8v0/caYaczZoJ5niZlMsaA0ceL0DxsIh5Pti2fje/Rn
         2G91Fv4MJ3ng3GCKti3odhmTGU073Ap0HQv8iW9fr5uEtzbWod1I/KR0erqzObtsfTno
         60TUfmvIynKlauf+M++rz+jCH3IMgbMOo4pI12DkYikVzs0ChXL9z9jBkI+JbzpKEUh9
         2OdzjvXdl8p0whnGOMfQ6zyJxcrm4rbIqShWvIyClLhsiu4iiGtY7iOoHZgH7wJ78e6V
         AOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769897007; x=1770501807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOiOO+E/AKv1Oz2TckUZfapY9aw2SozPHvqV8UDpspM=;
        b=Vmzrjqxdljzv97PpTakGXgOUFVs8lrTHK+/s02xfIjXWCcvFh19A7HO5LNcwgij2tH
         PlJH/Lrs0fGZ7zrE5nYp95s3wv/XnlIi5EV4cdANzrI5ILs4p5B1L8GlUC39cam7vT0e
         LmfpTW4m3bFhTM3jlnkSrnjoOi+zcsb6Lc9y1T2+tGONkeWFTbpbdjnWKSai3Iq31XvW
         Rqm1uF5DfnKr1VRzXe6mX2JYbAEnK5hoBeW9yYWbHQRMC6TMTjJoIUDYZijbOdbPicV5
         pmoMMY7c8YTTB0CmAHH4Um5z4roldXmfL2YAQx/S2t9v5pvE/AxBZ/++8le/j8KqwHEu
         ei6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHz1Tyl/89F8VOXEkI5/wUryP/3i50iMWXwBX8vN+vqjr9HEg5RDsx+99QyHJc8VYLVUrFIFvTqFDXKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLCy6IyOUro8JObAOPmjDomEY1BBa1WmstEwtWdvNzgKrUju7o
	b4w2jeG+x0I/W4e6mHZu9VbtP9Zd9XRsBsenBoVKzG8kzw3ESORDxKsd0ZzisfQRJ4M=
X-Gm-Gg: AZuq6aKdNuc8OMW88iCBewvA11k9Khw/wtp1DMcJ3L+HNXDOH88aEFC10uCLJrsV87O
	WtkBYQF4t4lBdw5ACmhOlBcBK1gMf2OXM3b4yxK4JdMmgzh8K0yRfXtbKTF8VxBAeqZlMYrvM9N
	8qdddUYSJ5qS2ILz+Fd0BINIMwgBxnArvgbLTVraiLi0R3XSTzzEj8pZAUPsPmZvfv3KKE2xCUV
	HrpAvaVJwny2tev7DVVO3rrAhVsGRUOe4kDIHz2Fe6t+S2tIyLa35WmRHXquOnmt146ZAtmAJ/X
	sCWhrjE74EJvQfRwqiFBjyw48+CeVBBcWvvIy1toYXCqNU1F2T8kCjr5ZRsLGlell/hK8JD2Jbf
	EDXcp7ODjCUuh817WpAa/Lc6kIMMWdYHLmSxS0dkdx19Aukt8r1ugmlyc/feW1Kdx3GJ72Iu9Tx
	TxZrH6ZpldVgoHLsmt7nCsV5fARHJt9wATDHWts9YHeTnsaoBROvbILbUGmziKXXKMBVLKA4OrF
	U2Nw4tSd4EFcpgMCkVTgxobgW4NiP8=
X-Received: by 2002:a05:6830:6adb:b0:7ca:c803:f539 with SMTP id 46e09a7af769-7d1a523db64mr4501190a34.5.1769897006620;
        Sat, 31 Jan 2026 14:03:26 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c67065esm7933091a34.6.2026.01.31.14.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 14:03:26 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] media: chips-media: wave5: add missing spinlock protection for send_eos_event()
Date: Sat, 31 Jan 2026 22:03:23 +0000
Message-Id: <20260131220323.3296745-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51905-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3759CC419D
X-Rspamd-Action: no action

wave5_vpu_dec_buf_queue_dst() and streamoff_output() call send_eos_event()
without holding inst->state_spinlock. However, send_eos_event() has
lockdep_assert_held(&inst->state_spinlock) indicating that callers must
hold this lock.

Other callers of send_eos_event() properly acquire the spinlock:
- wave5_vpu_dec_finish_decode() acquires lock at line 431
- wave5_vpu_dec_encoder_cmd() acquires lock at line 821
- wave5_vpu_dec_device_run() acquires lock at line 1592

Add spin_lock_irqsave()/spin_unlock_irqrestore() around send_eos_event()
calls in the VB2 buffer queue and streamoff callbacks to fix the missing
lock protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 .../media/platform/chips-media/wave5/wave5-vpu-dec.c  | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index e3038c18ca36..986feff34f22 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1264,13 +1264,17 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
 
 	if (vb2_is_streaming(vb->vb2_queue) && v4l2_m2m_dst_buf_is_last(m2m_ctx)) {
 		unsigned int i;
+		unsigned long flags;
 
 		for (i = 0; i < vb->num_planes; i++)
 			vb2_set_plane_payload(vb, i, 0);
 
 		vbuf->field = V4L2_FIELD_NONE;
 
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		send_eos_event(inst);
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
+
 		v4l2_m2m_last_buffer_done(m2m_ctx, vbuf);
 	} else {
 		v4l2_m2m_buf_queue(m2m_ctx, vbuf);
@@ -1413,8 +1417,13 @@ static int streamoff_output(struct vb2_queue *q)
 	inst->codec_info->dec_info.stream_rd_ptr = new_rd_ptr;
 	inst->codec_info->dec_info.stream_wr_ptr = new_rd_ptr;
 
-	if (v4l2_m2m_has_stopped(m2m_ctx))
+	if (v4l2_m2m_has_stopped(m2m_ctx)) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		send_eos_event(inst);
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
+	}
 
 	/* streamoff on output cancels any draining operation */
 	inst->eos = false;
-- 
2.34.1


