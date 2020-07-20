Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42283225BA6
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 11:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgGTJ3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 05:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgGTJ3o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 05:29:44 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB84CC0619D2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 02:29:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ls15so9940509pjb.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B2DSO/aWAoJzWSJL4puh7QjtP9M2G0vX5SgGCTFfnts=;
        b=NikpLS+N3qR2sHdhR++q/DgmRGoIAbwJDPZKGfWUAcTIcUw9TlzB5FnpPDt1sPSC8M
         Mk1NNk5XGn7yY2BPr8ug25MWnXMYXXuIY6FffQ9Cuct0k6OhyykTdx6MnypRI9vKclRx
         P8GI+xWh/nlO6Y8TpDcDUh1fqoYJqxCoGaVCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B2DSO/aWAoJzWSJL4puh7QjtP9M2G0vX5SgGCTFfnts=;
        b=DJNHEwaMkNlVF/9PYw5wmdKwjHOLs6e3qkXc+ZGTfE6Ip9SWlsiWn4qVCeipaiz4ym
         TuObjlkfNV5kCJpMoxb4iwbCNl5wmWB1bGun5eONsP5uMzTb/3GNYqEam38s8bqo6N3u
         5nJS+1e8MJYC8ZUwbChC8Uwi4O8LLB1QpiXzqqNqqsR2Bc/o20X+N5VsEPB7cC1jS36b
         BtV+Gmlz8OgNi5qXAqmxHfcLNdetqp9zX2XQWr1a/Eg3fXWQuDlohKx6I5Yh4TqlmwE0
         r+HdimDgyG8TPXMxvOcVvD0UqNJ1+AypGNMms/NTU5J95z43bc9VH4OWCsY54ZVRB3JI
         Atig==
X-Gm-Message-State: AOAM531v1WLKNb2ucR/WbjwwWNGRBoQhTgDpzGmkZgV4h63TaZZP+8Wc
        IckHmh8lI1BoGA5G8CxO67CmIPLE2T1mEw==
X-Google-Smtp-Source: ABdhPJyUJqTu1oMIZdT1XQQeuBWfeUW3vYNGSn8M+KxvAA1dCrmEuEg2ct9wwK30sAebekF1pTzQeA==
X-Received: by 2002:a17:90a:66c7:: with SMTP id z7mr23079390pjl.172.1595237383150;
        Mon, 20 Jul 2020 02:29:43 -0700 (PDT)
Received: from jjsu-p920.tpe.corp.google.com ([2401:fa00:1:10:a6ae:11ff:fe11:67])
        by smtp.gmail.com with ESMTPSA id v2sm11197363pje.19.2020.07.20.02.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 02:29:42 -0700 (PDT)
From:   Jian-Jia Su <jjsu@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jian-Jia Su <jjsu@chromium.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-dev/ioctl: Fix document for VIDIOC_QUERYCAP
Date:   Mon, 20 Jul 2020 17:29:33 +0800
Message-Id: <20200720092933.2089288-1-jjsu@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_CAP_VIDEO_M2M is documented as 0x00004000
V4L2_CAP_VIDEO_M2M_MPLANE is documented as 0x00008000
This is different from the definition in include/uapi/linux/videodev2.h

Signed-off-by: Jian-Jia Su <jjsu@chromium.org>
---
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 666ac4d420519..90347367ef06a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -168,11 +168,11 @@ specification the ioctl returns an ``EINVAL`` error code.
       - The device supports the :ref:`multi-planar API <planar-apis>`
 	through the :ref:`Video Output <output>` interface.
     * - ``V4L2_CAP_VIDEO_M2M``
-      - 0x00004000
+      - 0x00008000
       - The device supports the single-planar API through the Video
 	Memory-To-Memory interface.
     * - ``V4L2_CAP_VIDEO_M2M_MPLANE``
-      - 0x00008000
+      - 0x00004000
       - The device supports the :ref:`multi-planar API <planar-apis>`
 	through the Video Memory-To-Memory interface.
     * - ``V4L2_CAP_VIDEO_OVERLAY``
-- 
2.28.0.rc0.105.gf9edc3c819-goog

