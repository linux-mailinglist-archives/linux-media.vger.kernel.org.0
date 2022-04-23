Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E0750CDF4
	for <lists+linux-media@lfdr.de>; Sun, 24 Apr 2022 00:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbiDWWn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 18:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiDWWnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 18:43:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09EA064727
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 15:40:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2E562F2;
        Sun, 24 Apr 2022 00:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650753624;
        bh=5WdSVrKCmtct9dOpUrSuRw05CbOPHqYvs/zMn7RgtjU=;
        h=Date:From:To:Cc:Subject:From;
        b=Y7MfdvTmXSJVyxKTymAgPFOXSKhKl52WbYZSNnZD505nKsj8irJhz9jbFUP3OXmXb
         xbxbK/7RIEt9k5ePQSgifaYJiNJOx6WPcTouijlzecNNTj3DR+CtdacRSaNcm13jxY
         CtVKOmiOaQPnNr4oR5GNugREUcKi+kBxulJZGOHE=
Date:   Sun, 24 Apr 2022 01:40:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [GIT PULL FOR v5.19 - v2] imx-mipi-csis improvements
Message-ID: <YmSAVwRCVxVkVq3K@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 3d59142ad94cf60b94b3dc94c19fdafa23aec8b1:

  media: dvb-usb: dib0700_devices: use an enum for the device number (2022-04-18 07:36:44 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220424

for you to fetch changes up to 680ba74879af21da34bd228c229933c4563d4834:

  media: platform: imx-mipi-csis: Remove unneeded 'default n' (2022-04-24 00:33:01 +0300)

----------------------------------------------------------------
imx-mipi-csis driver improvements

----------------------------------------------------------------
Fabio Estevam (1):
      media: platform: imx-mipi-csis: Remove unneeded 'default n'

Jacopo Mondi (3):
      media: imx: imx-mipi-csis: Simplify mipi_csis_s_stream()
      media: imx: imx-mipi-csis: Drop powered flag
      media: imx: imx-mipi-csis: Protect mipi_csis_dump_regs()

Laurent Pinchart (6):
      media: imx: imx-mipi-csis: Rename csi_state to mipi_csis_device
      media: imx: imx-mipi-csis: Don't use .s_power()
      media: imx: imx-mipi-csis: Drop unneeded system PM implementation
      media: imx: imx-mipi-csis: Don't stop streaming at runtime suspend time
      media: imx: imx-mipi-csis: Simplify runtime PM implementation
      media: imx: imx-mipi-csis: Fix active format initialization on source pad

 drivers/media/platform/nxp/Kconfig         |   1 -
 drivers/media/platform/nxp/imx-mipi-csis.c | 677 +++++++++++++----------------
 2 files changed, 313 insertions(+), 365 deletions(-)

-- 
Regards,

Laurent Pinchart
