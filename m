Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB5417FBF4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731358AbgCJNRi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:17:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:48830 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731291AbgCJNRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:17:37 -0400
X-IronPort-AV: E=Sophos;i="5.70,537,1574089200"; 
   d="scan'208";a="41284250"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2020 22:17:35 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 01B764290415;
        Tue, 10 Mar 2020 22:17:33 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/3] media: i2c: imx219: Feature enhancements
Date:   Tue, 10 Mar 2020 13:17:06 +0000
Message-Id: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series does the following:
1: Makes sure the sensor is LP11 state on power up
2: Adds support for RAW8
3: Adds support for 640x480 resolution

Changes for v4:
1: Fixed review comments for patch 2/2 as request by Sakari.

Changes for v3:
1: Only patch 3/3 was posted for review.

Changes for v2:
1: Dropped setting the format in probe to coax the sensor to enter LP11
   state.
2: Fixed switching between RAW8/RAW10 modes.
3: Fixed fps setting for 640x480 and switched to auto mode.

Lad Prabhakar (3):
  media: i2c: imx219: Fix power sequence
  media: i2c: imx219: Add support for RAW8 bit bayer format
  media: i2c: imx219: Add support for cropped 640x480 resolution

 drivers/media/i2c/imx219.c | 235 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 202 insertions(+), 33 deletions(-)

-- 
2.7.4

