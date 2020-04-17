Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4201ADB20
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 12:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgDQKef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 06:34:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgDQKef (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 06:34:35 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE1EC97D;
        Fri, 17 Apr 2020 12:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587119672;
        bh=iXcDG3x21kdICT9LesiijNnKyq0L2S+OhNZgcyTtIVU=;
        h=From:To:Cc:Subject:Date:From;
        b=vph5Cck8dFuT5oTpMHZx5b33eajjDp0m//Q9RI/wOro6iVUXQyL8bWBqTlDe909vw
         xxrUIcXfvje9y247LOhMntKtaFvRk4lIlnNQq0qZqa3L3gJBdy+vModLZHoZg+jQdU
         TLMx5C8GHmh7/ROLUpXIcH/akJRMmcmNSW/JWrCE=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 0/4] MAX9286 GMSL Support (+RDACM20)
Date:   Fri, 17 Apr 2020 11:34:20 +0100
Message-Id: <20200417103424.5875-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series provides a pair of drivers for the GMSL cameras on the R-Car ADAS
platforms.

These drivers originate from Cogent Embedded, and have been refactored to split
the MAX9286 away from the RDACM20 drivers which were once very tightly coupled.

The MAX9286 is capable of capturing up to 4 streams simultaneously, and while
the V4L2-Multiplexed streams series is not available, this works purely on the
assumption that the receiver will correctly map each of the 4 VCs to separate
video nodes, as the RCar-VIN does.

This driver along with a camera driver for the RDACM20 and the
associated platform support for the Renesas R-Car Salvator-X, and the Eagle-V3M
can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git gmsl/v8

We're very much hoping that we can aim to get the max9286 into the next
merge-window. Please let us know if there are any issues blocking this.

Jacopo Mondi (2):
  dt-bindings: media: i2c: Add bindings for IMI RDACM2x
  media: i2c: Add RDACM20 driver

Kieran Bingham (1):
  media: i2c: Add MAX9286 driver

Laurent Pinchart (1):
  dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286

 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  |  161 ++
 .../bindings/media/i2c/maxim,max9286.yaml     |  287 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   22 +
 drivers/media/i2c/Kconfig                     |   25 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/max9271.c                   |  330 ++++
 drivers/media/i2c/max9271.h                   |  224 +++
 drivers/media/i2c/max9286.c                   | 1332 +++++++++++++++++
 drivers/media/i2c/rdacm20.c                   |  668 +++++++++
 10 files changed, 3054 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
 create mode 100644 drivers/media/i2c/max9271.c
 create mode 100644 drivers/media/i2c/max9271.h
 create mode 100644 drivers/media/i2c/max9286.c
 create mode 100644 drivers/media/i2c/rdacm20.c

-- 
2.20.1

