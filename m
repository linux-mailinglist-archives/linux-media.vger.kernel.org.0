Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03848220EB2
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 16:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732033AbgGOOGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 10:06:30 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35955 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgGOOGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 10:06:30 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0F97BFF813;
        Wed, 15 Jul 2020 14:06:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/8] dt-bindings: media: i2c: Convert to json-schema
Date:   Wed, 15 Jul 2020 16:09:43 +0200
Message-Id: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert to json schema the bindings file for the following sensor
drivers:

- ov5640
- ov5645
- ov772x
- mt9v111
- imx214
- imx274
- imx290

On top of the conversion to yaml, rename the files to include the
vendor prefix (I kept this separate as I'm not sure it's actually desired).

The series requires:
[PATCH v3 0/3] dt-bidings: media: ov5647 bindings + small fix
which converts the ov5647 bindings to yaml which I sent separately
as it was already in review.

Individual maintainers Cc-ed for each single patch where available.

Thanks
  j

Jacopo Mondi (8):
  dt-bindings: media: ov5640: Convert to json-schema
  dt-bindings: media: ov5645: Convert to json-schema
  dt-bindings: media: mt9v111: Convert to json-schema
  dt-bindings: media: imx290: Convert to json-schema
  dt-bindings: media: imx274: Convert to json-schema
  dt-bindings: media: imx214: Convert to json-schema
  dt-bindings: media: ov772x: Convert to json-schema
  dt-bindings: media: i2c: Add prefix to yaml bindings

 .../bindings/media/i2c/aptina,mt9v111.txt     |  46 -----
 .../bindings/media/i2c/aptina,mt9v111.yaml    |  87 +++++++++
 .../devicetree/bindings/media/i2c/imx274.txt  |  33 ----
 .../devicetree/bindings/media/i2c/imx290.txt  |  57 ------
 .../devicetree/bindings/media/i2c/ov5640.txt  |  92 ---------
 .../devicetree/bindings/media/i2c/ov5645.txt  |  54 ------
 .../devicetree/bindings/media/i2c/ov772x.txt  |  40 ----
 .../bindings/media/i2c/ovti,ov5640.yaml       | 181 ++++++++++++++++++
 .../bindings/media/i2c/ovti,ov5645.yaml       | 123 ++++++++++++
 .../i2c/{ov5647.yaml => ovti,ov5647.yaml}     |   0
 .../bindings/media/i2c/ovti,ov772x.yaml       |  89 +++++++++
 .../i2c/{ov8856.yaml => ovti,ov8856.yaml}     |   0
 .../bindings/media/i2c/sony,imx214.txt        |  53 -----
 .../bindings/media/i2c/sony,imx214.yaml       | 124 ++++++++++++
 .../i2c/{imx219.yaml => sony,imx219.yaml}     |   0
 .../bindings/media/i2c/sony,imx274.yaml       |  74 +++++++
 .../bindings/media/i2c/sony,imx290.yaml       | 124 ++++++++++++
 MAINTAINERS                                   |  25 ++-
 18 files changed, 819 insertions(+), 383 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
 rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
 rename Documentation/devicetree/bindings/media/i2c/{ov8856.yaml => ovti,ov8856.yaml} (100%)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (100%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml

--
2.27.0

