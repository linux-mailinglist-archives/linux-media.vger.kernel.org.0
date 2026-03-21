Return-Path: <linux-media+bounces-56617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M9TK9Udv2mavAMAu9opvQ
	(envelope-from <linux-media+bounces-56617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 23:38:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F04D2E7809
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 23:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 908593024A43
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 22:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46703282F0B;
	Sat, 21 Mar 2026 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="XZynOk/V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D9F30EF95
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 22:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132653; cv=none; b=TDyXcU8tsNEJUGoV2Bk9R2h+SrYrZO2fWvYTlocK7rI1rqQncYR2BaW6FCus91iRL5sTQtYmRDCKRMVPhT7ySk8bcOM55jgNS+JpuWSc1Shbw7x4KXThqVy7V/zTeLtXAgBPE353m/YD7ZQTNQc4QRGrYCIIfCj8s1fX3n8yf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132653; c=relaxed/simple;
	bh=7IHtt0bHtOoT2OwHL4j5i0D+SO5E1AUXMngs2CC9BPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Efunrp6d1f+BmwR0lXBhxCVuWHTA7qRj3rOt7DljpI4Jl5KXPiNEVbmr8OBI4yssac5RlIgVKICVC/q9bJ08FtVorPRpFPkmWotSV6Cfcq8uKJSuGRphXgBhkjzW8izNc65AZvrrA0d9xH5sWmpts3f31s9WYKqLP9e9BVqlLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=XZynOk/V; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3975150eec.0
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 15:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774132650; x=1774737450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRfGqacrMRAXYbVaWR2MP4IQGMvveT6zknTh/8p4x9U=;
        b=XZynOk/V8l5ZT8nuoAuMMY79ewIqd1w2geVHHEZm5MEaBATCBkmVj8KDPcocwSZbDx
         oOK7fMyro/f9AwRkOFYfg11D4awV/KWcyvCGD8XGvY0dH6rFrlD6obEubeRxsvflVMKU
         XyKdJ4HCnEkr7OTh59xla0unndBxnH8EvTcvck6P4CIQh60At2iBGSl6YmeCuq95Kq6P
         p7BaS3nFVzw+bnncTNHVyf4lDVIKbW+VkCCa/iGnR0CY1OLpgzq2TCfg9s87Ea1GJbW8
         fLxYtYxyzVunmBihCxkAMj+WhG/24NTW0MlfUCgkftQP1HsD8N4TnCc7e9EICzWkxh1e
         dEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774132650; x=1774737450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRfGqacrMRAXYbVaWR2MP4IQGMvveT6zknTh/8p4x9U=;
        b=FU/S7ER2DnRudS9/pv8TqfPfSIiGv4dVDOw15O6QX9IQfUxGlgMlYjqrYjWZ7V7yW9
         MBQg37fmlcorrWTZlZX/hj7e7QZB6ZGqQoDqcytrdScd71Ba7wKaGeMh/9pklJ8ByhY/
         kp7oes9hgJQiNuv1O+DcSvB+0uToC1y4uET0Fi0PmA0kINFnbKugUCrgEoCvERTVnW8R
         zxtX5p5yy3fGi4jxw/1C5+/JkKlgaAeGg+w3UiYGeOiMCjXYkPnt4IS7C0hxy3pUAhQ5
         6VRgnPr4iLHHhu9/+ZYYyH4BFoTUNgO1nVe6FHRFuJo5Jc48C8XTnXHGEuIWwvlepRAr
         z6zw==
X-Gm-Message-State: AOJu0Yz2l2zqp/ZgcswRW2BwtnnHtuMlNaW1n+rkKQmrRXKAdaEpe9s2
	UAUWvTS9XJvnLsLNWjS8VziB52pfTlg4JpZn22TL/XqVR8Qr5F0fYmND5T/lfnwR2Q==
X-Gm-Gg: ATEYQzza19R6PTI2aDwEja2VdYE1j/OoTmjvElO38NA4r3UEnvQvLOk/jy7NZqAcWwe
	+k1uwOETmC1PQSWxDMBYVG0OoxCeEeflDUIHu1swKA9QlEPSJSq8VbGRr6rVD7IdAZXI3yHaZDD
	bfD7j5JJ/y5yzY5DKMhy/GVfuzanwbhnseZQy2k/VQSnyxcJrk+ttxRfeWK1+OplHZ5/KxUb95W
	0OzfGPLZZFq+JoWUBhRD11SJ5jOxWkwMFLvGMtO6BWpvNHmlbxgZRHECf1wAGymUf4HulFIKvQW
	QBex2xXLybYB5NKw80RB2RVb/DIK3gIrjmXZeNx8C4FFHjibuhqdrFmIQZJ3uFCHN6I2FQYHoNv
	YUB7LUzf1PCt+eJMNqDc4CKtKeVBK/HVUUU4dLYr85dUTfl9ID6ZRpoF5sREVjT0apyAaL2rcjG
	9IEU/GBoDQ
X-Received: by 2002:a05:7300:cb13:b0:2c1:6ee:a171 with SMTP id 5a478bee46e88-2c1097110demr3549034eec.18.1774132650275;
        Sat, 21 Mar 2026 15:37:30 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm7982131eec.2.2026.03.21.15.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:37:29 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI cascade failure
Date: Sat, 21 Mar 2026 15:37:02 -0700
Message-ID: <20260321223713.1219297-1-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56617-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F04D2E7809
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has a
well-documented failure mode that cascades into complete xHCI host
controller death, disconnecting every USB device on the bus — including
keyboards and mice, requiring a hard reboot.

The device has two crash triggers:

  1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails to
     reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR. The
     stalled endpoint triggers an xHCI stop-endpoint timeout, and the
     kernel declares the host controller dead.

  2. Rapid control transfers: ~25 rapid consecutive UVC SET_CUR
     operations overwhelm the firmware. The standard error-code query
     (GET_CUR on UVC_VC_REQUEST_ERROR_CODE_CONTROL) amplifies the
     failure by sending a second transfer to the already-stalling device,
     pushing it into a full lockup and xHCI controller death.

This has been reported as Ubuntu Launchpad Bug #2061177 and affects
multiple kernel versions (tested on 6.5.x through 6.8.x). There are
currently no device-specific quirks for this webcam in either the USB
core quirks table or the UVC driver device table.

This series adds three patches:

Patch 1: USB core — USB_QUIRK_NO_LPM to prevent Link Power Management
  transitions that destabilize the device firmware.

Patch 2: UVC driver — introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  SET_CUR control transfers (50ms minimum interval) and skip the
  error-code query after EPIPE errors on affected devices.

Patch 3: UVC driver — add Razer Kiyo Pro device table entry with
  UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
  UVC_QUIRK_NO_RESET_RESUME to address both crash triggers.

Together, these keep the device in a stable active state, prevent rapid
control transfer crashes, and avoid the power management transitions
that trigger the firmware bug.

Tested on:
  - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
  - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
  - Device: Razer Kiyo Pro (1532:0e05), firmware 8.21
  - Stress test: 50 rounds of rapid UVC control changes, 0 failures

JP Hein (3):
  USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
  media: uvcvideo: add quirks for Razer Kiyo Pro webcam

 drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 33 +++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 drivers/usb/core/quirks.c          |  2 ++
 4 files changed, 54 insertions(+)

