Return-Path: <linux-media+bounces-66788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I087NGDNS2oWagEAu9opvQ
	(envelope-from <linux-media+bounces-66788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:44:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D45712C21
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:44:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=L7Otnge2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66788-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66788-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E76083049AFC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 15:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B30B3ACA4A;
	Mon,  6 Jul 2026 15:30:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A163A6B6C
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 15:30:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351841; cv=none; b=qoEh5RWdlO8QswYGcDyYvJ6/6OjZFbHgDzV2tB8ZUuvfrbAB8G9yXiqTMpThuB/lik4GepHG5ReXl9IbQkfGiAvoK0k8DSwSzv0CsvM57dwx9M0/HAG39WaDY2MuP9dAuXjnDNxvo5jBcdQDEBZKGvD4qv8r1ybMhNfjXBWPUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351841; c=relaxed/simple;
	bh=ZR3LA4anilcaggNo+I6EadE+x9RvKiaumZybpeHR+40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNoQuWrCfyXVeD+nbh0pA4AnCkDADGoZgyotU5z9JsjAH77cwG3MRx/k70nzuutQLUuBqEVj5ySLzto5d1t8H+nodR9qGZqqCkE95XzmAYoyV7gJ79Ig8jept8/dIayX1ij+X7uyB8zZGD7QzziTgeLpwI8uqG0vwkTemgivdM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7Otnge2; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc6dd436c6so15136705ad.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783351840; x=1783956640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8J+ABJmqKUknTKUb5C8LYheVifRDzKn3aTiLDOk7Io=;
        b=L7Otnge25NxNahr72ZV1wzsc3wrP9btyUhw+l54lUTOeHDJ6KgXZ8IrRK1r5AXwPVt
         d0zixnCbzwPCfmapaxXtaYjO1q0moaF0j1kXC2xjzOenoCORDh4SaPa0ScqCW2BLk0Pa
         M1b16Z4JA30phjyS4M3KnkWFaudytS1XMVJ/ltJqMJPiy8SJJoeu8KAdlOtrWrYajvz6
         jK3bsAKqscEQyjEcT3nib2ZQi4ta8WUk58gasFX2n+t2MH5b9kE0O9KeWHWTrQ/4TFt9
         dNgvS+K1Ny6vkaiIfVzesG/39U8UH0Y/H5elPhmjyOqACfcx+6wYU3naFWYJPE2VXevu
         ro9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351840; x=1783956640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8J+ABJmqKUknTKUb5C8LYheVifRDzKn3aTiLDOk7Io=;
        b=Ol3wWRmcnc8RDJPbmApjr0fhYCx+BSXxFzFZMFVN4JNpk1k42sr9DjxfN2u2yJ41rL
         mcpNuTnYLS2rzJJLQsSkz+lbbp6PfnVGqF1jp+76SJYqO17OEmbjc0/TDkWVVTbNm0+3
         ReX/U3vWL+wmNu3sfTMVF2fgmXs1JUYMPYR9tfE3z3LuO2wnjGb8Akj0pFCax5fAHXYy
         S4tJeQyrvSUG+EBU348pFm+8ghhVTG0RtUbLMe1uLvTyx3jzjDJ4QjC1+oBZdxqZrut4
         f6Hia293wBC2Wky/xaRfgQJfZIl1eXiQqwfD/lktiUG0xVOh4G8ZwOLTGzZ2um4wzz3m
         d+yw==
X-Forwarded-Encrypted: i=1; AHgh+RoSCMjGW7mU+6EEpbUp38GAJ+i3LI7I4ZY4zY3nk3HWK0bRoHYQ61sMG20O1MEVnMX+G0mSZLh2AICn3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFlK8/LCSr70ydn5J2nh9iWfdZ/AVxOYreaoi/EWPZvjXz7Q2Q
	B70ileqLBF4hTqwBlJOir0CnYujsA6mOPKrfnqYRdtc3arkPGlXURlwZ
X-Gm-Gg: AfdE7ckBhtHkkSg05P6se1PhZLTHaAmSH2Ag8GYLcMmUSF9o9gzHjhMbbcnhWZ6AeYW
	Kn7L1g1Ry0EsAgzBMPGFA6bS0GzlHAkuiNZMFvE4DzCmQGgLSg0lfwKDRDK3W1CSGqrxWvhSy1L
	KrZEpjwA9/ymWJWOEJAhJO3tc9YeHMCKoBD9zKwrx0aRJa/aUMpGQ8QVHG0pAwmHFaYdJWB9gpv
	DrFNqeoqDZ6ztAVZp38LQDk3/BcEUUoOWFsT3vdvP8i60SjFdEukt7Yq5GxVA44J3H2H01TUP+3
	XRlV8757qkgBsYDn2pXSTulS3M/oOF6aIXZM5oY6i9goJDeFRlvDNA1NxG3NUXR0Nj8VINVUHu8
	NuFxNNGO9xqnNqVcbfIULh1SGl6exkVU9IZXQQxULtBdS8FrVfgdu7RBxUCnukM0ZYZMEnHHNNM
	sFMpyHEqHrQX5oqivnd3W0WBv88V/Y1gL/SvYW10gAOqCip7XH
X-Received: by 2002:a05:6a21:4612:b0:3bf:c126:baf2 with SMTP id adf61e73a8af0-3c08eebb3f9mr1340098637.47.1783351839158;
        Mon, 06 Jul 2026 08:30:39 -0700 (PDT)
Received: from steellegend ([2409:40c4:17a:52b2:cd9a:cdf:1ebc:5649])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb7fe46sm61988548eec.14.2026.07.06.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:30:38 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: Matt Ranostay <matt@ranostay.sg>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH v2] media: video-i2c: fix kthread error pointer left in kthread_vid_cap on failure
Date: Mon,  6 Jul 2026 20:58:33 +0530
Message-ID: <20260706152833.10568-1-udaykhare77@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66788-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75D45712C21

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

Fixes: 5cebaac60974 ("media: video-i2c: add video-i2c driver")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
v2: Fix Fixes: tag - use correct introducing commit hash (5cebaac60974)
    instead of the incorrect hash cited in v1.

 drivers/media/i2c/video-i2c.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 6b50fb422a61..4811a0489524 100644
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


