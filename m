Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B002C7086
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 19:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730134AbgK1SAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 13:00:17 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:40566 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729781AbgK1R6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 12:58:16 -0500
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 922D53A2CF0;
        Sat, 28 Nov 2020 11:07:02 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3FE4B20007;
        Sat, 28 Nov 2020 11:06:39 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 0/2] media: i2c: OV5648 image sensor support
Date:   Sat, 28 Nov 2020 12:06:24 +0100
Message-Id: <20201128110626.456472-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the OV5648 image sensor,
as a V4L2 subdev driver.

Changes since v2:
- Added link-frequencies endpoint property support;
- Used NULL ctrl ops for pixel rate and link freq;
- Extra cosmetic changes.

Changes since v1:
- Used runtime pm;
- Used assigned-clock-rate;
- Removed clock name;
- Returned closest size in set_fmt;
- Removed unneeded references to v4l2 controls;
- Removed i2c device table;
- Dual-licensed bindings;
- Used SPDX tags.

Paul Kocialkowski (2):
  dt-bindings: media: i2c: Add OV5648 bindings documentation
  media: i2c: Add support for the OV5648 image sensor

 .../bindings/media/i2c/ovti,ov5648.yaml       |  115 +
 drivers/media/i2c/Kconfig                     |   14 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov5648.c                    | 2715 +++++++++++++++++
 4 files changed, 2845 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
 create mode 100644 drivers/media/i2c/ov5648.c

-- 
2.29.2

