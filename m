Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86F54D62AD
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349001AbiCKN5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239616AbiCKN5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:57:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B176D1C4B20
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:55:57 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCDE3482;
        Fri, 11 Mar 2022 14:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647006955;
        bh=B5/HHeeFTDJQ9dEfweI2cH914ywTMpL1U6y1itnmfrg=;
        h=From:To:Cc:Subject:Date:From;
        b=RGUfA6mHbu89+VJYB8AsRrZQMYJ7Z8mUI83Oz6NAQkta/8oVGdKqZeZpNK3Io/qsI
         ln3d/k2IxtTGoGKQQhWN+zlijFFxs7pcwBBtILruXSEui9tEL3uApB75wgTD0fB3/f
         m5W1NqSkM0Jf7d/pxkR5UV+qORku+Bc5uNzSqKqM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 0/4] media: imx: imx-mipi-csis: Simplify PM support
Date:   Fri, 11 Mar 2022 15:55:31 +0200
Message-Id: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series results from work on suspend/resume support in
the (in progress) ISI driver. It drops unneeded code in the
imx-mipi-csis related to system suspend/resume, allowing a
simplification of the runtime PM handlers.

Laurent Pinchart (4):
  media: imx: imx-mipi-csis: Don't use .s_power()
  media: imx: imx-mipi-csis: Drop unneeded system PM implementation
  media: imx: imx-mipi-csis: Don't stop streaming at runtime suspend
    time
  media: imx: imx-mipi-csis: Simplify runtime PM implementation

 drivers/media/platform/imx/imx-mipi-csis.c | 138 +++++++--------------
 1 file changed, 44 insertions(+), 94 deletions(-)

-- 
Regards,

Laurent Pinchart

