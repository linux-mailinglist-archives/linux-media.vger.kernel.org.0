Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4459752DA47
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 18:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242032AbiESQ36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 12:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242045AbiESQ3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 12:29:55 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302A1D9E99;
        Thu, 19 May 2022 09:29:54 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id v66so7091995oib.3;
        Thu, 19 May 2022 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nWielQwKUjaGCDPYpC0qlz0e3JwhdCLUGqShkGf0aHY=;
        b=fKpqUT7H7BdkIbUfBb4GLkjD1bN9SIqIy7m9m5WOhDZHoiHnMmWZsaSheN572PWzqF
         kp8DP8En68d5EPuf0GiF6YBioPYQ2aNoqcNsx5x7QhpIwtmqIf2i0ygaU79bBCNX1awA
         /WYZTg7jisNrmr8Mr33FBWjoXTJZuzwbvPEmYGbPUQuCneGLqDdDR7DnjjL14yOvS4+F
         kalzy1U002ceRd6QSBU/2FcW7eVnl/BZkktShPBGxJEy0EUhVzVY7SzveusSAkNgXwUy
         vd4GDZx3qR2yb47RBDNbiqAqI2m/Ik9WL5oc4KiGasqoKjzMmGl0QwUrRVZ/hh+QDouS
         55IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nWielQwKUjaGCDPYpC0qlz0e3JwhdCLUGqShkGf0aHY=;
        b=Smm+V9gYl0ThxBpVOlB9DeuT66kQjKvOd/xZIivGDI4aeQOIf09wTd/xu9ChXNt0q+
         Gx8e4qB4A8Z7ySl96rLuDQpZCpCRpKfayFzvrosuyf//775U8gabp9jbzr4kHuK1jtth
         dDv+sm6khvIZFt7kag/q8714hy6OVVksUifCPT1l2JKBZhmqaI6deKx5Wu97+XuXaYCC
         XSjlmvrdjV63rqmyjMptmwqPm+WhxFljkeVBfP0dBKcW5HMimfBlFavDHY1HxRPU6Xo5
         vqtx47HGqDTWmropIzHFAcobjpuIUkSY+jSSLY1gRBGwvjOR4/++vSxRtTVV/mOaRhrz
         gEgQ==
X-Gm-Message-State: AOAM5326u6wThzxUuEbOSOTGTQ5X/iv+rjFDb82jdN3hS2+Lk8uw5v7g
        KC2/Ql70wb3ilZfxyv761gg=
X-Google-Smtp-Source: ABdhPJwyUBkfMLQeVNxghJT+ulgz5YHDxLS03g5x9fK3VD+DVNDzCSSRXmI3ieSkGIl1/RUzeFwJbg==
X-Received: by 2002:aca:c1c2:0:b0:328:e69b:d725 with SMTP id r185-20020acac1c2000000b00328e69bd725mr2990064oif.266.1652977792109;
        Thu, 19 May 2022 09:29:52 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 09:29:51 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [RESEND 2/6 v2] media: uapi: Document format MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date:   Thu, 19 May 2022 11:29:31 -0500
Message-Id: <20220519162935.1585-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for MEDIA_BUS_FMT_RGB565_1X24_CPADHI. This format is used
by the Geekworm MZP280 panel which interfaces with the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 0cbc045d5..e43e07634 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -624,6 +624,43 @@ The following tables list existing packed RGB formats.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
+    * .. _MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+
+      - MEDIA_BUS_FMT_RGB565_1X24_CPADHI
+      - 0x101e
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - 0
+      - 0
+      - 0
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
     * .. _MEDIA-BUS-FMT-BGR565-2X8-BE:
 
       - MEDIA_BUS_FMT_BGR565_2X8_BE
-- 
2.25.1

