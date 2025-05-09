Return-Path: <linux-media+bounces-32164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B48DAB1C39
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71A281C022F8
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 18:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B150323E350;
	Fri,  9 May 2025 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SzNumrrV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B1F23CEF8
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 18:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815058; cv=none; b=SozXM7SxE9TR/UsoucmVYxv5PYWLP903VQ6NVITs3WvXn1rMoYztFW64rPIKLb6XPf1u7i8mX6ecJUWLhK+OMSJPos8OYclhvYUUxtU003eU+c/YfEr9dPfYQ6oNm5tjwyUvGqhTsJiPFdCC4KDRZyv8opowolUAYFsM2MEAV8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815058; c=relaxed/simple;
	bh=IpC8RcuIwfI3OgkUggMtDbw2gxMgTV9yOOhSg3TjgCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L2X7/Q/vnGN+TZOCCheaIRc32vi5qEpDfZN7NVediSFDQyb0UrPFnHl5hg/TEYYfuMJrrW/0Upqt8cSX/kFQvNg4BkLLOWTJs/QG0VB9TxTYKGwfns8PKJth63tj23m1HdJ5w87BRlQw1Kdoa+urJXYnSy7uYQTjxK3vV5F8KWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SzNumrrV; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54fc61b3ccaso1718749e87.1
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 11:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815054; x=1747419854; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJrXUpzSNf4IvL3dxKR6foV/mhV+u8Bk+pi5m/OcRjs=;
        b=SzNumrrVfY1GiZFB9n6R3PO2eUkja6VHkV5Pfm58Fo6AABR8yOLtxx6iRJHh0r5e6e
         h0qmeYAwGwZiZBz73kqpL5tsCTYeTxGbKeZoMzzCl69p25F+odw/sii5+kZzK4ZVg4mT
         My4Vsy07FQZPOkSbXgBtC+YPpnlSSuh2oaudY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815054; x=1747419854;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJrXUpzSNf4IvL3dxKR6foV/mhV+u8Bk+pi5m/OcRjs=;
        b=YI3xwPzqny1+UZblE7s+Xi1e0pEcy00kOfgrhgAQy98AqzZIvR5zl2VgQH8AUtTLCb
         0EOhQtM8cvpJeuAqqSMJPU+9B/5J8Qs49e4b8PChSI/kzB0aboTy0wOYMZfnL30Lr2HC
         IS7wZzM0HLxd2KNOjBUWKxNxN+BYu7IriKqINnfBu0jW3Zzg8rQcHwkbw9XRR1p8Vsip
         uc960ASqHwauuwtHdieTZiBlyNsvqQDbqV03g+/ZYggnqzgYlCLT8Ns8pfRjcCgkjks/
         +Qjloy4wjBJf+U5P5g94yju/IUeGFQRqNblfOsDjLqE3zshd6Kn0JcdrQ4Uhyxxl9kA2
         d9VA==
X-Gm-Message-State: AOJu0YwjSz1RkQoASZPd6iWPtG7rHC1W67Kgfrma73qyxH6WIaj0x3A7
	+anfk/6hfBZ+h3623Wbgepiyn6KpjwMZtgOScd0Epl/R4yVPftgJoeOJ+RkXJX2nzmnATX6OvSA
	=
X-Gm-Gg: ASbGncuAtLyfHiShkNQsvm82hFY03TFvoypU2PI/NL3slBcGdttRwNejLHFCMKWz1Vu
	wel1XykqDPJ5SOHm1c2f9GenrlgagktyNH5gaVGF3pvQQjS3hH67fKMNy/8Y0SdXkYCW6+1PiJH
	1xlfHXoA71KYEgwSYXFNdEowDBOYmvHaBU1t87h6LXguWOxqnkT+y/xh3Tjz/eavXkQkjEQYVqG
	iP7HID5vZMWQkoiQyqq3AJ4VK7dM9YL12J0SKaJwEgLryAG9N+A4KftEqFZeYSq1IvKr39L9zQN
	J5lyzEyEu8tleubm8Hc4eTeBv6kya4JGmSKPMmJekVgQtvNHgSS6OnT7MhmLaHlOZDsdmi3/waU
	CKKErUovjb4EfTA+gu1nL4B7DY2CrqNA=
X-Google-Smtp-Source: AGHT+IE7cqsQ01lo17QS0S4hreD/9oqCB1/vySDaDuMTft6wOCgkf7LKFycNBCqGK9KqVZXTmtpnSQ==
X-Received: by 2002:a05:6512:3b99:b0:54f:c56a:5952 with SMTP id 2adb3069b0e04-54fc67ecf93mr1745638e87.52.1746815054138;
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] media: uvcvideo: Follow-up patches for
 next-media-uvc-20250509
Date: Fri, 09 May 2025 18:24:12 +0000
Message-Id: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAExIHmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwNL3dKyZN20/Jyc/PLSAt0US/O0NFMz45Q0S1MloJaCotS0zAqwcdG
 xtbUAicyfaF4AAAA=
X-Change-ID: 20250509-uvc-followup-d97ff563df95
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

CodeStyle and refactor patches after the last uvc Pull Request.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (4):
      media: uvcvideo: Refactor uvc_ctrl_set_handle()
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
      media: uvcvideo: Populate all errors in uvc_probe()

 drivers/media/usb/uvc/uvc_ctrl.c   | 65 ++++++++++++++++++++------------------
 drivers/media/usb/uvc/uvc_driver.c | 15 +++------
 drivers/media/usb/uvc/uvc_v4l2.c   | 28 ++++++++--------
 3 files changed, 52 insertions(+), 56 deletions(-)
---
base-commit: 3328eb4dfec23cb3055cda24087cd1cdee925676
change-id: 20250509-uvc-followup-d97ff563df95

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


