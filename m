Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18ED541E9A0
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 11:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhJAJfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 05:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352968AbhJAJfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 05:35:31 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8595C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 02:33:47 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id v25so3852763wra.2
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+UVQc398g+a9GL4OPwcV1qUDjZQzTXTU04h2fCYKmI=;
        b=TfQb1KkQf8PS+pMpXOe1NiBpU1gmAKjlAdnTBwLgV2KSChRbX7b0OKQ3bV2I+YJ2J8
         Xdiy/QfJ7lqw4GIz52qQERC38GFLbxDGd53eWmFSK7EdueFTMgU2EawhyBrDSZEf1AVZ
         y4wkff0JwzSNMgCwRueO5uOqRN23Pt8lG+5rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+UVQc398g+a9GL4OPwcV1qUDjZQzTXTU04h2fCYKmI=;
        b=r9vqumTyQojNgIyNVV3EER0YizpVryqFWcv8vDfQe7SVyxzkyBB1Z4aukhhqTowtwS
         OE6d4x1Sm292uY2zwWd2FqDxHalsut37rdzBL6gWWa3rjz1qQAUaJBEKATZU/TLIG9mI
         jvLFPw87QJuqjcpCVpeSyIUB27D2/fnH1f1S8QPAQZNzYSDRwsshKGGa3dqngZcH+/5d
         VcEBlRC6TYliDVtj4upFaJETKCn4osoRRdj+QyqE8SmWRp48VitHNmgc9hORKwdxAxb1
         bc6lkKgEK4pikwZ280SCjGzu3q+dpIjEuehEQjaPS6U09pQF6m88KuroC6/2WaufKkI7
         MKQA==
X-Gm-Message-State: AOAM533Akg8wgX5HRi9/0qCvQHttgQBnbG3nigum2oV/y0ScN+xDPQeX
        VLKF13QIKcAAmhi8HVn5WEXGkfxEF4tlKg==
X-Google-Smtp-Source: ABdhPJyXO4bBtjPSrHfPuRoQjjrh4SbCcEmHrUPA2k3pgfJjOwH+hc9/flD5IZB/qn7rZ3t0Hea0CA==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr10665705wrr.332.1633080826314;
        Fri, 01 Oct 2021 02:33:46 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id a3sm4486549wrt.6.2021.10.01.02.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 02:33:46 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 2/7] media: ipu3-cio2: Set valid initial format
Date:   Fri,  1 Oct 2021 09:33:43 +0000
Message-Id: <20211001093344.2812707-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The initial format did not have a valid size.

Fixes v4l2-compliance:

fail: v4l2-test-formats.cpp(723): Video Output Multiplanar:
				  TRY_FMT(G_FMT) != G_FMT
test VIDIOC_TRY_FMT: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
v2: Suggested by Sakari Ailus <sakari.ailus@linux.intel.com>

Replace number with calculation based on width.

 drivers/staging/media/ipu3/ipu3-v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 38a2407645096..19c4fcabce0db 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1136,7 +1136,8 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	def_pix_fmt.height = def_bus_fmt.height;
 	def_pix_fmt.field = def_bus_fmt.field;
 	def_pix_fmt.num_planes = 1;
-	def_pix_fmt.plane_fmt[0].bytesperline = def_pix_fmt.width * 2;
+	def_pix_fmt.plane_fmt[0].bytesperline =
+		DIV_ROUND_UP(def_bus_fmt.width, 50) * 64;
 	def_pix_fmt.plane_fmt[0].sizeimage =
 		def_pix_fmt.height * def_pix_fmt.plane_fmt[0].bytesperline;
 	def_pix_fmt.flags = 0;
-- 
2.33.0.800.g4c38ced690-goog

