Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A68A2B213D
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgKMRBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:01:19 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35317 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgKMRBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:01:19 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A937DE000F;
        Fri, 13 Nov 2020 17:01:15 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 0/2] media: i2c: OV5648 image sensor support
Date:   Fri, 13 Nov 2020 18:01:02 +0100
Message-Id: <20201113170104.2252046-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the OV5648 image sensor,
as a V4L2 subdev driver.

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

 .../bindings/media/i2c/ovti,ov5648.yaml       |  112 +
 drivers/media/i2c/Kconfig                     |   14 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov5648.c                    | 2694 +++++++++++++++++
 4 files changed, 2821 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
 create mode 100644 drivers/media/i2c/ov5648.c

-- 
2.28.0

