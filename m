Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774B030C2B5
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234917AbhBBO6B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:58:01 -0500
Received: from gloria.sntech.de ([185.11.138.130]:48846 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234877AbhBBO5p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:57:45 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l6x6l-00020V-KD; Tue, 02 Feb 2021 15:56:47 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, robh+dt@kernel.org,
        sebastian.fricke@posteo.net, linux-media@vger.kernel.org,
        dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, cmuellner@linux.com
Subject: [PATCH 0/6] Support second Image Signal Processor on rk3399
Date:   Tue,  2 Feb 2021 15:56:26 +0100
Message-Id: <20210202145632.1263136-1-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rk3399 has two ISPs and right now only the first one is usable.
The second ISP is connected to the TXRX dphy on the soc.

The phy of ISP1 is only accessible through the DSI controller's
io-memory, so this series adds support for simply using the dsi
controller is a phy if needed.

That solution is needed at least on rk3399 and rk3288 but no-one
has looked at camera support on rk3288 at all, so right now
only implement the rk3399 specifics.


Heiko Stuebner (6):
  drm/rockchip: dsi: add own additional pclk handling
  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
  arm64: dts: rockchip: add isp1 node on rk3399

 .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
 drivers/gpu/drm/rockchip/Kconfig              |   2 +
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 342 ++++++++++++++++++
 4 files changed, 384 insertions(+)

-- 
2.29.2

