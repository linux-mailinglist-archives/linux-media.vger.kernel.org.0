Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FE14972D4
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 17:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238440AbiAWQJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 11:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238446AbiAWQJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 11:09:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C8AC06173B;
        Sun, 23 Jan 2022 08:09:22 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0247225E;
        Sun, 23 Jan 2022 17:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642954157;
        bh=gGqAnNSXfqGvE1bAbOp2NcHyz9dnl2btGOUK4uBAu4Y=;
        h=From:To:Cc:Subject:Date:From;
        b=NYrTcD82aEtrqWB+19vtcWSL1YFjM2gzuBcinCxfoJ8dbhlE+IXVRoNhTGsqyRVRE
         Ux6FW4k1I+d1gzWceRl2/IgR8VMXIjL0c19+qBeoL5KAHIZ8h3cOUamHKYEKI4QLmw
         yxvMSOBqi8eUh7SgFfay5vATGJUdotWcDixoRa8U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 0/6] media: Centralize MIPI CSI-2 data types in shared header
Date:   Sun, 23 Jan 2022 18:08:51 +0200
Message-Id: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This short patch series is the result of me being fed up with seeing
MIPI CSI-2 data types duplicated through drivers.

Patch 1/6 adds a new shared header to define the data types, and patches
2/6 to 6/6 replace custom macros or hardcoded values in drivers. There
are a few other drivers left that should still be updated, additional
patches are welcome on top of this series :-)

Laurent Pinchart (6):
  media: Define MIPI CSI-2 data types in a shared header file
  media: cadence: cdns-csi2tx: Use mipi-csi2.h
  media: rcar-isp: Use mipi-csi2.h
  media: rcar-csi2: Use mipi-csi2.h
  media: rockchip: rkisp1: Use mipi-csi2.h
  media: xilinx: csi2rxss: Use mipi-csi2.h

 drivers/media/platform/cadence/cdns-csi2tx.c  |   5 +-
 drivers/media/platform/rcar-isp.c             |  32 +++++-
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  57 ++++++++--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  34 +++---
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  11 --
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 106 ++++++++----------
 include/media/mipi-csi2.h                     |  45 ++++++++
 7 files changed, 183 insertions(+), 107 deletions(-)
 create mode 100644 include/media/mipi-csi2.h


base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
-- 
Regards,

Laurent Pinchart

