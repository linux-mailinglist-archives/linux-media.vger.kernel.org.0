Return-Path: <linux-media+bounces-55545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNxzJe4xs2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3C27A16B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE97F31B6648
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D8D31A805;
	Thu, 12 Mar 2026 21:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="JpHEGUMJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E9A389DED
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351342; cv=none; b=X94BAjxWgfebO6rPfKANNsHn5wXKdVwe/s4hxxwL9fleaca7rpSv9e4MmnGGNku0zquLvvxauIJzb3VDKuJx/XDc+uPydJDTeGKE0kZ4zZ3H2wxOYQzKFpA9kqxnpIV3et4C+4fdzEhRna0IRK6EAvl346ut2S5OPKw5GWs1iHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351342; c=relaxed/simple;
	bh=4ap7LhGNmeE0hX3BfKcW7SdQXrCQ6J6xcGtZZnMnqNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EQEnt4UIg+Ns6UUFVumAWiid0j/paI1d/89OsVcCWMTexIibu8ukQ/J6LwMRGSPReQL9aIui8dA7S0VllPSkq5kibT8MLAEgW/v3zcEXXXNXnv1Dlah/kOizD9MALu/9n12t6uB2ROLQtgzHAo1oFxkuMjG2OAv1IFHv6jO49RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=JpHEGUMJ; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4648447e29bso621428b6e.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351340; x=1773956140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ietOeNlIW/UTPT+vA5+6vMrrFqOo1yiREz185o7P/2U=;
        b=JpHEGUMJooheMj3YX3ejSVgfFpM+prS/RHWB+y87Pirm+TR8Mwiv+cf+ybDe+dr8/l
         6goJrrdcG9M98pu1zQiMG2+zXGWzRaNMGK5RSxjaHSPPT7LeQmh4s1zRuVlP61ZCn0Nc
         sQzifbUHPMf/BSLW3TvDCLyHP3X5XOsFJAcvdrHgLobohzvRY1yDk0s4NFDJbPWFg+1d
         RqWDPeE/0I5Un36U62kGnqMFXEpCfvGWrvJ3Ej7p3vzLW0VgRhipzFMBr4odKnDGQNGA
         raTMGv5e1cFk3kXqEdPaVYL0JLKNoMUxJT/Xwvwt0k7yZXh8jysAOjpFHqrULvk9fo7x
         BtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351340; x=1773956140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ietOeNlIW/UTPT+vA5+6vMrrFqOo1yiREz185o7P/2U=;
        b=KlET/IY56/liAwMiv9NTXNaXBLup39D1UDAZGuvO3hQ8Z1+6LywTt4wADSVhEgs33n
         2ifOfrmKPuGHuG2iWxAa1X19PTuKgN/mB5eib8h7zPQbA9BUjlbBKkxy3NF0zUbgM6iu
         K8vm6UZD5etYOkyQUsmS8pZoA5bhxTeMkvL32gflO5+9BIOgYqNZlxId3jOug30mtkoq
         oBJNBQlDiZgMJ4BxKUBVbm8G0Zj8ohEFpFxYo91418PKrED4LcvSfVn16cMa1Gpc7Akr
         /O49L8RuRaxKpJwUapuKvQgc/93EBUeY9+G+AqigRwvVHGGL/V11DHkpL5Y0tK2vx9Nr
         aotg==
X-Gm-Message-State: AOJu0YwKwEAGk32g82L0w3Mm1zPkGe8Uq0+GaoK0sZQVgBjlWlCSIWol
	R1uDlF9iqCPV+SQlctABehvhTO+YyhptNPi6bxqoEfMSIAexvbDVpOJaDZSv+iaM/Da4Np1HeHx
	eXwih8lg=
X-Gm-Gg: ATEYQzyor+nhLyoAcUEFacF3RsoXhYVroi0Sa3CkFizpUibQi9zrEZ+eflfZrcZGkvZ
	QQVVSLI1Fnrj5kJkX0cNKzy/GQjsLKyJeXhluvb1vRYq2tzNmnHeB4+7Pun56rQymDKQKjhCaiH
	vWFCq8B8GAs6W2RHZ5BucT0joKFGS/zo2Gq3DEk8Lp7JqaPskjqv3UlkPSBmLIg0LUIiliF0ook
	HT8hAdRZzzbhnW6Ft7k9C8k94yE5BbrSjaJxS6/fh8FvKS9+UD7n/GJ8U0jABet+bLQIoud8ZUK
	xo3trPBSZ/XCZ1A0l5OGOJqkeJJJPKai/GjAFsXnTYSUPZGz8WYIMwj1WUKj/OPBtbjmGddk/kX
	hHOhrEtACkZhoAeXQMY/09lk5S4lqeW/Ysgey1uQg11yVMYmOGhHqQaj3JCCbiCY2R653HlXEZ6
	hSInEdfrX4RXfge6xe56/HfKlihkjP+wW8vVay36uzjP3xzAk1Jndyo+QfQ2YYH1K1TrBqfdv3R
	aF0p34USBg1tQ3oQZo=
X-Received: by 2002:a05:6808:10d5:b0:467:2a6e:adb6 with SMTP id 5614622812f47-467570373aamr483774b6e.8.1773351339690;
        Thu, 12 Mar 2026 14:35:39 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:39 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 05/11] au0828: Fix green screen in analog
Date: Thu, 12 Mar 2026 16:35:26 -0500
Message-Id: <20260312213532.2907276-6-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55545-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0FE3C27A16B
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
 drivers/media/usb/au0828/au0828-video.c | 30 +++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fbaa542c8259..f65f15b1d92a 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1671,6 +1671,32 @@ static int vidioc_log_status(struct file *file, void *fh)
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
+	if (vdev->queue->owner && vdev->queue->owner != file->private_data)
+		return -EBUSY;
+
+	return vb2_dqbuf(vdev->queue, b, file->f_flags & O_NONBLOCK);
+}
+
+
 void au0828_v4l2_suspend(struct au0828_dev *dev)
 {
 	struct urb *urb;
@@ -1764,8 +1790,8 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
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


