Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299E249855E
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243968AbiAXQzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243965AbiAXQzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:55:38 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD91AC06173B;
        Mon, 24 Jan 2022 08:55:37 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id o9-20020a9d7189000000b0059ee49b4f0fso5946082otj.2;
        Mon, 24 Jan 2022 08:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AX9/X1WhGwP2sW6zC/gqprghPkVPPG9iN/vljmKSmiY=;
        b=FgzaUXmypV3YeAIfgGVpijUhyc60TGq2ToNV/Neau6pnsdwqhRAz90rLlT6+4KHKhs
         +xK+TIrXHlVQZOF/MQ5p0d7T1fbPqw8woSNqTG/zbW6avLTkS/4fe0SM8ciQThSlFKoH
         wdU2F+KMcYHa1WRUpkeCVpAgyAyyVBO60vFL9V5ogbI02LAI5zVTsU/FNGCdHNMeW+mk
         kU+eRwL6afo5WPXTpmfy3RL5fE9VACLPVgJGCPi01bgDeQHyxghTCnP5v8+h2ec87HGF
         73dcVb0Uoaztz/g3K2q7Pq0LWEpjN3F8PHgeK7MD2UJnwq6MRTm5HvEfOSHCQntMJJ8I
         zSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AX9/X1WhGwP2sW6zC/gqprghPkVPPG9iN/vljmKSmiY=;
        b=C7xWk1z1aNZf+b6LXN8UP5byOreatJio1+rCpS9TxmHPPRrVNwnEpMawVQLdaIk/lu
         4MvRsdJbVABP/XeGDKhOZalmc+tEeq8rOZQQtLwpyzidKt5BNDL/1/wC9RV9TiHCEsGP
         xAA4w9XwxDkTvoNnmbe13Ne6VsHmeXDrO1BbtEBNbezh5dbHr3hANi4T+dbuM0XtIkVB
         7dWalmXjRWz2TuPMTsICXI5l1q2XGV562zz5Fzx8hdsnS5532jstvEUXIHJ3l7ZYbHvY
         1Gwe49pzpdXPUs1wJsJYyBLoueF7b4i6NPAu9tQ5FCOYmMjVu9tGzHiKE/w3qfnG8Ra9
         gBwQ==
X-Gm-Message-State: AOAM5329nQouNkHHpKGMhgZIDUpRFffwQiYq3QIItbAYBW3awiPsUW4/
        Sfq9ckMT/VhqCUcEJses0Es=
X-Google-Smtp-Source: ABdhPJzTycVD+fT17ONLf05HsIjgUbYM0QDZTOZuMTDXij/vPYP0gqVUGR0KxqWR9rpe33WLQmcR5w==
X-Received: by 2002:a9d:f24:: with SMTP id 33mr12204646ott.282.1643043337224;
        Mon, 24 Jan 2022 08:55:37 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:55:36 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/6 v2] dt-bindings: display: simple: add Geekworm MZP280 Panel
Date:   Mon, 24 Jan 2022 10:55:24 -0600
Message-Id: <20220124165526.1104-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

