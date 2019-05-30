Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC5530404
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfE3VPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:15:33 -0400
Received: from mailoutvs35.siol.net ([185.57.226.226]:55309 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726100AbfE3VPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:15:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 77B93522867;
        Thu, 30 May 2019 23:15:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Q4d6PDinGsox; Thu, 30 May 2019 23:15:30 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 23ACA522869;
        Thu, 30 May 2019 23:15:30 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 41B70522867;
        Thu, 30 May 2019 23:15:28 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] media: cedrus: Improvements/cleanup
Date:   Thu, 30 May 2019 23:15:09 +0200
Message-Id: <20190530211516.1891-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here is first batch of random Cedrus improvements/cleanups. Only patch 2
has a change which raises a question about H264 controls.

Changes were tested on H3 SoC using modified ffmpeg and Kodi.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (7):
  media: cedrus: Disable engine after each slice decoding
  media: cedrus: Fix H264 default reference index count
  media: cedrus: Fix decoding for some H264 videos
  media: cedrus: Remove dst_bufs from context
  media: cedrus: Don't set chroma size for scale & rotation
  media: cedrus: Add infra for extra buffers connected to capture
    buffers
  media: cedrus: Improve H264 memory efficiency

 drivers/staging/media/sunxi/cedrus/cedrus.h   |  12 +-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 115 ++++++++----------
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   4 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  25 ++--
 4 files changed, 68 insertions(+), 88 deletions(-)

--=20
2.21.0

