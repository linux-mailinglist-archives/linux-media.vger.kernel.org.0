Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7212C8D5B
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 19:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbgK3Sxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 13:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387973AbgK3Sxv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 13:53:51 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195F8C0613CF;
        Mon, 30 Nov 2020 10:53:11 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 34F1D1F40F0A
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
Subject: [PATCH v3 0/3] MPEG-2 stateless API cleanup
Date:   Mon, 30 Nov 2020 15:52:56 -0300
Message-Id: <20201130185259.111817-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

Now that H.264 API is finally parked, and with all the lessons
learned from it, here's a revisit to MPEG-2.

The biggest changes are:

* Drop slice size and offset parameters, given the API doesn't
  seem to be designed to work per-slice.

* Convert all the 1-bit syntax elements from structure fields
  to bits in a bit field flags field, following the other codec APIs.

* Split the sequence, picture and slice headers to separate controls.

The series is tested by Jonas on RK3288 (Hantro G1) with FFmpeg + Kodi,
with some fixes that I included here. Thanks a lot Jonas!

v3:
* No API changes, just minor boilerplate fixes for the new
  controls to be properly exposed, initialized and validated.

v2:
* Fixed bad use of boolean negation in a flag, which
  was fortunately reported by 0day bot.

Ezequiel Garcia (3):
  media: uapi: mpeg2: Cleanup flags
  media: uapi: mpeg2: Remove unused slice size and offset
  media: uapi: mpeg2: Split sequence and picture parameters

 .../media/v4l/ext-ctrls-codec.rst             | 159 +++++++++++-------
 .../media/v4l/pixfmt-compressed.rst           |   5 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  71 +++++---
 drivers/staging/media/hantro/hantro_drv.c     |  10 ++
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  82 +++++----
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  82 +++++----
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  14 ++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  49 +++---
 include/media/mpeg2-ctrls.h                   | 153 +++++++++++++----
 include/media/v4l2-ctrls.h                    |   4 +
 11 files changed, 407 insertions(+), 224 deletions(-)

-- 
2.27.0

