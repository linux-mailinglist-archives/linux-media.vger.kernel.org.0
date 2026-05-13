Return-Path: <linux-media+bounces-61408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFw0HuJlBGpVIAIAu9opvQ
	(envelope-from <linux-media+bounces-61408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:52:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D61095328E4
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF5493106A4C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BCA40626D;
	Wed, 13 May 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ivksZWN/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C473FF89F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672973; cv=none; b=uqld5W7e45XihOT+6M7yBhmIHN81WqodRR4EgsBKWR2dBejcwQsc9+1+oYPJH/Gn5A6CQTgzJINODHpVhfHlCKmyynytkO4z5X1xRrXeV7sQDwoWINu2enUs9EjJTDcJrBko5mxZz/7T6lakyDliJ0qYrNOBUugkM6hlmSe1Ne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672973; c=relaxed/simple;
	bh=RF4pGcE9NoU02iwInJt+MH18862e4woYfVw3r5w+0sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmaEMzF7/ZmixuMr+k8iLvS5NsAtG56Jifwb/ROdDIZ1ww8moyNAW1S+qci8jBnORIG9391SdqbcFF9arcqwU/6IzqfuhcXsbBKSK3StlN76Z1A/x8QxdMu/nxNHva6PWO4Z/kGmZFEEe/Nq5cDo+w/0QckQf8yIofTIn9mDMcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ivksZWN/; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-393a49d2e5eso56580021fa.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778672970; x=1779277770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0ZRwxo5likBdhusuGC3nYZtwDAXyPPbS6VC4yvRn8U=;
        b=ivksZWN/IchrCl6FYZBkoW4qS/MBnvbVC0cADUGPwCYyN7lLgtBG801nhv61Kvqjr4
         HHM8BOoAzQSqd2lxQWT9esGMtdnoQmnWIiUnRRxZjLuba5O4iloxTzE35qS2H4cHhhLq
         +RpKgHqi2/XvAod89aIDZtWJMq9/GptwetbYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672970; x=1779277770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S0ZRwxo5likBdhusuGC3nYZtwDAXyPPbS6VC4yvRn8U=;
        b=jB4DIrV4NM3xibxV7nBhxTQ/AJfrwmpBMmZl3GNDitNx4AI81BhJpDJy5YSoLHaKcX
         u3gIsjoeuPQT1D9/TteR35fTK6U1kY8IxCem2tqJnGpNEiUa3rzla/5++IWKNG93LRwt
         xFuPQIgYUJ5N7vE2U+l9CB0fa+g5Zzp4wDLjhaobBEUXFG+Mm0Pjxr+6B9pV4aYUpdgG
         TFsmOJqWep7LQS1+sRKACZR3O8Q38OgoUpiJWpCbagB42br7Je3NBhg0oFA1CdhFShHe
         c5uVc7Nfl9bpDG6IR4ACUcglLLan7PUW3Jp6AsdBYjFhLbAQzL56f3Tu85Jyr0gsnc/u
         UiUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xnF8gP9+6tkt0uhRXs8MJqnm84+av/p3IHJm3Rh3/oMLL5D1LePZTACN+4HMSgqsPWiyIsV1H2gMgtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3ZXXwiogK4MGSCvMwfMD+3cosJoM/T8/fwFpUkVOtPxzowVw
	z2cb2e9Vw6/3rdG2CvW2aMfFRtwElR1jT2AaqCesEEVrBhR+730PEYE4iImox664QQ==
X-Gm-Gg: Acq92OGnqbEvNj9qGmuC4sfhU9wKwqljZ0YYc+s1GuJgGZndQyDZMK68pW8KJglUw9d
	6Gdp3TgRl5OuzqOhfEdPhhTPsx99w8alfeHat6T6cAy5g1bnjx49nfuxVajfap9CqhP7u7ISTeY
	ycBu9lCFh/LQ1V3pw/1Putf5hx3dhj7XYPjQbV+3hCFyuIq+kYXPomES7K2aoEKj84MoQtDoG1J
	pjgD2DjBvuCKdTbFDWoGqC1xpRAfYrGPEMFjB5p6gO7taNDgrFUS60vzW6nJ1mEeOuluIvBJUlr
	LS8CzNstNyZHBuPofaCSEDE7E0NitabhZ78C1xY5amQnq4F934OW/zpmnFFVl2OYgY7GNnNuzif
	7YX565VFPAwgm4c+pT6WOjdvRIqNER5rYV2yaUehYkRmaKFSMugvImRYtyPH7yXMLHLPHoh6Hbf
	zNUXVjmJZNPSfsFanMp7IF1I1iRhhwG766r/rTzx49ysMh7VCenQ1+H/3huA/gqRQQp+bym11GM
	HUZvJjUl3s/
X-Received: by 2002:a2e:b52a:0:b0:38e:98b9:9fcd with SMTP id 38308e7fff4ca-3944ea71a76mr5768831fa.27.1778672969751;
        Wed, 13 May 2026 04:49:29 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4f1sm40971071fa.27.2026.05.13.04.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:49:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 13 May 2026 11:49:23 +0000
Subject: [PATCH v3 4/6] media: uvcvideo: Do not add clock samples with
 small sof delta
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-uvc-hwtimestamp-v3-4-7a64838b0b02@chromium.org>
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
In-Reply-To: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: D61095328E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61408-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:mid,chromium.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

Some UVC 1.1 cameras running in fast isochronous mode tend to spam the
USB host with a lot of empty packets. These packets contain clock
information and are added to the clock buffer but do not add any
accuracy to the calculation. In fact, it is quite the opposite, in our
calculations, only the first and the last timestamp is used, and we only
have 32 slots.

Ignore the samples that will produce less than MIN_HW_TIMESTAMP_DIFF
data.

Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
Cc: stable@vger.kernel.org
Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 355b9bfb799e..63850b779e24 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -544,6 +544,15 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
 	spin_unlock_irqrestore(&clock->lock, flags);
 }
 
+static inline u16 sof_diff(u16 a, u16 b)
+{
+	/*
+	 * Because the result is modulo 2048 (via & 2047), we do not need a
+	 * special case for a < b.
+	 */
+	return (a - b) & 2047;
+}
+
 static void
 uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 		       const u8 *data, int len)
@@ -664,12 +673,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
 
 	/*
-	 * To limit the amount of data, drop SCRs with an SOF identical to the
+	 * To limit the amount of data, drop SCRs with an SOF similar to the
 	 * previous one. This filtering is also needed to support UVC 1.5, where
 	 * all the data packets of the same frame contains the same SOF. In that
 	 * case only the first one will match the host_sof.
 	 */
-	if (sample.dev_sof == stream->clock.last_sof)
+	if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
+	    (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
 		return;
 
 	uvc_video_clock_add_sample(&stream->clock, &sample);

-- 
2.54.0.563.g4f69b47b94-goog


