Return-Path: <linux-media+bounces-29356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D7CA7B183
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 23:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D4FF3B6A93
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 21:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED791FBE88;
	Thu,  3 Apr 2025 21:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RBoMnZZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFEF1C6FE2
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715892; cv=none; b=LXcOv8sTEVLZQ1+J5DgcgMi8hUcguFaw9/gZZYCuofvqDyhOx55DlP9C1G13w2fgJAuHZ9KCORYd2G45xbWM/GC5hSBF/uBZL5LPi9PamYRtZpGCyouyf2Lof3jjENqAhYWYboalLABZAsKnJQVAkp18/w617MEN6PvZOEbcN1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715892; c=relaxed/simple;
	bh=A+EYzZLGQHIPJ5VAoM/+3fe53Af6CgodqviiAM/ONBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VciQv3y5vwQKXM9tG1qOqHp4qRUJIZAskqkL8TBhorCNs2u/DjFzX674RgUHP8IlgdZcdYXJOYd42dz62qTi7nhGMaGI2fYC5mlcx5MGnT4ZP3h+G4Yi6v3aRANQQ6FBghF4u9917BurFCJRpH4K05DiFmryB0AkpAcBNjaK3pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RBoMnZZ0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54af20849adso1313969e87.1
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 14:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743715888; x=1744320688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAivlvh8Vrg1UGAUIkAMwQONWXUXc2TvgNk5knB4y0c=;
        b=RBoMnZZ0u/tUHLRK1bssySq5ikkgvf1ls37o0ILNW6qzkgKJCfIy5m1T8mjrpJotE3
         NavUwfK9degbloOOuf+jGgb+wbLb9w0pv7k9ZBX7JMIRwDaB1GjU6gxaIXe38C1uKe2/
         wLdxWcH0EJkncsJ5361zJfhfTtmF3J806HAqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715888; x=1744320688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAivlvh8Vrg1UGAUIkAMwQONWXUXc2TvgNk5knB4y0c=;
        b=vYe9d7au8AaEz4+N6HQmtDsHTJi0rLB48slWqIsNRDSngNNVrDJYoPKxXP5uxpGvQ7
         ZoYwbV3C9AyGrr/grpcSPE220SgeKXsU2pPDz9EXLtJ+P0TDd9e3DYNj6SJ1Hy5ORD2z
         +dJsFIhg1YILioHGVklsufhPUdXFBKFJn8ZcMvhAabJ3BLCYvlPgY8CtjyzgvZShC0dg
         /tuowV/mwxN89Oba4Z20fTA63JvCsghJcSUiUWROtJHZAlFph+Xp6G5nqK3gW3+b7cvF
         +AsBIDFrvEvYoHx+A820WpLR4rYv4GcrfvoeoMWI6TouNQTZoZacjTzwrYYD18hhLDIo
         i2aQ==
X-Gm-Message-State: AOJu0YxkwILPnVlMZUPmz4mz2WeD1Qu6fG0Gi+MPUPKpslMYzzXL6deN
	srRna+yZtK+5CRuojQZSsw+8lgBw5FG84rlZQFhTZpVHLbRjuwA+c674mxFRKA==
X-Gm-Gg: ASbGncuIN47erUkYMniNoCOZ5gxR9SSUjOY76Afe1WHHcj37513KCTAQ8Lb0Z4wRzwM
	jptrhdJHrwzpXhMLfrnFoffFICCs8FqbrtyWpD4PUtM8u4YoXedlagh1//qrVCVB5eVZwtLz7lV
	4n4HPOtX5T9KNCQvQkMdyC8tZ34ysUf/NwGYP/4HIiJpfWZr2hTHaCSNS5N4Zxyd0SZv1xLWsQm
	yK+Med3CzmALK+azp9q6gMuZ5PI5S3EjbqNKTThIkbkmnXQfYaoX3TL7gBSbkRSWiJ28w7D3GxX
	LFAiZbStlpa8vjDrVyukUPt8giZP1H/RNQQ53LI7dxHANIEvjQ0vmuCqBJgCWub2cO3FThjLyoh
	0pJMrHD+FLx51E047rdyp59DqMPbzPeQ5uMQ=
X-Google-Smtp-Source: AGHT+IEgkYZflIY62I3D0j+z07leuEa6xOn//asxpOiQ1NhbRMdh9wxzWYxoJvi7ZlfsK+HV44q73A==
X-Received: by 2002:a05:6512:2c88:b0:549:981a:1eeb with SMTP id 2adb3069b0e04-54c1ca56dd5mr1924310e87.5.1743715888535;
        Thu, 03 Apr 2025 14:31:28 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm252938e87.181.2025.04.03.14.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:31:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 21:31:25 +0000
Subject: [PATCH v4 2/4] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-meta-v4-2-877aa6475975@chromium.org>
References: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
In-Reply-To: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
+        never copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.49.0.504.g3bcea36a83-goog


