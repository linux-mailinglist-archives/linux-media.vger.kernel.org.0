Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33A924128B
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 23:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgHJVwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 17:52:16 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37785 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgHJVwQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 17:52:16 -0400
X-Originating-IP: 82.52.18.94
Received: from uno.homenet.telecomitalia.it (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E736740008;
        Mon, 10 Aug 2020 21:52:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH v4 0/4] dt-bindings: media: ov5647: Convert to dt-schema
Date:   Mon, 10 Aug 2020 23:55:39 +0200
Message-Id: <20200810215543.113206-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   re-based on latest media master with small typographical updates to the
bindings document.

The series collects patches which have been sent to the list as part of
of two separate series.

I've not been able to get in touch with the sensor driver last maintainer
of the driver (Luis Oliveira)

Thanks
  j

v2->v3:
- Expand the series with two additional patches
- Make 'remote-endpoint' not required: we allow empty endpoints, to be filled
  in with overlays
- End all senteces with a full stop for consistency

Jacopo Mondi (4):
  dt-bindings: media: ov5647: Convert to json-schema
  dt-bindings: media: ov5647: Document pwdn-gpios
  dt-bindings: media: ov5647: Document clock-noncontinuous
  media: MAINTAINERS: ov5647: Replace maintainer

 .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
 .../devicetree/bindings/media/i2c/ov5647.yaml | 88 +++++++++++++++++++
 MAINTAINERS                                   |  4 +-
 3 files changed, 91 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml

--
2.27.0

