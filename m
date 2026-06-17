Return-Path: <linux-media+bounces-65074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bkf9KoUEMmoltwUAu9opvQ
	(envelope-from <linux-media+bounces-65074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E16696184
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rmLEyY3v;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65074-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65074-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0914F3051D03
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C87A30EF82;
	Wed, 17 Jun 2026 02:19:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC230C16A
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662775; cv=none; b=tuG4licKAqK0jJuAur112YkXuY3fEeGTXkahPg2kkAe8owtirmvAkeKDTZ/AtCPWxMEJf2q6Vzdl5Q88bt5G29O6OnuU1liM7j5q3WebqM6oBzgqFKSeYyc9Z9zyvwayUHXUF9LceXVYT8BsMued3Rk3jW5bfzERwEm5HGxWJ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662775; c=relaxed/simple;
	bh=TDjWMRcNp0N3jKm74dUEUCjAdZEK3lc7vjrsqpVkBMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8YSYa2rKgfhbGhk3jYmsT1nVNKk2XjhhT4rkJt00CGYXN8p2uYPv8941ZcluprAU8jv3VuXtg27g6DKRBI0tCWgXzOtK0DDcSmHEITP+HePAmYvDF/vF5WBDaQqyyfopd8jGYEuWo1z5c5ynp1AaWIz3hus7Ezfpx5ONCerUag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmLEyY3v; arc=none smtp.client-ip=209.85.222.182
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-915d64fead9so53552085a.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662771; x=1782267571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5adCbZjNc85uY/9brOf3vfwrOByakFrcAqPyeusAfU=;
        b=rmLEyY3vm2XjO+tfaPr46R4JpnazRI//NMaM4/BNyihHtPA/2laa8N7+8sOvTJ5+C8
         FLMyGMPbhYqgpYwT19sTVcgSeaoUKZu5YQ2S10WkhsxMAXT3xhRsIkD8k0JbXJ7AfSsf
         hBTD0snkVTNDT9gMcc415rFuUuOpJnbNlXVy971bHVbqxrr2MlSQHPe+xgBl0dnhu9Xx
         b1p49o0g6FPqXaoRD2T8wdsfsB3BOdM4DSCW35YyGJ+nMvAPBZDCH9ofn2Z0un38u49Y
         GZH0V9aX00nhmDYe9hfzpA/tosbcdp44I+uT7mmHBWYp4oIyS1kPrFUKnqoNyYOKbabK
         GjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662771; x=1782267571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d5adCbZjNc85uY/9brOf3vfwrOByakFrcAqPyeusAfU=;
        b=Zsow+qkglVkjIicqHU7mfDl8VjLUc64o1Ixr6Gkv6g5s4R7/i9CmwnQRMmME929yc1
         iVSY923eJ4J3eUdkng3NAYH1NnrspyMSMhIXtRUBdrClEwzaVcFLbz5bKQ9ZKpbd95RB
         JtAOIMbChvCi7nAUNxlpcMo8uWkLN4hdspiRcfA9xRNZc5/Po8vyVLsyYkcvBMMKYMsl
         QL9SrBbhDP98oIlpXjFzKF4t6UODpq8jKi4Y/jJMW4NYPpy8FIXxP14c+rbm3D50+ezm
         V5Bqa3W79JNGOveAMzN+E0S5bO0rdrcExW38HbIIoxhSo4mIBK+bKb/kBiE0VuPmSaZj
         KU0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+HMtnBtHIT72wHUSVqf5G3Z/6NXUSNLi0ucZjXB5Khlf5X3g3SP7nqRcKmD55yUjLk3jkRVL82S3sepA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzO/XkZth+aYdjRp+JCXyOKtAPhEmx6+BH0PyDDisKE2o0Lf7D
	Hr0IJx5aSonucvxr6KgSz/wLnZLnUt6JXnMwRhQrKwBFpZwB0YB4gGVs
X-Gm-Gg: Acq92OGlF+TkSkGuW6upyHLqkRta+hrynjKof1h+UiLC+i1ECU5thFJXvTSgeh3FIye
	RaMZBncp3hwa5YxGSybfk7ZaYznUZnZ0bNWPvyqq7kSwxyTEg896zOn08C3IpCR3EAMaMNfOn+U
	mA4YTHIe1c4x0ldbF2NQNWP9Z5YvrvyC2T6ftJlqwtf9E55QCsXSnzwN4Rs1FmRHHf/VcZgL1Z+
	VnlkmGkex3l916o2SJktk0H3kvPpMm/Z7m94sIE3jvw5xnTAEi58dCT4FQSSzZspKKRzXUv8Jla
	F9ijYud5hq7UdTogspUoKFex4lF4Y1Tor/BQE++S7ChCZ5tyOrj34oMpHDKcBUD3AgDEqw2qlC6
	0KWzyXe4kG7MmUlTxpvlB1OpF3VG/AkFlzn2t/TB6B9xiTm38PjDQd8e3hgjPY/zQOXLjp8SJkA
	sOcPIBQZlw6PfK+GhDOZYhFnmQ587me57Q9AhaXxvO8ISzPf6xLcTBVZM4yvDGNBW75V2ff9IhX
	uyFXBpOpH4MpBUOs6US5e3IYiZHWq1Y
X-Received: by 2002:a05:620a:1a0e:b0:916:5f5:de22 with SMTP id af79cd13be357-91dcabb0438mr183153085a.12.1781662771344;
        Tue, 16 Jun 2026 19:19:31 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:30 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] media: hevc: add bounded tile-count helpers
Date: Tue, 16 Jun 2026 22:19:00 -0400
Message-ID: <20260617021906.2746743-4-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65074-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42E16696184

The stateless HEVC decoders compute the number of tile columns and rows
from num_tile_columns_minus1 / num_tile_rows_minus1 and clamp it to the
column_width_minus1[] / row_height_minus1[] capacity before using it as a
loop bound. Add shared helpers in a new <media/v4l2-hevc.h> so the rkvdec
and hantro drivers do not each open-code the min_t() clamp.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 include/media/v4l2-hevc.h | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 include/media/v4l2-hevc.h

diff --git a/include/media/v4l2-hevc.h b/include/media/v4l2-hevc.h
new file mode 100644
index 0000000000000..973c96be16be4
--- /dev/null
+++ b/include/media/v4l2-hevc.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Helper functions for HEVC stateless codecs.
+ */
+
+#ifndef _MEDIA_V4L2_HEVC_H
+#define _MEDIA_V4L2_HEVC_H
+
+#include <linux/minmax.h>
+#include <media/v4l2-ctrls.h>
+
+/**
+ * v4l2_hevc_pps_num_tile_columns - number of HEVC tile columns, bounded
+ * @pps: the V4L2 HEVC PPS control
+ *
+ * Return the number of tile columns (num_tile_columns_minus1 + 1) clamped to
+ * the capacity of column_width_minus1[]. The control validation already
+ * rejects out-of-range counts; this keeps the consuming drivers bounded too.
+ */
+static inline unsigned int
+v4l2_hevc_pps_num_tile_columns(const struct v4l2_ctrl_hevc_pps *pps)
+{
+	return min_t(unsigned int, pps->num_tile_columns_minus1 + 1,
+		     ARRAY_SIZE(pps->column_width_minus1));
+}
+
+/**
+ * v4l2_hevc_pps_num_tile_rows - number of HEVC tile rows, bounded
+ * @pps: the V4L2 HEVC PPS control
+ *
+ * Return the number of tile rows (num_tile_rows_minus1 + 1) clamped to the
+ * capacity of row_height_minus1[].
+ */
+static inline unsigned int
+v4l2_hevc_pps_num_tile_rows(const struct v4l2_ctrl_hevc_pps *pps)
+{
+	return min_t(unsigned int, pps->num_tile_rows_minus1 + 1,
+		     ARRAY_SIZE(pps->row_height_minus1));
+}
+
+#endif /* _MEDIA_V4L2_HEVC_H */
-- 
2.53.0


