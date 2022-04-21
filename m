Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120C550A287
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389322AbiDUOdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389498AbiDUOcb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:32:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B093FD82
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:29:34 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C355E492;
        Thu, 21 Apr 2022 16:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650551371;
        bh=iLdDoFzCKLupnJ5CR3+DKByALxPQ94Ygeka4t0WX1Ew=;
        h=From:To:Cc:Subject:Date:From;
        b=EJEiB9u1uZjlm342eT2EiFwyqxxP9ZXL754YHfVvw3+QWw0ThwzvvCoH05KMGBDS2
         gMhEoV9xFwynI2KDioD247rSwsnkmJcJBbvpKU2yLFVGxOvaxkYVGgBGALtkfye8hG
         8a89vZG3HBfyeqvuPv0q8Qg0asGYGOXknJKihX7M=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/3] media: CSI-2 configuration to frame desc
Date:   Thu, 21 Apr 2022 17:29:03 +0300
Message-Id: <20220421142906.527918-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

I've carried these patches in my streams series, but I think they
provide value also alone.

These improve the frame descriptors so that the drivers can fill in the
CSI-2 datatype and virtual channel, and make the CAL driver use that
data if available.

 Tomi

Sakari Ailus (2):
  media: Add bus type to frame descriptors
  media: Add CSI-2 bus configuration to frame descriptors

Tomi Valkeinen (1):
  media: ti: cal: use frame desc to get vc and dt

 drivers/media/platform/ti/cal/cal-camerarx.c | 27 ++++++++++
 drivers/media/platform/ti/cal/cal.c          | 52 +++++++++++++++++++-
 drivers/media/platform/ti/cal/cal.h          |  2 +
 include/media/v4l2-subdev.h                  | 36 ++++++++++++++
 4 files changed, 115 insertions(+), 2 deletions(-)

-- 
2.25.1

