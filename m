Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C075B29432B
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403927AbgJTTjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:39:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44820 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391747AbgJTTjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:39:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 29CE31F44D9D
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, kernel@collabora.com,
        hverkuil-cisco@xs4all.nl, dafna.hirschfeld@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com,
        eddie.cai.linux@gmail.com, jbx6244@gmail.com,
        zhengsq@rock-chips.com, robin.murphy@arm.com
Subject: [PATCH v6 0/9] move Rockchip ISP bindings out of staging / add ISP DT nodes for RK3399
Date:   Tue, 20 Oct 2020 16:38:41 -0300
Message-Id: <20201020193850.1460644-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the bindings out of drivers/staging and place them in
Documentation/devicetree/bindings instead.

Also, add DT nodes for RK3399 and verify with make ARCH=arm64 dtbs_check
and make ARCH=arm64 dt_binding_check.

Tested by verifying images streamed from Scarlet Chromebook

Changes in v6:
- [PATCH v6 5/9] media: staging: rkisp1: remove unecessary clocks
  Define clocks in the top level, and use if/else schema to define how
  many for each compatible as sugested by Rob Herring on
  https://patchwork.linuxtv.org/project/linux-media/patch/20200722155533.252844-6-helen.koike@collabora.com/#122626
- [PATCH v6 8/9] arm64: dts: rockchip: add isp0 node for rk3399
  Add status = "disabled" in the isp0 node
- Added Reviewed-by tags from Tomasz Figa
- Added Acked-by tags from Rog Herring
- No changes for other patches in the serie.

Changes in v5:
- Drop unit addresses in dt-bindings example for simplification and fix
errors as suggested by Rob Herring in previous version
- Fix typos
- Re-write clock organization with if/then schema

Changes in v4:
- simplify clocks with "isp", "aclk" and "hclk" as suggested by
Robin Murphy on https://patchwork.kernel.org/patch/11475007/

Changes in v3:
- dropped accepted patches
- cleanup clocks
- fix "no reg" error in dt-bindings parent@0 example
- add linux-rockchip list in MAINTAINERS and reorder items
- add Scarlet sensors dt nodes to the series

Changes in v2:
Add patches modifying bindings, as sugested by Johan Jonker in v1,
before moving them out of staging.

Eddie Cai (1):
  arm64: dts: rockchip: add isp and sensors for Scarlet

Helen Koike (7):
  media: staging: dt-bindings: rkisp1: add missing required nodes
  media: staging: dt-bindings: rkisp1: drop i2c unit address
  media: staging: dt-bindings: rkisp1: re-order properties
  media: staging: dt-bindings: rkisp1: drop parent unit address
  media: staging: rkisp1: remove unecessary clocks
  dt-bindings: media: rkisp1: move rockchip-isp1 bindings out of staging
  media: MAINTAINERS: rkisp1: add path to dt-bindings

Shunqian Zheng (1):
  arm64: dts: rockchip: add isp0 node for rk3399

 .../bindings/media/rockchip-isp1.yaml         | 81 ++++++++++++-------
 MAINTAINERS                                   |  2 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi | 74 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      | 26 ++++++
 drivers/staging/media/rkisp1/rkisp1-dev.c     |  8 +-
 5 files changed, 157 insertions(+), 34 deletions(-)
 rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (81%)

-- 
2.28.0

