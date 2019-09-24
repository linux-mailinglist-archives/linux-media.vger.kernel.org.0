Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E21BCCCF
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 18:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404027AbfIXQmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 12:42:17 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58732 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403972AbfIXQmQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 12:42:16 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgCrN054386;
        Tue, 24 Sep 2019 11:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569343332;
        bh=QyocoQI2IJmSXTEBOua9cDMHDOEeT61Hn7qFcGU0ZtQ=;
        h=From:To:CC:Subject:Date;
        b=MRVeoOBRss0BOnkQZS1cb2NZHYNmuAunRiPFzu1h8d/xka6Yl91aGVX/CYST2ihRl
         YtVHyENOFUkOSGRwgvRWxVMHqdIycu2cBVx8RoDBlzRpShP7Ox+MSLVb3b+GTcWJ+W
         Eo6Haz+N2nGPanFvK0gQ4ixmiptkSGpLmPjXt30s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8OGgC0X048727
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Sep 2019 11:42:12 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 11:42:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 11:42:12 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgCQS073229;
        Tue, 24 Sep 2019 11:42:12 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 0/8] media: i2c: ov2659: maintenance series
Date:   Tue, 24 Sep 2019 11:44:06 -0500
Message-ID: <20190924164414.21897-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series is a collection of patches we have been carrying for a
while.

It includes a few sensor register fixes which would cause visual
artifacts at lower resolution and also at 720p.

Also on some board the 'powerdown' and /or 'reset' pins are not tied so
we need to add support for optional gpios to handle these.

Since these camera are removable on some board we also need the driver
to actually fail when there is no hardware present so the driver is
actually removed.

Also added a patch to check and propagate errors on s_stream invocation.

Finally, we update the licensing statement to use SPDX licensing.

Changes since v2:
- Addressed review comment from Sakari
- Reworked the "media: i2c: ov2659: Add powerdown/reset gpio handling"
  to use pm_runtime if it is available but not to make it depend on it.
- Cleaned up the gpio related calls to remove the unnecessary NULL check

Changes since v1:
- Addressed review comment from Prabhakar
- Added support for reset-gpios
- Rework the power setting to use pm_runtime instead of s_power
  as based on discussion with Sakari it would be the prefered method
- Added a patch to reduce the number explicit include files to the
  minimum necessary instead of the previous kitchen sink approach

Benoit Parrot (8):
  media: i2c: ov2659: Fix for image wrap-around in lower resolution
  media: i2c: ov2659: Fix sensor detection to actually fail when device
    is not present
  media: i2c: ov2659: Cleanup include file list
  media: i2c: ov2659: fix s_stream return value
  media: dt-bindings: ov2659: add powerdown/reset-gpios optional
    property
  media: i2c: ov2659: Add powerdown/reset gpio handling
  media: i2c: ov2659: Fix missing 720p register config
  media: i2c: ov2659: Switch to SPDX Licensing

 .../devicetree/bindings/media/i2c/ov2659.txt  |   9 ++
 drivers/media/i2c/Kconfig                     |   2 +-
 drivers/media/i2c/ov2659.c                    | 135 +++++++++++++-----
 3 files changed, 109 insertions(+), 37 deletions(-)

-- 
2.17.1

