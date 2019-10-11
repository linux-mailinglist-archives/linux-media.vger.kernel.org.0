Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760FDD3C6D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbfJKJds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:33:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32912 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbfJKJds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:33:48 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 18E3F290D69;
        Fri, 11 Oct 2019 10:33:46 +0100 (BST)
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
Subject: [RESEND PATCH v2 0/4] media: rockchip: Add the rkvdec driver
Date:   Fri, 11 Oct 2019 11:33:38 +0200
Message-Id: <20191011093342.3471-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Sorry for the noise, I forgot to Cc the DT maintainers/ML on my last
attempt.

This is v2 of the rkvdec driver which was initially posted as part of
my RFC adding codec helpers.
For this version, I decided to get rid of the helper stuff which is
likely to take some more time to settle. The patchset now contains a
proper DT binding doc.

Note that this implementation is likely to be adjusted based on the
outcome of the 'scaling matrix order' [1] and 'dynamic resolution
changes' [2] discussions, but I thought it'd be worth posting this
version to start getting feeback.

Regards,

Boris

[1]https://patchwork.kernel.org/cover/11125207/
[2]https://lkml.org/lkml/2019/9/3/1033

Boris Brezillon (4):
  media: vb2: Add a helper to get the vb2 buffer attached to a request
  media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
  media: rockchip: Add the rkvdec driver
  arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node

 .../bindings/media/rockchip,vdec.yaml         |   71 ++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |   14 +-
 .../media/common/videobuf2/videobuf2-core.c   |   23 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/rockchip/Kconfig        |   16 +
 drivers/staging/media/rockchip/Makefile       |    2 +
 drivers/staging/media/rockchip/vdec/Kconfig   |   14 +
 drivers/staging/media/rockchip/vdec/Makefile  |    3 +
 .../staging/media/rockchip/vdec/rkvdec-h264.c |  960 +++++++++++++++
 .../staging/media/rockchip/vdec/rkvdec-regs.h |  306 +++++
 drivers/staging/media/rockchip/vdec/rkvdec.c  | 1089 +++++++++++++++++
 drivers/staging/media/rockchip/vdec/rkvdec.h  |  131 ++
 include/media/videobuf2-core.h                |   11 +
 14 files changed, 2642 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
 create mode 100644 drivers/staging/media/rockchip/Kconfig
 create mode 100644 drivers/staging/media/rockchip/Makefile
 create mode 100644 drivers/staging/media/rockchip/vdec/Kconfig
 create mode 100644 drivers/staging/media/rockchip/vdec/Makefile
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-h264.c
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-regs.h
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.c
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.h

-- 
2.21.0

