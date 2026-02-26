Return-Path: <linux-media+bounces-53498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G4ADNBNoGnvhwQAu9opvQ
	(envelope-from <linux-media+bounces-53498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:42:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E11A6D2E
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AF6230AE7AE
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07A2363C49;
	Thu, 26 Feb 2026 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQDV+gkh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0536166C
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113071; cv=none; b=jq6+VqtXufvabaMVvoMd58PIQndVqfzs3OEAd9iHXpKW4j4pz9BcZu0PYC5i8p8ORLOEnaiGn7v2cAXAzaVsEfH4b0iwUbU+ls2e4BRE3TeZdUkLvtly7SKjGWhkNei4ybwec8OeSCpksKNvW254my1XHuWtvZDXPbt1ssq8Q4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113071; c=relaxed/simple;
	bh=4OOI5cjvkJQZrEf7fhTRrthjjoo4MhyuIDj5eSAam1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5VwTd9F+itQ8DRvsfriccUeCABarxI2URbphUNw28bKSkcvRvq5+60B2leBH52lprvEiLsQ+GK+iq3lwOlcrJZ026fiPOI/1jNHn2G5l3Di/kyIdAC/zvKYibGhL2+odO5IvSsTLcecVKZ8ttEmsdkK+Dz0uQq4tT/u/gkSKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQDV+gkh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e61a19ca4so163343e87.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 05:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772113068; x=1772717868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yJVbE8xcQeQ9nT+wWbyDuttouqcyOYx/th6SopR6kY=;
        b=CQDV+gkhaZpxPO6iI12unXzWYKfr6zQqyTyjNxHQyrJEY80ylrwDtNd22CEdFZgXdO
         MVocgI10njV5lglEIhhwq+z5jS4N0Xh30jPV32P5xeULDS3EIw5R1z+IaFFVqHE1CBJv
         9d0th/Epu4//WJoq0nwALwX8DsVYOP0uEaMtuYcWJ15NUCY7HWRm8QfiG8ChXmfWVs97
         lQwkmT6hoN+UuVDt0Zm7fT1KhQHF1qSEHgeGZoCTEr4ALwSrmDNkOqSK6WAfizCJ1g72
         lPbeUYOJHIKRTnjaZLS5yTXW0XMep5TqIa6OvXCxTMsz98T5OZ41NsI2NnYTfDJMCwL3
         NqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113068; x=1772717868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5yJVbE8xcQeQ9nT+wWbyDuttouqcyOYx/th6SopR6kY=;
        b=kgvHs7tmEZWnGXIClzjdwkqfLd72ahZZpK7sAhyhxh8iCMr8Tcs3xAp/97C+IF55Hn
         +Bk9DAkFUSJ1h/59pJLdPY4z8Aik/nV63dDT4m5PMkuBjdUAaIf/04rItDTENJmEk+do
         UFTPDlZ+CJXp3DF95NgV9/YKxCHgZM+V6hDRllZMjlXNSheofSEvwVpYRGvtvdkqy0nT
         5JFcgJv4MjJA+US42OBPAfRIBdyevDzzHvjGiYWNKujL+dNEUOFHOsW+CFFgPXFwtPpm
         uVjfm4FUtYSudbtNpJHz72+ffE+vkNo0+WwER60lboAf22IAl9Vka+nM3W2ON5/C0fBY
         gsWA==
X-Forwarded-Encrypted: i=1; AJvYcCVpKsq8T54qjGRyjr34y8Fh0bLztC3QaGAqoA9hCh6gHJeWOxcckDMdQ462vBvRNQXeirRX8YgzTiy/og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qoaVbrthfwzLf7XwScapj0ar+ZgvNzdSyM5L4CXxqKDNwm4Z
	qyajXHQsiRblV/7Thmlm8aMWm54TWK9/r/6itN+iMwP/5DLAfHTw0/gsAW8A9zJ33Jw=
X-Gm-Gg: ATEYQzxvOxUUUYl63HQ0IBgHeHejik/7cN58unrKLn/C5OTtzWrx0G+OEI3QCO+lupc
	g6kByyq8zwSVS0xuWQsYB8ujtCXSpLvzhEp0zJTTPsd1GmWS0LSmLT7zGoS3/BVJKvGUIznNsLq
	bTcoLP1G9x8U1Tv1RWeLdfD+nmbLq/Z0CP9iEe/lanMwVOebUht6JmZGdlRHJG2z/y6mhFdZ/+3
	rwy8cqCil5gylP3TwdxsZ4VrbMZmR7gqb4rzJorsP1C3Bj5Jbc0ivVd6pwnXRS/ywDsXIK6ptBz
	H1U9hB+SYf47wuRI1VN7n8EbMOMuNGaRS0UqL81BMHrZXJ86N45Llnfv0BGv7+NXBASNFOrrKgL
	d1KqF/rm/3dO6kL8XJgTl9zZbOYZNdBw7n1s1xScFrL0Z63PHjx2HPAtKXgMNFHoDZRmR103BYO
	fbqxVxEUd5y/wEpNrtJI4IxmFhbuH5ZYRle4A+i/z5XMawC0BVDO/7pv4bO4uyoN0ERw==
X-Received: by 2002:ac2:51d5:0:b0:5a1:a77:ba5f with SMTP id 2adb3069b0e04-5a10a77bc29mr461004e87.2.1772113067798;
        Thu, 26 Feb 2026 05:37:47 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302292bsm6572041fa.45.2026.02.26.05.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:37:47 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/6] media: i2c: og01a1b: Switch from .s_stream to .enable_streams/.disable_streams
Date: Thu, 26 Feb 2026 15:37:35 +0200
Message-ID: <20260226133739.4050870-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53498-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 8E7E11A6D2E
X-Rspamd-Action: no action

The change allows to simplify the driver code, in particular the explicit
locking scheme for stream on/off or format update serialization can be
dropped in favour to the one provided by the V4L2 core internals.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 88 ++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 55 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 7b892b26203c..ea4c4c7b3d64 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -442,9 +442,6 @@ struct og01a1b {
 
 	/* Current mode */
 	const struct og01a1b_mode *cur_mode;
-
-	/* To serialize asynchronus callbacks */
-	struct mutex mutex;
 };
 
 static u64 to_pixel_rate(u32 f_index)
@@ -616,7 +613,6 @@ static int og01a1b_init_controls(struct og01a1b *og01a1b)
 	if (ret)
 		return ret;
 
-	ctrl_hdlr->lock = &og01a1b->mutex;
 	og01a1b->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &og01a1b_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
@@ -686,74 +682,66 @@ static void og01a1b_update_pad_format(const struct og01a1b_mode *mode,
 	fmt->field = V4L2_FIELD_NONE;
 }
 
-static int og01a1b_start_streaming(struct og01a1b *og01a1b)
+static int og01a1b_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
+	struct og01a1b *og01a1b = to_og01a1b(sd);
+	unsigned int link_freq_index = og01a1b->cur_mode->link_freq_index;
 	const struct og01a1b_reg_list *reg_list;
-	int link_freq_index, ret;
+	int ret;
 
-	link_freq_index = og01a1b->cur_mode->link_freq_index;
-	reg_list = &link_freq_configs[link_freq_index].reg_list;
+	ret = pm_runtime_resume_and_get(og01a1b->dev);
+	if (ret)
+		return ret;
 
+	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = og01a1b_write_reg_list(og01a1b, reg_list);
 	if (ret) {
-		dev_err(og01a1b->dev, "failed to set plls");
-		return ret;
+		dev_err(og01a1b->dev, "failed to set plls: %d\n", ret);
+		goto error;
 	}
 
 	reg_list = &og01a1b->cur_mode->reg_list;
 	ret = og01a1b_write_reg_list(og01a1b, reg_list);
 	if (ret) {
-		dev_err(og01a1b->dev, "failed to set mode");
+		dev_err(og01a1b->dev, "failed to set mode: %d\n", ret);
 		return ret;
 	}
 
 	ret = __v4l2_ctrl_handler_setup(og01a1b->sd.ctrl_handler);
 	if (ret)
-		return ret;
+		goto error;
 
 	ret = og01a1b_write_reg(og01a1b, OG01A1B_REG_MODE_SELECT,
 				OG01A1B_REG_VALUE_08BIT,
 				OG01A1B_MODE_STREAMING);
 	if (ret) {
-		dev_err(og01a1b->dev, "failed to set stream");
-		return ret;
+		dev_err(og01a1b->dev, "failed to start streaming: %d\n", ret);
+		goto error;
 	}
 
 	return 0;
-}
 
-static void og01a1b_stop_streaming(struct og01a1b *og01a1b)
-{
-	if (og01a1b_write_reg(og01a1b, OG01A1B_REG_MODE_SELECT,
-			      OG01A1B_REG_VALUE_08BIT, OG01A1B_MODE_STANDBY))
-		dev_err(og01a1b->dev, "failed to set stream");
+error:
+	pm_runtime_put_autosuspend(og01a1b->dev);
+
+	return ret;
 }
 
-static int og01a1b_set_stream(struct v4l2_subdev *sd, int enable)
+static int og01a1b_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
 {
 	struct og01a1b *og01a1b = to_og01a1b(sd);
-	int ret = 0;
-
-	mutex_lock(&og01a1b->mutex);
-	if (enable) {
-		ret = pm_runtime_resume_and_get(og01a1b->dev);
-		if (ret) {
-			mutex_unlock(&og01a1b->mutex);
-			return ret;
-		}
+	int ret;
 
-		ret = og01a1b_start_streaming(og01a1b);
-		if (ret) {
-			enable = 0;
-			og01a1b_stop_streaming(og01a1b);
-			pm_runtime_put(og01a1b->dev);
-		}
-	} else {
-		og01a1b_stop_streaming(og01a1b);
-		pm_runtime_put(og01a1b->dev);
-	}
+	ret = og01a1b_write_reg(og01a1b, OG01A1B_REG_MODE_SELECT,
+				OG01A1B_REG_VALUE_08BIT, OG01A1B_MODE_STANDBY);
+	if (ret)
+		dev_err(og01a1b->dev, "failed to stop streaming: %d\n", ret);
 
-	mutex_unlock(&og01a1b->mutex);
+	pm_runtime_put_autosuspend(og01a1b->dev);
 
 	return ret;
 }
@@ -771,7 +759,6 @@ static int og01a1b_set_format(struct v4l2_subdev *sd,
 				      height, fmt->format.width,
 				      fmt->format.height);
 
-	mutex_lock(&og01a1b->mutex);
 	og01a1b_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
@@ -794,8 +781,6 @@ static int og01a1b_set_format(struct v4l2_subdev *sd,
 					 h_blank);
 	}
 
-	mutex_unlock(&og01a1b->mutex);
-
 	return 0;
 }
 
@@ -805,15 +790,12 @@ static int og01a1b_get_format(struct v4l2_subdev *sd,
 {
 	struct og01a1b *og01a1b = to_og01a1b(sd);
 
-	mutex_lock(&og01a1b->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		fmt->format = *v4l2_subdev_state_get_format(sd_state,
 							    fmt->pad);
 	else
 		og01a1b_update_pad_format(og01a1b->cur_mode, &fmt->format);
 
-	mutex_unlock(&og01a1b->mutex);
-
 	return 0;
 }
 
@@ -849,18 +831,14 @@ static int og01a1b_enum_frame_size(struct v4l2_subdev *sd,
 
 static int og01a1b_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct og01a1b *og01a1b = to_og01a1b(sd);
-
-	mutex_lock(&og01a1b->mutex);
 	og01a1b_update_pad_format(&supported_modes[0],
 				  v4l2_subdev_state_get_format(fh->state, 0));
-	mutex_unlock(&og01a1b->mutex);
 
 	return 0;
 }
 
 static const struct v4l2_subdev_video_ops og01a1b_video_ops = {
-	.s_stream = og01a1b_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops og01a1b_pad_ops = {
@@ -868,6 +846,8 @@ static const struct v4l2_subdev_pad_ops og01a1b_pad_ops = {
 	.get_fmt = og01a1b_get_format,
 	.enum_mbus_code = og01a1b_enum_mbus_code,
 	.enum_frame_size = og01a1b_enum_frame_size,
+	.enable_streams = og01a1b_enable_streams,
+	.disable_streams = og01a1b_disable_streams,
 };
 
 static const struct v4l2_subdev_ops og01a1b_subdev_ops = {
@@ -1046,7 +1026,6 @@ static void og01a1b_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(og01a1b->dev);
-	mutex_destroy(&og01a1b->mutex);
 }
 
 static int og01a1b_probe(struct i2c_client *client)
@@ -1135,7 +1114,6 @@ static int og01a1b_probe(struct i2c_client *client)
 		goto power_off;
 	}
 
-	mutex_init(&og01a1b->mutex);
 	og01a1b->cur_mode = &supported_modes[0];
 	ret = og01a1b_init_controls(og01a1b);
 	if (ret) {
@@ -1143,6 +1121,7 @@ static int og01a1b_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
+	og01a1b->sd.state_lock = og01a1b->ctrl_handler.lock;
 	og01a1b->sd.internal_ops = &og01a1b_internal_ops;
 	og01a1b->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	og01a1b->sd.entity.ops = &og01a1b_subdev_entity_ops;
@@ -1183,7 +1162,6 @@ static int og01a1b_probe(struct i2c_client *client)
 
 probe_error_v4l2_ctrl_handler_free:
 	v4l2_ctrl_handler_free(og01a1b->sd.ctrl_handler);
-	mutex_destroy(&og01a1b->mutex);
 
 power_off:
 	og01a1b_power_off(og01a1b->dev);
-- 
2.49.0


