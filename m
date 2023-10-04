Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580667B788C
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 09:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241497AbjJDHUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 03:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjJDHUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 03:20:07 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D21B4
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 00:20:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9ad8a822508so325466866b.0
        for <linux-media@vger.kernel.org>; Wed, 04 Oct 2023 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1696404002; x=1697008802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imCZDPmKhvVM5uCss54/MVO/bMAfcXA+npTIcf/0h0w=;
        b=iBRyId7TO5HeRByR58oUeIYOaPX/X1NcxR3yr/EtkGS+cfdkG+bK2kD0vJq9Xy4Esr
         bxQG12E7ajBKgPxXUMRL0IQPZhYwVzg2hje++Oz32jfRLR5ecmwuCgByjpTqXLsJD0dU
         KMFdg6QkioAZHI7LukwZZC4/2Ul2UlSHzGCoD/nizoR4T1JUUO6Z9PWTr1ezXXfOphWd
         4aW7n8k7DEN03SV3UqQJcbitXupCxFPGQD4gw2inu9yyvfWfOvNRMHhto292CSMJbsw4
         xTSBO2tBX/Jlzgq43EOpHtCXhhkGn0B639faR/KxtE/V2RhSNKmZpOmH7pSW5/5cWTdo
         /XzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696404002; x=1697008802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imCZDPmKhvVM5uCss54/MVO/bMAfcXA+npTIcf/0h0w=;
        b=O9FNryxBJbSWgXwgU6kgCo2fIYrUJLI1plewWALXVct2/Hdv8/glSjWWHRytHpbr4h
         6xI4Pgcvey8tRivdOISRYubPyA7AUjWM08y/HG7tQIlo76TZnuaZjlPbYZaXiBCAYnbE
         nDQslxVy1eJkGEUOfKXaKB01Ss3R6s0YaKY7/ATo0hrrEQ9BYKpAjM5AU4euuvEGaUPz
         kiecNzSqP3xSiV1tlemOC3xtdy0kZgZTXTIpOZjRPLH8IQEJPlnVPsw5txrkbb8Sjv3Z
         xYkwp+GyUP3zkKPug/GWEmsVP8D64eYf0MDW++uPahbmpzZnaUUUGt6qX87TZ+xB4uml
         3GEg==
X-Gm-Message-State: AOJu0Yxg8v2Dm1CXikoJy03dBDTUQ8kyIlIU9rOq2iFrGg+njwiXLaRo
        ZdF9a5IdY3T2x0zTqhN88uqcWoh5+b4ZqTAPvak2oXAfvR75N87rz0aVna2E7iH8Uf4ye1xQ3NX
        wD6FgcoVuUCcI5Mn4ZoqhM1Rp0+7k82jrpuZixcZqxJDjCLnnsiJQVFH3U/7ZpsEF4/cQIoSN6f
        1veg==
X-Google-Smtp-Source: AGHT+IFMm8w0C4PCwzMFMnjGndx3ZM5io7F841AB/gBJW5UhU2tXXwWRKLFJ62oDLGZU4EhQcnmaDw==
X-Received: by 2002:a17:906:1ba9:b0:9ae:57b8:ad1b with SMTP id r9-20020a1709061ba900b009ae57b8ad1bmr1194421ejg.21.1696404001814;
        Wed, 04 Oct 2023 00:20:01 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906058b00b009add084a00csm2285935ejn.36.2023.10.04.00.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:20:01 -0700 (PDT)
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
Subject: [PATCH v5 3/8] media: Documentation: v4l: Add TOF class controls
Date:   Wed,  4 Oct 2023 10:19:42 +0300
Message-Id: <4f8f84b835e15c17e2277f1f76f073aa3901ed73.1696347109.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1696347109.git.vkh@melexis.com>
References: <cover.1696347109.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add description about V4L2_CID_TOF_PHASE_SEQ, V4L2_CID_TOF_FMOD
and V4L2_CID_TOF_TINT.
Also updated MAINTAINERS with new ext-ctrls-tof file.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
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
index 000000000000..fd8969d3d354
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
+``V4L2_CID_TOF_FREQ_MOD (dynamic array u32)``
+    The control sets the modulation frequency (in Hz) for each phase.
+    The maximum array size is driver specific.
+
+``V4L2_CID_TOF_TIME_INTEGRATION (dynamic array u16)``
+    The control sets the integration time (in us) for each phase.
+    The maximum array size is driver specific.
diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..83e325e273dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13557,6 +13557,13 @@ S:	Supported
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

