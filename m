Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4EB209DF8
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 13:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404317AbgFYL7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 07:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404285AbgFYL7L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 07:59:11 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F93C061573
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 04:59:11 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 198CAC6393; Thu, 25 Jun 2020 12:59:09 +0100 (BST)
Date:   Thu, 25 Jun 2020 12:59:08 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.9] Minor fixes
Message-ID: <20200625115908.GA24947@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e30cc79cc80fd919b697a15c5000d9f57487de8e:

  media: media-request: Fix crash if memory allocation fails (2020-06-23 15:19:37 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.9b

for you to fetch changes up to 590421e3950bbd5d37ba11b8af73ff0ccd9ad18c:

  media: rc: return proper error code on error handling path in init (2020-06-24 10:05:23 +0100)

----------------------------------------------------------------
v5.9b

----------------------------------------------------------------
Evgeny Novikov (1):
      media: rc: return proper error code on error handling path in init

Sean Young (4):
      media: drx-k: remove unused MulDiv32 function
      media: nuvoton-cir: remove setting tx carrier functions
      media: fintek-cir: remove unused function fintek_clear_reg_bit
      media: cx23888: remove unused functions

 drivers/media/dvb-frontends/drxk_hard.c | 11 -----------
 drivers/media/pci/cx23885/cx23888-ir.c  | 20 --------------------
 drivers/media/rc/fintek-cir.c           |  7 -------
 drivers/media/rc/nuvoton-cir.c          | 32 --------------------------------
 drivers/media/rc/rc-main.c              |  2 +-
 5 files changed, 1 insertion(+), 71 deletions(-)
