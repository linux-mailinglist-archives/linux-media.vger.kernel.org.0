Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70B64779E3
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 18:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239893AbhLPRCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 12:02:42 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54989 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235478AbhLPRCm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 12:02:42 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3926F1BF20F;
        Thu, 16 Dec 2021 17:02:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/5] media: adv748x: Add CSI-2 VC support
Date:   Thu, 16 Dec 2021 18:03:18 +0100
Message-Id: <20211216170323.141321-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello
   based on Tomi's v10, this series adds support for configurable virtual
channel selection to the adv748x driver.

A branch for testing is available at
https://git.sr.ht/~jmondi_/linux #multistream/tomba-v10/gmsl

This series upports BSP commit
https://github.com/renesas-rcar/linux-bsp/commit/8340a028b21a5ba1dc09a55a6d2ec6cbd47d557b?diff=unified

Tested on R-Car M3-W

Thanks
   j

Jacopo Mondi (5):
  media: adv748x: Add flags to adv748x_subdev_init()
  media: adv748x: Add support for v4l2_subdev_state
  media: adv748x: Move format to subdev state
  media: adv748x: Implement .get_frame_desc()
  media: adv748x: Implement set_routing

 drivers/media/i2c/adv748x/adv748x-afe.c  |   2 +-
 drivers/media/i2c/adv748x/adv748x-core.c |   4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c | 292 ++++++++++++++++++-----
 drivers/media/i2c/adv748x/adv748x-hdmi.c |   2 +-
 drivers/media/i2c/adv748x/adv748x.h      |   6 +-
 5 files changed, 244 insertions(+), 62 deletions(-)

--
2.33.1

