Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF02381C23
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhEPCny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhEPCnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:43:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB6EC061573;
        Sat, 15 May 2021 19:42:31 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C20752BA;
        Sun, 16 May 2021 04:42:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621132949;
        bh=6xN2eCMcMwVfj599mI2qOlkNIpDfUW3R3fO6dacJGAs=;
        h=From:To:Cc:Subject:Date:From;
        b=Dwi7KxDys3sze32ioYlwtOBEPgcX0HkcxxkCqNATdT0RzwoCliBvJgsRoPQIIzdWt
         6RZtl8pMF+69GanWYMb5o1AGV7YfYiXZN4ehLSc+yMsbTgx1tqSjM1QROkHImUWhCg
         pqr+Jn8sBAnudCiLa6flFNG+cx0iIMyhmylv9O2Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [RFC PATCH 0/3] media: imx: imx7-media-csi: i.MX8MM support
Date:   Sun, 16 May 2021 05:42:13 +0300
Message-Id: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series updates the imx7-media-csi driver to work on the
i.MX8MM with an OV5640 sensor.

Patch 1/3 extends the nxp,imx7-csi DT bindings with a compatible string
for the i.MX8MM. While the CSI bridge in that SoC doesn't seem to differ
from the one in the i.MX7 according to the reference manual, experience
shows that NXP reference manuals are not always reliable. To be on the
safe side, a new fsl,imx8mm-csi compatible string, with a fallback on
fsl,imx7-csi, will avoid future backward-compatibility problems.

Patches 2/3 and 3/3 fix issues with RAW8 and RAW10 capture from an
OV5640 sensor. The fixes are the result of experimentation and study of
NXP BSP drivers, as the reference manual doesn't provide much
information in this area. I'm not very happy with this, as understanding
the exact effect of the register fields modified by those two patches
would be better. Still, without support from NXP (which I would really,
really appreciate - anyone from NXP reading this ?), I can't do better.

Given those concerns, I would also appreciate if this series could be
tested widely for possible regressions. There should be no change for
YUV formats, so only raw formats (RAW8, RAW10, RAW12 and RAW14) need to
be tested.

Laurent Pinchart (3):
  dt-bindings: media: nxp,imx7-csi: Add i.MX8MM support
  media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR for >= 10-bit formats
  media: imx: imx7-media-csi: Don't set PIXEL_BIT in CSICR1

 .../bindings/media/nxp,imx7-csi.yaml          | 12 +++++++----
 drivers/staging/media/imx/imx7-media-csi.c    | 21 +++++--------------
 2 files changed, 13 insertions(+), 20 deletions(-)

-- 
Regards,

Laurent Pinchart

