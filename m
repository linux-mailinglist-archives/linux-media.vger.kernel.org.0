Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1822639974
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbfFGXLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45336 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbfFGXLL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so3613729wre.12;
        Fri, 07 Jun 2019 16:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSxZI8EC5PtCV9rMqk5b6iP4sZNex2jHwm6j6LayujA=;
        b=IjBjOJm+fMtl+k47Jb+MoI7wK6zNUwAp3Xqv+mnEqlvbZVa1s4gRP7ABh634VkaW6I
         PoWRcLgeCNzkqym0sy0T52hCYiWifkIzGqWXc6BKmrEym83kNcyitLbxXRcEmU0OeMHG
         4buJOpicNyA7ww6YJkl3teBb8vwg40V8pEngLQSRRdSvm0D2dHzJt0vmgPVnRFkRVIQ+
         ixRYXERNbuXC0kUsfitCT1TIBoiCI0dreXZ5FJnyHpo7CBn1zWaQKhPrNpMf+B79fdYG
         nldVaVLE8PD0dumalfgk2/FL8gbiheUGV2GTFTKUlp70ERRkxCvZDAHnqJ+4GGMtXH9v
         2cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSxZI8EC5PtCV9rMqk5b6iP4sZNex2jHwm6j6LayujA=;
        b=PoEET2I/Qs1MKizCEdtrGwpnPvyuJxBn05Fw2MyyE+korQ247UQP6wKl5cUFkoc+2E
         ZvOshZA8SLSpG9f3Rhn7dp08ia3tHZF3IPGyQH2qc2iCX7DXYWmsKOJ56nyJtYNSA2WP
         vh1ZfXSxhxSuZJe+iwJLLfnwb6YdeJ5owk2LeWFDkXGvxfN7MitVFpTyYxHNmHL8zfTf
         i7emIhQ961wdfUpGRi8jSFivu1a9wOVKpoF8eqSMlpeZd10pu4J3Qq7XIrPSzD2rJl4T
         kNPoE/3ehQsPHzvID5/D141aznI20DzipkgxlGP4ru+HOcfqwFYgW8ZK3Ftdp6KnKYhH
         m9YA==
X-Gm-Message-State: APjAAAXTf6vKMMsywZa/43/R5GI4h4TxDjVmqJXHCQlIlMt2jplLBQNf
        3tcY1DdXr9kvUAlcahLdHPS3pCOxeaM=
X-Google-Smtp-Source: APXvYqz/xMBVF7B54pr7kQTSNoBThGB1ZrYt6kSdD2qCIyzse+KpGDY3fYfN5JJH/fw+HZ3+9eUtQg==
X-Received: by 2002:adf:ff84:: with SMTP id j4mr8597734wrr.151.1559949069714;
        Fri, 07 Jun 2019 16:11:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:09 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v5 01/13] dt-bindings: media: sunxi-ir: Add A31 compatible
Date:   Sat,  8 Jun 2019 01:10:48 +0200
Message-Id: <20190607231100.5894-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607231100.5894-1-peron.clem@gmail.com>
References: <20190607231100.5894-1-peron.clem@gmail.com>
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
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
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

