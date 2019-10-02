Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 211FBC8A36
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 15:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfJBNt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 09:49:28 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:32874 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfJBNt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 09:49:27 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92DnPaO033215;
        Wed, 2 Oct 2019 08:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570024165;
        bh=m0eTUP8n14qmADnaaZUKpxX5BDyr0r+BD0dj4+lLke8=;
        h=From:To:CC:Subject:Date;
        b=JKTt5Ovj8gUBV5ttFNHCY+271Y/ryyXUusikacAsAahxc9rrYUkMy+t7ykfbUFlpa
         TQyG5cIZ5oLxvkJ5fGCCOtGddqmkV+rrNCTMX5xZ4ymLwcWDelxLJHdRFUjvZuR6dt
         RbnAySfhhmdc92O516vq8FHQLDOX2x4vYJR8cXfk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92DnPob082388
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 08:49:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 08:49:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 08:49:14 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92DnOm8035733;
        Wed, 2 Oct 2019 08:49:24 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 0/3] media: ov5640: updates
Date:   Wed, 2 Oct 2019 08:51:31 -0500
Message-ID: <20191002135134.12273-1-bparrot@ti.com>
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

First, it adds support for PIXEL_RATE control which is used by some
CSI2 receiver driver to properly set-up their DPHY.

Then we fix an issue related to having extra sensor enable/disable in
the register array for the 1920x1080 mode.

Finally we restrict the largest resolution which should only be
available at the lowest FPS.

Changes since v1:
- Addressed comment from Sakari.
  added a function to calculate the pixel rate and remove the need to
  cache its value

Benoit Parrot (3):
  media: ov5640: add PIXEL_RATE control
  media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
  media: ov5640: Make 2592x1944 mode only available at 15 fps

 drivers/media/i2c/ov5640.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

-- 
2.17.1

