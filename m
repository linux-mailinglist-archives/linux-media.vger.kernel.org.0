Return-Path: <linux-media+bounces-61986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FKRKn4KC2pN/gQAu9opvQ
	(envelope-from <linux-media+bounces-61986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:47:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5092756CFB1
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FE713034223
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89DB426D05;
	Mon, 18 May 2026 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlgt4tNu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B34A30C15D
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108269; cv=none; b=n3o9aeOaU9Ndd0BF70LxHfohnQjDBFRWGItQ48CBjX7cJ3Ax8zE836+NcbJHowlLR5uQTG8G45FyeVyXDHQr8+8TeQqCBVb27tIAXxXVRzY0q05AO6XqLT+Slr3/4S6MKo5JBp0L1imwAsV8ppC9N74Ciq8pXXjFOyll5k84GHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108269; c=relaxed/simple;
	bh=1EiBwiLFVmD62ZUt5qrK0A1DphQB/3QwVGEMyqIVdQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2SoGdkAKdpyP0OTNsVvEdbTaoa3LHV/LDQ+67ERm/lkdE4IYJU2Yci/KWT3Z73g6hyBMhZKDoN1jOYrcyYJqUTR2eW9IKFHRtwAq/XGvmWR9iKvRWyinW/sv0jXiAvBO2V8Av3sEhExEHyXTKCBP0a4N8T92TK4wvZ4nqiYWes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlgt4tNu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b941cd869cso12485545ad.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779108267; x=1779713067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0xfFcN/bl2TM7C9TR6nPSQpgcgZrLujYdk8LlfWRiM=;
        b=dlgt4tNutcOi4uJGwnkjOP1YZyqGpVYoeIptsvBXl8kygMQilh1e/3vzKdvONCAOSc
         Lz6UD/RTKdaVy83h+XepjqD1MABJ/dO/LTTqSxH86bhjonZm4NwlwzdbO03+IxL3cg4O
         Ps1E9pweQzXDxEGpMyZD59PmkXFO+pbrRD1hQhsaVcHqlfj/Z0bED0mpudZN7/ovlu5X
         SVre7Ys8E0N8va4Uz7M/1x1XDAz1gWDCF7z9BwNeuvCCkRXCxlfBCT79CEA8F4NzCY63
         D7qd4izP1PpihCazpqNjKnatIKBevfg+ELz/2FW4sOOIAjSN/6zb1ZY1bOQcLO64JSyf
         SYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108267; x=1779713067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0xfFcN/bl2TM7C9TR6nPSQpgcgZrLujYdk8LlfWRiM=;
        b=OPggpOejc/bKYRGgzuEBpfg2uxylTiT0D0Xs9fRjISrDyWD9CuTCUppkdONDub39tV
         CUienZcNBZ11BVb0Buc2b3JjawGQBQBomOe4tM3oVjEJajpkmZhDC7kIbs9VSfMK4dUv
         e17zlW87DvkMAuTbnNenhDNfBftVbcbezUNLic6MTdnCTo3daGMfIQasnnqHi/x+WcZf
         V+3Lgk0evVfvNDo8uPhSg5yK+7UZWFpD0TjZr7LZH+04hAp2APRhnXuanqbORtaVo/1M
         5gHxKVHR28uoCRSQ/m/wTHJZITL3D1NlZIGaMiuTomCHVsb8zv4kueiZfU8xcUl933r4
         ioVg==
X-Forwarded-Encrypted: i=1; AFNElJ9gqTG1jhZfZcHaL0wgbl6TERyuZVDU1JM+7YvSflIUbR/JYEZTEKHs7GXE60DisrcGC5ku5BMwG6borA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIKckf/+pdzkQ+h4KMaU9+v7IsxHLnK6WnIJB08t7O7/k6r0AJ
	VHlTUUOrkeCS7jRuQ7X07CYVFq2B+SCHX49AM38pndrCApuGvAxHi1SXHvL24EdUFWo=
X-Gm-Gg: Acq92OG76T/qFbI+rPo9sWtW7rq28Oih7XzDc/DXyv7pC6o1nJyie/fuB2Za3ed1NPK
	k360NUlXmgQBiaMcncC+ELOhjpNZ7y+r5GoYDLS4GWxy+dhu+jCDK6X4qSWDAEYSQcha+v1LD6P
	D8M3DxQIlTt3XfN/TYlXhxrDZpjbA6k8YYx0on0pDRLlWujqNndmrqCK9jD/DiW37eFOoBwie+f
	OcpQ5eE+09sXtC6BLCo7r1mr2seLs4pwkZIQzjj5hJiEU1eYxOFf0/GohxUaV/r2kE4T0eQxnSH
	XBq7T4yQ5rv15jCl9Qco25sMoN1u6qZAjJbVofLFLZYLCUWnUD1gAjFVIqaTVA0Uk8+c8r2knRl
	XqZvzCjtJmwjKmtahHiOjCS9PGG2f1SQm7rNT5enVaqJe2aukmno7l54xOOTUbhXG8hBMp2mXeU
	OOeA7ebQNuRjkG//0SKoennzH20rSmMIA=
X-Received: by 2002:a17:903:13c8:b0:2bd:8395:feca with SMTP id d9443c01a7336-2bd839605e4mr151517625ad.23.1779108267198;
        Mon, 18 May 2026 05:44:27 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm145857285ad.34.2026.05.18.05.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:44:26 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: sti: delta: avoid double free on video register failure
Date: Mon, 18 May 2026 20:43:58 +0800
Message-ID: <20260518124358.995482-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5092756CFB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-61986-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

delta_register_device() allocates a video_device with video_device_alloc()
and releases it from the err_vdev_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  delta_register_device()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
delta_register_device() then releases vdev exactly once from
err_vdev_release. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: f386509e4959 ("[media] st-delta: STiH4xx multi-format video decoder v4l2 driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/st/sti/delta/delta-v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index 7dd27de37b78..0c6ac4bdaa9d 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -1767,7 +1767,7 @@ static int delta_register_device(struct delta_dev *delta)
 
 	vdev->fops = &delta_fops;
 	vdev->ioctl_ops = &delta_ioctl_ops;
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->lock = &delta->lock;
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
@@ -1781,6 +1781,7 @@ static int delta_register_device(struct delta_dev *delta)
 			DELTA_PREFIX);
 		goto err_vdev_release;
 	}
+	vdev->release = video_device_release;
 
 	delta->vdev = vdev;
 	video_set_drvdata(vdev, delta);
-- 
2.43.0


