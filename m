Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D69DC2AC78
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfEZWZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:25:47 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54113 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfEZWZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:47 -0400
Received: by mail-wm1-f68.google.com with SMTP id d17so1075205wmb.3;
        Sun, 26 May 2019 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K/XHCO5OpLMI7hm5w9MXtKPLk5GaTtp3symSRQtLrEY=;
        b=qvVdO1Ye4+/XAXtZVdsjjXyBiA9UbG/W56OF45mm+eREeUn7sXXC3zn78MNG9RDc74
         m8SFOUOKex8fNj8gGw2zWgBNxPQcy84SJLJmYhZTNJ46S7ua13TWTvBSnvrhO1rtqnT2
         DPGzNpLOW7TMds16+uLtVPJL3XjpKV1sauyZrR30M8iPCi/4cQo4iPZnnC9cmq2+z27s
         9xQ0TB6H2PHnVJ46ZjDYf9AoXA+/Ig7In+UyImznSlah8/ZWMQ+nuQqaXJcqI6NnBCpY
         UsvUN9eIRyqdtvPU8E85lWMoTdZZ4uPC5A5Z0PyLooWY8fXyA9j+Sed97RzBqFVRJ4c7
         Btmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K/XHCO5OpLMI7hm5w9MXtKPLk5GaTtp3symSRQtLrEY=;
        b=bpy3Yj87WuwptT/5LJfOJLStOjU7HcGEr3M9YiUOQlwo32EXGuvkE+gmSFoUk/1UP1
         GLCY/UR9CzY8eK8wbGh+quMHjRQuRz9lGQIXzAArAXtbqnzDFyKyfo26myFU/mrmd493
         8tmBwbitGbej8W+wtIQTMV/eJyo9rA2YMDbMA0CWC1Hzm0t2PfMg+vEfuyWH0mOW4J8z
         hnnX7Ff0zeNkXIurE9iTQ2eyC253M+F6tuqcQJJPQ7S20a9OM5R3U6FwXAnubnOC4k0I
         KTs1XDlikxOUiTj7lB+jxGby3S6AdrNt/UxqmTSGxMnQzZZBYJcSsHAPfymOMEo2AxBp
         fZrg==
X-Gm-Message-State: APjAAAWSdFNULyimsFy4j2QdOsloaK/YcTrhCSiuDVbeahDw5OE1O9vX
        nnYqK3W+XOnLDwPt4zJ5KcQ=
X-Google-Smtp-Source: APXvYqwtHkAdpnDNLrKU8l3gQJCnqk74qB0FWxy3k2YmQonc0nW5ibfTNdfHiHYs9fHfC/i44RKzOg==
X-Received: by 2002:a1c:1b4a:: with SMTP id b71mr7822601wmb.177.1558909544853;
        Sun, 26 May 2019 15:25:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:43 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 01/10] dt-bindings: media: sunxi-ir: add A31 compatible
Date:   Mon, 27 May 2019 00:25:27 +0200
Message-Id: <20190526222536.10917-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526222536.10917-1-peron.clem@gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com>
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

