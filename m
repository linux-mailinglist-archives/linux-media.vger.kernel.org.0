Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6221F0942
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 03:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgFGBjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 21:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbgFGBjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 21:39:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B92C08C5C2
        for <linux-media@vger.kernel.org>; Sat,  6 Jun 2020 18:39:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AEEB2C9
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 03:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591493963;
        bh=QzBzhVndNJfF7RXf1EF37RIAcrdSC8quLONkL5PG70k=;
        h=Date:From:To:Subject:From;
        b=fRC0dqya+aVkUXVWQ4xrq39Q6bVAIg+xBHmgGr6yNj+f3xIgNlBFnVCovVSie5UsB
         S+pYVS2pmaUZVdN4XKqj6JndMxrnX3x7Xxwaypa5imzcCL9nmRG+EtV2XfDUF2ziXi
         Wu7/IlSEIczB6lH+/icTXEgJ6QGesgXkHNslYVug=
Date:   Sun, 7 Jun 2020 04:39:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.9] Xilinx CSI-2 RX subsystem
Message-ID: <20200607013904.GA21888@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 938b29db3aa9c293c7c1366b16e55e308f1a1ddd:

  media: Documentation: media: Refer to mbus format documentation from CSI-2 docs (2020-05-25 15:47:02 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/xilinx-20200607

for you to fetch changes up to 368e185366b7a391fe0bfac40d5ea705a55e66fe:

  media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem driver (2020-06-07 04:31:35 +0300)

----------------------------------------------------------------
Xilinx CSI-2 RX subsystem driver

----------------------------------------------------------------
Vishal Sagar (2):
      media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
      media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem driver

 .../bindings/media/xilinx/xlnx,csi2rxss.yaml    |  237 ++++
 drivers/media/platform/xilinx/Kconfig           |    7 +
 drivers/media/platform/xilinx/Makefile          |    1 +
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 1111 +++++++++++++++++
 4 files changed, 1356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c

-- 
Regards,

Laurent Pinchart
