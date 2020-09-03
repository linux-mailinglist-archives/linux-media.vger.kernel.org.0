Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471F225C4A7
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 17:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbgICPNP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 11:13:15 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51407 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728670AbgICLsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 07:48:46 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7C70B1BF209;
        Thu,  3 Sep 2020 11:48:03 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/3] dt-bindings: media: i2c: Convert 3 sensor bindings
Date:   Thu,  3 Sep 2020 13:51:40 +0200
Message-Id: <20200903115143.13717-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I know I've sent the previous version first as part of a longer list of patches,
later individually, and now grouped together again. Sorry for the fuss, hope
it's not too confusing.

These three sensor bindings conversions go together as they all happen in a
single patch, so I deemed it was easier to just group them.

In v4 after finalizing the discussion with Laurent and Rob on how to handle
of-graph endpoint, I have dropped them from mt9v111 and imx274. For imx214 as I
have endpoint properties to document I have also documented 'endpoint' (not
mandatory) and 'remote-endpoint' (mandatory). Hope I got the outcome of the
discussion right. For imx214 I also took in Laurent's suggestion on how to
document the 'data-lanes' supported values.

Individual maintainers cc-ed per-patch.

Thanks
   j

Jacopo Mondi (3):
  dt-bindings: media: mt9v111: Convert to json-schema
  dt-bindings: media: imx274: Convert to json-schema
  dt-bindings: media: imx214: Convert to json-schema

 .../bindings/media/i2c/aptina,mt9v111.txt     |  46 ------
 .../bindings/media/i2c/aptina,mt9v111.yaml    |  75 ++++++++++
 .../devicetree/bindings/media/i2c/imx274.txt  |  38 -----
 .../bindings/media/i2c/sony,imx214.txt        |  53 -------
 .../bindings/media/i2c/sony,imx214.yaml       | 137 ++++++++++++++++++
 .../bindings/media/i2c/sony,imx274.yaml       |  59 ++++++++
 MAINTAINERS                                   |   6 +-
 7 files changed, 274 insertions(+), 140 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml

--
2.28.0

