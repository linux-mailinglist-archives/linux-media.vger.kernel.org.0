Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0353276143
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 21:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgIWToV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 15:44:21 -0400
Received: from mga06.intel.com ([134.134.136.31]:34824 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbgIWToV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 15:44:21 -0400
IronPort-SDR: q9wxlg4uMxNEvm/9rJTpwV5E2z1A4tnLRLURLu8WUNMIowmm7HOP31iMXCJjXKAU+K1eih9Lgj
 4hvjoOVCHnxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="222586564"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="222586564"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 12:44:20 -0700
IronPort-SDR: VGl03i4oOocVHNVaTF+XIl4Ki9i05XDbi/antbjsLNodX3vydQnKKh1kkPoMdkHVwJyw5Q1rOW
 XTRyC5T4wj4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="511116597"
Received: from viggo.jf.intel.com (HELO localhost.localdomain) ([10.54.77.144])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2020 12:44:20 -0700
Subject: [PATCH] media: fix Omnivision Intel MAINTAINERS entry
To:     linux-kernel@vger.kernel.org
Cc:     Dave Hansen <dave.hansen@linux.intel.com>, tian.shu.qiu@intel.com,
        shawnx.tu@intel.com, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, mchehab@kernel.org
From:   Dave Hansen <dave.hansen@linux.intel.com>
Date:   Wed, 23 Sep 2020 12:33:56 -0700
Message-Id: <20200923193356.188D717D@viggo.jf.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


From: Dave Hansen <dave.hansen@linux.intel.com>

Tianshu Qiu has three MAINTAINERS entries, and one typo.  After being
notified if the typo a few months ago, they didn't act, so here's a
patch.

Tianshu, an ack would be appreciated.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: Shawn Tu <shawnx.tu@intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
---

 b/MAINTAINERS |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN MAINTAINERS~bad-intel-maintainers MAINTAINERS
--- a/MAINTAINERS~bad-intel-maintainers	2020-09-23 12:24:01.585676846 -0700
+++ b/MAINTAINERS	2020-09-23 12:25:02.959676693 -0700
@@ -12766,7 +12766,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov2685.c
 
 OMNIVISION OV2740 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiua@intel.com>
+M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 R:	Shawn Tu <shawnx.tu@intel.com>
 R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
_
