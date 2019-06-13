Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA13843903
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732543AbfFMPLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:11:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732312AbfFMPK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:10:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4EA4F281A15
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/2] RK3288 VP8 decoding support
Date:   Thu, 13 Jun 2019 12:10:38 -0300
Message-Id: <20190613151040.8971-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for Hantro G1 VP8 stateless decoding,
as available on RK3288 SoC.

In order to support VP8 stateless decoding, a new pixel format
is introduced V4L2_PIX_FMT_VP8_FRAME, to be used with a new control
V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR.

The VP8 stateless uAPI was submitted as an RFC. The changes
in this v1 are:

Changes from RFC:
* Verify the various ABIs.
* Move entropy coder state fields to a struct.
* Move key_frame field to the flags.
* Remove unneeded first_part_offset field.
* Add documentation.

The ABI has been verified with Maxime Ripard's tools:

https://gitlab.collabora.com/ezequiel/v4l2-ctrl-abi-check

Pawel Osciak (1):
  media: uapi: Add VP8 stateless decoder API

ZhiChao Yu (1):
  media: hantro: Add support for VP8 decoding on rk3288

 Documentation/media/uapi/v4l/biblio.rst       |  10 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 311 ++++++++++
 .../media/uapi/v4l/pixfmt-compressed.rst      |  20 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |   8 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 drivers/staging/media/hantro/Makefile         |   4 +-
 drivers/staging/media/hantro/hantro.h         |   5 +
 drivers/staging/media/hantro/hantro_drv.c     |   6 +
 .../staging/media/hantro/hantro_g1_vp8_dec.c  | 548 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  17 +
 drivers/staging/media/hantro/hantro_v4l2.c    |   1 +
 drivers/staging/media/hantro/hantro_vp8.c     | 188 ++++++
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  22 +-
 include/media/v4l2-ctrls.h                    |   3 +
 include/media/vp8-ctrls.h                     | 110 ++++
 15 files changed, 1252 insertions(+), 2 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_vp8_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp8.c
 create mode 100644 include/media/vp8-ctrls.h

-- 
2.20.1

