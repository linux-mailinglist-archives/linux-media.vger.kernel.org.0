Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191FE689338
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 10:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbjBCJOB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 04:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbjBCJOA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 04:14:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEDE8E49E
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 01:13:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1E94890
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 10:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675415638;
        bh=mmVbIJaS7EvvSL7zJ1wEe65azNSsUv8DFvnPPIL8WHo=;
        h=Date:From:To:Subject:From;
        b=c8BGqTHAhOVc/satPvW2gX7yOiIuDMy+niPoCFMwhw6Tqtb26f4+teVQteCdMzLmM
         Kt5bP75qaSpACZHOy9bgC4qdlA1VSw/8kHzU6TbKOAbGdQHnDW788CXFRj0XDsNwPK
         J+etEPqeHALS2j0GJ65sgeThWH76s9PEk8opnKFI=
Date:   Fri, 3 Feb 2023 11:13:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.3] imx-mipi-csis driver cleanups
Message-ID: <Y9zQU7L1/ZPFBBnc@pendragon.ideasonboard.com>
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

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git media-imx-csis-next-20230203

for you to fetch changes up to 16d586dc21663eb72bd799b8f2c9d925075f1877:

  media: imx-mipi-csis: Implement .init_cfg() using .set_fmt() (2023-02-03 11:10:34 +0200)

----------------------------------------------------------------
imx-mipi-csis driver cleanups

----------------------------------------------------------------
Laurent Pinchart (5):
      media: imx-mipi-csis: Rename error labels with 'err_' prefix
      media: imx-mipi-csis: Don't take lock in runtime PM handlers
      media: imx-mipi-csis: Pass format explicitly to internal functions
      media: imx-mipi-csis: Use V4L2 subdev active state
      media: imx-mipi-csis: Implement .init_cfg() using .set_fmt()

 drivers/media/platform/nxp/imx-mipi-csis.c | 249 ++++++++++++-----------------

-- 
Regards,

Laurent Pinchart
