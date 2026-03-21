Return-Path: <linux-media+bounces-56618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI8TOOQdv2mavAMAu9opvQ
	(envelope-from <linux-media+bounces-56618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 23:38:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 645D02E7818
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 23:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 810733026C26
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 22:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B313131A07B;
	Sat, 21 Mar 2026 22:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="W9Th2fm/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEFD30EF95
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 22:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132658; cv=none; b=s0dMvlWTZusMdFjecjlJHVwlkf8NCQeSJT68PoD6OmuGKS6h8F4yNopV8oJOTob7XLundS13ENhaomRyn/fCacRmEqOtrZbYNM0rADoF4c5fjU9TmOcsMXTufoeWAa9o9ZBNGJUQ2xxPaYgAD7ibJP5kDochQ/OOtTNzZNuYe0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132658; c=relaxed/simple;
	bh=ZB4v3IPFDRnk0aKPXENNDAE3F/R3GHcKa0Ja8oqgihA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5gt4NBwawwPKD29Pc6MaMA4i8laxiC22B6mDHDJ0gM9Se8nLN1SP9H38TEJ0MjTOgUdBzj3dPyEn11xYhohkOOTHEpnlL5DWLS6Kii6kDlMWSi6mbkXSSeYdR6pj2aUmawvENNs11bbWZnf8BIdc1ecSlyDYiqiZpxR5h8nFN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=W9Th2fm/; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c0c482e069so1359538eec.0
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 15:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774132656; x=1774737456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWxv10dmacQCe02GOaZYv2taNeWbAdkdfAH3ZWq85RY=;
        b=W9Th2fm/6CV0ExkYq2CSLa1B0+JWr42lcCki+pT4AKbBJNyxV6nBP0Ey97SJvpEvkS
         9rFO/hl5eKcPDoB27CDJbQaNT5rIrspSgFZy8fF8UNO8/2NU2ILginMGojw+iitwwU6V
         BLYQo4WfLXFtsdd1ceTp2q4JmIBecZjL+UEuqfi7oskxINKb0E0pX3uyHgAl+J5kfFxM
         QM/SvI/G6QyXLghY240XmogS0pWYvJFNPhbLN7keZTv9G+9rzOlK7vDVSLO2NsuD3eW1
         VckPE9A5wUtiAA7m4xN4WTh7ovCTP0NsDS2x09YottEzf2T5j4a247/AeJKDzArDmWiY
         uDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774132656; x=1774737456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWxv10dmacQCe02GOaZYv2taNeWbAdkdfAH3ZWq85RY=;
        b=P5TRBbS0kc5tq+JBqJaxvEoPImxs70k5iJBxKklv7wts1ZAv5WM7CoMRILuNa24NjA
         cAqKPjVd4MEU8R5ENSIop9Y2A8zuvGIDxTpW7YKUnzFzemwqDLyqZblA3EneofTyTGy2
         V/Xlmp7zZnb5KF6OsKdRX7Bhm2vZPT4bdp/Pr/HvDrAuZOdKoIZKkogx+rnvYvVGKPw7
         XBMkzJwhXisbIErUjUAP+EvQ0ZoZ1iff0V/XJbjD0VhA1NTlwsrnFgiw5GyiRmGHlnh9
         bKaRsb1aqAWdruu0vB1dUaIZYggJzjIo0g2QbGyMmGHcFe3C8G1lie16elQtu6jOWPa+
         hX0w==
X-Gm-Message-State: AOJu0YzjKEuFo6EbxRS7CgH7S+5Z20vUACyteK26rIKGSQXdS+G8p645
	YTHVDvBK8VMyE6K5yN3Cr1sK5cgu6BtWMrqb4f6wc3iZUqenWT3hA7mK+uZ68O50tA==
X-Gm-Gg: ATEYQzy2DDvP0o4OlxiE6Oeb/0h0Yjc3EZLA2FZGlv5rXTqyGISgq0krhn1pPhbJzau
	sGD8DGsDpyB65ujkUBKODnSVWf9lGctne21Gd8XrCsusH47X1ft1jMqIqs0Sul4tN6vcMgNOZ09
	hLFdqQXxBIAWe4zavp5uV1Q3ZMVsY3Q+DQh0axFXXTWXvUeERBxcwicNX9un3gcxSuveNcU3C54
	8qrMzBNPIKqmxmQl+tEXLP3tASu3Gztbn94v1eDM2+OionFxPt+QM8dtvPH9sX6D88wYqs/I831
	DXF3PS8ZdFAaGkvHAS0KM4KTXS6IrfPhOzI1drg2SReY3+WT8Q0+xXiDLNyGRfxFqoT8p9eYaGz
	cGdOwqSsEExq0bwwpiRBl4OST3w42qhLJS95/ra1Nk+hdhthIuALwk8HfCGcD9t+pzYmGezcI20
	kEDsttVZwp
X-Received: by 2002:a05:7301:3d1a:b0:2ba:9835:112d with SMTP id 5a478bee46e88-2c109565648mr3372368eec.3.1774132656039;
        Sat, 21 Mar 2026 15:37:36 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm7982131eec.2.2026.03.21.15.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:37:35 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 1/3] USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
Date: Sat, 21 Mar 2026 15:37:03 -0700
Message-ID: <20260321223713.1219297-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321223713.1219297-1-jp@jphein.com>
References: <20260321223713.1219297-1-jp@jphein.com>
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
	TAGGED_FROM(0.00)[bounces-56618-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 645D02E7818
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
other webcams with similar firmware issues (e.g., Logitech, Realtek).

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

