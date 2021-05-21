Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4440538C1F5
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 10:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhEUIiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 04:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhEUIiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 04:38:03 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259FFC061574;
        Fri, 21 May 2021 01:36:40 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id g18so12736084pfr.2;
        Fri, 21 May 2021 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YHlK5QevhPaH1SYYXid54dS3j6Hu8uPH5/mkhqGSJQ=;
        b=i0LCUpec5F7dbvdfKE9N7QXRu7qigWJ3h/KJHBmfVk5CKzZ1lL+or8sJoLoA/25r3x
         W/Faws9KZ8/JAGQTH3fs7nRxTzNczyPs1MHpOrElBS8Gr07eNGrI6tN4p3e0wBzG0HJf
         g+c8yLMS7sx5JmSQy0zZq9bu7Gyd/zv7gSv/nQkFk7aIqlKwBvIe8C8Cd7gztha0DjZi
         QDbOiKdrC4HFiwQ3MJBTOEQ3Gl/B3MMqC3kwsI+jNx2yiaWIWFb8KaiNLL1xJtDce/PV
         3L5E9Ftx2Mg8c/75tmscm7s5HUsIdMiVG3orNDz7slFa+99ZfVwJe7baz4EZ8O3cnBF0
         E1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YHlK5QevhPaH1SYYXid54dS3j6Hu8uPH5/mkhqGSJQ=;
        b=AQhnIHiMA24rJw5UHIIDmP4bUtLPVDJ8+XMp8CNkPDrq2uBU2FqCK+7r7a6BLYvRjt
         GBuWCR6ingMrzUekPaZm3DRjgei7nKNkNOWkj6R0P/4eIXVveIU/7p/mGCh63hhR8CiM
         X/855w1WYLskaVO2INYk0hyPaQt7A4Ezn2WfYcLX622YnDrUJvHWVL3OLimR8MDHDq4K
         cOp9fJQU5ikjUKRZgZJO3LimxByLnzmMI4mIa/hAbx8h+W6mTlM2ENCMTKtqauSTHse6
         tVHjwJIaiJtVNHOXPHzVZVHCqOhxTtWsB+34vlpYx1irz8kIFiRRG8w8BN61NN0Ja5hS
         XwYQ==
X-Gm-Message-State: AOAM532Nde4ayXs+4un01vsIy3es8Bn3HgH+Nun/eacr9E+LfDwHOUhZ
        j4c94JWQUGZ5efB4SxJnKeM=
X-Google-Smtp-Source: ABdhPJxsTClJzGx/FScqzrLfbXZKXaAXrBzz2rj8TJIVs5GxODqXEsbiA0cXw2OD5CKuEKqB0mzsOQ==
X-Received: by 2002:a63:982:: with SMTP id 124mr8835177pgj.37.1621586199732;
        Fri, 21 May 2021 01:36:39 -0700 (PDT)
Received: from yanshuaijun.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id u1sm4042562pfc.63.2021.05.21.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 01:36:38 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     mchehab@kernel.org
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/usb/gspca/cpia1.c : fix spelling typo
Date:   Fri, 21 May 2021 16:36:29 +0800
Message-Id: <20210521083629.9419-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

change 'then' into 'than'

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/usb/gspca/cpia1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index a4f7431486f3..a27db08fbb37 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -365,8 +365,9 @@ struct sd {
 static const struct v4l2_pix_format mode[] = {
 	{160, 120, V4L2_PIX_FMT_CPIA1, V4L2_FIELD_NONE,
 		/* The sizeimage is trial and error, as with low framerates
-		   the camera will pad out usb frames, making the image
-		   data larger then strictly necessary */
+		 *  the camera will pad out usb frames, making the image
+		 *  data larger than strictly necessary
+		 */
 		.bytesperline = 160,
 		.sizeimage = 65536,
 		.colorspace = V4L2_COLORSPACE_SRGB,
-- 
2.25.1

