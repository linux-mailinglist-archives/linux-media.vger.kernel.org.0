Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D165569F4F2
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 13:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjBVM4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 07:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjBVM4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 07:56:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379AE360B7
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 04:56:52 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45D164B0;
        Wed, 22 Feb 2023 13:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677070610;
        bh=xA678SV/VCxb+IisveIEBQ5FXkhgi6J13+7I6OjDFks=;
        h=From:To:Cc:Subject:Date:From;
        b=g5Ou7N56Mg2iSFsTLFU1x/qq4Tm1Noy9qkcoBPaf8iqpIEA0bHgUpx8kpPe/boXkP
         MWIo3Eh/EU4GUtY8ox2tYxvNUjwJ1egP9B5pP2YWcVycoh/0yfihS5UAUUra5wkAG8
         EwyhyyErhjJOEHoI4C3T7aVJQdg1VWfcYlhE12qU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 0/3] media: ti: cal: Streams support
Date:   Wed, 22 Feb 2023 14:56:27 +0200
Message-Id: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
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

This series adds multiplexed streams support to TI's CAL driver. The
first two patches are somewhat unrelated, and could be merged separately
if the streams support needs lots of more work.

 Tomi

Tomi Valkeinen (3):
  media: ti: cal: Add support for 1X16 mbus formats
  media: ti: cal: Use subdev state
  media: ti: cal: add multiplexed streams support

 drivers/media/platform/ti/cal/cal-camerarx.c | 327 ++++++++++++-------
 drivers/media/platform/ti/cal/cal-video.c    | 181 ++++++++--
 drivers/media/platform/ti/cal/cal.c          |  90 +++--
 drivers/media/platform/ti/cal/cal.h          |  13 +-
 4 files changed, 419 insertions(+), 192 deletions(-)

-- 
2.34.1

