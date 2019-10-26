Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC34E5E3D
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 19:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfJZRrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 13:47:18 -0400
Received: from mailoutvs9.siol.net ([185.57.226.200]:35587 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726210AbfJZRrR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 13:47:17 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 4188952264A;
        Sat, 26 Oct 2019 19:47:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ZeLhTzneJ9c7; Sat, 26 Oct 2019 19:47:14 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id E256A520606;
        Sat, 26 Oct 2019 19:47:13 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id F29C252264A;
        Sat, 26 Oct 2019 19:47:12 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 0/4] media: cedrus: hevc: Add support for scaling matrix and multi-slice frames
Date:   Sat, 26 Oct 2019 19:46:59 +0200
Message-Id: <20191026174703.1120023-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently there is no control for HEVC scaling matrix and segment address
field is also missing. This series adds those and implements support for
them in Cedrus driver.

Following videos were using for testing:
- scaling matrix:
http://jernej.libreelec.tv/videos/h265/slist_test.mp4
- multi-slice:
http://jernej.libreelec.tv/videos/h265/Dredd%20%E2%80%93%20DTS%20Sound%20=
Check%20DTS-HD%20MA%207.1.m2ts

Best regards,
Jernej

Jernej Skrabec (4):
  media: uapi: hevc: Add scaling matrix control
  media: cedrus: hevc: Add support for scaling matrix
  media: uapi: hevc: Add segment address field
  media: cedrus: hevc: Add support for multiple slices

 .../media/uapi/v4l/ext-ctrls-codec.rst        | 46 +++++++++-
 .../media/uapi/v4l/pixfmt-compressed.rst      |  1 +
 drivers/media/v4l2-core/v4l2-ctrls.c          | 10 ++
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 ++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 91 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  2 +
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
 include/media/hevc-ctrls.h                    | 16 +++-
 10 files changed, 170 insertions(+), 7 deletions(-)

--=20
2.23.0

