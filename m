Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340002472CA
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391636AbgHQSra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:47:30 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:47533 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388027AbgHQPzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 11:55:40 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B10BD240011;
        Mon, 17 Aug 2020 15:55:31 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: media: ov772x: Convert to json-schama
Date:   Mon, 17 Aug 2020 17:59:07 +0200
Message-Id: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert to json-schema the ov772x bindings and add support for endpoint
properties to pave the way for  Prabhakar's support for BT.656 in the driver.

Prabhakar: could you confirm the properties defaults are sane according to your
setup?

Thanks
  j

Jacopo Mondi (3):
  dt-bindings: media: ov772x: Convert to json-schema
  dt-bindings: media: ov772x: Make bus-type mandatory
  dt-bindings: media: ov772x: Document endpoint props

 .../devicetree/bindings/media/i2c/ov772x.txt  |  40 ------
 .../devicetree/bindings/media/i2c/ov772x.yaml | 134 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 135 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.yaml

--
2.27.0

