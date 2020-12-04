Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360832CEB28
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 10:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387633AbgLDJki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 04:40:38 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9382 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729672AbgLDJkg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 04:40:36 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CnSMy2GThz78RS;
        Fri,  4 Dec 2020 17:39:26 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 17:39:44 +0800
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
Subject: [PATCH 2/5] dt-bindings: serial: add the required property 'additionalProperties'
Date:   Fri, 4 Dec 2020 17:38:10 +0800
Message-ID: <20201204093813.1275-3-thunder.leizhen@huawei.com>
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

xxx/serial/litex,liteuart.yaml: 'additionalProperties' is a required property
xxx/serial/litex,liteuart.yaml: ignoring, error in schema:
warning: no schema found in file: xxx/serial/litex,liteuart.yaml

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/serial/litex,liteuart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/litex,liteuart.yaml b/Documentation/devicetree/bindings/serial/litex,liteuart.yaml
index bc79b3cca542437..c4f1f489dc2d091 100644
--- a/Documentation/devicetree/bindings/serial/litex,liteuart.yaml
+++ b/Documentation/devicetree/bindings/serial/litex,liteuart.yaml
@@ -29,6 +29,8 @@ required:
   - compatible
   - reg
 
+additionalProperties: false
+
 examples:
   - |
     uart0: serial@e0001800 {
-- 
1.8.3


