Return-Path: <linux-media+bounces-56133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MXVCqvCuWmcNQIAu9opvQ
	(envelope-from <linux-media+bounces-56133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:07:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9992B280C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDD3430789E1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAEC38F22F;
	Tue, 17 Mar 2026 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="a5NHT8om"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBF346AE8
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 21:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773781669; cv=none; b=RfaluvXhGxU9eSaK+8xiMLoHRbzNAXA4+W9/St4PxHdvEUa93yOk7h8SJNBV5cYGinhvmBlc2PDFduyHm+jGv+IPkFd6bAaGPyGKktkAENLMgmihdWEDW4MtP9Wu4UiDARV2wygFAiyk0HD4KgmcXhSWaxSFS1Q1CqcXWEKteyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773781669; c=relaxed/simple;
	bh=O/D1KsB1ghmie6zGmD21s1YeXsm4oAkK6HynbDMpo60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZMGQ5tL9kB5R8SarkFhM9kAYOpJ55aeXRxd2TO3KTNseUtktrIYCa0kxvFzTFcAW3YWBfJ3aRv40LMkTtJ7gmDeKucVAaK2ojBqxFQG+QOa6TbmfrssNqXWdUorSzywkysoHv3rD79k7rPeeUm+TfXfIKvdlVBxM+vqK70ET3Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=a5NHT8om; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79a5fb98316so19150727b3.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773781667; x=1774386467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QT2o0gFIbWrcUmROrGuPSwGavrF1mTWjiLIXOC7UbCs=;
        b=a5NHT8omOD74RLcMSVpZnPWV24I+fehSm4uBINgQTa3Rs6FzuIxyj0O340G11oKZMY
         eYiTXWCwEr6wkTqQ58l/c9JPrGiyhh+xgxHJVXRtzomqqSQ1BAUBwiyTfuTPvdoCV+hR
         n6/yYkP+L93j0XgSHXNHuLFv4uE3/vU3cblhmtdxyHLuxn2xQ4ozD6tRoDyTPDD/gElS
         kWwKe9pOhbPtSACFJn9rsqqZIebQi77kfsiIg2fr4UZH0AFfTaUzU7AHRwCScplxYh2o
         lsWRCtfcIc/UjK10Tivi0XuVSrVA9WgUG7JhotNMFXg0DopWgblECW1zh7Gg8ECwq0Uo
         eFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773781667; x=1774386467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QT2o0gFIbWrcUmROrGuPSwGavrF1mTWjiLIXOC7UbCs=;
        b=s+gwRwZSdpq3rjV9mZchE8AOq5c8J7tY7Ap3sxsJTY8fhEmgmgUauz9qi+nLHyNsmB
         F7eWUwtFszUHxX4bVSkbTDM+ja90jNpCU/wgrdEk3NEqLvBPEKlSFn6nxtQ0KtueT2C/
         V55NxpiVlF4mcj+lvWG27qU3VtgTBJVIyGCqg1ghkhC3J6KR9/xcQetOOrnAkYCc2ErG
         B5AmE0geroURgepcPT6YG+Doa5/7LdF6BaKUXTAA/WbaB7FGcTvScI9crcPSyu/3yAcl
         UvVi51z3o4HjX4+/k/HY+Z8V/8TItWwr+bCgo/h3Agzg+LB73dUYx7W6sT99rK4qq6Z/
         QsxQ==
X-Gm-Message-State: AOJu0YymFeq3Z8JyQR+bnnlK+x6BKLRhUkRgRfrXLcKiDTksjxdPZj+b
	5LpAjG1cq5trmCgtEd3/KwGpSKj5eR5DXN+G5IVm0BCSyp5VCOIsrMvyPn9JpfVsLWsOG+o+VLs
	GfZ+mgOM=
X-Gm-Gg: ATEYQzxeDc1hBwKJOjn4Amm619/mKpwV5xYxBF7XV4Uz5qItO/jP4FsaXF++HV1Y5Z5
	eG2kqkcZ242NrMTSD/7s2ReKLRJ3qPns0ZpmGTe94z97+MQaS4bSVf9UfYhz8t5qSBAWLUHZdxO
	QS/TOAMogf+luFdyy1dYvW4d1RR5Xlqh43vCS88N2hz+guI4/KsXMgNtecLmtzmrSJdc8ZdjNSu
	SYcn3vPRCpcWRIIub7dWLog5kNLAFCG73B1qYVq9tm3xLQ+GLJHSqJB6SAg2mcd680hfHwdALnB
	yBtG1v7w2a/0o4Fa4JaFIjs+ReGUqbPsU6P4pb1jOxHev9PHp0tqyW/dVoPpgRHsEv8ZTPkLyQx
	N19Mo4vTMe1ozydP0s84ecTeR5tX17GrIV6l1OfA3TAeZe5VO2DxMXFNuA0cmDEZhDshkjoetSL
	sKJwfJkYDCcH8djxi3MU9QJyMkbzZaEIrutxBski+J8nsrdQh6phS/iQmbBJ060kovhOTarrCrm
	Hmi18bM29kHmwG8VaU=
X-Received: by 2002:a05:690c:e3c1:b0:79a:3752:af15 with SMTP id 00721157ae682-79a7180eea5mr11496367b3.3.1773781667263;
        Tue, 17 Mar 2026 14:07:47 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a715c7e5csm4513037b3.38.2026.03.17.14.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 14:07:46 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v3] media: au0828: Fix green screen in analog
Date: Tue, 17 Mar 2026 16:07:20 -0500
Message-Id: <20260317210720.3369541-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317172820.2959499-1-brad@nextdimension.cc>
References: <20260317172820.2959499-1-brad@nextdimension.cc>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56133-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid]
X-Rspamd-Queue-Id: 3F9992B280C
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
Changes since v2:
 - Fixed extra blank line
 - removed now unused variable
Changes since v1:
- swtiched to called vb2_ioctl_dqbuf directly after checking green screen


 drivers/media/usb/au0828/au0828-video.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fbaa542c8259..3c53105f3d2b 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1671,6 +1671,27 @@ static int vidioc_log_status(struct file *file, void *fh)
 	return 0;
 }
 
+static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
+{
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
 void au0828_v4l2_suspend(struct au0828_dev *dev)
 {
 	struct urb *urb;
@@ -1764,8 +1785,8 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
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


