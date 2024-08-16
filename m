Return-Path: <linux-media+bounces-16380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9659548C7
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC42A1C21B29
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF941B3F16;
	Fri, 16 Aug 2024 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eOQZdYNu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B341B29AC
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811525; cv=none; b=PF6PHgvO6naQZfCos9I6R42Z4zyix7/0O2/78yQnMViyhP3TBiCBOS6UNc7GxjaO1/Pu6sYIBX6adQF6fbuMOnkA8AvIoCI36D9f9CgO94qVLskRf6sM4ONVm1XZrTlqYCxju4yZsvpHAD/06j/ai2G35ZDfNQGiUJ11t7bFGuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811525; c=relaxed/simple;
	bh=cS96YejF1hyqXIfwcjLi+WpI7c6G/R69dAKBtvxD1pw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O7uIpC9mvGWEb9gyq52ULsBmaWli93HxxAEqlWqY7xdi+ovfwXU3OR6FjDYvkjqFad2a5FKgom19wQlPPX1tRloYj1sDOi8uuMZc1KmXbDZRC2oJICDVpb47nRbCjirc3nm5ntnoy35bvLbmnO9bXyBGW7nqFZlQqnMrtZsM3is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eOQZdYNu; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6b791cddfcbso10494536d6.0
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811523; x=1724416323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CCFoApgC3NvMeXYvVFjfg1wg+6p9sI3vxSueR9OSw4I=;
        b=eOQZdYNujRFo+6hzX2Bir/GbON70NT+/nyy8Y68ysFKffMf5vP0DIUTPJJY5Fx1I+L
         LE6tplNvcFF5DwuadefLp7ci1L0dU9nEBlUe/6KXVnixFnMjsQ0dwywZAmjKl0Iup6Er
         Bt79fc5sVcRnzNgShG5JC6qOwz+bf2GUeh4RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811523; x=1724416323;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCFoApgC3NvMeXYvVFjfg1wg+6p9sI3vxSueR9OSw4I=;
        b=fgI8o/nu0TU12LtOQHMshOEtAEYaVuBSEnMGM4/HTrfdLYgqJTN3MNydvSIfmrOuml
         qusedeaFcawJ/umFmJhF+XUQVOLQ2o6UHMTfMiZ1AA9kQ3IY7s3x+ueocohqCZbqWlVH
         FNz2gpddPYpPrk63FMZvUR/dkbUyG16sb8rApEr6hxosT9iDjhXwF9hv3HsqfvoWXG6K
         c7fa4RipQhayMgcGyb8PdZN2woVFBfSP/txV8o9sRo5jmWkjf7bQAe922U6EUVM8qLHA
         CdIOLrywjdCTbybYczB+3fzS5Ckf7BAPuhepL7urPMGHAGbhWhSfORSxlWHeHUtVTCRd
         rPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4vfHFGBL7gRG2yDZ1HehhXuJW1DTvb3Sc5cxYwXL3kmYR/l1ju2ge2rRdMK3tYcZ7vjAdqa73sJ0RWH/N34teqypZHrKf/TS4WKg=
X-Gm-Message-State: AOJu0YzVUXHSdIpIu7qNwJ1YuEs58VYcttPSkJNfl5g1pCE+tntYjWoW
	PJyaDih1g1svVq/KByVgdTj0ujRIFM2IiuemwiTT52fPpPe1KYv/s/yNyxoSyxXEoydaIGGG7bV
	h2g==
X-Google-Smtp-Source: AGHT+IFoKdLi76sGKTYFPYZCioyONlAB3ifLSzlc/E/kHAkYIvV8qgOxuFvA3vnNFKsn84Rla7Ntqg==
X-Received: by 2002:a05:6214:4a93:b0:6bf:75f8:250b with SMTP id 6a1803df08f44-6bf7cd799b3mr33366816d6.10.1723811522620;
        Fri, 16 Aug 2024 05:32:02 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: Fix last smatch warnings
Date: Fri, 16 Aug 2024 12:31:58 +0000
Message-Id: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9Gv2YC/3XMQQ7CIBCF4as0sxYDlLboynuYLuhIy0RbDFSia
 bi72L3L/yXv2yDaQDbCudog2ESR/FJCHipAZ5bJMrqVBsml4lrULM5mRcfw4fHO5GjqQYhO6aa
 DcnkGO9J75659aUdx9eGz60n81j9QEoyztlWolTw1g8ALuuBnes1HHyboc85fp/U9f6sAAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This series completes the smatch warning cleanout.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Fix double free in ar0251 patch. Thanks Dan!
- Link to v1: https://lore.kernel.org/r/20240813-smatch-clock-v1-0-664c84295b1c@chromium.org

---
Ricardo Ribalda (6):
      media: ar0521: Refactor ar0521_power_off()
      media: i2c: ov5645: Refactor ov5645_set_power_off()
      media: i2c: s5c73m3: Move clk_prepare to its own function
      media: tc358746: Move clk_prepare to its own function
      media: meson: vdec_1: Refactor vdec_1_stop()
      media: meson: vdec: hevc: Refactor vdec_hevc_start and vdec_hevc_stop

 drivers/media/i2c/ar0521.c                   | 17 ++++++++---
 drivers/media/i2c/ov5645.c                   | 15 ++++++++--
 drivers/media/i2c/s5c73m3/s5c73m3-core.c     | 13 ++++++++-
 drivers/media/i2c/tc358746.c                 | 12 +++++++-
 drivers/staging/media/meson/vdec/vdec_1.c    | 16 ++++++++---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 6 files changed, 92 insertions(+), 24 deletions(-)
---
base-commit: c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
change-id: 20240813-smatch-clock-2fa3b1174857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


