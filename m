Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDDB2746EF0
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbjGDKlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbjGDKlJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:41:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A300187
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:41:08 -0700 (PDT)
Received: from uno.localdomain (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C0E72C6;
        Tue,  4 Jul 2023 12:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688467223;
        bh=1csZJj28HXH61Rqg62khzP4q6rwBSCyClMb40rFAm7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XQfTAbA6PkDkeXhA2LZoQ9HXDtWlBdsMqa2O8K1rLfWZ/8aSRaOFRavGj5I0ZBosP
         O/tpa9mds6iotKJ2NT8JFaRAJDX03kpclpu2b6mOMeNmImMdhGfbUnpfJMo0oDzOoN
         ZxRMj1pTqIYh26ZOYUEesNK7GXjCSdA+OhvUWF8I=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH 0/5] media: i2c: imx219: Use subdev active state
Date:   Tue,  4 Jul 2023 12:40:52 +0200
Message-Id: <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this series ports the imx219 to use the subdev active state with great
simplification of format handling, locking and device initialization.

It resumes the work started by Jean-Michel but had to be ported to the new API
and applied on the most recent version of the sensor driver.

Tested with libcamera, by streaming in 1080p, VGA applying V/H flips to make
sure the mbus code permutation handling is still correct.

Thanks
   j

Jacopo Mondi (3):
  media: i2c: imx219: Use subdev active state
  media: i2c: imx219: Simplify format assignment
  media: i2c: imx219: Simplify code handling in s_fmt

Jean-Michel Hautbois (2):
  media: i2c: imx219: Rename mbus codes array
  media: i2c: imx219: Switch from open to init_cfg

 drivers/media/i2c/imx219.c | 289 ++++++++++++-------------------------
 1 file changed, 91 insertions(+), 198 deletions(-)

--
2.40.1

