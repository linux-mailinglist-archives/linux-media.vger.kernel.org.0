Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0C338AD19
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 13:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243902AbhETLxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 07:53:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3624 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237124AbhETLv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 07:51:26 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fm7Jw5xrrzmWbL;
        Thu, 20 May 2021 19:47:44 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 19:50:01 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 19:50:01 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Ramesh Shanmugasundaram" <rashanmu@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: dt-bindings: media: renesas,drif: Fix a dt_binding_check warning
Date:   Thu, 20 May 2021 19:49:53 +0800
Message-ID: <20210520114953.8206-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value of the property 'clock-names' is a constant string, so the
'maxItems: 1' is not needed, should be removed. Otherwise, the following
warning is reported:
properties:clock-names:maxItems: False schema does not allow 1
ignoring, error in schema: properties: clock-names: maxItems
warning: no schema found in file: xxx/bindings/media/renesas,drif.yaml

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
index f1bdaeab4053..b7f07062922f 100644
--- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
@@ -67,7 +67,6 @@ properties:
     maxItems: 1
 
   clock-names:
-    maxItems: 1
     items:
       - const: fck
 
-- 
2.21.1


