Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B22834A52A
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhCZJ7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhCZJ65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:57 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EC3C0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:57 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id j3so5580147edp.11
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U298rYjAJn0L1+zqib6+wctgA7KMqrT5dPHppU9NIJA=;
        b=ZwtnL7gYMd3BCd6nvE80yX4oFyZmkNnPycNW8ZMb2OHLJQhiGn69io0BHtvSEDofge
         X1bU18SrBQt+hc0jQUr4aVab4WeATFl/XmaoXs6EX87p4vaWj0wxTyn3YHGRcLsPDpLY
         NEjBLZBNp5EOHLDEDjLjYCJqfbV9dJDPL21DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U298rYjAJn0L1+zqib6+wctgA7KMqrT5dPHppU9NIJA=;
        b=kw6S+g4bLhoIb7yzXcv9/OZu8jx0GisAhoGeOrJQ+jlfpSvlP/9atEo5qR+BKzYYW0
         i/Ug2gaDwLptTO06c+5OwcGtTk7M+f00jjf/xvHAtKXj/oKyWY7d6my9JpNfWyOxk9MN
         NiIMrDKQ7bAl/OWcYZUTdwpFHlOxFSSGFdGqENQ5wptYw1nWcEJQ6mkEqQRwZmunILZt
         tmf3SI6V4AsKu5/HO1LN7PQzrMlILdnVo/sTtLWzG8Re3/6Uc0W51E/A/qKuhnO8GsIt
         ZImfKD32Dhl1MytDEUphKnz/HO9cFlJHq8fOqgWi5jY7Tw4Gt4FQlyBfAtNCaGyPIpJg
         CbRg==
X-Gm-Message-State: AOAM530dp3Q8wJEANkybMk20dFcChbYjnQamWSf9Oy3uYhnOnZM4hOif
        xkj9OAEK13RjT7diWOSlKgCoEP+gOomiP4yw
X-Google-Smtp-Source: ABdhPJzStos7JXr9MhMZG/mBlM5P25jaxM6iCVYVZbmBpuYaYUdFWD8Xfgc03hLuZShCs758SpOk1w==
X-Received: by 2002:a05:6402:138f:: with SMTP id b15mr14026182edv.121.1616752736122;
        Fri, 26 Mar 2021 02:58:56 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:55 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 17/22] media: docs: Document the behaviour of uvcdriver
Date:   Fri, 26 Mar 2021 10:58:35 +0100
Message-Id: <20210326095840.364424-18-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc driver relies on the camera firmware to keep the control states
and therefore is not capable of changing an inactive control.

Allow returning -EACESS in those cases.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst      | 5 +++++
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
index 4f1bed53fad5..8c0a203385c2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
@@ -95,3 +95,8 @@ EBUSY
 
 EACCES
     Attempt to set a read-only control or to get a write-only control.
+
+    Or if there is an attempt to set an inactive control and the driver is
+    not capable of keeping the new value until the control is active again.
+    This is the case for drivers that do not use the standard control
+    framework and rely purely on the hardware to keep the controls' state.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b9c62affbb5a..bb7de7a25241 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -438,3 +438,8 @@ EACCES
 
     Or the ``which`` field was set to ``V4L2_CTRL_WHICH_REQUEST_VAL`` but the
     device does not support requests.
+
+    Or if there is an attempt to set an inactive control and the driver is
+    not capable of keeping the new value until the control is active again.
+    This is the case for drivers that do not use the standard control
+    framework and rely purely on the hardware to keep the controls' state.
-- 
2.31.0.291.g576ba9dcdaf-goog

