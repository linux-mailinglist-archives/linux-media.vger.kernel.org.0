Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2955F2D09AB
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 05:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgLGE1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 23:27:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8704 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgLGE1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 23:27:35 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cq9H94CQJzkmHd;
        Mon,  7 Dec 2020 12:26:13 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 12:26:42 +0800
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
Subject: [PATCH 1/4] dt-bindings: media: adv7604: eliminate yamllint warnings
Date:   Mon, 7 Dec 2020 12:23:57 +0800
Message-ID: <20201207042400.1498-2-thunder.leizhen@huawei.com>
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
./Documentation/devicetree/bindings/media/i2c/adv7604.yaml
:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/media/i2c/adv7604.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
index 81f17e719d87da5..693f31daf5aa699 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
@@ -21,8 +21,8 @@ properties:
   compatible:
     items:
       - enum:
-        - adi,adv7611
-        - adi,adv7612
+          - adi,adv7611
+          - adi,adv7612
 
   reg:
     minItems: 1
-- 
1.8.3


