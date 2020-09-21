Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78FD272053
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgIUKVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgIUKU7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:59 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96570C0613E1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:58 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l9so12024201wme.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6FJQXqYTGnFs6xSsNBr+hoN1yvRXs/bBrFwOES8jAPM=;
        b=vBugCVnWSbwdACUQOFN1afCvzNLAXk3a/HYAl9BSIGDqalr4HiI9zq9sL1JffA/cXj
         I+aMWvpMTWmSbWktvHGsFmqVeVDH0FOkqfAUtv+95mDhX0mrurF7aMZLjxoVjzY9nNlq
         Trjcq4QJGV/Ot/YRkBmxzdFXcpVV9lFC85qSkjbn+ur77n8A+ZjQCPCCU+l71S6GgTj8
         fAINR+cQ109GY2vq6DpAowfEdEyLC0pOxMoljjMwyVxXp2cJEiLQX82deZwEnRS3JJVJ
         cDz3OMypYhxfAXmQoP15C7j6ztzvAdfu66/u2BgcxFbKdKe45TBJf5IlQP6cnqsMAPMi
         Sejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6FJQXqYTGnFs6xSsNBr+hoN1yvRXs/bBrFwOES8jAPM=;
        b=p9+NIE2KPP3g0XpVFvJQpgugqd1AJeDjC3VriC2esxsvEoJldl8Ve+burTYdBl2muu
         vj/SdwuyQ/j+jEkMs9BcQA/Q2H75aJlJSNGlNeLWgk1ST6kaIZh1FJ1WYt8lX7PW5ttW
         cdb+LqokEa8Rgatan9Eyv7v4FjiBasiUs0tHgpOWvCrpPSqY7ZL+1JKYG3pX1l5LHHCz
         UlXJZbSp6GNUKyI8UvH4hTYF1kVwPqNrz8CWNhT3Jl4qMdC1Yv/iynyGd9onCrqtpGG3
         sdw0p0HPZKbnVkoyTCtvkXXi0Q92lsxYX4BFVDB1mI23fGiaN64s3f8ctoHWjODif+bC
         NpQg==
X-Gm-Message-State: AOAM531n2TyFGTNwFi07Wqck4n2RSNSkuFwA5VLBLlIj3HAOuZsjmNBu
        wDgM1//vdBXYeWWGDdRjPYA7Ug==
X-Google-Smtp-Source: ABdhPJy3JBJ82nITRQW7FeoI40pOMOYIUsRJiPlCUX5btahKih+LxvcRkcN8s7fkMOe/G2lzsTOaBw==
X-Received: by 2002:a7b:c8cc:: with SMTP id f12mr28551976wml.169.1600683657343;
        Mon, 21 Sep 2020 03:20:57 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:56 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 26/49] staging: media: zoran: zoran does not support STD_ALL
Date:   Mon, 21 Sep 2020 10:20:01 +0000
Message-Id: <1600683624-5863-27-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In fact, zoran does not support V4L2_STD_ALL, so let's enumerate what we
support.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index b1351455690f..6e95fbf5c7ea 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1749,7 +1749,7 @@ static int zoran_enum_input(struct file *file, void *__fh, struct v4l2_input *in
 
 	strscpy(inp->name, zr->card.input[inp->index].name, sizeof(inp->name));
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
-	inp->std = V4L2_STD_ALL;
+	inp->std = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
 
 	/* Get status of video decoder */
 	decoder_call(zr, video, g_input_status, &inp->status);
-- 
2.26.2

