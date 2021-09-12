Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F331407C65
	for <lists+linux-media@lfdr.de>; Sun, 12 Sep 2021 10:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbhILIWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 04:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbhILIWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 04:22:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA177C061574;
        Sun, 12 Sep 2021 01:21:04 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id g4-20020a1c2004000000b003065f0bc631so168831wmg.0;
        Sun, 12 Sep 2021 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WPj6LXbNCWGMgslr5J8S2na/ssf54cOsK6CaQGpLv5A=;
        b=fsg98pch/a14OEbNJXu9VqTjbbnBK2TPC6ZWLIpx/D+a5L8V/SMariJ4nvg6bJRFmI
         bPZPLVn/EKRmFr/LnOdSE5m5t/Tcpz8Mqs43dfw9g5nkSlHVrjW3gAWeNIAwsMzcrKUL
         NbsHDjcfE+KxOFdT5pMInpF+dZkgDGfkueRfvv50JYEU3xvW+A5mUw4hVfHLj0pVywT3
         mOK6w/izbeiLC+H0nRQWogvTMnYBZPd44ByPvywrVFm0sEhfEFKOorpCy6gEMC5WAkbZ
         2kAVaW/NrDoXUXtw8nk6kDHzIN/9IoFiWJSCpH5745gU3ORVi2xetU4hwSkyJTNO2H/5
         eq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WPj6LXbNCWGMgslr5J8S2na/ssf54cOsK6CaQGpLv5A=;
        b=VIUhzFrhNKLsu2k2KfCVP5dD2CFfFZc2/ttSyADkvLDN3EAwwZ57V5t01ugv7MOtKZ
         VzWHJ2WGp5Bni8P5E2FvidYmJO3sM/bxZvrqjWsZc1hdWMh+Lz7seKI74TIBqSi4BzMy
         VrX7xpg7ICJ4LraTa2azaEwW8RTwfb546mM+XzfJKsZJf4wX4YgxTLyeo0IHIoAyKi8m
         9LjyYCZKFNIjMgkG4M+b5IDRxs7nYf8q9w91OIn1zpTR4p/MwNHlOyQDa5mjjwfHaCce
         lk73U/rfzFx5j6pLtCurP00CKP2NpiPBBBkU7O0TXi+bTnO52VEkeNuc3ZXV7uS6hy+/
         df+g==
X-Gm-Message-State: AOAM530+rjDoNHKkW0tQ6s/+ON6YqjVFfD3w2NXkGkqd+CIxmTyZZtig
        eGIBDTBZ6bnBT4ZUFR9zKQOQskjqV1/1ng==
X-Google-Smtp-Source: ABdhPJzTvuyKRgnTBkT2kkQi1LutRMAbSxrCCgfp9wfzImXxciiR95cPN4bNxbk6/01FqTsUApZ3QA==
X-Received: by 2002:a1c:2313:: with SMTP id j19mr5665683wmj.189.1631434863602;
        Sun, 12 Sep 2021 01:21:03 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id z7sm4734148wre.72.2021.09.12.01.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 01:21:03 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] media: cedrus: Add H265 10-bit capability flag
Date:   Sun, 12 Sep 2021 10:20:50 +0200
Message-Id: <20210912082051.404645-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912082051.404645-1-jernej.skrabec@gmail.com>
References: <20210912082051.404645-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently only H6 variant supports decoding 10-bit H265 videos.

Add a capability flag, so driver could determine if 10-bit H265 slices
should be allowed or not.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
 drivers/staging/media/sunxi/cedrus/cedrus.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 144286920749..e7741178465b 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -556,6 +556,7 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_H265_10_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 600000000,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 9c7bfd2b6616..c345f2984041 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -32,6 +32,7 @@
 #define CEDRUS_CAPABILITY_H264_DEC	BIT(2)
 #define CEDRUS_CAPABILITY_MPEG2_DEC	BIT(3)
 #define CEDRUS_CAPABILITY_VP8_DEC	BIT(4)
+#define CEDRUS_CAPABILITY_H265_10_DEC	BIT(5)
 
 enum cedrus_codec {
 	CEDRUS_CODEC_MPEG2,
-- 
2.33.0

