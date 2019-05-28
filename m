Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A8C2CB5E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfE1QO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:14:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37187 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbfE1QO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:14:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so3539242wmo.2;
        Tue, 28 May 2019 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K/XHCO5OpLMI7hm5w9MXtKPLk5GaTtp3symSRQtLrEY=;
        b=EyM0D5GavuIb2ZHU3Ey2iuUrjxx5yFjgNYGJtX+8Zore5n4WfYzSMfIgAzEJ3qhtY1
         AB2Nw7oYWntoTt98IWF8mPj9NyY/gWEkWlQR9cOLwsqfFJk072jFtE/XYVsSxoPCr738
         pNqDCTpQ8OzCwhfrXj5tgKUrqX37WBC1im8BiXLOtQn4R5VLAsaCbcCcOZMPW3M4Fpqp
         z2PPhRioLG6uAcgAvrBiYITN2get23JzjqSzdqf3sUf2huHQUSBFLezGXXkQM9WRAwuf
         dcZeZ0/WyT8I6lpM/QCXXFP8KGkbzITB6Hqi3pOGKNZbpHo7KxGem4JdEFbN4yE0Bedl
         wU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K/XHCO5OpLMI7hm5w9MXtKPLk5GaTtp3symSRQtLrEY=;
        b=Q0bUmrijQ3Ict16S2JAFzWemH/DpspHXRhgVHlJJY+zAdRl/zGm/m8HDM0glldy8GK
         G0UeCra2+34hA1qE5O+0B+FdrcNRH7l2/r38zcap3o1xgxPX93MoAFEyMHGIdkjPjela
         PrqoeN7iB3zusYA+U+rkbxM/5jmSn6wj+ghBE3EVBMhicwRCxbKb9gI8kvJnoGBJQxmu
         JevK1Mym5YtnGN/Vlo4sCN8zSPiTAbRcO3kJI67ca5cyrH2JZ6IRkOS36AKXT+NWlI40
         9oSXecR+b3tVzuH8j/pvQ+fF2HY9KF6xyM77x8gg3C9xfXFdRB34uuWvA+QHjXrOaxfm
         t5mw==
X-Gm-Message-State: APjAAAXvDLM525rau8VWc6aWQ/uxy6edq8oShoNyeKLJQTwDK5cdwQKC
        3tpKIsr66Ja1MJXAp1Y0k97vfwCEDdxryQ==
X-Google-Smtp-Source: APXvYqyEiWcBV7Gxq6C/3F0I6ecov4ivFns4OBUBpcj4xXx1WWacV5+gIGN9TAndCV5ongzHxXWx0A==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr3664693wmb.88.1559060096018;
        Tue, 28 May 2019 09:14:56 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.14.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:14:55 -0700 (PDT)
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
Subject: [PATCH v3 01/12] dt-bindings: media: sunxi-ir: add A31 compatible
Date:   Tue, 28 May 2019 18:14:29 +0200
Message-Id: <20190528161440.27172-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com>
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

