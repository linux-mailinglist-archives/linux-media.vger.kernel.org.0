Return-Path: <linux-media+bounces-54959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ECGI8ThrmmoJgIAu9opvQ
	(envelope-from <linux-media+bounces-54959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:05:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A68423B3A6
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76BDB302A405
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56803D903B;
	Mon,  9 Mar 2026 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dIzLezvd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB583D7D83
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068525; cv=none; b=gbpNJwgIgvsLL1RXj0tNYR1QyImZbUVxdHPLcu4WrHpaq7Nsr5lhAB+l+Z1GDIUI1lB5RKBtBS3fiot2R4NTfipVEkuLYB7lUV0vn/wEY/Yr3yE9hrLnwXV+lPQNj/G97GAQwZjGxDUFnr1dsApRPt45BPAIN6+EPrhhGn2wI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068525; c=relaxed/simple;
	bh=CCo9MsLBz35ddFk/kftRSVSKC9JPYu1XSXPfUzfG2uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eIBHRhvk15cuLTUDbYnxBQzQczKW72lEsvHI27E6rqZ3YbZ2hfskQZBcjkhvUYpg62b7WzAnbVUP0G5x2CeDylKrB/8vozVy+9xynyNtuZ4BhjzYvoifib1TwrXragpbBE1aKDEoCM9GbCXmpU6m/ZMtWCZkrjb3IAU48G4JvOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dIzLezvd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a13d6a2d7bso2654783e87.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773068522; x=1773673322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6YS8feCy/AcjUOl+x13VpxVJ8Kgr7ClPZ1jb91K/I0=;
        b=dIzLezvd1d9H0LzG/JF+6vZnQd40Ot5QNeBM5DAOSr+6UpegjmA4vRL3k2hncDmdG8
         IJRTX5oWEiN0/Ff60RmL/noSDB8MUeQFKD16cTRqOAWgPpvpS9gBt8qr2jsasS4q5R7B
         HtGezAGPs8e8hONmD2Pwh5aFFxFlnbJOLMlyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068522; x=1773673322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6YS8feCy/AcjUOl+x13VpxVJ8Kgr7ClPZ1jb91K/I0=;
        b=PCGggrhMXWZOwaX63PrSHKqsXywrOo//1i2EydNFLsYWojgh7tI7JlkGv7DQGR0k9L
         oTgHO0uES7FdqvpxVBxv0FMI/a4HH5BxaQOG6mlQ5jlr60Uy6m7uvX4ZvUIr3HdI917f
         7R3WrErIo79zTB6zPgOYxsxTy0LmnMZwSi21tOX5ndeSWHTGFXzqq0cTEqzABG1slaui
         aLOg8NV+bafbNboJyfLEqNVF3TcKH3k/HndBL+nEzdvxrYWlqb+e83+cNC+Q7X4/skOX
         2x295sgX1ZqkrbwkLqqqrAKwblCr9erTv0xGdL5X0uzzdLJjzNztwQHGqTcWH3QwqfN6
         ulAA==
X-Gm-Message-State: AOJu0YwTUXLCCSK8kV9xf25seGOxOOhJTLzGDR2go3z0zxTCP5xNitgK
	mDZ8YzcdyufhBm1y0wfIoBaiNPDw7NXGlmpWurqWPXyuxv/VGx8a/lLW4/RGW7uR+A==
X-Gm-Gg: ATEYQzz6NoC85vAwkqxMDdWU9JhMijJTSgCCZGoNJT0696++Q6R+SiOt3yu7/CLRlc+
	g9mS2ENopQ80YEvICWSCser+YBSOb28J8vlXNyvdnSHdMYb53Fl2WYyelOkYSF5kb0HLuCdthFL
	BSPLb6KUHVTEb0vVX/4zafJszXXNgy36WPkY4lHJWB3lWaQpH3drzOGAW3mT4Zk6hNtZbjF5fFQ
	C0DR8Eka9CdFuplaluMiwpLloEGBheSXxs1fzYyQjwxodRmx3cvDwPXJ/vL24itA+778x36wJ5y
	7rcrwUOlky00NnonHQwRdMCbZgSLdHBPwHTaY71NnOgjD3VVIfyEOQannB2kMqwFvIQctaimnY3
	hiD5s6F+0PgshokraGDWUESy8Q5cc/X63d6EjD/9DeFLWniuR5WQZkXorGyKRVRt9FzxP0pCTGS
	pe4PXn2axvruKab2juqykMKUQHGP2VuTN9a9XV1wG0npQRrsVg3RJRO1hQ9Ngx+Go+Dx8TIprsR
	A==
X-Received: by 2002:a05:6512:308b:b0:5a1:1941:18ad with SMTP id 2adb3069b0e04-5a131e381d3mr5383026e87.0.1773068519891;
        Mon, 09 Mar 2026 08:01:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08cc0dsm2138003e87.80.2026.03.09.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:01:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Mar 2026 15:01:54 +0000
Subject: [PATCH 1/3] media: uvcvideo: Enable VB2_DMABUF for metadata stream
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-uvc-metadata-dmabuf-v1-1-fc8b87bd29c5@chromium.org>
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
In-Reply-To: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 8A68423B3A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54959-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.934];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

The UVC driver has two video streams, one for the frames and another one
for the metadata. Both streams share most of the codebase, but only the
data stream declares support for DMABUF transfer mode.

I have tried the DMABUF transfer mode with CONFIG_DMABUF_HEAPS_SYSTEM
and the frames looked correct.

This patch announces the support for DMABUF for the metadata stream.
This is useful for apps/HALs that only want to support DMABUF.

Cc: stable@vger.kernel.org
Fixes: 088ead2552458 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 8b8f44b4a045..0eddd4f872ca 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -243,7 +243,7 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
 	int ret;
 
 	queue->queue.type = type;
-	queue->queue.io_modes = VB2_MMAP | VB2_USERPTR;
+	queue->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	queue->queue.drv_priv = queue;
 	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
 	queue->queue.mem_ops = &vb2_vmalloc_memops;
@@ -256,7 +256,6 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
 		queue->queue.ops = &uvc_meta_queue_qops;
 		break;
 	default:
-		queue->queue.io_modes |= VB2_DMABUF;
 		queue->queue.ops = &uvc_queue_qops;
 		break;
 	}

-- 
2.53.0.473.g4a7958ca14-goog


