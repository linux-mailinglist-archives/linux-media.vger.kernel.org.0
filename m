Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92AC2C23BD
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732711AbgKXLHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:33802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732478AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E9E220C56;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=mSCbc3vL0OUX7iyPLgs3eJ/2EFx5dLTtpikJrDdQUII=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pnAa8VuUi02monrp10DHFGtpF/BK6Gj4KQuojdHQ8FfdZbq8fAlepQu7MbHzjZIcJ
         Rd5fcFUKNDxY0702bol9TxRYo7UCQ1AD+aP3xb3Hytwz9CeKF4dB3RKRRsVLl96BPe
         9k6hiM3VIanqRqqOdMs7ZccRnOv+zYJAzhaCfcFg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000FaA-38; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 19/31] media: vidtv: add date to the current event
Date:   Tue, 24 Nov 2020 12:06:15 +0100
Message-Id: <6903ce43bd507de685ac97e18aed8e0dc1f76c33.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current event is using an undefined date. Instead, it
should be the timestamp when the EIT table was generated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 44 ++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 77bb560342a6..92fdf1149f0d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -11,13 +11,16 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
 
+#include <linux/bcd.h>
 #include <linux/crc32.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/printk.h>
 #include <linux/ratelimit.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/string.h>
+#include <linux/time.h>
 #include <linux/types.h>
 
 #include "vidtv_common.h"
@@ -1953,16 +1956,51 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 struct vidtv_psi_table_eit_event
 *vidtv_psi_eit_event_init(struct vidtv_psi_table_eit_event *head, u16 event_id)
 {
-	const u8 DURATION_ONE_HOUR[] = {1, 0, 0};
+	const u8 DURATION[] = {0x23, 0x59, 0x59}; /* BCD encoded */
 	struct vidtv_psi_table_eit_event *e;
+	struct timespec64 ts;
+	struct tm time;
+	int mjd, l;
+	__be16 mjd_be;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
 		return NULL;
 
 	e->event_id = cpu_to_be16(event_id);
-	memset(e->start_time, 0xff, sizeof(e->start_time)); //todo: 0xff means 'unspecified'
-	memcpy(e->duration, DURATION_ONE_HOUR, sizeof(e->duration)); //todo, default to this for now
+
+	ts = ktime_to_timespec64(ktime_get_real());
+	time64_to_tm(ts.tv_sec, 0, &time);
+
+	/* Convert date to Modified Julian Date - per EN 300 468 Annex C */
+	if (time.tm_mon < 2)
+		l = 1;
+	else
+		l = 0;
+
+	mjd = 14956 + time.tm_mday;
+	mjd += (time.tm_year - l) * 36525 / 100;
+	mjd += (time.tm_mon + 2 + l * 12) *306001 / 10000;
+	mjd_be = cpu_to_be16(mjd);
+
+	/*
+	 * Store MJD and hour/min/sec to the event.
+	 *
+	 * Let's make the event to start on a full hour
+	 */
+	memcpy(e->start_time, &mjd_be, sizeof(mjd_be));
+	e->start_time[2] = bin2bcd(time.tm_hour);
+	e->start_time[3] = 0;
+	e->start_time[4] = 0;
+
+	/*
+	 * TODO: for now, the event will last for a day. Should be
+	 * enough for testing purposes, but if one runs the driver
+	 * for more than that, the current event will become invalid.
+	 * So, we need a better code here in order to change the start
+	 * time once the event expires.
+	 */
+	memcpy(e->duration, DURATION, sizeof(e->duration));
 
 	e->bitfield = cpu_to_be16(RUNNING << 13);
 
-- 
2.28.0

