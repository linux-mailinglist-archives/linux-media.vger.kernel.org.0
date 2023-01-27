Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C75B67DC3D
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjA0C1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjA0C1W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:27:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E72A4109B
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:27:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB5E92B3;
        Fri, 27 Jan 2023 03:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674786439;
        bh=rq+t+6DBuGoSMtPyuYHYQ60hH/pYTh61pEUedK1Awyw=;
        h=From:To:Cc:Subject:Date:From;
        b=dIMAcP405p00m4STLd4Kr3Dgryzwa2/EWn1Mc9Q1u1vV5qvoL9nu2B7yTml8KOplT
         u2A50I8CHtvp+7lfqrIHyqRn2hm3EpVz2essrkR4L+YGZ4zBmss6VShyM63iSDaWnJ
         qAhGNCFgxi5ocVlk8pVoIh6XRgMTuHgFJDtd6AMk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 0/6] media: nxp: imx7-media-csi: Move to subdev active state
Date:   Fri, 27 Jan 2023 04:27:09 +0200
Message-Id: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
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
active state. Patches 1/6 to 5/6 are small preparatory cleanups, with
the main change in 6/6.

I haven't tested the series yet as I need to dig up the hardware first.
Adam, you offered to test the similar imx-mipi-csis series I've sent
recently on the i.MX8MM, would you be able to test this one at the same
time ?

Laurent Pinchart (6):
  media: imx: imx7-media-csi: Drop imx7_csi.cc field
  media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
  media: imx: imx7-media-csi: Drop unneeded check when starting
    streaming
  media: imx: imx7-media-csi: Drop unneeded src_sd check
  media: imx: imx7-media-csi: Drop unneeded pad checks
  media: imx: imx7-media-csi: Use V4L2 subdev active state

 drivers/media/platform/nxp/imx7-media-csi.c | 208 ++++++--------------
 1 file changed, 58 insertions(+), 150 deletions(-)


base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
-- 
Regards,

Laurent Pinchart

