Return-Path: <linux-media+bounces-56585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKXiGtNBvmmhKwMAu9opvQ
	(envelope-from <linux-media+bounces-56585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 07:59:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F82E3DEF
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 07:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 937613062206
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 06:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184763750D5;
	Sat, 21 Mar 2026 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7GDcnkA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8D8374720
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076060; cv=none; b=mbubNhYn9DF8XY9VRyh5BhiGufwoLkVOOPDzgnVOSO4Nm9U51xaRW/Z6FgBNmVIRQbXR6q69rDvZzWjQte0SgWDjwJXnXO5UsfZScdcTof9wNKWsB6oZW5YJVyIdla5/+y04rNcpV/7D4Ww/VrDBZp5O1+NpRZNPiSXazHuOnMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076060; c=relaxed/simple;
	bh=o88VheB7Ue9cz3AeJEej6NtWuPSWVpzOFlfKchReNH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V9yeNdRiWvdvQ9hOU0s3qD5qHvCmUszsyGgQXdtWjp22ONGueyo/bcGU4LRish0DsAE4mu1E6Rc7mEuw+YNwRMOo71MPnFQlu03COJ4UV7MW/3zGqLm/DyA62QC4maNY/Jp+gDoxjPdDNhYvSimH58sVLQH296d84UyrWFfXeu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7GDcnkA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c739561f0d3so991388a12.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774076059; x=1774680859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGQQXI1iMDOQW7zjWSA3/NeC4tENFjL25ABxgm3fCbk=;
        b=a7GDcnkA0s2BLCa67NKe0Gifno2r7zjzdNLrU7v6N3yTCORSkdv5hIG9hg6USpEcJK
         GVUAqqjoFy5B5b+TDh2N9IXCbfsIgtpowvP8KVALo/ujmi49mBXvcD+WjTVedk7h63cV
         j1uVLCKyw3IXCRyN5ST2pB8Gl0ztaBh5V6RqfUEMZ54edYUzZhZRvl38nYJHrRkF9qLF
         otaaK7iUE1Go5WfYxFqKwEcXapx0HJaWy/iOUC/mYiUQ+I9Nljrg46wLBenDtwNgw37r
         eb5ZsDt04pmf9TJyFiiPjvRxwlDOgF4NAA85vLlL4oyTP6ViFSey+5KUOZdsHHbPGY44
         6Vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076059; x=1774680859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGQQXI1iMDOQW7zjWSA3/NeC4tENFjL25ABxgm3fCbk=;
        b=WJymLvalIrMivoalb2FzwhHx5pWB6exiLIodpiTzNrWrod04QVVsOK/RUJWG/Zo5zC
         4XFBBuACIDJtaLG9U+cp9D0eNnf00mm/WqebEb5G29/z4UNu4SWkHc3bwB1aSAKJ1/ez
         vBwIJNlRA02UnHs4ogiJ3yLyy2JcQggExbRqYQzyf0n6+LfRR/4ZFX3hK5/nZp5HGcne
         RmoHc6SHJqhZeN2SNGYPptR9XNkWTccPghCzjvy4y/VYfeSbUZFrfIzyCOtxtf9y1TpW
         9az/EcFTfjJRGi4X3iBALVzDr78HunmgiLfXMZ7Z8QbJVq/9DVEqy4hBR6XiZb+b2xdy
         1OuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfYv5HMGkXvjLoeECukpXa7vCa+COoswMq+O8eSMFnLhgFPZETS2j9Hlqceex95MrSB/1HaMZuT7r4zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTHKUw0CeJwvboqEUuSCoGQWBZguEru5jOwKLQ8KvVzJ6gQhG
	9Kpu+zIQFoBNKbS0WD1/k7xDDw/Tl7jzKK/LxwKpAImTd9XVvEBc/+N9
X-Gm-Gg: ATEYQzwm20Cq3QRMx0WVhsC2wqBq3DJCoaUruvgdJ8Ip9vLi9dfwaKxWnnilYHwZU6o
	GCOnDHytYIgf/2T70LoM36ds7PIu88pGvQ/kqvXSOB1jaNDO8SujM/oKjXc24MLVc67M7FT1iHR
	GzheQwGchrUS3b0xG5cjkddW2UlX5qSciI7LyxxJTpNon+4r4JNnor32fjP5+V4MyJrCenPvVdn
	waQ508gfFw1jTJhVLiAEGjqIvgHCecpvoGKCaZPlc2Dn08U3pZHkQ304HYXoFGHvnxhb8M2Hfl7
	gl3YmZmNhmwX6jzWoNnbH9ufko0zlvtdv/6NmmJeJAYPJSMLyyvreFu7xX9jBe9Kwj+CaK9WxRd
	/rfguCpCI33Dn1vBL6xYYMgA+cbW3u/SswlrRXzpEbxbCqJd8nB3pX8PshW6p8rVVpqZh6pZV6+
	ReueUen+YtyfxN2XPeyjX0
X-Received: by 2002:a05:6a20:401d:b0:39b:e0f4:322e with SMTP id adf61e73a8af0-39be0f44141mr2372219637.62.1774076058629;
        Fri, 20 Mar 2026 23:54:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74456fbfb0sm3188114a12.29.2026.03.20.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 23:54:17 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Sat, 21 Mar 2026 12:24:06 +0530
Message-ID: <20260321065408.209723-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-56585-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC6F82E3DEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vdec_open and vdec_close functions in the Meson VDEC driver failed
to release several resources, leading to memory leaks and potential
use-after-free scenarios.

This patch addresses:
- Missing v4l2_ctrl_handler_free() in both the close path and error
  exit of the open path, preventing control memory leaks.
- A leak of the M2M context if vdec_init_ctrls() failed.

The error labels in vdec_open() have been reordered to ensure a proper
Last-In-First-Out (LIFO) teardown of all initialized resources.

This was identified via kmemleak:
unreferenced object 0xffff0000205d6878 (size 8):
  comm "v4l_id", pid 5289, jiffies 4294938580
  hex dump (first 8 bytes):
    40 d2 49 18 00 00 ff ff                          @.I.....
  backtrace (crc d3204599):
    kmemleak_alloc+0xc8/0xf0
    __kvmalloc_node_noprof+0x60c/0x850
    v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
    vdec_open+0x1f4/0x788 [meson_vdec]
    v4l2_open+0x144/0x460 [videodev]
    chrdev_open+0x1ac/0x500
    do_dentry_open+0x3f0/0xfe8
    vfs_open+0x68/0x320
    do_open+0x2d8/0x9a8
    path_openat+0x1d0/0x4f0
    do_filp_open+0x190/0x380
    do_sys_openat2+0xf8/0x1b0
    __arm64_sys_openat+0x13c/0x1e8
    invoke_syscall+0xdc/0x268
    el0_svc_common.constprop.0+0x178/0x258
    do_el0_svc+0x4c/0x70

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
   tried to address the issue reported by Nicolas
   improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a76..3a5e4ebe0b34c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -877,7 +877,7 @@ static int vdec_open(struct file *file)
 	if (IS_ERR(sess->m2m_dev)) {
 		dev_err(dev, "Fail to v4l2_m2m_init\n");
 		ret = PTR_ERR(sess->m2m_dev);
-		goto err_free_sess;
+		goto err_m2m_release;
 	}
 
 	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_m2m_ctx_release;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,9 +913,11 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
 	v4l2_m2m_release(sess->m2m_dev);
-err_free_sess:
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	kfree(sess);
 	return ret;
 }
@@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 

base-commit: a0c83177734ab98623795e1ba2cf4b72c23de5e7
-- 
2.50.1


