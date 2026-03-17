Return-Path: <linux-media+bounces-56114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHQnMHiPuWk5KQIAu9opvQ
	(envelope-from <linux-media+bounces-56114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:29:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E62AFAE1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6D3E3019476
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FCB346797;
	Tue, 17 Mar 2026 17:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="Jr1idyMu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03D3368AE
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768514; cv=none; b=PgbbbsDhZOcsqlx1XwNCj0R6COnCu/6WcJsAHN6qk0vUhVHVMYN7Hj9f73FsmS7FeFK6a2w3EXBD7WRDTrkKg6AjWQBuLsB50vE/7NT/lzGXa+QdQPG2+wEvRaaKO3jlrHOUi+YdRTvbqATp8b9I3PmgtriwF8U4dvXxwT1N2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768514; c=relaxed/simple;
	bh=vOuhGR/VLryHa2rNT4yrTVvUbb+sNe6sSfz4kJaCYUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IwsqASW3v496rH12iOoh+arV1TtsFhW9mQqZ08oSFMds5I8w24wyELuy54WaTs4noyq4f+zhUIbOqVbgIBi/q2YQbJZj2JCe1WFhPfdmfdjJ+AGA5RqaECExWrxA7lJMS8PqLmznujAr1uixVBTf+Y3V4a/hCZeoLekHcySTTfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=Jr1idyMu; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d7c76e1951so371042a34.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773768511; x=1774373311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/2S75QRGiMWiLhhYC+l4kAJCKuYEmYsqC95Qjj9R7Y=;
        b=Jr1idyMusL4UshKehFLFbxIrcXWkWhuvS1n6e4UJUtRAYVOHVwu3BRo+tC3VxvQEId
         gOvjGlelfzg3QtC8bU7HaB/e7ua6K+D+d1DQZu7ELCQN/cDVacvLLpAdSSoWpN9GDJX/
         +1EYSsJww62zDg2lA0WLXjtGapaa8TgmXQqQZBQX6Jv7r6DgJNO/zV0p+eVobK9Ulf5p
         PlafS3u28VrjAvX5JXibywDZov3wNQ1uEDiBbeH0r4g6Bsr/pXbXsUfMbYXR7feR9GOF
         6YvG/PZab2bMGUQ7V7ERDYQlgM6SqbNW6hB8i3IPH1YzD3JF/6RVUVcqiIo/gDqb7R3w
         B10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768511; x=1774373311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/2S75QRGiMWiLhhYC+l4kAJCKuYEmYsqC95Qjj9R7Y=;
        b=LjGWPLFsax6EmRa+jPg7hcu8RiiSvStVsMphImu/xLfO3Q7rW23gfqKdnxMRbB4nI3
         t6jcn6zigZx8LlLxArNsXeZA8YRW/KAsYjl3TMOw0r1J9EQ1fc6FYqVbjd6D+8uLLlTE
         x1vFS4tLFd6hoCvTEFTnxPn9oZS7qJIoW2HPmZTLyqu3ehT59VMp/NADguqHNGgp3MWb
         nt+QjILhMWkFZBansIYGBGLrB+4oYWmWx4hgK5wlNJlcAb25U99bPNwC/gdMUx6vIpuB
         2/nPAfyiXeDtnRhY7g28nm0yHqt0NJrrZDYK+BNn93bnd6BcSsDSzu0hpr3jCIHowDr2
         wRwg==
X-Gm-Message-State: AOJu0YzZMSBLqi9cU4sIWckxek2MaJlReM0TdHH3o5Qj0eaJVYkWq9by
	EPsbQ2eYumAEjm+PBB53s2k1rChboUwqARE/uVandhcaokH5fT5lQLiL1j9Kt8rbRGrb3nkj/x0
	Dwk1Ke4U=
X-Gm-Gg: ATEYQzwFLkP/FKxH8H7rJQNjMs3rT/aV606zUID+lukNg0PpbSh7VvWEzyGXI9RGDER
	CRC+nRCqIqhJlGOa+FbHMQFEvEkpAeZA79zRxnfm3oHQBv9yQVezYZ5P4YTBdivo20tgFfQR0Js
	RudDnuu2YF9X38ncYuJ2lJ6OfXohqdunOJA1H+SewxiReMyuzv2+5eU/poUdcXi0ig+h8qGt8pk
	c6gVv29l5ZowPkVpNHbId35ybeMURcjaMuGDSL7wFeilWI1JYWykDo6A9CIcJzWXwcq1G0eRjZh
	CEb36d2bitpfFE3fgUqy66TUn8rdHT3iM4lwxR5XxFGEU5jtM4uWLVB2fPbgCSeUIGKIaqYH1lq
	0UBpRRQWFEa+ijZG92V2/Q1O3FYxNvnGCGy26ejdxubBPuy93RTosgUZynms72O9LnNDGgZeDDK
	HSlFGQfHvHqFqUtUaYAGEx5VA16D676uNSH8U6q3OU0fHt5lDT7f1oy0/96iyDbNJPbSjy2WZen
	W6cChxImo40vj+Ii+c=
X-Received: by 2002:a05:6830:2109:b0:7d7:5559:3d1c with SMTP id 46e09a7af769-7d7ca573e31mr132447a34.1.1773768511235;
        Tue, 17 Mar 2026 10:28:31 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9be847fsm188115a34.27.2026.03.17.10.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:28:30 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v2] media: au0828: Fix green screen in analog
Date: Tue, 17 Mar 2026 12:28:20 -0500
Message-Id: <20260317172820.2959499-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-6-brad@nextdimension.cc>
References: <20260312213532.2907276-6-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56114-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid]
X-Rspamd-Queue-Id: F30E62AFAE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the driver was converted to VB2 the original function to fix
green frame detection was removed and a default vb2 dqbuf function
was used instead. This vb2 dqbuf function leads to green frames not
being detected and correupting stream captures.

The vidioc_dqbuf function checks the greenscreen flag, and, if set
resets the stream to discard the green frame and decode a real frame.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
Changes since v1:
- swtiched to called vb2_ioctl_dqbuf directly after checking green screen

 drivers/media/usb/au0828/au0828-video.c | 27 +++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fbaa542c8259..35cb97cac91f 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1671,6 +1671,29 @@ static int vidioc_log_status(struct file *file, void *fh)
 	return 0;
 }
 
+static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct au0828_dev *dev = video_drvdata(file);
+	int rc;
+
+	rc = check_dev(dev);
+	if (rc < 0)
+		return rc;
+
+	/* Workaround for a bug in the au0828 hardware design that
+	 * sometimes results in the colorspace being inverted
+	 */
+	if (dev->greenscreen_detected == 1) {
+		dprintk(1, "Detected green frame.  Resetting stream...\n");
+		au0828_analog_stream_reset(dev);
+		dev->greenscreen_detected = 0;
+	}
+
+	return vb2_ioctl_dqbuf(file, priv, b);
+}
+
+
 void au0828_v4l2_suspend(struct au0828_dev *dev)
 {
 	struct urb *urb;
@@ -1764,8 +1787,8 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 	.vidioc_prepare_buf         = vb2_ioctl_prepare_buf,
 	.vidioc_querybuf            = vb2_ioctl_querybuf,
 	.vidioc_qbuf                = vb2_ioctl_qbuf,
-	.vidioc_dqbuf               = vb2_ioctl_dqbuf,
-	.vidioc_expbuf               = vb2_ioctl_expbuf,
+	.vidioc_dqbuf               = vidioc_dqbuf,
+	.vidioc_expbuf              = vb2_ioctl_expbuf,
 
 	.vidioc_s_std               = vidioc_s_std,
 	.vidioc_g_std               = vidioc_g_std,
-- 
2.35.1


