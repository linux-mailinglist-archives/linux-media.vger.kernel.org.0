Return-Path: <linux-media+bounces-37826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7409B06B3D
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 03:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 201F94A8635
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 01:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FE4267F58;
	Wed, 16 Jul 2025 01:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqOcxEiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C828682;
	Wed, 16 Jul 2025 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752630168; cv=none; b=nH3to0r78KcF05HmGdMUo5yWKqGrxbs6NwHmAmU6rVdE1OJ4k1WABuhmVPFbSzwaY+BNBBqn7z9prxdZWdO6M5ukXLccnSTlQNrEiUE8gaaxnZwjnxwPVfn1So7Pu0N3NfuXPXb0OuNGZQ51L0AGwA/5JTwU1EqFwjV/Z2NwpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752630168; c=relaxed/simple;
	bh=xPTaJ/vt4lk2a72T8bc6Fse4Xs2FqJLAdSx3tQyf6gE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A5vchCp15kPa+gBoi2n9tFu8BWzQyBr4DVQD6VCnKCvCTnJDXUakNCwRao4PCf+zeR0xzD6AXn3Go7MFjdbgMbgXDqsbJ5u9j8cgANJFMxr4UCMmUWXzzIu9tsSR8ANg2MWtZHxuko/aVTKbvIXZJGAlfrcod3wK8uqteh5JgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqOcxEiZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4e62619afso619240f8f.1;
        Tue, 15 Jul 2025 18:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752630165; x=1753234965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLeyLYXEFMibFLWvaUdvqmO2gpxZqhTUQ7OQNA+GmDk=;
        b=AqOcxEiZZIQTEDlQm9Mwvj6tXEwacI1VAClk24jiHU47t6I/2tgN2RAqL8MaZrvYAv
         zpNkV4p9bU88YJdv/ghULcl9T4ADmmjxICT7E+avvMm9UmaKrfciXJcy9+wYdB8kqreY
         7h9lbdMCUBhCzkBBWDZmvCnShTLJzHvAahl+h2Ot/pnipP6/tNcF2daBsWf7wKjVe6/8
         k5LhOHCpi2NLmzejf8epK23ul+Ilwd79bPyQToLrIsZprPfR9JSF1PIYMfjhFhfEyLO2
         6zcvRUwElax466M7iH6PnZ9Qq0dhwSzGKBLeQfwguophS5zeIqvtacGjElIzLjXzk7Jk
         RNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752630165; x=1753234965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLeyLYXEFMibFLWvaUdvqmO2gpxZqhTUQ7OQNA+GmDk=;
        b=dvGx23+yiLId3RQWHXjMRvBaWCTPg5jZ3iWWJ6s8S0v/tZy1f9q3zkY6cHuEIV2jY2
         +env4pkqlrBrJrBIpyXZ0FmrJkUdsNtUWNqbLfrWsVN4CpbiaxxPD2ZF+QhgbPoQ9rZq
         AozmZDemRXPtM1towm6NnKRLNzbItzq0b+7q3ZGUICtDgX1zw5Pj5XDxQzA9qu0WeKp8
         T93tfBgqQw4sCgIO7AuaLPBd8UOry+auR18zXMQwQAcKv6j4J/fZN2Hb1LyOsSqa7kmr
         aVFDzD8DscJiwSmIaGeDPKib4MoYsR9G5cDyyylMbG8DVOyeAJ+WchnwiPQMFbnL59KO
         j8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX0BbEzYwh89+p+6OnGzb8uvL19bK1Zrsz9CWQNyByIwqk1t/mTQRe83viqn1O9+6RK65MvONY+8WD30E0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTgOdj1/SkhDXk29Lu4ziV/oXzpnujyELlF31QMfoMb8rGHMwm
	dXM8/g9eiWB7jHTHZQdKgKd3JosxLhtuzgBp3eeIjMY20I6mwAZI9+/C
X-Gm-Gg: ASbGncthMH9scq56+90AOWgVpnIhauH7xKIuHCKPjFc/HNB5NEJFOEU0lgppzTmy5nT
	pKIZew5lTtVJn5s6N2/5ijLGsPPvMcxwwuSXPfnoxHqmXSi5RA0hoj1IKN6/QFYoVqd2/xmEW4/
	14a4gg5/i+2BznWho0YYq3hGV1a9hk/2gJvy6vdtCXGmWNSxpm43a0orNvxBNM5btObsRPOXrSq
	71vjdPnv8wnSLzB38PmBBtA/BYnZIIPHMiCJwuZtbt6o7uIdRTh+atOTeZS6fWGlh/h+T3wEmuQ
	H6hAxUkHGtsuUv+drVD0WPl0DKdJ1mLhWzpBg8YhZqK1c5ScuEQu9uhf4uNP9dLOct/+q9vUNdl
	fqu9m3CFygHTpF/DUw2QadAW1mjz6ebtfYdVhm6FMAYUDX0Ra+bX836VcnFr1
X-Google-Smtp-Source: AGHT+IENO4+qmqIviSlPAbVS9ZtjYXYAhHGWqJPgF2KWiIPDRbXn2F7WUNRL/NiNhLjZHit3fOEBMw==
X-Received: by 2002:a05:6000:471c:b0:3a5:8b43:2c19 with SMTP id ffacd0b85a97d-3b60dd52f15mr298310f8f.4.1752630164926;
        Tue, 15 Jul 2025 18:42:44 -0700 (PDT)
Received: from localhost.localdomain ([156.208.220.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d76fsm16785637f8f.64.2025.07.15.18.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 18:42:44 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
Date: Wed, 16 Jul 2025 04:42:25 +0300
Message-Id: <20250716014225.15279-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function atomisp_set_fmt() modifies shared device state and expects
callers to hold the isp->mutex for synchronization. While most internal
callers correctly lock the mutex before invoking atomisp_set_fmt(), the
V4L2 ioctl handler atomisp_s_fmt_cap() does not.

This results in an unsafe execution path for VIDIOC_S_FMT ioctls
(e.g. via v4l2-ctl), where shared structures such as pipe->pix and
pipe->frame_info may be modified concurrently without proper protection.

- Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..9bf0be00657c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -416,8 +416,15 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
+
+	int ret;
 
-	return atomisp_set_fmt(vdev, f);
+	mutex_lock(&isp->mutex);
+	ret = atomisp_set_fmt(vdev, f);
+	mutex_unlock(&isp->mutex);
+
+	return ret;
 }
 
 /*
-- 
2.25.1


