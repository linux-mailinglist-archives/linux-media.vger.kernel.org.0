Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A16744F916
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 17:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbhKNQlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 11:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhKNQl3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 11:41:29 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BFBC061746
        for <linux-media@vger.kernel.org>; Sun, 14 Nov 2021 08:38:25 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1FFCCC6355; Sun, 14 Nov 2021 16:38:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1636907902; bh=DEdZg4mQE6hsKwWLqoQeoIRfc8X6sr2Xe1gJxuOOPos=;
        h=Date:From:To:Subject:From;
        b=r8o47J91wPAh3c9lAvpGVPc9zbDxFzrF7EvVUWjbIfwCdaXKNoe0L4LPv8jbAz5Bg
         0juxVPo37i+pzcylBWmSc8iIV2yDBAl6F78THorDqwfPniLnwvpjiqY3q6ClV6GdQi
         KCtcy33oxb32RfLheqbHWQMcSg73WgWmUqRnpyqYtEugxk+JOmTTN0TaC1ShfAyTaT
         m8VrGQ1h+PezpT1+sCzMUof2HuzueTHe9Xnt6+N1LWJwRycNGw9uq9Q/1InifT/97u
         P9iDt5V2Ys74oDm9RdQmrXMWjz6mlm6xgxfMBDAdaTN6CdrZCRgn9kwH+s6y73xrX+
         Dxsor+Pib/8Bg==
Date:   Sun, 14 Nov 2021 16:38:21 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.17] Small fixes
Message-ID: <20211114163821.GA28752@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 80ffa82f80bf89b19de5dc5d556ffecc0a2a54be:

  media: mtk-vcodec: Remove redundant 'flush_workqueue()' calls (2021-11-10 16:02:52 +0000)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.17a

for you to fetch changes up to ebd013c25a3a0f67aab4753492d0ea238727bc36:

  media: rc: ir-hix5hd2: Add the dependency on HAS_IOMEM (2021-11-14 15:44:36 +0000)

----------------------------------------------------------------
v5.17a

----------------------------------------------------------------
Cai Huoqing (1):
      media: rc: ir-hix5hd2: Add the dependency on HAS_IOMEM

Maíra Canal (2):
      media: rc: pwm-ir-tx: Switch to atomic PWM API
      media: ir-rx51: Switch to atomic PWM API

Uwe Kleine-König (1):
      media: rc: ir-spi: Drop empty spi_driver remove callback

 drivers/media/rc/Kconfig     |  2 +-
 drivers/media/rc/ir-rx51.c   | 16 ++++++++--------
 drivers/media/rc/ir-spi.c    |  6 ------
 drivers/media/rc/pwm-ir-tx.c | 18 +++++++++---------
 4 files changed, 18 insertions(+), 24 deletions(-)
