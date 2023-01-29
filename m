Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBD867FC5C
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 03:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjA2Cej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 21:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjA2Ceh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 21:34:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C05B22DFF
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 18:34:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64B58327;
        Sun, 29 Jan 2023 03:34:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674959673;
        bh=wNTeEFwykBz4JCEyDwD2Ct1FoTDowYdFZ8hV99++NRU=;
        h=From:To:Cc:Subject:Date:From;
        b=liIJS6U6CI+ZidH0Y+FC/duoOOiryMY4r6v/99fD7L+xuLbtqjtRUgcw7FO1y6HYg
         sYD9wWrSnt8CBKdth0RxK/VajX1HPx4IK0kBL5+FRpJ9fDwwAr8+V0Q6kh0VnsBaYi
         rRQU1WBJrdC//HtxbSvfs1L43z7jHwQ4+0diHqvY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 0/8] media: nxp: imx7-media-csi: Move to subdev active state
Date:   Sun, 29 Jan 2023 04:34:21 +0200
Message-Id: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
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

Hello,

This small series moves the imx7-mipi-csi driver to use the subdev
active state. Patches 1/8 to 7/8 are small preparatory cleanups, with
the main change in 8/8.

Compared to v1, I've now successfully tested the series on an i.MX8MM.
The issues reported by Adam have been resolved by adding patch 7/8 and
fixing a problem in 8/8.

Laurent Pinchart (8):
  media: imx: imx7-media-csi: Drop imx7_csi.cc field
  media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
  media: imx: imx7-media-csi: Drop unneeded check when starting
    streaming
  media: imx: imx7-media-csi: Drop unneeded src_sd check
  media: imx: imx7-media-csi: Drop unneeded pad checks
  media: imx: imx7-media-csi: Cleanup errors in
    imx7_csi_async_register()
  media: imx: imx7-media-csi: Zero format struct before calling
    .get_fmt()
  media: imx: imx7-media-csi: Use V4L2 subdev active state

 drivers/media/platform/nxp/imx7-media-csi.c | 235 ++++++--------------
 1 file changed, 70 insertions(+), 165 deletions(-)

-- 
Regards,

Laurent Pinchart

