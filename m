Return-Path: <linux-media+bounces-25035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE586A17B8F
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 11:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89EC03ABEE0
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 10:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C489A1F130A;
	Tue, 21 Jan 2025 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="ZjAI+eAf"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D71DEFF8;
	Tue, 21 Jan 2025 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455066; cv=none; b=VfdaMfl3Yl1jg+JKkl7ZQD8pXTbKinvMQFKxDzqPeUPxT9Myb3QpDuipwqJplzYrey/poYyqtP50N5Vgl1wWoAQClwoa+E1oQBPxM9sqsAQwuW25JOb3vVCDm0Ff7uJp6WDLsaHISvoAN5oqbB3IFDEbXXzXq+b4HMQDAj4RPqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455066; c=relaxed/simple;
	bh=GYKqLGOEUDB/Y35iiNj7GlsYCmqV2YadQb7NtXY3JGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Av6cODrIuWmJWaZgVDXiIkpHgYgcU9yjE3+1gFsaKDyf7okOiAT4LQdAqmJUqDnCUH3SXO3xk9l4vnBWMw2bALskz3BkCllFHL4TLDb1TvUugYhYMtWUaMGWs+9isj/i6tlS8MbAtuyEGRbgd6gL1XKLEffvu/NOzUe8J4v5ci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=ZjAI+eAf; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DSRgRNVV3Ur3QTR1Wquh/OSJwtId6L0zax2lpNVDvOE=; b=ZjAI+eAf6tAXW6TcYBjIOcmqhG
	jd5JnZVKBqswzC6vSUS6zIZlvGc4fRluknNnghYE7o4y7PUBKz6atJsfhSZmzFPwmwOjvVZIg8KPR
	HJcxEJSAWNc6bgZ1qhHxBC8USi4re5uVPNAxaf6IE/DKpj2Ub8+unNnfWa96sM1h4a+s=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:54171 helo=localhost.localdomain)
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1taB0S-00CGNm-7r; Tue, 21 Jan 2025 10:57:13 +0100
From: Matthias Fend <matthias.fend@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: m.felsch@pengutronix.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] media: tc358746: fix locking issue
Date: Tue, 21 Jan 2025 10:56:55 +0100
Message-Id: <20250121095656.257786-2-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121095656.257786-1-matthias.fend@emfend.at>
References: <20250121095656.257786-1-matthias.fend@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi folks, some time ago I asked for advice on a deadlock in
    tc358746_link_validate() of the TC358746 driver [1]. Since there was no feedback
    on this, I have now changed the behavior to what I suggested as a pot [...]
    
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

In tc358746_link_validate() an attempt is made to get the state lock of the
subdev, but since this is already held by the calling function
v4l2_subdev_link_validate(), this leads to a deadlock.
Another problem is that this function queries the link frequency of the
source device. Since some image sensors use the lock of the v4l2 control
handler as a state lock, which is already held at this point, a deadlock
can also occur here.
Move the calculation of the FIFO size from tc358746_link_validate() to
tc358746_apply_misc_config() to avoid the deadlocks mentioned.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/tc358746.c | 191 +++++++++++++++++------------------
 1 file changed, 90 insertions(+), 101 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 31586f8e4be4..8c169860b972 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -161,10 +161,6 @@ struct tc358746 {
 	u16				pll_pre_div;
 	u16				pll_mul;
 
-#define TC358746_VB_MAX_SIZE		(511 * 32)
-#define TC358746_VB_DEFAULT_SIZE	  (1 * 32)
-	unsigned int			vb_size; /* Video buffer size in bits */
-
 	struct phy_configure_opts_mipi_dphy dphy_cfg;
 };
 
@@ -415,6 +411,70 @@ tc358746_apply_pll_config(struct tc358746 *tc358746)
 	return tc358746_set_bits(tc358746, PLLCTL1_REG, CKEN);
 }
 
+#define TC358746_VB_PRECISION		10
+#define TC358746_VB_MAX_SIZE		(511 * 32)
+#define TC358746_VB_DEFAULT_SIZE	(1 * 32)
+
+static int tc358746_calc_vb_size(struct tc358746 *tc358746,
+				 s64 source_link_freq,
+				 const struct v4l2_mbus_framefmt *mbusfmt,
+				 const struct tc358746_format *fmt)
+{
+	unsigned long csi_bitrate, source_bitrate;
+	unsigned int fifo_sz, tmp, n;
+	int vb_size; /* Video buffer size in bits */
+
+	source_bitrate = source_link_freq * fmt->bus_width;
+
+	csi_bitrate = tc358746->dphy_cfg.lanes * tc358746->pll_rate;
+
+	dev_dbg(tc358746->sd.dev,
+		"Fifo settings params: source-bitrate:%lu csi-bitrate:%lu",
+		source_bitrate, csi_bitrate);
+
+	/* Avoid possible FIFO overflows */
+	if (csi_bitrate < source_bitrate)
+		return -EINVAL;
+
+	/* Best case */
+	if (csi_bitrate == source_bitrate) {
+		fifo_sz = TC358746_VB_DEFAULT_SIZE;
+		vb_size = TC358746_VB_DEFAULT_SIZE;
+	} else {
+		/*
+		 * Avoid possible FIFO underflow in case of
+		 * csi_bitrate > source_bitrate. For such case the chip has a internal
+		 * fifo which can be used to delay the line output.
+		 *
+		 * Fifo size calculation (excluding precision):
+		 *
+		 * fifo-sz, image-width - in bits
+		 * sbr                  - source_bitrate in bits/s
+		 * csir                 - csi_bitrate in bits/s
+		 *
+		 * image-width / csir >= (image-width - fifo-sz) / sbr
+		 * image-width * sbr / csir >= image-width - fifo-sz
+		 * fifo-sz >= image-width - image-width * sbr / csir; with n = csir/sbr
+		 * fifo-sz >= image-width - image-width / n
+		 */
+		source_bitrate /= TC358746_VB_PRECISION;
+		n = csi_bitrate / source_bitrate;
+		tmp = (mbusfmt->width * TC358746_VB_PRECISION) / n;
+		fifo_sz = mbusfmt->width - tmp;
+		fifo_sz *= fmt->bpp;
+		vb_size = round_up(fifo_sz, 32);
+	}
+
+	dev_dbg(tc358746->sd.dev,
+		"Found FIFO size[bits]:%u -> aligned to size[bits]:%u\n",
+		fifo_sz, vb_size);
+
+	if (vb_size > TC358746_VB_MAX_SIZE)
+		return -EINVAL;
+
+	return vb_size;
+}
+
 static int tc358746_apply_misc_config(struct tc358746 *tc358746)
 {
 	const struct v4l2_mbus_framefmt *mbusfmt;
@@ -422,6 +482,9 @@ static int tc358746_apply_misc_config(struct tc358746 *tc358746)
 	struct v4l2_subdev_state *sink_state;
 	const struct tc358746_format *fmt;
 	struct device *dev = sd->dev;
+	struct media_pad *source_pad;
+	s64 source_link_freq;
+	int vb_size;
 	u32 val;
 	int err;
 
@@ -430,6 +493,21 @@ static int tc358746_apply_misc_config(struct tc358746 *tc358746)
 	mbusfmt = v4l2_subdev_state_get_format(sink_state, TC358746_SINK);
 	fmt = tc358746_get_format_by_code(TC358746_SINK, mbusfmt->code);
 
+	source_pad = media_entity_remote_source_pad_unique(&sd->entity);
+	if (IS_ERR(source_pad)) {
+		dev_err(dev, "Failed to get source pad of %s\n", sd->name);
+		err = PTR_ERR(source_pad);
+		goto out;
+	}
+	source_link_freq = v4l2_get_link_freq(source_pad, 0, 0);
+	if (source_link_freq <= 0) {
+		dev_err(dev,
+			"Failed to query or invalid source link frequency\n");
+		/* Return -EINVAL in case of source_link_freq is 0 */
+		err = source_link_freq ?: -EINVAL;
+		goto out;
+	}
+
 	/* Self defined CSI user data type id's are not supported yet */
 	val = PDFMT(fmt->pdformat);
 	dev_dbg(dev, "DATAFMT: 0x%x\n", val);
@@ -443,7 +521,13 @@ static int tc358746_apply_misc_config(struct tc358746 *tc358746)
 	if (err)
 		goto out;
 
-	val = tc358746->vb_size / 32;
+	vb_size = tc358746_calc_vb_size(tc358746, source_link_freq, mbusfmt, fmt);
+	if (vb_size < 0) {
+		err = vb_size;
+		goto out;
+	}
+
+	val = vb_size / 32;
 	dev_dbg(dev, "FIFOCTL: %u (0x%x)\n", val, val);
 	err = tc358746_write(tc358746, FIFOCTL_REG, val);
 	if (err)
@@ -882,99 +966,6 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
 	return best_freq;
 }
 
-#define TC358746_PRECISION 10
-
-static int
-tc358746_link_validate(struct v4l2_subdev *sd, struct media_link *link,
-		       struct v4l2_subdev_format *source_fmt,
-		       struct v4l2_subdev_format *sink_fmt)
-{
-	struct tc358746 *tc358746 = to_tc358746(sd);
-	unsigned long csi_bitrate, source_bitrate;
-	struct v4l2_subdev_state *sink_state;
-	struct v4l2_mbus_framefmt *mbusfmt;
-	const struct tc358746_format *fmt;
-	unsigned int fifo_sz, tmp, n;
-	struct v4l2_subdev *source;
-	struct media_pad *src_pad;
-	s64 source_link_freq;
-	int err;
-
-	err = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
-	if (err)
-		return err;
-
-	sink_state = v4l2_subdev_lock_and_get_active_state(sd);
-	mbusfmt = v4l2_subdev_state_get_format(sink_state, TC358746_SINK);
-
-	/* Check the FIFO settings */
-	fmt = tc358746_get_format_by_code(TC358746_SINK, mbusfmt->code);
-
-	source = media_entity_to_v4l2_subdev(link->source->entity);
-	src_pad = &source->entity.pads[source_fmt->pad];
-	source_link_freq = v4l2_get_link_freq(src_pad, 0, 0);
-	if (source_link_freq <= 0) {
-		dev_err(tc358746->sd.dev,
-			"Failed to query or invalid source link frequency\n");
-		v4l2_subdev_unlock_state(sink_state);
-		/* Return -EINVAL in case of source_link_freq is 0 */
-		return source_link_freq ? : -EINVAL;
-	}
-	source_bitrate = source_link_freq * fmt->bus_width;
-
-	csi_bitrate = tc358746->dphy_cfg.lanes * tc358746->pll_rate;
-
-	dev_dbg(tc358746->sd.dev,
-		"Fifo settings params: source-bitrate:%lu csi-bitrate:%lu",
-		source_bitrate, csi_bitrate);
-
-	/* Avoid possible FIFO overflows */
-	if (csi_bitrate < source_bitrate) {
-		v4l2_subdev_unlock_state(sink_state);
-		return -EINVAL;
-	}
-
-	/* Best case */
-	if (csi_bitrate == source_bitrate) {
-		fifo_sz = TC358746_VB_DEFAULT_SIZE;
-		tc358746->vb_size = TC358746_VB_DEFAULT_SIZE;
-		goto out;
-	}
-
-	/*
-	 * Avoid possible FIFO underflow in case of
-	 * csi_bitrate > source_bitrate. For such case the chip has a internal
-	 * fifo which can be used to delay the line output.
-	 *
-	 * Fifo size calculation (excluding precision):
-	 *
-	 * fifo-sz, image-width - in bits
-	 * sbr                  - source_bitrate in bits/s
-	 * csir                 - csi_bitrate in bits/s
-	 *
-	 * image-width / csir >= (image-width - fifo-sz) / sbr
-	 * image-width * sbr / csir >= image-width - fifo-sz
-	 * fifo-sz >= image-width - image-width * sbr / csir; with n = csir/sbr
-	 * fifo-sz >= image-width - image-width / n
-	 */
-
-	source_bitrate /= TC358746_PRECISION;
-	n = csi_bitrate / source_bitrate;
-	tmp = (mbusfmt->width * TC358746_PRECISION) / n;
-	fifo_sz = mbusfmt->width - tmp;
-	fifo_sz *= fmt->bpp;
-	tc358746->vb_size = round_up(fifo_sz, 32);
-
-out:
-	dev_dbg(tc358746->sd.dev,
-		"Found FIFO size[bits]:%u -> aligned to size[bits]:%u\n",
-		fifo_sz, tc358746->vb_size);
-
-	v4l2_subdev_unlock_state(sink_state);
-
-	return tc358746->vb_size > TC358746_VB_MAX_SIZE ? -EINVAL : 0;
-}
-
 static int tc358746_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				    struct v4l2_mbus_config *config)
 {
@@ -1042,7 +1033,7 @@ static const struct v4l2_subdev_pad_ops tc358746_pad_ops = {
 	.enum_mbus_code = tc358746_enum_mbus_code,
 	.set_fmt = tc358746_set_fmt,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.link_validate = tc358746_link_validate,
+	.link_validate = v4l2_subdev_link_validate_default,
 	.get_mbus_config = tc358746_get_mbus_config,
 };
 
@@ -1354,8 +1345,6 @@ tc358746_init_output_port(struct tc358746 *tc358746, unsigned long refclk)
 	if (err)
 		goto err;
 
-	tc358746->vb_size = TC358746_VB_DEFAULT_SIZE;
-
 	return 0;
 
 err:
-- 
2.34.1


