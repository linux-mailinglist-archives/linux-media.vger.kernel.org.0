Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DCD45656B
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 23:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhKRWM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 17:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhKRWMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 17:12:21 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08DCC061758
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:20 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id w29so14322473wra.12
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nI+S0BW0IqKIYyqIwvbthiGB5Xvy9IARrMVLFLvVlqA=;
        b=TeP8zWgcUO3rnIFtkqnNP5TPabNuL8ggRhpYjKvnbxYlDC7zPprjX9uvPr5pVTYSrJ
         lfPXK+nO4NaU3axsRXk9Ggl1ODoDJgtizL5xzQFozKW0SoTIqZUknWZZmcw1jlk5nj3h
         f+1mKUTeUdzagvkMKncOES1nLv8bFHrh/TbwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nI+S0BW0IqKIYyqIwvbthiGB5Xvy9IARrMVLFLvVlqA=;
        b=DZC+eNzSxKhldDWwewDbXv8QW3OC5ERe+aBJXiysf1/QAxWaW+vrPUN+Dpscj2mxkL
         E/5JyOYUALlTcMIO9SXUxleyB6jDm/ldGoVKf2lxOTwtyUR73Tp1YGxuHPYfmufoLkfy
         jsauvVUH7VhEFXP5+gWW3fDcuj9IwFoiQvFkWKyBrFJBH6GkTtHOgm7kvxM69gwJhL5q
         CTYBPlTkCGQ+HYGbmWwQkoUtTExD9KK5AuMDOUjWxNqGJaTwzT+O1xQcBL6aK2GL4SOz
         D/frXvirGl81QabE3bn62hsu+TCQnfYeLiIlEmDK6GIKkRpPhRFJzYaBE8V6WJmiF2x1
         Zoqw==
X-Gm-Message-State: AOAM531pa1/V0i8M8+/06e6cBRBSCvXINi0G60ffu2t5SagAEwWmqQDs
        aXn0EvZnUcgNilQ7bSNqb38KIg==
X-Google-Smtp-Source: ABdhPJzAUCy9NTm3cCuTdaKT53fDVPV8ilkJ3H3cTDwUCIhR1Lp60jheKGTiElFXr+AIjwYfoN68LA==
X-Received: by 2002:adf:fd4c:: with SMTP id h12mr980912wrs.429.1637273359363;
        Thu, 18 Nov 2021 14:09:19 -0800 (PST)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id f7sm13305180wmg.6.2021.11.18.14.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:09:19 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn . chen" <hn.chen@sunplusit.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 6/8] media: uvcvideo: Allow hw clock updates with buffers not full
Date:   Thu, 18 Nov 2021 22:09:11 +0000
Message-Id: <20211118220913.299978-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211118220913.299978-1-ribalda@chromium.org>
References: <20211118220913.299978-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With UVC 1.5 we get as little as one clock sample per frame. Which means
that it takes 32 frames to move from the software timestamp to the
hardware timestamp method.

This results in abrupt changes in the timestamping after 32 frames (~1
second), resulting in noticeable artifacts when used for encoding.

With this patch we modify the update algorithm to work with whatever
amount of values are available.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 3a2717e2c92c0..22b2bab0af5d9 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -734,10 +734,10 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 
 	spin_lock_irqsave(&clock->lock, flags);
 
-	if (clock->count < clock->size)
+	if (clock->count < 2)
 		goto done;
 
-	first = &clock->samples[clock->head];
+	first = &clock->samples[(clock->head - clock->count) % clock->size];
 	last = &clock->samples[(clock->head - 1) % clock->size];
 
 	/* First step, PTS to SOF conversion. */
-- 
2.34.0.rc2.393.gf8c9666880-goog

