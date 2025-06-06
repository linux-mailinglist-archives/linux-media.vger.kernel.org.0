Return-Path: <linux-media+bounces-34180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8BACFB83
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 05:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B45B21893766
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 03:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864831DF963;
	Fri,  6 Jun 2025 03:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knWAdjF7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C78F14F98;
	Fri,  6 Jun 2025 03:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179120; cv=none; b=o5xVcPuy5+CCFeGCrYLFbiIWQ4dIeCR//acoBHZZqdoTAbnkSdnAU4fRpkcGJ7Zqzh9EzHfs/DHzu23yMmwgBF3yjppUxhXtPYRWOS9S5RHF/MHSo3HbIHsOCS4mcVaQA5Hpkkf6hVI3d5HigoWfM2qL3+puoyCyuCpj+OiLxqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179120; c=relaxed/simple;
	bh=qvxfTohsQcakb1JOVyty8LHhkWl895U5JULIp9uIpAM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DHWzNwqHudowEcCkbLxzbu7Gj+ApHOPgFBbbuCMnjzDV4NaLJdEWEX9Umsh8yRjAC3Y2qVDyUHa9WwwmZ+kL8QOZYl7WJ26x1JhWkPtc5DOD4WybHoV7CLBvwuGZH7QVPMTuikuPSPZJlILJ8Gl6eC3VxrKnlndXM7Ph8L0nb2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knWAdjF7; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c27df0daso1656784b3a.1;
        Thu, 05 Jun 2025 20:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749179118; x=1749783918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/2WAUKpAG8ell30qVj88kLBNlacicp6gf1yYc6ekd0=;
        b=knWAdjF7ib8GK9FEx691VBBn2pUMRwC/oZB+QIFTKhGzpNE7asvFnyugGl6uLqtORJ
         ffmlqNKhyhQSpI1u17JanvnELaRgwIyH4/LD9VHFCXluqcOOfsgGmZRTaTNw368Rxu6I
         16Y54YsXiMvHNdBz52wvE0JcSr5KBNY8AsmWfPwTy3IKR31uhyZSKWvmY4GaRfIs+7gd
         2tasK9uMKLEwn7Slg24qzLyVD5k5Bc2H36Lh+J3Vjq0riIJYCKoPJVwMgtTN5foOppSs
         KoACmMYk8cy3NtcMy6GmiQvh+SjC4ZqKCxHOfAXtGrk9NaQhcpqVwsF35vbvUOHHMSdl
         9mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749179118; x=1749783918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/2WAUKpAG8ell30qVj88kLBNlacicp6gf1yYc6ekd0=;
        b=awu2c7m/UR8jaZd+8E2ajwO/i2l/3u1H3Q8daq+2lk6YV/lTmffDWNlL3slLrwYjPI
         q9tpr5/Dig4CbphmBsjnW7ycYr78TCtIiDiIQglJF8U6l74EJzx4C+DZuzSBsrgki1ey
         0qCPr0i56bBmgg+vvNeW7lBDBiGOkUzGAhSHOzGBvK2NdhiJt8ps8MfF/wFtYFsX0X5i
         wjLDC5wiwlYUYa9c7LNBTyIwdsl/IGOwA6LiKflVUCzm6S86a/dKjrjzffJmUoy6hzPK
         ZMPjhmDWyhzzT4UKvdu9971LeBWdZ3JY5Cp4hE2rD5eTXsf/u0ZBmGgbWds7qqzNVder
         zLdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU086O/uuiZ9NHVH6T1tKmVXAy0DkQpleynBnGMP9XYPNapuCXYwzAdLBPOsXGuEZs4kkT8WIZC@vger.kernel.org, AJvYcCUWETFAD51BTAFpaMO52dTc64yEw1wZ9O+6uDkRNQtFYCZhVNQSoKOev+zQHDO5upWhPW+3k5BLGwJbiNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwargGceC2BQzxjzH94LmFhc+OwB3bUAcxsGM4vSs4xqZqKCfGq
	1yxdb2wvehZpHD14zPYy8TcOIECW1NN6a6P69bZTaAEkuTFxg7r9HIpB
X-Gm-Gg: ASbGncuwjM6J61E9KZyjKYN8XK8KXR79HtLBZnf7Y4O7tPXYqUePdoPxlJS3I6hyYrN
	CsGfaJoZaVjIj6lNNqvj09kWiLxogBuwkPc/1ZtaPs7HChSNk6vXpA2/C5MXSU8l9oAhH56lBGH
	rLJaYUjwZrEWq0HMUNfzg+BrpTT0NBkycSQMHSzSD3zPTsJAjfxlyWsCan3AiYc+nTa5VeectJm
	ls8TGP1E/MfLuU/tffvqkXJDONeIgNsK5/QJ+hJH5CClnQdAuliKI1l0mc9XtTyx15o99SCJXcZ
	hdkCXmMXcU9ufJUyJ03n/FCBJZhKSX2ZHRznK30nBfmc7HAviNz+GFsMQDoOVHqIjCwpvAFMomE
	wBw==
X-Google-Smtp-Source: AGHT+IEevhfR4kZLewqgPQkOOJ3rbgAG83iZSMjkBdMA2R41iU+N7gZPtZFk4A9IQWIJQrVxQTVJqg==
X-Received: by 2002:a05:6a21:600b:b0:1f5:64a4:aeac with SMTP id adf61e73a8af0-21ee25e02fcmr2177323637.33.1749179117554;
        Thu, 05 Jun 2025 20:05:17 -0700 (PDT)
Received: from localhost.localdomain ([124.127.236.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d36sm350696b3a.157.2025.06.05.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 20:05:17 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: rainshadow-cec: fix TOCTOU race condition in rain_interrupt()
Date: Fri,  6 Jun 2025 03:04:59 +0000
Message-Id: <20250606030459.487276-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the interrupt handler rain_interrupt(), the buffer full check on
rain->buf_len is performed before acquiring rain->buf_lock. This
creates a Time-of-Check to Time-of-Use (TOCTOU) race condition, as
rain->buf_len is concurrently accessed and modified in the work
handler rain_irq_work_handler() under the same lock.

Multiple interrupt invocations can race, with each reading buf_len
before it becomes full and then proceeding. This can lead to both
interrupts attempting to write to the buffer, incrementing buf_len
beyond its capacity (DATA_SIZE) and causing a buffer overflow.

Fix this bug by moving the spin_lock() to before the buffer full
check. This ensures that the check and the subsequent buffer modification
are performed atomically, preventing the race condition. An corresponding
spin_unlock() is added to the overflow path to correctly release the
lock.

This possible bug was found by an experimental static analysis tool
developed by our team.

Fixes: 0f314f6c2e77 ("[media] rainshadow-cec: new RainShadow Tech HDMI CEC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/media/cec/usb/rainshadow/rainshadow-cec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/usb/rainshadow/rainshadow-cec.c b/drivers/media/cec/usb/rainshadow/rainshadow-cec.c
index ee870ea1a886..6f8d6797c614 100644
--- a/drivers/media/cec/usb/rainshadow/rainshadow-cec.c
+++ b/drivers/media/cec/usb/rainshadow/rainshadow-cec.c
@@ -171,11 +171,12 @@ static irqreturn_t rain_interrupt(struct serio *serio, unsigned char data,
 {
 	struct rain *rain = serio_get_drvdata(serio);
 
+	spin_lock(&rain->buf_lock);
 	if (rain->buf_len == DATA_SIZE) {
+		spin_unlock(&rain->buf_lock);
 		dev_warn_once(rain->dev, "buffer overflow\n");
 		return IRQ_HANDLED;
 	}
-	spin_lock(&rain->buf_lock);
 	rain->buf_len++;
 	rain->buf[rain->buf_wr_idx] = data;
 	rain->buf_wr_idx = (rain->buf_wr_idx + 1) & 0xff;
-- 
2.25.1


