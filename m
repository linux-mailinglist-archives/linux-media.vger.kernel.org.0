Return-Path: <linux-media+bounces-61952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ9zEGvzCmpZ+QQAu9opvQ
	(envelope-from <linux-media+bounces-61952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:09:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D756B459
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 025A230DD6E5
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E7233F5BE;
	Mon, 18 May 2026 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOt9r91t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2414333A9F3
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100823; cv=none; b=K6HCDq7bk6yw3FJVZY2jibGo3AzCr05yOjyAoEI9Pqd34aGkC9A0PXApgUeqVMtogrir9RzXy91AZrfs2Zpv3ld0e7/tHXUV6Z8G5Uq42PldIWR/KnS0bAAjgNULEntE7wUqkwIkM1Udljc+p6TZG7zLU5YZGJp6jCEOmgZg7Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100823; c=relaxed/simple;
	bh=AzZYAm4KSrCK19dR2eFGIHzeT1vCYE27NiC2mnilmvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpBPLbFsR5GJ8qR+7o8GLr2VHclLn44kPq/eR4ZLlk6hKwaGrRt8IeTCa3FV/OCnFfSqTfOvTntfVJfnwpSXYi5Kj2mR+Y5a63lIZ4CI7kBpJ2+Nmcz8sTLQJIve/Ok2sBqX8xKDdAU9A2F2Ir2tM46qc76MLtpsrrWT2cgvEe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOt9r91t; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36974220e45so714648a91.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779100804; x=1779705604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVAUdDDbfPPQoElmwOeWDH4WW4jPC2mM4cIyuovCdkU=;
        b=lOt9r91tJWLscgUI4ItN7MzyT/uBGmnyeY6CheW16GDXbCbRbPL6lcD0FUusd+XJZ8
         jodJw2hYpxtqlthf9vUrPSlJdaLyEWBP8y3FOekd4qxjUW2vY1VNwOZWQ0Os84asKna0
         dZMcsrhX6+1S3y+ZCbTB+8Y/RC1bSIFHA90RtkWVmo/dgsT3/5vfCJuVw2Tee0brYGRp
         lY8qskfykdn6Ghly5agTP7cMQSlOpK0s0elweoOed2MZH9kBlNEK+Bpu0goOtnkSJwk3
         Z5to2RxfBU3WAWx3ZCr4O3C7l5IpZ0EcRB3vKsduatN6c5BLD0o4CXFl89ZNpLCiW7Ln
         y3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100804; x=1779705604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVAUdDDbfPPQoElmwOeWDH4WW4jPC2mM4cIyuovCdkU=;
        b=A5QYGWIJfrI27pic1av17AkjFOBoBCprRZiEB4c/MpTIXG98IBJu9El9mRIg/za1MD
         s35ItnukOLwMdibU5g4tlHMfle+Dv9ntHJ9pcNieNb7r6lBzcFCZKHz3FXGPFpSf1U44
         psZN0uuh+4Z7+JITadn0daaPSgW2s8Z4MUi15IK/O9gu6U94et4M9zYVgDmAM6kO9s6U
         B7y/o85+/2G+svehaS1dWrIu9tKXNrQWfkvslI+UYLnuSgBYNJJwnlIFL8Vw77fX6XrV
         NYzkvdR1PEvJYIqSHgG7WAeVQuQvnBpkzg2VC6Oz30O5LuHml2SSn9WhjQWS/aIvdGzt
         gXUA==
X-Forwarded-Encrypted: i=1; AFNElJ9ksue9yhPSqoes/iidlXsZIo/Ceb2q3TGyQWdOcNqwBAiIbQNXhJjYsQJhGqiPaCuHIi7YZr6tXpl3dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmDob5tGnhbJBDeGcfvWC+po1npFxFzSlvKmkAB5tPUACwbI6
	z6sAGXoQjo4J6zEPaUs8+zKTXvWupTehUg30Vy4NJJOPb5Tyzxc5oRFg
X-Gm-Gg: Acq92OExot2pTaswaGkwRGZ7ofE/fFv8GmBHA9yw5l5IpHJCcnwd9UlrtEAPtPatq2y
	9N8taIJvzxFo9EhN0QcI8E3p1sXjhSfevymbUxxTvcerEj793kkkoeGwb69encT4VjF76fTLcy8
	A47QjUb2z4fgjx9CJA8OcPgn7ClTXewLWYPvjVVd9oy2kXzlLoNtr4Mzn9/yXX2M1TwAGTIACnN
	LY0HIX64UHkCNk4n6z9LBwF9fhnB3eJbbDnc5OwDxlH951bR9YyFSN6ijfJIrtWknqQT0HxVqgJ
	QWNShncKsOaqmo7UIVkFyU5Usm6qqRHebEOWEVVYNImCVsG1HJPfEcRGgPAsPOXSoOz5syjXXLA
	vQxmdyXZtYDfv07YfCfGSbXUc8wMpDYxWgskUJ23Kd6FOVysQtElb2br6FCnejwUvjjPqYzhx/I
	PMVLgS2w==
X-Received: by 2002:a17:90b:3c83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-3692362524bmr16701397a91.14.1779100804381;
        Mon, 18 May 2026 03:40:04 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm10786470a91.7.2026.05.18.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:40:04 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: cxusb: avoid double free on video register failure
Date: Mon, 18 May 2026 18:37:29 +0800
Message-ID: <20260518103729.986346-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3E6D756B459
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61952-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

cxusb_medion_register_analog_video() allocates a video_device with
video_device_alloc() and releases it from the ret_vrelease error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> cxusb_medion_videodev_release(vdev)

  cxusb_medion_register_analog_video()
    -> ret_vrelease
       -> video_device_release(cxdev->videodev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free cxdev->videodev through
vdev->release(). cxusb_medion_register_analog_video() then releases
cxdev->videodev exactly once from ret_vrelease. Restore
cxusb_medion_videodev_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: e478d4054054 ("media: cxusb: add analog mode support for Medion MD95700")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/usb/dvb-usb/cxusb-analog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 3bbee1fcbc8d..2d899af0d5c3 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -1654,7 +1654,7 @@ static int cxusb_medion_register_analog_video(struct dvb_usb_device *dvbdev)
 	cxdev->videodev->vfl_dir = VFL_DIR_RX;
 	cxdev->videodev->ioctl_ops = &cxusb_video_ioctl;
 	cxdev->videodev->tvnorms = V4L2_STD_ALL;
-	cxdev->videodev->release = cxusb_medion_videodev_release;
+	cxdev->videodev->release = video_device_release_empty;
 	cxdev->videodev->lock = &cxdev->dev_lock;
 	video_set_drvdata(cxdev->videodev, dvbdev);
 
@@ -1664,6 +1664,7 @@ static int cxusb_medion_register_analog_video(struct dvb_usb_device *dvbdev)
 			"video device register failed, ret = %d\n", ret);
 		goto ret_vrelease;
 	}
+	cxdev->videodev->release = cxusb_medion_videodev_release;
 
 	return 0;
 
-- 
2.43.0


