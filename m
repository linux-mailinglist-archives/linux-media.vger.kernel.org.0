Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB5F52E854
	for <lists+linux-media@lfdr.de>; Fri, 20 May 2022 11:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347551AbiETJH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 May 2022 05:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347546AbiETJHz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 May 2022 05:07:55 -0400
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8184313C1D5;
        Fri, 20 May 2022 02:07:52 -0700 (PDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 24K8qYLq003708;
        Fri, 20 May 2022 16:52:34 +0800 (GMT-8)
        (envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 20 May
 2022 17:06:21 +0800
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Felipe Balbi <balbi@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Li Yang" <leoyang.li@nxp.com>
CC:     Neal Liu <neal_liu@aspeedtech.com>,
        <linux-aspeed@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v4 0/3] add Aspeed udc driver for ast2600
Date:   Fri, 20 May 2022 17:06:14 +0800
Message-ID: <20220520090617.2225080-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24K8qYLq003708
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series aim to add Aspeed USB 2.0 Device Controller (udc)
driver, including driver itself, device tree node and documentation.

Change since v3:
- Remove kernel test robot tag since it's a new driver.

Change since v2:
- Rename device tree nodes.
- Fix unusual indentation.

Change since v1:
- Fix build test warning reported by kernel test robot.
- Rename proper name for dt-bindings document.

Neal Liu (3):
  usb: gadget: add Aspeed ast2600 udc driver
  ARM: dts: aspeed: Add USB2.0 device controller node
  dt-bindings: usb: add documentation for aspeed udc

 .../bindings/usb/aspeed,ast2600-udc.yaml      |   52 +
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |   10 +
 drivers/usb/gadget/udc/Kconfig                |   13 +
 drivers/usb/gadget/udc/Makefile               |    1 +
 drivers/usb/gadget/udc/aspeed_udc.c           | 1601 +++++++++++++++++
 6 files changed, 1684 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
 create mode 100644 drivers/usb/gadget/udc/aspeed_udc.c

-- 
2.25.1

