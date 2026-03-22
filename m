Return-Path: <linux-media+bounces-56645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PIkFWpywGmDHwQAu9opvQ
	(envelope-from <linux-media+bounces-56645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:51:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F5D2EB146
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5AE0301A924
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 22:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C26D372EF7;
	Sun, 22 Mar 2026 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="mPJVecTM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAAF36897F
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 22:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774219843; cv=none; b=X25ykuw0+s2t1E+D42w/eFaN6Ag6uyuZsp91ZyH4J+6A/kA+oEm2DnWems4tBrehytc36Y5qb9hXyoN25URKtXeq4cEH5C+Qbse3MhlxvC1p9X2p+jc3H4f757C/1vfalj1T0if3qgAP+kGdXAdxLuh6tPe0nOnG/ZxyLlF1X9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774219843; c=relaxed/simple;
	bh=fsTHyWOUvDIlejGCT9LsXLY/uwNu3171UnVIx7oqPKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRuDyGkQdL7fxtU337TmKCKvq+BgUC8I8fCVw3kSXJHFFBQCVWRcxefKqidgZolCRQs9c33xwDjD+5e9h2PzU1ERxDZxbxs0COAP2XAXusMizl1OgT0jUcaPkTk+p1gd5kPjZxWaUk/TQK7Zb0gQ2R8o80dsqdwG+1k/k1lfvD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=mPJVecTM; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so4224419eec.0
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 15:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774219841; x=1774824641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZwt0R/IQ/cE7o40rmBPpv+gSd79siNpA7SF/5ZqoKk=;
        b=mPJVecTMGi1VrdT2P6ghxa9p2NCnGdeHUCB2eQcMx9rKB56qffWwJQ1k6m8tCRfEoi
         8xQjNwQotmy4e0E1wK5fEY6k4qmQvkW/UINzzsLkWtT1DByw7KfRC/9GAo3y6mCp926c
         oOuq84FjaZEQdq3ZMKSinyv5sEUQnOL+ps90NQFB6basyN3h3EO0pCGrx5NA3JKtkU7D
         cUXBBwWJyfFfF3aNajOjN9Cd/eutsObLo2+Jyc0M5HZORojy0ZLRqQc+RCOQ2XN3iKdO
         FFkqTDXcaFQbAplrZNznn0W01IdihuijBPSiYtxpdATJ9Bnei6cO8lEOn57PPAk3Gamo
         CDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774219841; x=1774824641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DZwt0R/IQ/cE7o40rmBPpv+gSd79siNpA7SF/5ZqoKk=;
        b=Fk09uS9vxhgNRgu3FlLNMEqJG+6gdUESw2VFyQ3fovS7GYAo/zRTEuNQ97xN+AShpJ
         96OIvdKW7PQq5wy/CDjPEd5yBu5yjtxwVpEXb7T+gpEuYfsYjJB1shjWpmQ/oTbphHN6
         E1hZzOphn06FdfRYC+rQS0ftZ5IOt0vsu+QC9K0c23tlUE/m23cED84U5qLKWnz8QnOS
         bUr1HMNHSi995xaNTPAOna46U7H2+Yk5uPOEG5pg7Tpu0bLHSwW1OveZwRyPCg+Fumrw
         8kdm0DdqhMWa9N12uxOH6jJrveWTf/jLb/JZR1Y2A0d956sEsW+SXrx9BJthoXXqt8tS
         IRYQ==
X-Gm-Message-State: AOJu0YwnXuq7UmuH7EU80WQH1Jv+F3JTe5lkRGGxXdh8b7KR5joZUR6d
	pas1yPHQb9YTtrXVylePjbNW5vL4HghCLsXScQM07gB/DjgEBJ3K40UYJ4Ne/L9S3w==
X-Gm-Gg: ATEYQzytQhJypD9e0RZITCZ3xP92XpQXGBaXbotEk1JKge0vvwtP1lXF2VVRIYDnHlB
	6VnnF4LGyxtRCxEejC2mVPqOQvkswJ1KGB7F0y4yl64tFmkzFSPA/mWlZVj0w4Qfx2ppBxlBqao
	0p/BJn+1fPjAd5koA9msvaPLOkZM1i9URgdvTM70FqBppcF4HahCuAw/u9w8FAgyVyuMYexhZm1
	heCxdVpvTopvY3oIkqyYTGa1GcsjVU2oT/qSrvkPXGR/stZuQp1Q9RyoZpUrwp/5NWCJ2r7V77N
	I4Jvt0bezX4850w1tPG7mlC8f+2EBn4OSHClUCDL2z2NKr61Mzru/U5rHaceP3ZrPLQYga5xijE
	R26lKbjx5xbjtPZV+lHEYPMznQpOdWDCuuGVQFbSHBT6R3C5+7vMIXa/hIsFQ2SgjPWDaoFeMrV
	+TW1fx7kpX
X-Received: by 2002:a05:693c:3104:b0:2c0:c767:b6b with SMTP id 5a478bee46e88-2c10980a596mr4183538eec.32.1774219840860;
        Sun, 22 Mar 2026 15:50:40 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31ebd5sm10928052eec.27.2026.03.22.15.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:50:40 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v4 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
Date: Sun, 22 Mar 2026 15:50:11 -0700
Message-ID: <20260322225012.1817920-3-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322225012.1817920-1-jp@jphein.com>
References: <20260322225012.1817920-1-jp@jphein.com>
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
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56645-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B0F5D2EB146
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some USB webcams have firmware that crashes when it receives rapid
consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
(1532:0e05) is one such device -- after several hundred rapid control
changes over a few seconds, the device stops responding entirely,
triggering an xHCI stop-endpoint command timeout that causes the host
controller to be declared dead, disconnecting every USB device on the
bus.

The failure is amplified by the standard UVC error-code query: when a
SET_CUR fails with EPIPE, the driver sends a second transfer (GET_CUR
on UVC_VC_REQUEST_ERROR_CODE_CONTROL) to read the UVC error code. On a
device that is already stalling, this second transfer pushes the
firmware into a full lockup.

Introduce UVC_QUIRK_CTRL_THROTTLE (0x00080000) to address both issues:

  - Enforce a minimum 50ms interval between SET_CUR control transfers,
    preventing the rapid-fire pattern that overwhelms the firmware.
    50ms allows up to 20 control changes per second, which is sufficient
    for interactive slider adjustments while keeping the device stable.

  - Skip the UVC_VC_REQUEST_ERROR_CODE_CONTROL query after EPIPE errors
    on devices with this quirk. EPIPE is returned directly without the
    follow-up query that would amplify the failure.

The UVC control path is serialized by ctrl_mutex, so last_ctrl_set_jiffies
does not require additional locking.

Cc: stable@vger.kernel.org
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_video.c | 32 +++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051..9f402f55e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -75,8 +75,30 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	u8 error;
 	u8 tmp;
 
+	/*
+	 * Rate-limit SET_CUR operations for devices with fragile firmware.
+	 * The Razer Kiyo Pro locks up under sustained rapid SET_CUR
+	 * transfers (hundreds without delay), crashing the xHCI controller.
+	 */
+	if (query == UVC_SET_CUR &&
+	    (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)) {
+		unsigned long min_interval = msecs_to_jiffies(50);
+
+		if (dev->last_ctrl_set_jiffies &&
+		    time_before(jiffies,
+				dev->last_ctrl_set_jiffies + min_interval)) {
+			unsigned long elapsed = dev->last_ctrl_set_jiffies +
+						min_interval - jiffies;
+			msleep(jiffies_to_msecs(elapsed));
+		}
+	}
+
 	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
 				UVC_CTRL_CONTROL_TIMEOUT);
+
+	if (query == UVC_SET_CUR &&
+	    (dev->quirks & UVC_QUIRK_CTRL_THROTTLE))
+		dev->last_ctrl_set_jiffies = jiffies;
 	if (likely(ret == size))
 		return 0;
 
@@ -108,6 +130,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 		return ret < 0 ? ret : -EPIPE;
 	}
 
+	/*
+	 * Skip the error code query for devices that crash under load.
+	 * The standard error-code query (GET_CUR on
+	 * UVC_VC_REQUEST_ERROR_CODE_CONTROL) sends a second USB transfer to
+	 * a device that is already stalling, which can amplify the failure
+	 * into a full firmware lockup and xHCI controller death.
+	 */
+	if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)
+		return -EPIPE;
+
 	/* Reuse data[0] to request the error code. */
 	tmp = *(u8 *)data;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8480d65ec..cafc71457 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTRL_THROTTLE		0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -579,6 +580,8 @@ struct uvc_device {
 	struct usb_interface *intf;
 	unsigned long warnings;
 	u32 quirks;
+	/* Control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
+	unsigned long last_ctrl_set_jiffies;
 	int intfnum;
 	char name[32];
 
-- 
2.43.0


