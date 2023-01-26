Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 703D567D7C9
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 22:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjAZVey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 16:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjAZVet (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 16:34:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1223C13E
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 13:34:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 102F82B3;
        Thu, 26 Jan 2023 22:34:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674768885;
        bh=OXWU70KV030ZPfn4OJGBNCQ1XtpB75Qa3AG0FCamb04=;
        h=From:To:Cc:Subject:Date:From;
        b=LDJGYrR5bOHLriB2rFQxiUadhf42p0MOvcgjKO5Z87Xje+oaAAqAwWFZ5YlBbQH6s
         icLpe9+vbCZQedOv78xWASTyCZLBP0UMKrPw8VUBReRzU4ZvMPJMUSau9AJcp8Ivx6
         D1cyTghsWLhxZan04RohrmS7uMNnWyy2mvYZYIpY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 0/5] media: imx-mipi-csis: Move to subdev active state
Date:   Thu, 26 Jan 2023 23:34:32 +0200
Message-Id: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
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

This small series moves the imx-mipi-csis driver to use the subdev
active state. Patches 1/5 to 3/5 are small preparatory cleanups, with
the main change in 4/5. Patch 5/5 is further cleanup that could have
been included in 4/5, but that should be easier to review as a separate
patch.

The series has been tested on the i.MX8MP with the ISI, and IMX296 and
IMX327 camera sensors.

Laurent Pinchart (5):
  media: imx-mipi-csis: Rename error labels with 'err_' prefix
  media: imx-mipi-csis: Don't take lock in runtime PM handlers
  media: imx-mipi-csis: Pass format explicitly to internal functions
  media: imx-mipi-csis: Use V4L2 subdev active state
  media: imx-mipi-csis: Implement .init_cfg() using .set_fmt()

 drivers/media/platform/nxp/imx-mipi-csis.c | 249 +++++++++------------
 1 file changed, 103 insertions(+), 146 deletions(-)

-- 
Regards,

Laurent Pinchart

