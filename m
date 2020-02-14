Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E352115D5C8
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 11:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387430AbgBNKbm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 05:31:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34820 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729153AbgBNKbm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 05:31:42 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F97C504;
        Fri, 14 Feb 2020 11:31:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581676300;
        bh=ki0tcFnI4lbmv/4nzzmQYng8dQO2LiqilCMnNChjrOg=;
        h=From:To:Cc:Subject:Date:From;
        b=Pn52yU3LeeWkLwpEzxp/vNOwENp3rMg/L5nv2AYukCNX41e8JP036i7k6bWoTJgHJ
         TfJq/ZO66HOEgsGWgAinumjUT2iLOzpn5j8hZ/Apnwroj3kNVarS/ZEsT+eXlfeGJP
         Yz0nLZBPI94A+SjrhjBZmUkgGwu6KflmTqI09xzM=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v7 0/2] MAX9286 GMSL support
Date:   Fri, 14 Feb 2020 10:31:34 +0000
Message-Id: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series provides the deserialiser driver for GMSL cameras on the R-Car ADAS
platforms.

These drivers originate from Cogent Embedded, and have been refactored to split
the MAX9286 away from the RDACM20 drivers which were once very tightly coupled.

This posting is the culmination of > 100 changesets spread across Jacopo,
Niklas, Laurent and myself - thus they contain all of our SoB tags.

This driver along with an intiial camera driver for the RDACM20 and the
associated platform support for the Renesas R-Car Salvator-X, and the Eagle-V3M
can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git gmsl/v7

Kieran Bingham (1):
  media: i2c: Add MAX9286 driver

Laurent Pinchart (1):
  dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286

 .../bindings/media/i2c/maxim,max9286.yaml     |  287 ++++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/max9286.c                   | 1278 +++++++++++++++++
 5 files changed, 1587 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
 create mode 100644 drivers/media/i2c/max9286.c

-- 
2.20.1

