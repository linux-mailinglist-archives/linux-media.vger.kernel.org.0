Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14745447467
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhKGRTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29752 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235942AbhKGRTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AZE+SwkuPYRErMSs9z2ne7lj3jBCy4dZV1VKcSaj8j4=;
        b=J0AcOF56MPtQ8H1OrnDOyEBiIk1GTsXpDdbDkjGa9G348bH6YI+yQvZmMlQc8nsbDkjMFa
        2Cn+/pIWgAU1IOX84Vva+U/LEnblq8PQZmffO7XY5iDBtSWnuiRb+Q8T2B48ik48a4y9RG
        8ynK94+K9sCLZfcpvMprjIncDBg9HOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-brC9p_KtOhCPAEauaNudKw-1; Sun, 07 Nov 2021 12:16:24 -0500
X-MC-Unique: brC9p_KtOhCPAEauaNudKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2526B15720;
        Sun,  7 Nov 2021 17:16:23 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 220A857CD3;
        Sun,  7 Nov 2021 17:16:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 10/11] media: atomisp-ov2680: Fix ov2680_set_fmt() clobbering the exposure
Date:   Sun,  7 Nov 2021 18:15:48 +0100
Message-Id: <20211107171549.267583-11-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we restore the default or last user set exposure setting on
power_up() there is no need for the registers written by ov2680_set_fmt()
to write to the exposure register.

Not doing so fixes the exposure always being reset to the value from
the res->regs array after a set_fmt().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index ca20ce5aa285..d52b7fbe3c06 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -288,8 +288,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
  */
 static struct ov2680_reg const ov2680_QCIF_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -333,8 +331,6 @@ static struct ov2680_reg const ov2680_QCIF_30fps[] = {
  */
 static struct ov2680_reg const ov2680_CIF_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -376,8 +372,6 @@ static struct ov2680_reg const ov2680_CIF_30fps[] = {
  */
 static struct ov2680_reg const ov2680_QVGA_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -419,8 +413,6 @@ static struct ov2680_reg const ov2680_QVGA_30fps[] = {
  */
 static struct ov2680_reg const ov2680_656x496_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -462,8 +454,6 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
  */
 static struct ov2680_reg const ov2680_720x592_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x26},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0x00}, // X_ADDR_START;
 	{0x3802, 0x00},
@@ -507,8 +497,6 @@ static struct ov2680_reg const ov2680_720x592_30fps[] = {
  */
 static struct ov2680_reg const ov2680_800x600_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x26},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -550,8 +538,6 @@ static struct ov2680_reg const ov2680_800x600_30fps[] = {
  */
 static struct ov2680_reg const ov2680_720p_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -593,8 +579,6 @@ static struct ov2680_reg const ov2680_720p_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1296x976_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -636,8 +620,6 @@ static struct ov2680_reg const ov2680_1296x976_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x90},
 	{0x3802, 0x00},
@@ -681,8 +663,6 @@ static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 
 static struct ov2680_reg const ov2680_1616x916_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -725,8 +705,6 @@ static struct ov2680_reg const ov2680_1616x916_30fps[] = {
 #if 0
 static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -768,8 +746,6 @@ static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1616x1216_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
-- 
2.31.1

