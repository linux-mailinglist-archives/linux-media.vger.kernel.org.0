Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A049B2A3399
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 20:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgKBTEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 14:04:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37482 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgKBTEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 14:04:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id E09A11F44E0E
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: [PATCH v5 0/3] media: rkvdec: Add a VP9 backend
Date:   Mon,  2 Nov 2020 21:05:48 +0200
Message-Id: <20201102190551.1223389-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear all,

This is v5 of the series adding VP9 profile 0 decoding to rkvdec.

All feedback from v4 should be addressed, there's just one thing I did
not address: ref_frame_sign_biases in the uAPI. The userspace tool I'm
using [1] apparently doesn't need it or the default hwreg value for it
is capable of decoding the bitstreams I used on the driver, so I don't
really have a use-case to change and test that. :)

Considering the uAPI is a work in progress and expected to be modified,
ref_frame_sign_biases can be added later with others which might be
required to enable more functionality (for eg profiles >= 1).

Series tested on rk3399 and applies on next-20201030.

[1] https://github.com/Kwiboo/FFmpeg/tree/v4l2-request-hwaccel-4.2.2-rkvdec

Changelog
---------

v5:

* Drop unnecessary OUTPUT buffer payload set in .buf_prepare.
* Drop obsolete .per_request ctrl flag
* Added new vp9 ctrls to v4l2_ctrl_ptr
* Fix pahole detected padding issues
* Send userspace an error if it tries to reconfigure decode resolution
  as v4l2 or rkvdec-vp9 backend do not support dynamic res changes yet
* Allow frame ctx probability tables to be non-mandatory so users can
  set them directly during frame decoding in cases where no defaults
  have been set previously (eg. ffmpeg vp9 backend)
* Some comments and documentation clarifications
* Minor checkpatch fixes

v4:

* Drop color_space field from the VP9 interface.
  V4L2 API should be used for it.
* Clarified Segment-ID comments.
* Moved motion vector probabilities to a separate
  struct.

v3:

* Fix documentation issues found by Hans.
* Fix smatch detected issues as pointed out by Hans.
* Added patch to fix wrong bytesused set on .buf_prepare.

v2:

* Documentation style issues pointed out by Nicolas internally.
* s/VP9_PROFILE_MAX/V4L2_VP9_PROFILE_MAX/
* Fix wrong kfree(ctx).
* constify a couple structs on rkvdec-vp9.c


Boris Brezillon (2):
  media: uapi: Add VP9 stateless decoder controls
  media: rkvdec: Add the VP9 backend

Ezequiel Garcia (1):
  media: rkvdec: Fix .buf_prepare

 .../userspace-api/media/v4l/biblio.rst        |   10 +
 .../media/v4l/ext-ctrls-codec.rst             |  550 ++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  239 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/staging/media/rkvdec/Makefile         |    2 +-
 drivers/staging/media/rkvdec/rkvdec-vp9.c     | 1577 +++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.c         |   72 +-
 drivers/staging/media/rkvdec/rkvdec.h         |    6 +
 include/media/v4l2-ctrls.h                    |    5 +
 include/media/vp9-ctrls.h                     |  486 +++++
 10 files changed, 2942 insertions(+), 6 deletions(-)
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
 create mode 100644 include/media/vp9-ctrls.h

-- 
2.29.0

