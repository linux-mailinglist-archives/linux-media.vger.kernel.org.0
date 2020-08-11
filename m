Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A014024217A
	for <lists+linux-media@lfdr.de>; Tue, 11 Aug 2020 23:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgHKVAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 17:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgHKVAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 17:00:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA21C06174A;
        Tue, 11 Aug 2020 14:00:04 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 207029A8;
        Tue, 11 Aug 2020 22:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597179597;
        bh=P+TxNoMyOVakT3Sl8HDYkuGzCPw/R5R8oIg8I2+iDVI=;
        h=From:To:Cc:Subject:Date:From;
        b=CPTCdLy+GOS34ArakOkA9D7JHLR+M1zevuiQwBXSt9Si7uKRXSGa1WYqTHebgsYqa
         5/s82PDsQxLfC+QUjMquLWQMK+pc5j2fr63nLuUZJb7RrRjE+BP1UYlub9ZZGg8e1K
         fFicfkVbethSE7Iggn6gP92SF0nlQ8S5BEj/GMAA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 0/5] media: Fix asd dynamic allocation
Date:   Tue, 11 Aug 2020 23:59:34 +0300
Message-Id: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series addresses a bug related to the usage of
v4l2_async_notifier_add_subdev() that is widespread among drivers.

The issue is explained in 1/4, which improves the documentation of the
v4l2_async_notifier_add_subdev() function by stating explicitly that the
asd argument needs to be allocated dynamically. Among the 13 drivers
that use that function, only one gets it right.

The rest of the patches fix the problem in several Renesas-related
drivers, with an unrelated fwnode reference leak fix for the rcar-drif
driver in 2/5 that made the v4l2_async_notifier_add_subdev() fix easier
to implement in that driver.

I'm lacking hardware to test 2/5 and 3/5. Ramesh, would you be able to
test that ? What development board do you use to test the DRIF driver ?
I don't see any DT integration upstream.

I also haven't dug up my MAX9286 development kit to test 5/5. I would
thus appreciate if someone could test it, but worst case I can do so
myself.

Laurent Pinchart (5):
  media: v4l2-async: Document asd allocation requirements
  media: rcar_drif: Fix fwnode reference leak when parsing DT
  media: rcar_drif: Allocate v4l2_async_subdev dynamically
  media: rcar-csi2: Allocate v4l2_async_subdev dynamically
  media: i2c: max9286: Allocate v4l2_async_subdev dynamically

 drivers/media/i2c/max9286.c                 | 38 +++++++++++----------
 drivers/media/platform/rcar-vin/rcar-csi2.c | 24 ++++++-------
 drivers/media/platform/rcar_drif.c          | 30 +++++-----------
 include/media/v4l2-async.h                  |  5 +--
 4 files changed, 42 insertions(+), 55 deletions(-)

-- 
Regards,

Laurent Pinchart

