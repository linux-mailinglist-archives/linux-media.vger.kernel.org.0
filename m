Return-Path: <linux-media+bounces-61010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKocMOP8/2nkBQEAu9opvQ
	(envelope-from <linux-media+bounces-61010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 05:34:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5220550261D
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 05:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C6A7300E2A5
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 03:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CEA282F25;
	Sun, 10 May 2026 03:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCqxuE8Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260FF280CD5
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 03:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778384093; cv=none; b=uVc3kHPvKiDkspMUOPXvk3nRLMOP3F7eTOU6rrfCoqSt8udBHXZxH7kj+S71khrS8BrSjByGIr9ntjoWIFAzUdEFG4VBILBHwE7V+L+2gdpAVO1hnUuylj/SPWo1CZEJr5tmck+CH7WUm3KYNfs9sCYGvF4iwKHFj0pX9KIZfhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778384093; c=relaxed/simple;
	bh=CVeBros1vv3KuOvXsL16a8s58I9MgjM356f2FJ+f7lU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fpIVqVZz0H8lSfCzSC/fy4Ode6aiHNCOaHNXls7pNVxY7WzujS4dMmGWul5NfJTSVBZ5gj3l3SsfE9W8jx95ipDMfIX1w9UYd2jv+idlAxiEUQcLCB5Lodno2pcbfIL7rYDgeL4VU2sSvCJE8AsjDr6hy994BsiyftJ/SvSFV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCqxuE8Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so53753405e9.2
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 20:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778384090; x=1778988890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MUcWnV1UVAxt6Sh97DwBEQWGExTrrvqaN/l6HCxNfw=;
        b=sCqxuE8Yp2fWSqrge+Url/nddva2pXbnJOMaySnE6gO2VQbFmTR/kxs70ggyYQizGv
         9pgTG/nPvd59OBu11fW6nscVUYVLWgJl0bI80z7Xi+gBYdKE/8KxTmHkEKyE3dvqj70h
         RmXLsWi5Dro2oRYeHMaeXNnNMN8jDFRxT2SglDB+l83ui++tJ1QmWUosW9WjANWoz0uU
         HVkhaRBpJ7Q19QaUqDLL/HRowwTtKXAjpNUHEKaAMyPnEEB7KPi0vUkPDucJQ4qiRX80
         55c5vqCZ2+iLZC8gSlQ53LmOEo/ruzJa7tCv63IEVTAbtj7Q+9b7/HsAEdoUEhV7M/u5
         wDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778384090; x=1778988890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MUcWnV1UVAxt6Sh97DwBEQWGExTrrvqaN/l6HCxNfw=;
        b=JB9ZBCBfRcGqZZUHWfdC9LF1JnG1tYpxS3WKwVW0Zdrfe87F0R2iqfIjevEn/lf6Zb
         7jI2g1F1aa5IHI+v9qEaFLHtOzY7DDLz0SI6lwqzjqqP2Kbc0fcPnnV/K58kcod1xSY5
         a0UOtATTtGKYjK96ER55b1Q/WmTfA1r/jwix9yQ+muyTzKPmvKh2gXls1XunZV/hx8pI
         sBJpcW7Rar/Sj+9CIPcAwf8G6xvyIdrkChYtuvYMp5ZdVjMQ8W51yZLFo7efD/vw4rB9
         WWMCd0DbB5fyz42qoGI+4jUfcBpKF4Mhq1J3XXqH3VvjBLtc1bH48Zz/zqQ2sfRQGAmH
         DSTA==
X-Gm-Message-State: AOJu0YxQebhNVJOUJuBKJwFF9sGOviBZA477P+jzIXr5iq+5xWDOzt8n
	aPmUFabJElRYi9ZRHKwDMaXiYyvAGsVrdr9rLCrY1iqflj3NeD4z7eWW
X-Gm-Gg: Acq92OEYAT7z3KftpcHcWmqWBA7zX2kulmfD1sJho1n2p4loi1D+WK2Mucl+aEVkJg4
	LCdUy1IzZe5X2YZDjt7SoYxpKTHTpKXAIUjVnPhIuVNdLRqdTFE9e6/yy0cJqBK6U2SFr1lD90P
	91wkPtBwJQeD7MmFWX6SsgL9+0GWCwB4ry+w0ZVOdZXoguQaSt6r/7MnUl5ac1XngnCQ1dW8y5J
	ZFnrXdf/uQFEsa9wkinkv1HyxXtyi0vxrzlzyXVaoJ1YbR5PkxWWcP1xu9A4MrPgoPRUvW6cfUW
	81vNLWWcVqCc0XDQ7JqFUvGI4SvL5xyxSETgKoaVmn5PhcZ1pmwUPc2aGYluf62rm2wIRFwIXDd
	82qt3oYu6ab4BJR4ZTyQgx7QU7TZ2UDy7Kb9HrgfMgRg9SEKSZY2Xtz+vJAoEMANBvg/tAYlTYB
	PGUqyONzo40c502LCA+OgJKHtIAETjLWReS2lJjWhiaDoH43M87uKiABd0mwCW0zGupMKoiVfNE
	aTlSg9m+g==
X-Received: by 2002:a05:600c:8585:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-48e51e0b5c1mr251542675e9.6.1778384090161;
        Sat, 09 May 2026 20:34:50 -0700 (PDT)
Received: from thinkpad ([172.80.174.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db1742asm34478455e9.31.2026.05.09.20.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 20:34:49 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: matt@ranostay.sg,
	mchehab@kernel.org,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v2] media: video-i2c: fix buffer queue ordering
Date: Sun, 10 May 2026 07:04:23 +0330
Message-Id: <20260510033423.15741-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5220550261D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ranostay.sg,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61010-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pages.freedesktop.org:url]
X-Rspamd-Action: no action

Queued buffers are added to the tail of vid_cap_active in
buffer_queue(), but the capture kthread also retrieves buffers from
the tail of the list.

This makes the queue behave as LIFO instead of FIFO when multiple
buffers are queued.

Fix this by retrieving buffers from the head of the list.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
Changes in v2:
 - Fix Media CI robot warning about open parenthesis
 - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99429813/artifacts/report.htm
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260509160948.14578-1-arash.golgol@gmail.com/

 drivers/media/i2c/video-i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index fef3993f4e2d..38c35a8c80f8 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -454,8 +454,9 @@ static int video_i2c_thread_vid_cap(void *priv)
 		spin_lock(&data->slock);
 
 		if (!list_empty(&data->vid_cap_active)) {
-			vid_cap_buf = list_last_entry(&data->vid_cap_active,
-						 struct video_i2c_buffer, list);
+			vid_cap_buf = list_first_entry(&data->vid_cap_active,
+						       struct video_i2c_buffer,
+						       list);
 			list_del(&vid_cap_buf->list);
 		}
 
-- 
2.34.1


