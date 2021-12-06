Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CB446AE3E
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 00:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377243AbhLFXLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 18:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377214AbhLFXLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 18:11:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87B5C061746
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 15:07:50 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CA55556;
        Tue,  7 Dec 2021 00:07:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638832069;
        bh=R0mweYh29kiriBsjCuEjrkG/BvvBVpOWrB+QMirVOpI=;
        h=From:To:Cc:Subject:Date:From;
        b=G9oIFKTXODgQMIxd7N/cZ4DpcOFcA5QM+cp6qLWz8HuefoW4sgIC1dNg0Vh/MxHHB
         pzS6YS48E7Mjy06QWnSHrISjh5+JovJOlZXMkfcHYzeaFy3prcYZkjT2jbBmRpzXN0
         K3/dZiV92HJUC/TFz9R33ITdDwASaKJsau3R4NY4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 0/2] media: Driver for OV1063x camera sensor
Date:   Tue,  7 Dec 2021 01:07:15 +0200
Message-Id: <20211206230717.5836-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a driver for the OV10633 and OV10635 camera
sensors, along with corresponding DT bindings.

As detailed in the commit message of patch 2/2, the driver originates
from a submission from Phil Edworthy 8 and a half years ago. It went
through the TI kernel tree, and is now a candidate for mainline again.

Large parts of the driver have been rewritten compared to the version
present in the TI kernel, to bring the code to the latest kernel APIs,
fix issues and apply various cleanups. There are known issues, listed in
TODO comments in the driver, and some of them will require access to
more documentation in order to develop fixes (I only have a leaked
OV10633 datasheet).

The code is functional, and has been tested successfully with multiple
resolutions, with a TI AM572x EVM and the TI VIP capture driver.

Please see individual patches for details changelogs.

Benoit Parrot (1):
  dt-bindings: media: Add bindings for OmniVision OV1063x sensors

Laurent Pinchart (1):
  media: i2c: Add OV1063x sensor driver

 .../bindings/media/i2c/ovti,ov1063x.yaml      |   97 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov1063x.c                   | 1716 +++++++++++++++++
 drivers/media/i2c/ov1063x_regs.h              |  627 ++++++
 6 files changed, 2462 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov1063x.yaml
 create mode 100644 drivers/media/i2c/ov1063x.c
 create mode 100644 drivers/media/i2c/ov1063x_regs.h


base-commit: 1f1517fafda598839a02e39968c5063ddcfa51fc
-- 
Regards,

Laurent Pinchart

