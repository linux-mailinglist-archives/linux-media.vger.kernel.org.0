Return-Path: <linux-media+bounces-56717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCwiLCk8wWkZRwQAu9opvQ
	(envelope-from <linux-media+bounces-56717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:12:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446C2F2938
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13B3C30D6335
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A111DF25C;
	Mon, 23 Mar 2026 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="geSBPm+J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7FF286A4
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271001; cv=none; b=C21j7jsiKFfD2jhPseJtNNObRfRJeoveg5nVeS9cV0AooBV2ihrZbzJKiKizAzWm4mF2ebcXkog/6N4qva4u7DewYRrk8VcE9mH+f25jvt48kDhdcsAVxJDsnemvtjNBiBD2HPKPytuApIw7ixKObLx3AJmWRAuE9y/aTIjcX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271001; c=relaxed/simple;
	bh=rm8yRXyKEMtcqCElasHXW+eehwQwuzwxvRFVsv2V3QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Aa2GhOnBqiydq8LJwg9bkdcx65FOnQEYqa5DlWDRmK0MrOT1zbclmtFZ4AnvKqzBqoAZ3uNe9SS2AnsXjSKHruI8z4WHhFgwIREgio6noMPctaQrfNAY9eUaufw+DNTzSgMf/iO2iI0ija6TxTW0llLlC+ukZYSwjYghLmrodVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=geSBPm+J; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a12c19affeso5197367e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774270998; x=1774875798; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rum/8YcSfFzn+mIlRZrRd8RBJkU4CF1JIzKByDx2Qcc=;
        b=geSBPm+J+umm9t+vd3JeuXnuQm6SBGqG34cLEXmjfgejaCv8hbzsBPXZ3wGyoi5vX8
         4VUWKD0FRWyoXGi22Sfd1QHqOiThegLN4tz6W8KKfQQ44qRcwEwEkV8FF0JOUH1hRJ2T
         2dcpItemcmDk5kqA7zZhkXEHvoQDklBzTYxWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270998; x=1774875798;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rum/8YcSfFzn+mIlRZrRd8RBJkU4CF1JIzKByDx2Qcc=;
        b=KXAId0TuaXtJGIlwPhQqGyKrq5GXa3oZKVOipYiC9fiGXIUcX2udL9CB7Z163xZGe7
         AfZ+m+YWuDCzFjnWO+q2bQ5WM/fBth94/DBHHqOUD3Y9C6xGy5qzywmWQVjCN/PInfYD
         J5opov++Tw1qU8wT99rI+TTvYhfv3FJ37ONzgS/1VHNWAHPLrPpeaIaNGdcBqrpe1Vom
         f8Qzxx2I8cAhjIc9Zzc9aTMzq0jBjvhXLSA+oq6pCnxY9sH+VgBmQyenyxQkx8s/DmkX
         t8RAEml129oCUOZiDampRutLetASFkAJQojB+YE8fZes00Pzvq2Jt8e1aQbvjQCaIOJX
         07EA==
X-Gm-Message-State: AOJu0YytN1ejyb0h+NrVJbcjf/pSiJY7K/7oguZRdVCJkjTAK9BNGjqZ
	KtpjHq73LqI+j3pwi2QLm+CTljc0FtbAqYqKzARrEXpkmSxtk5YUjNMl2FZ5saZjLQ==
X-Gm-Gg: ATEYQzzC/ksyXn1ejzCyiZA5P/WmvNi1/A7o6rIRbLmp+7jj718aBzJ8k6T3sMZ+VuH
	YWzOv3PlqHHbNyDpedzMrS3ewbYyev3l3W+DEi1q2VBYXQRNe7+q7Br+08eUZYBzuojj76V/2NT
	Qr8vVifR8KgJPHQKjel4XkAMg+F0CSiirJCKpIiICkwZRNQy4WQQ9pSXLvv8e5upTRpZBmp8mfL
	N3+kOiVo8TFQUEBm6PaXEftcDcorsUcRdSadNYI3iL22XK0z4wmvnHPl1gEEyBqJh4fetoEO5I+
	3dxMBIH9fO2h50uw4Nt1eAPGEHJEr+BsUNdhSQghq0cO4ULSHrHHOPZurEo0z3k3hnXTF3jSwzf
	wJbQhteAYJXzoOrjF0Pkex4YPWJHJQqbFGNdyaJwLW6lhtUPIBU8dpr2lPUAPGRnOi/k42/PCI+
	qhM+nbVzvrSaJ8WslUeoIPBCnztlgoa/xdtFLIdPVEkDxtGaTrElf2ZPIT9eqRdzU43FiAUG8kX
	1XE8p45QWbRQC3RjQ==
X-Received: by 2002:ac2:4e01:0:b0:5a1:5994:2773 with SMTP id 2adb3069b0e04-5a2855efc89mr3443970e87.14.1774270997925;
        Mon, 23 Mar 2026 06:03:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530bd55sm2534556e87.72.2026.03.23.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:03:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 13:03:03 +0000
Subject: [PATCH] media: uvcvideo: Undup use uvc_endpoint_max_bpi() code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-uvc-backport-bpi-v1-1-5b62c6798ccf@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAY6wWkC/x3MQQqAIBBA0avIrBtIDZOuEi3KphoCFa0IorsnL
 d/i/wcyJaYMnXgg0cWZgy+QlQC3jX4l5LkYVK1MrZXG83I4jW6PIR04RUZjtbG0yEa2GkoWEy1
 8/8t+eN8P4ra/Q2IAAAA=
X-Change-ID: 20260323-uvc-backport-bpi-68368ef14173
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
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
	TAGGED_FROM(0.00)[bounces-56717-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: 2446C2F2938
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[ Upstream commit 5b9c75c794ce041e6e00789efef75d71915c4f4c ]

Replace manual decoding of psize in uvc_parse_streaming(), with the code
from uvc_endpoint_max_bpi(). It also handles usb3 devices.

Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
The commit: 9764401bf6f8 ("media: uvcvideo: Fix bandwidth issue for Alcor
camera"), which has been backported to 5.4+, depends on this patch.

Without it, cameras connected to USB3.0 will stop working properly,
because the bandwidth quirk will be applied wrongly.

Please help adding this patch to 5.4, 5.10 and 5.15.

Thanks!
---
 drivers/media/usb/uvc/uvc_driver.c | 4 +---
 drivers/media/usb/uvc/uvc_video.c  | 3 +--
 drivers/media/usb/uvc/uvcvideo.h   | 1 +
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 858fc5b26a5e..4ee187a503b8 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1007,9 +1007,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 				streaming->header.bEndpointAddress);
 		if (ep == NULL)
 			continue;
-
-		psize = le16_to_cpu(ep->desc.wMaxPacketSize);
-		psize = (psize & 0x07ff) * (1 + ((psize >> 11) & 3));
+		psize = uvc_endpoint_max_bpi(dev->udev, ep);
 		if (psize > streaming->maxpsize)
 			streaming->maxpsize = psize;
 	}
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f868a13280a1..fb69d534e299 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1797,8 +1797,7 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
 /*
  * Compute the maximum number of bytes per interval for an endpoint.
  */
-static unsigned int uvc_endpoint_max_bpi(struct usb_device *dev,
-					 struct usb_host_endpoint *ep)
+u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
 {
 	u16 psize;
 	u16 mult;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 95af1591f105..f5bc9fa2c385 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -920,6 +920,7 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
 u32 uvc_fraction_to_interval(u32 numerator, u32 denominator);
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);
+u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
 
 /* Quirks support */
 void uvc_video_decode_isight(struct uvc_urb *uvc_urb,

---
base-commit: 91d48252ad4b17577cf8cc8d3e1353402e4da8f1
change-id: 20260323-uvc-backport-bpi-68368ef14173

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


