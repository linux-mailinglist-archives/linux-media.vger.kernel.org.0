Return-Path: <linux-media+bounces-56635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB91IrNowGlkHgQAu9opvQ
	(envelope-from <linux-media+bounces-56635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:09:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F82EAF40
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C99E23002F6E
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 22:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B42737DEB9;
	Sun, 22 Mar 2026 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="gdNOrHad"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9614AC8CE
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217389; cv=none; b=fW0xwuwZUbQzPTT1ERsDUoaE6sVNpBcjdHiQTDqompu7bdIYIJLI6vkEoyRhUJ5SU77n54r4V7eVoEU+iYrqq03El8J0D/lZ7/oXHl+d6kA53K6l7Q0zSOtt8CW98szgQd4/XEnadu/X6M+AstmMSULwufNMnwn+koMZIfBYwBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217389; c=relaxed/simple;
	bh=C+AbGO+IXiAylnzIXV7KY8aH2ceP+5Q/0HArBOMbwhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCDN+LCcIrCDwpfXkfTnmY9k6XQcqugPY6wFCXKiciqPgQEZ5xbBqGiqFpzTPkNnBbwwDnmgD2twFgVq+m/UJYmSESwaYnv23jEBey6oXTqfpPwsaWUEyLdWWn5kJgpeDTlksy35L1sWFFgWwLuf9QKDUn6lY8S//Lf51FvY7b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=gdNOrHad; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12a693cdf29so2601719c88.0
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 15:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217387; x=1774822187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiiQQ0nYA7Fu3VA4AXEfqp4dM8kdCa/UiUZIcb5KPa4=;
        b=gdNOrHadXKfyHbpaGzaxn3KF/3INj8H6mt7V7TIF05awTRMnFlugX+4lgpg/B39CPW
         4Np5XV6yU2DsEPbaocd3sDaSRI+xHZCOrwPEgM7SUju2dyM3LzuJLIx1a9hbzsfe6rjc
         pKn9hbbBfR0NCYgItS6FG+HCuPcGPI6eooi3NM/nhRmkxia68vfHH6hRBoMidxn+/OCn
         ub+48bEP8rYV+NsZ5jV0MH/A4IeNfVEXP1iC81kU4JaLf/531GVWQbm/jQG6SenwanV2
         hWsOGA5YQF8MZ7n2mhf2tvF+W1hSDldlEWkDMZEyJswIPWq+Bokc+HWsMwjsXTLVvXQf
         SOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217387; x=1774822187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiiQQ0nYA7Fu3VA4AXEfqp4dM8kdCa/UiUZIcb5KPa4=;
        b=kpVKtbYA/5uXQczdnzeTAd0LuYHiyP6iuTspKkjgD5x8CQsDsXc4g7+pbleUrwLQ/0
         2Urg6wSd2lQgNp2yMXOfNVsw1djAP+SThiwBBOhdt7i9+2J7UYnsqtWJQ/1DiKojgT/j
         jDJENP0QTuu429KwHUU8w5/qDyVpA3z5KlCaG5ziUAZGgrMiz/qbffzgqWgmEkYN3pGO
         XGjT9les0Jz1nQqsrLZ9ZJPhZf70srvBLoEnUL4Quvu5ZB/ldRSNQOaLQII2BTogA/+E
         zhzLxapDVezxPm0GPT5/hsEFhyI13t0VDH3eDSS03aoCKnPNKl18fZDUzTJNcY1R2Nq7
         SGjA==
X-Gm-Message-State: AOJu0Yy87eUcoPi8oq5MUaqBs4U3qjrjZmn+lPIRpes2zw+ugPSaZTKH
	E1l8/uJz/HI51mty7iqJ6VT+El2rsUJG7mT2AQCZlpbtkIGkjbkJI/gguDeW2Kdl8tlHWtDUq5w
	4CsA=
X-Gm-Gg: ATEYQzxJYMV/Fz4mlnV8v5uLYMUtujzuK1GofIsVFKs03GbFVT2knUm6j3s3tvLPvuq
	bU3NkTF/ZjSQx/OfimnreMadieMbys0+lASuPdub7dpR56BtgvHQ4KB84JDh1adxHHYOcq57OAL
	D5cQNcZ8ev+wN2jPssigJvSJQi9H75RMA+lRmvCeEP7Or+RZc/tACD7zpRIj0U7C4suhMZDM97f
	AMCkk2SHBn70jp5PNpjohbCzTT+8oeIHELtSE6KpNH3NRj6FV/LPXuSDyQJueXn2JhkDycbHVJ8
	q6YYxWqkJh0eUnkYZpnL94lRWqn3cnBQ0mPpXdbL2LJN0Xp59iBVcuuBgjcwc6gs63y22A31OqQ
	jd0JdKB0FDxnwijo4E9chc4by9E1RB923i0iQDACfhh/p5NNReEt72I2+dBc2NWvlwq/xtY62oK
	SgqMqETn9Y
X-Received: by 2002:a05:7022:6894:b0:128:cdb7:76e1 with SMTP id a92af1059eb24-12a72326a69mr3580238c88.13.1774217386408;
        Sun, 22 Mar 2026 15:09:46 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm7707766c88.0.2026.03.22.15.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:09:45 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v3 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI cascade failure
Date: Sun, 22 Mar 2026 15:09:37 -0700
Message-ID: <20260322220940.1462189-1-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56635-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 955F82EAF40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has a
well-documented failure mode that cascades into complete xHCI host
controller death, disconnecting every USB device on the bus -- including
keyboards and mice, requiring a hard reboot.

The device has two crash triggers:

  1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails to
     reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR. The
     stalled endpoint triggers an xHCI stop-endpoint timeout, and the
     kernel declares the host controller dead.

  2. Rapid control transfers: sustained rapid UVC SET_CUR operations
     (hundreds over several seconds) overwhelm the firmware. The error-code query
     (GET_CUR on UVC_VC_REQUEST_ERROR_CODE_CONTROL) amplifies the
     failure by sending a second transfer to the already-stalling device,
     pushing it into a full lockup and xHCI controller death.

This has been reported as Ubuntu Launchpad Bug #2061177, with reports
across kernel versions 6.5 through 6.8. There are
currently no device-specific quirks for this webcam in either the USB
core quirks table or the UVC driver device table.

This series adds three patches:

Patch 1: USB core -- USB_QUIRK_NO_LPM to prevent Link Power Management
  transitions that destabilize the device firmware.

Patch 2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  SET_CUR control transfers (50ms minimum interval) and skip the
  error-code query after EPIPE errors on affected devices.

Patch 3: UVC driver -- add Razer Kiyo Pro device table entry with
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

Stress test and crash evidence: https://github.com/jphein/kiyo-xhci-fix

JP Hein (3):
  USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
  media: uvcvideo: add quirks for Razer Kiyo Pro webcam

 drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 33 +++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 drivers/usb/core/quirks.c          |  2 ++
 4 files changed, 55 insertions(+)

