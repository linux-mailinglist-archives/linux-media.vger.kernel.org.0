Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6D5BE11F
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 17:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439421AbfIYPU5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 11:20:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35402 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfIYPU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 11:20:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PFKsrI125193;
        Wed, 25 Sep 2019 10:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569424854;
        bh=1TPs+PNmYkoQWTZgbmCZluJSZbvWjeIv343i7k1kfn8=;
        h=From:To:CC:Subject:Date;
        b=sOJctlcWMYelI8YA5Mz4YiPJxO1hppFiVtNyeHKy5riTEfFJCnuft1dyTfttIaOZJ
         TXS3tsXgYSLQUKR26sN2eCkkLDa46dlo6ih5XWlzL6nDb6AP2Tj/LsVdIKnj/tWFkR
         sJ5dPaxbHikCVP/YoQY1j1iuRqKDbSNcEF0fD6wU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PFKsQB128695
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Sep 2019 10:20:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 10:20:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 10:20:47 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PFKssn047659;
        Wed, 25 Sep 2019 10:20:54 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 0/3] media: ov5640: updates
Date:   Wed, 25 Sep 2019 10:22:58 -0500
Message-ID: <20190925152301.21645-1-bparrot@ti.com>
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

Benoit Parrot (3):
  media: ov5640: add PIXEL_RATE control
  media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
  media: ov5640: Make 2592x1944 mode only available at 15 fps

 drivers/media/i2c/ov5640.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

-- 
2.17.1

