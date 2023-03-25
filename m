Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0F716C9099
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 20:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCYT7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 15:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCYT7n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 15:59:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CE4BF
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 12:59:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B86A89F
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 20:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679774380;
        bh=0EWNRg3kdGX/QEBgsdDkU2m8pThV40vUGGQ8TwHkQz8=;
        h=Date:From:To:Subject:From;
        b=exO+N3a2xuJIl5k7Ceqx59svcsI87w2PyABTvPQyj3r35TvSecIm0uc/N2dNDzbqa
         JNTJ5FDeQ6acxWA38F821Z4EInMSZw6BOB1myJ8MIbL4N0g8PjB2dRUvAJggeMnoBI
         hBS0NfN6q1QzV2knAF66u/1EsG6Ku0GlvSsCIEso=
Date:   Sat, 25 Mar 2023 21:59:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4] Miscellaneous rkisp1 changes
Message-ID: <20230325195946.GF9876@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-rkisp1-next-20230325

for you to fetch changes up to 82472ddf4dab7dbb928aeda104c3275b22045482:

  media: rkisp1: Implement ENUM_FRAMESIZES (2023-03-25 21:17:25 +0200)

----------------------------------------------------------------
media: rkisp1: Miscellaneous improvements

----------------------------------------------------------------
Paul Elder (2):
      media: rkisp1: Add NV16M and NV61M to output formats
      media: rkisp1: Implement ENUM_FRAMESIZES

 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

-- 
Regards,

Laurent Pinchart
