Return-Path: <linux-media+bounces-58462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP7jAWNE2GnfaggAu9opvQ
	(envelope-from <linux-media+bounces-58462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:29:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130E3D0CD0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EF9C30182B4
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 00:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBF9282F26;
	Fri, 10 Apr 2026 00:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="SyvSQ3wS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1982777FD
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 00:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775780939; cv=none; b=mBAMhF/fpTRqZudAxgu0QiI3XBQr5KLXT/MVVYaRBZFRcEWZ1ym3F8RQwM0pGmPqJgO49nWVMYjKakEhfNq4rQeGfkQ6m4v/4Jz2FfNp4GotFKFrwRvH/EXFPyZQNfZwZoCjOMjnl/rlkSlyn+PmWr9+GEtlMX5idpIp4NGxpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775780939; c=relaxed/simple;
	bh=g+Ho9TPIAU7OU4cwHp4ajiM2JZiLUFn+3i7h9Q5i8TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKPdlWjDwP0qCPr0sP1VD27BFNbl9EwYOenolzlOsPX1FaxYpW/sLui9J8Nr/Ena/U9tafQlrQXv/va/kyqFDeUQ9WgIiH3B5Yel5ASO4HxI2UaKGdwd5kfeU9iOWZBCRaHiOxpKhfBhM4RqY4wTXOlETCrki4m1g4xEWNLi69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=SyvSQ3wS; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c287eb77fso946741c88.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 17:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775780937; x=1776385737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExPZ1i7TsqpP1k1a7y81/2jsnACkmCMFrpMGIWZLeZU=;
        b=SyvSQ3wSXgdmKanbZRzAngcuD1Q1FQuoYbFnonjP+SjjSAXKMxP1oUBv+EsrqFsYwo
         xazlegIiMcRHT/md53ZlqS9pNAfsDIY6OX5S4uOFcrXmqu3uM2e8ujraD+i9RU+X6zIx
         siLOjSZPa7soKfaB3n2iTP1oL50YA0ye39oR6QFmUFpetUOW9lCIcSvDNPI6J3aSlFYE
         rWSWdQ3m/Egvk36ws1x0LLM1nk4CAQcF9qvRasVuQkI1xDsxnnOxs+hyJCC7otGXDxWW
         tVKi75kMTNtwDZWVo+oF1X5tY73zJeEmoqmAUQbdul9LNo49XScQ/UF2/nxW9hwZkps5
         R0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775780937; x=1776385737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ExPZ1i7TsqpP1k1a7y81/2jsnACkmCMFrpMGIWZLeZU=;
        b=XCblnsLDmzjohYoBNY0fjCThtHzHhq7v6CQNuLurY3OJuuyEqOnCSbgKgCvpLn8k2j
         KimPxlrfHaOzLaayumnbdw7qWTzlVBN2ewiRSDkOsZGNfad3kyMP34Nf9kfcSZv1oFHT
         2QhtqkpFotRawbKBPW8oDac1IcYTE7uO1ewJ3Hx1DbK6HU186qAwfKTkvCao0HsWsd58
         npmZN/zxfsE3WEqAs0JrioRtAyVKeNJ8QEjhvARtgs3qhpR87PI9Lz0mBbK1B4A/mgcC
         XaExZ02BY+PSdwrk+bj5y5OdEZfVzIBl+83UoArWNFdR1soArp2UzP2nhk8VZ8Frq8Kw
         dYng==
X-Gm-Message-State: AOJu0YwsaABtlCzz3YZUuimkPrVtfPtAMyJsfZayDiPCkfVpdrUpQCZX
	33koLvsuFtGLxRHkvuJsCzZgpO6ZAjI7Pv8jDsBEe4nuT2eWLPYVYIMVBT4hfJbrtw==
X-Gm-Gg: AeBDietOPq/d4h8Q1YzBqwsM0sEbLkjHqD2Okd67EaQBOzFA1GKmIeOZQqy+kmv9MK6
	LCAyKkiJ71VIqgsgryBFYoXlM9//PZwr7XxdedH2tCowfAut1cj/O4soaw25pqOSwRmZKEsB6dw
	TvW9quayoCl8JyHBeW1fXD1NlOR4SyhgxCKTiWHRXQgses4I2Ds/OeFrRABYx+tPkMRA+d/IpzD
	4xcvnF9baOiqA44T45BhdvC4kxSs7GxKmJ0TPdDFOkE4koSIhQwG/XHgB+n8Z3NmNJGxP4kNbMv
	mYNK8uKp5yKXFGs5NugAa8yKu+iCEU4dO8ifbKeFCBi+XXnfzVKGIC+EGggXzcQWCw+m4HAhDWN
	2FSHCgdl0vr+o7mb5Vau63oK4lSW9o/Pf6zhAaBv5lyB2wNj8OuGwkVU+ABmOAdeGVvVM18MMRN
	emvLWyX4ey5fn9CeXplYBPwOnN1oYUZkXXKxm8fvCjgmknWvgOwjDL7e3D4VImXTgYqIjDzD36Y
	2mSQL8RpiZrpxdlvEz4uz9qRHE=
X-Received: by 2002:a05:7022:698a:b0:12a:68cc:3efb with SMTP id a92af1059eb24-12c34ebade5mr792608c88.16.1775780936696;
        Thu, 09 Apr 2026 17:28:56 -0700 (PDT)
Received: from katana.dragonfish-mirfak.ts.net ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb162sm1400680c88.11.2026.04.09.17.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 17:28:56 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v7 0/2] media: uvcvideo: Add quirks to prevent Razer Kiyo Pro xHCI cascade failure
Date: Thu,  9 Apr 2026 17:28:29 -0700
Message-ID: <20260410002831.1046407-1-jp@jphein.com>
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
	TAGGED_FROM(0.00)[bounces-58462-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6130E3D0CD0
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

  2. Rapid control transfers: sustained rapid UVC control operations
     (hundreds over several seconds) overwhelm the firmware.

Patch 1 of the original 3-patch series (USB_QUIRK_NO_LPM for 1532:0e05)
has been merged by Greg Kroah-Hartman and backported to stable kernels
6.1, 6.6, 6.12, 6.18, and 6.19.

This v7 series covers the remaining two UVC patches:

Patch 1/2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  all USB control transfers (50ms minimum interval) in __uvc_query_ctrl().

Patch 2/2: UVC driver -- add Razer Kiyo Pro device table entry with
  UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
  UVC_QUIRK_NO_RESET_RESUME.

Changes since v6:
  - Dropped the error-code query skip after EPIPE -- no longer needed
    since the throttle in __uvc_query_ctrl() already rate-limits the
    error-code query path (Ricardo Ribalda)
  - Included full lsusb -vv output in patch 2/2 commit message
    (Ricardo Ribalda)

Changes since v5:
  - Moved throttle from uvc_query_ctrl() to __uvc_query_ctrl() so
    all callers are covered, including uvc_set_video_ctrl() which
    bypasses the higher-level function (Ricardo Ribalda)
  - Throttle now applies to all query types, not just SET_CUR
    (Ricardo Ribalda)

Changes since v4:
  - Dropped stable CC (new quirks, not regression fixes)
  - Updated cover letter with 6.17 test results

Changes since v3:
  - Regenerated patches against media-committers next branch to fix
    context mismatch (v3 was based on Ubuntu 6.8 source)

Tested on:
  - Kernel: 6.17.0-20-generic (Ubuntu 24.04 HWE) and 6.8.0-106-generic
  - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
  - Device: Two Razer Kiyo Pro units (1532:0e05), firmware 1.5.0.1

Stress test, crash evidence, and debug logs:
  https://github.com/jphein/kiyo-xhci-fix

JP Hein (2):
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile USB firmware
  media: uvcvideo: add Razer Kiyo Pro to device info table

 drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 20 ++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 3 files changed, 39 insertions(+)

-- 
2.43.0


