Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4AF7E34B6
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 15:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439528AbfJXNsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 09:48:37 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45875 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732240AbfJXNsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 09:48:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id v8so18626013lfa.12;
        Thu, 24 Oct 2019 06:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eh3QeCRU+KbLxpJwL2S7uImfmKPlDkY/EBxciS/9vrY=;
        b=VpbZ19QjrvdBp+Yp9H58aK9ZIlx0JFpcl15OdjIFnRPII+GxZwvuippqg4mUgTqKZM
         lZJHTCmC04JPSP8pd/b6tO5EIaCZ3fSunswB7ZwXhyS2DbULmd9PHsdJyi7muqkfadHh
         Naiu2nZlUJVuj1btOvZebSkJS12fRBvO1Dp2UvGaKmGhoCPT5k37TVzOxBkQtFxVadtB
         p4EmetHtomv/7d3hhVCJ2t1ZtikElKN9UGmL20kCbZXRrigdyRkUxh1je/r3Fh9dxAL+
         avZ8vSmxm4jDrIZ6BCRniEa6PlszP76M95v+e9VklbUJ6uQ72Elxa+13WItDkY3oZi7Y
         oCbQ==
X-Gm-Message-State: APjAAAVRzTjT6wOqTZ0hekgSbPuznkhNvC11FZ5Q5tsCjl9PEYDMsEvC
        aWCfx2hHU6A+ynuvOSfYS1s=
X-Google-Smtp-Source: APXvYqxrb3tBc+jJCOQUd4Kwz9IyKrxbM/t0vGxQuf45osYcRN06U8doVPUfI30LiERriv5ZqHFlhg==
X-Received: by 2002:a19:7b16:: with SMTP id w22mr10635721lfc.114.1571924915467;
        Thu, 24 Oct 2019 06:48:35 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id j7sm11907086lfc.16.2019.10.24.06.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 06:48:34 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH] imx214: Remove redundant code
Date:   Thu, 24 Oct 2019 15:48:32 +0200
Message-Id: <20191024134832.14061-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pad is now checked by v4l2_subdev_call_wappers

call_g_frame_interval-> check_frame_interval-> check_pad

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/i2c/imx214.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index adcaaa8c86d1..4175d06ffd47 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -803,7 +803,6 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 static int imx214_g_frame_interval(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_frame_interval *fival)
 {
-	fival->pad = 0;
 	fival->interval.numerator = 1;
 	fival->interval.denominator = IMX214_FPS;
 
-- 
2.23.0

