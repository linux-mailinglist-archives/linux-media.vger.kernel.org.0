Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2436E220D36
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 14:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbgGOMpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 08:45:23 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:32981 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgGOMpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 08:45:23 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8933AC0009;
        Wed, 15 Jul 2020 12:45:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH v3 0/3] dt-bidings: media: ov5647 bindings + small fix
Date:   Wed, 15 Jul 2020 14:48:35 +0200
Message-Id: <20200715124838.84552-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A small update to v2:
- Add Laurent's tags
- Remove 'endpoint' from the list of required port properties, in the
  newly introduced ov5647 bindings, and while updating the existing ov8865
  ones
- Make Dave and me co-maintainers for ov5647 as the two email addresses we tried
  to contact Luis with both failed.

Thanks
  j

Jacopo Mondi (3):
  dt-bindings: media: ov5647: Convert to json-schema
  dt-bindings: media: i2c: Document 'remote-endpoint'
  media: MAINTAINERS: ov5647: Add myself as maintainer

 .../devicetree/bindings/media/i2c/imx219.yaml |  5 ++
 .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
 .../devicetree/bindings/media/i2c/ov5647.yaml | 79 +++++++++++++++++++
 .../devicetree/bindings/media/i2c/ov8856.yaml |  7 +-
 MAINTAINERS                                   |  3 +-
 5 files changed, 90 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml

--
2.27.0

