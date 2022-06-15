Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08DB54CB88
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 16:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234028AbiFOOjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 10:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347318AbiFOOiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 10:38:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381DD2CCBB
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 07:38:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58D0D5A9;
        Wed, 15 Jun 2022 16:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655303886;
        bh=0EpIzqHqqSnkByYS6l8lemBHSW4NPMYxO1kLR5xNbxs=;
        h=Date:From:To:Cc:Subject:From;
        b=j5G0lgYUMd98V83w+JtfxRjGadqmkjxtRln249IPBYkNopHoWBZJeF2QIgVt7HAN6
         CAM/M5D5vJtV7fDhUJJuSQsdQE29/3gPL1kr8VIxvhcGvVrJS6ReOq2H7zJx5s352g
         kLcOsK6VcVbsmVitDUwXbrAhH55nKLSmK7iYQN+U=
Date:   Wed, 15 Jun 2022 17:37:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [GIT PULL FOR v5.20] rkisp1 misc fixes and improvements
Message-ID: <YqnuxKlNjA0AaIAR@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/imx-next-20220615

for you to fetch changes up to 4d846800b527933a46ffd5ff48b87f5a03ca087a:

  media: rkisp1: Drop parentheses and fix indentation in rkisp1_probe() (2022-06-15 16:51:44 +0300)

----------------------------------------------------------------
rkisp1 misc bug fixes and cleanups

----------------------------------------------------------------
Laurent Pinchart (20):
      media: rkisp1: capture: Initialize entity before video device
      media: rkisp1: capture: Fix and simplify (un)registration
      media: rkisp1: isp: Fix and simplify (un)registration
      media: rkisp1: resizer: Fix and simplify (un)registration
      media: rkisp1: params: Fix and simplify (un)registration
      media: rkisp1: stats: Simplify (un)registration
      media: rkisp1: Simplify rkisp1_entities_register() error path
      media: rkisp1: regs: Don't use BIT() macro for multi-bit register fields
      media: rkisp1: regs: Rename CCL, ICCL and IRCL registers with VI_ prefix
      media: rkisp1: Swap value and address arguments to rkisp1_write()
      media: rkisp1: resizer: Simplify register access
      media: rkisp1: Move debugfs code to a separate file
      media: rkisp1: Compile debugfs support conditionally
      media: rkisp1: debug: Collect input status by sampling ISP_FLAGS_SHD
      media: rkisp1: debug: Add debugfs files to dump core and ISP registers
      media: rkisp1: debug: Move resizer register dump to debugfs
      media: rkisp1: debug: Consolidate reg dumps for shadow registers
      media: rkisp1: debug: Update max register name length
      media: rkisp1: Align macro definitions
      media: rkisp1: Drop parentheses and fix indentation in rkisp1_probe()

Paul Elder (1):
      media: rkisp1: capture: Bypass the main device for handling querycap

 drivers/media/platform/rockchip/rkisp1/Makefile    |  17 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 159 +++--
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  48 +-
 .../media/platform/rockchip/rkisp1/rkisp1-debug.c  | 222 +++++++
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |  79 +--
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 156 ++---
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 705 +++++++++++----------
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   | 190 +++---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 204 ++----
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  13 +-
 10 files changed, 949 insertions(+), 844 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c

-- 
Regards,

Laurent Pinchart
