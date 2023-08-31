Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7008178EF0E
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 15:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238570AbjHaN5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 09:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235410AbjHaN5l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 09:57:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894351A4
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 06:57:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5A552D8;
        Thu, 31 Aug 2023 15:56:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693490173;
        bh=870s9uBYQPZ6K56u/Q4tdyenFpmyld6tbBZEoOxOxH8=;
        h=From:To:Cc:Subject:Date:From;
        b=gL1fljpkqeNoyhkYyXde1bs0VmuY6IdtA+rQ4UVmVIZc46pLbKOzSQeFY1pblu/Wu
         vkV1SypnIBZ67bKkIMtcR007uTCEUQYk77X6Gi7+dPZgL/L15Fdt85K7GVxHn7i1oM
         FGu6VZXkaPxPPjWDXe2hdIvkVzOjuFYFI4bFDWY8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/3] media: i2c: imx219: Miscellaneous fixes
Date:   Thu, 31 Aug 2023 16:57:44 +0300
Message-ID: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
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

This small series fixes three issues introduced by the "[PATCH v2 0/7]
media: i2c: imx219: Use subdev active state" series, merged in the stage
tree and scheduled for upstream merge in v6.6. Please see individual
patches for details.

Laurent Pinchart (3):
  media: i2c: imx219: Fix a typo referring to a wrong variable
  media: i2c: imx219: Fix crop rectangle setting when changing format
  media: i2c: imx219: Perform a full mode set unconditionally

 drivers/media/i2c/imx219.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)


base-commit: 4c420b729238696d06d39f31fc85a287629a0304
-- 
Regards,

Laurent Pinchart

