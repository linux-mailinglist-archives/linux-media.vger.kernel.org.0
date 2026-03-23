Return-Path: <linux-media+bounces-56721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNVJHdI9wWk9RwQAu9opvQ
	(envelope-from <linux-media+bounces-56721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:19:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C96192F2B66
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DEE13055C65
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8505A3AA505;
	Mon, 23 Mar 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NtdAjaCv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A23A63E1
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271440; cv=none; b=Oj79mnJ+NGjYUhKXD3XNOdCXsskK9x9gXSL/mOXx10OpHORfUqNrXU48ZkHa/oyH0sPtEdn3cG/9kQUF17HM0tszKZEFV6G/NzfAcLU4Fq2wrTxRQtj5hqrmGq0EavHtZwZ4xpTiWT+Zm8DOP+CV9v3fl7o16bt/OEYZlBRbCEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271440; c=relaxed/simple;
	bh=Dik3qCI9WwYhQtWNVwsHglbalL0D4dBZsnePm7m7Hjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RT+xYY+YKHXSEih8bPhnwiL3qvBtpCYzrv2Z9vufmHoQTWJXliRXIgz9VQX6oIhK/IARazPAuvbea1lPy7wZkeUUMTgS2K4K6K0aPT4EENyfG9ARqUDAvWeZ8iZa2vSrAo4LkZ9GWio2ukBvaSZ/cuBeFGc32tkU6HiQfugCfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NtdAjaCv; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e4989dacdso4163329e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774271435; x=1774876235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9dStjhiWrEZzM9Aql0LQkX++HFAYapf9Vi1OVY9kvs=;
        b=NtdAjaCvIlgJ44VFq+QAflHjV8aLwP9c0INLCzifuk0kwJ7TR4kbIzrni0cqXvRxUa
         a0gMG0YST+t9i4I9XX5ddX+TUG6xxCKoXd/t4TxfAC0LagLgVd60U4HZerSSpIB9/KjJ
         ZebhO8eyrdySNBxYfX+QkDA6OpLtYfFAd7qvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271435; x=1774876235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9dStjhiWrEZzM9Aql0LQkX++HFAYapf9Vi1OVY9kvs=;
        b=F9CY9xSrbxYJ+ptUY7nmHhYmH3MfFtE6TizIhizsIivvIgCH9SKanSYcgZGgPcV2sC
         QJUdXzqVdsPPmc0BUdb0AlzLYlJ7/GrYSaS+HCdp91grbb8NA4DvwLFUCmz0qO2Do5UW
         qtLwUmw8hSd1CrSO7nm/M+KiWjv5wuI08q1A75n3m+x5B1vEKOXvG51zoHHsztW47l98
         SgqfwhPN5/eXBw0TO/25JtHO1B5Putr0Mx6VTYGbSPVPJwwl809DD2lFW8DrlXu4qgU1
         jGLh9GaZ5pKBgO38/xuFA2yzjF20XG7Pevdc7z+0lYFkrLrRrRAbMs3E+G7xs6o+oVZO
         xApg==
X-Forwarded-Encrypted: i=1; AJvYcCV3DKj6aQ4ObYKOeFQCEAvG1yKr875fefb2i4lyhB3LfoXhAwfLOPm8WPN6fEtMUriuqqXcWdpD1QEe3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzk07TgjLXV1zxD0RblLQ2xvsnrcQ2RukvIY0Z/RHH7n7tlK6
	lMALkneYnPgaWtMib57me8RLy5BZ7syWpOmUcUcUHN5F3thQFbAHnoRerS6vZjeonA==
X-Gm-Gg: ATEYQzyCgBf00yLfNAi/VFLsYwc2BnLfacEBW7sSgE44/PqmsQJP/rYNTshIYYq2hqs
	kLs85Yi0F055bVbFI0qn+u781IJ/m8Uh77E1W1iOTEhS06r0zfCOqENoKStaqHWbDedybEYX8m7
	WvrEk5K7sgJwZijHLVKtjP+GCO9T+/QPdFTR4kTNlXSsYTVqYbxNo96dIb/UAOiESoRGr81+QAQ
	L8fEWbueFCBP/c6vwfv6aMt0mNgvfeadXton5czcedmxDTR3jVJIpjLiaPwMKecyEa6LQc+RroP
	PCo2O5fX105EhkOTFcBjl+yyF17Gvrc3cnLtXS2vLD9L0c5C45DFMGEWOZ8/Zu8gktAFKgFcFdz
	g1Kz/2XAM4JQsl/BdkilnZbAfNpUHWf7ZTiRr5h9tHc0dEQFy7gyHD2WP0lWt4yCHXKKFxvNS9p
	SNBi8ZdNar9/6BE5u1DO9DaA2dzV+plydtLPUhgoegPdvKXlS/wqdc6IceoKRwoIAP8y/CD34hF
	PVRz/U=
X-Received: by 2002:a05:6512:39d1:b0:5a1:2a71:cc3b with SMTP id 2adb3069b0e04-5a285b06943mr4155949e87.18.1774271435364;
        Mon, 23 Mar 2026 06:10:35 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e07sm2515904e87.66.2026.03.23.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:10:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 13:10:28 +0000
Subject: [PATCH 1/4] media: uvcvideo: Fix dev_sof filtering in hw timestamp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-uvc-hwtimestamp-v1-1-aa42e3865204@chromium.org>
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
In-Reply-To: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-56721-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: C96192F2B66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To avoid filling the clock circular buffer with duplicated data we only
add it if the new value sof is different than the last added sof.

The issue is that we compare the unprocess sof with the processed sof.
If there is a sof_offset, or UVC_QUIRK_INVALID_DEVICE_SOF is enabled,
the comparison will not work as expected.

This patch moves the comparison to the right place.

Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051da2..6786ca38fe5e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -583,16 +583,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	if (!has_scr)
 		return;
 
-	/*
-	 * To limit the amount of data, drop SCRs with an SOF identical to the
-	 * previous one. This filtering is also needed to support UVC 1.5, where
-	 * all the data packets of the same frame contains the same SOF. In that
-	 * case only the first one will match the host_sof.
-	 */
 	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
-	if (sample.dev_sof == stream->clock.last_sof)
-		return;
-
 	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
 
 	/*
@@ -664,6 +655,16 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	}
 
 	sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
+
+	/*
+	 * To limit the amount of data, drop SCRs with an SOF identical to the
+	 * previous one. This filtering is also needed to support UVC 1.5, where
+	 * all the data packets of the same frame contains the same SOF. In that
+	 * case only the first one will match the host_sof.
+	 */
+	if (sample.dev_sof == stream->clock.last_sof)
+		return;
+
 	uvc_video_clock_add_sample(&stream->clock, &sample);
 	stream->clock.last_sof = sample.dev_sof;
 }

-- 
2.53.0.959.g497ff81fa9-goog


