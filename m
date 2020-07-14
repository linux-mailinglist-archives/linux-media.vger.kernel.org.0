Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F09021F3F7
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 16:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgGNOZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 10:25:36 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:32295 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgGNOZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 10:25:36 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BCF3E24000C;
        Tue, 14 Jul 2020 14:25:31 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH v2 0/3] dt-bidings: media: ov5647 bindings + small fix
Date:   Tue, 14 Jul 2020 16:28:53 +0200
Message-Id: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have added Rob's tag to patches [1/3] and [2/3].

I have added to patch [1/3] an entry for the yaml binding file to MAINTAINERS
and added a new patch which removes the existing maintainers of the driver,
as his email address bounces back, and replaced it with myself.

I hope this is not rude, but I have no way to contact Luis Oliveira and
ask him, and a bouncing email is not that helpful.

Dave, would you like to be added as maintainer as well, as this sensor
is the one used by the RPi Camera Module v1 ?

Thanks
  j

Jacopo Mondi (3):
  dt-bindings: media: ov5647: Convert to json-schema
  dt-bindings: media: i2c: Document 'remote-endpoint'
  media: MAINTAINERS: ov5647: Add myself as maintainer

 .../devicetree/bindings/media/i2c/imx219.yaml |  5 ++
 .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
 .../devicetree/bindings/media/i2c/ov5647.yaml | 82 +++++++++++++++++++
 .../devicetree/bindings/media/i2c/ov8856.yaml |  5 ++
 MAINTAINERS                                   |  3 +-
 5 files changed, 94 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml

--
2.27.0

