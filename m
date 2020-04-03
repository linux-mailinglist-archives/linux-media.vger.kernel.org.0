Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E172819E0E5
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 00:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgDCWN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 18:13:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60972 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728636AbgDCWN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 18:13:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A298B293EAE
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v8 0/5] media: rockchip: Add the rkvdec driver
Date:   Fri,  3 Apr 2020 19:13:40 -0300
Message-Id: <20200403221345.16702-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is v8 of Boris' rkvdec driver, to support H264
decoding on Rockchip RK3399 SoCs.

Support for VP9 is planned, but not covered by this
patchset.

I've addressed the feedback from Andriy Gelman and
fixed two warnings reported by the 0-day bot.

While here, this is now rebased on top of Hans'
latest pull requests.

Thanks,
Ezequiel

Boris Brezillon (5):
  media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists
  media: hantro: h264: Use the generic H264 reflist builder
  media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
  media: rkvdec: Add the rkvdec driver
  arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node

 .../bindings/media/rockchip,vdec.yaml         |   73 ++
 MAINTAINERS                                   |    7 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |   14 +-
 drivers/media/v4l2-core/Kconfig               |    4 +
 drivers/media/v4l2-core/Makefile              |    1 +
 drivers/media/v4l2-core/v4l2-h264.c           |  270 ++++
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/hantro/Kconfig          |    1 +
 drivers/staging/media/hantro/hantro_h264.c    |  237 +---
 drivers/staging/media/rkvdec/Kconfig          |   15 +
 drivers/staging/media/rkvdec/Makefile         |    3 +
 drivers/staging/media/rkvdec/TODO             |   11 +
 drivers/staging/media/rkvdec/rkvdec-h264.c    | 1156 +++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec-regs.h    |  223 ++++
 drivers/staging/media/rkvdec/rkvdec.c         | 1103 ++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.h         |  121 ++
 include/media/h264-ctrls.h                    |    8 +-
 include/media/v4l2-h264.h                     |   85 ++
 19 files changed, 3104 insertions(+), 231 deletions(-)
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
2.26.0.rc2

