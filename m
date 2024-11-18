Return-Path: <linux-media+bounces-21549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E77849D16F4
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 18:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2067FB28984
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 17:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A84A1C1F34;
	Mon, 18 Nov 2024 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xh+9nKA5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E86C1BF7E0
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731950218; cv=none; b=eTm9o1DFTM1rktcYMCZRC5K0Z8JEUA8eyJBPe0HEaLboyLDwvugkT/GPvzEWsjYc9S70A+kJlY3QPLwoSC/4szWDEfJPLiLux119gFnsU/CnIri+eRAcPix01DZg/4dXM10edBxhv6IgzVNLmgyFg7uyFDB6sAXJc3zfTd5VfKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731950218; c=relaxed/simple;
	bh=CWDBNXH4jHoe58BC2k4dunSk0tlK38O1mGHvoIYY04o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g0YaM/9rWDqCE+EUh5u2zRJY7u3g6U27V4fm8OKkc2/KpM2CkdY89AqIcfvEho7TCXWd/j++yL3oYlTKsFZxMMqHoOkBqnqEfUxeFicAihLxC5rxLNxnpM/bFxJ+j1Km6zfshe2/v3QZ2T/J8yODY2+xt6Ocr4r3fwukPonRdNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xh+9nKA5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-462d8b29c14so113721cf.1
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 09:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731950216; x=1732555016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0s+PWv/U6gq3vAzVYG7RCYvqQjttSAdHzrpbiuMrdnc=;
        b=Xh+9nKA5y8a4lqYh5gOOD9nBvqPXrdM41wXbg/+3zvOmd9vPxvHsSTtm6QYKoE3y4o
         /2IxWOdXKUWhXWI8XOeEHj/kadQl0bcjL5ZH2olTXRiIciMrmSIL7JAm/6IOj5BuIP9F
         3lwrVwlhilRcWKkYx3yuL1TRt8ZFl+5BRf7a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950216; x=1732555016;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s+PWv/U6gq3vAzVYG7RCYvqQjttSAdHzrpbiuMrdnc=;
        b=IAZYtXCk93Ja6tnYZ8oUtiGyKYecYdRarmnpee1WXkXvhzvK0C+xXFqcC9lRoYxqS7
         1VYMe3qSy7OPEIgxEpCjTa9YsEEK/yF+GZPtgK0d9PIHlZT2qmomDOvOP43FYjL3PJll
         qxPNtgXyg94MYw+7GD54QFwXJZ4W3wMIsYq2bm4OC8QpDZbeS4zftHMEjoy9b1oMIwFd
         cJAaCd4il/Gelf8JqnCxCQj0RPQEllE6JQHnAMQezP/0Q/AbSdDffJefYeTE0nkGCmXX
         P72bwMrnUX1smb8WwMTUrkYW60n73TYlNiv+kl6zhDLpWQ7BMCgdXo4GWIlhDUB99F8z
         v4RA==
X-Gm-Message-State: AOJu0YwoufFaGO4PMVbNrDt44Ea/HpLmUbjAFX4Ar9MNNvFikJ0VTxHV
	xf8/F7/n3k+TCL0jP+htS30iQYmpD39+FsEq4Xjdl94btYEq9QuCAkGm1KIu0g==
X-Google-Smtp-Source: AGHT+IHqgkd9XhI7qGK0AYrkAcHwNlnyYa8PS3ajRxlfV91tztrB7ZusaTQmOAPXjHz6X28n8xkdqw==
X-Received: by 2002:a05:6214:f07:b0:6d4:a29:dd46 with SMTP id 6a1803df08f44-6d40a29eaa2mr168899606d6.26.1731950216066;
        Mon, 18 Nov 2024 09:16:56 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dd733c3sm38255246d6.97.2024.11.18.09.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:16:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/2] media: uvcvideo: Support partial control reads and
 minor changes
Date: Mon, 18 Nov 2024 17:16:50 +0000
Message-Id: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ2O2cC/32MQQ6CMBAAv0L2bE1bigFP/sN4KO0Cmwg1W2k0h
 L9bOJrocSaZWSAiE0Y4FwswJooUpgzloQA32KlHQT4zaKmNkrIWc3KC0fo7xih02TVt7ayXbQk
 5eTB29Np311vmgeIz8Hu/J7XZH6OkhBTSaOtMVavOmIsbOIw0j8fAPWyvpP/1eu994ytlEavTV
 7+u6wfDjnjQ6wAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Some cameras do not return all the bytes requested from a control
if it can fit in less bytes. Eg: returning 0xab instead of 0x00ab.
Support these devices.

Also, now that we are at it, improve uvc_query_ctrl() logging.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Improve documentation.
- Do not change return sequence.
- Use dev_ratelimit and dev_warn_once
- Link to v2: https://lore.kernel.org/r/20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org

Changes in v2:
- Rewrite error handling (Thanks Sakari)
- Discard 2/3. It is not needed after rewriting the error handling.
- Link to v1: https://lore.kernel.org/r/20241008-uvc-readless-v1-0-042ac4581f44@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Support partial control reads
      media: uvcvideo: Add more logging to uvc_query_ctrl()

 drivers/media/usb/uvc/uvc_video.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241008-uvc-readless-23f9b8cad0b3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


