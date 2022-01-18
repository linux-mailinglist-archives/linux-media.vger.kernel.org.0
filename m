Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB5D49144B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jan 2022 03:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbiARCVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 21:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244657AbiARCVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 21:21:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA546C061751;
        Mon, 17 Jan 2022 18:21:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 78A37612D2;
        Tue, 18 Jan 2022 02:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B8BC36AEB;
        Tue, 18 Jan 2022 02:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642472461;
        bh=oXLBzOz/hkAg5gBd5Fy/0nL79/vChLwPGP35T3oMc8g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d5iDy13SF/J/i8KC01zxUpXARK7ZMn95VSyfbdDD1qOo8Vaddoe+Cf+5rRgmSZyWt
         Jz42GNextMqm2B9eT/V35szKHJ4Yff1Bi4LXZo7IkauIXzOxICIZqkdRuO9gE0MMn+
         QY/AfHbNiN4+nMvL4pUaqivT1yZV10Whf2e4PuH8O+XivY5e7sWJIoKI1SoD5J1dLK
         VK4MS+7DzNfUZsSrARkSnf2pe0xAyMQWN8RyyQkHqxIhDn2et0sCTYO1VrX8V6gnvJ
         fuIqolr6ui3uqU34/v3ToEAcsnqN2M+X9XH7JNjShjmGHyfcB7QEo7AQcbv48nV9sY
         0wiu0Q6sdX4SQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        drv@mailo.com, rdunlap@infradead.org, unixbhaskar@gmail.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.16 021/217] media: atomisp-ov2680: Fix ov2680_set_fmt() clobbering the exposure
Date:   Mon, 17 Jan 2022 21:16:24 -0500
Message-Id: <20220118021940.1942199-21-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 4492289c31364d28c2680b43b18883385a5d216c ]

Now that we restore the default or last user set exposure setting on
power_up() there is no need for the registers written by ov2680_set_fmt()
to write to the exposure register.

Not doing so fixes the exposure always being reset to the value from
the res->regs array after a set_fmt().

Link: https://lore.kernel.org/linux-media/20211107171549.267583-11-hdegoede@redhat.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 874115f35fcad..798b28e134b64 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -289,8 +289,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
  */
 static struct ov2680_reg const ov2680_QCIF_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -334,8 +332,6 @@ static struct ov2680_reg const ov2680_QCIF_30fps[] = {
  */
 static struct ov2680_reg const ov2680_CIF_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -377,8 +373,6 @@ static struct ov2680_reg const ov2680_CIF_30fps[] = {
  */
 static struct ov2680_reg const ov2680_QVGA_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -420,8 +414,6 @@ static struct ov2680_reg const ov2680_QVGA_30fps[] = {
  */
 static struct ov2680_reg const ov2680_656x496_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -463,8 +455,6 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
  */
 static struct ov2680_reg const ov2680_720x592_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x26},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0x00}, // X_ADDR_START;
 	{0x3802, 0x00},
@@ -508,8 +498,6 @@ static struct ov2680_reg const ov2680_720x592_30fps[] = {
  */
 static struct ov2680_reg const ov2680_800x600_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x26},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -551,8 +539,6 @@ static struct ov2680_reg const ov2680_800x600_30fps[] = {
  */
 static struct ov2680_reg const ov2680_720p_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -594,8 +580,6 @@ static struct ov2680_reg const ov2680_720p_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1296x976_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -637,8 +621,6 @@ static struct ov2680_reg const ov2680_1296x976_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x90},
 	{0x3802, 0x00},
@@ -682,8 +664,6 @@ static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 
 static struct ov2680_reg const ov2680_1616x916_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -726,8 +706,6 @@ static struct ov2680_reg const ov2680_1616x916_30fps[] = {
 #if 0
 static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -769,8 +747,6 @@ static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1616x1216_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
-- 
2.34.1

