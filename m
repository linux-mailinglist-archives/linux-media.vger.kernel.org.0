Return-Path: <linux-media+bounces-65756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UvHrJOCYPmoaIwkAu9opvQ
	(envelope-from <linux-media+bounces-65756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:21:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17C6CE6D3
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:21:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=boP+SZqU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65756-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65756-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F4583100D12
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 15:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4480A37C0F7;
	Fri, 26 Jun 2026 15:14:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC7037F73E;
	Fri, 26 Jun 2026 15:13:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486840; cv=none; b=D2g4NoMQby3DBfIvp0tww/uuGooRBB6fdNa1WQOmQkbBHxbst0EtSNvUzUOU9tyL/T1qZwkQI2CwOz0Tbm0cl1KpwOZ1DeTTbETYSBjRJZ8nOX1l2Y04jEIMuoTmc19IX2nU0FnGjRXj1RMO6pDBu95ZryFVzKcFqz8MJeWdqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486840; c=relaxed/simple;
	bh=zG/G9gIEEA7onn1XkF6bZRc0l8nflfHpI78ZXFdTfFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GA/L7mRZPinxAUKtV+icAalfWJ8pLUHzu/pQcE42a4G9SwBilJLxso96TwjP8980XS6UwqvAhGTs1pyyCcQBB5wwnKEgx6QGeb5ha+xh5+mYDem8Q/293z5XT2/ffBZP2eoQ3VdG+3OsXkegkbpYih4nCrwjb5S1/a19PrHmf5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=boP+SZqU; arc=none smtp.client-ip=213.167.242.64
Received: from [10.1.1.1] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDBD019EC;
	Fri, 26 Jun 2026 17:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782486777;
	bh=zG/G9gIEEA7onn1XkF6bZRc0l8nflfHpI78ZXFdTfFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=boP+SZqUKMrfnVV3+mGhlSzCoDooCsoC5TeVn9np3yUfhTZSN/xuMEXNYRv0OZwe1
	 LcE/WQ2uUCK5LC5LN69mEzwStzHJf8oORHVHGctElvsngEVQXc98g0waVT6MfhJ8iT
	 z1MK0XEpgNudyDL+o3Plq6dCtvH20oYJd4nT9o+s=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 26 Jun 2026 17:13:22 +0200
Subject: [PATCH v2 3/6] media: v4l2-isp: Rename v4l2_isp_params_buffer_size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260626-extensible-stats-v2-3-41fdd5cf728b@ideasonboard.com>
References: <20260626-extensible-stats-v2-0-41fdd5cf728b@ideasonboard.com>
In-Reply-To: <20260626-extensible-stats-v2-0-41fdd5cf728b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4534;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=zG/G9gIEEA7onn1XkF6bZRc0l8nflfHpI78ZXFdTfFk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqPpcd2GYWCfFgbNISN4yQyCvEGlTTcZoPy1h76
 c5o+9MfKDOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj6XHQAKCRByNAaPFqFW
 PDbFD/94mZr0uvPbo/GLKl8q0G2KGSxROgS4qPBngD+FO8uI2NcRbucRwFDqy2fNAFp4NAW1Ymy
 fVORWr/10WrCWUyBff8dUmfBhqdWc/Zqolr62Qm/YzcDrRqMhGEyowU3sTITG7nO49EraEiA45l
 zZkFk9pgWBuxC0VXKp1IPPXnManYLGhNqekijShcjQNMmrGeImUNvVj5FMxzOWjGTlV9v50wqfe
 6bXz/9O5G4+GCvehXHelrcVC7EnL6n7bAgitHzsbAgJM+gE8IozFHoxFZ7334Gq/kbn+iq6eofJ
 oZRCgmp6TMKDSHGa/Gu3L2FF6m7lUr0e2C3IeXSTtUJahUkmhAB6XVFD9a54IX20UEczC88TnlN
 yRQ8EUSctZHe/rdvLAU4F/heOAi6XIci2Tl2DLoQuT/y8sPkoXs/v3Xt8wkn8RHWhnEkL2cj8HF
 0YCKuS1azr10epDP57AP0FH1MWA45b37C9HsoqFdZMHGrpjCxIi95ecXXyAurzn/SpKqty4otM+
 Ne3S617wNnl+cXz2GzIhVuPkwoNV+cWXF2PDsHCsOFdAqCnBFcTLsoVgOdI19WykhEK53KUOc4w
 MlqDbu8sP8Emf+3uQ1mbi9BrzIw+23j6jePLYEj8i49FGN4nJLL6rQ5A0s54NY7X3+uWhe/J6aa
 GAYPlh9g/pO1qgw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65756-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:dan.scally@ideasonboard.com,m:keke.li@amlogic.com,m:antoine.bouyer@nxp.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ragnatech.se:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D17C6CE6D3

Rename v4l2_isp_params_buffer_size() to v4l2_isp_buffer_size() to
support statistics.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 12 ++++++------
 include/media/v4l2-isp.h                           | 22 +++++++++++++---------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index de0e9d898db7..dc483f0322d6 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -487,7 +487,7 @@ static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
 {
 	static const struct v4l2_meta_format mfmt = {
 		.dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
-		.buffersize = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
+		.buffersize = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
 	};
 
 	f->fmt.meta = mfmt;
@@ -540,13 +540,13 @@ mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 	if (*num_planes && *num_planes > 1)
 		return -EINVAL;
 
-	if (sizes[0] && sizes[0] < v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
+	if (sizes[0] && sizes[0] < v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
 		return -EINVAL;
 
 	*num_planes = 1;
 
 	if (!sizes[0])
-		sizes[0] = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
+		sizes[0] = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
 
 	return 0;
 }
@@ -556,7 +556,7 @@ static int mali_c55_params_buf_init(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
 
-	buf->config = kvmalloc(v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
+	buf->config = kvmalloc(v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
 			       GFP_KERNEL);
 	if (!buf->config)
 		return -ENOMEM;
@@ -583,7 +583,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	int ret;
 
 	ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
-			v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
+			v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 	if (ret)
 		return ret;
 
@@ -593,7 +593,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	 * changed to the buffer content whilst the driver processes it.
 	 */
 
-	memcpy(buf->config, config, v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
+	memcpy(buf->config, config, v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 
 	return v4l2_isp_params_validate_buffer(mali_c55->dev, vb, buf->config,
 					       mali_c55_params_block_types_info,
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index f3a6d0edcb24..d70ed6b431e7 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -15,17 +15,21 @@ struct device;
 struct vb2_buffer;
 
 /**
- * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
- * @max_params_size: The total size of the ISP configuration blocks
+ * v4l2_isp_buffer_size - Calculate size of v4l2_isp_buffer
+ * @max_size: The total size of the ISP configuration or statistics blocks
+ *
+ * Users of v4l2-isp will have differing sized data arrays for parameters and
+ * statistics, depending on their specific blocks. Drivers need to be able to
+ * calculate the appropriate size of the buffer to accommodate all ISP blocks
+ * supported by the platform. This macro provides a convenient tool for the
+ * calculation.
+ *
+ * The intended users of this function are drivers initializing the size
+ * of their metadata (parameters and statistics) buffers.
  *
- * Users of the v4l2 extensible parameters will have differing sized data arrays
- * depending on their specific parameter buffers. Drivers and userspace will
- * need to be able to calculate the appropriate size of the struct to
- * accommodate all ISP configuration blocks provided by the platform.
- * This macro provides a convenient tool for the calculation.
  */
-#define v4l2_isp_params_buffer_size(max_params_size) \
-	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
+#define v4l2_isp_buffer_size(max_size)			\
+	(offsetof(struct v4l2_isp_buffer, data) + (max_size))
 
 /**
  * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes

-- 
2.54.0


