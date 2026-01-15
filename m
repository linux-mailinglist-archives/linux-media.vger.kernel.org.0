Return-Path: <linux-media+bounces-50812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB4D27F43
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 20:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51BA4300DB82
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 19:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93722E8B66;
	Thu, 15 Jan 2026 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fxe4lCdx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F309128A3EF
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504266; cv=none; b=bOw/QrLSaQgCx6y5UE/hGggWGKwjhAYBgHEv7OOUW+k5C/qHM5f0J/Ay8G55PzL5oAI+dJNGJG3tlHgtKpU1czK0ubKQn1UQtSUWX3jRhLhgM91IeGOjge9YqRxhSahCnxmycWaXkdxgVsBTPnSKe7Qbg8Dx42o2ka/vzIu48ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504266; c=relaxed/simple;
	bh=s6IgxUFqgYD4lm5E3ALpKv326v3AZLs8wbUzAQZd9V4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jdSAg254rBjcdhOCSE7gTD9fK/d8kEj66nsnRvnA86awmkwH3Ye4VlQUDrTxI5HZFmaATII7V+cS33ubndjf8M5IyNAV3c3G8a4OeO/Z7NAA5ew+rY3BWXpWa/0s0iek1ufE+qBWMhAE6q/oQqIDG1okLhIWn1XnTdf1/NLiTQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fxe4lCdx; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81c5d620e22so21099b3a.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 11:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504264; x=1769109064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYjqEry0YqQXqyo+7wP45+hgQB65GYCKkLEuqzfYHEA=;
        b=Fxe4lCdxuibScXcq7jTl8k67NxLeMynaRL61ogC9AsZOIi6SFUYI5/6qCQwnXsOppX
         Oy4wzTeSIQdQT8cV/DnDifj+T1YvHbWCgGtg+/wXbNPKvMf3wuiJCtPuzXTRu9BT5k1F
         NrP66owt48fhh2jL5gKOXO4j6g1bN4aDff49xREDP2xllKeYEk5TGqAA9SBr+D7vhic1
         jyjoMf+jeuA0zsu9HQ3WszJAn6zRsYt7kX8Hc2aO8ek2mAS8fc/PUwvF14pMdI4eQS6A
         W1tDHWnZrKEDSlh+ZSXqjP/vW51f8vHTDfbHZ0Jp1JkTaIzwS94Clwlr4+ugozGOlIjN
         w/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504264; x=1769109064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYjqEry0YqQXqyo+7wP45+hgQB65GYCKkLEuqzfYHEA=;
        b=wIqeaWiX1BSP8L7D0BIW2eHbSrD6fu8UGiihLISNTnP7Eyd5JCmNuvk5uK5i+4A9Vm
         8X8U9Wxs+7Q9QUf9q7VmtuIMTWVGQx+L3Ke/cC/blazCdbTe5tCxHjTGzMWVBwERVYff
         OxWhBxNAFCzOXG5DphAgF+5iPM9ha0G5M2nHKMqZHOJUG1KpxQtpnyjPUNSVVQgodm18
         Iip5C010amwzxPfFdvMLXTBd+JGB7PIvHz9CfG66bBVFB/KR1/yrK1TIqecfXXK5Y8/p
         DZlkps5fsQWD4CKNf75ax5ikOpfXk0o2ujCT5PnQykaFjl6ynCluGDLWhTAg+Rn93bGF
         GVZw==
X-Forwarded-Encrypted: i=1; AJvYcCVetL9LSuiCoO+q2Zvmkfc/gIvGhI/FP739Aodx11D2diYu9qB6iu8x8B2N+L8xPhcUxuDt1h3Y8I/Wqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6wtX4Y72oYtR4/nlZ03qvROHY1xCU46y7DPide3yPTnePKMB0
	4bg01YK9dqQDo+cIl9SF6+5EHLpFM/kf5yUfX5hguhFz2v7hS4mPPXoN
X-Gm-Gg: AY/fxX4vOglov8QnNxkka/s17IC0shC0aeMIdyt6snTeRcpWyOI7Qwg6nh6TTf+cCr+
	72wOQqfLKsR+LmaIgdygJTg/1q1rMILL+ciKO227bnTR8xf/BIKoLBLxU4NzWOJG/yHaTQ0SVhr
	C1R+JWJIsfAdL2BOh8xzDRG0z1S2B/+1MHD4WDSF1iGhOTrdr4PkVdye5WI7+G2RnzT+mVE05uH
	145d+sABMuzdVw/LLXPCeHVQcRTppg189xL1at1PH/O9/Lh1RBM1rUBFC3IJo3jia+ttHOQBWRP
	oTaYfJ9eEzb504PYMkW7u7hyqy+gaaXnH9nhQe4t6vkYUmyP+vVsqWgw1GvHjgVfVIzXr+9vkqZ
	KWs1xhR5uIRLUZ2BPHmSwagm8YHeMLnXTFDkQuQULck0m+rsVJDe3k7zY6vhhNhFubP2/Zfurhh
	wtJLdMlkLcwab9rXYp+xI=
X-Received: by 2002:a05:6a00:2d26:b0:81f:4a02:63eb with SMTP id d2e1a72fcca58-81fa038a36amr373660b3a.5.1768504263923;
        Thu, 15 Jan 2026 11:11:03 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:538a:c0c9:9ac1:2b99])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm121409b3a.65.2026.01.15.11.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:11:03 -0800 (PST)
From: faizel.kb@gmail.com
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 0/3] media: vimc: Add frame rate control support
Date: Thu, 15 Jan 2026 11:10:47 -0800
Message-ID: <20260115191050.1370387-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Faizel K B <faizel.kb@gmail.com>

This patch series adds frame rate configuration support to the vimc
virtual media controller driver, enabling userspace applications to
control frame rates from 1-240 FPS via v4l2-ctl and media-ctl.

Currently, vimc operates at a fixed 60 FPS. This series enables
dynamic frame rate control through standard V4L2 subdevice pad
operations.

Patch 1/3 moves the vimc_sensor_device structure from vimc-sensor.c
to vimc-common.h, making it accessible to the vimc-streamer component
for reading frame rate configuration.

Patch 2/3 implements set_frame_interval and get_frame_interval
callbacks in v4l2_subdev_pad_ops, allowing frame rate configuration
via standard V4L2 ioctls. The configured interval is pre-calculated
into jiffies and stored in the sensor's hardware structure for
efficient runtime access.

Patch 3/3 applies the configured frame rate in the streamer thread
by using the pre-calculated jiffies value to control timing between
frames, replacing the previous fixed 60 FPS implementation.

Testing done using yavta with various frame rates on CIF resolution
in qemu arm64 platform.fps varies depending on the delay on each
pipeline module.

Example usage:
  # Set to 30 FPS
  media-ctl -V '"Sensor A":0/0[fmt:SRGGB8_1X8/176x144@1/30]'

  # Capture and verify frame rate
  yavta /dev/video2 --capture=100

Faizel K B (3):
  media: vimc: sensor: Move vimc_sensor_device to common header
  media: vimc: sensor: Add frame rate configuration support
  media: vimc: streamer: Apply sensor frame rate in streamer thread

 drivers/media/test-drivers/vimc/vimc-common.h | 31 ++++++++
 drivers/media/test-drivers/vimc/vimc-sensor.c | 71 ++++++++++++-------
 .../media/test-drivers/vimc/vimc-streamer.c   | 35 ++++++++-
 3 files changed, 109 insertions(+), 28 deletions(-)

-- 
2.43.0


