Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2382F3ACAED
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbhFRMcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234361AbhFRMbw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:52 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B94C0617A6
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:39 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id og14so15650107ejc.5
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=peSpn2lSGFUqmIp6gJb4MrHpU0l/TRrPkXZlxAJ9bsY=;
        b=mrdHii+BeXFY9uTzdCwqQnoGEMbkKw4H7sxQWA84MTPUcG43zQzy3kMy24Vk3Hr4Pf
         KACYfVeW0oVUgwB3dW2Wb5eiCRryNOniLEJST2X3ana0y/XJTepZTk7MxxvZRFC5Svhm
         QXir0x7u8+n7YPv0RZmm67CW1T7HwADEo7eCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=peSpn2lSGFUqmIp6gJb4MrHpU0l/TRrPkXZlxAJ9bsY=;
        b=fkIhu006QJQ/gaebUjbjImMgm6lyMYMJXTY0jfSlwFp5oucI7uXWq8pf4+C7I4aM8j
         akN0QpHQTwc9JRCtYezdMWnyeiPBVhfgonmmGF4miIi1X9wUWuND51iQJOO39isGPrVI
         hCUmdRAUKTBvpC9ig/nwLMJElQRR5OHZnEF3lVfwbiDGBtkAm7We8jwl4Yzx8DFmNr9S
         xTZvvTMvbGq6y4xyyos1L1w9Nw1l1bSCUZ9XuuZ58CSJ+u4oyS+u/shlYYw9TqWg/RDF
         DK5Tz5VPY4EMRHEnFYI4AcQ3kT5LhqhR2mmtPJaWk6JUcMSt/b7VKgn9sd9kPWdHWGo/
         g25A==
X-Gm-Message-State: AOAM533axRIRGzOF6H1gL1SQLQl+fOLxqfw/asKH7YmBS1t+r/3NrQ05
        vKXf6hpTg8cUCUlW3R6rqRG6Sg==
X-Google-Smtp-Source: ABdhPJzY9R0ykT1k6jDUKDlGGyLl1xrYpVIXqJgRgO60crc79Rn1KrsdBKE48GjktvpplBYHdp5seQ==
X-Received: by 2002:a17:906:60d3:: with SMTP id f19mr10989699ejk.413.1624019377753;
        Fri, 18 Jun 2021 05:29:37 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:37 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v10 19/21] uvcvideo: don't spam the log in uvc_ctrl_restore_values()
Date:   Fri, 18 Jun 2021 14:29:21 +0200
Message-Id: <20210618122923.385938-20-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Don't report the restored controls with dev_info, use dev_dbg instead.
This prevents a lot of noise in the kernel log.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 11c25d4b5c20..da44d5c0b9ad 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2153,10 +2153,10 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			if (!ctrl->initialized || !ctrl->modified ||
 			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
 				continue;
-			dev_info(&dev->udev->dev,
-				 "restoring control %pUl/%u/%u\n",
-				 ctrl->info.entity, ctrl->info.index,
-				 ctrl->info.selector);
+			dev_dbg(&dev->udev->dev,
+				"restoring control %pUl/%u/%u\n",
+				ctrl->info.entity, ctrl->info.index,
+				ctrl->info.selector);
 			ctrl->dirty = 1;
 		}
 
-- 
2.32.0.288.g62a8d224e6-goog

