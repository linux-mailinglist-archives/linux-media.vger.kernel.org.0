Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E8E1802C9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgCJQGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55114 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgCJQGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:41 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 103CE5F;
        Tue, 10 Mar 2020 17:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856400;
        bh=/bScsSRDb6T68XOhH/hsND4ttS8rnGObBOFHIFAPnXk=;
        h=From:To:Cc:Subject:Date:From;
        b=llIH49QyYwmCrox/qphfkRP8BXTgTw9EeimdKqv+jgMc3szNcIo+RFsN83RI39ecQ
         jAIc2ThjMzha6uUr4oWRP4jJi1PKftE2jYnroYVe9TCd9+/rfFFUpynlv2m3i418Kg
         JkYDyaRXipCKKKilaF+VbqobaGM6wfEwDDzKdfEg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 00/10] media: imx: Miscellaneous fixes for i.MX7
Date:   Tue, 10 Mar 2020 18:06:23 +0200
Message-Id: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series contains miscellaneous fixes I developed while trying
to capture from a CSI-2 sensor on the i.MX7.

Patches 01/10, 02/10 and 05/10 are small fixes or enhancements, please
see individual commit messages. Patch 06/10 fixes a recent issue with
video field handling. Patches 03/10, 04/10 and 07/10 to 10/10 add
support for 10- and 12-bit greyscale formats (both on the i.MX7 CSI-2
receiver side and the CSI side), including the ability to clamp Y10 and
Y12 to Y8.

Steve, Philipp, Rui, once you get to review this series, will you submit
a pull request or should I do so ?

Laurent Pinchart (10):
  media: imx: imx7_mipi_csis: Power off the source when stopping
    streaming
  media: imx: imx7_mipi_csis: Print the RESOL_CH0 register
  media: imx: imx7_mipi_csis: Add greyscale formats support
  media: imx: imx7-mipi-csis: Filter on CSI-2 data type
  media: imx: imx7-media-csi: Remove unneeded register read
  media: imx: imx7-media-csi: Fix video field handling
  media: imx: imx6-media-csi: Replace Y16 with Y10 and Y12
  media: imx: imx6-media-csi: Support clamping Y10 and Y12 to Y8
  media: imx: imx7-media-csi: Add Y10 and Y12 formats support
  media: imx: imx7-media-csi: Support clamping Y10 and Y12 to Y8

 drivers/staging/media/imx/imx-media-csi.c   |  3 ++-
 drivers/staging/media/imx/imx-media-utils.c | 19 ++++++++++++------
 drivers/staging/media/imx/imx7-media-csi.c  | 22 ++++++++++++++++++++-
 drivers/staging/media/imx/imx7-mipi-csis.c  | 16 ++++++++++++++-
 4 files changed, 51 insertions(+), 9 deletions(-)

-- 
Regards,

Laurent Pinchart

