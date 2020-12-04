Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1715D2CEB37
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 10:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgLDJlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 04:41:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8650 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbgLDJlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 04:41:35 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnSMx30ybz15XVR;
        Fri,  4 Dec 2020 17:39:25 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 17:39:45 +0800
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
Subject: [PATCH 3/5] dt-bindings: soc: add the required property 'additionalProperties'
Date:   Fri, 4 Dec 2020 17:38:11 +0800
Message-ID: <20201204093813.1275-4-thunder.leizhen@huawei.com>
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

When I do dt_binding_check for any YAML file, below wanring is always
reported:

xxx/soc/litex/litex,soc-controller.yaml: 'additionalProperties' is a required property
xxx/soc/litex/litex,soc-controller.yaml: ignoring, error in schema:
warning: no schema found in file: xxx/soc/litex/litex,soc-controller.yaml

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml b/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml
index e2b788796e791ab..c8b57c7fd08c23d 100644
--- a/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml
@@ -28,6 +28,8 @@ required:
   - compatible
   - reg
 
+additionalProperties: false
+
 examples:
   - |
     soc_ctrl0: soc-controller@f0000000 {
-- 
1.8.3


