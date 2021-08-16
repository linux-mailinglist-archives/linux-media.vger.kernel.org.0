Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90BD3ED32F
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236189AbhHPLj4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236026AbhHPLjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:39:55 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8D3C061764
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 04:39:23 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id k29so23113843wrd.7
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Czysx3TZArwTJNVPYUbWQfbhEq/z5HVSNA79tCZk5c=;
        b=cRHwo+nQyt6sJrxrp5SutUrAflEDeRsMjM//OKN0WUmhztP+z5j5KV+citKCLv0VKE
         HxtDvsR1jGAIANb0V8U/Nc5ssUn4Zut0qJKrlTU/BffP4nuwJFPXj+74SlFlZQwsJYnt
         7CMVA4YWrJpFKZMmn/MAaSdshukzMkD/bazTVT6aUnUe2JIBnIgtMIxa5H8MYnezUdmV
         +gbWcCPbzqRBEBOiwzXjvNy8yg5YzQJaTqWHJwEHR2/lfxK0lK4Gm/3fXwF4OaJxiaRi
         7U3/Au1JrP90nJ2giq6CQwL2oeuVsSyWrLse8LaqaOIsZzuvVFLGvJQW2+A0d8IpTEXW
         NUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Czysx3TZArwTJNVPYUbWQfbhEq/z5HVSNA79tCZk5c=;
        b=pLzrWviAPdym3sYPLZ2UKgBYcl0KVJkeHBmn6r7N6MN+4p9dS3SO9LpJBw7dJO/YhG
         yQXzg5DFwhTauyt4TUDABb45R5XMBReOBWuOsZZHvhVGByK3KHeERai/1akJeFCAMHJ9
         Vtsx7DDzR35S5kjQf5IS8iLF3QMsV1lliWRG6Awkn7TT2iiaIZjyLzluzr9/IwMjD45p
         Q4KAwyQlm3s0y6ob/iOaWZHiVGfGDdRj+C1v8tM4/Qt5YeHqUqcgh5YK8PAaoXT4tJXD
         9jV1lND3mbszPT2XFodxxdvGVkzseknFFMO7r98wcLtH9RCSELGihxBhmwGhrn7EYtMd
         cKuQ==
X-Gm-Message-State: AOAM532q5Di1n8NpyXnS0cw1a0M9eOJtTe6j5hhji5G1VY9PL92JejHZ
        5fveabjFzOGbYVeWPBFQw+RdIYY7Wm3BmA==
X-Google-Smtp-Source: ABdhPJxsjODTW3m10lTiDGOJe+Sjt+Mihy425os4NXMMtaOYcKQtTG+YxiW2jWgrrh1w7XXqx70c8g==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr17830626wrr.49.1629113962427;
        Mon, 16 Aug 2021 04:39:22 -0700 (PDT)
Received: from davidp-xps-13.lan (plowpeople3.plus.com. [80.229.223.72])
        by smtp.gmail.com with ESMTPSA id g9sm10356548wmk.34.2021.08.16.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 04:39:22 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v6 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control
Date:   Mon, 16 Aug 2021 12:39:09 +0100
Message-Id: <20210816113909.234872-3-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816113909.234872-1-david.plowman@raspberrypi.com>
References: <20210816113909.234872-1-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the V4L2_CID_NOTIFY_GAINS control.

This control is required by sensors that need to know what colour
gains will be applied to pixels by downstream processing (such as by
an ISP), though the sensor does not apply these gains itself.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index de43f5c8486d..71f23f131f97 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -72,3 +72,23 @@ Image Source Control IDs
     * - __u32
       - ``height``
       - Height of the area.
+
+``V4L2_CID_NOTIFY_GAINS (integer array)``
+    The sensor is notified what gains will be applied to the different
+    colour channels by subsequent processing (such as by an ISP). The
+    sensor is merely informed of these values in case it performs
+    processing that requires them, but it does not apply them itself to
+    the output pixels.
+
+    Currently it is defined only for Bayer sensors, and is an array
+    control taking 4 gain values, being the gains for each of the
+    Bayer channels. The gains are always in the order B, Gb, Gr and R,
+    irrespective of the exact Bayer order of the sensor itself.
+
+    The use of an array allows this control to be extended to sensors
+    with, for example, non-Bayer CFAs (colour filter arrays).
+
+    The units for the gain values are linear, with the default value
+    representing a gain of exactly 1.0. For example, if this default value
+    is reported as being (say) 128, then a value of 192 would represent
+    a gain of exactly 1.5.
-- 
2.30.2

