Return-Path: <linux-media+bounces-57692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBlaBrYYy2lrDwYAu9opvQ
	(envelope-from <linux-media+bounces-57692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:43:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D21362CA3
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D629730BDFC2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B342C2363;
	Tue, 31 Mar 2026 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="iImOWr6z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96B27A904
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917493; cv=none; b=uDstKk79Gv4FLEBXOAikKWWPKMZ9U7Kbj6xMWTEFXzQmzpQemfY0jiHthCU3Pa6o0Sx8eLPDIjovNUYR8UAq7jBdaH0gKpz8j2V0k68fk653Dp2vNUBcx2Hq6KZey1IqF/miqLoVCvJ7SO6ySR4zDI22TagvJ2DCww4810oDQuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917493; c=relaxed/simple;
	bh=NKt2CmEWcZXfwziTA/rm+SpSsbUmPomDYqEGhX+nbPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lwzo58Yy8qg8dba/LLDBgJo+0/OpTAnxYtF91uORaMdYLgFM8FNHdIwGp5Nw/nm/S22Vt2fCBnKnr2+2oPZmCrFyMJb7fj7mlOaJNr11LmF4FkVdbor3LQThvgDWwSFvK7T38SEuSsnbjmy8BUXCSGqCUp5kqJJ9kqC3A/Hoh8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=iImOWr6z; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12713e56abdso1997546c88.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 17:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774917490; x=1775522290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBcqWFVY3mntUXBUlKC2Ful/A4x09kKb7ZTmoHge9Jw=;
        b=iImOWr6zpaEQjhYcBu/LBqsrLKyGCqLsctXfYx/SP6B3qyyOwxGi2Ozu1lEyc2QXzn
         kWV63PpL3ib0/2vwKQ2tGDVZY5vpjmW0D9b3u6iIsd5XZ8WcmPirYnXUL44jkrHtJGnn
         UDufDAbeXoqx0IGEmQhejeFdXp9qws8ytziSa5TqLT2T7MydHsp/tJUYu4/Z+GEV0Hnj
         9S8GXKElYEfGFng4QcCbcPcCZa3S4i5n+PyoJPm/yG7aHqv2qQXefVTktkmUEkkknHKi
         hVM/RTxG1PJOEZej3Kisk1SnSodeHa2scV2Gpu7+ftTEyvSV0rpUHnNfIAvV5jT1O7/Q
         ESPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917490; x=1775522290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBcqWFVY3mntUXBUlKC2Ful/A4x09kKb7ZTmoHge9Jw=;
        b=tGt8990/oSPIJ1JixXGTNKjE+ukwaPQbbkEnXGOyHGsw/0YJL1qA6MYyO6i9JHgbH6
         PPJm7xdNTqDVkZluMTFNRCkQC6BNYbuRToffYz1SO9AQPWxSyzm02giZGuv2nwHwn5gj
         37Msrmvs+OG78SmCGgK+oPc3/qYAWILrRDlhWnWnrRsyXAhsUMuUwnHI8gj0y3O47UKT
         scO854d+vuEopCY/sUNC+2X4c0B53CqchemOLuJqlJsU7GJr1woaJk+N4EWDYrHAY7Qv
         yzbJHZKMQhIggp5vaYzgWS+Aek6JXmkjahwlHdOi6g+HwtqzcgIKdkTi776iMh0mpsf8
         v/sw==
X-Gm-Message-State: AOJu0Yzh5g4jpQ4pHzj4+yZhRQ9dwiIhxXzatjbyGKvzqc/3/g95B7Wo
	VkoD5eoo+++gmqYRIwEAV5INkas/7Nc8p+tyNgq5gvLx0FS1yAlGlqqDtkbw/cpyDA==
X-Gm-Gg: ATEYQzyL9QXiUzFbb8k+PF5OjJvEsfzCaIrQ8jjOUwTRIeWRmNCyUJAfAjAxSKlC9Xe
	kSlzxS++dnbAg4CFEO/naVwtrKHqUXMpAwzRSnA3s8s5Yg3esno36fBuJJF9wK2nJeXPt6i89Du
	Ogz8HGy40JU0JZtby7c9/MnIrndHaIwOr8u8wo9063QAK/1p+synQp43kEPH5bM9gmNbvQGl/wK
	/kEOK5Aj533C4gYAl1NsV6J0vXI7OivwugLxmsa1HCTqm461UpKsSk/Xznuw4Qog/HhTv+URPqV
	RI/AtQ8A4/G/xnyXznKsq1Wox/8Znj59AJWAO9KhkO3r7gNyhnh4P+1F0xqdnzS3+lfhzK/nzIZ
	vTudVK4sWr/wQ1qrCDOvjVoWsYrtsf+4/q41ZfzMM7v4WwiBqp6DswGQZnv8aZRkdIiLN6mdU+6
	jjfwa8wCVxfg==
X-Received: by 2002:a05:7022:fa2:b0:119:e569:f873 with SMTP id a92af1059eb24-12bddebce50mr685757c88.16.1774917489613;
        Mon, 30 Mar 2026 17:38:09 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm9343057c88.12.2026.03.30.17.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:38:09 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
Date: Mon, 30 Mar 2026 17:38:04 -0700
Message-ID: <20260331003806.212565-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331003806.212565-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57692-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:email,jphein.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,launchpad.net:url]
X-Rspamd-Queue-Id: 64D21362CA3
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
index 9e7e49712..7c4038a1e 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -480,6 +480,8 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Razer - Razer Blade Keyboard */
 	{ USB_DEVICE(0x1532, 0x0116), .driver_info =
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
+	/* Razer - Razer Kiyo Pro Webcam */
+	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
 
 	/* Lenovo ThinkPad OneLink+ Dock twin hub controllers (VIA Labs VL812) */
 	{ USB_DEVICE(0x17ef, 0x1018), .driver_info = USB_QUIRK_RESET_RESUME },
-- 
2.43.0


