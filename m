Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2264969C1C7
	for <lists+linux-media@lfdr.de>; Sun, 19 Feb 2023 19:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjBSSEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Feb 2023 13:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjBSSD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Feb 2023 13:03:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F22412876
        for <linux-media@vger.kernel.org>; Sun, 19 Feb 2023 10:03:57 -0800 (PST)
Received: from uno.homenet.telecomitalia.it (host-95-252-227-22.retail.telecomitalia.it [95.252.227.22])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADA057FE;
        Sun, 19 Feb 2023 19:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676829834;
        bh=HXhh9avpeRvvXO1ParDPxlcfiNDTqUDZlvNqka9O85I=;
        h=From:To:Cc:Subject:Date:From;
        b=WuAWf1tDDf4IlREZATvLz9NQVYuVRBvu9ew/iRiUw/e43SSgKQU1Hy5ow/b455c7W
         6X39Gnj4mHxJpKH1BCeGE42b0Z5SpKI36Fl0j3FMlSySS9bjuOW/X53gTdHosct3wi
         98eYbMZUHJHqGCBrRTzDTHDqJx/uh+dj4I7Ot2u8=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: ov5647: Add test pattern support
Date:   Sun, 19 Feb 2023 19:03:32 +0100
Message-Id: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A small series that upports commit 7da051cfc67 ("media: i2c: ov5647: Add test
pattern control") from the Renesas 6.1 BSP.

While at there, add small patch to make the i2c read transactions safer by
ensuring the bus is locked.

Jacopo Mondi (1):
  media: i2c: ov5647: Use bus-locked i2c_transfer()

Valentine Barshak (1):
  media: i2c: ov5647: Add test pattern control

 drivers/media/i2c/ov5647.c | 52 ++++++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 10 deletions(-)

--
2.39.0

