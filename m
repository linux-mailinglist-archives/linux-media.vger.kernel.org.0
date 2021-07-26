Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FC53D5AC1
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 15:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbhGZNLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 09:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233408AbhGZNLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 09:11:50 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192E9C061757;
        Mon, 26 Jul 2021 06:52:18 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n6so11343546ljp.9;
        Mon, 26 Jul 2021 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u3yZjuwUYmFcj+6Lzpik5pE/VnLNID8nRjGcYV42Zv4=;
        b=kg5ebUo+4Ep1AocFIUUTgABBesqEyVRNTA8EOHJJ/bg3ZPnK4JY/DYsAZepbW1XUcz
         8QmLAX6sBykjR/OPt5O7idj+D68/GYwyhyINopOjZIvFD8yyGqKug4uCA3CTnIeE5XQ/
         2STH5HrFNGXmQO419fs00Gc6tmuLF//XuOvdGO7ArgSxXC3CoCZjvs9UmpkYhFVl9/oN
         VgI/IQNXjCJMRVVjLN5MBpxklWS5IpSYM4n+jTjRU3IYb9nm+4ZeggvHl1ZIuASHYt0D
         Ene0+Sn1HWqZnzBrcMaWuHnG+DYgpSw1H1Kfx+m7zcBEBXluydkHWOwUnS/b3Hf5g4uV
         j8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u3yZjuwUYmFcj+6Lzpik5pE/VnLNID8nRjGcYV42Zv4=;
        b=jocATIlhPKvHvDJfjw0mY6RurEAuPkqeg2MoJ2O7EzTt7d9x1dmDH1gBfLyhCjFE4Q
         uOSm6r02hb/xL2e0DWjQ1KTapIn6mXToYf9Sh+eFbqUy6XfTWlqLGn5Orzu/QpH3yxMJ
         T8mthtPO7WxLZjAanb7MWOjBwLsGuiXQ7A9gYKHVS8ZrP2tzKUAvwp+jmFL+k4ihmGuM
         MyFap7+BG/mhRtKkm7ALHzFB5Hc5bpRvvUTgp2uh5ZxELZMtK7RGR51soUdZRD6NGVFj
         O7/HY4RWByRt6MRixlKnFSZFp1dq7rSD+X1Se7wHF/u0idur1o87/WnBaWNhR3QYkrj6
         ADtg==
X-Gm-Message-State: AOAM533JM1iDxMDiLMjNZkPLSPBvaN5ruHljzYOyV8TJi2sb8/Fl+Wu5
        7MKH60dj6ces8zCGuQ2lNkDb7GiiulM1c4cmIKU=
X-Google-Smtp-Source: ABdhPJy5s7J3iDzOjoVyljiW6YVCQEcgc0cZBAGfJkBUA3jE3nPG4A65mSA+PUuTtkMvOXQKidbh5w==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr12486719lji.360.1627307536471;
        Mon, 26 Jul 2021 06:52:16 -0700 (PDT)
Received: from fedora.. ([185.55.106.126])
        by smtp.gmail.com with ESMTPSA id p16sm7011lfs.83.2021.07.26.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 06:52:15 -0700 (PDT)
From:   =?UTF-8?q?Martin=20D=C3=B8rum?= <martid0311@gmail.com>
To:     sakari.ailus@linux.intel.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Martin=20D=C3=B8rum?= <martid0311@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: i2c: ov5645: Fix horizontal flip
Date:   Mon, 26 Jul 2021 15:50:06 +0200
Message-Id: <20210726135009.140168-1-martid0311@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5645 driver currently handles horizontal flipping by setting the
"sensor mirror" bit (bit 1) in the TIMING_TC_REG21 register. This
just reverses the sensor data readout for each row, which works for the
brightness (Y) bytes, but it ends up reversing the color (U and V)
bytes.

This fix adds the "ISP mirror" bit (bit 2) in the same register.
The datasheet I have isn't very detailed, but it seems like "ISP mirror"
makes the image sensor processor flip the color byte pairs (so UV -> VU),
so reversing data readout in combination with "ISP mirror" gives us a
horizontally flipped image with correct colors.

Signed-off-by: Martin Dørum <martid0311@gmail.com>
---
 drivers/media/i2c/ov5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 368fa21e675e..c40bcb4b5484 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -52,7 +52,7 @@
 #define		OV5645_SENSOR_VFLIP		BIT(1)
 #define		OV5645_ISP_VFLIP		BIT(2)
 #define OV5645_TIMING_TC_REG21		0x3821
-#define		OV5645_SENSOR_MIRROR		BIT(1)
+#define		OV5645_SENSOR_MIRROR		(BIT(1) | BIT(2))
 #define OV5645_MIPI_CTRL00		0x4800
 #define OV5645_PRE_ISP_TEST_SETTING_1	0x503d
 #define		OV5645_TEST_PATTERN_MASK	0x3
-- 
2.31.1

