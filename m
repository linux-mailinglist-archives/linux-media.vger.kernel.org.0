Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BAF1E8EAB
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgE3G4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728787AbgE3G4F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:05 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EA3B208FE;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=TIOaXsWSG7sEJuTqxa/iOgSPHzI2wAnWFU+P+tAaXCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2s9qZ+SIeiWKPzz4kCdekqUzm8qgexQ3hDkY1GWOhRQ06gF9IzYxC8sdp1iJjc7SX
         4JxdLcNerHgxssA5wTc2peqilSvSnB34AMkW08/0ps4F3TKzmwHQxwp6fczH+0DNH/
         7GmqY7Yn/1UYaz674b1YVbrzhEnuYhAUcpZpwNAQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hov-Vl; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/41] media: atomisp: use Yocto Aero default hmm pool sizes
Date:   Sat, 30 May 2020 08:55:28 +0200
Message-Id: <76f602ad6fcd43480976fde6e7dd7b4c6edfa074.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yocto Aero driver has a different default for hmm pools.

Use the definitions there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d795fe49130c..b30a2e54067c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -56,21 +56,21 @@ module_param(skip_fwload, uint, 0644);
 MODULE_PARM_DESC(skip_fwload, "Skip atomisp firmware load");
 
 /* set reserved memory pool size in page */
-static unsigned int repool_pgnr;
+static unsigned int repool_pgnr = 32768;
 module_param(repool_pgnr, uint, 0644);
 MODULE_PARM_DESC(repool_pgnr,
-		 "Set the reserved memory pool size in page (default:0)");
+		 "Set the reserved memory pool size in page (default:32768)");
 
 /* set dynamic memory pool size in page */
 unsigned int dypool_pgnr = UINT_MAX;
 module_param(dypool_pgnr, uint, 0644);
 MODULE_PARM_DESC(dypool_pgnr,
-		 "Set the dynamic memory pool size in page (default:0)");
+		 "Set the dynamic memory pool size in page (default: unlimited)");
 
-bool dypool_enable;
+bool dypool_enable = true;
 module_param(dypool_enable, bool, 0644);
 MODULE_PARM_DESC(dypool_enable,
-		 "dynamic memory pool enable/disable (default:disable)");
+		 "dynamic memory pool enable/disable (default:enabled)");
 
 /* memory optimization: deferred firmware loading */
 bool defer_fw_load;
-- 
2.26.2

