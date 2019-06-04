Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC2C734D6F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfFDQaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33853 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbfFDQaI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id w9so2655856wmd.1;
        Tue, 04 Jun 2019 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ItpZv98uGNXVHvsKA+wMDHUe83WSTbZUJdpb4oIfkI=;
        b=bo/YprrUKpC6Rpn6p9wmA2Zo//yrk66+wgvE05Q3EMN6NO4KgNta/Stz+nJy7hfou6
         s+T2+EHU4pICuut13QgBFR6KDRy0fSfap6aQKrnkhsFuGx6LtoesevGE1P3oD/Iljigg
         u+It7fJRJ7CVlLdWVJCk9tNRtPe4ugbFSx8kIPYaDTXo6UZ4jRZeexkUJUYSCqrXhWHn
         qzGRcUZEBxLGwEEEbXt5CKLOQaR8yCw+hJhUxHRsvmkUX8qJ72HOOH8tb4u5x8DLHt0j
         rtjNUX1NNqOO0AfJtBVUO1QPX3AF+YHJhh+o+qIDhmYjj851E/tTV0RD3xHPh6hU0NI0
         cHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ItpZv98uGNXVHvsKA+wMDHUe83WSTbZUJdpb4oIfkI=;
        b=FcFMZBG17/IAEccizPm0A/RBGanUG9wHJp+an2l7+g0MuJL3dCc0Sx2XniAVBJCUNV
         lJxbl8u3PNoK9Nug6N++zcLSWFGfo4VepdjKNwGC/RnCJj6l4NUZpFsRY+hZJUy/mriQ
         CLkxm9E7WxSkJDDBO25v/7zbHorpnUhc+25rzTl6t6ogADIYm4MSKUmdPuw3VckUZQda
         W5to28KakHr03Ey2fQq9ZD8pwLC1nM73j7HRNNIsSiZPTrtsVrVuUuVYBJbJWCNxn7BM
         oqc7WcL4cvNWI9mOtN2yDfWtRy/TwHpr7+hyykOb2ZNGCcqrQ2Tj6Yvwb4jevcPE9qyV
         R23g==
X-Gm-Message-State: APjAAAXdyMef7+y5KU0+mQCWtVWSm/QtqD3cJP0ERV7oMe7K//xcy9C/
        B9aRhxiL8TVjOFzKFLqL2g0=
X-Google-Smtp-Source: APXvYqyuxr/eS6LF9BsE1JCeLrvKAvLnu/CvPjkOoH4LergYJP1rASUPPT4CJf5ubSK8EpGRgf1Xmw==
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr19492073wma.164.1559665806209;
        Tue, 04 Jun 2019 09:30:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:05 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 01/13] dt-bindings: media: sunxi-ir: Add A31 compatible
Date:   Tue,  4 Jun 2019 18:29:47 +0200
Message-Id: <20190604162959.29199-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner A31 has introduced a new memory mapping and a
reset line.

The difference in memory mapping are :

- In the configure register there is a new sample bit
  and Allwinner has introduced the active threshold feature.

- In the status register a new STAT bit is present.

Note: CGPO and DRQ_EN bits are removed on A31 but present on A13
and on new SoCs like A64/H6.
This is actually not an issue as these bits are togglable and new
SoCs have a dedicated bindings.

Introduce this bindings to make a difference since this generation.
And declare the reset line required since A31.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 Documentation/devicetree/bindings/media/sunxi-ir.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index 278098987edb..2e59a32a7e33 100644
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -1,16 +1,21 @@
 Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
 
 Required properties:
-- compatible	    : "allwinner,sun4i-a10-ir" or "allwinner,sun5i-a13-ir"
+- compatible	    :
+	"allwinner,sun4i-a10-ir"
+	"allwinner,sun5i-a13-ir"
+	"allwinner,sun6i-a31-ir"
 - clocks	    : list of clock specifiers, corresponding to
 		      entries in clock-names property;
 - clock-names	    : should contain "apb" and "ir" entries;
 - interrupts	    : should contain IR IRQ number;
 - reg		    : should contain IO map address for IR.
 
+Required properties since A31:
+- resets	    : phandle + reset specifier pair
+
 Optional properties:
 - linux,rc-map-name: see rc.txt file in the same directory.
-- resets : phandle + reset specifier pair
 - clock-frequency  : IR Receiver clock frequency, in Hertz. Defaults to 8 MHz
 		     if missing.
 
-- 
2.20.1

