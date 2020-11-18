Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4012B7CD4
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbgKRLie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727353AbgKRLie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:38:34 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB97DC0613D4
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 03:38:33 -0800 (PST)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E88BC634CD2;
        Wed, 18 Nov 2020 13:38:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 24/29] dt-bindings: nokia,smia: Remove nokia,nvm-size property
Date:   Wed, 18 Nov 2020 13:31:06 +0200
Message-Id: <20201118113111.2548-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
References: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

nokia,nvm-size property was removed from the bindings but it was left in
the example. Remove it from the example, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
index 5ea4f799877b..5f39a7070c51 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
@@ -54,7 +54,6 @@ Example
 		vana-supply = <&vaux3>;
 		clocks = <&omap3_isp 0>;
 		clock-frequency = <9600000>;
-		nokia,nvm-size = <512>; /* 8 * 64 */
 		port {
 			smiapp_ep: endpoint {
 				data-lanes = <1 2>;
-- 
2.27.0

