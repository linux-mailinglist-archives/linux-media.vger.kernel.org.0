Return-Path: <linux-media+bounces-12042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A388E8D101F
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 00:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4244FB21EFE
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 22:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CC0167278;
	Mon, 27 May 2024 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IKHAXosi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B74167DB4
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 22:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716848095; cv=none; b=lCgUjuSac9zXkShIRMjSk1ga+jqvkc5LwF7G864gEpBYqY3XOcRG85wNGwbFYBn0/syu5mBW1+ostoWCTEYdKwSwonFFShdSQmD5j30fZNCGlYRPhSQPL91uS0hpLqOahSSdE55/f0soH6C1P1TbpOMXqXOSxRLXPv2BuiMioS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716848095; c=relaxed/simple;
	bh=oppOayLgT4TipjNvWZtrKvu8Y0Yu4zuAeXfakAZELQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y5sPY+JieV92CAJq4cFCW0nj+G6dYSuEHzTDJGNwZ5rTD9g9XA53lENgMmnBs+G78XueALT418weDsr5EVSlxrVZXFmq1j2Yj02wGivwmeoJF4Wyfwmxe5WZB1RYfrO+yJHW0OMg7nUMUWWgkzC0vXOFOhW6KQGIc8zTYKMPGtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IKHAXosi; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-792ecce9522so13034385a.3
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 15:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716848093; x=1717452893; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8oMra6vlnGoklVAVPREy/doMlsD9Wu566bIjtVKUJEI=;
        b=IKHAXosigA+Yu4r81Qt+hM4rCY8aAYkDLoVpvJW6Fw5JruPpNwmoepisx/AT/sDNm1
         hS2e6dxPs69PKt7vfyybGnELk15uEUo5wzoR63vxRK2jdLDuSWMsTm5fYhZDLm9iP2na
         noCAPjfYAa0Hq7Y+WhF8nXdv7ibKFp+T713BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716848093; x=1717452893;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oMra6vlnGoklVAVPREy/doMlsD9Wu566bIjtVKUJEI=;
        b=U+fzyO6wdsU6Mecd7pu+Tn/SihQMqFTysGGDf0pw9qcKdeAHXn3jguJKNffLNqgHZY
         eSF8TXghmtz3AWQ/D/HVys761dWQFXv8fVJHDgA91OOYR4zpJP4NBYe4juHxPML/eyF+
         q71N2Ee/JgVLe11Bm3fm1LPdT9Hr75XPQ/zu4EesZftwXiZ2KQ9x4cTcimhTuZDYdQzE
         iylmp6rRqMGoppC+XTdi1GhoVgPIrm8ON0ZArJvZAOqGRTdgePYC/Z6szAWIMCXmhFy3
         7G2Bdx+sISye6cgASa4m5IRDswObYXueL1eGfu/ha5KZO2BYnLtmB5ydHNz3kHbUywuK
         kBDA==
X-Forwarded-Encrypted: i=1; AJvYcCWxYEGnYschbdoU6l1j2iGcYO4IOnF3A/Wnb3BPKUv7pYU/CpH0SoorPF9fzxAHgXIM7PAhNh4Pd4TeYskxp0zWRcIL6biPa08bMV0=
X-Gm-Message-State: AOJu0Ywd5mXaO4qQry+mdNFfCiQEiQxbEAXZmCudOdSQjSSmmSNKzV9H
	lI7QQEoTcWkekkNaAVXByU2fSLSig1RgTDHYa52wPnmUz3yrd8L8Vt7cL0jd6rpHqqS0eeDiKjo
	=
X-Google-Smtp-Source: AGHT+IGU37guyTfar/mOLUVh/av0TzmbcroyvLNiYEmJSXl4gLVRYr9flpLBq27+gEWeR+3KMFyHig==
X-Received: by 2002:a05:620a:1476:b0:793:d22:4509 with SMTP id af79cd13be357-794ab09c183mr1036442285a.17.1716848092986;
        Mon, 27 May 2024 15:14:52 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abca58e6sm329740885a.18.2024.05.27.15.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 15:14:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: ivtv: Fix smatch warnings
Date: Mon, 27 May 2024 22:14:44 +0000
Message-Id: <20240527-devm-itv-v1-0-f5829b8e7674@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQFVWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyNz3ZTUslzdzJIyXVMzc0MLc3PDxKSUVCWg8oKi1LTMCrBR0bG1tQC
 /vgYiWgAAAA==
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Linux v6.10r1 throws a couple of warnings, lets fix them:
https://linux-media.pages.freedesktop.org/-/media-staging/-/jobs/59203691/artifacts/junit/test-smatch.err.txt

And now that we are at it, replace some functions with the more modern
managed versions of them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: pci/ivtv: Replace ioremap with devm_ variants
      media: pci/ivtv: Replace request_mem_region with devm_ variant
      media: pci/ivtv: Use managed version of pci_enable_device

 drivers/media/pci/ivtv/ivtv-driver.c | 93 ++++++++++--------------------------
 1 file changed, 24 insertions(+), 69 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240527-devm-itv-56718771abde

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


