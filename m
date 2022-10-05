Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10F25F5A64
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 21:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiJETHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 15:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbiJETGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 15:06:41 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2131278BE6
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 12:06:39 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 8E66DFF805;
        Wed,  5 Oct 2022 19:06:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH 00/10] media: ar0521: Add analog gain, rework clock tree
Date:   Wed,  5 Oct 2022 21:06:03 +0200
Message-Id: <20221005190613.394277-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  this series adds a few features to the ar0521 driver to enable its usage
with libcamera.

In particular:
- enum_frame_sizes
- global analog gain control
- LINK_FREQ, 60FPS support and configurable PIXEL_RATE
- Rework blanking handligs

Thanks
   j

Jacopo Mondi (10):
  media: ar0521: Implement enum_frame_sizes
  media: ar0521: Add V4L2_CID_ANALOG_GAIN
  media: ar0521: Set maximum resolution to 2592x1944
  media: ar0521: Rework PLL computation
  media: ar0521: Add LINK_FREQ control
  media: ar0521: Configure pixel rate using LINK_FREQ
  media: ar0521: Adjust exposure and blankings limits
  media: ar0521: Setup controls at s_stream time
  media: ar0521: Rework startup sequence
  media: ar0521: Tab-align definitions

 drivers/media/i2c/ar0521.c | 396 +++++++++++++++++++++++++++----------
 1 file changed, 293 insertions(+), 103 deletions(-)

--
2.37.3

