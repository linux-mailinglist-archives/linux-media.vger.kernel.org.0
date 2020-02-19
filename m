Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C177164C16
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 18:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgBSRiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 12:38:03 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37578 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgBSRiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 12:38:02 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id DEC5628DC70
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 0/6] media: rockchip: Add the rkvdec driver
Date:   Wed, 19 Feb 2020 14:37:44 -0300
Message-Id: <20200219173750.26453-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is v5 of Boris' rkvdec driver.

This version corrects wrong copyright notices and then adds
a TODO file for the staging driver. The only reason to keep the
driver in staging are the staging uAPI controls.

Thanks,
Ezequiel

Boris Brezillon (5):
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
 drivers/media/v4l2-core/Kconfig               |    4 +
 drivers/media/v4l2-core/Makefile              |    1 +
 drivers/media/v4l2-core/v4l2-h264.c           |  258 ++++
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/hantro/Kconfig          |    1 +
 drivers/staging/media/hantro/hantro_h264.c    |  237 +---
 drivers/staging/media/rkvdec/Kconfig          |   15 +
 drivers/staging/media/rkvdec/Makefile         |    3 +
 drivers/staging/media/rkvdec/TODO             |   11 +
 drivers/staging/media/rkvdec/rkvdec-h264.c    | 1154 +++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec-regs.h    |  223 ++++
 drivers/staging/media/rkvdec/rkvdec.c         | 1134 ++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.h         |  123 ++
 include/media/h264-ctrls.h                    |    2 +
 include/media/v4l2-h264.h                     |   86 ++
 19 files changed, 3126 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
 create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
 create mode 100644 drivers/staging/media/rkvdec/Kconfig
 create mode 100644 drivers/staging/media/rkvdec/Makefile
 create mode 100644 drivers/staging/media/rkvdec/TODO
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
 create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
 create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
 create mode 100644 include/media/v4l2-h264.h

-- 
2.25.0
