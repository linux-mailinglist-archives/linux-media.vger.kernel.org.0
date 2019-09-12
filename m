Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F6DB0F41
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 14:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731862AbfILM6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 08:58:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38556 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731743AbfILM6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 08:58:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw50v042538;
        Thu, 12 Sep 2019 07:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568293085;
        bh=Md8M6C/5fcIIHW4WyL1FaD2la3jOpxa5UdVyo/9GuZU=;
        h=From:To:CC:Subject:Date;
        b=yaQBiuQK+/wZ78f3u+ORC7XIhy2mQE1hfSgOSlNORO+hSrRwXRJ+xD0lgaclgA/SR
         wsa8Q/9f0vGyxEivb/bSa+igY5KjTTl8ztoudKhP8JcqDhh8Cts0aFaF/tJclliXJ3
         vVqjwW9qGnEhTLrVALwX/mCS/G4IXZGUQUmiKgC4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CCw58a105803
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 07:58:05 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 07:58:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 07:58:04 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw4Ze095654;
        Thu, 12 Sep 2019 07:58:04 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 0/6] media: i2c: ov2659: maintenance series
Date:   Thu, 12 Sep 2019 08:00:01 -0500
Message-ID: <20190912130007.4469-1-bparrot@ti.com>
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

Also on some board the 'powerdown' is not tied to always on so we add
support for an optional powerdown gpio.

Since these camera are removable on some board we alos need the driver
to actually fail when there is no hardware present so the driver is
actually removed.

Finally, we update the licensing statement to use SPDX licensing.

Benoit Parrot (6):
  media: i2c: ov2659: Fix for image wrap-around in lower resolution
  media: i2c: ov2659: Fix sensor detection to actually fail when device
    is not present
  media: dt-bindings: ov2659: add powerdown-gpios optional property
  media: i2c: ov2659: Add optional powerdown gpio handling
  media: i2c: ov2659: Fix missing 720p register config
  media: i2c: ov2659: Switch to SPDX Licensing

 .../devicetree/bindings/media/i2c/ov2659.txt  |  6 +++
 drivers/media/i2c/Kconfig                     |  2 +-
 drivers/media/i2c/ov2659.c                    | 40 +++++++++++--------
 3 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.17.1

