Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133B050A298
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389489AbiDUOiE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389452AbiDUOhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:37:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD1CCE8
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:35:00 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CC3A492;
        Thu, 21 Apr 2022 16:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650551699;
        bh=kvCFs4FL9ghP6N6QhZqQ5b/3XZfxwF28pW1tBD+iEN8=;
        h=From:To:Cc:Subject:Date:From;
        b=nGshkhqLQprCLZUzWGmCO/enZR75nkZI3o2LkF2stAB0gtxb8uDHOEdWohYqyhBpP
         CIWOcsF25e3cgmnrvfCFIkpoxYSAUWK5YKd2+J7lOCZ7ARPK/4aXcC8BtO2ML+CH2x
         H2w33HBvHyj2j9NXNPbWCJDdnQogsTSf15D3UQtc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/6] media: ti: cal: misc fixes
Date:   Thu, 21 Apr 2022 17:34:43 +0300
Message-Id: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
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

Here are some fixes for CAL that I've been carrying in my streams
branch, but as they don't depend on the streams work they can be merged
separately.

 Tomi

Tomi Valkeinen (6):
  media: ti: cal: fix error paths in cal_camerarx_create()
  media: ti: cal: fix useless variable init
  media: ti: cal: rename sd_state to state
  media: ti: cal: use CSI-2 frame number for seq number
  media: ti: cal: combine wdma irq handling
  media: ti: cal: fix wdma irq for metadata

 drivers/media/platform/ti/cal/cal-camerarx.c |  46 +++---
 drivers/media/platform/ti/cal/cal-video.c    |   5 +-
 drivers/media/platform/ti/cal/cal.c          | 139 ++++++++++++++-----
 drivers/media/platform/ti/cal/cal.h          |   7 +-
 4 files changed, 136 insertions(+), 61 deletions(-)

-- 
2.25.1

