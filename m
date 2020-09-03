Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1B625C451
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 17:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgICPIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 11:08:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:47870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728950AbgICN6P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 09:58:15 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A8022098B;
        Thu,  3 Sep 2020 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599141456;
        bh=0yVg4VB9wLo7/HcSqfX02PS0qyjpPXXI+/tghmjqUsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eiHTsGhtSrD4YW+TVgEhxy20fyB9O40sXdCq83+iJZ5OqFJFUtSF2LTZVgGCGGcPb
         AdDPDkTTeF6INrEOOBBvmvuVcoX6bv8qPFj8bB1IQn6IX2QXAFiFnJyOcYdSz4bREr
         aB17Wr4DPXm/ofqlgjURq4iPLWnZEg5qVO5W3rb8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDpk6-004T6n-4b; Thu, 03 Sep 2020 15:57:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anant Thazhemadam <anant.thazhemadam@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] media: atomisp: print a warning if error while setting downscaler
Date:   Thu,  3 Sep 2020 15:57:29 +0200
Message-Id: <20d420b6ccec9c8013336437781da0f0c7ffabac.1599141140.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599141140.git.mchehab+huawei@kernel.org>
References: <cover.1599141140.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As warned by gcc:

    drivers/staging/media/atomisp//pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c:237:31: warning: variable ‘isp_data_ptr’ set but not used [-Wunused-but-set-variable]

ia_css_vf_configure() logic has an error var that detects troubles
when setting the kernel for downscaling. The driver just ignores
it, without producing any warning. Add at least a warning message
on such cases.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 3b850bb2d39d..dd3670972936 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -13,6 +13,8 @@
  * more details.
  */
 
+#include "atomisp_internal.h"
+
 #include "ia_css_vf.host.h"
 #include <assert_support.h>
 #include <ia_css_err.h>
@@ -129,6 +131,9 @@ ia_css_vf_configure(
 	const struct ia_css_binary_info *info = &binary->info->sp;
 
 	err = configure_kernel(info, out_info, vf_info, downscale_log2, &config);
+	if (err)
+		dev_warn(atomisp_dev, "Couldn't setup downscale\n");
+
 	configure_dma(&config, vf_info);
 
 	if (vf_info)
-- 
2.26.2

