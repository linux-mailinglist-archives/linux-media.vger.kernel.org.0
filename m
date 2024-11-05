Return-Path: <linux-media+bounces-20935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A499BCEAA
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D50D81C220D8
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBA81D9675;
	Tue,  5 Nov 2024 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JkP0BmgD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519761D89F3
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815573; cv=none; b=N3vfYSXOfcK72y77XOIk10qkJNnR2LmEqx7XDeTheUVMStXxb8ygseK2eUYFZUu2NvyH1wNUqPR6FV1lH+fpCYtJ8MJQ4vdJ2eEhmW3dzyQQQyoNNeqiLsg95UKfyPo/pBiFTLON4GDxZuce+dg5CLoq7d0B+4p3ew+0M+dtTXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815573; c=relaxed/simple;
	bh=RyosKProBqD7GdBDeEWWMCeaBTC4J/TV8BuDGgi07uM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=imSSXjS80c/EaApnnzIfoAEsUo5zjNhOl3Fwh1E1ePwlyJ9AcBrDq4i3wJkR/yWxIVtG/RQth3aj13M+ySu9exQeVt4yOtID2qYshbLj2D3eZV6/sdcDywkeX8ncbJ4smTiJmGjgNGDC5IefqUb7NLv283LaM6cXVSLlDl2N6mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JkP0BmgD; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b154f71885so443675585a.0
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 06:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730815569; x=1731420369; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=To1pY+0ejhgy7bPxablm79ffBSWqRzm24XAQuXWVHHs=;
        b=JkP0BmgD1PZ8IMhd6Sx3CK3IsiLVFu5sksFlVh5lkTI2kzXCLwF4D3S0G9QVrawKNf
         PZ4keKMpVOpCnoA3ZZxetcotMimLp0z+7FD+fO3lW73okyHUHn4hRL+Ht49YcNFP+Adm
         mKiW3als/mgXxcy/n9ZGJTulnOHwQu/2DPDyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815569; x=1731420369;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=To1pY+0ejhgy7bPxablm79ffBSWqRzm24XAQuXWVHHs=;
        b=qYg5Q3YnI1HWsGKjTfZ1DrrXeTZMMlBzpQIrwjOSj6MGr/2AMBHzDY2qLPSelT1515
         nigYSgrxOHOTypyS3AGrkU0j2BZeVqDZkCmkVnua4Q9FHMC2d7zg1UpSruNwSFMEluC2
         CUUhj729bRakWc9txDVxtpZ5PqW7MwUdA9Xv5sBCBcoaPtVgW6vmMZqyuRMYoF5LZHbO
         PYj8evetz1wvGdUsIy0grO0wJnf7BCr+Yfe5V3PgBEK7JuDYYctRqWFMOO8wzdqJGkic
         cEDuZpy42orA9tMfcYSaFYUufsu9tP87kg3rP6oS0fKIMIr1lN/zesUVc956Ew9vYVzk
         4UoA==
X-Forwarded-Encrypted: i=1; AJvYcCWDJ1PH7ktRhyPPEcnYUc2QrrHwxePMx/qBtTGeqNTAW+KdwpVped4yOoWJAUTrVaQuXbi1H3gDbqBO9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB1vMwuB5o9LcKOd6HjxgtLxvscBMUb2H4DU2DamqwuTTy5owF
	PM9T6wOpzhOdZJmdaZwguF/i3+gdALXe177dxAC3aCA7ARNUTYA2wWIg6lAWHQ==
X-Google-Smtp-Source: AGHT+IGvzADAlPGIc8XPrDiCAfG0jFnnvTAwT4/O8VMAFu7gzQBezviOLrZFmd9PU3FVWJ4iwBD/fA==
X-Received: by 2002:a05:620a:190f:b0:7b1:ab32:b719 with SMTP id af79cd13be357-7b2fb98a15cmr2053691385a.38.1730815569232;
        Tue, 05 Nov 2024 06:06:09 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a816afsm520422185a.101.2024.11.05.06.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:06:08 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/2] uvc: Fix OOPs after rmmod if gpio unit is used
Date: Tue, 05 Nov 2024 14:06:05 +0000
Message-Id: <20241105-uvc-crashrmmod-v4-0-410e548f097a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0mKmcC/33MSw7CIBSF4a00jMVweSmO3IdxUOG2ZdBiwBJN0
 71LOzHxNfxPcr6JJIweEzlUE4mYffJhKCE3FbFdPbRIvStNOOMSmAA6ZkttrFMX+z44qrV2KBp
 rQAIpp2vExt9X8HQu3fl0C/Gx+hmW9SeVgQJlyjSojLgA6qPtYuj92G9DbMmiZf4SgKkPgRdBy
 Z1FXWujOX4RxH9BFMEyo4zdG6adeBPmeX4Cx7HdiDMBAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.13.0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v4: Thanks Laurent.
- Remove refcounted cleaup to support devres.
- Link to v3: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v3-1-c0959c8906d3@chromium.org

Changes in v3: Thanks Sakari.
- Rename variable to initialized.
- Other CodeStyle.
- Link to v2: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org

Changes in v2: Thanks to Laurent.
- The main structure is not allocated with devres so there is a small
  period of time where we can get an irq with the structure free. Do not
  use devres for the IRQ.
- Link to v1: https://lore.kernel.org/r/20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Remove refcounted cleanup
      media: uvcvideo: Fix crash during unbind if gpio unit is in use

 drivers/media/usb/uvc/uvc_driver.c | 30 ++++++++----------------------
 drivers/media/usb/uvc/uvcvideo.h   |  1 -
 2 files changed, 8 insertions(+), 23 deletions(-)
---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241031-uvc-crashrmmod-666de3fc9141

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


