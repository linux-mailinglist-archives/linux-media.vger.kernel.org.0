Return-Path: <linux-media+bounces-56684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIpgGEoOwWk7QQQAu9opvQ
	(envelope-from <linux-media+bounces-56684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:56:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5A2EF786
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C52230041F4
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FB63876DD;
	Mon, 23 Mar 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZJE3bvY7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA973876C0
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259781; cv=none; b=iF1Fq5X3nN/ZymzTrO+xaKnQt3CstTRr/asvAUQ+GL3Jkch1nQBPVpS93MHZcc5tbV159SB74J929WknO5h76RtHRY5WvMeXRu0M4UywRaCJkv7Hj3yDqWhbImZ37HvNM63zwGRH8Kkypk4x0ZeBZkt1VC28QUOJQovFdKOT3Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259781; c=relaxed/simple;
	bh=3/Rg/BX2DfUy3s37k/M8yXA5dRTcBuREAmBzZiqXRP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slL2KC4Umfoi57ufuCtWfOp7Y/PFnhR5UyscVU5DzUqgLzoBU/YighMb75sfMzH+BoHty+6Xqj8LwtA5KIWPFU5f95BAihqKPlOXMR8jMcSHKV4QmGdL9Uniry10r7yxf2CU5arpGeVu3PaI4YWlbmbXfGuT1Qg9m+ZYmQOgfDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZJE3bvY7; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so3942019e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774259778; x=1774864578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU5I+1pCOUAYiUlxW8VCH/e+rD3CTOAJqq49cAprQ0w=;
        b=ZJE3bvY7YrXHM5/1Pn73t62Oo3gY+YSULw66URaW+Z07JcPz1dHX7z7ntYf+REYEVq
         sGrIueE2k87Os0kOsySq3mZXOMl7M0tTlvScW6wV8jTIQsZjG9Zu4IsVfOjAHzsTeLL4
         YnQ2nivbITmtmr5vl7GnpdwiSkQ+fZ9kgMU+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259778; x=1774864578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bU5I+1pCOUAYiUlxW8VCH/e+rD3CTOAJqq49cAprQ0w=;
        b=LMKbYBllinKRNSuRo6CIU0tfevYuXAj/UI7RLRS08PBcYncR4QFdOr4k55v8aHnYNl
         rhmTPIhBJ1QKDc+75P8sHDyvt7fmuwkbhYklFjpwzQhPfUGDLFg4EGBMW9XpE4GryFMv
         HhyfAJ/MOZD35UO49ezn74+yzyljrSpgeScpRneoLlvq+3goOTQkxxD5wBsDwt0wxtPt
         D8076xQMueOwvLEtVtx+GYIsz6/iLJnbkhyo2PbpFCQY0KO46P36Rmtm1EHIuQDSPywT
         Br4XijxtGoTWpYoMK64puZH6Z9/O9fDSdDHL0HPwXpPtISsq7rlSN4TyqmGw3pzSAJqE
         q2cA==
X-Forwarded-Encrypted: i=1; AJvYcCWsKbTz3qIvY1Lf1GlsNT2JffrLnF7VtZqQqiqRLqAahpO2m6Ut73HB8RC4oe9uWyN1FEZb4xE3VEvDiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX5cGosA4jUhloxxBzqamI2tXLkaC5pc++fZl1RZSl97M4bJwd
	8KbMiusAv3AqHWsYSiZ3XLXflrZaglhiHh6AfimkV+NmCU/6OeEVueMLbTAxtfAMYWnsmLI4SnO
	IAb2npw==
X-Gm-Gg: ATEYQzzL7+JZZoZieqtMbQQRkgDLml/1UtXj4UYknNtvUx5xDLTqd1LhQ1ieoCGR0gC
	HqpB3Gb45iuEC3toY32oFcCBjQb5NxkL62QxsOlj2WNhftXnqfkejB+RoVx9uO8aPd2cmaa6syh
	A+pbh3NFNstBlUL2QR1yZtzyPxn0bobnsFLBSVckol+vDxXX825NDCJl7kYubdWt6xNv5jyo7/W
	nnVdbe4+vd7FaYNz81hmx0aJpnEP2TzG3XLRQ9br7EenqTSE3EKbyf1YA5K+pVjW4/YUp182/6A
	fqsbOF+0WdCOxoa+x+ckUwFuDjeGa6zg82Dhcp4Q6Ay9fCN/P2TF0iiX3wP4r8CY0kT3rUYJDm9
	JOXyhayGbBzMO4cz/uYgdZXrYz7Ow39nvZXllZFj9P5nLEcW9f00pznJ8IiS74fkxIsGYWl/JzC
	Zz9fm1/b74qNx7ZjMA0C29NKB31DeoZWvKBu8HUIFoPT0YI88tSmxYRo9gK0Dy
X-Received: by 2002:a05:6512:39ce:b0:5a0:c5af:c3ca with SMTP id 2adb3069b0e04-5a285af729emr3613364e87.17.1774259777696;
        Mon, 23 Mar 2026 02:56:17 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae5c8sm2524511e87.37.2026.03.23.02.56.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:56:16 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b979d16dd0cso576851966b.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:56:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkEAM/pTI1scIKTM2KWQqRQVpDD0KCcrBX05ETAFI9lUN7hi6T2ZohSMaDrt2F36qMfJM0xAHjonLdxA==@vger.kernel.org
X-Received: by 2002:a17:906:a895:b0:b97:8503:8313 with SMTP id
 a640c23a62f3a-b982f30378emr724881766b.27.1774259773686; Mon, 23 Mar 2026
 02:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321223713.1219297-1-jp@jphein.com>
In-Reply-To: <20260321223713.1219297-1-jp@jphein.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 10:56:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCsZf0QWzCQdgFC=hj+V4ChCynwjRNAz6u-F3Y8vzZXXDw@mail.gmail.com>
X-Gm-Features: AaiRm51pgrzPjR2hqfRCdAFfdxEd-_k1LaQPVJwPrlN7jYDCE9YsC62lPeYFY_o
Message-ID: <CANiDSCsZf0QWzCQdgFC=hj+V4ChCynwjRNAz6u-F3Y8vzZXXDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56684-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,jphein.com:email]
X-Rspamd-Queue-Id: 49B5A2EF786
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi JP

On Sat, 21 Mar 2026 at 23:38, JP Hein <jp@jphein.com> wrote:
>
> The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has a
> well-documented failure mode that cascades into complete xHCI host
> controller death, disconnecting every USB device on the bus =E2=80=94 inc=
luding
> keyboards and mice, requiring a hard reboot.

Have you tried reaching out to Razer in case they have a new firmware
that fixes your issues?

>
> The device has two crash triggers:
>
>   1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails to
>      reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR. The
>      stalled endpoint triggers an xHCI stop-endpoint timeout, and the
>      kernel declares the host controller dead.
>
>   2. Rapid control transfers: ~25 rapid consecutive UVC SET_CUR
>      operations overwhelm the firmware. The standard error-code query
>      (GET_CUR on UVC_VC_REQUEST_ERROR_CODE_CONTROL) amplifies the
>      failure by sending a second transfer to the already-stalling device,
>      pushing it into a full lockup and xHCI controller death.
>
> This has been reported as Ubuntu Launchpad Bug #2061177 and affects
> multiple kernel versions (tested on 6.5.x through 6.8.x). There are
> currently no device-specific quirks for this webcam in either the USB
> core quirks table or the UVC driver device table.
>
> This series adds three patches:
>
> Patch 1: USB core =E2=80=94 USB_QUIRK_NO_LPM to prevent Link Power Manage=
ment
>   transitions that destabilize the device firmware.
>
> Patch 2: UVC driver =E2=80=94 introduce UVC_QUIRK_CTRL_THROTTLE to rate-l=
imit
>   SET_CUR control transfers (50ms minimum interval) and skip the
>   error-code query after EPIPE errors on affected devices.
>
> Patch 3: UVC driver =E2=80=94 add Razer Kiyo Pro device table entry with
>   UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
>   UVC_QUIRK_NO_RESET_RESUME to address both crash triggers.
>
> Together, these keep the device in a stable active state, prevent rapid
> control transfer crashes, and avoid the power management transitions
> that trigger the firmware bug.
>
> Tested on:
>   - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
>   - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
>   - Device: Razer Kiyo Pro (1532:0e05), firmware 8.21
>   - Stress test: 50 rounds of rapid UVC control changes, 0 failures
>
> JP Hein (3):
>   USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
>   media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
>   media: uvcvideo: add quirks for Razer Kiyo Pro webcam
>
>  drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 33 ++++++++++++++++++++++++++++++++=
+
>  drivers/media/usb/uvc/uvcvideo.h   |  3 +++
>  drivers/usb/core/quirks.c          |  2 ++
>  4 files changed, 54 insertions(+)
>


--=20
Ricardo Ribalda

