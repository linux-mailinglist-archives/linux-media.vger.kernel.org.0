Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED16782D3C
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 17:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236339AbjHUP03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 11:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236337AbjHUP02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 11:26:28 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB66F7
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 08:26:26 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7FD521000CF; Mon, 21 Aug 2023 16:26:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692631583; bh=pKwj9dy1aBLSqmO1+jKIEMgu/NyYQzkFh2Bpub3dQlY=;
        h=From:To:Cc:Subject:Date:From;
        b=Ieq+PNqIlnctKO8YUmIsIPspt+1tpYEQzYxHE23bYtLxB+lDpAZldDOTRUkX3crZj
         L9w1iW//HWMvPTdbTMH2ElObcKTavG0tH8lzchBuk+mAbOBjCfs0PcSRAvejL+gYW0
         VCvoHWewGUdwyxMjGjvemglyaCR76IOrU0fJ0J1+DvNVDxkHO/Cf/7lhn8y9aWVzmg
         ClsgtYj53MrcfSLhj9UkhyA/NQA8RNL+Orrqi8hte5dItvJu7jjU8SeSXTLNMte6VV
         dS049aUAkHdSmt74GHCfWenrYHtE1j+3sXswfXgn52XndaOHNFmRw+wBUkMNDihHab
         ltLUgn6Dwsgug==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Sicelo <absicsz@gmail.com>, Rob Herring <robh@kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/2] Remove ir-rx51 driver
Date:   Mon, 21 Aug 2023 16:26:21 +0100
Message-Id: <20230821152623.196541-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ir-rx51 driver is no longer necessary, pwm-ir-tx does the same job
and is more generic.

Sean Young (2):
  media: dt-bindings: nokia,n900-ir use generic pwm-ir-tx driver
  media: rc: remove ir-rx51 in favour of generic pwm-ir-tx

 .../devicetree/bindings/media/nokia,n900-ir   |  20 --
 arch/arm/boot/dts/ti/omap/omap3-n900.dts      |   2 +-
 arch/arm/configs/omap2plus_defconfig          |   1 -
 drivers/media/rc/Kconfig                      |  10 -
 drivers/media/rc/Makefile                     |   1 -
 drivers/media/rc/ir-rx51.c                    | 285 ------------------
 6 files changed, 1 insertion(+), 318 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir
 delete mode 100644 drivers/media/rc/ir-rx51.c

-- 
2.41.0

