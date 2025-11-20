Return-Path: <linux-media+bounces-47450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F577C72F68
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7301F354EED
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39B72FBE1C;
	Thu, 20 Nov 2025 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2eIvjt0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E6243367
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628581; cv=none; b=SLK8ojJEqJB0cRI7PcyInbkbefQ1M82q1B+LH3fQQrNQ5Tf5e+oH/y4GEuTX1WTqaZaPb/1zfr6B68nnvGkntyuyP18Am1+Oi/l1HGorOxbTpXRYytmlkWqxe5bytDY4fYFASd5DYI5FupBLdrZBN+VByUusxka2gsfpTKsAgHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628581; c=relaxed/simple;
	bh=4mM2GpfLIzylgNbU9KtRG1wSkgEOvjoXfUvvDmHTslU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eA8ZRIW+JGM7saDiiYIlo8B3XylcULtx01M6d99sNgi3Kk17u9xlNuAWryt4N+emhLrjlDpL7gy06nvK5VpsEdmoNaJGRGKOdmBhmpR51lR5Bf0kIU9bncpHURGJGnl9Vh7C0J8AUSLhHCzlW0VjDZhPX9DJhdLp+lb9efPq84Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2eIvjt0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b8d99ad095so1188711b3a.0
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763628579; x=1764233379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a41ArcRl6ack4bK6bxq3hYqVYmWNJNLp1gqDnQHC/GY=;
        b=R2eIvjt0Zs9whK8F2ap6OCIaKSQ4BkCqx+0Mnt1AXApTOETPKpDzu5Oko2GPi5btQK
         jF+v8MkiAwAyMkWvdkATxllrxaag4rcJhY4Ehl2obC1T/J62TDZ/h9KD5c8zsXYi/jVe
         BM2qfF8JqwgY12XDvK+crrpCKzCbhbRtYSySdPOtldBz0J487RMNBjs9IBhJn3eDBmIW
         inAwC81XGUvg72UwQE1R/oLEGgvLzwqZ1VJ2dvQzL98YD65aaaMjl5kEVfJGg2byvPMm
         nXM5WDox/1U1pZbXAAJmmzxztnx4yjEtdK/7SOHIkN5rcnPzvT6tBXdQ5Jea4M35daaG
         7DkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628579; x=1764233379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a41ArcRl6ack4bK6bxq3hYqVYmWNJNLp1gqDnQHC/GY=;
        b=CbK3tn3eezeV5YauPBtZi/kwhdBZyT4/rcgMAKOTTqunn98iGK+TwLRpQvO69U3euQ
         MUBP880QrhNaVnvL6vcfMNOizhUY0yxgen7oUPSruS1STl7LW2senQMBgoR/GqnF6MgS
         srbwtW6KhWPbJPFN+WMzB/Z6K1a937QFb9SGDF1bPTxfWHvfjwK3+D3zMq3syKcE67ql
         ouU61huVT1cy4DFdzLsXOSLiGzHdLS3exftDRzy1s5V5A1n3d6vG2kxW048THE/0S/Qj
         ViKXXdGlQuEvu0Hfx+YBHh/M8O4A4rEEAKE/xUTKabW8oHWZfa3Q9LOsOnJa7luMoHKh
         ilfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7dn8yqQq/KKhIb4LtDPJpPu3sBL0VoBHLnhWH+UT2CCbz2oCV9csy4MKs9y5u1b4IfsQ3kjX2EfJvPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKV9VyPTPai8XuvwRhN+w8wNqOkQcGddPKfouoAwPF2nHRng6J
	8BcvddjSm4EKCkuCWVIqb/XOXhNaHNGJrPYvn47yZsgflH+dbzhYuFCt
X-Gm-Gg: ASbGnctElSr7l2wONMqdFItyQQKP9W7aFcGjq84Oc5O9Qdk2Yb6ANnD8cFYKwHNwRGG
	CRAmxGRwECExEMxbhdttPkjY552YSWu+idtFqx+pvaKJRaHC/9/BoDcSfMPeCHklBfKGwHXmYWw
	r7MeWcXLWDbCBr5dc6hruD4sL8re8XH65Nt9GAtEiV00ruw9SyfOufhIjLMY72qwgC5PuAO3Wxt
	zuqzwojBMa0rQ9rZPoC8lD9SMpSVTs6u8lZlPmVeHkVr+Ok+eql+KHklZZ823x626KnY9NpTeWp
	hsmeOMrYh1/SHUK5GwxOcjVyMeBAa5Ps1mZ6G7FVap/XKfcTObAwj6v7LXdk7f/Mgu8quImcCX8
	YbM6o3lzh1BpCjNyrwgq8pwAkmAyv5pUZzaaAEKPslmxtoXqSUQvnW3U25TN2rG854Qt5bvGEmB
	N+9rFH24YF8sRvz4b4qJlUeXXumJ9NkRHRL1ZANg==
X-Google-Smtp-Source: AGHT+IEw4IlmXgaj06zuZXcApeysmgnitXYUx18vPN+ktao/gpYACEbfJbSyBaOlGh1KwnZCvayoow==
X-Received: by 2002:a05:6a21:6d8a:b0:2b9:6b0b:66be with SMTP id adf61e73a8af0-3613e43b06emr2112532637.14.1763628579079;
        Thu, 20 Nov 2025 00:49:39 -0800 (PST)
Received: from opensource206.. ([157.50.102.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f023fba8sm1974900b3a.41.2025.11.20.00.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 00:49:38 -0800 (PST)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve pipeline support
Date: Thu, 20 Nov 2025 14:19:21 +0530
Message-ID: <20251120084926.18620-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series extends the vimc test driver with a new RGB/YUV input entity,
pipeline enhancements, and documentation updates.

Patch 1 adds an RGB/YUV input entity that can be used to simulate pipelines
starting after a real debayer stage.

Patch 2 adds V4L2_FIELD_ALTERNATE support to vimc-sensor, allowing it to
simulate interlaced sources.

Patch 3 extends the debayer to support multiple RGB output formats.

Patch 4 allows vimc-capture to accept custom bytesperline values so users can
exercise padded strides when testing the RGB/YUV path.

Patch 5 updates the vimc documentation with the RGB/YUV input entity and
revised media-ctl/v4l2-ctl examples.

Tested with:
  - vimc.0 on x86_64 using media-ctl and v4l2-ctl pipelines

Pavan Bobba (5):
  media: vimc: add RGB/YUV input entity implementation
  media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
  media: vimc: debayer: add support for multiple RGB formats
  media: vimc: capture: support custom bytesperline values
  docs: media: vimc: document RGB/YUV input entity

 Documentation/admin-guide/media/vimc.rst      |  39 +++-
 drivers/media/test-drivers/vimc/Makefile      |   3 +-
 .../media/test-drivers/vimc/vimc-capture.c    |  15 +-
 drivers/media/test-drivers/vimc/vimc-common.h |   1 +
 drivers/media/test-drivers/vimc/vimc-core.c   |   3 +-
 .../media/test-drivers/vimc/vimc-debayer.c    | 113 ++++++++--
 drivers/media/test-drivers/vimc/vimc-input.c  | 210 ++++++++++++++++++
 drivers/media/test-drivers/vimc/vimc-sensor.c |   9 +-
 8 files changed, 352 insertions(+), 41 deletions(-)
 create mode 100644 drivers/media/test-drivers/vimc/vimc-input.c

-- 
2.43.0


