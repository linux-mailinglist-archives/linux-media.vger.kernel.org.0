Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0677611E78C
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbfLMQEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:04:42 -0500
Received: from mailoutvs11.siol.net ([185.57.226.202]:56530 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727990AbfLMQEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:04:42 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 54CA85228AD;
        Fri, 13 Dec 2019 17:04:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id QYqcThSw1mTk; Fri, 13 Dec 2019 17:04:38 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 0327052454E;
        Fri, 13 Dec 2019 17:04:38 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 0DF0C5228AD;
        Fri, 13 Dec 2019 17:04:35 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] media: cedrus: hevc: Add support for scaling matrix and multi-slice frames
Date:   Fri, 13 Dec 2019 17:04:24 +0100
Message-Id: <20191213160428.54303-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently there is no control for HEVC scaling matrix and segment address
field is also missing. This series adds those and implements support for
them in Cedrus driver.

Following videos were used for testing:
- scaling matrix:
http://jernej.libreelec.tv/videos/h265/slist_test.mp4
- multi-slice:
http://jernej.libreelec.tv/videos/h265/Dredd%20%E2%80%93%20DTS%20Sound%20=
Check%20DTS-HD%20MA%207.1.m2ts

Best regards,
Jernej

Changes from v1:
- always set CTB_ADDR_X and CTB_ADDR_Y (patch 4)

Jernej Skrabec (4):
  media: uapi: hevc: Add scaling matrix control
  media: cedrus: hevc: Add support for scaling matrix
  media: uapi: hevc: Add segment address field
  media: cedrus: hevc: Add support for multiple slices

 .../media/uapi/v4l/ext-ctrls-codec.rst        | 46 ++++++++-
 .../media/uapi/v4l/pixfmt-compressed.rst      |  1 +
 drivers/media/v4l2-core/v4l2-ctrls.c          | 10 ++
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 ++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 96 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  2 +
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
 include/media/hevc-ctrls.h                    | 16 +++-
 10 files changed, 169 insertions(+), 13 deletions(-)

--=20
2.24.0

