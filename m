Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C744334A52B
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhCZJ7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhCZJ66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452BCC0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:58 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id e7so5592648edu.10
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2y2043uffVR+Axz3IQVPi3Ysoys/BWtFNPbRtzf1kL0=;
        b=XgF63OA3iDsQinIPZBYEr8xo0HmgnBltM2VyBTZUJlrE7RvmQWTXVJ/bPDKAQgcbSr
         hMzMUxoBPWavwexaFLyLHvsj9kuOGk4t4tYOfFeBHZREj7an3p7wF3sDIXq0RZ72q5BK
         zWkAxBGo9khdo6tgVxlUUdVPNNA30QfR7Ynv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2y2043uffVR+Axz3IQVPi3Ysoys/BWtFNPbRtzf1kL0=;
        b=cZ5yrCOA4nPv+Im2XxImGXCA1N1vGV2NMRa5ggCgv2lCZDLO5m8rEyUpzzyH1WBLKA
         LLcWXFQVLO75hVWwVZz/Q26jcP/ncK/Q518qfUNo1+5J9co+13EcdV9tnSpN2e4vTUmv
         OHgTTrAwpIl1qCcrjbsWZ7urvZqKnZechmG2Bhnq3Z5/Dl2H1M32HE4osjIPFLhvlaYd
         /c7AXgXL1QS+gn7humvuX3U51Au5b1uvoQFExKw+a/d0cOzERUY5IKWjJiFB3ZbEo12+
         Pl+AFv1Pzb9r0yhCJnmPqhUPBLGe7Qiye1RCQiU221JusMRcVuaLsSzbIMbHt6ctgbXQ
         7YZg==
X-Gm-Message-State: AOAM533sc2o9YxhvyUknwYH6oauTjCnniflnkKxrMc92+E51GsyhOcPq
        tndfG6xf/GN/Z++Lfj5JSlwlCA==
X-Google-Smtp-Source: ABdhPJxvjIQgrOmedo0HpCzfT7PVy74zFLNCDZ0n2a5fez8hs/en3vpCIMntNMC2y9Q/wN+2rK09uA==
X-Received: by 2002:a50:fd15:: with SMTP id i21mr13534405eds.384.1616752737079;
        Fri, 26 Mar 2021 02:58:57 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:56 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 18/22] media: uvcvideo: Downgrade control error messages
Date:   Fri, 26 Mar 2021 10:58:36 +0100
Message-Id: <20210326095840.364424-19-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the error into a debug message, so they are still valid for
debugging but do not fill dmesg.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index ea2903dc3252..b63c073ec30e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -76,7 +76,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	if (likely(ret == size))
 		return 0;
 
-	dev_err(&dev->udev->dev,
+	dev_dbg(&dev->udev->dev,
 		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
 		uvc_query_name(query), cs, unit, ret, size);
 
-- 
2.31.0.291.g576ba9dcdaf-goog

