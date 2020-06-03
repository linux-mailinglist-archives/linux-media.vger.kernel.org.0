Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB7C1ECA01
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgFCHBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:43306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgFCHBI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C3A82068D;
        Wed,  3 Jun 2020 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167668;
        bh=q0nX/UNQT0ZCFaid6ekG7qC7jRPZL13y0p5z+VwqQmA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sEKdzMiUU58/vvw4Ziz8MMH4cQMvFiaqOT2NhPHaj0UuH6wmQ09zje616b4D0PYlo
         xIC6HZ+cUftW3Rsvywd5iF2LrkUjFmHqBuirsXSvKC4kWYrw8BvglUbgxk39nGpzy7
         PPRiJ0N04gH+EIqbvfJR0q8mlIUBOwmwbrRf2xU8=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8k-IT; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/15] media: atomisp: use macros from intel-family.h
Date:   Wed,  3 Jun 2020 09:00:56 +0200
Message-Id: <965cadd19363e32bd885e195276dd366a4a0b24a.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of hardcoding the intel family values there, use
the already defined ones from asm/intel-family.h.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/include/linux/atomisp_platform.h     | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 4bf76a780b6d..395d7c022ad1 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -18,6 +18,8 @@
 #ifndef ATOMISP_PLATFORM_H_
 #define ATOMISP_PLATFORM_H_
 
+#include <asm/intel-family.h>
+
 #include <linux/i2c.h>
 #include <linux/sfi.h>
 #include <media/v4l2-subdev.h>
@@ -240,9 +242,9 @@ const struct atomisp_camera_caps *atomisp_get_default_camera_caps(void);
 		     boot_cpu_data.x86 == 6 &&                       \
 		     boot_cpu_data.x86_model == x)
 
-#define IS_MFLD	__IS_SOC(0x27)
-#define IS_BYT	__IS_SOC(0x37)
-#define IS_CHT	__IS_SOC(0x4C)
-#define IS_MOFD	__IS_SOC(0x5A)
+#define IS_MFLD	__IS_SOC(INTEL_FAM6_ATOM_SALTWELL_MID)
+#define IS_BYT	__IS_SOC(INTEL_FAM6_ATOM_SILVERMONT)
+#define IS_CHT	__IS_SOC(INTEL_FAM6_ATOM_AIRMONT)
+#define IS_MOFD	__IS_SOC(INTEL_FAM6_ATOM_AIRMONT_MID)
 
 #endif /* ATOMISP_PLATFORM_H_ */
-- 
2.26.2

