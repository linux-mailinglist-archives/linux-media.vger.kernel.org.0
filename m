Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E54667D4B
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 19:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjALSDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 13:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240081AbjALSCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 13:02:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF7F551DC
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 09:25:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C9E9491;
        Thu, 12 Jan 2023 18:25:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673544307;
        bh=FNWZHk/W7LMcm1VUidSwRkpn679IW9F6kug+YlcyAMQ=;
        h=From:To:Cc:Subject:Date:From;
        b=N3E0pQw7LpGm++aWrro+GfsdR3Ki0v8VRYzyxZLA0rCZIa8pw07r3BxqrtVTNILxN
         MSaCr4XKeFDnCtseWpOKYw0nQvu30U38ZSi/+pH4J5fdN28vRams+tc6YHwQSfCn5m
         ZzbAxHI0PTYCcEn5IjSY5M198CzPnEnZ66v8pmSA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 0/7] media: imx-pxp: Miscellaneous enhancements
Date:   Thu, 12 Jan 2023 19:25:00 +0200
Message-Id: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
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

This patch series brings miscellaneous enhancements to the imx-pxp
driver that I have kept in my tree for a too long time. As it's a
collection of miscellanous changes, please see individual patches for
details.

The patches are based on top of Michael's recent i.MX7D support for the
imx-pxp driver [1]. Michael, feel free to take the patches in your tree
and include them in the v2 of your series.

[1] https://lore.kernel.org/linux-media/20230105134729.59542-1-m.tretter@pengutronix.de

Laurent Pinchart (7):
  media: imx-pxp: Sort headers alphabetically
  media: imx-pxp: Don't set bus_info manually in .querycap()
  media: imx-pxp: Add media controller support
  media: imx-pxp: Pass pixel format value to find_format()
  media: imx-pxp: Implement frame size enumeration
  media: imx-pxp: Introduce pxp_read() and pxp_write() wrappers
  media: imx-pxp: Use non-threaded IRQ

 drivers/media/platform/nxp/imx-pxp.c | 203 ++++++++++++++++++---------
 1 file changed, 134 insertions(+), 69 deletions(-)

-- 
Regards,

Laurent Pinchart

