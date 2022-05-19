Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041D152DA43
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 18:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242051AbiESQaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 12:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242025AbiESQ35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 12:29:57 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F071D809B;
        Thu, 19 May 2022 09:29:56 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id i66so7050818oia.11;
        Thu, 19 May 2022 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AX9/X1WhGwP2sW6zC/gqprghPkVPPG9iN/vljmKSmiY=;
        b=nLnb8w0IzSBYnMFzS1IhicdSlHzUYxbCMFGJqvuo3m0qXA3QcbrkQSeM7hM/8rK4jx
         mOx0UMUO9KnSM6hNGlqxJASOqn1tgaXLJ7vbQK8PwHUEUZLZmkjoaCM0UFTwjf78AcEf
         kfyiz35sSW2yKYyJSx++g+0D/1OZ2DuGobKmGDEx/tMPpqwO89kffjyvEcMxC1jc46ME
         T4qySg2xC1Y6M7+0dvElqsgGg9ZAJoJbG3Sbcinz0FaBx36RjsfPrPJN3aWjyFzJ0bJc
         cIOYzng97MKpxDSJAKHga30m357aP2nrP/NuGO6V0nNFVI+4WpT7OGJmBzAyXn/cWUfq
         3uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AX9/X1WhGwP2sW6zC/gqprghPkVPPG9iN/vljmKSmiY=;
        b=haNbwxGg7/C5uBPY34otSIQkgfwkyrkCb5h9V4HW1jQ67/9bTbUIfqsnd9AhWA44G2
         eum54bobXDGjPIwQmYxHRR7TowuS+XEjVuVY6xVs5vdZQU9vqOh3RoN3ApM3ACS+jKkK
         RiBKTP6tPSPWuwJ/dhs1BNeZeXE6RWO+mAU2jonV72NQyfSRNERN7v6VqkUORxmjGRB/
         Jx+Ixc/L5PPlNpQ5cxZqCRwqFZP8gB5ex510n9ouXeucP8cgfR+D5rAsNMTRK045efl8
         pzXX7JXDllwYmcQlKhB1iB71VUs5PD/l16DK+RF0L9bG1b6KK58wKOvqjD5NKSWazkvi
         ny0g==
X-Gm-Message-State: AOAM532qOU1zPhPHetXVnYKT01Bz03ehP2+/kwt4oM9gkgtOLEIy2v4z
        cpMqCmIp3e74EMloJn+Y5eM=
X-Google-Smtp-Source: ABdhPJwc6e4QT4kM6B3yl+F2WyUKXDcuVoQUxVTEAxOVOcdgzYKTKKLYDQK8HOqGTWd10+5x83QWrg==
X-Received: by 2002:a05:6808:bcf:b0:329:867:a994 with SMTP id o15-20020a0568080bcf00b003290867a994mr2791869oik.249.1652977794485;
        Thu, 19 May 2022 09:29:54 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 09:29:54 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [RESEND 4/6 v2] dt-bindings: display: simple: add Geekworm MZP280 Panel
Date:   Thu, 19 May 2022 11:29:33 -0500
Message-Id: <20220519162935.1585-5-macroalpha82@gmail.com>
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

The Geekworm MZP280 panel is a 480x640 (portrait) panel with a
capacitive touch interface and a 40 pin header meant to interface
directly with the Raspberry Pi. The screen is 2.8 inches diagonally,
and there appear to be at least 4 distinct versions all with the same
panel timings.

Timings were derived from drivers posted on the github located here:
https://github.com/tianyoujian/MZDPI/tree/master/vga

Additional details about this panel family can be found here:
https://wiki.geekworm.com/2.8_inch_Touch_Screen_for_Pi_zero

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 62f5f050c..3d03d8276 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -148,6 +148,8 @@ properties:
       - frida,frd350h54004
         # FriendlyELEC HD702E 800x1280 LCD panel
       - friendlyarm,hd702e
+        # Geekworm MZP280 2.8" 480x640 LCD panel with capacitive touch
+      - geekworm,mzp280
         # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
       - giantplus,gpg48273qs5
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
-- 
2.25.1

