Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975F21B4C91
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 20:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgDVSTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 14:19:54 -0400
Received: from retiisi.org.uk ([95.216.213.190]:42438 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725839AbgDVSTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 14:19:54 -0400
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id A9921634C87;
        Wed, 22 Apr 2020 21:19:15 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 1/1] MAINTAINERS: ipu3-imgu: Add Tian Shu and Bingbu as reviewers
Date:   Wed, 22 Apr 2020 21:17:07 +0300
Message-Id: <20200422181707.9247-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Bingbu Cao and Tian Shu Qiu as reviewers for the IPU3 ImgU driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>
Cc: Tian Shu Qiu <tian.shu.qiu@intel.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 297197b05562..f24deb7343bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8648,6 +8648,8 @@ F:	drivers/media/pci/intel/ipu3/
 
 INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bingbu Cao <bingbu.cao@intel.com>
+R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
-- 
2.20.1

