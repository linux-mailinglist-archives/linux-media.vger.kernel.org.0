Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325AA2CEB2A
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 10:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbgLDJkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 04:40:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8651 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729512AbgLDJkg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 04:40:36 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnSMx3MYTz15XW8;
        Fri,  4 Dec 2020 17:39:25 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 17:39:47 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Stafford Horne <shorne@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 5/5] dt-bindings: mfd: correct the node name of the panel led
Date:   Fri, 4 Dec 2020 17:38:13 +0800
Message-ID: <20201204093813.1275-6-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201204093813.1275-1-thunder.leizhen@huawei.com>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the definition in leds-pwm.yaml, the node name of each led
must match the regular expression "^led(-[0-9a-f]+)?$". "led" or "led-"
followed by a decimal or hexadecimal ID number.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/mfd/iqs62x.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
index 541b06d80e7337a..044cd7542c2bcf5 100644
--- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
+++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
@@ -93,7 +93,7 @@ examples:
     pwmleds {
             compatible = "pwm-leds";
 
-            panel {
+            led-1 {
                     pwms = <&iqs620a_pwm 0 1000000>;
                     max-brightness = <255>;
             };
-- 
1.8.3


