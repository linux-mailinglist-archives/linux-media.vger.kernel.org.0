Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642EB248498
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 14:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgHRMQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 08:16:40 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38121 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRMQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 08:16:38 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6264360002;
        Tue, 18 Aug 2020 12:16:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: media: ov772x: Convert to json-schama
Date:   Tue, 18 Aug 2020 14:20:09 +0200
Message-Id: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just adding a missing signed-off-by to 2/3

Re-pasting here the cover letter for reference

--------------------------------------------------------------------------------
Convert to json-schema the ov772x bindings and add support for endpoint
properties to pave the way for  Prabhakar's support for BT.656 in the driver.

Prabhakar: could you confirm the properties defaults are sane according to your
setup?
--------------------------------------------------------------------------------

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

