Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4D150F1BA
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343786AbiDZHJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238703AbiDZHJe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:09:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CC6377F4
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:06:27 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CCCB487;
        Tue, 26 Apr 2022 09:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650956786;
        bh=6gFNmUPNbph9vhX6pO1LZhH1h+GsKJzNnK4Oe4lMEbw=;
        h=From:To:Cc:Subject:Date:From;
        b=dbCJtx5+MAcLxOQXitIBSTmOX02rb3AoSB+q/Ypqrb9VVRKyj9Hm23abRPeFYvE2g
         59md18Y5HhQ7BZF086mUbHnTDrE1pYzPICOnLmdkXIBK62U/+XgIN2F7d28cDd7k84
         dUPOvf3CwyyAerxCE+8KHR6i5SqTr3BawwAUGS7A=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/5] media: ti: cal: misc fixes
Date:   Tue, 26 Apr 2022 10:06:13 +0300
Message-Id: <20220426070618.68536-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v2 of the series. v1 can be found from:

https://lore.kernel.org/all/20220421143449.552312-1-tomi.valkeinen@ideasonboard.com/

Changes in v2:

- Drop "media: ti: cal: fix error paths in cal_camerarx_create()"
- Improved descs in "media: ti: cal: rename sd_state to state" and
  "media: ti: cal: use CSI-2 frame number for seq number"

 Tomi

Tomi Valkeinen (5):
  media: ti: cal: fix useless variable init
  media: ti: cal: rename sd_state to state
  media: ti: cal: use CSI-2 frame number for seq number
  media: ti: cal: combine wdma irq handling
  media: ti: cal: fix wdma irq for metadata

 drivers/media/platform/ti/cal/cal-camerarx.c |  31 +++--
 drivers/media/platform/ti/cal/cal-video.c    |   5 +-
 drivers/media/platform/ti/cal/cal.c          | 139 ++++++++++++++-----
 drivers/media/platform/ti/cal/cal.h          |   7 +-
 4 files changed, 128 insertions(+), 54 deletions(-)

-- 
2.34.1

