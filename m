Return-Path: <linux-media+bounces-7762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8453488A8F8
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6BCC1C2D3BE
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 16:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEC0155306;
	Mon, 25 Mar 2024 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RB5vHCsX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52275131196
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376401; cv=none; b=lIzu6+/AxBoKQJL/o63QDx6/sZ6N8SIL0ttHTdcT/SEAeczZPGu907XN6mg/IQqngJXy6PHZp76bqnyQIGan1hY0w1hhlw2PnQ6sKZTMcev25q0eiWlG4YNORD+OmwUlyrJKjD24BEuEtb3hlxFUwGpTrNRbMUfZwQBMa7nivbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376401; c=relaxed/simple;
	bh=u7jspQ3Aev3XJQiTO8vdl6msbbnJu1QvF4iX1a51EjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeTzoupCMasI73fDnzMXypS03ihaca054Wi7OAqD4ERydHd3B3F+kIrGDPKf4CJNTOjzAQ0Qdq23QQvhyDT2QrtYS+/0EiZC+WXE1mWbGbpQOwQTrvMtNnYO2ELuQnPYxWD0U7qEzmntCb/jaGDIQcIE0K24iE1bkzMpWEf78BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RB5vHCsX; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c3ae8fa863so2764506b6e.2
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376398; x=1711981198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxSMnfcXo9eH24y0bZB1VjxXV/n6bBssF/qdkJ/8rO0=;
        b=RB5vHCsXeJQPDsX+7xtNvbzCW3xKQ555NM6Zy0cGCvBPID21EIiJ4z3pKU220Z+qO2
         9ioq1PxHXvQYTj9/+pyu2b3l3mI8W3VFRn7UzSkMR1RbdrAP6HzUHeOzfNJSQlQjoF6M
         s9qy8XEEochHe0t9LCq6Ww0AwjRwRrU8vnM8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376398; x=1711981198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxSMnfcXo9eH24y0bZB1VjxXV/n6bBssF/qdkJ/8rO0=;
        b=KazhU8E5nbK0rUoReYAZcXhXeoaSSbxieBjPkl/fduAkoicYCRAWXIBpDn1IJo9zHB
         xYTk6xaX2wf/XhgrIl0qvTWHr36IVwCYqvJmVBDGU9vwFySxR2GHPblwW/mhD7Ht+mxp
         JW/RnaOxN6BcWzxNXSdGkeJbk+uJamFUQfd5BMSlDOTQJ+cy5zibDq29a7lcKhZ1LwD8
         1AlP1B+F+jMpDwA3x3SiyvqSA38foyTXEW63l6eySPVLlqVR7rY/J5h2RBm8/wwot5Ng
         BE4ojRQwdux9vI53dZA1eH8bsQQrl71momsafFqYmUIx+83v2m25joggm6OLxpMGE0eG
         Yk5g==
X-Gm-Message-State: AOJu0YyEPZw2nQ/ieOrjeXSw1h9iHVVLe9diKiAnPqJlUahK39ls6iEL
	TwaI5iRrm23U6RwJV0R8yPcZJqFhA9+aBzdeKhsRlEVkpSDrzLZAt9d+1+r+yg==
X-Google-Smtp-Source: AGHT+IFXDkHwTGNUZBxyMK2jzEutUrDBtNUTzl+YFRneAkQppTPw7jEE9XRF/qu3laG74FPOuty29Q==
X-Received: by 2002:a05:6808:15a0:b0:3c3:c923:4f03 with SMTP id t32-20020a05680815a000b003c3c9234f03mr6512221oiw.19.1711376398398;
        Mon, 25 Mar 2024 07:19:58 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:19:55 +0000
Subject: [PATCH v2 3/3] media: dvbdev: Initialize sbuf
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v2-3-47523cf5c8ca@chromium.org>
References: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Because the size passed to copy_from_user() cannot be known beforehand,
it needs to be checked during runtime with check_object_size. That makes
gcc believe that the content of sbuf can be used before init.

Fix:
./include/linux/thread_info.h:215:17: warning: ‘sbuf’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c             | 2 +-
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 733d0bc4b4cc3..b43695bc51e75 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -956,7 +956,7 @@ int dvb_usercopy(struct file *file,
 		 int (*func)(struct file *file,
 			     unsigned int cmd, void *arg))
 {
-	char    sbuf[128];
+	char    sbuf[128] = {};
 	void    *mbuf = NULL;
 	void    *parg = NULL;
 	int     err  = -EINVAL;
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c39b52d0e4447..630e2ff987a37 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -164,6 +164,7 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	unsigned int input_mbus_code = chan->fmtinfo->code;
 
 	(*main_input_format) = VI_INPUT_INPUT_FORMAT_YUV422;
+	(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_UYVY;
 
 	switch (input_mbus_code) {
 	case MEDIA_BUS_FMT_UYVY8_2X8:
@@ -176,7 +177,6 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YUYV;
 		break;
 	case MEDIA_BUS_FMT_YVYU8_2X8:
-	default:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
 	}

-- 
2.44.0.396.g6e790dbe36-goog


