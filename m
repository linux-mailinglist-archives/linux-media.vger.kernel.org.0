Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4277C56969F
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 01:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbiGFXx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 19:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiGFXxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 19:53:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8272D1C8
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 16:53:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E73CA526
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 01:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657151633;
        bh=Ke3peb/v/lNstG9A4j0kkTZaBQ3kP+rTezwNluQA4q8=;
        h=Date:From:To:Subject:From;
        b=eWsgJ+pAVuTij1dNX1oB8n0+BtMYZ3QLp0nrXQ6y07h2sGN0KCHizGL9VdFrr1YlS
         rbgqi8EhV9x7/2g52qdgUo6VpT2GL36/mLpZFcHiFn3cxd16RzZXLBMnyhtJQHh5Cx
         uV1GTY1ZoimqVtv3cIyPXHDKBOx5725tM1FFhS44=
Date:   Thu, 7 Jul 2022 02:53:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] Miscellaneous fixes
Message-ID: <YsYgd6mD34avoIKe@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit d8e8aa866ed8636fd6c1017c3d9453eab2922496:

  media: mediatek: vcodec: Report supported bitrate modes (2022-06-27 09:31:41 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220707

for you to fetch changes up to b630ecbc2cb02ef506daffd7a26d623b63a3de2e:

  media: renesas: rcar_drif: Drop of_match_ptr() (2022-07-07 02:52:09 +0300)

----------------------------------------------------------------
Miscellaneous fixes

----------------------------------------------------------------
Jiang Jian (1):
      media: xilinx: Drop unexpected word 'with' in comments

Laurent Pinchart (1):
      media: renesas: rcar_drif: Drop of_match_ptr()

Marek Vasut (3):
      media: dt-bindings: mt9p031: Add MT9P006 compatible string
      media: mt9p031: Add MT9P006 compatible
      media: mt9p031: Move open subdev op init code into init_cfg

Sebastian Fricke (1):
      media: Fix incorrect P010 chroma order description

 .../bindings/media/i2c/aptina,mt9p031.yaml         |  1 +
 drivers/media/i2c/mt9p031.c                        | 73 +++++++++++-----------
 drivers/media/platform/renesas/rcar_drif.c         |  2 +-
 drivers/media/platform/xilinx/xilinx-vip.h         |  4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  2 +-
 5 files changed, 42 insertions(+), 40 deletions(-)

-- 
Regards,

Laurent Pinchart
