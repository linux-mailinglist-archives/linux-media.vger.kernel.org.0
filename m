Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04570747185
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 14:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjGDMik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 08:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjGDMii (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 08:38:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD615E70
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 05:38:37 -0700 (PDT)
Received: from uno.localdomain (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCFA46DF;
        Tue,  4 Jul 2023 14:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688474271;
        bh=BejML65DRONFHb/mi32cNW8ulCH3ZxVlf6L9MYpmrKY=;
        h=From:To:Cc:Subject:Date:From;
        b=qHXrxX96Ea3eni9b4yi6d1NgBS1pgX8bnyav4qWXnVM5NkLqyhKKVhtWvkX7e0kpi
         MtoI3mVHP4A1O5q/s4oz97CoXETLxWwihHdjkxKVYSlPENP1+vgukpQzs0E67gdtyL
         RLgICTh2qYaEh0THRNuiiAe8r6in1V7O1E8JYNu0=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/2] Documentation: v4l: more camera sensor doc
Date:   Tue,  4 Jul 2023 14:38:17 +0200
Message-Id: <20230704123819.156418-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
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

Two small addictions to camera sensor documentation to reflect what has
been discussed during my presentation at EOSS last week.

Thanks
   j

v1->v2:
- Address Dave's review comments

Jacopo Mondi (2):
  Documentation: v4l: Flip handling for RAW sensors
  Documentation: v4l: Exposure/gain for camera sensor

 .../driver-api/media/camera-sensor.rst        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

--
2.40.1

