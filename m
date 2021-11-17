Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6740845445F
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbhKQKAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:00:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:35324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235774AbhKQJ7z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58E4A63241;
        Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637143017;
        bh=DyIL10MCcTV9jH/O3TzfPl+cEqojfgD+LwVTcug20bc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jTtxIZd4S109Hj53DHBhXTeqmb/oVB8Ao66gpWnt3LS5g+uhUOvr/cQNAKRzNWiwG
         7KjWUkJEFL8pEaXL2lJ1shMPQTXAt8ayGZpkNdf0DZfwEipNPAAiIhpUhEmO+FlL/k
         5k5sXY8XmmtidUWLT9Qb/ODPylAYWDhmQnTSk4sXxiy7KZJmzxPQudPF8zB81EA/ly
         vD6T12w9jOwiJHSBiANXo0A0OkBzWoWyPgeSFeYKmh+ssFSG4/FKlQQAxeXUw8iIc1
         BKlYrykT2CTo9ZmdrnEChe0OeN4I8C6oJeO0iQm+UQKBGW3+oJZZW/5lUin3ui3LbP
         Pv2gwXvhDdQKw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHgV-00DIUn-8B; Wed, 17 Nov 2021 09:56:55 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 08/12] media: atomisp: get rid of USE_WINDOWS_BINNING_FACTOR tests
Date:   Wed, 17 Nov 2021 09:56:50 +0000
Message-Id: <d7ab37bcddc7d7e13681dbb9841b455b0c0bdfe4.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
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
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/ia_css_stream_public.h     | 10 ++++------
 .../media/atomisp/pci/sh_css_param_shading.c     | 16 ----------------
 2 files changed, 4 insertions(+), 22 deletions(-)

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
index 69cc4e423d8b..dc433fd96d55 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -271,15 +271,6 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
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
 	/* We take into account the binning done by the sensor. We do this
 	   by cropping the non-binned part of the shading table and then
 	   increasing the size of a grid cell with this same binning factor. */
@@ -291,13 +282,6 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 	left_padding  <<= sensor_binning;
 	right_padding <<= sensor_binning;
 	top_padding   <<= sensor_binning;
-#else
-	input_width   *= sensor_binning;
-	input_height  *= sensor_binning;
-	left_padding  *= sensor_binning;
-	right_padding *= sensor_binning;
-	top_padding   *= sensor_binning;
-#endif /*USE_WINDOWS_BINNING_FACTOR*/
 
 	/* during simulation, the used resolution can exceed the sensor
 	   resolution, so we clip it. */
-- 
2.33.1

