Return-Path: <linux-media+bounces-56636-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGU+CNJowGlkHgQAu9opvQ
	(envelope-from <linux-media+bounces-56636-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:10:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75C2EAF60
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7599130179DA
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 22:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679A837E30F;
	Sun, 22 Mar 2026 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="rhJ2XEyn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253231F98E
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217392; cv=none; b=V+YrAiLjuo/OwVCBizF4/aNIZxseLqktEYIkgzlyYVL6OEDOhlczqSpVd35+kCIK4VSacKh4D8CUMuFFnDqPv46qgd2W8dUIFvSD3eud+7RR/KQOw3rmn4MMGTrj9WySem4kaajBSa26FyJs6XICbch0+/2AljD5tXGu4GznX/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217392; c=relaxed/simple;
	bh=wehqK6rLH1PC9vgBn24Kw3MFbqIl5qgphsugM3D76v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcuUsQRPi8+DIgOQxYlzFwL8mw/NQIqKDdPmZXwAP5mVmFOuDSZLCc4Ug+I7/xpzqtqeimT4Wu7THdKYMOgNsyUZg6bAfRF+n3+rvyimzOQhTwodt5yuApqrY762io45PbSFwLZKWiqCdhI7DQTTmMsQCBHMaomeYXKbXazhRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=rhJ2XEyn; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c107ef474fso4141181eec.0
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 15:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217391; x=1774822191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+6TeIDvGKnGgJzVgLjcCJqKLNQPeYlw80XeDdHbaRI=;
        b=rhJ2XEynBFoKbnuVNc7PdBHSQk6jqfGMQO7SJ5f0UkLz2MvSjajqra3x8VkitqxJg6
         fEO0LOzD397yecZQzUmQSV4J8PXsN1rheRUMQs9gELLw4VS1Y3Wuh2sOirL/ynW/PV1p
         6eAHi6HJwiYGX69poD1dda8LEFTy9b0clciYKZQ5Lr+uiHhBvqP2JMfyTMBHBIMBoBkZ
         P5tE06pYM69Q0MqDRmi/P86vb4HcsAORoynz6sfGfNQOjwnZtc8MH9UlT1AxjXIXXd1x
         G4WJ9RaG3GXNP9HH/pFKlhrlosDbVaY6N4vKSaizHDWcPCWUykDri/sdNwpUD5UQLCI3
         R45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217391; x=1774822191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+6TeIDvGKnGgJzVgLjcCJqKLNQPeYlw80XeDdHbaRI=;
        b=G+Qfu83ViSZhhUJvnMkcuhNBvc50t0YegvWQAUSnNcgXSdjDhQd/x07u6G3kK47BwS
         dTZBzUyQI2b5CtmCRGf6jT/9JJto6NBe3m8UW9aCT8V7ccsZGG+sWGDFlNs6jQ5M5rRQ
         X0sN6DpWXhMrCpUZNHlCt1+acYP8uRvEhtEPpubS7Z683oFtYNPgwds05nuHBb9OrVEK
         CP2zST5OXZqOx4Njr18b2tF3v0YWrasteoFa4dPGyW4Tqv8JHwNXk6p4GwKx3pN+q58z
         AVVAkHnobh5kGjRVke3XsHc2KP091hhYyOW8tih3mTGBQiBi+dIm6mIQo08Zy34zrm6e
         bapQ==
X-Gm-Message-State: AOJu0Yy5uTYPH5edFOfts2Z+wWwjmTLS2hHrqMwDfj4mTZ9xzH2DQ6x2
	SWIZor7UyI5FyQO63Fp0Rl5CAAl/K7zuszuPfL0b4hUj4BAJbJPE+dfz8MdlqGcdFA==
X-Gm-Gg: ATEYQzy8qYM31uhkvcJyWYIF2IcxcLaeaj2ClLp+rjxyacQMXWv4wTa6X0CrvW+EKZa
	AD3Rolv46AHlbtrJ5zfG4XsSVEzhbM1CiyaL1INA5SQww/drue5xTjztRo5fW9uz8NGvDdcUbu4
	09ma1SztY7KvuWnG9sonmbmENLTXD7ide2RwgfsN3FU8VudhxO4WEi1fSDwtXBW2FUxj0jbwze6
	uNeSkb8N1N7fkk2NEcl44Yd9YLTZraG4vRLDKhc410Gk0T/W+BNL4h1n//UnPgA2h7J30/N3uD+
	5mgAB+4qOGCo3uOmG1IcdC9qba3Gw3GGVI/qiX2gccOqoyMzkVExij2Gt2vUbdboNvPaem8Bp+L
	qFuTEcsFnbza00brw4fDLsPwF/W7LP3vynQGnUpfwVso5Rm6OrOJOP1w6IU6V/mdD4TJGPILJ0F
	y8fbpyd1NS
X-Received: by 2002:a05:7022:23a2:b0:119:e56b:c75c with SMTP id a92af1059eb24-12a726d817fmr4897386c88.33.1774217390776;
        Sun, 22 Mar 2026 15:09:50 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm7707766c88.0.2026.03.22.15.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:09:50 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v3 1/3] USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
Date: Sun, 22 Mar 2026 15:09:38 -0700
Message-ID: <20260322220940.1462189-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322220940.1462189-1-jp@jphein.com>
References: <20260322220940.1462189-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56636-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,launchpad.net:url,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: 7A75C2EAF60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 UVC webcam whose firmware
does not handle USB Link Power Management transitions reliably. When LPM
is active, the device can enter a state where it fails to respond to
control transfers, producing EPIPE (-32) errors on UVC probe control
SET_CUR requests. In the worst case, the stalled endpoint triggers an
xHCI stop-endpoint command that times out, causing the host controller
to be declared dead and every USB device on the bus to be disconnected.

This has been reported as Ubuntu Launchpad Bug #2061177. The failure
mode is:

  1. UVC probe control SET_CUR returns -32 (EPIPE)
  2. xHCI host not responding to stop endpoint command
  3. xHCI host controller not responding, assume dead
  4. All USB devices on the affected xHCI controller disconnect

Disabling LPM prevents the firmware from entering the problematic low-
power states that precede the stall. This is the same approach used for
other webcams with similar firmware issues (e.g., Logitech HD Webcam C270).

Cc: stable@vger.kernel.org
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/usb/core/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -493,6 +493,8 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Razer - Razer Blade Keyboard */
 	{ USB_DEVICE(0x1532, 0x0116), .driver_info =
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
+	/* Razer - Razer Kiyo Pro Webcam */
+	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
 
 	/* Lenovo ThinkPad OneLink+ Dock twin hub controllers (VIA Labs VL812) */
 	{ USB_DEVICE(0x17ef, 0x1018), .driver_info = USB_QUIRK_RESET_RESUME },
--
2.43.0

