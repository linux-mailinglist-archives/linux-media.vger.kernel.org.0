Return-Path: <linux-media+bounces-61972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA21EGn+Cmop/AQAu9opvQ
	(envelope-from <linux-media+bounces-61972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:56:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE39356C0E7
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6564302F58B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF7E3F7863;
	Mon, 18 May 2026 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uh9rDT5W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E303D3D16
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105154; cv=none; b=UAumZ/aN6oI0Qp4V4KEUEL0YrXpIXIzod1JDf7sJIl8pDQrFwSBQum9yllOdgY3nOeexFGhYmQIW64y8Yn7cr5CfFTLkMlB8LF3A+JfpexNlt0TfTTcU+gfNr/F8bzcSpVaUVjoKkTtN+I29YIQ41+61CYx4LipDOicsJEzFmxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105154; c=relaxed/simple;
	bh=H+Tyls76daA3eGlvfJPN03V8C3U5uw1XgqZPCavatgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtgZXBElJnrv7D/PpfVWukb4NUUuLJAr+gnNbcs75kAV61MiIMy3Ve16bKABkieBtGc+1vt0ccZCtZqfemoEbXsuSogIaL31eACqwbsvfI9pHLogfXcUwmwK0yvWEFHWBFkp8dN1Y6cv86s9KUAsdVXgy+VNYPiQ+nh6XTE/+EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uh9rDT5W; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36974220e45so746895a91.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779105152; x=1779709952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lcjglP+1RAddnRhcnzDODhk3aYczqj8l0Dmk1F3SgoM=;
        b=Uh9rDT5WfWYlR8MjKmn2CfnFREyhQugP5OwqkhYNctGuCdaQhH2cKPaHWYGgaHRhue
         pCD6BQko3kVFOR7CGPjVuZpC7iVrYeC0iOqlxeTEx1bi+nee+EYEWD6tcuFuhzBUckQu
         Xpe5frNjMsvkXzwMPlMWAb8b5ONqGbtmnmW5lN6YpqBDU41cK5ZtBYPb9hobgr7mhaOx
         dfpGUthvyi2TMYHLuPOHxvhbMLUFws30Z7J+CzaFq1XvB1LL4WnspC446zm5WNEH9HfB
         Bh3N7NLTLYT3XolHBqIkHBpoEIqXrzoQ+K/MJRBXhp13Y8YPl+38lSZh2SfJTqxDzgUE
         cssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779105152; x=1779709952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcjglP+1RAddnRhcnzDODhk3aYczqj8l0Dmk1F3SgoM=;
        b=kUbH2j85e9EalgtDSDWTX3rxxNbs8ycu66H9KjoLXMRmTwv2qnKP6C5HQh7AuzVxBf
         D04ZQjJdIeFiGSOVhRVMPg3SzN01+dKE9mdE18pqq/gmt7D+G37JUHGD1d0kyk1nBg3+
         HIHFOC5n/b6umSgXIPCY5JhBEkdNibwVVVNnVYojryjNXKFFK/5zZqOe+kpVu9WmwQ0r
         V9uWnHBy0W7opwOOwSmiu/5ZQ8znJHDYA7xCoerktlRHT07WJxTLGBK8WwHJm6x/Mkxv
         MvSp65AdDTnBi5grLUxKkhgkRB+jgTSagdwUOCdZxgDbz021MW8ODSNZg23y+UKCSDSO
         1HMw==
X-Forwarded-Encrypted: i=1; AFNElJ9BQKu2TioV3MKH9PT3n5A/d5mFkuq7Puw3Z0Yb5lIIGJY1hg2slX/qxg+eHikpAptG8PMG9FnR05mg5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2rZstiZyyMShDf/UISJdJigrrGprcN6Sf9CVehEr1vIqKXFa
	oCbVo1AR7d5quAEA/ovtrVc8w7VOLEwhRQqp7Ro9E1RhuSJQpL65fqD/
X-Gm-Gg: Acq92OE0oBQIc6XDEfR/B/gukD7oX2h5M78WAiMjl6UDs2tYl5wRCVEVxSeuvXw1710
	MaubJCbsilB1dPC/fk55YKJBs01U/Hws9E/NeNudBdx02WuWzR60jWgV4JkCz1No3ADweNyPgP6
	DSM2IrC6HFG5wCXEi95HgOlIYkSXtT9HfPLGAP8PSQy73iSDsBVTWhXYR5HraB1ZBmY7PudHCGs
	lV2l+9ZEX7774zwqiJ4GHAxRTmg58MF0uzKVNeHxz3eVhN2XQhKyjGE/SJqgtY6wDghvZt4G9o0
	TUSFRKJINtXzFXaKjdal+dvmbvzFCdbi1B98pxUj1mTZeRmliaEddTomQtpm8fTfCu4Y99jTfPd
	VFUXBSJ+ZWOFYQzJrW7Jim6Q+pBSLhUev3KcmBT+0dhAjwI/c7XqfNKiL0hkiCGkF4NYDhSRb8D
	3u94d/R68lX+Fsuur4fbfb
X-Received: by 2002:a17:90b:5708:b0:365:8fd4:925c with SMTP id 98e67ed59e1d1-3695149986amr10611417a91.8.1779105152199;
        Mon, 18 May 2026 04:52:32 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695157c3cfsm11047195a91.5.2026.05.18.04.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:52:31 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: s5p-jpeg: avoid double free on video register failure
Date: Mon, 18 May 2026 19:52:19 +0800
Message-ID: <20260518115219.990820-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DE39356C0E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,samsung.com,kernel.org,lists.infradead.org,vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61972-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

s5p_jpeg_probe() allocates encoder and decoder video_devices with
video_device_alloc() and releases them if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  s5p_jpeg_probe()
    -> video_device_release(jpeg->vfd_encoder)

The same issue exists for jpeg->vfd_decoder.

Use video_device_release_empty() while registering the devices so that
registration failure paths do not free them through vdev->release().
s5p_jpeg_probe() then releases the failed video_device exactly once.
Restore video_device_release() after successful registration so the
registered devices keep their normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 7a1d4e7c064c ("[media] s5p-jpeg: Eliminate double kfree()")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index fdc9d7e0be66..046ad555c5fc 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -2915,7 +2915,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->vfd_encoder->fops		= &s5p_jpeg_fops;
 	jpeg->vfd_encoder->ioctl_ops	= &s5p_jpeg_ioctl_ops;
 	jpeg->vfd_encoder->minor	= -1;
-	jpeg->vfd_encoder->release	= video_device_release;
+	jpeg->vfd_encoder->release	= video_device_release_empty;
 	jpeg->vfd_encoder->lock		= &jpeg->lock;
 	jpeg->vfd_encoder->v4l2_dev	= &jpeg->v4l2_dev;
 	jpeg->vfd_encoder->vfl_dir	= VFL_DIR_M2M;
@@ -2927,6 +2927,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 		video_device_release(jpeg->vfd_encoder);
 		goto m2m_init_rollback;
 	}
+	jpeg->vfd_encoder->release = video_device_release;
 
 	video_set_drvdata(jpeg->vfd_encoder, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
@@ -2945,7 +2946,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->vfd_decoder->fops		= &s5p_jpeg_fops;
 	jpeg->vfd_decoder->ioctl_ops	= &s5p_jpeg_ioctl_ops;
 	jpeg->vfd_decoder->minor	= -1;
-	jpeg->vfd_decoder->release	= video_device_release;
+	jpeg->vfd_decoder->release	= video_device_release_empty;
 	jpeg->vfd_decoder->lock		= &jpeg->lock;
 	jpeg->vfd_decoder->v4l2_dev	= &jpeg->v4l2_dev;
 	jpeg->vfd_decoder->vfl_dir	= VFL_DIR_M2M;
@@ -2957,6 +2958,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 		video_device_release(jpeg->vfd_decoder);
 		goto enc_vdev_register_rollback;
 	}
+	jpeg->vfd_decoder->release = video_device_release;
 
 	video_set_drvdata(jpeg->vfd_decoder, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
-- 
2.43.0


