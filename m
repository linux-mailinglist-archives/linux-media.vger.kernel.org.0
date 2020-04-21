Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B841B2BA2
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 17:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgDUPvl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 11:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725994AbgDUPvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 11:51:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3864C061A10;
        Tue, 21 Apr 2020 08:51:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x18so17050250wrq.2;
        Tue, 21 Apr 2020 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=kcT8YhRThPhegOm3BQj7wUe66PuL6hDa8ErzC+LQvVA=;
        b=T/PyuRExpYtl18m3qkte0wueAWmWWpHTRgZgK8uwu12i+5YbEWa0GkQnamXwmmz2ym
         HnDhNv2mBoB9JSc/2zO24+fUuBTWzCT81vqx7x/beNBoW2Cd5JlP50LrNaiIDdARVTY8
         9sOn3cfal5fmxmyBKT2JFMwIzpFqAgVi9hKyEoKy3wy+BNKyqoyxTn7bgh02qlQqm7RA
         4jSQfhpNWkjxqAkY0QObUBLau0NXNyECQ6J7+J8P/AnZz/3VYvfv5HOxkawlcQ6q2RQF
         wXBghlmE8m7LWE8EISO7TF1NwV3wItGrFtlorZhTzNRY/p0HaUCSteOWlgJzbn1FNE26
         YtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kcT8YhRThPhegOm3BQj7wUe66PuL6hDa8ErzC+LQvVA=;
        b=cvNsezhPgw4mvaB58C6wJsgVjcFXx/uhyop07eo3U9GBKF1jCxmG2vbitadggrZE9k
         OL2tHVFjAI/ak3JQK9MixRN47jL57r7U0Px+qmtXfwgXNClDu/yFnXXBa7U+uEXsmZ9h
         OCD6gCzntN0Cn3uxCTmsb70GaSSANNZCfOGNZ9grqBAgCvGurG2aWoN4KQLqc9yXTLp0
         rjzxHMLSgbAoU/8Wu4UWArqxVXyUIzERFT9thXEiNxC/UChD+EgRgqGfB9XWTXI6BiOX
         elLRRPOw2iyvo/ClWHeyrRwdHfic/4vFPwphhEwGH4PxnvI0TJXVxY+7siREhI/H7S51
         eeZA==
X-Gm-Message-State: AGi0PuYS2oDcvQKB71NuQ1OUlFnezeGyOUpOHetmztZceJclIRbH6bn7
        q8ohc4E0YzBdDUl8qOSsRfN6NgTR
X-Google-Smtp-Source: APiQypLwxUr2g6yIkcRAqbgAzcYzXQ/xaGoq2pE5TKNjpKqN73rSSuaC3AUnTp3g8GDcaDbKPiJI/g==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr23192004wrt.98.1587484299782;
        Tue, 21 Apr 2020 08:51:39 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id v19sm4357664wra.57.2020.04.21.08.51.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Apr 2020 08:51:38 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, mchehab@kernel.org, ezequiel@collabora.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: media: rockchip-vpu: fix interrupt-names
Date:   Tue, 21 Apr 2020 17:51:31 +0200
Message-Id: <20200421155131.5839-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A test with the command below gives for example this error:

arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml: video-codec@ff350000:
interrupts: [[0, 9, 4]] is too short
arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml: video-codec@ff350000:
interrupt-names: ['vdpu'] is too short
arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml: video-codec@ff350000:
interrupt-names:0: 'vepu' was expected

With the conversion of rockchip-vpu.txt to yaml the correct
'interrupt-names' for rk3328 was not included, so add them now.
Also add 'minItems' to 'interrupts'for the completeness.

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-vpu.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index d7a42e6f9..27df18ad6 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -24,12 +24,15 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 1
     maxItems: 2
 
   interrupt-names:
-    items:
-      - const: vepu
+    oneOf:
       - const: vdpu
+      - items:
+        - const: vepu
+        - const: vdpu
 
   clocks:
     maxItems: 2
-- 
2.11.0

