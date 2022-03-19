Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D6A4DE94C
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243639AbiCSQct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243638AbiCSQcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:32:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B914323F9E2
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:27 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB140492;
        Sat, 19 Mar 2022 17:31:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707484;
        bh=VrYbvqWAe/Eera3DAkZG106SJkZ5L3lb7ZQVsyLAMw8=;
        h=From:To:Cc:Subject:Date:From;
        b=Ng2USORh21nxBdq+K57ykLasTzAQVOVYVE1i8FXZYNiCnIGWXFfgMVsGlIblqvOWz
         R65hX7vYfa2/1zZRAINEavMDCjN0Q4LGF5MmdVPt6pfJ+0dFVjenOVdXR8cZpphnPx
         xAXIjiiFqgbiOxBpHL9GKAZnOF0MNocLtCBuSGkM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 00/17] media: rkisp1: Misc bug fixes and cleanups
Date:   Sat, 19 Mar 2022 18:30:43 +0200
Message-Id: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
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

Patches 01/17 to 07/17 fix issues in the error paths at probe time that
lead to kernel crashes in case of errors. The .remove() path is also
improved as a result.

Patches 08/17 and 09/17 then clean up register definitions, patch 10/17
swaps the arguments to rkisp1_write(), and patch 11/17 simplifies access
to the resizer registers.

Patches 12/17 to 16/17 move on to improving debugfs support, with code
first moved to a separate file (12/17) that can be conditionally
compiled (13/17), support for collecting statistics on the input
interface (14/17, very useful to check if the ISP actually receives
data) and for dumping core and ISP registers (15/17). Patch 16/17
completes that rework by moving the resizer register dumps support to
debugfs too.

Finally, patch 17/17 simplifies the V4L2 querycap implementation on
video nodes.

More fixes and improvements should follow, so I'd like to merge sooner
than latter if possible, to avoid having to rebase large series.

Laurent Pinchart (16):
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

Paul Elder (1):
  media: rkisp1: capture: Bypass the main device for handling querycap

 .../media/platform/rockchip/rkisp1/Makefile   |  18 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 159 ++--
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  18 +-
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 224 ++++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  73 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 156 ++--
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 706 +++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 188 +++--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 204 ++---
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |  13 +-
 10 files changed, 934 insertions(+), 825 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c


base-commit: 71e6d0608e4d1b79069990c7dacb3600ced28a3b
-- 
Regards,

Laurent Pinchart

