Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA3F869994F
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 16:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjBPPzp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 10:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBPPzo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 10:55:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456AE4DE21
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 07:55:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 371F110B
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 16:55:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676562941;
        bh=zIgN6qxftbiEXDDSMx6nX7LQ6S4bgbcc1jd8x6mcu+0=;
        h=Date:From:To:Subject:From;
        b=lP8kxVsgJXr/l/M/AklA3kLZUxJ8DBVitNhir7gpW+uCmJj5oKgyiBnO8XeELrIyN
         w9nVHL8GMUFPCWM93/mWyhdkcAhc2rz1Qiti8oekjvXVMzRoy4xxrBX5LBZZRej+TX
         YRTC0ekqb3fqtOkhpk3Wh4/naaI35lsags2eBiu4=
Date:   Thu, 16 Feb 2023 17:55:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.3] imx-mipi-csis fix
Message-ID: <Y+5R/Jw1v2sAeeSI@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41:

  Merge git://git.linuxtv.org/media_stage into media_tree (2023-02-15 12:40:31 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-fixes-imx-csis-20230216

for you to fetch changes up to 0623c9f6e2451011449baed6321d699deac742f3:

  media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-16 17:43:06 +0200)

This fixes a regression introduced by a commit scheduled for v6.3, hence
the v6.3 target.

----------------------------------------------------------------
imx-mipi-csis crash fix

----------------------------------------------------------------
Marek Vasut (1):
      media: imx-mipi-csis: Check csis_fmt validity before use

 drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
Regards,

Laurent Pinchart
