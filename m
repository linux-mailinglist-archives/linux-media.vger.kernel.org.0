Return-Path: <linux-media+bounces-55913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBWwNGUHuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:36:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EB29A8CF
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E89C030A251E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72DC399004;
	Mon, 16 Mar 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UazB3YNu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AF0396594
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667835; cv=none; b=go/DxZnABIQIGAonXOoOgRB9xnjx7iSa2KouGlRLHdN9+pfVO8t/5gOtVVEHSbp+XabvBIZyKqAj6EKhHI6rF0qS85YfPP8FLC5wPrMUYuAlhb4My2yjUZgXIahqavfoO/RuNlMa5946kAD90KmHhhVU/ok7LaFxUAzpWDjkhtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667835; c=relaxed/simple;
	bh=Yq7adSLvEY5q4q42T4Hel6YbK+rT6LRdgNp2DFqfKmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lqt+VsPe5Vc+DcozolT6q/FdhggulC+eqUjv5xFq19O2d2nrReRF2L/H7rmTtwRzl/xuAB8CiimmfYL57qx+pujcuVvCgwIwsW5zw9ccO3dmP3YFSCuRt0OkEGxTQ0K9Tlr43d2MHQXV7tUHXrrBmiywH8Pf+9srMrDwaqFyDlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UazB3YNu; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dcdf60427so3941174e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773667832; x=1774272632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNpO7clZEY/eZEw4c7Ur6m3POITgkwC7i5ZcONx8gKw=;
        b=UazB3YNuR1OA9YQAf40Rqtk97+mCLzD0Ydb9SuvnVn3lX/m9jj6TpJTH5/JBtH1KUi
         UWkMYniUkrdbmDft0nV82PGhiMjJQjcdTNGre2vJC4eWmgTMlTP9U+pjtcGgrdRjYZTp
         QwvaEOGTnDcsvhXFf5F9wwGZRgel4t1vpEUg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667832; x=1774272632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nNpO7clZEY/eZEw4c7Ur6m3POITgkwC7i5ZcONx8gKw=;
        b=Gy3p8mZG+O+pn4l2Seg/KNwM2GbU5C7yxxmgNk2Po6GJ5lZIDAb/RcoM6+sDGmzl5y
         5NDSQ3xDLr8ZAUhtQjK2whPz/pW+h0wspsv+NnsjxAGqpOWNmpFqHVfDzMjphpX3ncpb
         tcWsqMkL4LMDRi/Fdj+jNY+I5XN1VsG9RZd3OoXEf8REmX7OXPs4T6eIYquzA+LymvVP
         SqI3jEmi/xQT2Bo/sQncWWxuyB7ffzNbqHx+4HIeRG5ePUajH6F3F5emqPgNWmi7Nf3h
         hlqs/DumSoRr2pw7qcZwr+jMHMRrueCNNY9RVcFtXyVezfV5RjmfuGWKRP9jGBlhPrOW
         hg0g==
X-Gm-Message-State: AOJu0YwXKgvXzSBy1KuELaPcjjzKpVbooAwMU4dOXek9fyNgEg0Xygvy
	hnoMB6SRoKdcTLW6ylbQ/DIcUGLiwUAqRqkTQU/krS+Z7p1wiCNhcIoWzGNpCBoykFzHyZ/8OZx
	yavs3GA==
X-Gm-Gg: ATEYQzxHMNUbQg7hPDtgwx8Iqxm2wFzpP0cu5gh+0V+hxB1Ox2DUsr5zstW5NKL5GJE
	ce/17j0cMzE0IJwPF4nfB9QxLXrScsaJSeC4kFbvC/dKZX7nMyW5drRjNu9WCqeQWxa+Rod2SKu
	zsFzcyfBKWHt9PgDoFejr4POrRR1rG1PCAnRIUxdHvRKW+8G9fjbcvJleJj6tWe+NA2N0lkU9LW
	xrtrhj9ZG8AbQYaBrEwBVcCq/6OuqcfLFJdppMSoCHZBwH9dj/vGymnPinJvpZUoPbM0Kq9JcPo
	hHIUQplUhe72xqy5G5KhtjFARbHiDoHB/xi1pnEVAhFjSXDxhX9x+gD0eRAAhAMbKwsYXsImfl4
	n+KD9qfUQ4DyQGkFTyrMqtKzVbDdAWS57N2MJ6VIu2rSeh9hjk7Xti7IcUZSzYy7GptRJdP/UFg
	q9TopGYBvpBP5ROb8u6CFbUP9Jn4I8emzk0KgNE1wORsi/G68Rlm4szAzrbwBTrN1BGzGDfb9xU
	A==
X-Received: by 2002:ac2:559b:0:b0:5a1:440f:512f with SMTP id 2adb3069b0e04-5a162b0c48fmr3716581e87.27.1773667832281;
        Mon, 16 Mar 2026 06:30:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636b69dsm3469985e87.82.2026.03.16.06.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:30:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:30:30 +0000
Subject: [PATCH v3 2/2] media: uvcvideo: Fix sequence number when no EOF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-uvc-fid-v3-2-c793354469b5@chromium.org>
References: <20260316-uvc-fid-v3-0-c793354469b5@chromium.org>
In-Reply-To: <20260316-uvc-fid-v3-0-c793354469b5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55913-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: 523EB29A8CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the driver could not detect the EOF, the sequence number is increased
twice:
 1) When we enter uvc_video_decode_start() with the old buffer and FID has
   fliped => We return -EAGAIN and last_fid is not flipped
 2) When we enter uvc_video_decode_start() with the new buffer.

Fix this issue by saving last_fid on the first FID flip.

Cc: stable@kernel.org
Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
Reported-by: Hans de Goede <hansg@kernel.org>
Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9e06b1d0f0f9..3e6ded69388f 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1254,6 +1254,12 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		uvc_dbg(stream->dev, FRAME,
 			"Frame complete (FID bit toggled)\n");
 		buf->state = UVC_BUF_STATE_READY;
+
+		/*
+		 * If the EOF detection has failed, we need to save the last_fid
+		 * to avoid increasing the sequence number twice.
+		 */
+		stream->last_fid = fid;
 		return -EAGAIN;
 	}
 

-- 
2.53.0.851.ga537e3e6e9-goog


