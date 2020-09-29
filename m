Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E0D27DCCC
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 01:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgI2Xjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 19:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgI2Xjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 19:39:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169D6C061755;
        Tue, 29 Sep 2020 16:39:35 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 964BE2909EA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/3] MPEG-2 stateless API cleanup
Date:   Tue, 29 Sep 2020 20:39:06 -0300
Message-Id: <20200929233909.6935-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

Following the H.264 API cleanup, and with all the learning lessons
from it, here's a revisit on the MPEG-2 API.

The biggest changes are:

* Drop slice size and offset parameters, given the API doesn't
  seem to be designed to work per-slice.

* Convert all the 1-bit syntax elements from structure fields
  to bits in a bit field flags field, following the other codec APIs.

* Split the sequence, picture and slice headers to separate controls.

This is build tested only, I haven't yet modified the existing
Ffmpeg-based implementation, as I'd like to have some consensus first.

Reviews and feedback are appreciated!

Thanks,
Ezequiel

Ezequiel Garcia (3):
  media: uapi: mpeg2: Cleanup flags
  media: uapi: mpeg2: Remove unused slice size and offset
  media: uapi: mpeg2: Split sequence and picture parameters

 .../media/v4l/ext-ctrls-codec.rst             | 159 +++++++++++-------
 .../media/v4l/pixfmt-compressed.rst           |   5 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  59 ++++---
 drivers/staging/media/hantro/hantro_drv.c     |  10 ++
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  82 +++++----
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  82 +++++----
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  14 ++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  49 +++---
 include/media/mpeg2-ctrls.h                   | 153 +++++++++++++----
 include/media/v4l2-ctrls.h                    |   4 +
 11 files changed, 395 insertions(+), 224 deletions(-)

-- 
2.27.0

