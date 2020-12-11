Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBCE2D79BA
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 16:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404369AbgLKPpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 10:45:50 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57817 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392900AbgLKPpV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 10:45:21 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2F8FC20007;
        Fri, 11 Dec 2020 15:44:36 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: [PATCH v4 0/3] media: i2c: OV8865 image sensor support
Date:   Fri, 11 Dec 2020 16:44:25 +0100
Message-Id: <20201211154428.153762-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the OV8865 image sensor, as a V4L2 subdev
driver. Although an initial series was submitted by Kévin L'hôpital some
weeks ago, this version is significantly new and should be considered a
new series.

The final patch (not for merge) shows how to enable the OV8865 on the
Banana Pi Camera Board v2 with the Banana Pi M3.

Changes since v3:
- Removed debug read in write helper;
- Squashed tailing function calls in return;
- Added Kconfig depend on PM since it's not optional;
- Reordered runtime PM in init;
- Reworked runtime PM order and added ctrls handler free in exit.

Changes since v2:
- Added link-frequencies endpoint property support;
- Marked avdd-supply as non-optional (no internal regulator);
- Used NULL ctrl ops for pixel rate and link freq;
- Extra cosmetic changes.

Changes since v1:
- Used runtime pm;
- Used assigned-clock-rate;
- Removed clock name;
- Returned closest size in set_fmt;
- Removed unneeded references to v4l2 controls;
- Removed unneeded structure packing attribute;
- Removed i2c device table;
- Dual-licensed bindings;
- Used SPDX tags.

Kévin L'hôpital (1):
  ARM: dts: sun8i: a83t: bananapi-m3: Enable MIPI CSI-2 with OV8865

Paul Kocialkowski (2):
  dt-bindings: media: i2c: Add OV8865 bindings documentation
  media: i2c: Add support for the OV8865 image sensor

 .../bindings/media/i2c/ovti,ov8865.yaml       |  124 +
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  |  102 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov8865.c                    | 2981 +++++++++++++++++
 5 files changed, 3221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
 create mode 100644 drivers/media/i2c/ov8865.c

-- 
2.29.2

