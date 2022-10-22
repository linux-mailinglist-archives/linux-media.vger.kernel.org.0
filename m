Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36FDA608B6C
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 12:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiJVKUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 06:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiJVKUC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 06:20:02 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76284B0C9
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 02:36:55 -0700 (PDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 5B161CE2AC
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 09:22:31 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A08F5240002;
        Sat, 22 Oct 2022 09:20:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH v2 00/10] media: ar0521: Add analog gain, rework clock tree
Date:   Sat, 22 Oct 2022 11:20:05 +0200
Message-Id: <20221022092015.208592-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
- LINK_FREQ
- Rework blanking handligs

v2:

- I have dropped the most controverse part that allows to change the link
  frequency to obtain 60FPS. It can be eventually be applied on top.
- Use register 0x3028 to control analog gain not to overwrite the global digital
  gain.
- Fix the HBLANK/VBLANK max by using the values read from on-chip registers.
- Fix handling of LINK_FREQ in s_cltr (but do not make the control read only).
- Fix errors reported by 0-days:
  - use do_div() for 64-bit division
  - declare variables in function scope and not in case scope in s_ctrl

Thanks
   j

Jacopo Mondi (10):
  media: ar0521: Implement enum_frame_sizes
  media: ar0521: Add V4L2_CID_ANALOG_GAIN
  media: ar0521: Set maximum resolution to 2592x1944
  media: ar0521: Rework PLL computation
  media: ar0521: Refuse unsupported controls
  media: ar0521: Add LINK_FREQ control
  media: ar0521: Adjust exposure and blankings limits
  media: ar0521: Setup controls at s_stream time
  media: ar0521: Rework startup sequence
  media: ar0521: Tab-align definitions

 drivers/media/i2c/ar0521.c | 348 ++++++++++++++++++++++++++-----------
 1 file changed, 245 insertions(+), 103 deletions(-)

--
2.37.3

