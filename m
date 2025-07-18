Return-Path: <linux-media+bounces-38062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7BB0A532
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 15:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A28C1C43051
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500AB2DCBE6;
	Fri, 18 Jul 2025 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyM2x3eh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB323507F;
	Fri, 18 Jul 2025 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845378; cv=none; b=Pii9stWuuRz7+u+FrS3iOXrQG91D4RBVQjamVIZIZE+JpUnwvhXpx7wzU5wIFa9WUQOcR4MBaVq0liiL+a3R4UswepKKkcs+b4yyy27stMA2Ia2NgZhDnAcxf6oxG9qy528At2X1VlqVqEHdxvXE1ppQZ9JUJu9i0wW+EX6eXBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845378; c=relaxed/simple;
	bh=9zAdNuMujNK7rK5zDyvK0DONlnXOhbHGzRZV3zSBitc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ODoO+NdG8umUd8snR9wd3ikJe+DE3kqT3jn9nVkojM4H8ZUmayLNCNqaTTZ4hAAyv47bil1cs0c86P58Es9dMlVr1AAlF3+sg+79n+k/pckLs3u2g2UxLoJbJeW85E+HCtPZd4T8hQC4WD6hfMQEEB9IsEBWgAVnj74rkWoqhR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyM2x3eh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2350b1b9129so14052365ad.0;
        Fri, 18 Jul 2025 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752845376; x=1753450176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=43GOBP/H9DxdSQ7s07hm8GW5mk8Errz/UJkcXIpPVPg=;
        b=CyM2x3ehHRbEKZmKIJOPUeiPr3OYsbChiXqTbZR/DPpI7QWreGfGF5GOjopKm8e3+n
         /OJZ8OVbQTDBNWuQwI5QYcnFC4sdVJta+qobxKr/0vVpQ5lyy/d27hHkmOYBBwDWS6vs
         tXJ1/PE2phOX7b39SKkYwvIoeMWyipdMei6W7iiJqaIjIXgN7CXqBH+QtyzXFkuMZ5l8
         eg12lVwj4hLJ2cCiPsXc0eJutejjzd0IfakuT5vNMFcrHk7himItCOhGCT20k3DCSJUT
         qiMURjuwczsRzwMWC29ThN4XLADfh1ar1eSnbnsAdnF0Zuh46jmPjIGR2v+RSzcuIjis
         +uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752845376; x=1753450176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43GOBP/H9DxdSQ7s07hm8GW5mk8Errz/UJkcXIpPVPg=;
        b=beiZ+nRdqSf/8Ih/lEJp/DtcR/hNyPTSzE9zl1B6hSuGtgFCEVFurRxiimyGkSN87V
         xqGMLLxs4+5U3EHvJsZeHDLV3gk6wajKV58iAdxJhtmVBadAuRb1Z0YKYk6FvxLDrfey
         xcJlH/aC9a+rL4YYsMkjBXa3RaPqqi7+3jIrXbwZceBqVdN4C/7cO0V1KhhwuWNEnSkA
         DEtAGm+xsnYvFfgSdiUXOrtAN6pUO+bM4+VE2Noib1n0ImpSxLOFF05CtG0f68mzRpsq
         fXjUndvuaRMPzYVP4tS0rpqB8TTkupoDIqjilmA8DVfZRoOfa1NOoFZjlsG/mP49yor6
         BZqA==
X-Forwarded-Encrypted: i=1; AJvYcCVEIJZmnpef++u2RgdqT5umz/Es2Sm0FIi7qYEDBFWWYiP+Sko381yIBlDWqXRYl/JbUupemLlKew22VAU=@vger.kernel.org, AJvYcCW2GBBArdH7RhLqet7pwhetLuLTU1QghDzJDSLQT7xPurOmDT/uWypZTSQHYSU4kDnS2wHNn6bHuInRW4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywce0A1M1W1YPos04+Q0Nq/NwmPDQXgYjO5ruw0EmIljp6W/h83
	uko+ihK5IgI/ShYqAL6gWaVN82nSqlY38h792oldUm2O38KriIDVxgJ8
X-Gm-Gg: ASbGnctp7XgEaHbJNnNvIQT0qPZ7dIaa8xle/I+98CblauEryoqTxN0+cuwSizO2081
	56uxQJwRyxiSdgeanBa9KUFQMtsV+Hnjp2e/Pvjuf+v1NLAy7+983zGZTAuFDV44fi8ei4XAyUL
	qJQIp66jK5o120mtgaHBv0LUyPtiBdn4YaZtsSiz2FyyJHCRq8B0q7MJpG+EbN9DUmMaKe7zCF9
	Yxq8jMyQ8Zu4OTFgT9yZ1eaj6KOOAX+BXRxzIrLNePAu7Fj908OQ1FI3NdinyyyEIbjv2bdtR5a
	VMHhAuRw5pgeSs6DtJ/zynbi6qyPFvR65Yuuj6rdF2yviFE1WbkPu55t//IHTyGwcI16ZhSqwjI
	DaB5Jgx/q56J1+dxOmwYCKc+KqbkNo3IGgg5MCMsiVN+RE3p784Bn4UmZKvkunVEqCpmqibTeOA
	==
X-Google-Smtp-Source: AGHT+IEXxtqwJ7/WCKe6hpmTwVqXwJmKGTfQMnbab1AEa2sLxKhDjYCk92WfWge749OlkwUzAGQ3ow==
X-Received: by 2002:a17:902:ce81:b0:23c:7b9e:163e with SMTP id d9443c01a7336-23e25685233mr131078065ad.11.1752845376410;
        Fri, 18 Jul 2025 06:29:36 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([49.36.68.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d239dsm13265945ad.155.2025.07.18.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:29:36 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-core: dvb_demux: Fix assignments in if conditions
Date: Fri, 18 Jul 2025 13:29:27 +0000
Message-ID: <20250718132929.95115-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code in dvb_demux.c has multiple instances where a variable is
assigned a value inside the conditional part of an 'if' statement.
This practice is prohibited by the Linux kernel coding style to avoid
potential bugs arising from accidental assignments (e.g., '=' instead
of '==').

This patch refactors these instances by moving the assignment out of
the 'if' statement and onto the preceding line. This makes the code
clearer, safer, and compliant with checkpatch.pl.

Additionally, a minor whitespace issue in a function signature is also
corrected. This is a purely stylistic change with no functional impact.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/media/dvb-core/dvb_demux.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 7c4d86bfdd6c..c93a3110a05d 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -744,7 +744,8 @@ static int dmx_ts_feed_start_filtering(struct dmx_ts_feed *ts_feed)
 		return -ENODEV;
 	}
 
-	if ((ret = demux->start_feed(feed)) < 0) {
+	ret = demux->start_feed(feed);
+	if (ret < 0) {
 		mutex_unlock(&demux->mutex);
 		return ret;
 	}
@@ -797,7 +798,8 @@ static int dvbdmx_allocate_ts_feed(struct dmx_demux *dmx,
 	if (mutex_lock_interruptible(&demux->mutex))
 		return -ERESTARTSYS;
 
-	if (!(feed = dvb_dmx_feed_alloc(demux))) {
+	feed = dvb_dmx_feed_alloc(demux);
+	if (!feed) {
 		mutex_unlock(&demux->mutex);
 		return -EBUSY;
 	}
@@ -817,7 +819,8 @@ static int dvbdmx_allocate_ts_feed(struct dmx_demux *dmx,
 	(*ts_feed)->stop_filtering = dmx_ts_feed_stop_filtering;
 	(*ts_feed)->set = dmx_ts_feed_set;
 
-	if (!(feed->filter = dvb_dmx_filter_alloc(demux))) {
+	feed->filter = dvb_dmx_filter_alloc(demux);
+	if (!feed->filter) {
 		feed->state = DMX_STATE_FREE;
 		mutex_unlock(&demux->mutex);
 		return -EBUSY;
@@ -923,7 +926,8 @@ static void prepare_secfilters(struct dvb_demux_feed *dvbdmxfeed)
 	struct dmx_section_filter *sf;
 	u8 mask, mode, doneq;
 
-	if (!(f = dvbdmxfeed->filter))
+	f =  dvbdmxfeed->filter;
+	if (!f)
 		return;
 	do {
 		sf = &f->filter;
@@ -970,7 +974,8 @@ static int dmx_section_feed_start_filtering(struct dmx_section_feed *feed)
 
 	prepare_secfilters(dvbdmxfeed);
 
-	if ((ret = dvbdmx->start_feed(dvbdmxfeed)) < 0) {
+	ret = dvbdmx->start_feed(dvbdmxfeed);
+	if (ret < 0) {
 		mutex_unlock(&dvbdmx->mutex);
 		return ret;
 	}
@@ -1057,7 +1062,8 @@ static int dvbdmx_allocate_section_feed(struct dmx_demux *demux,
 	if (mutex_lock_interruptible(&dvbdmx->mutex))
 		return -ERESTARTSYS;
 
-	if (!(dvbdmxfeed = dvb_dmx_feed_alloc(dvbdmx))) {
+	dvbdmxfeed = dvb_dmx_feed_alloc(dvbdmx);
+	if (!dvbdmxfeed) {
 		mutex_unlock(&dvbdmx->mutex);
 		return -EBUSY;
 	}
@@ -1223,7 +1229,7 @@ static int dvbdmx_disconnect_frontend(struct dmx_demux *demux)
 	return 0;
 }
 
-static int dvbdmx_get_pes_pids(struct dmx_demux *demux, u16 * pids)
+static int dvbdmx_get_pes_pids(struct dmx_demux *demux, u16 *pids)
 {
 	struct dvb_demux *dvbdemux = (struct dvb_demux *)demux;
 
-- 
2.43.0


