Return-Path: <linux-media+bounces-58829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULdNMuW232lVYQAAu9opvQ
	(envelope-from <linux-media+bounces-58829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:03:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4184A40632C
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27A1730D43AB
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD853E4C7D;
	Wed, 15 Apr 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hTRt9sEF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC93E3DA3
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268806; cv=none; b=fBmrBjpvLNJADQRHm+sW4MdQRi9rFxxxWS62eBbFpDuIdkqObX9uw669jgiCJS5R4gtE1dCxR/Oa1wfIpZ4MQLGMrKkl8LGZbDLI9/65VhwXkogAm1G59vCLqlUTsmu09n8jKl7NTrJk3FEyIak4aIZZQx7nzdKA2003mfRVbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268806; c=relaxed/simple;
	bh=jklYbyXx8JhUeH0SfLpxUiKznxG0dRUU6oUylTpfc+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsgikZhFy79Z/nPpaO518Cos69jZduTe58JkQZteY6wpUS5x1Gd8KogR7DYeaIxXX/5+XF89dxzYXxeXLMH9sz9fkWut5bdOhLS1nLGPxCOiAy1g85oLIaDHt9CgDs4jOpnVqYHwzQVeHSv9QCTHFPTTaYOCCOA88RWDbHPt00M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hTRt9sEF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a1307438ddso6648647e87.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776268803; x=1776873603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gSe32++HvJCWSVHq7jVTGcbaloZh98EdgzMuL+sZWM=;
        b=hTRt9sEF4qHxUmnrPywD5Kuon+3vQEdNiYB+/FRKKB2bf0Zi5WQChXA61hz49yA/P6
         zABWvK6+HPZFtqfzmoT79YD3ucdJEREckb6bQZDHwUtNIyGfbFicB3gbpDq66pMOTNED
         ub3HnllubvqxnMPz5t42p2NSvHDa1BF81/Olw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268803; x=1776873603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gSe32++HvJCWSVHq7jVTGcbaloZh98EdgzMuL+sZWM=;
        b=i65oNZJABqsFiV884fxS8RvZAX2LZ9VzBa7ZxAKLUp9yPa2sEGKk0+/aSJZ4GFo++2
         H4NUNrGmhDlrGm6U4wVcxfxh0LwxvnBf3b2TnwqQpEaZHwWPoAsRnMdjqrmCthNFXgRs
         HWLFuflQYTqb3CEzVBJEICmSJJyapUMnLmgDI4FVG40iAFk0NzXe5nCMdvuHSiLb0UCQ
         5V/PaXAAgf99JheYxyA5gvcSWWURz9HBAXFrBIcJhaZkrU7dfxDw5fLTFo41APlXZ6jG
         ANq/rinbTmWhqHxMpIvL7+piNba2WbhCZ1MDfgSnnYzNu7HtEEp7YVXc+tFzsDm3+lHL
         tikQ==
X-Gm-Message-State: AOJu0YwwWgFX5ZJuNkGaN07DkjWaZZUvkbf/QB8wkW7NYDOGtHXIPhGn
	2gEnWFGY0Ae9Kx8o+Cmsz9bs/tB7Tu28czo750RnbhoEtKRtOibaMfYZ5p4rbkTNv7hDHjjpi15
	1iO7mow==
X-Gm-Gg: AeBDievFDRpCu5M9XIrMj5gqD3iJJPlJyNG/A+uviWD47FHi3UB1rnKuGqUrrk5ihoB
	WUmS/j1/f4I+9jLKoIjTCRDi/RLrOoUlyzUbWN85O3CZMCu1ivignoDzd74rPrZ5njOxFPQ3Ugh
	PTaG46/t9xWsvEkw40yKSgNOKzrUG9+MTriXzu43LfjD5culiq4qEH3A4SxutQTaFFcGUtS/8uT
	aZyQ78aHMBf8rYAK5DCcdEEeYbcoarQkSagYA3E7bXXO3bIl9mBWCl5N6ziIDOvHN6MrKogtU2t
	1KIC9LuPbf+DIlVsB4t8Eo/yV6pOG6NpYWCweJu1bXjnJbcQfNtWtjthOwwx05yUbT0aoGPHPOr
	is0t+2zYnhDYH7AWIR4oaNmByR2g1t0PLVwrEgzBBQSDa53+3E7XcMGL1S57f9PV1jF6a/Lci09
	TIjRaTzxW+Q/sQgTliIHoHqk/t6il+nJg6SJR7MDAX+Q4uyl21aXfT2ZWB1wPemIekLWJDpO1Td
	QeW0DI=
X-Received: by 2002:a05:6512:138e:b0:5a2:b3dd:7a63 with SMTP id 2adb3069b0e04-5a3efb4160dmr6917816e87.10.1776268803105;
        Wed, 15 Apr 2026 09:00:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ea096desm4664531fa.18.2026.04.15.09.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 09:00:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 15 Apr 2026 15:59:58 +0000
Subject: [PATCH 2/2] media: uvcvideo: Avoid partial metadata buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-uvc-meta-partial-v1-2-a0acc79a6300@chromium.org>
References: <20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org>
In-Reply-To: <20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58829-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]
X-Rspamd-Queue-Id: 4184A40632C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the metadata queue that is empty receives a new buffer while we are
in the middle of processing a frame, the first metadata buffer will
contain partial information.

Avoid this by tracking the state of the metadata buffer and making sure
that it is in sync with the data buffer.

Now that we are at it, simplify the code a bit by not getting a metadata
buffer if there is no data buffer ready.

Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 4feb3699f520..f339d6d19a39 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1517,6 +1517,8 @@ static void uvc_video_next_buffers(struct uvc_streaming *stream,
 						  *meta_buf);
 	}
 	*video_buf = uvc_queue_next_buffer(&stream->queue, *video_buf);
+	if (*video_buf && *meta_buf)
+		(*meta_buf)->state = UVC_BUF_STATE_ACTIVE;
 }
 
 static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
@@ -1718,9 +1720,23 @@ static void uvc_video_complete(struct urb *urb)
 
 	buf = uvc_queue_get_current_buffer(queue);
 
-	if (vb2_qmeta)
+	if (buf && vb2_qmeta)
 		buf_meta = uvc_queue_get_current_buffer(qmeta);
 
+	/*
+	 * Avoid partial metadata buffers, by making sure that the data buffer
+	 * and metadata buffer state is in sync.
+	 *
+	 * A new (QUEUED) buffer is only allowed to become ACTIVE if we are also
+	 * at the start of a new data buffer.
+	 */
+	if (buf_meta && buf_meta->state == UVC_BUF_STATE_QUEUED) {
+		if (buf->state != UVC_BUF_STATE_QUEUED)
+			buf_meta = NULL;
+		else
+			buf_meta->state = UVC_BUF_STATE_ACTIVE;
+	}
+
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
 

-- 
2.54.0.rc1.513.gad8abe7a5a-goog


