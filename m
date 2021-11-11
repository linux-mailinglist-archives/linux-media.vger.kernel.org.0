Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D687A44D47A
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 10:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbhKKKAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 05:00:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:45264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230358AbhKKKAM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 05:00:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D478D61107;
        Thu, 11 Nov 2021 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636624643;
        bh=Dbmpxl/hgypg3IsYM0mzq4CDNW9iJBlNW8cqKaLE/c0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RqmijOfJWPpud5dSkj/9SaCUNudP5cy6KRBMKL+jyGCWZssTN7KcakE5UoGngXirh
         9c1DEHOmFz8fWI6ZQQJfZ08odnXGZtD+xh2tJnrQK8IwhB94PswiEiQYSA2AluhUIA
         IzD/LHQU/Fq5PiPdBc2CAUTPiseVCQOGEpqWpgshLe0/LxpUTTLH7po9825ohWyxsy
         tm2vJHQgoC9Q5Ae4AzOmcvD45aPsv9WMAVhoMuAzOaKQrTL5/932u7PuiZ/Y8ML9ue
         yirltBnn5m81TNRYZGstGk3F+LDBd/UlaQIF+CRTydOMvNtYsaDCys2ROFkPkcQfUI
         8m/O6OjYU44DA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ml6pc-004vRb-Qj; Thu, 11 Nov 2021 09:57:20 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/2] media: atomisp-ov2680: remove some unused fields
Date:   Thu, 11 Nov 2021 09:57:19 +0000
Message-Id: <832599e3d2c0d6d0683ccfcc728d68e5513c6210.1636624633.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <440a1ecd3e1ef3a58bff40cde2ae57a32e5b0f60.1636624633.git.mchehab+huawei@kernel.org>
References: <440a1ecd3e1ef3a58bff40cde2ae57a32e5b0f60.1636624633.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor resolution arrays have two unused fields. Drop them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 26 ----------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index ed68510bb0b9..cb3c37d1c38e 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -141,7 +141,6 @@ struct regval_list {
 };
 
 struct ov2680_resolution {
-	u8 *desc;
 	const struct ov2680_reg *regs;
 	int res;
 	int width;
@@ -154,7 +153,6 @@ struct ov2680_resolution {
 	u8 bin_factor_x;
 	u8 bin_factor_y;
 	u8 bin_mode;
-	bool used;
 };
 
 struct ov2680_format {
@@ -757,12 +755,10 @@ static struct ov2680_reg const ov2680_1616x1216_30fps[] = {
 
 static struct ov2680_resolution ov2680_res_preview[] = {
 	{
-		.desc = "ov2680_1616x1216_30fps",
 		.width = 1616,
 		.height = 1216,
 		.pix_clk_freq = 66,
 		.fps = 30,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -772,12 +768,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_1616x1216_30fps,
 	},
 	{
-		.desc = "ov2680_1616x1082_30fps",
 		.width = 1616,
 		.height = 1082,
 		.pix_clk_freq = 66,
 		.fps = 30,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -787,12 +781,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_1616x1082_30fps,
 	},
 	{
-		.desc = "ov2680_1616x916_30fps",
 		.width = 1616,
 		.height = 916,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -802,12 +794,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_1616x916_30fps,
 	},
 	{
-		.desc = "ov2680_1456x1096_30fps",
 		.width = 1456,
 		.height = 1096,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -817,12 +807,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_1456x1096_30fps,
 	},
 	{
-		.desc = "ov2680_1296x976_30fps",
 		.width = 1296,
 		.height = 976,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -832,12 +820,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_1296x976_30fps,
 	},
 	{
-		.desc = "ov2680_720p_30fps",
 		.width = 1280,
 		.height = 720,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -847,12 +833,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_720p_30fps,
 	},
 	{
-		.desc = "ov2680_800x600_30fps",
 		.width = 800,
 		.height = 600,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -862,12 +846,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_800x600_30fps,
 	},
 	{
-		.desc = "ov2680_720x592_30fps",
 		.width = 720,
 		.height = 592,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -877,12 +859,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_720x592_30fps,
 	},
 	{
-		.desc = "ov2680_656x496_30fps",
 		.width = 656,
 		.height = 496,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -892,12 +872,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_656x496_30fps,
 	},
 	{
-		.desc = "ov2680_QVGA_30fps",
 		.width = 336,
 		.height = 256,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -907,12 +885,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_QVGA_30fps,
 	},
 	{
-		.desc = "ov2680_CIF_30fps",
 		.width = 352,
 		.height = 288,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
@@ -922,12 +898,10 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_CIF_30fps,
 	},
 	{
-		.desc = "ov2680_QCIF_30fps",
 		.width = 176,
 		.height = 144,
 		.fps = 30,
 		.pix_clk_freq = 66,
-		.used = 0,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
 		.bin_factor_x = 0,
-- 
2.33.1

