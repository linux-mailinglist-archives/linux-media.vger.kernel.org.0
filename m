Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9DCF761D5E
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 17:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbjGYP13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 11:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbjGYP12 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 11:27:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432F7E42
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 08:27:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A409D558
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 17:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690298787;
        bh=NyEQTdKFKNejMTffgh9a5ZXiArjSE6is5BVRm5cl4LU=;
        h=Date:From:To:Subject:From;
        b=eKgUkF0t/okVJBlpDxF8XHjQbEo0Egqc5zUcrp9sgYH6b7xMAaMePe/i1HHodIPkY
         JRxrncIdE85P7qdPvJrKfauQUcvuLy/XO4ALVoj65B1JnKMi1+B7nQCiYu3nZrYEDj
         N28sAs5zrkbKLydEt8bY/3WdAzEiFfbx1jfVF4Tw=
Date:   Tue, 25 Jul 2023 18:27:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v6.5] uvcvideo fix
Message-ID: <20230725152733.GG21640@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-fixes-uvc-20230725

for you to fetch changes up to e7306d2d20642dbb4013df5b529c804c0f86da06:

  media: uvcvideo: Fix menu count handling for userspace XU mappings (2023-07-25 18:19:26 +0300)

----------------------------------------------------------------
uvcvideo regression fix

----------------------------------------------------------------
Laurent Pinchart (1):
      media: uvcvideo: Fix menu count handling for userspace XU mappings

 drivers/media/usb/uvc/uvc_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
