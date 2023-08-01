Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E5D76C00E
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 00:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjHAWF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 18:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjHAWF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 18:05:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44EE19B7
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 15:05:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82D45475
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 00:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690927492;
        bh=3CAwLDccrv6hxJTCHoLEe7DQ2eBqRwC14eot5CA5aEU=;
        h=Date:From:To:Subject:From;
        b=Ar5IBS39xEFBjMS7CAiuzUfmj1vrSOvn/IFyFikAcpo1Ag4GSdqkHoj+ab191mrgm
         af/mbIowPjyfd5k87KB/+FPXhB9rbcf2Wpg7QLh8k9a1P7eLv4h20oHkU8HOMjUx2e
         T7B0ZQcQNp5Ahshk9d48yJWmwwL57ChXPxcUItf4=
Date:   Wed, 2 Aug 2023 01:06:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v6.5] imx7-media-csi regression fix
Message-ID: <20230801220601.GA31500@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:

  Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-fixes-imx-20230802

for you to fetch changes up to 42a3d947625f8a6d88ce66d52960255d7ff23d49:

  media: imx: imx7-media-csi: Fix applying format constraints (2023-08-02 01:02:58 +0300)

----------------------------------------------------------------
Regression fix for the imx7-media-csi driver

----------------------------------------------------------------
Fabio Estevam (1):
      media: imx: imx7-media-csi: Fix applying format constraints

 drivers/media/platform/nxp/imx7-media-csi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart
