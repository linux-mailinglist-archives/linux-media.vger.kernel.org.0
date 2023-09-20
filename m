Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0976A7A8A58
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 19:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbjITRMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 13:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235577AbjITRM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 13:12:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CD0110
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 10:11:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBE7FB75;
        Wed, 20 Sep 2023 19:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695229806;
        bh=jkvEiH2t+InrNcGYok4CH/TuZ0/D2F4qpp+zncxguuI=;
        h=From:To:Cc:Subject:Date:From;
        b=P3xIuFc1O//erJO8rcqXmhzC2qx+Pz0PJqnKo1WZVj3YWn7fqqNzJyRat0Ww74I/s
         lwZ4OqfTYPNYJ9HCCm7W2dATGxj+7bTdazkWS15dwCY0xHyQ24Mtm0jF7sBb/crd2T
         A4DDvErHMyns5U7YtJ4X8mXTy9+d3V+4iOIBuYN8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v4 0/2] media: Add onsemi MT9M114 camera sensor driver
Date:   Wed, 20 Sep 2023 20:11:52 +0300
Message-ID: <20230920171155.7648-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds a driver for the onsemi MT9M114 camera sensor. It's all
a pretty standard story, DT bindings are in 1/2, and the driver in 2/2.
Review comments from v3 have all been taken into account as far as I can
tell.

The driver has been tested with an i.MX8MM in CSI-2 mode. Jacopo tested
v2 in parallel mode, but given the number of changes in v3, I haven't
kept the Tested-by tag.

Laurent Pinchart (2):
  media: dt-bindings: media: i2c: Add MT9M114 camera sensor binding
  media: i2c: Add driver for onsemi MT9M114 camera sensor

 .../bindings/media/i2c/onnn,mt9m114.yaml      |  114 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mt9m114.c                   | 2481 +++++++++++++++++
 5 files changed, 2614 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
 create mode 100644 drivers/media/i2c/mt9m114.c


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
Regards,

Laurent Pinchart

