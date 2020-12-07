Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576992D09B2
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 05:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgLGE2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 23:28:02 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8707 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgLGE1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 23:27:47 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cq9H93FhdzkmG0;
        Mon,  7 Dec 2020 12:26:13 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 12:26:43 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "Ricardo Ribalda" <ribalda@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 2/4] dt-bindings: media: nokia,smia: eliminate yamllint warnings
Date:   Mon, 7 Dec 2020 12:23:58 +0800
Message-ID: <20201207042400.1498-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201207042400.1498-1-thunder.leizhen@huawei.com>
References: <20201207042400.1498-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Eliminate the following yamllint warnings:
./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
:4:1: [error] missing document start "---" (document-start)
:29:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
:32:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index d94bd67ccea111d..0df0334d2d0db3b 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (C) 2014--2020 Intel Corporation
-
+%YAML 1.2
+---
 $id: http://devicetree.org/schemas/media/i2c/mipi-ccs.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
@@ -26,11 +27,11 @@ properties:
   compatible:
     oneOf:
       - items:
-        - const: mipi-ccs-1.1
-        - const: mipi-ccs
+          - const: mipi-ccs-1.1
+          - const: mipi-ccs
       - items:
-        - const: mipi-ccs-1.0
-        - const: mipi-ccs
+          - const: mipi-ccs-1.0
+          - const: mipi-ccs
       - const: nokia,smia
 
   reg:
-- 
1.8.3


