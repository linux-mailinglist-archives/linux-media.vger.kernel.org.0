Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D7C3AD8F5
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 11:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhFSJdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 05:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbhFSJdV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 05:33:21 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6F7C061574
        for <linux-media@vger.kernel.org>; Sat, 19 Jun 2021 02:31:11 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E2494C64CE; Sat, 19 Jun 2021 10:31:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1624095068; bh=hFxyCN6ZJdZXH9zsRdJQE4/3CwODh0ZFupbLuq8oh34=;
        h=Date:From:To:Subject:From;
        b=aOnfl7a3omZqDjsggxADtSL/Iav0vaHbp3yDigi+N2lBa8XnJAmeUbbCbaFhblmp/
         bjie0m4bsxosFOxa2sqy2Ry2bkAE+vVqrCCNIS+dJkFpfeVOq1bkFI/DBbffbIOJru
         cvg5B9JTrboZuWOyZe5v4szLnMcZlCNwCNTlpdmBVUgMApMjAThWNkhKx9j7WaXa9K
         TimvxyZxjzLSUT+EUFr/xpRZkNfoEa9E5IiD8bJFHZSZIF2qhteK6ksMWLXznS0Lvp
         e05nqnZbtzS1n4dvjSDhucLPu6bm+ZVngiGpn9DNvqPC7Asdk35FpwiJ60ta5SJBXQ
         p5y/9JJpmpWSg==
Date:   Sat, 19 Jun 2021 10:31:08 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.14] Various fixes
Message-ID: <20210619093108.GA7764@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 198bb646e8553e8abd8d83492a27b601ab97b75d:

  media: i2c: rdacm20: Re-work ov10635 reset (2021-06-17 12:08:55 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.14c

for you to fetch changes up to 631d7e123d0521165fe815205e9f2286150a0586:

  media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157 (2021-06-19 09:25:01 +0100)

----------------------------------------------------------------
v5.14c

----------------------------------------------------------------
Christophe JAILLET (1):
      media: cxd2880-spi: Fix an error handling path

Uwe Kleine-König (2):
      media: usb: dvb-usb-v2: af9035: report if i2c client isn't bound
      media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157

lijian (4):
      media: rc: streamzap: Removed unnecessary 'return'
      media: rc: redrat3: Fix a typo
      media: rc: rc-main.c: deleted the repeated word
      media: dvb-frontends: cx24117: Delete 'break' after 'goto'

 drivers/media/dvb-frontends/cx24117.c | 1 -
 drivers/media/rc/rc-main.c            | 2 +-
 drivers/media/rc/redrat3.c            | 2 +-
 drivers/media/rc/streamzap.c          | 2 --
 drivers/media/spi/cxd2880-spi.c       | 7 +++++--
 drivers/media/usb/dvb-usb-v2/Kconfig  | 2 ++
 drivers/media/usb/dvb-usb-v2/af9035.c | 1 +
 7 files changed, 10 insertions(+), 7 deletions(-)
