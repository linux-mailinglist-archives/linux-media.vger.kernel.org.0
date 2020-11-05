Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340BD2A8853
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 21:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732090AbgKEUv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 15:51:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52278 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731060AbgKEUv3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 15:51:29 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 15F8D1F4662A
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
Subject: [PATCH v2 0/3] MPEG-2 stateless API cleanup
Date:   Thu,  5 Nov 2020 17:51:15 -0300
Message-Id: <20201105205118.178458-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

Following the H.264 API cleanup, and with all the lessons
learned from it, here's a revisit on the MPEG-2 API.

The biggest changes are:

* Drop slice size and offset parameters, given the API doesn't
  seem to be designed to work per-slice.

* Convert all the 1-bit syntax elements from structure fields
  to bits in a bit field flags field, following the other codec APIs.

* Split the sequence, picture and slice headers to separate controls.

This is build tested only, I haven't yet modified the existing
Ffmpeg-based implementation, as I'd like to have some consensus first.

Reviews and feedback are appreciated!

v2:

* Fixed bad use of boolean negation in a flag, which
  was fortunately reported by 0day bot.

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

