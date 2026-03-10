Return-Path: <linux-media+bounces-55226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCs/KsV5sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:06:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C23C25756C
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F32EE31632F3
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E133E8C6B;
	Tue, 10 Mar 2026 20:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/ksQ6mm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F763D091D
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173142; cv=none; b=Cf2mC6hQ13WtYEX+RWdF28DCDuGEOjFYJqQG17TCzAziM6IvzrzSCU0cbfhD6oSVQlMEilJvsErNkLJSDNOxZYrAGHzBTWJf3fKfm/m99hYPDdznDyO0DoicZr8BhTUXpSB8kF/0NZAg2G7lf0miPHEGSANNLrJ6LwgUwaVpxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173142; c=relaxed/simple;
	bh=pRXklnUT0y+bWg/RHzyTakkrEu8Vfkg5iScO4Ur1TQw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eekIKR84vnaoChxdget8TrCed8kBP3TnqRsgqTye+rtV1WwbCC41gDENqPj5crE966npRnQbj6QF+HTrH41bmh9wFQvdKiFWkUsVrDkj1d/L28PVVfjIEugJFZINEYEnA6MQ02oTB1dy5EWsXbHrrW1U8mMcW2Q7H/2zH23XwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/ksQ6mm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8299f1ca86fso2212258b3a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173140; x=1773777940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPTwHYGbckptva0R18TL8RRhJ8bcbXMlJm3dcfwo28E=;
        b=F/ksQ6mmxJv2V03yaWQnnz79V9sSGRz+CygnPh7szdHRBHe/V9/rFO5I0nd6QDl/BQ
         hjsRm5e1WNF0ZaSuDFd61tGvOa3rwLuwlY34//epIaJi1V69ooshKVVhkUj6qlLO5xN5
         UK8b51jBmOM11kPIaE6nZOUMmsvizflBuCXGi5VCEUyDTjUrAz5hVdbovScWZnk6uVqd
         +ZgFHvwMsHHAecnJkaUJ59d+0towZJwip/usWG9+dEumI4Z8QE/2cnOnF3GTPFYE7Jcf
         //kp43Nk81xKoF4WQW9DijKXoVDZfwBZbRzYT+KteIlAPIleNGBxsNLjd7OBufnvmnr6
         fQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173140; x=1773777940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPTwHYGbckptva0R18TL8RRhJ8bcbXMlJm3dcfwo28E=;
        b=Vv8F5I3qLBrQkhH5q+K83fuG9869w/6VtZcp0fhPs6a0I5/BqfjlSn4EszEb/oySSJ
         j2zvZZecX/w0qWSqn7RVETteLtud19qb01NSthPkiHC5sP4+d8W8iFdZ0FJRnTRSrU4S
         DlJUFK2sre0r1uTm0sJ8ovIjRODhKVx3sn4ZWB4N6uH6dqR8hCzVWrLPDb9mBWIs5YwZ
         gN3L5fWR/LoduNUrDut7Pqdw+AJxuXeI9ezOK5UiFvD1oAyP2klD4/CbDEOlwOLK8v7L
         jSph9U1Y0Ud+Pm0PkWg3jM8Z52HxGGcu8TqzdpGKq+HbbPtED++b5PUSD1Lxg8Q0CiZP
         hcsA==
X-Forwarded-Encrypted: i=1; AJvYcCWqzdY1GtR7SJ6sgYQQaTxg8Nr81i4rS3o70T3tSXocFeu6oH6nMJB9r6gUgRL4VtBQZHvdGrllTKn0tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZtI/CiS+V9sQ8xVwQU3LDtDQ1BoYr0nQ+2DIV9frEpKJ9/8B
	iK/yoE72bXrzfvSZPNhnDRLNDEH1lfYlAtyMjY1vwPaG4pUctxyvQDVx
X-Gm-Gg: ATEYQzwiZXL2zAel0BvbNIFE6AzKPdsccQTPi2gmuGqMel9u6z4xctQLHa0hSmgCCm3
	I9Rtchb8F3u/stWCZHY3wmbzD/HWUSCeGrs1DoU/7PWqmksHbRq35DMB+47XqwAMRNc2lfOztiV
	//KeN4wCktV1c0KdmWB7HIgm9TeVHXDGjlej37pcJcRAx9Wrl3mntY9VOUR8KdwHTMoDXrTpy+6
	KswVsgRaStx088Z0DLb3cpX9QbPmT6NF3YGD54/GDHk31ShBgb9PaEKw+fJhIhe5tdsKmilAUSl
	OisvTseCt3Zagq7m2CjeIA8pVlqRXnQ9nRu7ysGOskVkSagqt6j8AcbKNS4zWvLCAuBaOHeYMkf
	IMH03wX89rTDgx1R/+b8Zc8Nd3ZtOQpDcUrl9RujO0oIGERi6KZQpSTmKzS9ygrXt4ZXYfV0g/B
	J3P5dugF01hhJucm4IOhzV5g2ffMKYR+y0grnCjiKlWA8Y5erh
X-Received: by 2002:a05:6a00:3397:b0:823:f96:63bb with SMTP id d2e1a72fcca58-829f721d2bfmr102248b3a.52.1773173139764;
        Tue, 10 Mar 2026 13:05:39 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:39 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:07 +0530
Message-Id: <20260310200513.2162018-2-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2C23C25756C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55226-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/staging/greybus/camera.c   | 27 +++++++----------------
 drivers/staging/greybus/loopback.c | 35 ++++++++++--------------------
 drivers/staging/greybus/raw.c      |  6 ++---
 3 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28408..14a603ca2400 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -519,8 +519,6 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 				       struct gb_camera_stream_config *streams,
 				       struct gb_camera_csi_params *csi_params)
 {
-	struct gb_camera_configure_streams_request *req;
-	struct gb_camera_configure_streams_response *resp;
 	unsigned int nstreams = *num_streams;
 	unsigned int i;
 	size_t req_size;
@@ -533,11 +531,11 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 	req_size = sizeof(*req) + nstreams * sizeof(req->config[0]);
 	resp_size = sizeof(*resp) + nstreams * sizeof(resp->config[0]);
 
-	req = kmalloc(req_size, GFP_KERNEL);
-	resp = kmalloc(resp_size, GFP_KERNEL);
+	struct gb_camera_configure_streams_request *req __free(kfree) =
+	    kmalloc(req_size, GFP_KERNEL);
+	struct gb_camera_configure_streams_response *resp __free(kfree) =
+	    kmalloc(resp_size, GFP_KERNEL);
 	if (!req || !resp) {
-		kfree(req);
-		kfree(resp);
 		return -ENOMEM;
 	}
 
@@ -641,8 +639,6 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 
 done_skip_pm_put:
 	mutex_unlock(&gcam->mutex);
-	kfree(req);
-	kfree(resp);
 	return ret;
 }
 
@@ -650,7 +646,6 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 			     unsigned int streams, unsigned int num_frames,
 			     size_t settings_size, const void *settings)
 {
-	struct gb_camera_capture_request *req;
 	size_t req_size;
 	int ret;
 
@@ -658,7 +653,8 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 		return -EINVAL;
 
 	req_size = sizeof(*req) + settings_size;
-	req = kmalloc(req_size, GFP_KERNEL);
+	struct gb_camera_capture_request *req __free(kfree) =
+	    kmalloc(req_size, GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
@@ -680,8 +676,6 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 done:
 	mutex_unlock(&gcam->mutex);
 
-	kfree(req);
-
 	return ret;
 }
 
@@ -870,16 +864,15 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
 		&gcam->debugfs.buffers[GB_CAMERA_DEBUGFS_BUFFER_CAPABILITIES];
 	size_t size = 1024;
 	unsigned int i;
-	u8 *caps;
 	int ret;
 
-	caps = kmalloc(size, GFP_KERNEL);
+	u8 *caps __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!caps)
 		return -ENOMEM;
 
 	ret = gb_camera_capabilities(gcam, caps, &size);
 	if (ret < 0)
-		goto done;
+		return ret;
 
 	/*
 	 * hex_dump_to_buffer() doesn't return the number of bytes dumped prior
@@ -893,10 +886,6 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
 		buffer->length += sprintf(buffer->data + buffer->length,
 					  "%*ph\n", nbytes, caps + i);
 	}
-
-done:
-	kfree(caps);
-	return ret;
 }
 
 static ssize_t gb_camera_debugfs_configure_streams(struct gb_camera *gcam,
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0ae5..ae729f744ac5 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -508,10 +508,10 @@ static int gb_loopback_async_operation(struct gb_loopback *gb, int type,
 
 static int gb_loopback_sync_sink(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -519,25 +519,24 @@ static int gb_loopback_sync_sink(struct gb_loopback *gb, u32 len)
 	retval = gb_loopback_operation_sync(gb, GB_LOOPBACK_TYPE_SINK,
 					    request, len + sizeof(*request),
 					    NULL, 0);
-	kfree(request);
 	return retval;
 }
 
 static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
-	struct gb_loopback_transfer_response *response;
 	int retval;
 
 	gb->apbridge_latency_ts = 0;
 	gb->gbphy_latency_ts = 0;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
-	response = kmalloc(len + sizeof(*response), GFP_KERNEL);
+
+	struct gb_loopback_transfer_response *response __free(kfree) =
+		kmalloc(len + sizeof(*response), GFP_KERNEL);
 	if (!response) {
-		kfree(request);
 		return -ENOMEM;
 	}
 
@@ -548,7 +547,7 @@ static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 					    request, len + sizeof(*request),
 					    response, len + sizeof(*response));
 	if (retval)
-		goto gb_error;
+		return retval;
 
 	if (memcmp(request->data, response->data, len)) {
 		dev_err(&gb->connection->bundle->dev,
@@ -558,10 +557,6 @@ static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 	gb->apbridge_latency_ts = (u32)__le32_to_cpu(response->reserved0);
 	gb->gbphy_latency_ts = (u32)__le32_to_cpu(response->reserved1);
 
-gb_error:
-	kfree(request);
-	kfree(response);
-
 	return retval;
 }
 
@@ -573,10 +568,10 @@ static int gb_loopback_sync_ping(struct gb_loopback *gb)
 
 static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -584,7 +579,6 @@ static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
 	retval = gb_loopback_async_operation(gb, GB_LOOPBACK_TYPE_SINK,
 					     request, len + sizeof(*request),
 					     0, NULL);
-	kfree(request);
 	return retval;
 }
 
@@ -621,10 +615,10 @@ static int gb_loopback_async_transfer_complete(
 
 static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval, response_len;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -636,11 +630,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 					     request, len + sizeof(*request),
 					     len + response_len,
 					     gb_loopback_async_transfer_complete);
-	if (retval)
-		goto gb_error;
-
-gb_error:
-	kfree(request);
 	return retval;
 }
 
diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 3027a2c25bcd..60a754b20432 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -126,15 +126,14 @@ static int gb_raw_request_handler(struct gb_operation *op)
 static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 {
 	struct gb_connection *connection = raw->connection;
-	struct gb_raw_send_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_raw_send_request *request __free(kfree) =
+	    kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
 	if (copy_from_user(&request->data[0], data, len)) {
-		kfree(request);
 		return -EFAULT;
 	}
 
@@ -144,7 +143,6 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 				   request, len + sizeof(*request),
 				   NULL, 0);
 
-	kfree(request);
 	return retval;
 }
 
-- 
2.34.1


