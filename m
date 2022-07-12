Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C841570EC7
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 02:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbiGLARI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 20:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiGLAQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 20:16:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58993CBF3
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 17:15:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BDAD739
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 02:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657584931;
        bh=hxaung+gygdjLjDBS72L7gtntiQCzI5UqdhPPUkcNl0=;
        h=Date:From:To:Subject:From;
        b=SSsM2rLP7caWEksORDMxyK1xcCPc5yEbO7GYagZ0l130nlWOERkqVf0d/6K+0ERaS
         F2NqOyaiYahjG2rnv9M1dIH3uuB0LAD4Wk2hmP/3Hh2BlzBAaly1yM210ecUIkgony
         B7GCmCLf0osh//fd9CkXhH94SPqzlsmmngXBqNqs=
Date:   Tue, 12 Jul 2022 03:15:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] New pixel formats and colorspace improvements
Message-ID: <Ysy9CA0OHfW7h/p1@pendragon.ideasonboard.com>
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

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220712

for you to fetch changes up to 47a166d60cdaca08f91f258bddc9a2e8ff4d785f:

  media: v4l2: Sanitize colorspace values in the framework (2022-07-12 03:12:31 +0300)

----------------------------------------------------------------
- Add new YUVA and YUVX pixel formats
- Improve colorspace sanity checks

----------------------------------------------------------------
Laurent Pinchart (5):
      media: v4l: Add packed YUV 4:4:4 YUVA and YUVX pixel formats
      media: v4l2-tpg: Add support for the new YUVA and YUVX formats
      media: vivid: Add support for the new YUVA and YUVX formats
      media: v4l2: Make colorspace validity checks more future-proof
      media: v4l2: Sanitize colorspace values in the framework

 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  | 20 +++++++
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c      |  6 ++
 .../media/test-drivers/vivid/vivid-vid-common.c    | 15 +++++
 drivers/media/v4l2-core/v4l2-ioctl.c               | 67 ++++++++++++++++++----
 include/media/v4l2-common.h                        |  6 +-
 include/uapi/linux/videodev2.h                     | 24 ++++++++
 6 files changed, 125 insertions(+), 13 deletions(-)

-- 
Regards,

Laurent Pinchart
