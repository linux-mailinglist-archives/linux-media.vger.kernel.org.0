Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34305C9D19
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbfJCLWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:22:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40438 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729880AbfJCLW3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 07:22:29 -0400
Received: by mail-pf1-f193.google.com with SMTP id x127so1553553pfb.7
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4vvWZOnDaYB306KLyalX1Vu4JeBx1avHtcxqLv3dAQI=;
        b=XLnU6ZGBqa577KBUFDzfnYkNp6/eIoX6Pq9euUphJF1eaLkGpQyppKve1wUxuESwu5
         ZJvOyoz7Fjr+XB+RNcksDtCovFTo3ED706fd3n3IH2W4NWqquJz+ijcLNcbGryn4DTjs
         55VDB8F/RFZ4jOgbmebt8kgKu+sISxrGzicyARLK1gbwIeKiIDA/YnY2oROdTtgXo9Lp
         OhgwAiEmccjOVtNmAa25PRDCf+fOl4AqZJwpjOekZT6+jrEjcGb3ZiOpJSLV4Nc0LmGG
         YHPOh5KemQuBPqNnHLJbuZPqFqbs8hwaM6Sz1REmnrszkUwm6Y6AJ+oQvdDFSQPGqO+A
         IjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4vvWZOnDaYB306KLyalX1Vu4JeBx1avHtcxqLv3dAQI=;
        b=EPKWz0tk/RkkiPx0GrVDg4SarZL9D+QC6QFZpq4CZLiwNkktmvvYfpOyYz1G5ozzpB
         PERKTjXcNsw/kZdlQTIau/rL1PxiHZ50Q3zL2uJ5HqBjOK9z8O+a8tz3H/Rp98qxSX4p
         GPlMj6mLo8nMADZcMxwlK2OAZ3ZnIX0+dM2Bj9qhYvL3UJ0kJbp9h+4qP7PSjDBmSzXg
         RanXe/C5K9VnOBrnSsqVk4V3SdFUhQiAayZjE04U21Zw/rl6gId363JNzXrVcU8WNoBY
         cdOaZ+BhKdEP3UowVgVI9I3mvGGCk3DAcKfPJ/H7BOUaqjvgk4FPOPTYAfyLAPNO6yB3
         RAuA==
X-Gm-Message-State: APjAAAU0A8XsKg6FuwWRipXS5J0ALSMLyBNBPmJtbLoMk9nPazIf13Gs
        wqtcXPYbWUzdOzAW0DQiJ/CUyg==
X-Google-Smtp-Source: APXvYqyo/GBuKYMgok2Qu85GyYWcZ/kBG23UO0oZtmNIMkGIJX0uwqdZO5n/Gy1IyWW72l28hy/lCQ==
X-Received: by 2002:a65:4543:: with SMTP id x3mr8479928pgr.300.1570101748857;
        Thu, 03 Oct 2019 04:22:28 -0700 (PDT)
Received: from localhost ([49.248.175.14])
        by smtp.gmail.com with ESMTPSA id k8sm1998881pgm.14.2019.10.03.04.22.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 04:22:28 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: dt-bindings: media: Fixup Allwinner A10 CSI binding
Date:   Thu,  3 Oct 2019 16:52:24 +0530
Message-Id: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This new binding fails dt_binding_check due to a typo. Fix it up.

linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
make[1]: *** [dt_binding_check] Error 2

Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 27f38eed389e4..5dd1cf490cd9d 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
+$id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-csi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
-- 
2.17.1

