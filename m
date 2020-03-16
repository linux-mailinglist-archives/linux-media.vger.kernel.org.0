Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4AF81873FA
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 21:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732551AbgCPUZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 16:25:15 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58331 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732505AbgCPUZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 16:25:14 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F307FFF802;
        Mon, 16 Mar 2020 20:25:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/5] media: i2c: max9286: Add configuration properties
Date:   Mon, 16 Mar 2020 21:27:52 +0100
Message-Id: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this small series applies on top of Kieran's
[PATCH v7 0/2] MAX9286 GMSL support
and instruments the driver and expands its dt bindings to support
configuring a few deserializer parameters to enable support for different
remote serializers.

In particular for our use case RDACM20 and RDACM21 camera modules require
different configurations of the deserializer reverse channel amplitude and
disabling of the device overlap window.

Hyun has reported he needs to disable the deserializer overlap window to
have this driver work with max96705 serializer.

The series expands the device bindings to require two additional properties
to control overlap window and channel amplitude, and instruments the driver
to parse those properties and use them to configure it parameter.

What 'overlap window' controls is not totally clear at the moment and it's
poorly documented. In all our cases it could stay disabled, but as long as
its precise meaning it's not clarified, a required property ensures that
all current DTB are fully specified, so that in future we select a default
value, old users continue to work as intended/

The reverse channel amplitude describes the initially programmed signal
amplitude of the low bandwidth control channel. The amplitude is made
configurable to accommodate different serializers that might need an initial
different amplitude configuration to establish reliable communications.

On top of the series, a small fixup to be brought in next max9286 version.

Tested on R-Car R8A77970 Eagle with RDACM21.
I would have liked to test the same on Salvator-X with RDACM20. Kieran could
we sync and test it?

RDACM21 and RDACM20 drivers available at
git://jmondi.org/linux #gmsl/jmondi/platform/rdacm21
with integration in Eagle and Salvator-x from Kieran's platform branch, with
additional properties added by this series.


Jacopo Mondi (5):
  media: i2c: max9286: Put of node on error
  dt-bindings: media: max9286: Add overlap window
  media: i2c: max9286: Parse overlap window value
  dt-bindings: media: max9286: Add reverse channel amplitude
  media: i2c: max9286: Parse channel amplitude

 .../bindings/media/i2c/maxim,max9286.yaml     | 32 +++++++++
 MAINTAINERS                                   |  1 +
 drivers/media/i2c/max9286.c                   | 66 +++++++++++++++++--
 include/dt-bindings/media/maxim-gmsl.h        |  9 +++
 4 files changed, 103 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/media/maxim-gmsl.h

--
2.25.1

