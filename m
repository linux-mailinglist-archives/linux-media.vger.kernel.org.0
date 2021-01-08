Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34212EF83D
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 20:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbhAHTeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 14:34:31 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59478 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbhAHTea (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 14:34:30 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kxxVu-0004Zr-RB; Fri, 08 Jan 2021 20:33:34 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de
Subject: [RFC PATCH 00/11] rkisp1 support for px30 - including uapi questions for 5.11
Date:   Fri,  8 Jan 2021 20:33:00 +0100
Message-Id: <20210108193311.3423236-1-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As discussed on IRC, here is a series that makes the ISP produce images
on the px30/rk3326.

There is probably a lot of stuff that can be done more cleanly in future
revisions, but the main issues right now is the uapi change in patch 5.

Extending these constants causes the uapi arrays to increase as well.

So this is more base for discussions, especially as we only have the 5.11
rc cycle to decide.

The users of these changes can be found in
  patch 10: add support for v12 isp variants


Heiko Stuebner (11):
  arm64: dts: rockchip: add csi-dphy to px30
  arm64: dts: rockchip: add isp node for px30
  arm64: dts: rockchip: hook up camera on px30-evb
  phy/rockchip: add Innosilicon-based CSI dphy
  media: rockchip: rkisp1: extend uapi array sizes
  media: rockchip: rkisp1: allow separate interrupts
  media: rockchip: rkisp1: carry ip version information
  media: rockchip: rkisp1: make some isp-param functions variable
  media: rockchip: rkisp1: make some isp-stats functions variable
  media: rockchip: rkisp1: add support for v12 isp variants
  media: rockchip: rkisp1: add support for px30 isp version

 arch/arm64/boot/dts/rockchip/px30-evb.dts     |  52 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  56 ++
 .../platform/rockchip/rkisp1/rkisp1-capture.c |   9 +-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  60 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  82 ++-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  29 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 581 ++++++++++++++----
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 404 ++++++++----
 .../platform/rockchip/rkisp1/rkisp1-stats.c   | 122 +++-
 drivers/phy/rockchip/Kconfig                  |   9 +
 drivers/phy/rockchip/Makefile                 |   1 +
 .../phy/rockchip/phy-rockchip-inno-csidphy.c  | 580 +++++++++++++++++
 include/uapi/linux/rkisp1-config.h            |   8 +-
 13 files changed, 1713 insertions(+), 280 deletions(-)
 create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c

-- 
2.29.2

