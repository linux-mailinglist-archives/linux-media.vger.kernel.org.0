Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B0E7A2AAC
	for <lists+linux-media@lfdr.de>; Sat, 16 Sep 2023 00:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238292AbjIOWop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 18:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238161AbjIOWoM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 18:44:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B9F101
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 15:44:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F18F110FE
        for <linux-media@vger.kernel.org>; Sat, 16 Sep 2023 00:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694817752;
        bh=d9xCtJ7/ZedulLlvoo3Zhhu/17QQ7XOmWJtV3oASuao=;
        h=Date:From:To:Subject:From;
        b=mBA6Xwp52LiFl5Hg2DxHmKn5HnJyvtu8yo6KQKZ2trbpT+yKprheS6u+Tl3/abdw5
         fDt66uZPUp766w++UWpxehIyL8rQjaKY19FAq4GI2nNhI2IUInKhObe5ObKRVuvdNd
         S2V4AqC/hCVJOdHgYKCTXKxQDvd4NKsAv4kBW3BA=
Date:   Sat, 16 Sep 2023 01:44:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v6.6] imx-mipi-csis regression fix
Message-ID: <20230915224419.GA31632@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

The following changes since commit 735de5caf79e06cc9fb96b1b4f4974674ae3e917:

  media: vb2: frame_vector.c: replace WARN_ONCE with a comment (2023-09-14 23:31:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-fixes-imx-20230916

for you to fetch changes up to efc6a9c89d9234cd674dacf5afd633e8ad00e2c8:

  media: imx-mipi-csis: Remove an incorrect fwnode_handle_put() call (2023-09-15 21:54:04 +0300)

----------------------------------------------------------------
Regression fix for the imx-mipi-csis driver

----------------------------------------------------------------
Christophe JAILLET (1):
      media: imx-mipi-csis: Remove an incorrect fwnode_handle_put() call

 drivers/media/platform/nxp/imx-mipi-csis.c | 2 --
 1 file changed, 2 deletions(-)

-- 
Regards,

Laurent Pinchart
