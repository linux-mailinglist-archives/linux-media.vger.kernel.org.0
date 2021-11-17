Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A0C454397
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbhKQJ2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:58780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230023AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD93E63232;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141141;
        bh=aUPiYCDUwKB6bNqDA0Cf5w1oo28ROTPeXygKxFoKl3o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jb+ODaijIjJEFWl8GTm5lVeuAz/I5S6Z0OuyKUnbZrrVwQsOthVHGgE5U82yZZetA
         BLwn0RP0TrsfP+fRK6y43tSm/PplQnjVGOLm2NJlcIz/gxQD7AFpuXijAQMdw1pMyZ
         XeyL+MCpFC8FHTn30xiZ+Wh75Pe+bJWlS3YoE2uFMlJgRuN7xeUoe0Lvqi9X3cuA0u
         rRV3mrf7zxom2pOueBjrO0ImNuIesqFdRq6EagCPaon8sH0aXRyXs1R5XuxePMhj6Q
         JxL+s+bVNRlE/4c0UiI5GHQSNOTz77Jnbh/aYyPI+l+MiYcpara0F14kMwPPfPueiu
         ZuD4N6F+x/KqA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb5y-A8; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 08/13] media: atomisp: get rid of USE_WINDOWS_BINNING_FACTOR tests
Date:   Wed, 17 Nov 2021 09:25:33 +0000
Message-Id: <2a5327d6435054061e4be9c30ab8a63ce3a9d9ac.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is meant to select a platform-dependent factor between
Linux and Windows. It makes no sense to keep it on Kernel.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/ia_css_stream_public.h  | 10 ++++-----
 .../media/atomisp/pci/sh_css_param_shading.c  | 22 -------------------
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index 649f22b03de8..47846ece8d64 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -102,12 +102,10 @@ struct ia_css_stream_config {
 		isys_config[IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH];
 	struct ia_css_stream_input_config input_config;
 
-	/* Currently, Android and Windows platforms interpret the binning_factor parameter
-	 * differently. In Android, the binning factor is expressed in the form
-	 * 2^N * 2^N, whereas in Windows platform, the binning factor is N*N
-	 * To use the Windows method of specification, the caller has to define
-	 * macro USE_WINDOWS_BINNING_FACTOR. This is for backward compatibility only
-	 * and will be deprecated. In the future,all platforms will use the N*N method
+	/*
+	 * Currently, Linux and Windows platforms interpret the binning_factor
+	 * parameter differently. In Linux, the binning factor is expressed
+	 * in the form 2^N * 2^N
 	 */
 	/* ISP2401 */
 	unsigned int sensor_binning_factor; /** Binning factor used by sensor
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 69cc4e423d8b..51d83ce0d9cb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -271,33 +271,11 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 		      bds_denominator -
 		      binary->info->sp.pipeline.top_cropping;
 
-#if !defined(USE_WINDOWS_BINNING_FACTOR)
-	/* @deprecated{This part of the code will be replaced by the code
-	 * in the #else section below to make the calculation same across
-	 * all platforms.
-	 * Android and Windows platforms interpret the binning_factor parameter
-	 * differently. In Android, the binning factor is expressed in the form
-	 * 2^N * 2^N, whereas in Windows platform, the binning factor is N*N}
-	 */
-
-	/* We take into account the binning done by the sensor. We do this
-	   by cropping the non-binned part of the shading table and then
-	   increasing the size of a grid cell with this same binning factor. */
-	input_width  <<= sensor_binning;
-	input_height <<= sensor_binning;
-	/* We also scale the padding by the same binning factor. This will
-	   make it much easier later on to calculate the padding of the
-	   shading table. */
-	left_padding  <<= sensor_binning;
-	right_padding <<= sensor_binning;
-	top_padding   <<= sensor_binning;
-#else
 	input_width   *= sensor_binning;
 	input_height  *= sensor_binning;
 	left_padding  *= sensor_binning;
 	right_padding *= sensor_binning;
 	top_padding   *= sensor_binning;
-#endif /*USE_WINDOWS_BINNING_FACTOR*/
 
 	/* during simulation, the used resolution can exceed the sensor
 	   resolution, so we clip it. */
-- 
2.33.1

