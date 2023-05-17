Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBAA6706743
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 13:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjEQL4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 07:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjEQL4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 07:56:46 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A463C34
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 04:56:44 -0700 (PDT)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 17 May 2023
 19:56:32 +0800
From:   zelong dong <zelong.dong@amlogic.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
        <kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v2 0/3] media: rc: meson-ir: support MMIO regmaps to access registers
Date:   Wed, 17 May 2023 19:56:32 +0800
Message-ID: <20230517115635.31565-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.11.69]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zelong Dong <zelong.dong@amlogic.com>

This patchset add MMIO regmaps to access register in Meson IR driver.
For defining clearly, sort/rename IR Controller register macros.

Changes since v1:
- move the cleanup/rename to a separate patch.
- use devm_platform_ioremap_resource() instead of platform_get_resource()
  and devm_ioremap_resource().

---
v1: https://lore.kernel.org/r/20230511034333.26800-1-zelong.dong@amlogic.com

Zelong Dong (3):
  media: rc: meson-ir: sort Meson IR Controller register macros
  media: rc: meson-ir: rename Meson IR Controller register macros
  media: rc: meson-ir: support MMIO regmaps to access registers

 drivers/media/rc/meson-ir.c | 125 ++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 61 deletions(-)

-- 
2.35.1

