Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B7D1A614D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 03:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgDMBOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 21:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:56602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgDMBOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 21:14:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F21EC0A3BE0
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2020 18:14:36 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 108B424B;
        Mon, 13 Apr 2020 03:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586740472;
        bh=I4uMVJj+eHF4W6ShVQeAcZmO22aFzzUs/mcjb/pcGSU=;
        h=From:To:Cc:Subject:Date:From;
        b=NdtGS2dF4neZbBjFGU6matPXcLf39XxIamPzzzzqD5Gh5O61kFSZJkdWDDsnEkmrr
         Fz9qkCUDKbRdYESfx8+KEbslV8uPauTL4qEFNhEYaCYIM6UIJykSiwN83w0h/x1bC5
         KgU5mgIMGdS86OPA6w+7yrpPHASfpKanTGNoCXlc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] media: imx6: Support complex external topologies
Date:   Mon, 13 Apr 2020 04:14:14 +0300
Message-Id: <20200413011416.2355-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series adds support to the i.MX6 IPU CSI driver for
external (on-board) devices that exhibit complex topologies. My use case
is a CSI-2 camera sensor that has a single DT node (as an I2C device)
and creates two V4L2 subdevs. "Complex" may thus be a bit of an
exageration, but the series nonetheless makes such a sensor usable with
the driver.

There are two issues, fixed by two patches. Patch 1/2 removes the
assumption that OF port ids and pad indices are equivalent. This holds
true in many cases, but is incorrect in my case, with the topology being

+------------+       +--------------+       +---------------------+
|  Sensor   _|       |_   Sensor   _|       |_                    |
| Subdev A |0| ----> |0| Subdev B |1| ----> |0| imx6-mipi-csi2 ...|
|           ¯|       |¯            ¯|       |¯                    |
+------------+       +--------------+       +---------------------+

while the sensor has a single DT node with a single port. The IPU CSI
driver then tries to connect 'Sensor Subdev B':0 to 'imx6-mipi-csi2':0,
which isn't right.

The fix isn't perfect, as we ideally need media entity operations to
handle the translation between port ids and pad indices. Nonetheless,
the heuristic in patch 1/2 should cover most, if not all, use cases and
is in my opinion a good way forward.

Patch 2/2 then stops creating links between external entities. The IPU
CSI driver iterates over the list of subdevs registered with the V4L2
device, and creates links based on the OF graph for all of them. That's
fine for devices internal to the i.MX6, but is oversteps the driver's
responsibility as links between external entities are supposed to be
handled by their respective driver. In my use case, the driver attempts
to link 'Sensor Subdev A' by checking OF graph connections in DT, which
results in 'Sensor Subdev A':0 being linked to 'imx6-mipi-csi2':0. The
patch skips external entities for link creation, which fixes the issue.
The link between the closest external entities and the internal entities
are still created by the IPU CSI driver as part of link creation for all
internal entities.

Laurent Pinchart (2):
  media: staging/imx: Don't assume OF port id equals pad index
  media: staging/imx: Don't create links between external entities

 drivers/staging/media/imx/imx-media-csi.c     | 29 ++++++++++-
 .../staging/media/imx/imx-media-dev-common.c  |  7 +--
 drivers/staging/media/imx/imx-media-of.c      | 52 ++++++++++++++++---
 drivers/staging/media/imx/imx-media.h         |  1 +
 4 files changed, 75 insertions(+), 14 deletions(-)

-- 
Regards,

Laurent Pinchart

