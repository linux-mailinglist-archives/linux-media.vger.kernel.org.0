Return-Path: <linux-media+bounces-66514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dS2kMWHbR2qQgQAAu9opvQ
	(envelope-from <linux-media+bounces-66514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:55:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404307040F7
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:55:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=LOoT2DFp;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66514-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66514-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F50130938C6
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7512F8BC0;
	Fri,  3 Jul 2026 15:52:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99D42E7F39
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:51:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093923; cv=none; b=ar27r9fX+72CwNym5OCuaAkLpJchLiaEHMErSACPtCZeosnFIowOOJcOaRX7KXyX2eQ3JNRc63wzZwB/RH+Ge9QCY1l3F/rjyjrA88Wi3Mj6cOJYScg5OTf/XB8Mqx5RjlpAAs0m7/8x7YQoZXuFHqyD+1TVBTZqtNK7008+MXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093923; c=relaxed/simple;
	bh=H2asgX0wDrlwzHBfEnS3Wi258Svm32QlbkiPzR5hYj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEwancQS97LyS1llmGTMN8Tv5eM/AUJrVa/7R2VlvBCq7AFBD+ILw9PiDBZU+TycVb7YSW/t0QzypjnGL3ggQla1d//xhLKl/ErcYk4Txv5aZp+wg/4GjDoka0Y95zByWoG6PmKMOf1Q9z3GhMyH6GNjaF61ZcHf7Cr679yNCrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LOoT2DFp; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso6944075e9.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093916; x=1783698716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ymAMy3nK21UB9/V3gR9xqfNNZyKdhEreKKHSe1qORU=;
        b=LOoT2DFpP6phhFk5NMy1ORYpsn5hxn/ORTRuaCYsGHSf9YNJkR+/HLZVWl+a7rOLi5
         zxLnpb1+DOxuvSctNqKNpMaoznuef6rmY3A8iatIBrowvYqTi1QDM9f5eJHiBOOEqg/i
         v/l05a08epjmvv6sRfO8h4F4MAZqT7Gy+ZNgfJa/xiaACJjEqN43YMbQSQJXWwticMcd
         CVQyAucvAp0ap1f1SnF7ZFF5YFVerkegPZBlhqTfUWlPJkaO3g5YLetuDbgAV9hdD+XC
         GTWXZ5LDpxYjrg/tfRNV+hd1BQxjJyIkwfrc2cdd+xnm3Degs2uz07C2R0YpyuITCagC
         6pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093916; x=1783698716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ymAMy3nK21UB9/V3gR9xqfNNZyKdhEreKKHSe1qORU=;
        b=jOMGBXMD+kc9wdw8txHVYZYFGorSf8SXeprfRQkq+wAyYTpc4TR5fcwoc118uNZBVY
         xR34cMpN4xAMshq6KhmKArWroFU9v0dQVlZ0Cg78FZh8xH3+Mv5GjEkMPaSuS+rUh+yp
         8lY5/p3smJGoKfaVOwUXQmtCN+/n6JuTkh4EWOpiTbD9p/Y0NW5FFlARoHm9H2nncTAB
         sobz/SvqeFxAcCKcqgZ+EZ08sJW4PFPHkDNKGolM7z/aH8fUwKD2Ut0V7ljAItPrg7Xu
         EGkZWm1lzBVi7sjXunJ0A8G6xvlAJZJkJHqk6LB8qK/i+TuYz8kjsbGtSDmeM4/U0xe6
         tKkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Tu2kxj9Bk4mX6/+1dpyzdIa/MFkvGdXpwWeidPTE7b1jlhRcBFlFp1sek1+zUVupqlUyJeGeJ50uBZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ6FSesDPBoPdOMdZ0PVokrNo6eqWZkIkQgNNp8Y54QQjFrLTI
	h1PGVgL8Qk/oJLAjXM8iXEKug0KOkVgQC2Rne3S679a9duYnatRUD/AeMgvxq1F/Noo=
X-Gm-Gg: AfdE7cmzCPx7mkGOFx1xcwoDKhn6vsxhrYPVTVlaUheQnzxAsB4v8DHOB/IPhVFaK6h
	EMWTQrFRERV0b3HiaiU3y941c1KG7xR9J2bJOGcQRWnGSlQeHF/3Pp9d0fEWdDkFCL6JhrJ+6Rb
	zCtI8JAuIR66xnihTvGri6TnLhgYsJ8Iqn2bAQsCfwL89aG/CYgEXnEVJGXsllMfGG1AC1qBU74
	A4i1S9xxgDI43zuM78YwHKo4+wBuvORtLMMxI9CY8oKa+0nQy4M+gDed6IgiDxOa5FYwuSEZAyw
	BNL59A5ktsBfrUCh2zI0MWWnI3vyNHi5f3BqousShWO7q87+lw2UtRlRnEphP8PODUrgrk8p2bg
	C9sFWMnn9Jd8fQwE1/PQZC2UVuWCvcF8TjUq6U8tt/YHO/g5L19hUmRt5Q/Hr1tZ03bAs03IsTB
	9zWhIUCA==
X-Received: by 2002:a05:600c:811a:b0:493:cd3f:d097 with SMTP id 5b1f17b1804b1-493d0f0bf6fmr4760055e9.12.1783093916108;
        Fri, 03 Jul 2026 08:51:56 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:55 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 03 Jul 2026 16:51:49 +0100
Subject: [PATCH 5/7] media: qcom: camss: qcom-icp: ipe: Add initial v4l2
 m2m IPE driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-5-595df9e67790@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17342; i=bod@kernel.org;
 h=from:subject:message-id; bh=H2asgX0wDrlwzHBfEnS3Wi258Svm32QlbkiPzR5hYj4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qUPp47eZgloi3NybCgB0dvBurUwdiWaqawt
 raAGRdo0vCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfalAAKCRAicTuzoY3I
 OnNYD/4p5i4p7RZRFCUd7xFjngnqS2dtbq+MOheW2ogKUOE4MlcSK+o91zn7+mb8dbsUtvFeso0
 3lAHC5n4o9sCjr4J2fbYQf2vR/Bq8oLImV/bGhIK2nX5a36/7dmz9JweILQXYWBiAxhqeoiL4Ph
 LqRpxnbH6tJ/soP1mB2afWAT7QrG4+wV0SFjkbQOZoDc9ih1/VDMKZ7E1TafIp4CwvlmITEG2T9
 qKr0ASfnyBH761F2/3pkerR7mmq1qI7vEy1mlb30RS+HpR9yxX5+6N1gnuGZ5O+MK1m3694gb+9
 4zH8mbUF416bPnfhV7VKaA93zkEfzjYwqes8TaqoJ/nEtF/NQfRG8dPldNlFO81UKshudXptmTH
 t2TCNl5HKYH45d7tyxcr18i0Y5WZwoTrJm4wdrmBRqo7w4LSCzQHfMIOSYLgnFyvhd8QMrxNj09
 n2YtJ6jfZXPSHS3ZLkf8FMU5C+ebZaa+q9N8GIRiEBONWAKIeECDI4L1ThlCJYXsZstkn0utjod
 r7w1iGFQqbpht7yB1Fz3GipZ7ACHIWURcztSKw285jhpAfbf2HH/vA2Mwc1qLJT7vk3VfS9rpxU
 TiPAV5tQhNwd5Ch3hRvfaxuhh/RiOLqP6DSEm0UO9HNkN37Ievvuojiico9jSXPZ4bbCSq1hHOZ
 ghOrEfYlEk0oIUA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66514-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 404307040F7

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-ipe.c | 558 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ipe.h |  69 ++++
 2 files changed, 627 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ipe.c b/drivers/media/platform/qcom/camss/camss-ipe.c
new file mode 100644
index 0000000000000..c579c2b5904e3
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ipe.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm CAMSS IPE (Image Processing Engine) V4L2 M2M Driver
+ *
+ * Responsibilities:
+ * - Manage IPE power and clocks (independent of ICP)
+ * - Implement V4L2 mem2mem interface
+ * - Use ICP for HFI communication with firmware
+ *
+ * Copyright (c) 2026 Bryan O'Donoghue.
+ */
+
+#include <linux/clk.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "camss-icp.h"
+
+#define IPE_NAME		"qcom-camss-ipe"
+#define IPE_CLK_MAX		6
+
+struct ipe_device {
+	struct device *dev;
+	void __iomem *base;
+
+	/* IPE's own clocks */
+	struct clk_bulk_data clocks[IPE_CLK_MAX];
+	int num_clocks;
+
+	/* IPE's own interconnect */
+	struct icc_path *icc_mem;
+
+	/* IPE's own power state */
+	bool powered;
+
+	/* UBWC config */
+	struct icp_ubwc_cfg ubwc;
+
+	/* ICP reference */
+	struct icp_device *icp;
+
+	/* V4L2 */
+	struct v4l2_device v4l2_dev;
+	struct video_device vdev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct mutex lock;
+};
+
+struct ipe_ctx {
+	struct v4l2_fh fh;
+	struct ipe_device *ipe;
+	struct icp_context *icp_ctx;
+
+	/* Format info */
+	u32 width;
+	u32 height;
+	u32 src_fmt;
+	u32 dst_fmt;
+};
+
+/* ============================================================
+ * IPE Power Management (independent of ICP)
+ * ============================================================ */
+
+static int ipe_power_on(struct ipe_device *ipe)
+{
+	int ret;
+
+	if (ipe->powered)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(ipe->dev);
+	if (ret)
+		return ret;
+
+	ret = icc_set_bw(ipe->icc_mem, 0, MBps_to_icc(8000));
+	if (ret)
+		goto err_rpm;
+
+	/* Set clock rates */
+	clk_set_rate(ipe->clocks[3].clk, 700000000);  /* nps */
+	clk_set_rate(ipe->clocks[4].clk, 700000000);  /* pps */
+
+	ret = clk_bulk_prepare_enable(ipe->num_clocks, ipe->clocks);
+	if (ret)
+		goto err_icc;
+
+	ipe->powered = true;
+	dev_dbg(ipe->dev, "IPE powered on\n");
+	return 0;
+
+err_icc:
+	icc_set_bw(ipe->icc_mem, 0, 0);
+err_rpm:
+	pm_runtime_put(ipe->dev);
+	return ret;
+}
+
+static void ipe_power_off(struct ipe_device *ipe)
+{
+	if (!ipe->powered)
+		return;
+
+	clk_bulk_disable_unprepare(ipe->num_clocks, ipe->clocks);
+	icc_set_bw(ipe->icc_mem, 0, 0);
+	pm_runtime_put(ipe->dev);
+
+	ipe->powered = false;
+	dev_dbg(ipe->dev, "IPE powered off\n");
+}
+
+/* ============================================================
+ * V4L2 Operations
+ * ============================================================ */
+
+static int ipe_querycap(struct file *file, void *priv,
+			struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, IPE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "Qualcomm IPE", sizeof(cap->card));
+
+	return 0;
+}
+
+static int ipe_enum_fmt(struct file *file, void *priv,
+			struct v4l2_fmtdesc *f)
+{
+	/* Support NV12 for now */
+	if (f->index > 0)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_PIX_FMT_NV12;
+	return 0;
+}
+
+static int ipe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ipe_ctx *ctx = container_of(priv, struct ipe_ctx, fh);
+
+	f->fmt.pix_mp.width = ctx->width ?: 1920;
+	f->fmt.pix_mp.height = ctx->height ?: 1080;
+	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
+	f->fmt.pix_mp.num_planes = 2;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = f->fmt.pix_mp.width;
+	f->fmt.pix_mp.plane_fmt[0].sizeimage = f->fmt.pix_mp.width * f->fmt.pix_mp.height;
+	f->fmt.pix_mp.plane_fmt[1].bytesperline = f->fmt.pix_mp.width;
+	f->fmt.pix_mp.plane_fmt[1].sizeimage = f->fmt.pix_mp.width * f->fmt.pix_mp.height / 2;
+
+	return 0;
+}
+
+static int ipe_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ipe_ctx *ctx = container_of(priv, struct ipe_ctx, fh);
+
+	ctx->width = f->fmt.pix_mp.width;
+	ctx->height = f->fmt.pix_mp.height;
+
+	return ipe_g_fmt(file, priv, f);
+}
+
+static const struct v4l2_ioctl_ops ipe_ioctl_ops = {
+	.vidioc_querycap		= ipe_querycap,
+	.vidioc_enum_fmt_vid_cap	= ipe_enum_fmt,
+	.vidioc_enum_fmt_vid_out	= ipe_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane	= ipe_g_fmt,
+	.vidioc_g_fmt_vid_out_mplane	= ipe_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane	= ipe_s_fmt,
+	.vidioc_s_fmt_vid_out_mplane	= ipe_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane	= ipe_g_fmt,
+	.vidioc_try_fmt_vid_out_mplane	= ipe_g_fmt,
+
+	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
+};
+
+/* ============================================================
+ * V4L2 M2M Callbacks
+ * ============================================================ */
+
+static void ipe_job_abort(void *priv)
+{
+	struct ipe_ctx *ctx = priv;
+
+	if (ctx->icp_ctx)
+		icp_ctx_abort(ctx->icp_ctx);
+}
+
+static void ipe_frame_done(struct icp_context *icp_ctx, int status)
+{
+	struct ipe_ctx *ctx = icp_ctx->priv;
+	struct vb2_v4l2_buffer *src, *dst;
+
+	src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+	if (status) {
+		v4l2_m2m_buf_done(src, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_ERROR);
+	} else {
+		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
+		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
+	}
+
+	v4l2_m2m_job_finish(ctx->ipe->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static void ipe_device_run(void *priv)
+{
+	struct ipe_ctx *ctx = priv;
+	struct vb2_v4l2_buffer *src, *dst;
+	struct icp_frame_request req;
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	req.input_iova = vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0);
+	req.input_size = vb2_plane_size(&src->vb2_buf, 0);
+	req.output_iova = vb2_dma_contig_plane_dma_addr(&dst->vb2_buf, 0);
+	req.output_size = vb2_plane_size(&dst->vb2_buf, 0);
+	req.cmdbufs_iova = 0;  /* Would be set up properly */
+	req.cmdbufs_size = 0;
+	req.priv = ctx;
+
+	if (icp_ctx_submit_frame(ctx->icp_ctx, &req))
+		ipe_frame_done(ctx->icp_ctx, -EIO);
+}
+
+static const struct v4l2_m2m_ops ipe_m2m_ops = {
+	.device_run = ipe_device_run,
+	.job_abort = ipe_job_abort,
+};
+
+/* ============================================================
+ * V4L2 Queue Operations
+ * ============================================================ */
+
+static int ipe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+			   unsigned int *nplanes, unsigned int sizes[],
+			   struct device *alloc_devs[])
+{
+	struct ipe_ctx *ctx = vb2_get_drv_priv(vq);
+	unsigned int size = ctx->width * ctx->height * 3 / 2;
+
+	if (*nplanes) {
+		if (*nplanes != 2)
+			return -EINVAL;
+		return 0;
+	}
+
+	*nplanes = 2;
+	sizes[0] = ctx->width * ctx->height;
+	sizes[1] = size - sizes[0];
+
+	return 0;
+}
+
+static int ipe_buf_prepare(struct vb2_buffer *vb)
+{
+	return 0;
+}
+
+static void ipe_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct ipe_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int ipe_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct ipe_ctx *ctx = vb2_get_drv_priv(vq);
+	struct ipe_device *ipe = ctx->ipe;
+	int ret;
+
+	/* Power on IPE (IPE manages its own power) */
+	ret = ipe_power_on(ipe);
+	if (ret)
+		return ret;
+
+	/*
+	 * Create ICP context - ICP boots itself automatically
+	 * on first context creation
+	 */
+	ctx->icp_ctx = icp_ctx_create(ipe->icp, HFI_DEV_TYPE_IPE,
+				      ipe_frame_done, ctx);
+	if (IS_ERR(ctx->icp_ctx)) {
+		ret = PTR_ERR(ctx->icp_ctx);
+		ctx->icp_ctx = NULL;
+		ipe_power_off(ipe);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ipe_stop_streaming(struct vb2_queue *vq)
+{
+	struct ipe_ctx *ctx = vb2_get_drv_priv(vq);
+	struct ipe_device *ipe = ctx->ipe;
+	struct vb2_v4l2_buffer *vbuf;
+
+	/* Return all buffers */
+	while ((vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	while ((vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx)))
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+
+	/*
+	 * Destroy ICP context - ICP shuts itself down automatically
+	 * when last context is destroyed
+	 */
+	if (ctx->icp_ctx) {
+		icp_ctx_destroy(ctx->icp_ctx);
+		ctx->icp_ctx = NULL;
+	}
+
+	ipe_power_off(ipe);
+}
+
+static const struct vb2_ops ipe_vb2_ops = {
+	.queue_setup = ipe_queue_setup,
+	.buf_prepare = ipe_buf_prepare,
+	.buf_queue = ipe_buf_queue,
+	.start_streaming = ipe_start_streaming,
+	.stop_streaming = ipe_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static int ipe_queue_init(void *priv, struct vb2_queue *src_vq,
+			  struct vb2_queue *dst_vq)
+{
+	struct ipe_ctx *ctx = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = ctx;
+	src_vq->buf_struct_size = sizeof(struct vb2_v4l2_buffer);
+	src_vq->ops = &ipe_vb2_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &ctx->ipe->lock;
+	src_vq->dev = ctx->ipe->dev;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->buf_struct_size = sizeof(struct vb2_v4l2_buffer);
+	dst_vq->ops = &ipe_vb2_ops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &ctx->ipe->lock;
+	dst_vq->dev = ctx->ipe->dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+/* ============================================================
+ * File Operations
+ * ============================================================ */
+
+static int ipe_open(struct file *file)
+{
+	struct ipe_device *ipe = video_drvdata(file);
+	struct ipe_ctx *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->ipe = ipe;
+	ctx->width = 1920;
+	ctx->height = 1080;
+
+	v4l2_fh_init(&ctx->fh, &ipe->vdev);
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(ipe->m2m_dev, ctx, ipe_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		int ret = PTR_ERR(ctx->fh.m2m_ctx);
+		v4l2_fh_exit(&ctx->fh);
+		kfree(ctx);
+		return ret;
+	}
+
+	file->private_data = &ctx->fh;
+	v4l2_fh_add(&ctx->fh, file);
+
+	return 0;
+}
+
+static int ipe_release(struct file *file)
+{
+	struct ipe_ctx *ctx = container_of(file->private_data, struct ipe_ctx, fh);
+
+	v4l2_fh_del(&ctx->fh, file);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_fh_exit(&ctx->fh);
+	kfree(ctx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations ipe_fops = {
+	.owner = THIS_MODULE,
+	.open = ipe_open,
+	.release = ipe_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+/* ============================================================
+ * Platform Driver
+ * ============================================================ */
+
+static int camss_ipe_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ipe_device *ipe;
+	int ret;
+
+	ipe = devm_kzalloc(dev, sizeof(*ipe), GFP_KERNEL);
+	if (!ipe)
+		return -ENOMEM;
+
+	ipe->dev = dev;
+	platform_set_drvdata(pdev, ipe);
+	mutex_init(&ipe->lock);
+
+	/* Map registers */
+	ipe->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ipe->base))
+		return PTR_ERR(ipe->base);
+
+	/* Get clocks */
+	ipe->clocks[0].id = "ahb";
+	ipe->clocks[1].id = "nps_fast_ahb";
+	ipe->clocks[2].id = "pps_fast_ahb";
+	ipe->clocks[3].id = "nps";
+	ipe->clocks[4].id = "pps";
+	ipe->clocks[5].id = "cpas";
+	ipe->num_clocks = IPE_CLK_MAX;
+
+	ret = devm_clk_bulk_get(dev, ipe->num_clocks, ipe->clocks);
+	if (ret)
+		return ret;
+
+	/* Get interconnect */
+	ipe->icc_mem = devm_of_icc_get(dev, "mem");
+	if (IS_ERR(ipe->icc_mem))
+		return PTR_ERR(ipe->icc_mem);
+
+	/* Get UBWC config */
+	of_property_read_u32(dev->of_node, "ubwc-fetch-cfg", &ipe->ubwc.fetch_cfg);
+	of_property_read_u32(dev->of_node, "ubwc-write-cfg", &ipe->ubwc.write_cfg);
+
+	/* Get ICP reference */
+	ipe->icp = icp_get(dev);
+	if (IS_ERR(ipe->icp))
+		return PTR_ERR(ipe->icp);
+
+	/* Set UBWC config in ICP */
+	icp_set_ubwc_config(ipe->icp, HFI_DEV_TYPE_IPE, &ipe->ubwc);
+
+	/* Register V4L2 device */
+	ret = v4l2_device_register(dev, &ipe->v4l2_dev);
+	if (ret)
+		goto err_icp;
+
+	/* Create M2M device */
+	ipe->m2m_dev = v4l2_m2m_init(&ipe_m2m_ops);
+	if (IS_ERR(ipe->m2m_dev)) {
+		ret = PTR_ERR(ipe->m2m_dev);
+		goto err_v4l2;
+	}
+
+	/* Register video device */
+	ipe->vdev.fops = &ipe_fops;
+	ipe->vdev.ioctl_ops = &ipe_ioctl_ops;
+	ipe->vdev.release = video_device_release_empty;
+	ipe->vdev.v4l2_dev = &ipe->v4l2_dev;
+	ipe->vdev.vfl_dir = VFL_DIR_M2M;
+	ipe->vdev.lock = &ipe->lock;
+	ipe->vdev.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	strscpy(ipe->vdev.name, "qcom-ipe", sizeof(ipe->vdev.name));
+	video_set_drvdata(&ipe->vdev, ipe);
+
+	ret = video_register_device(&ipe->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto err_m2m;
+
+	pm_runtime_enable(dev);
+
+	dev_info(dev, "IPE registered as /dev/video%d\n", ipe->vdev.num);
+
+	return 0;
+
+err_m2m:
+	v4l2_m2m_release(ipe->m2m_dev);
+err_v4l2:
+	v4l2_device_unregister(&ipe->v4l2_dev);
+err_icp:
+	icp_put(ipe->icp);
+	return ret;
+}
+
+static void camss_ipe_remove(struct platform_device *pdev)
+{
+	struct ipe_device *ipe = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(ipe->dev);
+	video_unregister_device(&ipe->vdev);
+	v4l2_m2m_release(ipe->m2m_dev);
+	v4l2_device_unregister(&ipe->v4l2_dev);
+	icp_put(ipe->icp);
+}
+
+static const struct of_device_id camss_ipe_dt_match[] = {
+	{ .compatible = "qcom,x1e80100-camss-ipe" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, camss_ipe_dt_match);
+
+static struct platform_driver camss_ipe_driver = {
+	.probe = camss_ipe_probe,
+	.remove = camss_ipe_remove,
+	.driver = {
+		.name = "camss-ipe",
+		.of_match_table = camss_ipe_dt_match,
+	},
+};
+
+module_platform_driver(camss_ipe_driver);
+
+MODULE_DESCRIPTION("Qualcomm CAMSS IPE V4L2 M2M driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-ipe.h b/drivers/media/platform/qcom/camss/camss-ipe.h
new file mode 100644
index 0000000000000..3f6d43a269d2d
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ipe.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm CAMSS IPE (Image Processing Engine) Driver
+ *
+ * The IPE performs image post-processing controlled by ICP firmware.
+ * It consists of two sub-blocks:
+ * - NPS (Noise Processing Segment): Noise reduction, sharpening
+ * - PPS (Post Processing Segment): Colour correction, scaling
+ *
+ * Copyright (c) 2026 Bryan O'Donoghue.
+ */
+
+#ifndef __CAMSS_IPE_H__
+#define __CAMSS_IPE_H__
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/interconnect.h>
+#include <linux/types.h>
+
+/* Forward declaration */
+struct camss_icp;
+
+/*
+ * IPE Clock Indices
+ */
+enum ipe_clk_id {
+	IPE_CLK_NPS_AHB,
+	IPE_CLK_NPS_FAST_AHB,
+	IPE_CLK_PPS_FAST_AHB,
+	IPE_CLK_NPS,
+	IPE_CLK_PPS,
+	IPE_CLK_CPAS_IPE_NPS,
+	IPE_CLK_MAX,
+};
+
+/*
+ * IPE Device
+ */
+struct camss_ipe {
+	struct device *dev;
+	struct camss_icp *icp;
+
+	/* Register base (informational - ICP firmware programs registers) */
+	void __iomem *base;
+
+	/* Clocks */
+	struct clk *clocks[IPE_CLK_MAX];
+
+	/* Power domain (IPE_0_GDSC) */
+	struct device *pd;
+	struct device_link *pd_link;
+
+	/* Interconnect */
+	struct icc_path *icc_mem;
+
+	/* State */
+	bool powered;
+	u32 clock_rate;
+};
+
+/*
+ * API Functions
+ */
+int camss_ipe_power_on(struct camss_ipe *ipe);
+void camss_ipe_power_off(struct camss_ipe *ipe);
+int camss_ipe_set_clock(struct camss_ipe *ipe, u32 rate);
+
+#endif /* __CAMSS_IPE_H__ */

-- 
2.54.0


