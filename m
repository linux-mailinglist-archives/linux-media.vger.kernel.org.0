Return-Path: <linux-media+bounces-61246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL78L4UeA2r10gEAu9opvQ
	(envelope-from <linux-media+bounces-61246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:35:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6475203F4
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C0653013D50
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F042F4DA529;
	Tue, 12 May 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YHACXRcS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4D5372049
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589073; cv=none; b=dA7CuADcmGRg9oOeTxb+nMnJ7TTnIWklwU93Is0XW9R07SFE8przX6UDDrq/Xdp+E9fiZyY3nR7MbnpphhFLautF5M6znIz1ONKeXn4tM7bH8yLidEJ9tmp7fIdHou3iyc1ba3W06MSLMEUw50nKFud4PsczAtxKrNQpeCAdDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589073; c=relaxed/simple;
	bh=sVF69CzaRVhIMaxnpfoXycHZBCoqXjnX6UDOqVWo4uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VATCbBxM58Nqtooq2gNbsbrN3MQpoah33OAYpWQ62b8TzmuiUZh8vRUU95uHBYuiLGSqd5Dup9GIh0sRAfgFoCheXY/RRtm6ULmQv9jV2aXxPKAexCAWyIcefp0t97jwAUcmmsBPaYekiiDIPund5l1fFM7xUaBf9rLeFxhl8fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YHACXRcS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8eb07ec4aso333572e87.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778589064; x=1779193864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AdI6VgavsPYoDm4OezW7Aw/oko1M4Tdgq3gnzd4Y6Q=;
        b=YHACXRcSkdDSfD0GCoZRlhqcsBU0avOYtJP8L7LcwHqpEZmLsN3UngVO0s70BaijDw
         oINCd2GeME6HqpgC2K6c58f119ndow2v9L6irgY73S121C2GtdOWu3rEfo1LenNlf8zU
         W5RzxV3epSM6SU7r6x40rR5fdUCKrA443G7Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589064; x=1779193864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1AdI6VgavsPYoDm4OezW7Aw/oko1M4Tdgq3gnzd4Y6Q=;
        b=IdjFIP4Sxj9lS2FsicyR6kI5cFiVJfLyulTtMxlYEP0zY3BiALXrfA0kehOTUTaSt5
         sEuU2ESJ/grJhrzhGFUi/aKHnsvmveg4tkfGgf3u9isGFlvkMQdxYsIteu935ttdWlVm
         Zpy1WKTjEoGvo2pPcXpXb7cGB/WiHPXPs79H68iVD+V/ojq2osmxFV+7bRuBWdoCh4Rw
         3lAJujvcKI4feRJ/P+wotUubPvu7O//WILOy6v6CW45TTh/rdKEM3IIYrcmfaUDl/idE
         ae++9D33ufjY5baRo/yfBLSKEKw+OXaffMurDBN7q2zB55alcSi6X4GJsOglV8wiU69p
         4mVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bfafC0KA9QFO25yVybato3//A2EuFkjVsVQ5T9AKH6VcmT9xhy5cgfX7Wb+wlfjZE9sY/itK8BPCSGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM3M/l9W8Cpe98JvkPk4NPcqAcwCyOBAZDFvNJY4/uZ08HrV0H
	+Gvk6MqFkN8ag9Nf3yt+FapjHjYFa/Uxx7kWAVcXDm3FagTvP2VAwTUKKrccCCM2kQ==
X-Gm-Gg: Acq92OHYt1JnxW1JcDuZxjzrvVlevB9UmPu4n7uxaVwtb0ksVuUv7yWRfwwL3KV3Sgo
	GOOaaZFASb1jecWsqY59oR0X6Wgf+xIHTi8UmqaINXvb0tQYVnj87iFMVnhQfTXdwPKsnygs9m3
	ta+mkVnRH8BG8KVSMpAvQApZ0mq4tFEknCC7rk2CqANhKXZRsHNrMA06iipuW7GiaBH7pMBr8pV
	eJ09tqiFA9J+HROOh4e2YTXF9aL65xdUdD0T1hA0SuqJ3rrgIh3RFEVT//4VIvXDQWdenJiPN1b
	5BPxY57rA9ufzx3TeUXy6YMtdcWSKFLI/MRmZGvNKYTid+My5jsC2MVw6qVcjQg7OVrx252iOEm
	LNdRQU34iOPwcfb9LO7lmrdAmYxvpTA3pH1IB6Ybp//es3qaNk7appEskkOueAIXNOmzIK64HgR
	KPSMs+S8fzKbKV0hqdt2gsOs9cKl1IzIRQr2QPAnGQEPQRpTE/j0U3jFvQu9q8e0JdBNczunVOg
	w==
X-Received: by 2002:a05:6512:3dac:b0:5a8:6e64:a932 with SMTP id 2adb3069b0e04-5a8e31ec7camr944916e87.32.1778589064250;
        Tue, 12 May 2026 05:31:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm1861344e87.22.2026.05.12.05.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:31:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 May 2026 12:30:55 +0000
Subject: [PATCH v2 1/5] media: uvcvideo: Fix dev_sof filtering in hw
 timestamp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-uvc-hwtimestamp-v2-1-3c2905c733bb@chromium.org>
References: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
In-Reply-To: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: CF6475203F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61246-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,chromium.org:email,chromium.org:mid,chromium.org:dkim]
X-Rspamd-Action: no action

To avoid filling the clock circular buffer with duplicated data we only
add it if the new value sof is different than the last added sof.

The issue is that we compare the unprocess sof with the processed sof.
If there is a sof_offset, or UVC_QUIRK_INVALID_DEVICE_SOF is enabled,
the comparison will not work as expected.

This patch moves the comparison to the right place.

Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
Cc: stable@vger.kernel.org
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f6c8e3223796..cbf67c17a49a 100644
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
2.54.0.563.g4f69b47b94-goog


