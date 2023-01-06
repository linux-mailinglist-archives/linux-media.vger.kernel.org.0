Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44AA9660153
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 14:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbjAFNdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 08:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235180AbjAFNdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 08:33:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121C677D07
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 05:32:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 871C24AE;
        Fri,  6 Jan 2023 14:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673011952;
        bh=tnZqbhIGqgf9PhRX7U7nxtMWujXNJHrlsGxKhBOVRvQ=;
        h=From:To:Cc:Subject:Date:From;
        b=tog+9Zeu1g8+EuLCtCEKBD7SZf1A8pQTeD7A4wios6i2J46pvBvaWnD26Tg3M1RIA
         qJHKA6wvP42Z0wkr0qlYWSgmGrUZ+81YRB7bWEMIIenae/gnDjaw390Ud8BJCMiQ5B
         wFadLQfXrGLlx2hmQuQvPnSmvy3kskCh2qk+MUXc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 0/6] media: imx-pxp: Miscellaneous enhancements
Date:   Fri,  6 Jan 2023 15:32:21 +0200
Message-Id: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
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
imx-pxp driver [1]. Michael, I can rebase this on top of your v2, or
feel free to take the patches in your tree already and include them in
v2 if you prefer.

[1] https://lore.kernel.org/linux-media/20230105134729.59542-1-m.tretter@pengutronix.de

Laurent Pinchart (6):
  media: imx-pxp: Sort headers alphabetically
  media: imx-pxp: Add media controller support
  media: imx-pxp: Pass pixel format value to find_format()
  media: imx-pxp: Implement frame size enumeration
  media: imx-pxp: Introduce pxp_read() and pxp_write() wrappers
  media: imx-pxp: Use non-threaded IRQ

 drivers/media/platform/nxp/imx-pxp.c | 203 ++++++++++++++++++---------
 1 file changed, 136 insertions(+), 67 deletions(-)

-- 
Regards,

Laurent Pinchart

