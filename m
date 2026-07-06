Return-Path: <linux-media+bounces-66756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ByymCHG9S2rjZQEAu9opvQ
	(envelope-from <linux-media+bounces-66756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:36:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 688C47120B7
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:36:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J+j0g2Zg;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66756-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66756-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B85F33B8A7D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304EB40A952;
	Mon,  6 Jul 2026 12:59:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F57040A93E
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 12:59:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342787; cv=none; b=q6HyiDmYdW25G91Z8TdpaTsEYr82m7JMKy7zZVsM6df00scMVyBBHXxN+6GlJQkvtX0bIL0v1KEe4B00KOn2xhsgXniVve+jGfRnrfUepaKoLjpF+b0+o3NAqgJ/UiUb0g8po3G3SfO88I1ax8lTTjXmLwT8u+oN/VxmIDmK4gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342787; c=relaxed/simple;
	bh=fuy8enVHSlsp95aHyxqCi5GOsskCTo+hZ3xpMs/ug5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g6ZoO2uVfoRAoWsAuafzlvyenI0sXKlJ9irxJggMMxxv5oKg83tFPtaoffgwP6JwhL/5CEo50z+r2Ya0pTm1El+5prHjEzYslLzc+v8H92/lp2W3dxJAy5OFWeF1lD7UFBUvwe1zB1QGyoda2u08SblYaoKNff0gdN9xcYJ0DAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+j0g2Zg; arc=none smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3977082a91.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783342786; x=1783947586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvdI3hZqOaovEnpI4FSI1KfpqICgBwvkwEqlnkytKEg=;
        b=J+j0g2ZgPFJJeAed23N5OtrPj6aOT7ZDu63D5aBSRTIPbNWxKnaCS4NZ9pPXoByZsh
         plhcagb+HQX0Zcjjgde3II9+4Zy2QT6Absi1z9ejeqjjDB8Xob+9QvYHkW2Z2/DHdhvj
         /LN0cKQE1lywPkrEa9q4MkbA/SEvtRmQFuhGUvLnVDNcu6qEJNiP9Vc7J6HXq02UA32N
         I62rP+pQ0hziTQw5WjrDfv4FW/+TuCcEBbdqYTPkTB25FeEoFzskaXQS3SjcV71VNA3L
         bwI4VDVOA0trKXAnZ6HN0zDzbt2uxiUydk4V0L3CHnmtf3Vm8Da0+xoZJRJ6jP6M/Cpy
         1BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342786; x=1783947586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvdI3hZqOaovEnpI4FSI1KfpqICgBwvkwEqlnkytKEg=;
        b=j1MRFB8zcBOx5WxRd5DaxgtmbxfiM0/nQ/opPZMGaWF/2/p8ksgtd6VO+zT98DdU05
         XmbG/0S+Q/MWN/W21QCQOi4TRW6dJp9Hd3eaayVvg4A2zwiuh1v5ebeDUoDQJNSJoWJI
         b1fvnCUpBfNPftLD6BUdFDnh0ev6jv2y1/JWi+Cro2Hhq7dv6byzQWg7hkGc42zCVGo2
         oiTDS5LQDk7J4yBs9P2964A4N2XyGjNbs0JzSBQoXTiqAQriu62SyrnHFN7S3aBB+W11
         /Ei0+EjxZjH+D1LZPV00NQddYCz9cjslXhmgB5NX+yuT/yvjPExw7+/QNnvcjoKLAUTx
         DcQQ==
X-Forwarded-Encrypted: i=1; AHgh+Ror8rPO9AkkK2d6wd5iKZ9nFDLCWIc912ykldUHQ+q3UE4+40NSMO3LjdyqzvF8fefsQcJgG9/SFotcug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/c6f6Dj+oO+mztnMCi55uN9RfugoXmNb2A+yU3BW2qtbi++KO
	kiNvHqcV5833GhcTeVupfLPNfG08qVjdLT6OXRn7TrkFyjnRrXw/dzADNUzcogEO
X-Gm-Gg: AfdE7cktEIUPSF9qfLjHhzwgLCT/udynWiHV654KL0V1g9oqzgp3mNIwyrcKeSwxZdn
	B95k4MWvUi1F0cnrHoowxby+Oq822V1jd+Iw/Iv0jlxXT8Ka17btT8pbsUHMzVDKsbC9yCtTUht
	RM0DKSQAVGLn8flEEuujjN37IpSm5Ge8gBxcOUmv3vFD/cRzf9YAM2uUJU/G4k6fXQVSGCw0/DE
	Askwml2gTnvXGNntOpgkmL1xwVzaeL+mFwnbies34PMizQ1m6F2VTf+bHuVZ3gut7MXYZiXocMl
	xLoltKrSg7bMAicw1cnwO9BpXBJ4+JuUAq+1djb5AadvTTBESvgO1XHh+dCFLJQ7Wft/zDhJkPT
	/Mid9e6gHXPYweaXG04wt3jiP6DIQVpowIYHKJr/cxVtJsolqc9zOHeoh/mg7L23pcuIxQi6bX3
	A5sFju5aEdSLDpi4nXCQ0tf6Ibayb4IJ1my7vzHLG2/nB65RFgNA==
X-Received: by 2002:a17:90b:55cd:b0:381:193e:7869 with SMTP id 98e67ed59e1d1-387568fea4emr279157a91.12.1783342785801;
        Mon, 06 Jul 2026 05:59:45 -0700 (PDT)
Received: from steellegend ([2405:201:304b:4973:59cd:5c84:346b:aa8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm85168198eec.9.2026.07.06.05.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:59:45 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: Matt Ranostay <matt@ranostay.sg>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH] media: video-i2c: fix kthread error pointer left in kthread_vid_cap on failure
Date: Mon,  6 Jul 2026 18:29:33 +0530
Message-ID: <20260706125933.71750-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66756-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ranostay.sg,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:udaykhare77@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[udaykhare77@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[udaykhare77@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 688C47120B7

kthread_run() returns an ERR_PTR on failure, not NULL.
When start_streaming() fails, data->kthread_vid_cap is left holding
this error pointer instead of being cleared.

This causes two subsequent bugs:
1. A future call to start_streaming() sees a non-NULL kthread_vid_cap
   and returns 0 (success) immediately, without actually starting the
   capture thread.
2. A call to stop_streaming() checks 'kthread_vid_cap == NULL' which
   is false for an error pointer, and proceeds to call kthread_stop()
   on the error pointer, leading to a kernel crash.

Fix this by resetting kthread_vid_cap to NULL on failure before
jumping to the error path.

Fixes: 5a0bc6fd51e4 ("media: video-i2c: add video-i2c driver")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 drivers/media/i2c/video-i2c.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 6b50fb422..4811a0489 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -522,8 +522,12 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	data->kthread_vid_cap = kthread_run(video_i2c_thread_vid_cap, data,
 					    "%s-vid-cap", data->v4l2_dev.name);
 	ret = PTR_ERR_OR_ZERO(data->kthread_vid_cap);
-	if (!ret)
-		return 0;
+	if (ret) {
+		data->kthread_vid_cap = NULL;
+		goto error_rpm_put;
+	}
+
+	return 0;
 
 error_rpm_put:
 	pm_runtime_put_autosuspend(dev);
-- 
2.55.0


