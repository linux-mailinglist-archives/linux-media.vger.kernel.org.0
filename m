Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F35355FDD8
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 12:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbiF2Kvo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 06:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiF2Kvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 06:51:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C1A2654D;
        Wed, 29 Jun 2022 03:51:41 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCB484A8;
        Wed, 29 Jun 2022 12:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656499899;
        bh=rIMHRAnsuIdW+0lB4HOABKpMr04hBn/R/wyk9Ph+t9I=;
        h=From:To:Cc:Subject:Date:From;
        b=S6/v9kxastdsk4+E9UA1GNEbuoxpE5l2KQajmnmhCGELmPuMSo2nlfakMKjaY9jk1
         sdmy40KdJ8SkbcQ8obmCzflQKlm7u4DtJxP9jWM0/E/2X7BkugjJE4EzBpxUq1Ci9g
         ju3A1WXq5cXOTU0xeVnb7pXXPLdHk3rurfXJUpYU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/7] renesas: vsp1: debugfs facility
Date:   Wed, 29 Jun 2022 11:51:28 +0100
Message-Id: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As discussed during the thread on [0] here are my out of tree debug
patches.

These are only really for reference not expected for merge, and I'm not
even sure it's worthy of an RFC tag. That said, if there are parts here
that should perhaps be extracted for integration let me know and I'll
split things out if relevant.

The register extraction and decode is probably something that could be
handled in userspace now anyway with something like Tomi's rwmem debug
tool [1]. I've used that for other devices, but not used it on vsp1 yet.


[0] https://lore.kernel.org/linux-media/20220629090912.GA27332@lxhi-065/T/#t
[1] https://github.com/tomba/rwmem



Kieran Bingham (7):
  debugfs: Extend debugfs regset to support register decoding
  v4l: vsp1: Provide WPF underflow error detection and reporting
  v4l: vsp1: Add debugfs system v1.8
  v4l: vsp1: Add CLK_CTRL and MRESET register definitions
  v4l: vsp1: Add safety mechanism registers
  v4l: vsp1: Provide video node debugfs entries
  v4l: vsp1: debugfs: Add DLM directory

 drivers/media/platform/renesas/vsp1/Makefile  |   1 +
 drivers/media/platform/renesas/vsp1/vsp1.h    |   5 +
 .../platform/renesas/vsp1/vsp1_debugfs.c      | 563 ++++++++++++++++++
 .../platform/renesas/vsp1/vsp1_debugfs.h      |  57 ++
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 107 ++++
 .../media/platform/renesas/vsp1/vsp1_drv.c    |  13 +-
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  36 ++
 .../media/platform/renesas/vsp1/vsp1_video.c  |  14 +-
 .../media/platform/renesas/vsp1/vsp1_video.h  |   9 +
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |   2 +-
 fs/debugfs/file.c                             |  11 +-
 include/linux/debugfs.h                       |   1 +
 12 files changed, 814 insertions(+), 5 deletions(-)
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_debugfs.h

-- 
2.34.1

