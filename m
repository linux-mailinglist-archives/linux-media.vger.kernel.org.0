Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566D26F8FBC
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 09:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjEFHOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 03:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjEFHOY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 03:14:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70CF4ED3
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 00:14:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16AD92D8;
        Sat,  6 May 2023 09:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683357252;
        bh=eEL1TNvj2L162Y2AMTHt5n831PEIC3LmbTODtSbQeow=;
        h=From:To:Cc:Subject:Date:From;
        b=jHs4x7rdzBr1DpOQUcpaNCCdBGvKbEY8162WV6mBVFDCLuCiNtLZAwy3YNby88Z3A
         o/TRhlLGIIEHqRGuvFxseFxOqkMmomqSik3rItiO0w5/HSJgWZlZjXNdsh9MZd8k0t
         3EHyHJlupIghvHJtGQbBVhzYG/dfshK8rtq1E8J8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/7] media: uvcvideo: Misc cleanups
Date:   Sat,  6 May 2023 10:14:20 +0300
Message-Id: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series contains miscellaneous drive-by cleanups for the
uvcvideo driver. There isn't much to tell here, please see individual
patches for details.

Laurent Pinchart (7):
  media: uvcvideo: Rename uvc_streaming 'format' field to 'formats'
  media: uvcvideo: Rename uvc_format 'frame' field to 'frames'
  media: uvcvideo: Use clamp() to replace manual implementation
  media: uvcvideo: Reorganize format descriptor parsing
  media: uvcvideo: Increment intervals pointer at end of parsing
  media: uvcvideo: Constify formats, frames and intervals
  media: uvcvideo: Constify descriptor buffers

 drivers/media/usb/uvc/uvc_driver.c | 76 ++++++++++++++++------------
 drivers/media/usb/uvc/uvc_v4l2.c   | 79 +++++++++++++++---------------
 drivers/media/usb/uvc/uvc_video.c  | 20 ++++----
 drivers/media/usb/uvc/uvcvideo.h   | 12 ++---
 4 files changed, 101 insertions(+), 86 deletions(-)


base-commit: 423f331364bfbcd1212b78ac9052894ff5213ac9
prerequisite-patch-id: 742f7d139e5ba686a5487b0133ba6587b5b421dc
-- 
Regards,

Laurent Pinchart

