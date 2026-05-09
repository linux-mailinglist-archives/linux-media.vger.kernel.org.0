Return-Path: <linux-media+bounces-61001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE8BHHdc/2mQ5QAAu9opvQ
	(envelope-from <linux-media+bounces-61001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 18:10:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6055006F7
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 18:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1273A30128D7
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 16:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFE427FB2A;
	Sat,  9 May 2026 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtZJogQk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA7C42050
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778343024; cv=none; b=Wk+mzRB+noBXdEvSYCT18bSfHisbmYl4lzyp98Fxu6BqNzJVMWJ/e0Cic/LL5+qNHr4d4gZT7x7H2SwoZ83pigmLsoYsT8iXvYA6cCBDNpoqgKytB08BBla+8SdjUlqeBxT5/PvqYhWZuXegYI7oIP4MNeesy26IAyty9BuDWGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778343024; c=relaxed/simple;
	bh=99yCjnOnZ2/9RWAFEnNSij/hR4coOBzMcnzJKCqK/Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ojnUv5JxioQxOGa+1cRG6uFzvP8ln7IMXPVDxfP4lCMeseq2GwAUyD6HUhG4PJ3hqCvd+sxXxev0aSCTjUvuJCaqWewEMOseRlj2fjnd+JiqwD2mDZGC6/rG89Iy3vOwkUJK+uQezlcX9fxyHkxa4fTNNdqYjPOzVG7aQZ2ysIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtZJogQk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so16830265e9.1
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778343022; x=1778947822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLg22lV7LI7oMjWPnTlUtSq58KWgzii0oqRAPN4cx1E=;
        b=OtZJogQkeqHCtHiLFVwMmrBAIeAFkQuOkTnbV7ABzAzdngqWfkIvQ1co/5PuN7/nRA
         5rEzAni8lZtL4+fDA0djqll3MNyKocAF49riU8oj8fwUc2HjkLm7sJDBrdEnZv+Zk3kX
         UC/uhBEAdhl9941kPPDtAiAHFjP67ACdrGtaxMzHYZInpdjI+dXlRNwZTik5202Sr4SA
         2SAJUYHdAzLMos6KOCpb/fJbiAOddIrxN/Fxm5Lpl2pJeKJyS51b3aiLGF3WdJJYly+d
         YBbWhyx2/vtt+tIidoLIz0UbpKTUz23xja0gI5Xbd6auA05vRoaX9SYv9x15DIWA3FOH
         uW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778343022; x=1778947822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLg22lV7LI7oMjWPnTlUtSq58KWgzii0oqRAPN4cx1E=;
        b=O5JMZULh3yvuY9gOJ9KFZ3R2eUrhSrWBmYmFK2eqBswMRhPatMqJN7DVcDqOGhIljx
         1JlQ18VeYt/l+bNm60M1qKgLemtKNi63cfs0jSMmJmB28T83v0k2pxQlL5F1AqFdHFC2
         8e89XVmD2F5DMLuLJ7UGSZP6R+4BMAe6A780yhVjDMdN87FtXfwyjhKbv2GosodPtACA
         MCB9FWv40Y/yzFo9EYyXBjLrn0Lyz7Uq30VAGR/L6pTRPN7sgI4T638iqU5NUxQiH1hj
         EwKrfPqLY8aMl/6hHvibQ0e+aPXtpVIhj+rToEV/IAmFmi9vtPw2HSUEAo3BBPV/AfOu
         F7vA==
X-Gm-Message-State: AOJu0Yy/7yhWSUL83UPIlEVMtCPQt0zKQgrCLO1b0cMs9pkMtWltvWT3
	PLSaxgMPAgoS3Vt19kg3DEbSlh7M4GAxV13ZADxgkTo8V7hp940X71RQ
X-Gm-Gg: Acq92OGsh6PMWXNUV/2z4tdZm2UX+//rTbKSWx7PXIwPUd6Z++a39mLHhJ/iGSsZLLS
	5RNMZKAEFNH9Rayuhnxol5sDZrNxL3FDmG18/2tnDyXP5+wDXMPZUezuMSfwNB/jJh0WmhrTPYp
	8Np2I2rlazWlZPbeVway17cxr5SFELFG2Y8fI6kCmUVlXc4+DBb2aQCWtsNNPjkDwObpvubSwLl
	ZCogFl/nbM0ktw+x1JStHMlEhkZqOHg9k3zU5xAMF6JmCvBM2ZIbeGphUJybhh1hdf1iGEZIyA+
	wLt/rgYkhaB1b4IFDDGxbOp5iYWiHpCL75kqNXnKWsINEtGjFEPpWGHHWX4sKP/fIejiAY1Hwdi
	LfqIqv744HKmH1N0izBKyFGbbjdr8OFp2oZ9V8idIeZ5otpHkg04xyQO6x57EwDyENycuKHt5bJ
	6P8G5GbfRygebwr5ISfPhjKDFjjiICib+I4OhKlTAU2BSCy09g/sxhOXG39ZgV2x27BcH8B5HaA
	zdu0foiRA==
X-Received: by 2002:a05:600c:3548:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-48e51e097fcmr262168755e9.3.1778343021556;
        Sat, 09 May 2026 09:10:21 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm12506330f8f.19.2026.05.09.09.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 09:10:21 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: matt@ranostay.sg,
	mchehab@kernel.org,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] media: video-i2c: fix buffer queue ordering
Date: Sat,  9 May 2026 19:39:48 +0330
Message-Id: <20260509160948.14578-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DE6055006F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ranostay.sg,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61001-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Queued buffers are added to the tail of vid_cap_active in
buffer_queue(), but the capture kthread also retrieves buffers from
the tail of the list.

This makes the queue behave as LIFO instead of FIFO when multiple
buffers are queued.

Fix this by retrieving buffers from the head of the list.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 drivers/media/i2c/video-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index fef3993f4e2d..b2db0dd64a5d 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -454,7 +454,7 @@ static int video_i2c_thread_vid_cap(void *priv)
 		spin_lock(&data->slock);
 
 		if (!list_empty(&data->vid_cap_active)) {
-			vid_cap_buf = list_last_entry(&data->vid_cap_active,
+			vid_cap_buf = list_first_entry(&data->vid_cap_active,
 						 struct video_i2c_buffer, list);
 			list_del(&vid_cap_buf->list);
 		}
-- 
2.34.1


