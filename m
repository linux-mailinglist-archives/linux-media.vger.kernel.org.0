Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947C2638B41
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 14:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbiKYNec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 08:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiKYNea (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 08:34:30 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA1427930
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 05:34:29 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id z63so6437601ede.1
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeY57UYeehZ/CFsKD0+hYGBmzYqQeQQW2LicLW4VUQs=;
        b=FR5Snu9X1VeiQqi3igFgpmEKA4FbwHz0hZ4Hh9CZiGl0IhZrAC/30wXy4JEy8pzpyh
         kOHeIqp9ygW1DEj9toRL+A3EtxIyRpTJh4swCVrd2QgwDif4DhNAL75E0tufMdbsj3Qe
         vKgi+EHt9LZtMoMNp2zRtL+oRQ224PlxcE67P9glzDB7WjXCvJ7QC/P+6l9hzSxaTmyk
         TcS+A++lcwgg0fmtCHy+apCCiaTAI87Q2oQfJgt43fkN+w3IUo3mO6gduq8XwvIIvEHy
         JuMpFSskMRVDua+18Y1iw/3ogBDM20mHGSE6rXJsYnsPrLK4B2Ih4jhTG2nopu4Kq8Sf
         sfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeY57UYeehZ/CFsKD0+hYGBmzYqQeQQW2LicLW4VUQs=;
        b=UnBuVjyTg5VjnOLAyp/F5Vhot0LlBKiLXidVxwytk3+h5jdXw73/JyqOfiUkA/5Tu8
         gMEspfIwUbupKIxlRZXsc7VDAjSq01Xq7QEnt0+/QqJ9yFuXlLM+gSlG4TAPpJ0w0Gwr
         ni8++nECC7WkR3yIIjy4v+85gYYCdeCigVy/99UTrulVzZ0CJ4q2Y2GAFva86UjgFgkG
         ZgKVzBMDPAut0y6oZKHEkJy0tE07rwL20oFeZML3g7a3NQo+KhgqBP+qjapKzD9sNmhz
         /CKwjy0ryVUaFVW6Jalyn7IP8cwS90JrvdGJrbQDRT8g9/cIii6X4Ptx+AsQpkExTPeh
         ezlQ==
X-Gm-Message-State: ANoB5pknuRZpvWFElhk51dFpbq+zI+n/7yL0RAQumknR3XBjLngRDoPv
        53rJwev+L18GzCPWxFZnGwfe51Tl4QU/Yh2sUVkmCfG7VEqPOVNLzp514QsPKR+N9PDgB+//Nah
        KTkAG/VdfCZvq4q6inOUtC0glpL6iFT/NEJhFpiA17pUfAPJ17gYUe4fjc6eBPVfa+7iP6vs8
X-Google-Smtp-Source: AA0mqf61GlgRZisS0iM3nQ/luYvsPo3u3+B/unnfASTuiqmNyQoPlNoWTbvZuS8BKECVghNTBTFIwg==
X-Received: by 2002:a05:6402:5c7:b0:469:6e8f:74c1 with SMTP id n7-20020a05640205c700b004696e8f74c1mr17614764edx.334.1669383268308;
        Fri, 25 Nov 2022 05:34:28 -0800 (PST)
Received: from melexis ([2a02:2378:1085:b41d:1fad:f315:d8eb:738b])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b00779a605c777sm843756ejh.192.2022.11.25.05.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 05:34:27 -0800 (PST)
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
Subject: [PATCH v3 3/8] media: Documentation: v4l: Add TOF class controls
Date:   Fri, 25 Nov 2022 15:34:06 +0200
Message-Id: <01cfeb602d52456bed08c89da356474474361e73.1669381013.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669381013.git.vkh@melexis.com>
References: <cover.1669381013.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
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
---
 .../userspace-api/media/v4l/common.rst        |  1 +
 .../userspace-api/media/v4l/ext-ctrls-tof.rst | 35 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++++
 3 files changed, 43 insertions(+)
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
index 000000000000..8902cc7cd47b
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _tof-controls:
+
+***************************************
+Time of Flight Camera Control Reference
+***************************************
+
+The Time of Flight class includes controls for digital features
+of TOF camera.
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
+    in degrees. A distance/confidence picture is obtained by merging
+    3..8 captures of the same scene using different phase shifts(some
+    TOF sensors use different frequency modulation).
+
+    The maximum array size is driver specific.
+
+``V4L2_CID_TOF_FMOD (dynamic array u8)``
+    The control sets the modulation frequency(in Mhz) per each phase.
+    The maximum array size is driver specific.
+
+``V4L2_CID_TOF_TINT (dynamic array u16)``
+    The control sets the integration time(in us) per each phase.
+    The maximum array size is driver specific.
diff --git a/MAINTAINERS b/MAINTAINERS
index aa1974054fce..a2bc2ce53056 100644
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

