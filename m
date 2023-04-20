Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48B76E8F9D
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 12:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjDTKN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 06:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbjDTKND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 06:13:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB27526A
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 03:09:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 047725AA;
        Thu, 20 Apr 2023 12:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681985379;
        bh=l52KQS45n+t+wLZkcdR3TajZHaokeesEzbINBmFZvHA=;
        h=From:To:Cc:Subject:Date:From;
        b=UNYvrN3P5al2Fyw30NxbPecc1YotFH0G6YSuLj3pDMLkAgxU1TQngaIz9DlvnpAH4
         lo7SdP1PL42q1H0fTQbBvXmFIyQVTT7MVYvSr6wJWF+mgna71Qpc/cRrZivki/Welu
         ZbmBjy1LTmWgkApIhpPrRG0mQFbX20Ar08EFiVDU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 0/4] media: uvcvideo: Misc cleanups
Date:   Thu, 20 Apr 2023 13:09:54 +0300
Message-Id: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series contains miscellaneous drive-by cleanups for the
uvcvideo driver. There isn't much to tell here, please see individual
patches for details.

Laurent Pinchart (4):
  media: uvcvideo: Rename uvc_streaming 'format' field to 'formats'
  media: uvcvideo: Rename uvc_format 'frame' field to 'frames'
  media: uvcvideo: Constify formats, frames and intervals
  media: uvcvideo: Constify descriptor buffers

 drivers/media/usb/uvc/uvc_driver.c | 46 ++++++++---------
 drivers/media/usb/uvc/uvc_v4l2.c   | 79 +++++++++++++++---------------
 drivers/media/usb/uvc/uvc_video.c  | 20 ++++----
 drivers/media/usb/uvc/uvcvideo.h   | 12 ++---
 4 files changed, 79 insertions(+), 78 deletions(-)

-- 
Regards,

Laurent Pinchart

