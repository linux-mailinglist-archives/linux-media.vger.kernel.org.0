Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454A33905C6
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhEYPp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhEYPp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:45:56 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B135C061574
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 08:44:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r12so32754230wrp.1
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/TPhdbNwG56DgH/bkvG9Ab2XRQjfvqy0X0TnvaIzhV0=;
        b=hDZF3nDTIaL3tTijVRmk8XFQ4EwOKRhrmNTD8gLtvr25p3EQxAlY7YETs/ulm8ZSZU
         CF4M7VBDV8bAuYOaMtpuVhtnu+F6k4wV3skaOSMmXCyrNhxsxnETnHixdT3DIcILd0C5
         xh1kA7xsImRe4Vs9fwnSZJgz4KByJrvaKqpb2oNSn0/CKgE8PMw+7+emb2kAwRsW5k/Q
         gcO5dmcMQlzOr1DnUvXy3m/sKrkZMb9NxPldH34b8EihVo8krkFLc1MKGiiQZT5QVz8w
         iXfJu2anNKOmDeXBnSsD7pQzHUhU+GAlttGxxikRWVi9YjVjo0COzRTWXDRSxfGakxj3
         k7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/TPhdbNwG56DgH/bkvG9Ab2XRQjfvqy0X0TnvaIzhV0=;
        b=Uiopa/V0ys2RDso7ki5I42uS3woLkTY74tI391X9FGAxCS5BP9HmjR7G2qs8CV25LZ
         MgyKROZljW8c/SGdk+/vuzRxK09o/1T5u1pdvOw/LVw46dDVisBvJPHDv4XhtQnO7l7p
         zscYuuxl2xvXqljtd/C5Bej6vjJkrzMG8++xA4dxJ7oT/iOEtydBJ8KjR5mPG4IDirT/
         LDB4vx7p3u1lhFvWXGpi/DRhAOZYfgAGw/64yQUrViL7XO0hzSPfajWI5UrFNox926Cj
         /s/Ytn0m8J4ySvqOf5/fmWgjsNhd/+/9Ltf7MKCuaAGC5r7KkoCNfP8D9jtPTEKNjU1B
         3Yrw==
X-Gm-Message-State: AOAM530YMi1jRu978F2sGyon5H/ox8P6oAh0ROW/YVqBqmWORTtl0/u2
        CYXy99ZA4WrHGOdvgb+WfAlIH8U/jdNe/g==
X-Google-Smtp-Source: ABdhPJzrWRHN34EOxIx7WsXV+3mbDd6akgTvDc0b5JETAHrh2xJmi+yx/l15ZGRAJw7HAbV2Roypjw==
X-Received: by 2002:adf:8b09:: with SMTP id n9mr28542513wra.148.1621957463762;
        Tue, 25 May 2021 08:44:23 -0700 (PDT)
Received: from localhost.localdomain (plowpeople3.plus.com. [80.229.223.72])
        by smtp.gmail.com with ESMTPSA id a11sm16753212wrr.48.2021.05.25.08.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:44:23 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v2 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX controls
Date:   Tue, 25 May 2021 16:44:17 +0100
Message-Id: <20210525154417.7426-3-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210525154417.7426-1-david.plowman@raspberrypi.com>
References: <20210525154417.7426-1-david.plowman@raspberrypi.com>
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
2.17.1

