Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 413E4BC728
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438940AbfIXLuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:50:08 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40161 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395140AbfIXLuI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:50:08 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iCjKY-0002f6-C6; Tue, 24 Sep 2019 13:50:06 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mats Randgaard <matrandg@cisco.com>,
        Steve Longerbeam <slongerbeam@gmail.com>, kernel@pengutronix.de
Subject: [PATCH v4 0/3] Add g_csi_active_lanes for dynamic active lanes
Date:   Tue, 24 Sep 2019 13:49:52 +0200
Message-Id: <20190924114955.13132-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some MIPI CSI-2 transmitters, such as TC358743 can dynamically change
the number of active data lanes depending on the bandwidth needs for the
selected video format. This patchset adds a subdevice video operation
g_csi_active_lanes() to let the MIPI CSI-2 receiver query the number of
active lanes and change its configuration accordingly.

Changes since v3 [1]:
- Add g_csi_active_lanes() subdevice video operation,
  implement it in tc358743, and use it in imx6-mipi-csi2.

[1] https://patchwork.linuxtv.org/patch/53331/

regards
Philipp

Philipp Zabel (3):
  media: v4l2-subdev: add g_csi_active_lanes() op
  media: tc358743: fix connected/active CSI-2 lane reporting
  media: imx: ask source subdevice for number of active data lanes

 drivers/media/i2c/tc358743.c               | 44 ++++++++++++++++------
 drivers/staging/media/imx/imx6-mipi-csi2.c |  8 ++--
 include/media/v4l2-subdev.h                |  3 ++
 3 files changed, 39 insertions(+), 16 deletions(-)

-- 
2.20.1

