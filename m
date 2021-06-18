Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469123ACAE7
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234350AbhFRMcB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbhFRMbr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:47 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEFBC0611F8
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id n20so8399089edv.8
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N8QaRimrQy7tbEb+2hvBEYxq49oCsNjsO4dH1qof0Xo=;
        b=l60I2/lWfvz9n6EgmoLfdJL2wrkgtYjemHxMe2lyeRsy5JT+SHVx3QdEvvOCQwtG77
         +R5VRpzvQV4nEtNnBEa7y/bwLM6ZmwTUlqJeUe9yhFkjvT4HXY6X33xFtGZ0XT03kxYC
         5N47VdHXHeCK0IMAUWXfQ/x6nKlxe1rzWqy6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N8QaRimrQy7tbEb+2hvBEYxq49oCsNjsO4dH1qof0Xo=;
        b=AlYIv8ymrMhm7ARsPpptYf4ZVgG0yYd7QByuzrKMGaMpdw7WPNoaQ5/eJ/qrt2JQh8
         Qy14kcWkGmbXsinGmO9kXAekFE1fwVeLAVfSnX/wIS6RB68elqd7FsnpyuFDEUybNK+h
         +ddyRSaz5LEh45CgO+dT0AH1K8bvuecD4PqNAo75LVKquOKHzANEbZQpLRN3dC2xlCos
         q0T+qZhOst1q+YApmswteHYKFX5wGDKwSNOYW0Vk4GyP+idXsBhBMbr3NxwK0k6rLjIk
         pD5yWh4XYp8gwZwcNFevSwBPSD7Q6GkrgcnWpwRAHoNLAI+TThLXy+rAj4RySfNtwxNy
         3SqA==
X-Gm-Message-State: AOAM53040TS86E32j4GnxvuwgYqcgqUmb155TEiLTAuQER5A8ceZgw7Q
        hgBwKclmfov0VrkmSoOz3EIzwQ==
X-Google-Smtp-Source: ABdhPJw2P0R9N+9N0YHjOrbuS4klBKRdsjxekT87w49DkZj54toY+2aPweUZVzj8VkBimRQHsoF//Q==
X-Received: by 2002:a05:6402:487:: with SMTP id k7mr4534552edv.315.1624019376086;
        Fri, 18 Jun 2021 05:29:36 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:35 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v10 16/21] media: docs: Document the behaviour of uvcvideo driver
Date:   Fri, 18 Jun 2021 14:29:18 +0200
Message-Id: <20210618122923.385938-17-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc driver relies on the camera firmware to keep the control states
and therefore is not capable of changing an inactive control.

Allow returning -EACCES in those cases.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst      | 3 +++
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
index 80e8c63d530f..fd09677f64f8 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
@@ -95,3 +95,6 @@ EBUSY
 
 EACCES
     Attempt to set a read-only control or to get a write-only control.
+
+    Or if there is an attempt to set an inactive control and the driver is
+    not capable of caching the new value until the control is active again.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 3ba22983d21f..b42b822e9ede 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -458,3 +458,6 @@ EACCES
 
     Or the ``which`` field was set to ``V4L2_CTRL_WHICH_REQUEST_VAL`` but the
     device does not support requests.
+
+    Or if there is an attempt to set an inactive control and the driver is
+    not capable of caching the new value until the control is active again.
-- 
2.32.0.288.g62a8d224e6-goog

