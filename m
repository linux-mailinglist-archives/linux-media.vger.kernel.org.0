Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44452103CF
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 08:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgGAGVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 02:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgGAGVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 02:21:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA7AC061755;
        Tue, 30 Jun 2020 23:21:53 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 554C5556;
        Wed,  1 Jul 2020 08:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593584511;
        bh=nFMxs9sCVogWvTjKcAiW+SvOGSScj/TZBSM00jPBHMU=;
        h=From:To:Cc:Subject:Date:From;
        b=FvMbRGp9XldN7wu9c6OwQeNt6EpF2ziK3MUlCrOVCjnHFYgJvVTmfAc7khua4Fg+C
         rKBTQyP6X+yMmGwfy/rSmqyfE/pUwZCHxA3ObMjmMcVuamY3lEcDvI4+UKzdDB366Y
         UG2ge7ggxSahmRH0nXNqw0p/YVevVTUpvFYVuJwo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v4 0/4] media: v4l2-async: Accept endpoints and devices for fwnode matching
Date:   Wed,  1 Jul 2020 09:21:36 +0300
Message-Id: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series is the fourth version of fwnode endpoint matching
support in v4l2-async. The third version can be found at [1].

Compared to v3, a new function has been introduced in 1/4 and used in
2/4.

[1] https://lore.kernel.org/linux-media/20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com

Laurent Pinchart (4):
  device property: Add a function to test is a fwnode is a graph
    endpoint
  media: v4l2-async: Accept endpoints and devices for fwnode matching
  media: v4l2-async: Pass notifier pointer to match functions
  media: v4l2-async: Log message in case of heterogeneous fwnode match

 drivers/media/v4l2-core/v4l2-async.c | 83 +++++++++++++++++++++++++---
 include/linux/property.h             |  5 ++
 2 files changed, 80 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart

