Return-Path: <linux-media+bounces-56625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPwqLjtlv2lJ4QMAu9opvQ
	(envelope-from <linux-media+bounces-56625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 04:42:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B82E826C
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 04:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51B723021EB2
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 03:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDFC37FF4A;
	Sun, 22 Mar 2026 03:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="Uy7gR8Ew"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C737F8B9
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 03:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774150913; cv=none; b=aQ97yHBD5TJQQqmiHaGIpSp+j1+0OvTfKyXC9Sy9QZ2BnaURZHHMN88gY9IbaSowRnMF6gJrvfrqC1s5TbSo45WszyAcpMhIZJRmUTueJ5ftbQ269eu3UhcxIjlaP1KdUnAJ43SaR2lw0uY4UL8PtjglonSayCLRR4hY8TXYkHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774150913; c=relaxed/simple;
	bh=f40iPRYm5U2gOyJUY6EAVOFQmR5PmoEAY+zzqQV2+M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0ru2RJmr+ZDv/Z2+MJOXeqPzh5x9sHlDna1dPbxjhGCpUa0wL0IF3RTkh/j9f/pl49y5QqK2MO+btQHxZSQxCIGFkh1aVXMYUemFMHNEATdoCNkfEjAaRKYqy4JOcyeVF3SiNVjrqmBSsXWIKN9xiEVmr7/twMkpZZ9tWXXykw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=Uy7gR8Ew; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3533522eec.0
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 20:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774150911; x=1774755711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN721lRtWmbi9bOhPWGdYKhIZ/wWA3W0RLJU7AVYzQs=;
        b=Uy7gR8EwefPT62ZHjwl3TFLDTRueGmLqEcML2pajNVhRi5vASbOPq/Uzfk4BtSkT7L
         YjX4FKHPWEQpHBdnp+Ap8EI6lFgjN7LMO4FT3LspUVhaPszz0d4ML4wYIj1iYwOph9mf
         PmfRYj6RJvH9PTaDG10pD6lIH0Zc2xfLWHxfrNUJC2a03sdhP3jvhb7hH2LqOYwDb9Rk
         iOvEvaV140ZouBEEfK/Yt/wCg5STpkiur+oIxJvH752ah3thCdUTZpSqxFMLQYs7WEzp
         uB/ubM2evrkUZSpzvRdUSvEWLYVx4Y7xWEk+M1Jqrstir5BUwSrdq9hPXSupyxWFlCJM
         OvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774150911; x=1774755711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QN721lRtWmbi9bOhPWGdYKhIZ/wWA3W0RLJU7AVYzQs=;
        b=DF+O/zxm80eMn9hbU3wpDKH9N7k4FmkSec0AqJ89wgQuJKhovBhMTzTO1r9TXkEVlh
         MipMOyOvo/SKm8vtARdzK0Z193C3jer5PSot+8Qab/tx3Wwtdma7L0IwG9y0FRnacOXB
         sl+LFoFvxkkmkwQY3meRsIuH1PkoNExm/9SDlRSf/tULKgIyPcpBK45wYoKR12Rcjj4T
         sEulHpGbT1cch33CS6mfePwK0kCLHY5iPOhNoPFE6UahV05/CnxlEcukLlehRQnxKwAJ
         VGJIfjv3g3Gwe2mySe+pbNLTmrLCvYKy/8+m7OgBq76pVlAjqdV0LGAp00fPiHhx4bN2
         e2WQ==
X-Gm-Message-State: AOJu0YwGUKyrhd1ELUWIRHDA/vvw9Bga58s7hORYJLu8QpG7HlxbomRZ
	nJ7jbAvCRhFE1utl2czbEhfnowXpR6OGob/6ixnduqVH2ciR6o0vF/UV9aFEWotUcA==
X-Gm-Gg: ATEYQzwaiRCEDX+1umeWGpVg+SN+sCjuENGPeroiYPGf/tybEPHCQKnXCBnKvpBAwsU
	JslQY2sb101o5Vr5G/HJZz1gKQlMQcNKn9yY99xhabAWPIVCuqkGlVtgsnKuHQmk0k03pW5txbE
	0DShW3JrLaIDCFcAXZQbGvFo0DMQzxGHD7DXXPxknnu2AddJ3HzoSVbiWAITdk0SIGETEMCbybo
	KLyVW8C68ubBCJPF28pgYYEWsAS7iYjMLaGx3BV6/asOppLWv+811OJF+xpm38vxzWtUHRyxVqj
	Th5mL3ZU2NOL+63xzk4fcgumXUNNwkWhmrScQt6+HUyRyAFg6i2pq9kDk5tNfUVK3hGgyHc+k6L
	gft/wrOPuojAXfSI4M6yHN2JqVj1L4gTvel2K47CBVfN756q3/6b7jB1j0zORR0oJDavhDXFLj5
	FBii17GWnG
X-Received: by 2002:a05:7300:6dac:b0:2ba:6854:8d4d with SMTP id 5a478bee46e88-2c109752e05mr3936274eec.20.1774150911255;
        Sat, 21 Mar 2026 20:41:51 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm8989451eec.12.2026.03.21.20.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:41:50 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
Date: Sat, 21 Mar 2026 20:40:14 -0700
Message-ID: <20260322034015.3629056-5-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322034015.3629056-1-jp@jphein.com>
References: <20260322034015.3629056-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56625-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,launchpad.net:url,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: 5D2B82E826C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
two failure modes that cascade into full xHCI host controller death,
disconnecting every USB device on the bus:

  1. LPM/autosuspend resume: the device fails to reinitialize its UVC
     endpoints on resume, producing EPIPE on SET_CUR. The stalled
     endpoint triggers an xHCI stop-endpoint timeout.

  2. Rapid control transfers: sustained rapid SET_CUR operations
     (hundreds over several seconds) overwhelm the firmware.

Add the device to the UVC driver table with:

  - UVC_QUIRK_CTRL_THROTTLE: rate-limit SET_CUR (50ms interval) and
    skip error-code queries after EPIPE to prevent crash trigger #2.

  - UVC_QUIRK_DISABLE_AUTOSUSPEND: prevent USB autosuspend transitions
    that trigger crash #1. Same approach as Insta360 Link.

  - UVC_QUIRK_NO_RESET_RESUME: avoid the fragile reset-during-resume
    path. Same approach as Logitech Rally Bar.

Cc: stable@vger.kernel.org
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2920,5 +2920,22 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+
+	/*
+	 * Razer Kiyo Pro — firmware crashes under rapid control transfers
+	 * and on LPM/autosuspend resume, cascading into xHCI controller
+	 * death that disconnects all USB devices on the bus.
+	 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1532,
+	  .idProduct		= 0x0e05,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROTTLE
+					| UVC_QUIRK_DISABLE_AUTOSUSPEND
+					| UVC_QUIRK_NO_RESET_RESUME) },
+
 	/* Kurokesu C1 PRO */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
--
2.43.0

