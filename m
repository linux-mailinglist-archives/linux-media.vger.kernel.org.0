Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90BE077B688
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 12:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbjHNKVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 06:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbjHNKVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 06:21:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E02AF
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 03:21:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDF3C6BE
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 12:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692008417;
        bh=lH6dpyuMWJysoM6Ipqf/axp25S0ciTHnJd53PcLq13k=;
        h=Date:From:To:Subject:From;
        b=U8q4aNkdqU5YZhITIO1sODDBA2VV6cmGsQgnA8gIpHyaYuprkMHCevUFJFnc3RGGw
         XNFpOacJXkMWX0djpBTee4HRcX4+Ad/5PmC4BYBTgMcYlCAojxwmZZ00WfRqN4rzO0
         rAHI28hA2UkWtO33aE5fYfeE2F03CVIzGDRMpW1c=
Date:   Mon, 14 Aug 2023 13:21:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES for v6.6] uvcvideo fix
Message-ID: <20230814102136.GA19907@pendragon.ideasonboard.com>
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

Hi Mauro,

The following changes since commit 2908042a37b56d6a9a595eca946e187e9d2df39a:

  media: imx: imx7-media-csi: Fix applying format constraints (2023-08-09 13:31:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-fixes-uvc-20230814

for you to fetch changes up to beffe281870fe2aad14f68a7766f536566e67ea0:

  media: uvcvideo: Fix OOB read (2023-08-14 13:19:49 +0300)

----------------------------------------------------------------
uvcvideo regression fix

----------------------------------------------------------------
Ricardo Ribalda (1):
      media: uvcvideo: Fix OOB read

 drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
Regards,

Laurent Pinchart
