Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 239AF44B6C
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 20:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbfFMS4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 14:56:51 -0400
Received: from gofer.mess.org ([88.97.38.141]:51661 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbfFMS4v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 14:56:51 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 103D4602BB; Thu, 13 Jun 2019 19:56:48 +0100 (BST)
Date:   Thu, 13 Jun 2019 19:56:48 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.3] Minor fixes
Message-ID: <20190613185648.54amkmeq64dn5xu7@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Just some minor fixes. 

Thanks,
Sean

--
The following changes since commit 3dad39e67cca68b321073cecabf2d7d1103d97d5:

  media: imx214: Fix typo in module description of imx214 (2019-06-12 10:47:15 -0400)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git for-v5.3d

for you to fetch changes up to ae39641d3d75c9d312cbf4fa2655dd0be19f60da:

  media: rc: IR signal for Panasonic air conditioner too long (2019-06-13 19:18:30 +0100)

----------------------------------------------------------------
Colin Ian King (1):
      media: stv090x: fix double free on state object

Sean Young (1):
      media: rc: IR signal for Panasonic air conditioner too long

YueHaibing (1):
      media: ttpci: Fix build error without RC_CORE

 drivers/media/dvb-frontends/stv090x.c | 1 -
 drivers/media/pci/ttpci/Kconfig       | 3 ++-
 drivers/media/rc/lirc_dev.c           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
