Return-Path: <linux-media+bounces-66375-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vb+FH7dvRmo8VAsAu9opvQ
	(envelope-from <linux-media+bounces-66375-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 16:03:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA9C6F8A96
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 16:03:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kxwzWZoe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66375-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66375-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9493D3137205
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098AC4ADDAF;
	Thu,  2 Jul 2026 13:56:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lr2-f2.google.com (mail-lr2-f2.google.com [74.125.230.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6FD4ADDA8
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 13:56:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000585; cv=none; b=ZvcZr/TiTlCfXAhBolTtMSn5msX+ew66roemMmFUxbep0VL+b3HGVZKDyqLY0KpowCLvfhFSNvhTuJ3G7J0SKe4+A1Zc+bLS7y4VeXTdGtAq2NXTPK+l8TNkVoxkoEzVfRiz++QhLSgNDzZXey3qJSb+cH06vRpVdhbEV7uwxoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000585; c=relaxed/simple;
	bh=BfrxHYuUlb5DTUkfLTDPjkNjucBPhZj68vtPs+di8C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7uFZVeTAjMexRVcc16iu6jBT+G903oPF9gBFHWO+E8/EpGnMh0J6rQ5NKskmFpEyVmKqXNIT5u/EaupJa/0igMTC6TKaZIXFgIVvZY51PvvnPn3wnqrlfHEwFW5A+VwF3KpqiNKl86UPb0s12d0INfbg8LSxXGA3IRAJGXKBXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxwzWZoe; arc=none smtp.client-ip=74.125.230.66
Received: by mail-lr2-f2.google.com with SMTP id 38308e7fff4ca-39b430545e3so1171881fa.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783000582; x=1783605382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9TmNXT3Wq8aMPD04wKa9UiOCYJMfbSBZuVN/NXn9rA=;
        b=kxwzWZoexKIViQs9tsgic7YpqPvOaET0duP8GXF4dSzvlxS9oiCu4j3fAbETcsx90B
         yB5Vhs2HLbhEtPUD9h0m1MHjRDWCo6qxXyqseYSnRaTuGpwzd9yRd5TWsvIDp6cNlAeU
         Ss+l3MIO6MFh+rgtk/S7ee+NiQxUfM5fkdQ8eI2aYnwwHMVD6b2zy3NcIPKX3l5oLE3m
         Ry384IpIbVfC4hsrWrsimp45jUlhz8fxN7E0HPjoH24e6UWwZLsNdmrM/M9LxCO49RmN
         piXqJQ0WHLoUBP1RxxfdamuIqhEzN6GpCGSCnMFPVQ2nLK47Qst0iCp/S7Yv9Ph1oLmQ
         3Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000582; x=1783605382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9TmNXT3Wq8aMPD04wKa9UiOCYJMfbSBZuVN/NXn9rA=;
        b=K+rt/Fo0Vv9A70Zoe0KS8iKQEVDP8/MFehNd+3JTQrIjIfNB//b2e3+NwJiux6UMZw
         3tA347GR7hMXfMt9iY1XUJ763yI3AHLsL301YuKG7tS4Iq6jug+v+9RAxFFAvHMrqa30
         mryuMg35oIHfi0SBwbclFwqdrYi29I3Kt/S3ectWtMKJyHbiwTusFapfJHOW/5x0C0WA
         Y3Mrce2lZRJlUVYIlMus2P4cQezzyQoYJP4vasKgvSncO4vNagcvrAUXeHAI9pPHBcp4
         o6u/iUi1WZgl16YsStG8/fGc6Sbf9PlBCK/WG6noFTyeLojJkPYj0sGklpU6LdMSQwb8
         vx6w==
X-Gm-Message-State: AOJu0YxJzLNigziaX+HjnyTKhL7BgslikJ7sDrWaCzZyuQje760Ch6FJ
	nXFi+o4HQobLxFIS8eSocQVIQJGnjftADj6BE+zzWTSvDTxaRlTCX2EP
X-Gm-Gg: AfdE7cn/uYS5oO/jl4dhDyRc2PNFnJPkSL6rlZW6verW7aysGO0bjTYaL4oyL/w32vc
	3sdMm4DvdetMjVn30qmWzyCreA3wflp8Je/lD5Kd3TCOj75+XPzXd9vyS7vkhtKWdyHn2QdNQm1
	xVdCWqDc71tWq5/897bQQIEKdNrkgY4hH7fdN+R5YSpoiSN1mUT1XDmSkEThMw3YvxZp1VdPkI7
	hIXCvMqmgQbBKTZCeryeUyC/BkAI72D/O3RCZQdIH1IXfL9tR7sJz2ITz4Lh3kMFEivz8Y8hjKi
	9GC5kAcPdtWD7fnlV25gY9EkrMlYIpSaFj9BZRU5B9M1WQaWqc3o2rzwfCu/ARdHzd2yGa68AvK
	ExVHmzt05XXjSFbHYwwG54xnDCDOtLzJZzrVA2vZyyQ3VYaz7MG4hTndU7plQ3WhmEzSwbkyini
	S8Twx1Y4np
X-Received: by 2002:a05:6512:1194:b0:5ad:6989:ab36 with SMTP id 2adb3069b0e04-5aec8005b33mr1591640e87.29.1783000581724;
        Thu, 02 Jul 2026 06:56:21 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89919bcsm720820e87.11.2026.07.02.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:56:20 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH 3/3] media: atomisp: fix block comment formatting in ia_css_timer.h
Date: Thu,  2 Jul 2026 16:52:30 +0300
Message-ID: <20260702135230.19030-4-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702135230.19030-1-bohdandmarcus@gmail.com>
References: <20260702135230.19030-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66375-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:bohdandmarcus@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FA9C6F8A96

Fix block comment formatting issues reported by checkpatch.pl
in ia_css_timer.h by ensuring block comments use '*' on subsequent
lines and aligning them properly to conform to the Linux kernel
coding style guidelines. Also, remove misplaced Kernel-doc tags
from macro definitions and correct function signature formatting.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 .../staging/media/atomisp/pci/ia_css_timer.h  | 49 +++++++++++--------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_timer.h b/drivers/staging/media/atomisp/pci/ia_css_timer.h
index da752834adf4..2e555b39bc25 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_timer.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_timer.h
@@ -1,23 +1,28 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /**
-Support for Intel Camera Imaging ISP subsystem.
-Copyright (c) 2010 - 2015, Intel Corporation.
-
-*/
+ * Support for Intel Camera Imaging ISP subsystem.
+ * Copyright (c) 2010 - 2015, Intel Corporation.
+ */
 
 #ifndef __IA_CSS_TIMER_H
 #define __IA_CSS_TIMER_H
 
-/* @file
+/*
+ * @file
  * Timer interface definitions
  */
-#include <type_support.h>		/* for uint32_t */
+#include <type_support.h>       /* for uint32_t */
 #include "ia_css_err.h"
 
-/* @brief timer reading definition */
+/*
+ * @brief timer reading definition
+ */
 typedef u32 clock_value_t;
 
-/* @brief 32 bit clock tick,(timestamp based on timer-value of CSS-internal timer)*/
+/*
+ * @brief 32 bit clock tick, (timestamp based on timer-value of
+ * CSS-internal timer)
+ */
 struct ia_css_clock_tick {
 	clock_value_t ticks; /** measured time in ticks.*/
 };
@@ -38,24 +43,26 @@ enum ia_css_tm_event {
 
 /* @brief code measurement common struct */
 struct ia_css_time_meas {
-	clock_value_t	start_timer_value;	/** measured time in ticks */
-	clock_value_t	end_timer_value;	/** measured time in ticks */
+	clock_value_t   start_timer_value;  /** measured time in ticks */
+	clock_value_t   end_timer_value;    /** measured time in ticks */
 };
 
-/**@brief SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT checks to ensure correct alignment for struct ia_css_clock_tick. */
+/*
+ * SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT checks to ensure correct
+ * alignment for struct ia_css_clock_tick.
+ */
 #define SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT sizeof(clock_value_t)
-/* @brief checks to ensure correct alignment for ia_css_time_meas. */
+
+/* checks to ensure correct alignment for ia_css_time_meas. */
 #define SIZE_OF_IA_CSS_TIME_MEAS_STRUCT (sizeof(clock_value_t) \
 					+ sizeof(clock_value_t))
 
-/* @brief API to fetch timer count directly
-*
-* @param curr_ts [out] measured count value
-* @return 0 if success
-*
-*/
-int
-ia_css_timer_get_current_tick(
-    struct ia_css_clock_tick *curr_ts);
+/*
+ * @brief API to fetch timer count directly
+ *
+ * @param curr_ts [out] measured count value
+ * @return 0 if success
+ */
+int ia_css_timer_get_current_tick(struct ia_css_clock_tick *curr_ts);
 
 #endif  /* __IA_CSS_TIMER_H */
-- 
2.55.0


