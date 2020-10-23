Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0DD297634
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 19:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753891AbgJWRyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 13:54:16 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51941 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753885AbgJWRyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 13:54:16 -0400
X-Greylist: delayed 480 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Oct 2020 13:54:15 EDT
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (unknown [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 51D8D2000D;
        Fri, 23 Oct 2020 17:54:12 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, kevin.lhopital@hotmail.com
Subject: [PATCH 0/3] media: i2c: OV8865 image sensor support
Date:   Fri, 23 Oct 2020 19:54:03 +0200
Message-Id: <20201023175406.504527-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
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

Cheers,

Paul

Kévin L'hôpital (1):
  ARM: dts: sun8i: a83t: bananapi-m3: Enable MIPI CSI-2 with OV8865

Paul Kocialkowski (2):
  dt-bindings: media: i2c: Add OV8865 bindings documentation
  media: i2c: Add support for the OV8865 image sensor

 .../bindings/media/i2c/ovti,ov8865.yaml       |  124 +
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  |   98 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov8865.c                    | 3031 +++++++++++++++++
 5 files changed, 3267 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
 create mode 100644 drivers/media/i2c/ov8865.c

-- 
2.28.0

