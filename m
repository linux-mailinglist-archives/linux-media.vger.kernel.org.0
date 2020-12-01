Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9CE2CA8AF
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390084AbgLAQtV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:49:21 -0500
Received: from retiisi.eu ([95.216.213.190]:50074 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389890AbgLAQtV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 11:49:21 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0C833634CAA;
        Tue,  1 Dec 2020 18:45:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 21/30] =?UTF-8?q?ccs:=20Allow=20range=20in=20between=20?= =?UTF-8?q?I=C2=B2C=20retries?=
Date:   Tue,  1 Dec 2020 18:42:37 +0200
Message-Id: <20201201164246.18003-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the delay between I²C access retries a range between 1 and 2 ms. Also
make the number of retries 10 instead of 5, in order not to reduce the
total amount of time.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index aad2727570ec..79efed5e0dad 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -256,7 +256,7 @@ int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
 	put_unaligned_be16(CCS_REG_ADDR(reg), data);
 	put_unaligned_be32(val << (8 * (sizeof(val) - len)), data + 2);
 
-	for (retries = 0; retries < 5; retries++) {
+	for (retries = 0; retries < 10; retries++) {
 		/*
 		 * Due to unknown reason sensor stops responding. This
 		 * loop is a temporaty solution until the root cause
@@ -271,7 +271,7 @@ int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
 			return 0;
 		}
 
-		usleep_range(2000, 2000);
+		usleep_range(1000, 2000);
 	}
 
 	dev_err(&client->dev,
-- 
2.27.0

