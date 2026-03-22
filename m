Return-Path: <linux-media+bounces-56637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Mu2HetowGlkHgQAu9opvQ
	(envelope-from <linux-media+bounces-56637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:10:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E795E2EAF84
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76EEE3020A6E
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 22:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411C9372EDE;
	Sun, 22 Mar 2026 22:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="lM1NhBj0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8D371D1F
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217396; cv=none; b=lNCiwtL2Uj2eCjk5g5HhVxXUG3GXfHbGKG4uaY6YOXmq3GSSLfz0MaCaiUgTmXAGRR81BEYxTEb/7p4DWq21TYXKfYeSwAo17ALFw4a7lkCaBEF/JcHssjA3v354tzrwg3QibIHw47FkV90QB5ejfB/yGDDABjDY8B7iebr4iUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217396; c=relaxed/simple;
	bh=2hwtz7ko/sn+/2Pn67hEoIQ7ueVgPh9I2hP9YwyrtyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4SHGSsC2S2A5GRIA6ji/aNbVbIwcEXm3KE4lQbe/nUfS2wqx/DY6u7pJIHq8Zn3/MR3fdgMB9sTTAz5scR/fG1GMZsGYsWOPwXo3v5NLZzMugck/4iS1QGjoYfL4XiyCVqMWlWF3EOvxcgEpEHqONYOvqGtDABSSwAtEH+qsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=lM1NhBj0; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-126ea4e9694so5781656c88.1
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217395; x=1774822195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HEksHgroj9vtVfNrNfn3qqblz/mRdSgEMEkB3jZTqc=;
        b=lM1NhBj0jY+aUzAKXL67M4AanLCRPSoc3uIfwWzgCZDOvbD1IEMJSDSu8hh0i9Htci
         TU6XyNz5enb647gQjFT4jgA5t9NlGvuVjJyqYXUQmxdFckMT7gRylq0o7ouoTB/HN67p
         jfrMeCBwaAXRszr6DsoIIDDT7wfu3TalX1L9fHtVZHxM20Nao4NdwWAA1xWE7gJbWxQg
         EBuwFkowSowUi8IjMsJhVojv1QX5ILFqOsfU/7vlkymubF6cscAnmSPrn03XN2wjj7q8
         Po6irP7wNTXk9832yHyq/HD0xnDXi659/gbIo3r7dXdXNZU3DyDs9ICubjkIBT2dQ3NL
         AAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217395; x=1774822195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5HEksHgroj9vtVfNrNfn3qqblz/mRdSgEMEkB3jZTqc=;
        b=FnHSIE6afhtUG6vnVDhjdle8PWMmIb3ph5zqZxB6Y8MFzl/B1obWw/C+DZm2nS5RVs
         QjP8l+Mr6TKLka4Wvt6dvbNvlcq9lGDSTmPXfz5tsACOR5aBE/idxwBlXVoZSS5MGtM8
         SxBVOV0LAC17uyuUofObXWXrvkKWbeo+3++iW+kxpNkoeq9Uukm+Ej0DdLfC0YduCIfA
         3A+3Vx73ZelT2D77Z3Wlx+Gq+YOLzSN0jQkVEs9Ql9YlnvKrv/+YQhYFgIsNfWAzQNuG
         ZyaI7V4sb9Ur8nlXYkvWFf2+64g/ScNjr6MC8BpCn2hXDSayt6+8J8dKBOUyRtwZ5bb5
         Gf+g==
X-Gm-Message-State: AOJu0YxjU5ggE0JCkTrI+GD6wOtQNfqfpHQjHD1jUTR8gHqFfcsxmDov
	4QWUdgh+fTVnoBJXe96nHUIYIdTHNirG3ACaB4x0LNIw0kC4Kb5+Gh/qYHNDogO7fg==
X-Gm-Gg: ATEYQzw6PZZt3K2WbBE4vKdJdUWFGSURzyPow6Xug2lmupaEaRtV4M+YYKgoxgCDUau
	5Kg4rHNFiD4ax59yOUJyfRMNgQyJW4vRd+UsF3MF8fDPOI9yGwF6fuFFMQ+9oOpBFno6cUOUoq5
	3gJrdYXrbzkTdj9s+GyEhGGCZK8Pym1eYEemgOuqzIqYjjvWeAMYrLUewWeZnVIS7zR0ilQ3JlT
	ddr1MLvywqk+I7/YaOk/PBuNeKCW0IesjDPzKIZ2bRQ1azEACMN9f0uGO+SBfzXE621Val4U9kK
	Pa5Mseqk2sOrMuvFBwILyeD6At2GsgekozqOYVqNekFDYJLCuLfWuNqtTycGniBVaNQC7PQ3Eg4
	PPRxRArWyS8h4cyMc+NTRBA5jK/a10ih1kwgyUMPZ5GhReI+ZmT25w5vSbe1C/xJSvQdhyUVtz5
	hZRJW31UeH
X-Received: by 2002:a05:7022:e09:b0:11a:3734:3db3 with SMTP id a92af1059eb24-12a726cfc0bmr5304659c88.32.1774217394533;
        Sun, 22 Mar 2026 15:09:54 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm7707766c88.0.2026.03.22.15.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:09:54 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v3 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
Date: Sun, 22 Mar 2026 15:09:39 -0700
Message-ID: <20260322220940.1462189-3-jp@jphein.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56637-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: E795E2EAF84
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
 drivers/media/usb/uvc/uvc_video.c | 33 +++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -90,5 +90,6 @@
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTRL_THROTTLE		0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -737,5 +738,7 @@ struct uvc_device {
 	unsigned long warnings;
 	u32 quirks;
+	/* Control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
+	unsigned long last_ctrl_set_jiffies;
 	int intfnum;
 	char name[32];
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -71,11 +71,34 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 		u8 intfnum, u8 cs, void *data, u16 size)
 {
 	int ret;
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
+
 	if (likely(ret == size))
 		return 0;
 
@@ -107,8 +130,18 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
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
 
 	ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
 			       UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
--
2.43.0

