Return-Path: <linux-media+bounces-66512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZmxwMDTbR2qDgQAAu9opvQ
	(envelope-from <linux-media+bounces-66512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:54:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451B7040C5
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:54:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=q2TUfy6e;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66512-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66512-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F5EC301EC1D
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10CA2F7478;
	Fri,  3 Jul 2026 15:52:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB22E228D
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:51:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093920; cv=none; b=cl7P49JgM3wLBypTcfqyJOne0+/ghuTLL8Qfu5L9P8Xxhscdw/iVFJsJ+CrAPQ7Cw8YAjj+2b6dmi/tTlAkgZdYnoNvgERdlH1ka9V2OZymUWOiZVx+4NnYEoU6Mk9tfkrvaJZMHMXRPvNEvK7NJGY2T1SPBCveVWF5qjG+tQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093920; c=relaxed/simple;
	bh=ITvElV/BkOLp9oDo8ys3gtUEtgukzuiZf+YOn3zRZ0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0SlPvfFqKgchLuXf0kVefPm+MehcL536xIJH7GT+o5VNiQG4H7wzysIQi7vgFRnG9m/raEvpR3evevXhYkQkKU8h6LCEuyL3hMzLW2bWP0o8l0gpn1N7FTXJIwPMjD8Aek/8fJzYfmM5Ws8Era2CSstYcg9HHL/1fHfYK7dUNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2TUfy6e; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c19bad03so6497255e9.2
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093915; x=1783698715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZWSU3IH1oQFjyCTfDSurhec1yDz3L739mo/lJSFglA=;
        b=q2TUfy6eR+1dUs7lWrfJVIz4ySach9zPP+3n5urPB6l2lRyZWwHZzXP5R5/HhebU4Y
         GsmDD/VOShO8AZE+q6Vg+FGT3SNVvNaN1kaGfDVRMCMkJX6q2CZkIEYWstgJeasVGeNy
         wq7/df5OP9BCidN2OLehaQWcq+yRX+/xkZ5b7P9evFthehLidmPgIgN6bh1gZbg2CGGm
         IBQAsubb1lrpa6juP/YTD6u/rbntNfS2bxXNzoAI+WzRjM/xcttNhpuu6ut7rVctjMuS
         rFW2YT61O9AQgcK30VSTrprnBWTrzjqhdakKqupptyMCfJCgkljpWRftn6clgWzdyQQT
         /Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093915; x=1783698715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZWSU3IH1oQFjyCTfDSurhec1yDz3L739mo/lJSFglA=;
        b=b7PqdXw7ErqM2tJnWm3BDqZC3MJQF0fmluEuMGB2T1Iz7MrjcCGA/c8cXDUSPp95TX
         wXbP49Nw9Oaet/3Vg57X+GisH9U7CZaaqghhxeEpT/olgv9BU+PPU+LUtkgHwMtShVk0
         aWu++xZo1CkvO+pKAgRN3RTLW29GUpcF6WWA3D2Jm1mzl+g6RPXOmG4ANuBxN/4lnDYb
         IJdHkgP/5Psp6OwvKDE4wFB0E/UTmQMI9slGyvIjUPOsLF445XM5L9gQvf7Ob7LEeLlY
         C7D5BpINRCjyI9C3driCQWb7FqHLunjv37DITnvPQuEKinGoHH/m7nCmXatakYjYqZ0g
         hGVw==
X-Forwarded-Encrypted: i=1; AFNElJ9lvJASmuUm7HIi+IJOxaFVmaXU1visySWTrGfppQxSYQbntrZadQwNjRmrAK+okvwwFyZnaj4+lt7HxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzav/RtnDhmUYK7KgWKbFaGC1Mql6zg0meYfsokdmswxfEo77
	t+EfcDXDJEpTsq03PrPKdMWEPD+5Ab+AQRfIjK1ATZPbnN7wQGojcvma0/ddElCwNUY=
X-Gm-Gg: AfdE7cm9quKOWBO676sD+BYZjLfhgRwkk9dRXGFkJNxvEdBCZElt1HfX4CMF29l+OiG
	g97UXpyI8BMRSg+5lLqoe4xjZTIhH5S0cdwpb6CSufpqH5dTxQInUCWJ736WgstqqbKq5VlaII2
	Q9UISkA/BTmaU+NyCtYGkqKm8kk7wbDNUF9Ta5ylpE7PGs8Zot2yQLyqmmMU+HSgG6bzu1hneb8
	e3hOHApuYlJ3NXtwVphy4xjRmAywRH89SJ2+cnftTijPn9gwWaSWtE4L2eeiGw3cE4fTiYsrWXp
	XUbls96HCtbWIQfGnZrQoPOa5LWI086S5WIAAihvI8fm98PpL07qAvm9o4PuyOfXO5nJbIOXoCQ
	lW429kCuFtX90IZoi1zR5t7RmN6HZ477VEw8fp10UDCMaPwvrAN4gIaoXf4Nt1smzdE1qOzXedw
	fI4O4YAA==
X-Received: by 2002:a05:600c:68c7:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-493d0f0fac0mr3329635e9.14.1783093915006;
        Fri, 03 Jul 2026 08:51:55 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:54 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 03 Jul 2026 16:51:48 +0100
Subject: [PATCH 4/7] media: qcom: camss: qcom-icp: bps: Add initial v4l2
 m2m BPS driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-4-595df9e67790@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=20747; i=bod@kernel.org;
 h=from:subject:message-id; bh=ITvElV/BkOLp9oDo8ys3gtUEtgukzuiZf+YOn3zRZ0Q=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qUwKXzRvJ/QVcTi3kEoKHnvvBEv419k6svG
 TTio7I/KM6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfalAAKCRAicTuzoY3I
 OsqRD/kBTaBHvj4ilZNkXPbJS9FBoxlIbolDgwMeiLO2PekMt8s2E7O9K6WcEmBMi+otZOjfZql
 QvbwaQv0kjKcYBe+fusX9cpGBlOAISHs+N8H9P7GFUKYknBpHsvrDz89fTnIvhiuLM7VRXGX5r/
 x53HgSj7h5B1vkcOsw1E6snKQ9LIuZYMc46s8zHSqCvuf4c9IR7PY+yV1ofX2jhW6D3ztSDmDwW
 WKzdPx+XpL3jEIJMoXP+BoFvtXi7uAXQDWdv1y5HdCN1+AGx7N9jQZKSFRUFCHObnx6T5YXhH5a
 lM4G1//NPIRGyzoYrTAsVIkwt1lieXtf1wEtWlKyhRBJL+QZvUWtmoHU4QPMRMgCwhnu6ifzFc/
 zJhS+HR4I/8jWlHu7rbD0KNQNnWVpEmdtbe/naOPIEAtG4peDDrb9GMe3TAc+2b13i7ZfuvcEX+
 7qeKDODtBYX0URv1ZG/O3DCTQdI2L0cUAlsEjTKHinLVYFjE37GMOnqau/soC7eCuMHruoa94nu
 hHOH5rpczQ16NxtY/5vWpeWdc5ebUhfQRukFCWD7bWnGjba2hW4Rkcpuqq8wG8mSd8m6kxfxI4L
 5Wl4FJqKkAjA7s/XaAcMdlvcrDyOIeWHnqD+csYLdexr9Gi+/YhBSBZV/BCCP5Vcbglk63b+Att
 N9np+4ngcrJgExQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66512-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0451B7040C5

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-bps.c | 684 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-bps.h |  74 +++
 2 files changed, 758 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-bps.c b/drivers/media/platform/qcom/camss/camss-bps.c
new file mode 100644
index 0000000000000..6d447a6353a70
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-bps.c
@@ -0,0 +1,684 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm CAMSS BPS (Bayer Processing Segment) V4L2 M2M Driver
+ *
+ * Responsibilities:
+ * - Manage BPS power and clocks (independent of ICP)
+ * - Implement V4L2 mem2mem interface for demosaicing
+ * - Use ICP for HFI communication with firmware
+ *
+ * Copyright (c) 2026 Bryan O'Donoghue.
+ */
+
+#include <linux/clk.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "camss-bps-cmd.h"
+#include "camss-bps-iq.h"
+#include "camss-icp-hfi.h"
+#include "camss-icp-hfi-frame.h"
+#include "camss-icp.h"
+
+#define BPS_NAME		"qcom-camss-bps"
+#define BPS_CLK_MAX		4
+
+struct bps_device {
+	struct device *dev;
+	void __iomem *base;
+
+	/* BPS's own clocks */
+	struct clk_bulk_data clocks[BPS_CLK_MAX];
+	int num_clocks;
+
+	/* BPS's own interconnect */
+	struct icc_path *icc_mem;
+
+	/* BPS's own power state */
+	bool powered;
+
+	/* UBWC config */
+	struct icp_ubwc_cfg ubwc;
+
+	/* ICP reference */
+	struct device *icp_dev;
+	struct icp_hfi *hfi;
+
+	/* V4L2 */
+	struct v4l2_device v4l2_dev;
+	struct video_device vdev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct mutex lock;
+};
+
+struct bps_ctx {
+	struct v4l2_fh fh;
+	struct bps_device *bps;
+
+	/* Format info */
+	u32 width;
+	u32 height;
+	u32 src_fmt;
+	u32 dst_fmt;
+	u32 bayer_pattern;
+
+	/* Command buffers (DMA memory for HFI) */
+	struct bps_cmd_bufs *cmd_bufs;
+
+	/* IQ configuration */
+	struct bps_iq_config iq;
+
+	/* Frame counter */
+	u32 frame_id;
+
+	/* Firmware returned handle */
+	u32 fw_handle;
+};
+
+/* ============================================================
+ * BPS Power Management (independent of ICP)
+ * ============================================================ */
+
+static int bps_power_on(struct bps_device *bps)
+{
+	int ret;
+
+	if (bps->powered)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(bps->dev);
+	if (ret)
+		return ret;
+
+	ret = icc_set_bw(bps->icc_mem, 0, MBps_to_icc(8000));
+	if (ret)
+		goto err_rpm;
+
+	/* Set clock rate */
+	clk_set_rate(bps->clocks[2].clk, 600000000);  /* core */
+
+	ret = clk_bulk_prepare_enable(bps->num_clocks, bps->clocks);
+	if (ret)
+		goto err_icc;
+
+	bps->powered = true;
+	dev_dbg(bps->dev, "BPS powered on\n");
+	return 0;
+
+err_icc:
+	icc_set_bw(bps->icc_mem, 0, 0);
+err_rpm:
+	pm_runtime_put(bps->dev);
+	return ret;
+}
+
+static void bps_power_off(struct bps_device *bps)
+{
+	if (!bps->powered)
+		return;
+
+	clk_bulk_disable_unprepare(bps->num_clocks, bps->clocks);
+	icc_set_bw(bps->icc_mem, 0, 0);
+	pm_runtime_put(bps->dev);
+
+	bps->powered = false;
+	dev_dbg(bps->dev, "BPS powered off\n");
+}
+
+/* ============================================================
+ * V4L2 Operations
+ * ============================================================ */
+
+static int bps_querycap(struct file *file, void *priv,
+			struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, BPS_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "Qualcomm BPS", sizeof(cap->card));
+
+	return 0;
+}
+
+static int bps_enum_fmt_src(struct file *file, void *priv,
+			    struct v4l2_fmtdesc *f)
+{
+	/* Input: Raw Bayer formats */
+	static const u32 fmts[] = {
+		V4L2_PIX_FMT_SRGGB10,
+		V4L2_PIX_FMT_SGRBG10,
+		V4L2_PIX_FMT_SGBRG10,
+		V4L2_PIX_FMT_SBGGR10,
+	};
+
+	if (f->index >= ARRAY_SIZE(fmts))
+		return -EINVAL;
+
+	f->pixelformat = fmts[f->index];
+	return 0;
+}
+
+static int bps_enum_fmt_dst(struct file *file, void *priv,
+			    struct v4l2_fmtdesc *f)
+{
+	/* Output: NV12 (demosaiced) */
+	if (f->index > 0)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_PIX_FMT_NV12;
+	return 0;
+}
+
+static int bps_g_fmt_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct bps_ctx *ctx = container_of(priv, struct bps_ctx, fh);
+
+	f->fmt.pix_mp.width = ctx->width ?: 4096;
+	f->fmt.pix_mp.height = ctx->height ?: 3072;
+	f->fmt.pix_mp.pixelformat = ctx->src_fmt ?: V4L2_PIX_FMT_SRGGB10;
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = f->fmt.pix_mp.width * 2;
+	f->fmt.pix_mp.plane_fmt[0].sizeimage =
+		f->fmt.pix_mp.plane_fmt[0].bytesperline * f->fmt.pix_mp.height;
+
+	return 0;
+}
+
+static int bps_g_fmt_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct bps_ctx *ctx = container_of(priv, struct bps_ctx, fh);
+
+	f->fmt.pix_mp.width = ctx->width ?: 4096;
+	f->fmt.pix_mp.height = ctx->height ?: 3072;
+	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
+	f->fmt.pix_mp.num_planes = 2;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = f->fmt.pix_mp.width;
+	f->fmt.pix_mp.plane_fmt[0].sizeimage =
+		f->fmt.pix_mp.width * f->fmt.pix_mp.height;
+	f->fmt.pix_mp.plane_fmt[1].bytesperline = f->fmt.pix_mp.width;
+	f->fmt.pix_mp.plane_fmt[1].sizeimage =
+		f->fmt.pix_mp.width * f->fmt.pix_mp.height / 2;
+
+	return 0;
+}
+
+static int bps_s_fmt_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct bps_ctx *ctx = container_of(priv, struct bps_ctx, fh);
+
+	ctx->width = f->fmt.pix_mp.width;
+	ctx->height = f->fmt.pix_mp.height;
+	ctx->src_fmt = f->fmt.pix_mp.pixelformat;
+
+	return bps_g_fmt_src(file, priv, f);
+}
+
+static int bps_s_fmt_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct bps_ctx *ctx = container_of(priv, struct bps_ctx, fh);
+
+	ctx->width = f->fmt.pix_mp.width;
+	ctx->height = f->fmt.pix_mp.height;
+
+	return bps_g_fmt_dst(file, priv, f);
+}
+
+static const struct v4l2_ioctl_ops bps_ioctl_ops = {
+	.vidioc_querycap		= bps_querycap,
+	.vidioc_enum_fmt_vid_out	= bps_enum_fmt_src,
+	.vidioc_enum_fmt_vid_cap	= bps_enum_fmt_dst,
+	.vidioc_g_fmt_vid_out_mplane	= bps_g_fmt_src,
+	.vidioc_g_fmt_vid_cap_mplane	= bps_g_fmt_dst,
+	.vidioc_s_fmt_vid_out_mplane	= bps_s_fmt_src,
+	.vidioc_s_fmt_vid_cap_mplane	= bps_s_fmt_dst,
+	.vidioc_try_fmt_vid_out_mplane	= bps_g_fmt_src,
+	.vidioc_try_fmt_vid_cap_mplane	= bps_g_fmt_dst,
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
+#if 0
+static void bps_job_abort(void *priv)
+{
+	struct bps_ctx *ctx = priv;
+
+	if (ctx->icp_ctx)
+		icp_ctx_abort(ctx->icp_ctx);
+}
+#endif
+static void bps_frame_done(struct icp_context *icp_ctx, int status)
+{
+	struct bps_ctx *ctx = icp_ctx->priv;
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
+	v4l2_m2m_job_finish(ctx->bps->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static void bps_device_run(void *priv)
+{
+	struct bps_ctx *ctx = priv;
+	struct vb2_v4l2_buffer *src, *dst;
+	struct icp_frame_request req;
+	dma_addr_t input_iova, output_iova;
+	u32 input_size, output_size;
+	u32 input_stride, output_stride;
+	int ret;
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	input_iova = vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0);
+	input_size = vb2_plane_size(&src->vb2_buf, 0);
+	input_stride = ctx->width * 2;	/* 10-bit packed = ~2 bytes/pixel */
+
+	output_iova = vb2_dma_contig_plane_dma_addr(&dst->vb2_buf, 0);
+	output_size = vb2_plane_size(&dst->vb2_buf, 0);
+	output_stride = ctx->width;	/* NV12 Y plane stride */
+
+	/* Build frame command with IQ settings */
+	ret = bps_build_frame_cmd(ctx->cmd_bufs,
+				  ctx->frame_id++,
+				  ctx->width, ctx->height,
+				  ctx->bayer_pattern,
+				  input_iova, input_stride, input_size,
+				  output_iova, output_stride, output_size,
+				  &ctx->iq);
+	if (ret) {
+//		bps_frame_done(ctx->icp_ctx, -EIO);
+		return;
+	}
+
+	/* Submit to ICP */
+	req.input_iova = input_iova;
+	req.input_size = input_size;
+	req.output_iova = output_iova;
+	req.output_size = output_size;
+	req.cmdbufs_iova = bps_get_cmd_iova(ctx->cmd_bufs);
+	req.cmdbufs_size = bps_get_cmd_size(ctx->cmd_bufs);
+	req.priv = ctx;
+#if 0
+	if (icp_ctx_submit_frame(ctx->icp_ctx, &req))
+		bps_frame_done(ctx->icp_ctx, -EIO);
+#endif
+}
+
+static const struct v4l2_m2m_ops bps_m2m_ops = {
+	.device_run = bps_device_run,
+#if 0
+	.job_abort = bps_job_abort,
+#endif
+};
+
+/* ============================================================
+ * V4L2 Queue Operations
+ * ============================================================ */
+
+static int bps_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+			   unsigned int *nplanes, unsigned int sizes[],
+			   struct device *alloc_devs[])
+{
+	struct bps_ctx *ctx = vb2_get_drv_priv(vq);
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
+		/* Raw input */
+		if (*nplanes) {
+			if (*nplanes != 1)
+				return -EINVAL;
+			return 0;
+		}
+		*nplanes = 1;
+		sizes[0] = ctx->width * ctx->height * 2;
+	} else {
+		/* NV12 output */
+		if (*nplanes) {
+			if (*nplanes != 2)
+				return -EINVAL;
+			return 0;
+		}
+		*nplanes = 2;
+		sizes[0] = ctx->width * ctx->height;
+		sizes[1] = ctx->width * ctx->height / 2;
+	}
+
+	return 0;
+}
+
+static int bps_buf_prepare(struct vb2_buffer *vb)
+{
+	return 0;
+}
+
+static void bps_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct bps_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int bps_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct bps_ctx *ctx = vb2_get_drv_priv(vq);
+	struct bps_device *bps = ctx->bps;
+	int ret;
+
+	/* Allocate command buffers */
+	ctx->cmd_bufs = bps_cmd_bufs_alloc(bps->dev);
+	if (!ctx->cmd_bufs)
+		return -ENOMEM;
+
+	/* Initialize default IQ (passthrough demosaic) */
+	bps_iq_init_passthrough(&ctx->iq);
+	ctx->frame_id = 0;
+
+	return 0;
+}
+
+static void bps_stop_streaming(struct vb2_queue *vq)
+{
+	struct bps_ctx *ctx = vb2_get_drv_priv(vq);
+	struct bps_device *bps = ctx->bps;
+	struct vb2_v4l2_buffer *vbuf;
+
+	/* Return all buffers */
+	while ((vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	while ((vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx)))
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+
+	/* Free command buffers */
+	if (ctx->cmd_bufs) {
+		bps_cmd_bufs_free(bps->dev, ctx->cmd_bufs);
+		ctx->cmd_bufs = NULL;
+	}
+}
+
+static const struct vb2_ops bps_vb2_ops = {
+	.queue_setup = bps_queue_setup,
+	.buf_prepare = bps_buf_prepare,
+	.buf_queue = bps_buf_queue,
+	.start_streaming = bps_start_streaming,
+	.stop_streaming = bps_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static int bps_queue_init(void *priv, struct vb2_queue *src_vq,
+			  struct vb2_queue *dst_vq)
+{
+	struct bps_ctx *ctx = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = ctx;
+	src_vq->buf_struct_size = sizeof(struct vb2_v4l2_buffer);
+	src_vq->ops = &bps_vb2_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &ctx->bps->lock;
+	src_vq->dev = ctx->bps->dev;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->buf_struct_size = sizeof(struct vb2_v4l2_buffer);
+	dst_vq->ops = &bps_vb2_ops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &ctx->bps->lock;
+	dst_vq->dev = ctx->bps->dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+/* ============================================================
+ * File Operations
+ * ============================================================ */
+
+static int bps_open(struct file *file)
+{
+	struct bps_device *bps = video_drvdata(file);
+	struct bps_ctx *ctx;
+	int ret;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = bps_power_on(bps);
+	if (ret)
+		return ret;
+
+	ret = icp_hfi_create_handle(bps->hfi, HFI_DEV_TYPE_BPS, (u64)ctx, &ctx->fw_handle, 100);
+	if (ret) {
+		dev_err(bps->dev, "icp_hfi_create_handle fail %d\n", ret);
+		goto err_power;
+	}
+
+	ctx->bps = bps;
+	ctx->width = 4096;
+	ctx->height = 3072;
+	ctx->src_fmt = V4L2_PIX_FMT_SRGGB10;
+	ctx->bayer_pattern = HFI_BAYER_RGGB;  /* Default, updated by s_fmt */
+
+	v4l2_fh_init(&ctx->fh, &bps->vdev);
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(bps->m2m_dev, ctx, bps_queue_init);
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
+
+err_power:
+	bps_power_off(bps);
+	return ret;
+}
+
+static int bps_release(struct file *file)
+{
+	struct bps_ctx *ctx = container_of(file->private_data, struct bps_ctx, fh);
+	struct bps_device *bps = video_drvdata(file);
+	int ret;
+
+	ret = icp_hfi_destroy_handle(bps->hfi, HFI_DEV_TYPE_BPS, (u64)ctx, ctx->fw_handle, 100);
+	if (ret) {
+		dev_err(bps->dev, "failed to destory handle %d\n", ret);
+	}
+
+	bps_power_off(bps);
+
+	v4l2_fh_del(&ctx->fh, file);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_fh_exit(&ctx->fh);
+	kfree(ctx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations bps_fops = {
+	.owner = THIS_MODULE,
+	.open = bps_open,
+	.release = bps_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+/* ============================================================
+ * Platform Driver
+ * ============================================================ */
+
+static int camss_bps_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bps_device *bps;
+	int ret;
+
+	bps = devm_kzalloc(dev, sizeof(*bps), GFP_KERNEL);
+	if (!bps)
+		return -ENOMEM;
+
+	bps->dev = dev;
+	platform_set_drvdata(pdev, bps);
+	mutex_init(&bps->lock);
+
+	/* Map registers */
+	bps->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bps->base))
+		return PTR_ERR(bps->base);
+
+	/* Get clocks */
+	bps->clocks[0].id = "ahb";
+	bps->clocks[1].id = "fast_ahb";
+	bps->clocks[2].id = "core";
+	bps->clocks[3].id = "cpas";
+	bps->num_clocks = BPS_CLK_MAX;
+
+	ret = devm_clk_bulk_get(dev, bps->num_clocks, bps->clocks);
+	if (ret)
+		return ret;
+
+	/* Get interconnect */
+	bps->icc_mem = devm_of_icc_get(dev, "mem");
+	if (IS_ERR(bps->icc_mem))
+		return PTR_ERR(bps->icc_mem);
+
+	/* Get UBWC config */
+	of_property_read_u32(dev->of_node, "ubwc-fetch-cfg", &bps->ubwc.fetch_cfg);
+	of_property_read_u32(dev->of_node, "ubwc-write-cfg", &bps->ubwc.write_cfg);
+
+	/* Get ICP reference */
+	struct device_node *icp_np;
+	struct platform_device *icp_pdev;
+
+	icp_np = of_parse_phandle(dev->of_node, "qcom,icp", 0);
+	if (!icp_np) {
+		dev_err(dev, "missing qcom,icp phandle\n");
+		return -ENODEV;
+	}
+
+	icp_pdev = of_find_device_by_node(icp_np);
+	of_node_put(icp_np);
+
+	bps->hfi = icp_hfi_get(&icp_pdev->dev);
+	if (IS_ERR(bps->hfi))
+		return PTR_ERR(bps->hfi);
+
+	if (!icp_pdev)
+		return -EPROBE_DEFER;
+
+	bps->icp_dev = &icp_pdev->dev;
+
+	/* Register V4L2 device */
+	ret = v4l2_device_register(dev, &bps->v4l2_dev);
+	if (ret)
+		goto err_icp;
+
+	/* Create M2M device */
+	bps->m2m_dev = v4l2_m2m_init(&bps_m2m_ops);
+	if (IS_ERR(bps->m2m_dev)) {
+		ret = PTR_ERR(bps->m2m_dev);
+		goto err_v4l2;
+	}
+
+	/* Register video device */
+	bps->vdev.fops = &bps_fops;
+	bps->vdev.ioctl_ops = &bps_ioctl_ops;
+	bps->vdev.release = video_device_release_empty;
+	bps->vdev.v4l2_dev = &bps->v4l2_dev;
+	bps->vdev.vfl_dir = VFL_DIR_M2M;
+	bps->vdev.lock = &bps->lock;
+	bps->vdev.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	strscpy(bps->vdev.name, "qcom-bps", sizeof(bps->vdev.name));
+	video_set_drvdata(&bps->vdev, bps);
+
+	ret = video_register_device(&bps->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto err_m2m;
+
+	pm_runtime_enable(dev);
+
+	dev_info(dev, "BPS registered as /dev/video%d\n", bps->vdev.num);
+
+	return 0;
+
+err_m2m:
+	v4l2_m2m_release(bps->m2m_dev);
+err_v4l2:
+	v4l2_device_unregister(&bps->v4l2_dev);
+err_icp:
+	put_device(bps->icp_dev);
+	return ret;
+}
+
+static void camss_bps_remove(struct platform_device *pdev)
+{
+	struct bps_device *bps = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(bps->dev);
+	video_unregister_device(&bps->vdev);
+	v4l2_m2m_release(bps->m2m_dev);
+	v4l2_device_unregister(&bps->v4l2_dev);
+	put_device(bps->icp_dev);
+}
+
+static const struct of_device_id camss_bps_dt_match[] = {
+	{ .compatible = "qcom,x1e80100-camss-bps" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, camss_bps_dt_match);
+
+static struct platform_driver camss_bps_driver = {
+	.probe = camss_bps_probe,
+	.remove = camss_bps_remove,
+	.driver = {
+		.name = "camss-bps",
+		.of_match_table = camss_bps_dt_match,
+	},
+};
+
+module_platform_driver(camss_bps_driver);
+
+MODULE_DESCRIPTION("Qualcomm CAMSS BPS V4L2 M2M driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-bps.h b/drivers/media/platform/qcom/camss/camss-bps.h
new file mode 100644
index 0000000000000..dec558b721491
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-bps.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm CAMSS BPS (Bayer Processing Segment) Driver
+ *
+ * The BPS performs Bayer demosaicing and initial image processing,
+ * controlled by ICP firmware.
+ *
+ * Processing pipeline:
+ * - Pedestal correction
+ * - Linearisation
+ * - Black level correction
+ * - Bad pixel correction
+ * - Demosaicing (Bayer to RGB/YUV)
+ * - Colour correction
+ * - Gamma correction
+ *
+ * Copyright (c) 2026 Bryan O'Donoghue.
+ */
+
+#ifndef __CAMSS_BPS_H__
+#define __CAMSS_BPS_H__
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
+ * BPS Clock Indices
+ */
+enum bps_clk_id {
+	BPS_CLK_AHB,
+	BPS_CLK_FAST_AHB,
+	BPS_CLK_CORE,
+	BPS_CLK_CPAS,
+	BPS_CLK_MAX,
+};
+
+/*
+ * BPS Device
+ */
+struct camss_bps {
+	struct device *dev;
+	struct camss_icp *icp;
+
+	/* Register base (informational - ICP firmware programs registers) */
+	void __iomem *base;
+
+	/* Clocks */
+	struct clk *clocks[BPS_CLK_MAX];
+
+	/* Power domain (BPS_GDSC) */
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
+int camss_bps_power_on(struct camss_bps *bps);
+void camss_bps_power_off(struct camss_bps *bps);
+int camss_bps_set_clock(struct camss_bps *bps, u32 rate);
+
+#endif /* __CAMSS_BPS_H__ */

-- 
2.54.0


