Return-Path: <linux-media+bounces-33913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48143ACAE93
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3843C16EF5A
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D618221FB4;
	Mon,  2 Jun 2025 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBnLktsR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4321CA17
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869594; cv=none; b=SaBMz7e+PqAxb0PBtVb+RZsEKhyKVqa/iqUK0+NRpqTRekRDb04bWExSHAmdHWzKtMND1yI9qVFGdQO90F66ztPcHIfbVrwm6Ygrbq7CBzqYV9tQ3UwVhY+oP51R/dX3h4PfHY5HFadNr9FZ7ArMSSKAs9sTTs3VPS4jtdVt2GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869594; c=relaxed/simple;
	bh=FjNRXZX0ch6DPRErORNEU7CPhqxiHvHorfrQXODtlgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6713rzueJmU96PgQUgvOG2ncqCU+8+gPf0BL8eDe5frkZwuQxGIcg23xjj0pCoxG11a5JEpjbhX3+O/c1XhbDA5UeAkb8m9Ofa1TrkcBQgYPnEnFyASVf1XQoGuZZXchUkwMGSw30BPGsCfdidmNbP27WpN5nbyJvCipiGs2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBnLktsR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10594812so5329175e87.1
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869590; x=1749474390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AArFLpvrTviSLo6TTlnlRwmgDV8UtwktXMRNEndWCQw=;
        b=aBnLktsR/8DwioPPDAksrGeFzmkC6WnG+zJd7pmWe8tdi76ayan5jtW7sA8D2bsc2V
         pA8rc+By0Thce8+HGpwuPlDCm1alfY9pupaWxoCRoOnmqx9tBYWfROFbyVTmqtWdhstx
         /jCduwXKa0hd9X6au89HHHWURn8T41taDRigI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869590; x=1749474390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AArFLpvrTviSLo6TTlnlRwmgDV8UtwktXMRNEndWCQw=;
        b=EGIW5jiMIvXqjkmXiZj+lGAcu3/f5pkjtWOugk8paATDCNls1bgFapA0QiwPLVgKUM
         B9UPsUnt0I3Bbrc42xEU5VMYAkyq2ldnxzszE4W5Y9U4J7xV7xPIwfsW17KIXHaEakAZ
         sk7+AEell26zBE1SMcXLrHexRAta3+QeXjorACk+dcWmYM80s0QEUlmrp91nD6tjsFVp
         F8cDLPTLY4kpBgJRyn+ML+w0a2vddLHIt6SPXb+M08FXU3GBf0/oH8N7FZ9LNTA1Ytkr
         0Q1IaPwbKOBUXDf5pdlfa+LLDSUI30cYuCuCc0llndgxE5TUjQrRGFfIhWIZPcLXqc5n
         HUcQ==
X-Gm-Message-State: AOJu0YypJ98+QVKgODlu4sVsuzaRzBbKgTqmAfyT2UlLl/b+d7J+cysQ
	+0H1uKDHyJZbTve1tuio8V1xtHVZoclYesdUNuhKY2e846O58CxCHTs5XMByFWAVHw==
X-Gm-Gg: ASbGncvpFzc20Ia/tkgwPoAYNdQTPdTOOk/uV4nJmOkDGKmCOrAdfz6j4w6TcUfAmx4
	DP/VoZHj0TQFtPu0jjxOFs/62Qav2Hysog2PDpvvD0StgMpZOTmfh44MBs5OQX7lIJJamQyP3OI
	NjmYCls2jbNXC0iFXFT6ohOMyJgoyJJh7pFSJKcb0Hig9KxYAEZ6d/A+tOEiez7j4K+RMfhii5W
	htafrPNBNPkFZH+dmkge7jtkVDpqd26+soidKwbOpgJoSJylL3xg4sxZHEJHj8qwSlbzQT64pni
	lX/xi9YNGHzoF1oyVdqyGHUcjv/jijkCPx/D9GrhRfAdLiFbImue5RTdGjDfFPIxEHNdWs779oi
	XNKY/lqmm7zOM+w9sPovPjyju0A==
X-Google-Smtp-Source: AGHT+IFMjaqEZeZt24KEPp77Itzt3bDSNiwjg8uVRVbtSDFC8vVrvZ0qTxTGge30XlC9CZeXykZGdg==
X-Received: by 2002:a05:6512:1387:b0:553:2927:985f with SMTP id 2adb3069b0e04-55342f5464cmr2297117e87.5.1748869590293;
        Mon, 02 Jun 2025 06:06:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:18 +0000
Subject: [PATCH v2 6/9] media: uvcvideo: Do not enable camera during
 UVCIOC_CTRL_MAP*
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-6-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

The device does not need to be enabled to do this, it is merely an
internal data operation.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 100cff47ecc5ffd9941e22fec24756abda1f015e..020def11b60e00ca2875dd96f23ef9591fed11d9 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1179,10 +1179,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
-	ret = uvc_pm_get(handle->stream->dev);
-	if (ret)
-		return ret;
-
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1198,9 +1194,15 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 
 	case UVCIOC_CTRL_QUERY32:
 		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
+		if (ret)
+			break;
+
+		ret = uvc_pm_get(handle->stream->dev);
 		if (ret)
 			break;
 		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
+		uvc_pm_put(handle->stream->dev);
+
 		if (ret)
 			break;
 		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
@@ -1213,8 +1215,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 		break;
 	}
 
-	uvc_pm_put(handle->stream->dev);
-
 	return ret;
 }
 #endif
@@ -1227,6 +1227,7 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 
 	/* The following IOCTLs do not need to turn on the camera. */
 	switch (cmd) {
+	case UVCIOC_CTRL_MAP:
 	case VIDIOC_CREATE_BUFS:
 	case VIDIOC_DQBUF:
 	case VIDIOC_ENUM_FMT:

-- 
2.49.0.1266.g31b7d2e469-goog


