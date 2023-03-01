Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3411C6A6B1C
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 11:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjCAKy7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 05:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjCAKy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 05:54:58 -0500
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DE6311CB
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 02:54:57 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8CF581000A1; Wed,  1 Mar 2023 10:54:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1677668095; bh=nKmYxhzJUxvXFQJvyiWz9S/4rId9g2VePMKtoWN41KI=;
        h=Date:From:To:Cc:Subject:From;
        b=Z2mEBnhECAGkbFbHjmMzgPWXLe/Yb7YpyDsGtzcESN6vS+Vr4asEcvgRSfXEjzBLa
         kxk0ibQNkGIFOOMg/KhYgM+djfmhv/ySP0u2XuNAF2YHayFXhFUlx8tDGjJSLIHGH/
         r7ohFO0Avv/p7KjFLtpBs0rbLSgEIkRzPWgPO2efiKaEWOG4dEgcnRlRT9OR9o66EG
         UzJ3KaGPF7yDsgCE3XYuYQSI0Q97O/HtIww9Oqh5bAvtFMTHDLG8KLBwMfq7bBk+Sw
         CM3AzX+8+9e0aQtlsPzShsNe/0mFQP6A4LzKUKk0kaHVq6GY60ZvxgBpyxUoRCmQbW
         /jKzbv8R8EsLQ==
Date:   Wed, 1 Mar 2023 10:54:55 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>,
        Emanuel Strobel <emanuel.strobel@yahoo.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL FOR v6.4] rc keymaps
Message-ID: <Y/8u/0oRAEo5T+/R@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3e62aba8284de0994a669d07983299242e68fe72:

  media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-26 11:21:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.4a

for you to fetch changes up to 3f33e472ed2ed661aee07f585ef836b92e02f365:

  media: rc: add Beelink Mini MXIII keymap (2023-03-01 10:19:39 +0000)

----------------------------------------------------------------
v6.4a

----------------------------------------------------------------
Christian Hewitt (3):
      dt-bindings: rc: add rc-dreambox
      dt-bindings: rc: add rc-beelink-mxiii
      media: rc: add Beelink Mini MXIII keymap

Emanuel Strobel (1):
      media: rc: add common keymap for Dreambox RC10/RC0 and RC20/RC-BT remotes

 Documentation/devicetree/bindings/media/rc.yaml |   2 +
 drivers/media/rc/keymaps/Makefile               |   2 +
 drivers/media/rc/keymaps/rc-beelink-mxiii.c     |  57 +++++++++
 drivers/media/rc/keymaps/rc-dreambox.c          | 151 ++++++++++++++++++++++++
 include/media/rc-map.h                          |   2 +
 5 files changed, 214 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-beelink-mxiii.c
 create mode 100644 drivers/media/rc/keymaps/rc-dreambox.c
