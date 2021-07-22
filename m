Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EC73D2DBC
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhGVTyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhGVTx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:53:56 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25B6C06175F;
        Thu, 22 Jul 2021 13:34:28 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id q16-20020a1ca7100000b0290236ec98bebaso388606wme.1;
        Thu, 22 Jul 2021 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aCSiRsSc77XUIHiH+AnKMlHAFci4QLpzq2T2vg3uLkE=;
        b=VQ7ukDiTvqcYlJjMTCKFQ3Iy448egN2KbomVv5JI0o8Lfycwx6F80gGF1QR67w2qSd
         7EwINe9p7IF+SHJiBXu3uIecL4gVnUuXTI6Lddu/r2MiH2Gd336LiFjSwatx2wOz7j+a
         5zUs1WGWWVxmqQdzBJfVp3FJ+ApC53hDn8PCKsMZdh/SG79U+aCreTt4CHx22ETGHAZr
         rmjghV5dcmlCDzq+XoweuBIhyoO6JrOH/l07P7sPA5ToZg1RpKuUPjYslHGX9e9Rf/IM
         j9nQUx+NwXE8yGKaDRwroJvAkrGPt7M5rnHZrnqweq2DZt18XW2uxCM4Ox2c8b9G38re
         Qoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aCSiRsSc77XUIHiH+AnKMlHAFci4QLpzq2T2vg3uLkE=;
        b=RtpzUx8l5kXdivAUP89qyWbmLbl9OxkRmK7elWurjgrFuDjgTMzKGa2fYEtaHab/uN
         ilCkUJROPPeRR97snsW3D8HVzY3Fa+hUehbIIBvwRNXn+gwhfSh/YUuHiJTIXdebZB5i
         MhzJxLIQN18AjXEvWwqeH4GS0f/vTDZ4yXmJGAIbyp5WDAHtO8lDFuSa+ws/8kw/SUaa
         mgSS+nr6Y/b+SPqQM0Vw+UEZJ/vMEyS52KoWVCMe7NJK0WKpJjYFmhMjG7TqiGhMKwr1
         5khXrhXZ+mPIlBf6yXEylAcytkqZnX+DbbKQa+bWXmyNiNx1FurVv+qO5qmCfjiyKDhH
         mOrQ==
X-Gm-Message-State: AOAM532axK+QLUZkRHZW3h/98gl1d7ga4VZjvbueNoUPQdm8C1vzHJ38
        TOLDPEGAd6uczYcjD+me86k=
X-Google-Smtp-Source: ABdhPJyw9Qe1SeItVB5HS4QSD91MmzQXAZDhhqvLC74eih6JHgdmDdTMiCzkntk7AV9zHULyLfRpyw==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr1276053wmh.151.1626986067646;
        Thu, 22 Jul 2021 13:34:27 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:27 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 02/13] media: i2c: Fix incorrect value in comment
Date:   Thu, 22 Jul 2021 21:33:56 +0100
Message-Id: <20210722203407.3588046-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PLL configuration defined here sets 72MHz (which is correct), not
80MHz. Correct the comment.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index fe60cda3dea7..2ef146e7e7ef 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -713,7 +713,7 @@ static const struct ov8865_pll2_config ov8865_pll2_config_native = {
 /*
  * EXTCLK = 24 MHz
  * DAC_CLK = 360 MHz
- * SCLK = 80 MHz
+ * SCLK = 72 MHz
  */
 
 static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
-- 
2.25.1

