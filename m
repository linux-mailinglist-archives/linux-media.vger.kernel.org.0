Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63ADB183D84
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgCLXrd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34468 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgCLXrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:33 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14A165F;
        Fri, 13 Mar 2020 00:47:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056851;
        bh=VQo6wr03XF8jK1LbwDfisrdHhwf+JXe/C4OLZ+So+Pc=;
        h=From:To:Cc:Subject:Date:From;
        b=N0D9+ehiNbGXHJA5HSzpo6cbomqk3xD6vQt/MFxFC30gnf/abxFXekgx/SqrlVLo9
         up0jTocfedyclOanXvrZYo1jkbNKNyojT5tBG+bYI5YCK9k2MqyyV2bX692UjLKO5y
         Mtd1rOAIo6l191D3hMh5DZ2yqGp01iJbLyJAGu2I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 00/14] media: imx: Miscellaneous fixes for i.MX7 CSI-2 receiver
Date:   Fri, 13 Mar 2020 01:47:08 +0200
Message-Id: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series completes (for now :-)) my rework of the CSI-2
receiver found in the i.MX7 SoCs.

Patches 01/14 and 02/14 have already been tested and acked. The next
four patches (03/14 to 06/14) fix format handling by adding missing
formats and removing unsupported formats, and patches 07/14 to 09/14
then clean up and fix image width alignment handling.

The next three patches (10/14 to 12/14) are again miscellaneous
cleanups. Patch 13/14 removes usage of the only imx-media-utils helper
used in this driver as the helper isn't compatible with the i.MX7 CSI-2
receiver formats. Patch 14/14 finally implements the subdev
.enum_mbus_code() pad operation to allow enumeration of media bus codes
from userspace.

The patches have been tested on an i.MX7Q with a 10-bit greyscale MIPI
CSI-2 sensor.

Laurent Pinchart (14):
  media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
  media: imx: imx7-mipi-csis: Centralize initialization of pad formats
  media: imx: imx7-mipi-csis: Add missing RAW formats
  media: imx: imx7-mipi-csis: Expose correct YUV formats
  media: imx: imx7-mipi-csis: Fix MEDIA_BUS_FMT_UYVY8_2X8 data alignment
  media: imx: imx7-mipi-csis: Add MEDIA_BUS_FMT_UYVY10_2X10 support
  media: imx: imx7-mipi-csis: Rename data_alignment field to width
  media: imx: imx7-mipi-csis: Align image width based on format
  media: imx: imx7-mipi-csis: Never set MIPI_CSIS_ISPCFG_ALIGN_32BIT
  media: imx: imx7-mipi-csis: Align macro definitions
  media: imx: imx7-mipi-csis: Remove link setup on source pad
  media: imx: imx7-mipi-csis: Cleanup includes
  media: imx: imx7-mipi-csis: Don't use imx-media-utils helpers
  media: imx: imx7-mipi-csis: Implement the .enum_mbus_code() operation

 drivers/staging/media/imx/imx7-mipi-csis.c | 446 +++++++++++++--------
 1 file changed, 274 insertions(+), 172 deletions(-)

-- 
Regards,

Laurent Pinchart

