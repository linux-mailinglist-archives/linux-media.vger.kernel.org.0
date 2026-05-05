Return-Path: <linux-media+bounces-60436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLe2NTz8+WkqFwMAu9opvQ
	(envelope-from <linux-media+bounces-60436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:18:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 347164CF3E9
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 780E030E4817
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAAE3E51D7;
	Tue,  5 May 2026 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IoQxL31U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308EB42B72D;
	Tue,  5 May 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990368; cv=none; b=JpPVbRdzsXJMswxY4pLxReHhIzlF2e0NTyMohrRZ1PQdMBejl4ZWoR2j7D9ehBiEkQk2HwdZyIrrZH+SmmvciY4eUOb/4Lpa0CLDODpi3E12vzdzQxhtg36QipT+E6SVH1SJiBZz6e0cXMgCFGMnsWrRGCMfm2oMPemwByU2YOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990368; c=relaxed/simple;
	bh=bpglAInsweFej64GPG8NT2v508+PDgnI8avIUtvLiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ts1Vj84nmjKfYw2/dKh8qy7HjDAG8/fhL3RW00wU6rorO4qafpL8E+rosgnZnvv7Cw6ZVBll3YZngkXZG6kQ9w91irMOu7eKepvkTr3XHSIIqbCUjR4nfNPhmUesAu8gozaY08swir/d64DO6ofafsBazChaVUtFfj34byxiU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IoQxL31U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.83] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C493A1C4D;
	Tue,  5 May 2026 16:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777990357;
	bh=bpglAInsweFej64GPG8NT2v508+PDgnI8avIUtvLiQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IoQxL31UcZimQo7tcSRIxCMdVNycibTKvpArA6TPtVrwN+HmEYI4hWgswlcYkW8N9
	 SZfiqqichCtGVGM547ND81JHZoa6Rpo1VR/l82FTfDkOychbMClWJGBwr5xlc/mYtS
	 tOLWyfL+bVgm7rxA7X2IT3QlIc8pNfoNcyEYS/fA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 May 2026 16:12:14 +0200
Subject: [PATCH 3/6] media: v4l2-isp: Rename v4l2_isp_params_buffer_size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-extensible-stats-v1-3-e16f326b8dad@ideasonboard.com>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
In-Reply-To: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4462;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=bpglAInsweFej64GPG8NT2v508+PDgnI8avIUtvLiQQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBp+frTn3dYArrSheys/cCo0h0d6yo2bEmmdT3zf
 YfO8K2x66+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCafn60wAKCRByNAaPFqFW
 PCWWEACONzcAC8EEY/2YP9BA71Mg0o/0WoSoKfiVYf04Sqo8LRiPMIaDODzhY3uITUj/xDCnMUX
 sgVNT8aOKpvBS+12lHYiPBmKvuGsjavLsfo+f2IHHkHVDVx8/UgaKrsBC+xHS2HhM2Jlp69cNVM
 qxwJ0uUW2t2vlxhtmeT8zz4dOCTD35byyPoiQ0VV2ZpuEiVtjoclQrixmdB+xHrJWDBpwlu5pjn
 O9klgSV5zuKTTMqu7bo4N5WArVf66296tvl8HD6jbHHdsW+WiOVWVzOgbJmt2LAfSkWNfksY3hQ
 lCcMBxsXojAaXi26oopTkYpALiC8CKH5GV3x4Xy4hbk6dUz4Aln4KBZDl8kiZmHw47+3LWPP7Xp
 7GgugFQZPuUyOqrq6MBs+77rqCcWknh0X9OuoVhfopFCGmZ+f53NoWLB0X70IPyWr5466fRMnaG
 eI/oXIMgfV2e9aREQRMH29fDZeDXfr3uW6zS3bIQohgbMsPNhXvjEAj1emd6UvdEyihDWVq09zo
 UqTx6H6cw8eAPJBpbXD96d1QmrUYxlouPXWyNaUJ27uVHa7WXwcF1WzH/wvc9OL/tf0EPOei1Fc
 gKP1JngBxM6Hhg93Dzz0ehDY9n+Uwimb3hfbkTByLe72AFH05X/ANVx5mWiayCeC04sSAgTR8jV
 Y+hgY/Paw/SZ3HA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Queue-Id: 347164CF3E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60436-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Rename v4l2_isp_params_buffer_size() to v4l2_isp_buffer_size() to
support statistics.

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
2.53.0


