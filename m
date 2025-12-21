Return-Path: <linux-media+bounces-49266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC76CD435A
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 18:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85231300943D
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 17:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9D72F99AE;
	Sun, 21 Dec 2025 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mm/0frHC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F13A1DB
	for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766337363; cv=none; b=PuXeijbOs7h9//XxjXVQ96pXxgnfocBiqHNmVQaNZX6hdbZeUW2riCNIg5dlTPurXsGuTQiOVhfDXOpVFVewJL+4HXw00bJj70rp9cW/2A056kaMS15kkByqPT7+Hse3aueX3eElonvpEGtZaqIWvXlVCMJIJDrilZQqWBeO4og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766337363; c=relaxed/simple;
	bh=laqkOQStcAl+I4c5s3ym2wDYh0jYR46LDJd27hh652s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBMzuFgu4bLUc/BCoFIs3RBnbHshGr604yObms3gff7vr30B2d50+ULzslsPTfCe70E8WmtoBwrnr5LHUGjx8oLilasEswDJkVoFQg5C9qSLYtHX4hOhVa0p+awepgJgCQR6ddGEvu6YmvCriiqRYPnFCMmoG1wKywo+x1iGuEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mm/0frHC; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso4424749a12.3
        for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 09:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766337360; x=1766942160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XinSJrSvWSy//0PWBG637vnEFTJuBzhx/iavcQumeX0=;
        b=mm/0frHC+YyhiTHpCFB037LAtypTuHkIBLqe6qi+oci6F1kCKNdV1Au+1RVyOv/cz9
         9h2FS2xXlLMWRbCFwRu8k8Vs4NBS1fKNUkthmhI5tIcHq1Af9+Uk/CVwF96MK7IcGMau
         dFWs0Tv2Jzo8m94KdK5dKmcknW5yPr/A0U1QUG1No+Bc7/MUUIAcnfz1p/RX4OgqBn7a
         BpuqfJ2k7UsKvlaO3QANJJ80oR31tbJ78D0A6t9Vfxj7c52R/tGN2ZdRoVjb3aeSSy4Z
         oz8yyMfzfKYqaP4H4oVwPz6TyR174+BPTB6BOTBtzSVPPv1wpPmccf7aLGxwY/V9elfk
         uQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766337360; x=1766942160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XinSJrSvWSy//0PWBG637vnEFTJuBzhx/iavcQumeX0=;
        b=rRmqzQN1z4WSHdSqd4Rxiyfbi4suco/63Gt/929PnGvwDVLKdP3iaa3g9h3UNoTVCy
         kAKPnn8j5rH4IQz3kn42HvpZFMnuDIu5C4q/RFjhnEw5FPK5Ttc+jQSDqzpIL3faSreC
         xc7TWN3b4CeZTiI5b0dikOonA+NImo+k7pEotVuDbIX7srhb+/JOIrlieou1WSKzhEE0
         J2VDUu8P8vhRc8yNgskasG+/OUd3F8EPDIY9aGopyvvaLhx6tark8FjYsQctp8dylsCd
         ESPUriH09NZhhAbImfmKePWM7klqisGRMZsGKdNzyD+pgv81h/VWw3BIxWh9M/RvWZWP
         P5zw==
X-Forwarded-Encrypted: i=1; AJvYcCWsmpQ/00fsb+d5Sq40mYKwZDyN3aXBTuNjqJ+FbUE/aGKhnOcvnTyKEijUq/yLO1LCl+6CnxTSZuO7sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdxj/mXm9sPgNFfZm27ktiYPWqjjWOkXuKd/9R64EQWUiTghJP
	i5jOA6sRYz1XT9YSUQL+BrqG78xT3EujmqvShooVq1bQy64SPX+3BIev
X-Gm-Gg: AY/fxX5JMWTnWv5yCYWJ8Lq6TGmtZpDzr5SAwBtStVHakStmbo7zfCun5Ap//Xlxfr+
	BPikIAKv+yZI5VJMOOPUoQ8L5QV7A60TIx3TiQp5oEjI8P0GvZn1GUIdSXA4IKYGRGd8kSHPxck
	NO6Xg/AwDj7hkcUqxZ9YkGYLaBxvXtzOg/S2xUIdiHHjEA/qCrx3nqgMQJnwDNr0CPR9FZUrUtT
	YW1mbDXyA6rU99WVFAHnFFXc4YtuP2c8xzhZxi3WHJQJXPRGtU/QwSTaSTfWsO5pbTukfvszEP4
	WMlmSCyZLisxzpdS9shOdVLWZzDlq9AWssSIXWYfsucmibsIzEe7dKk09SzpFBLPSMgX58MV0I5
	ZiYA/X5jaRnbl9/weSLf5A52sqrWW69pr1NupWwJsPF/DlKDjyhZcdY4lIyCEeCXUZpwjsOmCBI
	s=
X-Google-Smtp-Source: AGHT+IG9CbfvM+V2HbAAeZgmRYURafysypR+NSMQlDu2eOP+EhFyYhcFRSV9MNSo4928nr9v7FqWZA==
X-Received: by 2002:a05:6402:2755:b0:64d:4894:774c with SMTP id 4fb4d7f45d1cf-64d48947a3emr1741329a12.7.1766337359773;
        Sun, 21 Dec 2025 09:15:59 -0800 (PST)
Received: from prometheus ([85.11.110.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056726sm7534266a12.10.2025.12.21.09.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 09:15:59 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Szymon Wilczek <swilczek.lx@gmail.com>,
	syzbot+e6a50a2e7cbb4f775d04@syzkaller.appspotmail.com
Subject: [PATCH] media: dtv5100: fix BOGUS control dir warning on 0-length reads
Date: Sun, 21 Dec 2025 18:15:42 +0100
Message-ID: <20251221171542.47748-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel's usb_submit_urb() validates that 0-length control transfers
use an OUT pipe, since there is no data stage direction to enforce.

The dtv5100 driver uses usb_rcvctrlpipe() (IN pipe) for all reads,
including 0-length ones (when rlen is 0). This triggers the 'BOGUS
control dir' warning in usb_submit_urb().

Fix this by using usb_sndctrlpipe() (OUT pipe) when rlen is 0,
satisfying the kernel's validation while maintaining correct protocol
behavior for Setup packets.

Reported-by: syzbot+e6a50a2e7cbb4f775d04@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e6a50a2e7cbb4f775d04
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
 drivers/media/usb/dvb-usb/dtv5100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dtv5100.c b/drivers/media/usb/dvb-usb/dtv5100.c
index c448e2ebda1a..a16406cc8db7 100644
--- a/drivers/media/usb/dvb-usb/dtv5100.c
+++ b/drivers/media/usb/dvb-usb/dtv5100.c
@@ -62,8 +62,8 @@ static int dtv5100_i2c_msg(struct dvb_usb_device *d, u8 addr,
 
 	memcpy(st->data, rbuf, rlen);
 	msleep(1); /* avoid I2C errors */
-	return usb_control_msg(d->udev, pipe, request,
-			       type, value, index, st->data, rlen,
+	return usb_control_msg(d->udev, rlen ? pipe : usb_sndctrlpipe(d->udev, 0),
+			       request, type, value, index, st->data, rlen,
 			       DTV5100_USB_TIMEOUT);
 }
 
-- 
2.52.0


