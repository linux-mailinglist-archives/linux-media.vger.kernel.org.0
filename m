Return-Path: <linux-media+bounces-61249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJsKKTwfA2r10gEAu9opvQ
	(envelope-from <linux-media+bounces-61249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:38:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C165204BC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A5E9308012C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77A84D98F9;
	Tue, 12 May 2026 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dYZht6Es"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB7F39DBC7
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589081; cv=none; b=RFey6OmdFSitTQbG40BoNVkUuLrrFgQ7BFZgourCbzTAGYAym8cYwt6Y7uJy1is5DgIRscKiW0pZwcFDim6mAjqI888pdRA7yOwp/H/kXO86GMD0Ezt9ecp3VCWzM9e3DCFFvoanOtK4D1cWw4jvjQCzO2MPXuVsaGrKHPDeQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589081; c=relaxed/simple;
	bh=QXZqxLkq5iFv9Y5EXJVO+rFjPbN/6N4mmA5gawFFR8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7Odek1TmeGBtqaBCV+SrD8osn4qGKbKUSLHqOS39aGnts/HGHg0g8AaxiRJW+r2otqaEwBbrD1yDYfrINt8kw8aZctfmyl4KxrLlhOzBt0TapmNIpi8Er3pOVL45j7zuZXZqRuNw17fQ9hy/NYZg5fKwqJYf/0/FAatOK0rB+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dYZht6Es; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dea72099eso5602403e87.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 05:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778589067; x=1779193867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9zYGesGzTkd0DsUCizsvVcECB6Unr6npXv+sKC4A5I=;
        b=dYZht6Es1vqFhALhcGKBJWB+hACU06x1HdhjWN91c+4Nr974wzyacmwo+qewTfkvbv
         4GN6ie77hgwwQ3VdBpPtzVOkAtHqkYHfJPCP2Y/NwlNe9Tmj3EUgnqr1QnT2kPHbpLCC
         TIldZNzg/cxqvRn9XymdM/nplaBQBQUyqTWb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589067; x=1779193867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m9zYGesGzTkd0DsUCizsvVcECB6Unr6npXv+sKC4A5I=;
        b=Wej2CyV81NMMywFFuHbPG7yXDHxuibyWNPY2ZAq5BFNt5LGG34P38oU9gwjzk6+ILq
         syDUVrSls95qAwwU4xd0RvHqtTpjoG/9Oy7LPVqw1DE9EIpY/40gCxEN7iXiJvwHpdNk
         JyK+s0w5GcWzSOZlGS+v2EyXAMhw7hckaavCl5nD13CvCbbJY/sbTOUXhgFWg2u6Odbe
         F7Ph7RJdsjJppWycXWB2Trw0PL1ImbvPAyGn6xHJ1/e/7YU1CpU20zsN2vwz02vpIvHV
         1fWvJWnXRMiz/J8ow7bzw+CsfhTxZW4DnQjFbezJn+VaIvvODlZFpaE41TNYAwW0tTvy
         XErQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BQyDw6233PW+rtcGBDIAETycY26ebtyjz7EMaoXAjduarl6npsGWcp245ukP2f6qCllmNfekhBOAKwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5nMAzWAgYgEWEUzT+dt0n+m+rA2zh69X2gYnUpxUNOCLfduAX
	0IFdc5ZrFAGOM51SM/8FNfyXFLhYI5f2eCxtAqUxYvECrET0YSgS6+irZx50XBAOzYVLRyeyWCQ
	3Mcy+euv34FE=
X-Gm-Gg: Acq92OFv/oPn5BnGK6t2icU9SZ5k/OFDvwh8GLvIZHTyUwlWXKQFYMIHumfSdi31Um7
	2EN0Yx5KXotPMta1QERGldaKRVpv4E3WJgfzMQsNmY9lsdhgd/FlKkqu1rn3PR8Ql7xqv9fuage
	x/rJoYaBhSKIvZAs5Vbgav4iYNyelZxH/uERDStOUqyabfmvS7KFkqXxbjHtL0NEA44ACI0e1tk
	FbXewbaTU1ZlDCMShsgFKnJLh3TMJCVGSOmDW8xICdertpnN55chqAvBMyFnlhDNt27EdJhed8M
	Hv7yRYQrniMspeL1aiwQCZgtsnSIs/7DxFHIYRqSDiRft/Ku6dwDo1vHnLh5k5Mqeo9vBxkx1ia
	MTO4Txyj8sHngRJ+g2yqA52eX3VuxfqQkZc+KNdfoXli0qIyv1d4aEYbVo0swI8T/Q/qHvI0P7T
	D3MJK7W/k5kddJwnZef7+BhWJKO3YdGei2BXMVJ5dwz5Qzl1H4cZT0+85erfoLyyK596FqAfa9y
	A==
X-Received: by 2002:a05:6512:124c:b0:5a8:8db6:b1f with SMTP id 2adb3069b0e04-5a8e31e0f56mr917863e87.24.1778589067182;
        Tue, 12 May 2026 05:31:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm1861344e87.22.2026.05.12.05.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:31:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 May 2026 12:30:57 +0000
Subject: [PATCH v2 3/5] media: uvcvideo: Relax the constrains for
 interpolating the hw clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-uvc-hwtimestamp-v2-3-3c2905c733bb@chromium.org>
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
X-Rspamd-Queue-Id: 01C165204BC
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
	TAGGED_FROM(0.00)[bounces-61249-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,chromium.org:email,chromium.org:mid,chromium.org:dkim]
X-Rspamd-Action: no action

In the initial version we set the min value to 250msec. Looks like
100msec can also provide a good value.

Now that we are at it, add a macro to make it cleaner.

Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
Cc: stable@vger.kernel.org
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 19a2880e0dc9..093186308eac 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -494,6 +494,13 @@ static int uvc_commit_video(struct uvc_streaming *stream,
  * Clocks and timestamps
  */
 
+/*
+ * The accuracy of the hardware timestamping depends on having enough data to
+ * interpolate between the different clock domains. This value is sof cycles,
+ * this is, milliseconds.
+ */
+#define UVC_MIN_HW_TIMESTAMP_DIFF 100
+
 static inline ktime_t uvc_video_get_time(void)
 {
 	if (uvc_clock_param == CLOCK_MONOTONIC)
@@ -843,13 +850,13 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 	 * buffer, but RAM is expensive these days, specially the infinitely
 	 * big.
 	 *
-	 * The value of 1/4th of a second was determined by running Android's
-	 * CTS on different devices.
+	 * The value of UVC_MIN_HW_TIMESTAMP_DIFF was determined by running
+	 * Android's CTS on different devices.
 	 *
-	 * dev_sof runs at 1KHz, and we have a fixed point precision of
-	 * 16 bits.
+	 * y1 and y2 are dev_sof with a fixed point precision of 16 bits.
 	 */
-	if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
+	if (clock->size != clock->count &&
+	    (y2 - y1) < (UVC_MIN_HW_TIMESTAMP_DIFF << 16))
 		goto done;
 
 	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2

-- 
2.54.0.563.g4f69b47b94-goog


