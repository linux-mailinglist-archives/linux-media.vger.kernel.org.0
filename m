Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4815CCC18B
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 19:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388076AbfJDRWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 13:22:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38046 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfJDRWN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 13:22:13 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94HM86k095361;
        Fri, 4 Oct 2019 12:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570209728;
        bh=AobMfyABZdhKXxitkOoKghAR25XU6nfrNWqRGUcxS8w=;
        h=From:To:CC:Subject:Date;
        b=G/qHf1b0NlXv+RXXmzYgKyMh7UigZN7NdqQ1XFma5BhPprOvhirGD2Yr0+rmXRzsW
         cOPmL3Jy4jR6wWUMbWZt3pZfqQLh/J+hCWldtRivyU3x7GHzKs6vkG+h/QytNaY4V0
         mXR4zHZYVpxuHCOrLAR8Qtf5CxkoYqFaP4oCKhII=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94HM8DB006897
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 12:22:08 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 12:22:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 12:22:07 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94HM7Va041112;
        Fri, 4 Oct 2019 12:22:07 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 0/3] media: ov5640: updates
Date:   Fri, 4 Oct 2019 12:24:15 -0500
Message-ID: <20191004172418.2339-1-bparrot@ti.com>
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

Changes since v2:
- Addressed comment from Sakari and Jacopo.
- Make use of the calc_pixel_rate in set_mode also
- Cleaned up the pixel_rate ctrl struct
- Fix the fps condition checking for the max resolution case

Changes since v1:
- Addressed comment from Sakari.
  added a function to calculate the pixel rate and remove the need to
  cache its value

Benoit Parrot (3):
  media: ov5640: add PIXEL_RATE control
  media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
  media: ov5640: Make 2592x1944 mode only available at 15 fps

 drivers/media/i2c/ov5640.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

-- 
2.17.1

