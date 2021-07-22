Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69ABE3D2322
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 14:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhGVLce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 07:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbhGVLc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 07:32:29 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AF0C061575
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 05:13:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id k4so5699413wrc.8
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mncn1LcgKDTMYAOw1LqPaDbPls59/gAmcd0XhWZpuA0=;
        b=PSPdsAnyMY5YHTC5svsNCg83BJeayuLwNiKcYarcu6swHOzng6eC44jll52V8L28df
         5sGWE9GoEKsInFd6xq7LDCnvCgIEOeVpJM+WP5bN0kSiS6Kjpb9m71xwEnG/uAwt+bsd
         sJZaw4gqt52ojyBmfUHYuqbhEDzifPGdkGsKA6+wBE7tYwOCe6fvC0NJSKiEL740HmJo
         KA6mHl7bK9rxOS0fPNijC/B7DJZk45UKXnl6IIfYwPdAL4zGOAfUQDHvHDztcOg469nD
         yk0JDT1BPHTwWwyD1cU9y0s1aih42fV5oAjBuR/6T0IUJjOoBFJ43Cg5hmeKJdIoeOKl
         ofIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mncn1LcgKDTMYAOw1LqPaDbPls59/gAmcd0XhWZpuA0=;
        b=t0JwTB2ADznCgBeAyVHz05GkaEfuRDa1o5KL7bELZiwUlV14Rp996TuDn7R5hHWAy0
         umPWcyUJmTQv0+8mtQUAvoz/1EFVzZTTDCnhfHU2uT1YRlYO0k9N5TwYz7Jq6khyJNFZ
         5wP51QlH1uNIBW7d6rgzjESsWzEdCVku0IXCDQ5tIMF3JQ9WobctJ830xinWE2wuzRfG
         1UBlfpZJcBZFhFhlBHui01gX8lVfoWtKgjzqyRnGDlQ+c8QPC3VQtkZO2aDayxcJq+Jn
         XcuwcTRTxHWn0vCZvZRc3uYYK4HazEZ2mnVjNxEXaL3mluENbD7VRyuwW5hUCkfkDWpA
         XIdw==
X-Gm-Message-State: AOAM533MnV1lokK/6dbHGQdA9973aWD9KTq4R7OIG/JAjrNope/+Z2bh
        r54JQxX/hJVaxVIoS+dktsEDK9rI4L8JLg==
X-Google-Smtp-Source: ABdhPJzKQ/a55jqLrSruHHGIvgpSznPYEl0ExN2JrsP+oEwuYY3usJdWA0oSNwSq+1KdwBa5gxxmAw==
X-Received: by 2002:a5d:4561:: with SMTP id a1mr46860919wrc.259.1626955982724;
        Thu, 22 Jul 2021 05:13:02 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:b918:b36f:9ba:b778])
        by smtp.gmail.com with ESMTPSA id e8sm8448228wrc.6.2021.07.22.05.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:13:02 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v3 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX controls
Date:   Thu, 22 Jul 2021 13:12:49 +0100
Message-Id: <20210722121249.16483-3-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722121249.16483-1-david.plowman@raspberrypi.com>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for each of the controls

V4L2_CID_NOTIFY_GAIN_RED
V4L2_CID_NOTIFY_GAIN_GREENR
V4L2_CID_NOTIFY_GAIN_BLUE
V4L2_CID_NOTIFY_GAIN_GREENB

These controls are required by sensors that need to know what colour
gains will be applied to pixels by downstream processing (such as by
an ISP), though the sensor does not apply these gains itself.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index de43f5c8486d..d50b56156a8e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -72,3 +72,28 @@ Image Source Control IDs
     * - __u32
       - ``height``
       - Height of the area.
+
+``V4L2_CID_NOTIFY_GAIN_RED (integer)``
+    Please refer to ``V4L2_CID_NOTIFY_GAIN_GREENB`` below.
+
+``V4L2_CID_NOTIFY_GAIN_GREENR (integer)``
+    Please refer to ``V4L2_CID_NOTIFY_GAIN_GREENB`` below.
+
+``V4L2_CID_NOTIFY_GAIN_BLUE (integer)``
+    Please refer to ``V4L2_CID_NOTIFY_GAIN_GREENB`` below.
+
+``V4L2_CID_NOTIFY_GAIN_GREENB (integer)``
+    Note: this description covers all four ``V4L2_CID_NOTIFY_GAIN``
+    controls, according to the Bayer channel indicated at the end of
+    the control name.
+
+    The sensor is notified what gain will be applied to this Bayer
+    channel by subsequent processing (such as by an ISP). The sensor
+    is merely informed of this value in case it performs processing
+    that requires it, but it does not apply it to the output pixels
+    themselves.
+
+    The units for the gain value are linear, with the default value
+    being shared between all four controls and representing a gain of
+    exactly 1. Other control properties, such as ranges, should also
+    be common.
-- 
2.30.2

