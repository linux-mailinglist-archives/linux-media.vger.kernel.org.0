Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB062F52C0
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 19:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbhAMSzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 13:55:40 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41953 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbhAMSzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 13:55:40 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 247B11C0006;
        Wed, 13 Jan 2021 18:54:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: [PATCH v7 0/7] media: i2c: Add RDACM21 camera module
Date:   Wed, 13 Jan 2021 19:54:58 +0100
Message-Id: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This iteration is only to ease review of the RDACM21 as it contains two
broken out patches marked as fixups

I've taken Laurent's comments on v6 in the driver, but once I've rebased on
the GPIO handling fixes applied to the MAX9271 driver, I've opened the pandora
can of properly resetting the OV490 ISP @_@

The two broken out patches serve to show the difference on top of the v6
version instead of having reviewers going through the changes  that might get
lost between the two versions.

With acks on the fixups patches, I'll squash in v8.

All the other patches are reviewed already, so I hope if nothing big is in
this version, v8 will be good for merging.

Thanks
  j

Jacopo Mondi (7):
  media: i2c: Add driver for RDACM21 camera module
  fixup! media: i2c: rdacm21: Fix GPIO handling
  fixup! media: i2c: rdacm21: Break-out ov10640 initialization
  dt-bindings: media: max9286: Document
    'maxim,reverse-channel-microvolt'
  media: i2c: max9286: Break-out reverse channel setup
  media: i2c: max9286: Make channel amplitude programmable
  media: i2c: max9286: Configure reverse channel amplitude

 .../bindings/media/i2c/maxim,max9286.yaml     |  22 +
 MAINTAINERS                                   |  12 +
 drivers/media/i2c/Kconfig                     |  13 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/max9286.c                   |  60 +-
 drivers/media/i2c/rdacm21.c                   | 623 ++++++++++++++++++
 6 files changed, 719 insertions(+), 13 deletions(-)
 create mode 100644 drivers/media/i2c/rdacm21.c

--
2.29.2

