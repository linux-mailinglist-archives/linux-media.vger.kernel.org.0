Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B194059F1
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 17:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240834AbhIIPC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 11:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238605AbhIIPCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 11:02:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D720BC061787
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 08:00:52 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n10so538320eda.10
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nyRNd3VAua6ltU/T1+T7w24h2BGtw7h9hpcdASMSl58=;
        b=YcYQr1gQwSbzGcHWCUaAILJtH/tDjpoaEA0KpLgw/Mo9sklFUPX/qlAIUVGZSTjmTg
         VugoNYAsyzAwKU+8JXV4ALFAI3/Oo49mwzpi7Tmy7yUM/u/8uZCbwBZBO/TWECgY7bar
         XFipPiBVEHq0TBzM0M/1tZe28Cusl0wqLhVh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nyRNd3VAua6ltU/T1+T7w24h2BGtw7h9hpcdASMSl58=;
        b=XLK6BUuf8qYQfuTbzHzmSh4itT78bZxrBN7aeEyjq6UtwE7KmkXY/kAeT4o0GNxYi5
         gAwoFNxIqg+h87XVXFo0QkDhaBmIzsUbZ2kZZMkJinlqEOwbqWRo9sOsE6fobh+9LwKC
         QaFHw3mKhO0kD7bVOdFCa+k1sTMQjX0sgZKuPxWj1nPJGm1oj8rJUQNbvJByuheX5GNJ
         SHkACJf5JNal52WgsKvoR6TbwmJQNBFFbRvjR+BHLshrrHA6N5FGbO4BqbNBLQn19/qL
         /uhPmUdeClhT1YZMsFMWxTsx8m+OhieRRuGw9Gw62gjYH6odTptHZVFxzKaoE72xzzGm
         zHgw==
X-Gm-Message-State: AOAM531c4wV7cA0YYeonTWwT9MMgRanQjdrkJFhEQFzqcNaNY1pXbyUk
        cOoq3bNiw4IYHFEOo/n4zZgQyw==
X-Google-Smtp-Source: ABdhPJzBWbTmbMGQ/8bdekcwBUK9YxcHI9yToRdEb0KUqutjH/4WiBY8OQN6P+DdcfSOa/rJm19KNw==
X-Received: by 2002:a05:6402:358e:: with SMTP id y14mr3664246edc.296.1631199650910;
        Thu, 09 Sep 2021 08:00:50 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h8sm1139644ejj.22.2021.09.09.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:00:50 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 2/4] media: uvcvideo: improve error logging in uvc_query_ctrl()
Date:   Thu,  9 Sep 2021 17:00:44 +0200
Message-Id: <20210909150046.57615-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909150046.57615-1-ribalda@chromium.org>
References: <20210909150046.57615-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

If __uvc_query_ctrl() failed with a non-EPIPE error, then
report that with dev_err. If an error code is obtained, then
report that with dev_dbg.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/usb/uvc/uvc_video.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9f37eaf28ce7..dfea967309f2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -79,13 +79,14 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	if (likely(ret == size))
 		return 0;
 
-	dev_err(&dev->udev->dev,
-		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
-		uvc_query_name(query), cs, unit, ret, size);
-
-	if (ret != -EPIPE)
+	if (ret != -EPIPE) {
+		dev_err(&dev->udev->dev,
+			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
+			uvc_query_name(query), cs, unit, ret, size);
 		return ret;
+	}
 
+	/* reuse data[0] to request the error code. */
 	tmp = *(u8 *)data;
 
 	ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
-- 
2.33.0.153.gba50c8fa24-goog

