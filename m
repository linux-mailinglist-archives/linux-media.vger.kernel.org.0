Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19D619D8E5
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 16:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391014AbgDCOVq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 10:21:46 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:48057 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390896AbgDCOVq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 10:21:46 -0400
X-Originating-IP: 77.205.41.241
Received: from localhost.localdomain (241.41.205.77.rev.sfr.net [77.205.41.241])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1D96C1BF22A;
        Fri,  3 Apr 2020 14:21:41 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 0/3] media: rockchip: Introduce driver for the camera interface on PX30
Date:   Fri,  3 Apr 2020 16:21:19 +0200
Message-Id: <20200403142122.297283-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

Here's a series to add very basic support for the camera interface on
the Rockchip PX30 SoC.

This Camera Interface is also supported on other Rockchip SoC such as
the RK1808, RK3128, RK3288 and RK3288, but for now I've only been able to
test it on the PX30, using a PAL format.

This driver is mostly based on the driver found in Rockchip's BSP, that
has been trimmed down to support the set of features that I was able to test,
that is pretty much a very basic one-frame capture and video streaming
with GStreamer. 

This first draft only supports the Parallel interface, although the
controller has support for BT656 and CSI2.

Finally, this controller has an iommu that could be used in this driver,
but as of today I've not been able to get it to work.

Any review is welcome.

Thanks,

Maxime

Maxime Chevallier (3):
  media: dt-bindings: media: Document Rockchip CIF bindings
  media: rockchip: Introduce driver for Rockhip's camera interface
  arm64: dts: rockchip: Add the camera interface description of the PX30

 .../bindings/media/rockchip-cif.yaml          |   98 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi        |   12 +
 drivers/media/platform/Kconfig                |   13 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/rockchip/cif/Makefile  |    3 +
 drivers/media/platform/rockchip/cif/capture.c | 1170 +++++++++++++++++
 drivers/media/platform/rockchip/cif/dev.c     |  407 ++++++
 drivers/media/platform/rockchip/cif/dev.h     |  208 +++
 drivers/media/platform/rockchip/cif/regs.h    |  256 ++++
 9 files changed, 2168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-cif.yaml
 create mode 100644 drivers/media/platform/rockchip/cif/Makefile
 create mode 100644 drivers/media/platform/rockchip/cif/capture.c
 create mode 100644 drivers/media/platform/rockchip/cif/dev.c
 create mode 100644 drivers/media/platform/rockchip/cif/dev.h
 create mode 100644 drivers/media/platform/rockchip/cif/regs.h

-- 
2.24.1

