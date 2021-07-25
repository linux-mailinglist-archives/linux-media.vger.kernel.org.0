Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6843D4DD9
	for <lists+linux-media@lfdr.de>; Sun, 25 Jul 2021 15:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhGYNNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 09:13:08 -0400
Received: from gofer.mess.org ([88.97.38.141]:37875 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230029AbhGYNNH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 09:13:07 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9C5C2C65B2; Sun, 25 Jul 2021 14:53:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1627221216; bh=Gp35vmGiH1qWmIjT1jJ865eEq3waal1Avt0f/YHLHME=;
        h=Date:From:To:Cc:Subject:From;
        b=mkEF0aPsgs4dm2x8IONiIYUq7LH5hAdcGNZcTXOUF7aUuljr2/PTQuSBN8+hADsFj
         ihY+8tH7at++mZsu2paDcDToWkc4sjulySQhXR9YRzx+8dPNp4t7F7NEgP42QIR2PW
         UuiWhU66EK2i+VLmPgaBfsxmPH40bwKDUBGDTxiwcNWCVkzw44srRgKZYc+5OcNg25
         DHlhg2QJmPSjqJK8Q1b2sFSGxCmmxh3CeSt4lNgjmmBs7j8tP5vmy3syTjh22Xnxgq
         8fJMCIUC+MAdi55/WR6F1hU0wmlnb+tHaQvJj4lsztauXAhrC8pgaxH9tbcLZ4SwGx
         UdI0+p0fvo7WA==
Date:   Sun, 25 Jul 2021 14:53:36 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
        Dongliang Mu <mudongliangabcd@gmail.com>
Subject: [GIT PULL FOR v5.15] New driver meson-ir-tx
Message-ID: <20210725135336.GB9696@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit c3cdc019a6bf03c4bf06fe8252db96eb6e4a3b5f:

  media: atomisp: pci: reposition braces as per coding style (2021-07-23 09:04:03 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.15b

for you to fetch changes up to 97f2154ad1d1f5ca2770a0b3724eb817195e70b1:

  em28xx-input: fix refcount bug in em28xx_usb_disconnect (2021-07-25 14:43:25 +0100)

----------------------------------------------------------------
v5.15b

----------------------------------------------------------------
Dongliang Mu (1):
      em28xx-input: fix refcount bug in em28xx_usb_disconnect

Viktor Prutyanov (2):
      media: rc: meson-ir-tx: document device tree bindings
      media: rc: introduce Meson IR TX driver

 .../bindings/media/amlogic,meson-ir-tx.yaml        |  60 +++
 drivers/media/rc/Kconfig                           |  10 +
 drivers/media/rc/Makefile                          |   1 +
 drivers/media/rc/meson-ir-tx.c                     | 407 +++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx-input.c            |   1 -
 5 files changed, 478 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
 create mode 100644 drivers/media/rc/meson-ir-tx.c
