Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FCA212A6A
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 18:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgGBQyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 12:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgGBQyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 12:54:25 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F0BC08C5C1;
        Thu,  2 Jul 2020 09:54:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 825BC2A5FA0
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com,
        tfiga@chromium.org, eddie.cai.linux@gmail.com,
        zhengsq@rock-chips.com
Subject: [PATCH v3 0/9] move Rockchip ISP bindings out of staging / add
Date:   Thu,  2 Jul 2020 13:54:01 -0300
Message-Id: <20200702165410.2583375-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the bindings out of drivers/staging and place them in
Documentation/devicetree/bindings instead.

Also, add DT nodes for RK3399 and verify with make ARCH=arm64 dtbs_check
and make ARCH=arm64 dt_binding_check.

Tested by verifying images streamed from Scarlet Chromebook

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
  arm64: dts: rockchip: add isp and sensors for scarlet

Helen Koike (7):
  media: staging: dt-bindings: rkisp1: add missing required nodes
  media: staging: dt-bindings: rkisp1: add required items in i2c example
  media: staging: dt-bindings: rkisp1: re-order properties
  media: staging: dt-bindings: rkisp1: fix "no reg" error in parent node
  media: staging: rkisp1: remove unecessary clocks
  dt-bindings: media: rkisp1: move rockchip-isp1 bindings out of staging
  media: MAINTAINERS: rkisp1: add path to dt-bindings

Shunqian Zheng (1):
  arm64: dts: rockchip: add isp0 node for rk3399

 .../bindings/media/rockchip-isp1.yaml         | 65 +++++++++-------
 MAINTAINERS                                   |  2 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi | 74 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      | 27 +++++++
 drivers/staging/media/rkisp1/rkisp1-dev.c     |  2 -
 5 files changed, 143 insertions(+), 27 deletions(-)
 rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (81%)

-- 
2.26.0

