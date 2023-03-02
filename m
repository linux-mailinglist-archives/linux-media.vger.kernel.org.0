Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 484BE6A7B97
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 08:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjCBHFm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 02:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjCBHFl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 02:05:41 -0500
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3102342BC8;
        Wed,  1 Mar 2023 23:04:59 -0800 (PST)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 2 Mar 2023
 14:34:51 +0800
From:   zelong dong <zelong.dong@amlogic.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR Controller
Date:   Thu, 2 Mar 2023 14:34:01 +0800
Message-ID: <20230302063402.42708-3-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230302063402.42708-1-zelong.dong@amlogic.com>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.11.69]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zelong Dong <zelong.dong@amlogic.com>

Add new compatible for Amlogic's Meson-S4 IR Controller

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 Documentation/devicetree/bindings/media/meson-ir.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
index efd9d29a8f10..2a6662edd04d 100644
--- a/Documentation/devicetree/bindings/media/meson-ir.txt
+++ b/Documentation/devicetree/bindings/media/meson-ir.txt
@@ -5,11 +5,14 @@ Required properties:
 		  - "amlogic,meson6-ir"
 		  - "amlogic,meson8b-ir"
 		  - "amlogic,meson-gxbb-ir"
+		  - "amlogic,meson-s4-ir"
  - reg		: physical base address and length of the device registers
  - interrupts	: a single specifier for the interrupt from the device
 
 Optional properties:
  - linux,rc-map-name:	see rc.txt file in the same directory.
+ - amlogic,ir-support-hw-decode: enable hardware IR Decoder, and register
+				 rc driver as type RC_DRIVER_SCANCODE
 
 Example:
 
-- 
2.35.1

