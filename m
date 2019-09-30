Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C995EC215A
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 15:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731228AbfI3NEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 09:04:43 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48830 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730929AbfI3NEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 09:04:42 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4ZaX122607;
        Mon, 30 Sep 2019 08:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569848675;
        bh=zwY7tkc6pjGZm1I+Zym1So/oOC+v+j8jYGLvEWDqUEY=;
        h=From:To:CC:Subject:Date;
        b=NXhXmJLqH3O4wVskkag7bbWB62tPiol5+9EgURbnsL0UiHE2+uidWwJK8sP+HKY4J
         W/9zTjy9LfFvzhMVQUvpDGVqJV8oBUpc70BsGMhMzjcIWtrc5WKpCQLmlFd0r5Assb
         dcpzrniWqJ1gdeTFSwo3v4nfv3BOUTY2wmCQvpfU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4Z0Z057319;
        Mon, 30 Sep 2019 08:04:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 08:04:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 08:04:25 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4Zif115624;
        Mon, 30 Sep 2019 08:04:35 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v5 0/8] media: i2c: ov2659: maintenance series
Date:   Mon, 30 Sep 2019 08:06:36 -0500
Message-ID: <20190930130644.8704-1-bparrot@ti.com>
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

Changes since v4:
- Changes the s_ctrl "power" access method to use pm runtime API
- Fix an issue with "streaming" vairable left on in error case.
- Added Acked-by from Prabhakar
- Added Reviwed-by from Rob

Changes since v3:
- Addressed review comment from Sakari about s_ctrl i2c access whne
  powered off

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
 drivers/media/i2c/ov2659.c                    | 139 +++++++++++++-----
 3 files changed, 112 insertions(+), 38 deletions(-)

-- 
2.17.1

