Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2A2A4C5CB7
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 17:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbiB0QCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 11:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiB0QCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 11:02:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C8749F21
        for <linux-media@vger.kernel.org>; Sun, 27 Feb 2022 08:01:33 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C63DC47C;
        Sun, 27 Feb 2022 17:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645977691;
        bh=v4T9IOGPNq/bMSxFyn2Excl8+QKXlLWewW+LbrftO1g=;
        h=From:To:Cc:Subject:Date:From;
        b=OfnqGGn5K6CkIejOykcFaYVO4crFA2xEwfPtf1ypu+/UPzd2J1zk+vRbZ41QfgBTm
         yTshE3br1VdkBxng51yaAUVJM3heW+vfXF1d/eD5weO4UZirf+22o7YS13ldTDJZVT
         nyheIaOlXZh8i+AgtqyD6hTS5Omxc+E4hoU7vWI8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 00/16] media: rkisp1: Misc bug fixes and cleanups
Date:   Sun, 27 Feb 2022 18:01:00 +0200
Message-Id: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series fixes multiple issues and performs further cleanups for the
rkisp1 driver.

Patches 01/16 to 07/16 fix issues in the error paths at probe time that
lead to kernel crashes in case of errors. The .remove() path is also
improved as a result.

Patches 08/16 and 09/16 then clean up register definitions, and patch
10/16 simplifies access to the resizer registers.

Patches 11/16 to 15/16 move on to improving debugfs support, with code
first moved to a separate file (11/16) that can be conditionally
compiled (12/16), support for collecting statistics on the input
interface (13/16, very useful to check if the ISP actually receives
data) and for dumping core and ISP registers (14/16). Patch 15/16
completes that rework by moving the resizer register dumps support to
debugfs too.

Finally, patch 16/16 simplifies the V4L2 querycap implementation on
video nodes.

More fixes and improvements should follow, so I'd like to merge sooner
than latter if possible, to avoid having to rebase large series.

Laurent Pinchart (15):
  media: rkisp1: capture: Initialize entity before video device
  media: rkisp1: capture: Fix and simplify (un)registration
  media: rkisp1: isp: Fix and simplify (un)registration
  media: rkisp1: resizer: Fix and simplify (un)registration
  media: rkisp1: params: Fix and simplify (un)registration
  media: rkisp1: stats: Simplify (un)registration
  media: rkisp1: Simplify rkisp1_entities_register() error path
  media: rkisp1: regs: Don't use BIT() macro for multi-bit register
    fields
  media: rkisp1: regs: Rename CCL, ICCL and IRCL registers with VI_
    prefix
  media: rkisp1: resizer: Simplify register access
  media: rkisp1: Move debugfs code to a separate file
  media: rkisp1: Compile debugfs support conditionally
  media: rkisp1: debug: Collect input status by sampling ISP_FLAGS_SHD
  media: rkisp1: debug: Add debugfs files to dump core and ISP registers
  media: rkisp1: debug: Move resizer register dump to debugfs

Paul Elder (1):
  media: rkisp1: capture: Bypass the main device for handling querycap

 .../media/platform/rockchip/rkisp1/Makefile   |  18 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  52 ++---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  16 ++
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 209 ++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  73 ++----
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  39 ++--
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  23 +-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 188 ++++++++--------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 192 ++++------------
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |  11 +-
 10 files changed, 464 insertions(+), 357 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c

-- 
Regards,

Laurent Pinchart

