Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B8D68A2C2
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbjBCTR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233325AbjBCTRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:17:25 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEECA6C10B
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:17:22 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id q8so4618487wmo.5
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfzqUS/ISMtqujGi5r+HM5qWXhRYCbGlaSQrST7SLwo=;
        b=dqutk9GlnBQSpuKhf1i5+Rm8vNkS4vE/hyvmT23IPkT7VXUAtxGDGHPIx8YJ84g/IW
         XPEvYSeaEG1Cv/06WGwkOHJfApD5TKaLHi4VnF64/CqXo19l1mlnj7Ly8tOFp0gOJTf3
         5HY3l4xwFoVFDmKiIMdLtlIJGRkyTS1OJqEo50ZRCn8Imq7JU4uCeevjkr9If+Fbl3zD
         dwkJNvc7X800g/+LVhF+ySeJvk7N6KgfIkrgLHwX5b7cR8wQ1fttYrg6HinVTfi5S0Ig
         bZ51AQYTvoysYp60UMpL+SjGp0PnZa9HnwqOssfW9s4nWBGrzbrrY9/ABzDQREpm+N/H
         0vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfzqUS/ISMtqujGi5r+HM5qWXhRYCbGlaSQrST7SLwo=;
        b=JDVc38QzDiQIO/bsd4caXOfNn9y8mFV/6i/EukLrRlnGkL0OvmiwOgGN7tPLD1FXzg
         c9ZtqFchMhAmauRXgn07FmVyPAxBd6iLecEz5EjQKlztEgiVRBbe+v5SlgsBDWmjNabk
         4/T0fqKqm/1bAzpNl2rv9H/iD4z7WmwEwSyNwaRezdIMLMwvaj/I3O8I6hLy63tknzoD
         qiQeNhWE2i4l0ZT6dx0RiD/eD9QkZLYg8uR/4bmB/aVA3sWCnnoqRMnyagXM3yynx04b
         bR1N0yRyMU44lZl4mpm1D1aXo5YO8YzDqS6bGr4sTlR/8OB+YZHv+VqAzpaR8cmuVhNr
         kOXw==
X-Gm-Message-State: AO0yUKWZfN1KLGnan1Om94sKStAbJliRJq6CVcUojxzKaW3O1Y+35scW
        HOrxfiRsBfANVIx/iWfxZSa7tg==
X-Google-Smtp-Source: AK7set+wRgr97cAa7Ylthm7pFC6qkj1IxU8Sqeie6yidZdvWqrjtKmsWEw/gmvkT9NwRIg0awEg6SA==
X-Received: by 2002:a1c:7906:0:b0:3d3:49db:9b25 with SMTP id l6-20020a1c7906000000b003d349db9b25mr10830652wme.26.1675451841452;
        Fri, 03 Feb 2023 11:17:21 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id l20-20020a05600c089400b003dc41a9836esm3349263wmp.43.2023.02.03.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:17:21 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add mono version to IMX290 bindings
Date:   Fri,  3 Feb 2023 19:16:43 +0000
Message-Id: <20230203191644.947643-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203191644.947643-1-dave.stevenson@raspberrypi.com>
References: <20230203191644.947643-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX290 module is available as either monochrome or colour and
the variant is not detectable at runtime.

Add a new compatible string for the monochrome version.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/sony,imx290.yaml          | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index 21377daae026..dacecb0cd9aa 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -12,15 +12,23 @@ maintainers:
 
 description: |-
   The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with Square
-  Pixel for Color Cameras. It is programmable through I2C and 4-wire
-  interfaces. The sensor output is available via CMOS logic parallel SDR
-  output, Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2
-  bus is the default. No bindings have been defined for the other busses.
+  Pixel, available in either mono or colour variants.
+  It is programmable through I2C and 4-wire interfaces.
+
+  The sensor output is available via CMOS logic parallel SDR output, Low voltage
+  LVDS DDR output and CSI-2 serial data output. The CSI-2 bus is the default.
+  No bindings have been defined for the other busses.
+
+  imx290lqr is the full model identifier for the colour variant. "sony,imx290"
+  is treated the same as this as it was the original compatible string.
+  imx290llr is the mono version of the sensor.
 
 properties:
   compatible:
     enum:
       - sony,imx290
+      - sony,imx290lqr
+      - sony,imx290llr
 
   reg:
     maxItems: 1
-- 
2.34.1

