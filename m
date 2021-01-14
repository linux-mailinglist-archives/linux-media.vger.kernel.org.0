Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF47D2F66AF
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 18:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbhANRFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 12:05:10 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:59511 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbhANRFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 12:05:10 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6C86D4000D;
        Thu, 14 Jan 2021 17:04:26 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: [PATCH v8 0/5] media: i2c: Add RDACM21 camera module
Date:   Thu, 14 Jan 2021 18:04:24 +0100
Message-Id: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One more iteration to squash in all the fixups sent in v7 and address
a comment from Sergei in [2/5] commit message.

All patches now reviewed and hopefully ready to be collected!

Thanks
  j

Jacopo Mondi (5):
  media: i2c: Add driver for RDACM21 camera module
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

