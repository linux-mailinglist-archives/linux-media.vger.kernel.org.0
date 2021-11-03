Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18366443E75
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbhKCIg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhKCIg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:36:27 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1336FC061714;
        Wed,  3 Nov 2021 01:33:51 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id j9so1787146pgh.1;
        Wed, 03 Nov 2021 01:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bnxLGvWgXwsxiMYD779vgbR7xyI8f+V+oYq2FeJpd8=;
        b=QkyG4sxKDeI3GnL1w/MXpA9mJcyaHQJBrXEcts1rIDXvjCSHaM53CpV/BuKKZNjAsQ
         5zo9Ucxf/ZLeLe9X3Kx9LJ6PWye9FPvPVAcJ2/O3K2JwVUml950fF6PmlnPa7prJV+3/
         4wYs/WGPFgrNIXiSVq3V/gIz1xKLf6BP/xspZE2kNOiEnRuW7hwCjUXusGw2LywMfGBh
         q0RUrfpPe/rCXXxdzCulx8G+fwHCtfZUapYddXpx3q/apWWZf1WdTr1Eoz/h9zBDWL7u
         wuA0yhqFhElD3NtXsZrhflYbo3zZAJKKp1nx5NqHtQmeS1Ba7BOrN6OWtw7GqzYq/Va2
         /isQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bnxLGvWgXwsxiMYD779vgbR7xyI8f+V+oYq2FeJpd8=;
        b=UYTUNilpOlJ1GBXSnGIhhvyZZD4o0bOUhOL0jlcBxFb5q99NUfOWirz+4k5XEENJ6/
         A5eJel1sVlRPho8KDbdGqd+YrdH9ZV2S7AysFzdWJnv3JocT5e9q7XrSgWYWCE4/9qYS
         Ps1/5gEyLUZpSfU2nmk3mnk9xYDK8a07rFsKyfHZX8t8i/S3Lkfh1c2mi63ZuW3Wa2xt
         wgP4CgSGT7SmIhDmrhHQTwdKocsbqOgPkO1nvHCm/I0LUZn44oFOjbal2UKmuz18fafn
         eZCBxlpL0Z2AGXYfbOLmXLODmWcezhZkk6H97uJtzog65mbyz1ThZP8htDJkjJTaThNt
         aWmQ==
X-Gm-Message-State: AOAM532TDSHZy4xNTVo5oXvJ5GDeECawbX84G4+xpeJldO61QRXmfthS
        zBjfovLUuMWkQN7TZ+XUljk=
X-Google-Smtp-Source: ABdhPJxAc18eZ9ENteLQZ0MgLSR+yrn914y3X/+MhLZEQJcxvbUzjhBIWuA1aAyRJfRGnlP0zszPeA==
X-Received: by 2002:a63:2c8:: with SMTP id 191mr31608619pgc.293.1635928430615;
        Wed, 03 Nov 2021 01:33:50 -0700 (PDT)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com. [192.243.120.180])
        by smtp.gmail.com with ESMTPSA id nn2sm4806508pjb.34.2021.11.03.01.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 01:33:50 -0700 (PDT)
From:   davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To:     mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, arnd@arndb.de,
        laurent.pinchart@ideasonboard.com, Julia.Lawall@inria.fr,
        yang.guang5@zte.com.cn, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: use swap() to make code cleaner
Date:   Wed,  3 Nov 2021 16:33:37 +0800
Message-Id: <20211103083337.387083-1-yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yang Guang <yang.guang5@zte.com.cn>

Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
opencoding it.

Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/media/pci/saa7134/saa7134-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 374c8e1087de..6f4132058c35 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -823,7 +823,7 @@ static int buffer_activate(struct saa7134_dev *dev,
 {
 	struct saa7134_dmaqueue *dmaq = buf->vb2.vb2_buf.vb2_queue->drv_priv;
 	unsigned long base,control,bpl;
-	unsigned long bpl_uv,lines_uv,base2,base3,tmp; /* planar */
+	unsigned long bpl_uv, lines_uv, base2, base3; /* planar */
 
 	video_dbg("buffer_activate buf=%p\n", buf);
 	buf->top_seen = 0;
@@ -869,9 +869,7 @@ static int buffer_activate(struct saa7134_dev *dev,
 		base2    = base + bpl * dev->height;
 		base3    = base2 + bpl_uv * lines_uv;
 		if (dev->fmt->uvswap) {
-			tmp = base2;
-			base2 = base3;
-			base3 = tmp;
+			swap(base2, base3);
 		}
 		video_dbg("uv: bpl=%ld lines=%ld base2/3=%ld/%ld\n",
 			bpl_uv,lines_uv,base2,base3);
-- 
2.30.2

