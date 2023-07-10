Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF5074D76C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 15:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjGJNXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 09:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjGJNXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 09:23:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBA5FE
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 06:22:56 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D254BC85;
        Mon, 10 Jul 2023 15:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688995326;
        bh=/VlroI16ulc/4CcHFj/PtqR4JJemBFSoXd4ZidVM7Ec=;
        h=From:To:Cc:Subject:Date:From;
        b=fA8LmIf0Q/NIGD/FL1Zu4vkAA5nq6/qXi7RTK7LyLZL8dmLQ/alEIrqIw1onAytyW
         L9l2xrBPoUxJsYLeLtFCTnUZGsJxeup/765CqEBuuIea5kyEeeSqBBuy2lc9xflwVd
         cX37IA46WOZpupUAWbRkS2jJPtlzYdmZ4gSpSkf8=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 0/2] Documentation: v4l: more camera sensor doc
Date:   Mon, 10 Jul 2023 15:22:38 +0200
Message-Id: <20230710132240.7864-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two small addictions to camera sensor documentation to reflect what has
been discussed during my presentation at EOSS last week.

Thanks
   j

v2->v3:
- minor spelling fixes from Dave
- Add Dave's tags

v1->v2:
- Address Dave's review comments

Jacopo Mondi (2):
  Documentation: v4l: Flip handling for RAW sensors
  Documentation: v4l: Exposure/gain for camera sensor

 .../driver-api/media/camera-sensor.rst        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

--
2.40.1

