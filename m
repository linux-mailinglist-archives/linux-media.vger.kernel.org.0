Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4398F11E3E3
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 13:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfLMMyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 07:54:22 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57108 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfLMMyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 07:54:21 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2EA78294061;
        Fri, 13 Dec 2019 12:54:19 +0000 (GMT)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 0/7] media: rockchip: Add the rkvdec driver
Date:   Fri, 13 Dec 2019 13:54:07 +0100
Message-Id: <20191213125414.90725-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is v3 of the rkvdec driver adding both the core of the driver and
a backend to decode H24 streams.

The most notable change in this version is the addition of generic
helpers to build the reflists, along with Jonas' patch adding new DPB
flags to express the field being referenced by each DPB entry.

Driver-wise, a few things have been reworked/clarified, but most of the
code is unchanged. See the changelog attached to each patch for more
details.

Regards,

Boris

Boris Brezillon (6):
  media: vb2: Add a helper to get the vb2 buffer attached to a request
  media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists
  media: hantro: h264: Use the generic H264 reflist builder
  media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
  media: rkvdec: Add the rkvdec driver
  arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node

Jonas Karlman (1):
  media: uapi: h264: Add DPB entry field reference flags

 .../bindings/media/rockchip,vdec.yaml         |   71 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        |   16 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |   14 +-
 .../media/common/videobuf2/videobuf2-core.c   |   23 +
 drivers/media/v4l2-core/Kconfig               |    4 +
 drivers/media/v4l2-core/Makefile              |    1 +
 drivers/media/v4l2-core/v4l2-h264.c           |  258 ++++
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/hantro/hantro_h264.c    |  237 +---
 drivers/staging/media/rkvdec/Kconfig          |   15 +
 drivers/staging/media/rkvdec/Makefile         |    3 +
 drivers/staging/media/rkvdec/rkvdec-h264.c    | 1154 +++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec-regs.h    |  239 ++++
 drivers/staging/media/rkvdec/rkvdec.c         | 1130 ++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.h         |  124 ++
 include/media/h264-ctrls.h                    |    2 +
 include/media/v4l2-h264.h                     |   86 ++
 include/media/videobuf2-core.h                |   11 +
 19 files changed, 3161 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
 create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
 create mode 100644 drivers/staging/media/rkvdec/Kconfig
 create mode 100644 drivers/staging/media/rkvdec/Makefile
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
 create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
 create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
 create mode 100644 include/media/v4l2-h264.h

-- 
2.23.0

