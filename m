Return-Path: <linux-media+bounces-23729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE09F6F9A
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0654E16A453
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2964C1FD795;
	Wed, 18 Dec 2024 21:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a+g/Yjoc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BA21991AA
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557967; cv=none; b=ju3WCaJTwLoNm2Idb4SgtgypucgGDeoC8awlVvC6AKaFJPwLrlJ3QnW6nXlgwbWySQBRo9Ix6Wgf9sSrSOzAqO7+A67LmyEQ6yqsDkvxxdjRpdD+rx5W6rrtGY0k+0IKpa2IZmcC2Jg5behiaLNRw9YnBFMK/HqsfLk5lxpmpN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557967; c=relaxed/simple;
	bh=ovGL43GA2TA7f8iGu3llF9qcIaAag6b3bHE5/J7YJhQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YAeDNPQYOfpXugm/iL2nGXhW6dIiy/FMBGKoyDQtUssbFOXuKAby+kgQU+aKpuc/goIERxn86IpWEMB4D7kQcfXKpuGLwLbrLIkKewGwEZZK4xPWkqULasxm17AHMO9kzbmtfrRs47st1ovQGjjqvZaHIjTMCcDErCKfHyJxS8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a+g/Yjoc; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4678cce3d60so522021cf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734557964; x=1735162764; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=br8Bv9q1cxRW36QvBLyR0gDNv/s7am5AykRZhGztYPY=;
        b=a+g/Yjocv5aHSWYYyLwmhrj4jL9dKZwh3rN7alRny7Vk/4L35bcVgjXPIhiPVKoL3q
         37O5VOHQpFAvLZj01zS2qhMw4QE6EOGfN+nu7csuoK+DFKlq2FPfBQwJVdzO9lVh2ZfW
         zIRb21xKLc8lkTwfzAEmtzTH/dpzlnqFCG1DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734557964; x=1735162764;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=br8Bv9q1cxRW36QvBLyR0gDNv/s7am5AykRZhGztYPY=;
        b=nWn6vBuFNlbF/qP8W6P4EKWiyXw4e7C0x2aTmM0ESTR0T617pdExWF7TavT51jcFWD
         vYqJWnicLVhZ96Ly7ps6k8OpCpysZzMXU4c5/4CScWGS4bWwUkZfrRAyRRcSeP2cSKfS
         lM5SxX53RxTRwJ5ltSlbl9zmEKIetRcp/2IsRu2CL6PYlgVf7elTXAvvFP2/8SRWwjMT
         bzCEW5Dz95A9ZE0QySwwMfHmu4XO7QXPcjJ5fTobF9HZeYJs8yQ+PeE5XrfjmOyf6aeV
         GASJmCFkneKMFYkISpyxHyAtVK4x9wrKcpoXjycu9eUuH5Vub8cR5V3JoIa3ZlRsDyIt
         jpaQ==
X-Gm-Message-State: AOJu0YxtEDy6dQUvRKAR/k9lqJcDZckvXC6AWWCYnIQUHZuN2r5JFokm
	TXwX3oefTaku3G2YE27B3qsYf150xaH+/V7civYT5Zeub5gJh6UFcCYTQW6bK0ZL0z61ybVyI44
	=
X-Gm-Gg: ASbGncvR5Tp5kK63NNWDmObiY8WL/g7B5SWz8tEa8qTsZbjNVNCXEpTkAAuJfu3yGqj
	mRymABNBpPnlSvrDIldpym17KWg0imcLZb3fpOeKUnpW9rIEk0aV9ZcaSLI7qHYX4Hox8NfkQS7
	vloG+WyrHglJ5BVluHKyWAjgRlm3zrbtTK9dfZnXvPjbNbTUNVs/3NLPVMLw9HrpnPw7o1Ugx0C
	8svSRoxbGcahoJqQOHtD9S/OEctBmZDEKkaeTETLcxNQCqSNv6a4DVb8zqL1Hf/ntjSLjLPwzM0
	yyVZKu9BCMFvHt0C9zMJHuzxb2DY8F0=
X-Google-Smtp-Source: AGHT+IEE4JjuzMP+nicf2pU57PjFGZS6TvVSD65mXxZL6Fd1jDaRCMmgQKxkosVMezLIqQEI0IWkfg==
X-Received: by 2002:ac8:5710:0:b0:467:62ab:6ec5 with SMTP id d75a77b69052e-46908deba22mr60831181cf.19.1734557964568;
        Wed, 18 Dec 2024 13:39:24 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c6e312sm55176651cf.8.2024.12.18.13.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:39:23 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/4] media: uvcvideo: Prepare deprecation of nodrop
Date: Wed, 18 Dec 2024 21:39:07 +0000
Message-Id: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtAY2cC/3WMyw6DIBAAf8XsuTSy1kd68j8aDxQW2YPSgJI2h
 n8v9d7jTDJzQKTAFOFeHRAocWS/FsBLBdqpdSbBpjBgjTeJshd70sLQK5BWGwn7NB3iYJUkhNI
 Ub/l9/h5TYcdx8+Fz7pP82X+nJEUt2t40bWO7wQ521C74hffl6sMMU875C4ohc4mtAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We intend to deprecate the nodrop parameter in the future and adopt the
default behaviour of the other media drivers: return buffers with an error
to userspace with V4L2_BUF_FLAG_ERROR set in v4l2_buffer.flags.

Make the first step in the deprecation by changing the default value of
the parameter and printing an error message when the value is changed.

While implementing this change, Hans found an error in
uvc_queue_buffer_complete(). This series also fix it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Improve cover letter wording.
- Add new patch to fix vb2_buffer_done()
- Link to v1: https://lore.kernel.org/r/20241217-uvc-deprecate-v1-0-57d353f68f8f@chromium.org

---
Ricardo Ribalda (4):
      media: uvcvideo: Propagate buf->error to userspace
      media: uvcvideo: Invert default value for nodrop module param
      media: uvcvideo: Allow changing noparam on the fly
      media: uvcvideo: Announce the user our deprecation intentions

 drivers/media/usb/uvc/uvc_driver.c | 23 ++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_queue.c  |  9 ++++-----
 drivers/media/usb/uvc/uvcvideo.h   |  4 +---
 3 files changed, 25 insertions(+), 11 deletions(-)
---
base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
change-id: 20241217-uvc-deprecate-fbd6228fa1e2

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


