Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE51C47A28C
	for <lists+linux-media@lfdr.de>; Sun, 19 Dec 2021 23:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233685AbhLSWJ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Dec 2021 17:09:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48264 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhLSWJ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Dec 2021 17:09:56 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37BF1D78;
        Sun, 19 Dec 2021 23:09:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639951794;
        bh=BLE+K+r+sO15T6EMGEU2kqqH/SToe6F2thaANnxdi1I=;
        h=From:To:Cc:Subject:Date:From;
        b=Nnkjar3mo6ihCAM0IBYtMclJ4pnqFCdwYdbMcbOrczOoxtReiocOsrJLY+FzdB0Gw
         v+d6o/YWDqB8THjuSO6hmJttgv02kqXqj8j0zuR5udquVXa8XJ0yKaxUnv+VOsBjSl
         FcWZNeWiCvE6sw/1mTiN6tU8SVT4Ujq7XWdviEXM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: IMX296 camera sensor support
Date:   Mon, 20 Dec 2021 00:09:46 +0200
Message-Id: <20211219220948.28953-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds support for the Sony IMX296 camera sensor driver, with
DT bindings in patch 1/2 and a driver in patch 2/2.

The DT bindings originate from a series posted by Manivannan ([1]). They
have been updated, see patch 1/2 for a detailed changelog.

The driver was previously posted in [2], this version takes all the
review comments into account.

[1] https://lore.kernel.org/all/20191030094902.32582-2-manivannan.sadhasivam@linaro.org
[2] https://lore.kernel.org/all/20191031132309.10965-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (1):
  media: i2c: IMX296 camera sensor driver

Manivannan Sadhasivam (1):
  dt-bindings: media: i2c: Add IMX296 CMOS sensor binding

 .../bindings/media/i2c/sony,imx296.yaml       |   95 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx296.c                    | 1200 +++++++++++++++++
 5 files changed, 1317 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
 create mode 100644 drivers/media/i2c/imx296.c


base-commit: 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
-- 
Regards,

Laurent Pinchart

