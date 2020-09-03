Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2448F25C1B4
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 15:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbgICNcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 09:32:09 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55911 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728935AbgICNIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 09:08:50 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 60B0840019;
        Thu,  3 Sep 2020 13:06:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/3] dt-bindings: media: ov772x: Convert to json-schema
Date:   Thu,  3 Sep 2020 15:10:26 +0200
Message-Id: <20200903131029.18334-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the ov722x bindings to json-schema and add endpoint properties and
bus-type.

Compared to v3 in 1/3 I have not documented 'endpoint'
Then 2/3 introduces the 'bus-type' endpoint properties, so I had to document
'endpoint' and list 'remote-endpoint' as required (which makes me think I
could have kept it in 1/3, but for sake of consistency...)
3/3 adds endpoint properties, whose presence is conditional to the specified
bus-type.

Thanks
  j

Jacopo Mondi (3):
  dt-bindings: media: ov772x: Convert to json-schema
  dt-bindings: media: ov772x: Make bus-type mandatory
  dt-bindings: media: ov772x: Document endpoint props

 .../devicetree/bindings/media/i2c/ov772x.txt  |  40 -----
 .../bindings/media/i2c/ovti,ov772x.yaml       | 138 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 139 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml

--
2.28.0

