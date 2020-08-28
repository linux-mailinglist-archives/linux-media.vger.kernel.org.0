Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2980255B24
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 15:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbgH1NLp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 09:11:45 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35021 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729172AbgH1NLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 09:11:44 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPA id 52B35C000B;
        Fri, 28 Aug 2020 13:11:40 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mripard@kernel.org, wens@csie.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH v2 0/3] Add support of OV8865 camera
Date:   Fri, 28 Aug 2020 15:11:31 +0200
Message-Id: <20200828131134.12113-1-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the camera sensor OV8865.
The sensor was tested on a dual camera module for A83T SoC on Bananapi M3.
My work is based on the Allwinner BSP for the A83T.

Changes since V1:
- Replaced the text documentation by a YAML schema.
- Add some correction in the enable of the sensor.

Kévin L'hôpital (3):
  dt-bindings: media: i2c: Add documentation for ov8865
  media: i2c: Add support for the OV8865 image sensor
  [NOT FOR MERGE] ARM: dts: sun8i: a83t: bananapi-m3: Enable OV8865
    camera

 .../devicetree/bindings/media/i2c/ov8865.yaml |  165 ++
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  |   89 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov8865.c                    | 2541 +++++++++++++++++
 5 files changed, 2808 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8865.yaml
 create mode 100644 drivers/media/i2c/ov8865.c

-- 
2.17.1

