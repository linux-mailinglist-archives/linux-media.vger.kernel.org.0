Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221537A2419
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 19:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjIORAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 13:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbjIORAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 13:00:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668962D66
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 09:59:52 -0700 (PDT)
Received: from Monstersaurus.local (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AEB9B1;
        Fri, 15 Sep 2023 18:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694797097;
        bh=q8QRdVju2LEThol0TaROwp7uwxCcBsaaL7JJn7uOZys=;
        h=From:To:Cc:Subject:Date:From;
        b=Du5sqcMbwTuWqufoAb4NlpSOY+Ru2IT48mldalVHXDI8vPeG6Z5C/I1BomOSJCF8T
         W+VNLJpVBjXfv9aS5WVqxZhwooKxcMvvU9YNbVlcF2MucOKbr2F7eoNNv3/XQiCqIF
         /KrIvxaLBcLYfnpYvMfJyNUwcJm4aqHUy6e6sGTk=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/2] media: i2c: Add ROHM BU64754 Focus Motor driver
Date:   Fri, 15 Sep 2023 17:59:44 +0100
Message-Id: <20230915165946.4183839-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Provide support for the ROHM Motor Driver for Camera Autofocus.

Aside from a snippet of a product brief and the address to update for
the postion and power control I have very little information on this
device, so I have tried to keep it simple.

The new CCI helpers are great for simplifying the i2c register access
and setting up regmap!.

Register 0x00 on this device reads as 0x0705, and I believe this part is
also mentioned as BU6475 (making a leap there to assume that '75' is the
version) - so we could identify this at runtime. However as I don't have
a register datasheet to confirm this I have not implemented any runtime
version detection. Perhaps in the future if there are more ROHM VCMs
supported it could be useful.

Kieran Bingham (2):
  Documentation: dt-bindings: media: i2c: Add ROHM BU64754 bindings
  media: i2c: Add ROHM BU64754 Camera Autofocus Actuator

 .../bindings/media/i2c/rohm,bu64754.yaml      |  48 +++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  13 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/bu64754.c                   | 308 ++++++++++++++++++
 5 files changed, 378 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/rohm,bu64754.yaml
 create mode 100644 drivers/media/i2c/bu64754.c

-- 
2.34.1

