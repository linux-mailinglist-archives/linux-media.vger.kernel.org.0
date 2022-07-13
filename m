Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B43B7573C58
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 20:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbiGMSId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 14:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiGMSIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 14:08:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE7028E1C
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 11:08:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22AB0305
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 20:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657735708;
        bh=Jw50QYMk0xF0ASSGHShsAFP80RX77NUEb5nb61DkRCo=;
        h=Date:From:To:Subject:From;
        b=gBDPd7o0/qUlugZkmxlTQl1TfZIaMtmN3G7gI3YjoxZbtPCy2nLc1q+eExMWqlcV9
         Sy74lIydAWM0yCU/lOdzbeef3BZZRcLXXmvzBV5jpYyBaaJtN3prDfV160h7orJeA+
         s68l1M+jJf62GDtD3mfwO/t/0iyHJvdJvbjwwHmI=
Date:   Wed, 13 Jul 2022 21:07:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] i.MX8MP support in imx-mipi-csis driver
Message-ID: <Ys8J/uAkhzoJk6/O@pendragon.ideasonboard.com>
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

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220713-2

for you to fetch changes up to 640ceab8c2cae96d65e42d8e4a880afe27db0c2a:

  dt-bindings: media: nxp,imx-mipi-csi2: i.MX8MP support (2022-07-13 21:01:10 +0300)

----------------------------------------------------------------
- i.MX8MP support in imx-mipi-csis driver

----------------------------------------------------------------
Laurent Pinchart (4):
      media: imx: imx-mipi-csis: Set the subdev fwnode for endpoint matching
      media: imx: imx-mipi-csis: Add version register
      media: imx: imx-mipi-csis: Implement the .get_frame_desc() operation
      dt-bindings: media: nxp,imx-mipi-csi2: i.MX8MP support

 .../bindings/media/nxp,imx-mipi-csi2.yaml          | 11 ++++--
 drivers/media/platform/nxp/imx-mipi-csis.c         | 41 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 3 deletions(-)

-- 
Regards,

Laurent Pinchart
