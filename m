Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B453C65DD
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 00:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhGLWFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 18:05:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58032 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhGLWFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 18:05:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A4B7A1F42406
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alex Bee <knaerzche@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 0/3] media: visiting YUV tiled formats
Date:   Mon, 12 Jul 2021 19:01:58 -0300
Message-Id: <20210712220201.31787-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A small set cleaning and unifying the way we handle YUV tiled formats,
which are found on decoders.

Ezequiel Garcia (3):
  media: Rename V4L2_PIX_FMT_SUNXI_TILED_NV12 to V4L2_PIX_FMT_NV12_32L32
  media: Group tiled NV12 pixel formats
  media: Add NV12_4L4 tiled format

 .../media/v4l/pixfmt-reserved.rst             | 14 --------------
 .../media/v4l/pixfmt-yuv-planar.rst           | 19 ++++++++++++++++---
 drivers/media/v4l2-core/v4l2-common.c         |  3 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  4 ++--
 include/uapi/linux/videodev2.h                | 14 +++++++++++---
 8 files changed, 35 insertions(+), 25 deletions(-)

-- 
2.32.0

