Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD01640A3A
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 17:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbiLBQH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 11:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbiLBQHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 11:07:53 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353BB25E8F
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 08:07:51 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id d20so7154002edn.0
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 08:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwv58T09d/KB7jqX1V9halxszsP4/34vGrJ0OjWbt8U=;
        b=XxclInnMyqmh/SZshAAbX6onBtcXowCuQsQDyCIc3TWQtz8dO2QiXILEwEIlYnxiOm
         4nfeB6WcPIJ3ugF2TXOyJ04Z6QohPQOm0eZ3pH+u6X8PSgsWafJNimkAlFlF7OKotjcc
         j1KkJE3kEo7veN89HPP2DW+7cSsELKlZJo8XJtOyHOjGxLsyxFJeWDbzMq/YF6aM7c94
         EUM55Af2efbwJ1V1w5MzK3mJjJojk6J+p0lVi2PXOJX+RIlCET4iTvBIG3hWQ1x8vTIN
         uCV+A2VegBgulbTS9GJ2N/vRMQf9C5jO2ifQsfM6BtpQ/IrxXoHrJ0V3WaSCg2Fy2H8b
         5AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dwv58T09d/KB7jqX1V9halxszsP4/34vGrJ0OjWbt8U=;
        b=JAwKe09EsdRtSHqp30wIJzntXjiw72PRX5CBiy+fGuyIma2bK1FnBY+d1yqgenzVwi
         p+8S5LD5hQoP71E3+OGfx41SY3M3yih7+Fryj1f7QByb7h1il+GNulUAY7ggizW2/ymQ
         umFw9U6k+NOH8/auxBn5n9zhR5Bl6O3AuaGdRIVKAyUKSRhv1fc7D8vkZ5nt1EZrSXiG
         BLEBm82+JUT2Pcne6Hwpbkr5tFUDndmpWzQSOlvsVTS5pzYSh90zU7n/lKIvgJs6iAtY
         wpvOlG4rn/AdkSwP0sp0IeXXYNtZfGfIpoxOHJQj51FMZ8jaSA+N1J9zaavoIq50btvf
         3Ezg==
X-Gm-Message-State: ANoB5pmXW6yukCi5x1NjOoQIIITgnh9nbUwwQYfTwizJyCi6OpnP17og
        Vr6AYbkOpkkXjTC2Pd98+BC8beGgH6Q196YHa1rwsqRhgfYAj6y2HAvM/sQOA6Y8CXNzr+U5pys
        PICsQ7oAD5Jrz/9QEDNetqAn/h6T4pprReYTgOTC8ynkLPltMP66Q/2LAEAmOHygjahpc0V/P7L
        A=
X-Google-Smtp-Source: AA0mqf5EByCNdrzRt/dX8oTXLVB71IJRsHwEdQ4zkcRQe7BTn1zMR+m7aS3V2KL5w9YA6WVUcaM0iw==
X-Received: by 2002:a05:6402:910:b0:468:74:9668 with SMTP id g16-20020a056402091000b0046800749668mr4642915edz.394.1669997269620;
        Fri, 02 Dec 2022 08:07:49 -0800 (PST)
Received: from melexis ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id v6-20020a170906180600b007c0c679ca2fsm800538eje.26.2022.12.02.08.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:07:49 -0800 (PST)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     <linux-media@vger.kernel.org>
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v4 3/8] media: Documentation: v4l: Add TOF class controls
Date:   Fri,  2 Dec 2022 18:07:33 +0200
Message-Id: <73057b03463bbaccc7780418f7b32518fe17a144.1669978791.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669978791.git.vkh@melexis.com>
References: <cover.1669978791.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add description about V4L2_CID_TOF_PHASE_SEQ, V4L2_CID_TOF_FMOD
and V4L2_CID_TOF_TINT.
Also updated MAINTAINERS with new ext-ctrls-tof file.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 .../userspace-api/media/v4l/common.rst        |  1 +
 .../userspace-api/media/v4l/ext-ctrls-tof.rst | 56 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 3 files changed, 64 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst

diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index ea0435182e44..1ea79e453066 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -52,6 +52,7 @@ applicable to all devices.
     ext-ctrls-fm-rx
     ext-ctrls-detect
     ext-ctrls-colorimetry
+    ext-ctrls-tof
     fourcc
     format
     planar-apis
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
new file mode 100644
index 000000000000..62a5a316fb77
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _tof-controls:
+
+***************************************
+Time of Flight Camera Control Reference
+***************************************
+
+The Time of Flight class includes controls for digital features
+of the TOF sensor.
+
+TOF sensor is a receiver chip. Each pixel in the sensor measures the travel time
+of light to that pixel and hence the distance to the object seen by that pixel.
+There are different types of TOF sensors. Direct TOF sensors (also known
+as Lidars) send a single pulse and measure direct time of flight.
+Another type of TOF is indirect TOF sensors, which emit continuous wave
+(could be radio or infrared) and then measure phase shift of reflected light.
+The sensor modulates outgoing light and then collects reflected photons
+as an electric charge with modulated pattern. Knowing the frequency of
+the pattern you can calculate the real distance.
+
+For more information about TOF sensors see
+`TOF <https://en.wikipedia.org/wiki/Time-of-flight_camera>`__ from Wikipedia.
+Also, there are other nice explanations from vendors about indirect TOF:
+`Microsoft <https://devblogs.microsoft.com/azure-depth-platform/understanding-indirect-tof-depth-sensing/>`__,
+`Melexis <https://media.melexis.com/-/media/files/documents/application-notes/time-of-flight-basics-application-note-melexis.pdf>`__,
+`TI <https://www.ti.com/lit/wp/sloa190b/sloa190b.pdf?ts=1657842732275&ref_url=https%253A%252F%252Fwww.google.com%252F>`__.
+
+.. _tof-control-id:
+
+Time of Flight Camera Control IDs
+=================================
+
+``V4L2_CID_TOF_CLASS (class)``
+    The TOF class descriptor. Calling :ref:`VIDIOC_QUERYCTRL` for
+    this control will return a description of this control class.
+
+``V4L2_CID_TOF_PHASE_SEQ (dynamic array u16)``
+    Change the shift between illumination and sampling for each phase
+    in degrees. The distance / amplitude (confidence) pictures are obtained
+    by merging 3..8 captures of the same scene using different phase shifts
+    (some TOF sensors use different frequency modulations).
+
+    The size of dynamic array specify the number of captures.
+    Also driver may decide whether V4L2_CID_TOF_FREQ_MOD and
+    V4L2_CID_TOF_TIME_INTEGRATION should change the number
+    of captures or rely on V4L2_CID_TOF_PHASE_SEQ control.
+    The maximum size of the array is driver specific.
+
+``V4L2_CID_TOF_FREQ_MOD (dynamic array u8)``
+    The control sets the modulation frequency (in Mhz) for each phase.
+    The maximum array size is driver specific.
+
+``V4L2_CID_TOF_TIME_INTEGRATION (dynamic array u16)``
+    The control sets the integration time (in us) for each phase.
+    The maximum array size is driver specific.
diff --git a/MAINTAINERS b/MAINTAINERS
index 6f4ff0ef4523..6f9072f3b1da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13111,6 +13111,13 @@ S:	Supported
 W:	http://www.melexis.com
 F:	drivers/iio/temperature/mlx90632.c
 
+MELEXIS MLX7502X DRIVER
+M:	Volodymyr Kharuk <vkh@melexis.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+W:	http://www.melexis.com
+F:	Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
+
 MELFAS MIP4 TOUCHSCREEN DRIVER
 M:	Sangwon Jee <jeesw@melfas.com>
 S:	Supported
-- 
BR,
Volodymyr Kharuk

