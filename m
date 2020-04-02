Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D75C519CCE5
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 00:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389913AbgDBWd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 18:33:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33435 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731842AbgDBWd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 18:33:27 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so6253586wrd.0;
        Thu, 02 Apr 2020 15:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4SOzz1DmBA7mljFUWMggCDnfrvoqqdJY//N8mPAQhYE=;
        b=t1HKdcbKty17TKBnfpHl9npkiUav5NHVZLIc1xKNUBA5d7dKzmU/xIGPzs5ednbGGd
         XBAWp+f+UzLLgxY0lGOe63/h5U4+ZjL74YC4CLYQpwgekrVMBrdc48g/LMuCvAohXz8i
         2H2b7sueZ57tIvgGVF27yr7Vmf94+RdRcJXkveoqt89D75MzkbuysqCcFLwIm3NrfH2M
         jcJcLvsi/FyfidJB56IDME0T3gXtqOxFqDoGEEtyqR9GNeLxaxz70REq7bfKRbbioGN0
         AemGYKtlsIZjDw5GDhGwbs5S5bs8r5wE5Ho0at2yPap3x/klIjCWLzA4lDgdi0sZWyn4
         6w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4SOzz1DmBA7mljFUWMggCDnfrvoqqdJY//N8mPAQhYE=;
        b=o3kkWLRiUNcLiGPou8aB05CHbNVfWs5FKA0yAc+0vW7c5Q0sUCsjxHxcb6N66iEwMF
         MJgkIeonyiTQOcPPAr82yMxCklKDI5O6JxguvICDMGUYotg3hciqiVbBUxZzyb2IqnOy
         8L1ZijjqtKflIZSKQQpPW83iksVbZYO6QnSZwJGXXuXiQYmTeF9Lv2v88rLppBbGemwJ
         6pzNTmhypCH6UR0ZHAQGR0vlnZTvmJkZNfQIyxsNnijoOaWOTR/GFJM1qtpkcVxuw8WO
         iWNUuuxkDNMOzGDMONKufjHEpkuvfRsuOGCAq/2ydSAAr5RHRXczKkbpLw7CCspWNgrw
         zHjQ==
X-Gm-Message-State: AGi0Pual5lX4NOGTwRPwRpUSjzlOOwOLSIDAiNKp6Mnzmim0kQxKOswT
        P1qBkx3Z9o15DBRJvSoWHQ5D3oXf
X-Google-Smtp-Source: APiQypIZt8F4WTEtOcpr3GqFL8NVQOdrHJWExW7CZcX1Qg3fbPjjurB+yXpmAacN7vVbPadI4hsFJw==
X-Received: by 2002:a5d:45c7:: with SMTP id b7mr5291373wrs.44.1585866805442;
        Thu, 02 Apr 2020 15:33:25 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g186sm9267729wmg.36.2020.04.02.15.33.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Apr 2020 15:33:24 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     jacob-chen@iotwrt.com
Cc:     ezequiel@collabora.com, mchehab@kernel.org, robh+dt@kernel.org,
        heiko@sntech.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: media: rockchip-rga: add power-domains property
Date:   Fri,  3 Apr 2020 00:33:15 +0200
Message-Id: <20200402223315.12260-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200402223315.12260-1-jbx6244@gmail.com>
References: <20200402223315.12260-1-jbx6244@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the old txt situation we add/describe only properties that are used
by the driver/hardware itself. With yaml it also filters things in a
node that are used by other drivers like 'power-domains' for rk3399,
so add it to 'rockchip-rga.yaml'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip-rga.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
index 3b110b574..dd645ddcc 100644
--- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
@@ -39,6 +39,9 @@ properties:
       - const: hclk
       - const: sclk
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 3
 
@@ -63,6 +66,7 @@ examples:
   - |
     #include <dt-bindings/clock/rk3399-cru.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
     rga: rga@ff680000 {
       compatible = "rockchip,rk3399-rga";
       reg = <0xff680000 0x10000>;
@@ -71,6 +75,7 @@ examples:
                <&cru HCLK_RGA>,
                <&cru SCLK_RGA_CORE>;
       clock-names = "aclk", "hclk", "sclk";
+      power-domains = <&power RK3399_PD_RGA>;
       resets = <&cru SRST_RGA_CORE>,
                <&cru SRST_A_RGA>,
                <&cru SRST_H_RGA>;
-- 
2.11.0

