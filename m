Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5054050AC16
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442635AbiDUXph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442612AbiDUXpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:45:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DCEDFE7
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:42:45 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30C0B492;
        Fri, 22 Apr 2022 01:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584563;
        bh=pR+vg1LaqxXSnbqazz4jyAJgk6KnrswD0HJPcz8MOFI=;
        h=From:To:Cc:Subject:Date:From;
        b=G4sCTVVchqvwhEYUwpFobIgQJdZe09NaCXyZJ1qJIAe5GOuxcsxlArJ2V65KO4uvE
         4SwD0dW/NqAC5k9xCllXUdzhn3ZUX3F/62G9qwiJiJjErowdTSsA2mTDuTrSLBFa/8
         +FEqDGyBmTGH/yLi1Nknw0wO5Fmz88/TpuR2AgHU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 00/21] media: rkisp1: Misc bug fixes and cleanups
Date:   Fri, 22 Apr 2022 02:42:19 +0300
Message-Id: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series fixes multiple issues and performs further cleanups for the
rkisp1 driver.

Patches 01/21 to 07/21 fix issues in the error paths at probe time that
lead to kernel crashes in case of errors. The .remove() path is also
improved as a result.

Patches 08/21 and 09/21 then clean up register definitions, patch 10/21
swaps the arguments to rkisp1_write(), and patch 11/21 simplifies access
to the resizer registers.

Patches 12/21 to 18/21 move on to improving debugfs support, with code
first moved to a separate file (12/21) that can be conditionally
compiled (13/21), support for collecting statistics on the input
interface (14/21, very useful to check if the ISP actually receives
data) and for dumping core and ISP registers (15/21). Patch 16/21
continues that rework by moving the resizer register dumps support to
debugfs too, and patch 17/21 consolidates the resizer dumps code with
the core and ISP. Patch 18/21 completes the work by making the register
name length dynamic.

Finally, patch 19/21 simplifies the V4L2 querycap implementation on
video nodes, and patches 20/21 and 21/21 fix alignment and indentation.

More fixes and improvements should follow, so I'd like to merge sooner
than latter if possible, to avoid having to rebase large series.

Laurent Pinchart (20):
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
  media: rkisp1: Swap value and address arguments to rkisp1_write()
  media: rkisp1: resizer: Simplify register access
  media: rkisp1: Move debugfs code to a separate file
  media: rkisp1: Compile debugfs support conditionally
  media: rkisp1: debug: Collect input status by sampling ISP_FLAGS_SHD
  media: rkisp1: debug: Add debugfs files to dump core and ISP registers
  media: rkisp1: debug: Move resizer register dump to debugfs
  media: rkisp1: debug: Consolidate reg dumps for shadow registers
  media: rkisp1: debug: Compute max register length name dynamically
  media: rkisp1: Align macro definitions
  media: rkisp1: Drop parentheses and fix indentation in rkisp1_probe()

Paul Elder (1):
  media: rkisp1: capture: Bypass the main device for handling querycap

 .../media/platform/rockchip/rkisp1/Makefile   |  17 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 159 ++--
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  48 +-
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 225 ++++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  79 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 156 ++--
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 705 +++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 190 +++--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 204 ++---
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |  13 +-
 10 files changed, 952 insertions(+), 844 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c

-- 
Regards,

Laurent Pinchart

