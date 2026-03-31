Return-Path: <linux-media+bounces-57694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N8dCsMYy2lrDwYAu9opvQ
	(envelope-from <linux-media+bounces-57694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:43:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84095362CAB
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8907730C1DB6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026A0282F06;
	Tue, 31 Mar 2026 00:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="R+qyK77g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB942BE05F
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917494; cv=none; b=cA+Fdkh3jMbWr2DMHM3JhvCodIf+gig3TFnTF1JOJxBfRIEHVfuVczFItMMMRdLiWwxdMtl7w0UmOd+szDVHtDHKh210BQAib+AdFcDOcJZq8XtgDhz5ISEJzhswazy7UB6U3YITMlaL1AqN+IsRkgUoZBsoV7XZdFFZeEFybOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917494; c=relaxed/simple;
	bh=I/Eif1ZRTDEQrnMNfjbO5VHLbe1G0lSEoJ2HP69/lqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0gwI//sWHbWBHiKPABsUiJIJC5OMct3TnJhBKYdfMd8oO2krGjSU50nFFhpkpN3zCoFJV+VMMl/rLA3YLryEMWpUm1SmhwgPRQe0QHax0siDAj7xnQUlUuUiimkxzsYGk5bxWBWXU+Jc8UtvMgi4vsZxZqjYuCcey97ADfKEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=R+qyK77g; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12776bebe9fso2058447c88.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 17:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774917492; x=1775522292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDFymdpKeXfGYj2x1HV3pjSU2EJtPwV7qvFYD8NzPH0=;
        b=R+qyK77geQ2gbFIKiUkXOILkT3qEvYDYid5CXTKI7g0DeDhiohTbaPn8Qm2IUu+rSy
         XdHRB1q/k7otYUyWAu3GWWx4EfcmtGZsy59XMfV/kLcZs4snPDK2jqzEO/W4c0vczwSk
         zRQLp1/w3yI8jv8GeRC3kjfjvIaJC4zIe3xLQVfr1F5tNMYrrUQdtdkB2BWfUZdqPo6t
         PRkPi+Jj8d0+0kILnYAgTrQ7i1/0cxsk7/yE2lcs9k3Z22cN2SnwE4EAk1P/rrorvuZH
         GTs+0IyF+1IZBvz724lfzQKKulyI97l+NT3UXIGlu+/p1QO74uVe3N0JkB2ckEME7FPr
         QwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917492; x=1775522292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EDFymdpKeXfGYj2x1HV3pjSU2EJtPwV7qvFYD8NzPH0=;
        b=Zf8gHXxClnyRE8HkrY0rfN/gJzPVxzmVLF2VXrGZl64LDZ0L7RpillsxoPkaPlHuWr
         rmr+L/ChcC8BP+N9RtjxTr5XDlC6O8NZcW+DySc9ld4ZiLYM8K0wRukNDPNh4Yrfcgih
         q6Qc/Ec4wPS/V4rNi+3cyL9P4+O1TYR8TsdktP5aRFOmRn8pdYTZ3LgBcMEk4lEdcBWZ
         LTWOkroPtmFz4JLiYZtCcQMFL/hp2qJL9ZHxQqimWZtXnEoKi/kxz8AzoSQhLrIIZnLE
         4krgXKbZfgneXCE7rIgDKgYEXCd9O8J4mLuq2C+tgUDlGhIaz+oB7LEIYGjDokBiuhmZ
         G4vw==
X-Gm-Message-State: AOJu0YxKsB25XvBYPUoMsBrZI5Pa+yaszNz9XzIDq4h4HlwrM3ZMm6P5
	aSnDHOJKzYtir/toRGzM3bCoBiaLwAH0fGd3UXjR+3Xu6FjtIYhaa5/uUKOgbrJf7GJQXVphvkL
	2++A=
X-Gm-Gg: ATEYQzxWrs0g1IH5tR1NcLvrvMtWZJEw6FFJojOfG6FpGLcJ3PTgR0CJqlWpSM/zUvA
	pTmh1FXMcFDPN0cGoUoI+pI2E85ACnVjqMsON6uRFkv4SFSsL8cQXHAP7IW2B+PBf7ho5i4ksyo
	xA/+mkjpG7jaQaI5GwfdZVE2L24hho8V2777L11Vv2HpNt/qtgcwUeR0vm0203slRpNfqJgx2RO
	LvE81kV9Cy2W1821C3RIKJCRHHQoxTHegCNrYR9o6PZSBJfIftxUewOb/x5H37dOxJaXr7YwhAs
	qFK/tTx5tjRZoKzmuOuNEzRzzP6e57Z1ZJ16DuIB9dXSFScgPVnck+SIFfR0WkbrfYOZAojIJNr
	xQ54vmLv9W9AW6liyeIBDKzuSKKxGKWxJT1PfSybjcp519t3Lri6dlIe5C8iWZC/dxhGEADiXXX
	h5W75Ymlufag==
X-Received: by 2002:a05:7022:4589:b0:127:1492:e370 with SMTP id a92af1059eb24-12ab284c058mr8507096c88.5.1774917492054;
        Mon, 30 Mar 2026 17:38:12 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm9343057c88.12.2026.03.30.17.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:38:11 -0700 (PDT)
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
Subject: [PATCH v5 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
Date: Mon, 30 Mar 2026 17:38:06 -0700
Message-ID: <20260331003806.212565-4-jp@jphein.com>
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
	TAGGED_FROM(0.00)[bounces-57694-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 84095362CAB
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
index b0ca81d92..e8b4de942 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2920,6 +2920,23 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+
+	/*
+	 * Razer Kiyo Pro -- firmware crashes under rapid control transfers
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


