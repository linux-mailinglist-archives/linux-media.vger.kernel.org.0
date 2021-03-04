Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0454432D475
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 14:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239030AbhCDNq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 08:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbhCDNqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 08:46:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB06C06175F
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 05:45:56 -0800 (PST)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A968C27A;
        Thu,  4 Mar 2021 14:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614865553;
        bh=HwWT8jAKstnbVDUHIEuABvESb8b7RgRixN04h/lZlKI=;
        h=From:To:Cc:Subject:Date:From;
        b=Wp3hrS7CkpDfPmFTsU5t4gSkB5FrHUAtW9nLB+zCiW5stylU4xFZ2ZTDEHGST3uI3
         2XdwY3hvnxu/R4/Pb3draZr4Z+8Cpl3UcklVCeOoI+8ROSmdM6c1moU1VA0W/q9erh
         bQKoiHAJY2/WjmfHsWpo5vFcdrq9m5UQx7SxDkv8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/3] media: ti-vpe: cal: Add media controller support
Date:   Thu,  4 Mar 2021 15:45:18 +0200
Message-Id: <20210304134521.1825150-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v4 of the series, although everything else but the MC patch have already
been merged. I made some fixes to the MC patch (changes listed in patch
description), and added two new CAL fixes I encountered while testing.

 Tomi

Laurent Pinchart (1):
  media: ti-vpe: cal: Implement media controller centric API

Tomi Valkeinen (2):
  media: ti-vpe: cal: remove unneeded assignment
  media: ti-vpe: cal: fix subdev mbus_code enumeration

 drivers/media/platform/Kconfig               |  14 +
 drivers/media/platform/ti-vpe/cal-camerarx.c |   1 +
 drivers/media/platform/ti-vpe/cal-video.c    | 332 +++++++++++++++----
 drivers/media/platform/ti-vpe/cal.c          |  16 +-
 drivers/media/platform/ti-vpe/cal.h          |   2 +
 5 files changed, 300 insertions(+), 65 deletions(-)

-- 
2.25.1

