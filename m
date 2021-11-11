Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E359944DB18
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 18:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbhKKRay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 12:30:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:47818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234321AbhKKRaw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 12:30:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5C38610A2;
        Thu, 11 Nov 2021 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636651682;
        bh=fVWeNM/EkROzLgkEOagtV1bVZ4cBFHPDPoXfH7hX2iE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b04t9yWlvJRuOR91Dqy359Zxx3vihLWJzeIBHsSbeg+Q39SAljOBx/QChJXlpPB0i
         mOaKnn/3dTdDHtrleoX6tiSsi6FCuRq0NSR+s0SRSAG8JTlTehqyYfrfpbydYbzhJm
         NGS5Yi7MrO+9eaNKrti9ah36DOsgu/+EZuN0TEd2YtaXzoj52ZAWFf9D5aYCc83vfc
         PUeNoQP7+leSt37f9GQrMBWR+Bp6tNV+iRbENPMuufvFhERqmbXCFNxQnmA/uPV92a
         CCRPylP0ehjme0bt1CAemgW943hA6pgRRr3s5t1KYFm3H1F/64hR6KmZvlDOcwR6FK
         011h452aw0QDw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mlDrk-0001of-0C; Thu, 11 Nov 2021 17:28:00 +0000
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
Subject: [PATCH 2/3] media: atomisp-ov2680: adjust the maximum frame rate
Date:   Thu, 11 Nov 2021 17:27:57 +0000
Message-Id: <debf362a0fb0cd42a6c74cec9a720ed3052875f7.1636651027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1636651027.git.mchehab+huawei@kernel.org>
References: <cover.1636651027.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov2680 supports a maximum bandwidth of 660Mbps and allows
up to 60fps when the resolution is below 720p.

Adjust the sensor's table to reflect that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636651027.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/i2c/ov2680.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index cb3c37d1c38e..4e351196fe34 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -822,7 +822,7 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.fps = 30,
+		.fps = 60,
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
@@ -835,7 +835,7 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 	{
 		.width = 800,
 		.height = 600,
-		.fps = 30,
+		.fps = 60,
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
@@ -848,7 +848,7 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 	{
 		.width = 720,
 		.height = 592,
-		.fps = 30,
+		.fps = 60,
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
@@ -861,7 +861,7 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 	{
 		.width = 656,
 		.height = 496,
-		.fps = 30,
+		.fps = 60,
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
@@ -874,7 +874,7 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 	{
 		.width = 336,
 		.height = 256,
-		.fps = 30,
+		.fps = 60,
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
@@ -887,7 +887,7 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 	{
 		.width = 352,
 		.height = 288,
-		.fps = 30,
+		.fps = 60,
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
@@ -900,7 +900,7 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 	{
 		.width = 176,
 		.height = 144,
-		.fps = 30,
+		.fps = 60,
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
 		.lines_per_frame = 1294,
-- 
2.33.1

