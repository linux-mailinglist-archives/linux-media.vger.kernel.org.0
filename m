Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0EF6A7B94
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 08:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjCBHFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 02:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjCBHFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 02:05:18 -0500
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Mar 2023 23:04:38 PST
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B6E38E99;
        Wed,  1 Mar 2023 23:04:38 -0800 (PST)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 2 Mar 2023
 14:34:28 +0800
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
Subject: [PATCH 0/3] media: rc: meson-s4: support RC_DRIVER_SCANCODE driver
Date:   Thu, 2 Mar 2023 14:33:59 +0800
Message-ID: <20230302063402.42708-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
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

This patchset adds IR controller driver support for Meson-S4 SoC.

Meson IR Controller supports hardware decoder in Meson-8B and later
SoC. So far, protocol NEC/RC-6/XMP could be decoded in hardware.
DTS property 'amlogic,ir-support-hw-decode' can enable this feature.

Zelong Dong (3):
  media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
  dt-bindings: media: Add compatible for Meson-S4 IR Controller
  arm64: dts: meson: add IR controller for Meson-S4 SoC

 .../devicetree/bindings/media/meson-ir.txt    |   3 +
 .../dts/amlogic/meson-s4-s805x2-aq222.dts     |   6 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  16 +
 drivers/media/rc/meson-ir.c                   | 713 ++++++++++++++++--
 4 files changed, 657 insertions(+), 81 deletions(-)

-- 
2.35.1

