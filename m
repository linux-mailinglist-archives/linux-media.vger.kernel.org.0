Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 686657ACD2B
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjIYAl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjIYAlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:41:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1679116
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:41:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D78202CF;
        Mon, 25 Sep 2023 02:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602362;
        bh=h9MwXR9aIweSLTl17OYz5+jTiUJjosYThz5TOWQ9bJM=;
        h=From:To:Cc:Subject:Date:From;
        b=ZMm2+PNBBmH5eRFXZbhoK12Z7+pwMxFmh6zCsGr1DqGfdF7gj0ikkFlu7eBUY8Wkv
         5tSdd7Llm4WjdpjNXhLCoEOwx+cgC4oVVto+6Ci7NQV4+R/5hkr4CiHXo3CrpaDTco
         9FJNT1Rp9HSUCiRMWIkw9T13xQVuKyIaKcilY1Wo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 00/14] media: rkisp1: Various cleanups and fixes
Date:   Mon, 25 Sep 2023 03:40:58 +0300
Message-ID: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
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

This patch series performs various cleanups in the rkisp1 driver and
fixes two issues.

The series starts in 01/14 with an update to MAINTAINERS to add myself
as a co-maintainer for the driver. I have authored most of the changes
to the rkisp1 driver in the recent past and plan to keep improving the
code base (including upstreaming i.MX8MP support), and I'd like to be
CC'ed on patches.

I have named the series v2 as it contains the second version of the
conversion to the V4L2 subdev active state in patches 02/14 to 04/14.
The remaining of the series is new. Patches 05/15 and 06/14 are two
small cleanups, and patch 07/14 is the first fix, for the line stride
calculation. Patches 08/14 to 13/14 continue with small cleanups, and
patch 14/14 finally fixes the resizer configuration when upscaling
vertically by a factor of 2.

I have successfully tested this series on a RK339 (Rock Pi 4), as well
as an i.MX8MP (Debix) with a few additional patches.

Laurent Pinchart (14):
  MAINTAINERS: Add co-maintainer for the rkisp1 driver
  media: rkisp1: resizer: Use V4L2 subdev active state
  media: rkisp1: isp: Use V4L2 subdev active state
  media: rkisp1: csi: Use V4L2 subdev active state
  media: rkisp1: Convert hex constants to lowercase
  media: rkisp1: Constify rkisp1_v12_params_ops
  media: rkisp1: Fix line stride calculation
  media: rkisp1: Remove dual crop control register from config structure
  media: rkisp1: Program RKISP1_CIF_MI_SP_Y_PIC_SIZE register
  media: rkisp1: resizer: Constify argument and local variables
  media: rkisp1: resizer: Use v4l2_area instead of v4l2_rect to store
    size
  media: rkisp1: resizer: Drop unneeded local variable
  media: rkisp1: resizer: Improve debug message when configuring resizer
  media: rkisp1: resizer: Fix resizer disable check when starting stream

 MAINTAINERS                                   |   1 +
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  24 +-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  18 -
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 107 +--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 263 +++-----
 .../platform/rockchip/rkisp1/rkisp1-params.c  |   4 +-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 618 +++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 255 +++-----
 8 files changed, 564 insertions(+), 726 deletions(-)

-- 
Regards,

Laurent Pinchart

