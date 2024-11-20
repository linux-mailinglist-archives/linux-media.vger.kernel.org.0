Return-Path: <linux-media+bounces-21688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E3B9D421F
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 19:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE4EBB275EA
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 18:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18E41A3AB1;
	Wed, 20 Nov 2024 18:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bjR1G1CX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4320B22
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732127942; cv=none; b=CmokQhNk8CG9adSwMVe7ygaGstvmkFFLwdQtWjjEMRvDvBb+lw90oLyL7T0y6qbsTGZiMvLgSVxFUMV4iZ6n33hGBU2tGk3foTrUD1RL5D9XH+Z94AqNclFtMAgnA8Nw+P5gL0ayyywCIJSXP36CEf88WlAfrumxjdPygMJ70Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732127942; c=relaxed/simple;
	bh=QeDBIVHuOGMblO1UIWOxOngSxKs+eCTiQlf9IdAf++4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rWBEPDv7R5hmx/itfL2gCZ7MGuwx4QjwUqZF9jppTeWANPPDrHoARgo+TcYQCW7bnWShv3xEwIEoh2a6sA3Z6OygmcX+AyC7MoFogUp4o4o07D+g4ObwdFGwrJBl6dnrh1K6Mlw3fxAr+nmtrqjDwTPnBY1Sqw++VO0C2MfNoaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bjR1G1CX; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d413def36cso782706d6.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 10:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732127939; x=1732732739; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVwrAPYMZRjuitxtH9oibqkfBiJx/geQMXjioTeGHDk=;
        b=bjR1G1CX999Az/+317KtnVS16McHGSq49or8KlijUKf7nNvk854SOTN4F1aMfpsCgl
         DR4ts6XMFbYC7LnMO6d+tbT6xsMs+HMLdpLPQ3srrBcvoHXQZnId19GG/UwJKJ2EOEHk
         1xV96OS3nZbQpGcbbu7z7q9/EuIbUEY6worrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732127939; x=1732732739;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVwrAPYMZRjuitxtH9oibqkfBiJx/geQMXjioTeGHDk=;
        b=WFNMM114A3RbhBW29jvvXjUH86bbYvMUQecjEXJ6SJLYcPtUBPFpatx6h+wirSf4mX
         EwA/cuuw6mCetRqAE52e3JZWnT5MROd5smVIyzQMTUl0ODrouz89MIw811+C4yc5umND
         emrb/iJbdPDOcsZIawMVG4nqwlgW8/gu0gLfjfcUeH4pqWVJgoykc6EFBnCTNiglYKC0
         5b+m8qOpKTyaTPgLKS2sz6aiKSN/5Vbvnh7C+8bOj5PGNSEF7OxTPAFmVG++wZc7RXxr
         3HcAZ+M8sSMQNFqAjoUtF0mOt2fkLr5kcjoQf5PqK77GoljcMdAYGTbJVPhwzVozKE0F
         yNKw==
X-Forwarded-Encrypted: i=1; AJvYcCVhyn/ecGr9Vqm4T22z9duA4HmDD+oiZamy861pvM0bN6rrcS9tdv3CHa72/vjxeZLqpVfanNXLnpsazg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDVNICAYEnVwQlwq2Y5SIywuokNwFbGp7P77XHmBsOlUSNtaE/
	ag914Mp2usQPIG1aeWYzbAMDkzAfc3J8huCvlAc2QzVRzmHiIB4zvPzjBEnhRQ==
X-Gm-Gg: ASbGncvE6e7MFxEISkUIDSoj01KT2NmdRxKEHttkpPifEXsys+zLnIvAG3UKpgIzaGb
	yLczNs8G/ZHWiGhkHqgWfjNxclBXgMFAzQTSOLC9ML4LZtzljuRtfdflbh5dGJKs4gcH01pK9hZ
	vQjJJ2heDhUNEF16quG9DCLdyH9jtigiP/MitPhETQw+tIL8bT1sQQgqL0KxJs2kb2xcEIolc5p
	6Vy2+CRMwl+IAMG2wGfr0Oike524ykcHSGxX1ohX19H+FMoxwSJKw1F+KkcKfxLUHyuaoMN+0/3
	KA2IeeS6kXYbT6dyogvKFBWC
X-Google-Smtp-Source: AGHT+IF+QZTpyLW8d1NpORvXNgjuO5GMKc9gmAP5g4IJKp4AOFTS0Gfe6hgUIetO95y35QBxOj+pNg==
X-Received: by 2002:ad4:5dcb:0:b0:6cb:cda0:df6 with SMTP id 6a1803df08f44-6d4377b361dmr37760936d6.3.1732127939607;
        Wed, 20 Nov 2024 10:38:59 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4380dab74sm13878036d6.48.2024.11.20.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 10:38:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 20 Nov 2024 18:38:58 +0000
Subject: [PATCH] media-ctl: Remove duplicated include
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-dupeheader-v1-1-9ce2873810b4@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMEsPmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMD3ZTSgtSM1MSU1CJdoxRLo5TUpDQLc1MLJaCGgqLUtMwKsGHRsbW
 1ANYKmshcAAAA
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The local file v4l2subdev.h seems to be included twice. And one of them
using <> instead of "".

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 utils/media-ctl/options.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
index 515d64e5..7ac7db99 100644
--- a/utils/media-ctl/options.c
+++ b/utils/media-ctl/options.c
@@ -28,7 +28,6 @@
 #include <string.h>
 #include <sys/ioctl.h>
 #include <unistd.h>
-#include <v4l2subdev.h>
 
 #include <linux/media.h>
 #include <linux/videodev2.h>

---
base-commit: 625e604c48fa3c4e9737fa1ec8e1d473a378ca9c
change-id: 20241120-dupeheader-2d92debf8758

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


