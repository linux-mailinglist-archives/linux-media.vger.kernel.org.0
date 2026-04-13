Return-Path: <linux-media+bounces-58688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD7EEjBW3WkFcQkAu9opvQ
	(envelope-from <linux-media+bounces-58688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:46:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5B53F3338
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C5D7308FD21
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 20:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199F5395243;
	Mon, 13 Apr 2026 20:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQqzVKc0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDC9393DDA
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776112845; cv=none; b=llGcNbpXlqMqhCcGS/DKXARlAxefLGfKNHx2y1zN5N0F4brtaYCXKrJydh8SxWPcCKCkYbwqyjJ8rqsMYOdTuUoxbNECYYLsnHfwCDZvb/gbZcdPCS8u4oDnZHbR30dzOpujX5tkZPxEAAxP8dWfTWu0amm0lPNDLPrUpHkTdU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776112845; c=relaxed/simple;
	bh=R3kn1jILB660u5Pxb1ERxXiYL0nF6pdPiO1AeCh0R1w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K062xyMap/M9pWal3K+4C4jWizIfea4/pS7eTaql3IKJ5wI3jYMkr0NPaQ7BzsAgaFwmpiUZ2Lvsv2hyIQ0Yti+woMaK9fjDRDG0nK5xI4BB/4LcHqE1RQxK9NfcnmiIrCchz1tt1AAoK5DrjGtzqm5tMvXDQ+zt8ETz6O2lQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQqzVKc0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so34658665e9.3
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 13:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776112843; x=1776717643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHse7VJY5zHeWLFBiB9crv5GdzNEc2krImA0dhR/Srg=;
        b=kQqzVKc0V30ahS7XYK6UNMpfvf3vVLfeNoHdhpzI5QVIX0dIGOCkBSueI1FoV49tAi
         2GfBBz+qS1cFrU/+ILhmZWg3laB/gPHqZmYCHm6WlmIrBe8qK8TQ/geTEpUGRN912R6I
         3y1jgbIlJkOfZf3sDweaqCUyMOVbN5POhLm22fg1S/ar7xdr3ol2AXv3FNyonpxAtVOx
         qW4C1RSgWIsNcBaXpdYI8bb+GLAA7JClJmaSGl6wwldYOCwGUUsoxVjsq7bgKIr7MPNs
         pqiaLnmnN/hufYn9Iom98wAZ84RMIGFAVIHyIEuQXmKHa9K0fB9AKswBUtFyetR13P7M
         PUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776112843; x=1776717643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHse7VJY5zHeWLFBiB9crv5GdzNEc2krImA0dhR/Srg=;
        b=IQO+goDMui6085S6jNlu3DaxCC6mnh8sBW9jiKJB+dBDwU27EsoAu7CgLED6bZ3AJ1
         d7rZv/KSoM45nkMpDAVFtHHD/yZNL41RVfMRP4XUrlfi0vYqt5UdhsnzTJT6R/LPjTJb
         acxAMbq45h5ybBnNuEUaei0bxrAJedoiAbmm3fU0JF8NUhW+hXv3ycR+3o+V+eQcYzBp
         QuAnlVQ+wyVQvDMD2/f6M44HMYZZFiw060KJVGDb0cz0h4hezCkYTMt3SRRorofywS6S
         qJmBodHrKdAxonpkD6Y2Pck2lk7e27sf8n8y5zSiKp251F+/VkG8BZPCar9Ti93KFVkR
         TH4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9/ltNabXpKIszkadFafwd2KxiO+9KtUdGTChScQ315mMpDQk3bTbRVg5hk6r3qPFeaMq4eStmhhdhiRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/YRojj2/1TOsCjIlLLw+R9magnBgGmV1JF7eLLzoQCpMzybcF
	F40k4+++Hk2vW5UhHdpsD21QrGPtkhMKySZSWhbaLeoWy8DIRn/xtg4k
X-Gm-Gg: AeBDieupJYv0WlRf/SfL/z64kPgBdlY44w41wcnRmFw6ce6Aj99gcE+mMGfLGQJDb2P
	MNbnRJBph0DLIp1c/2tGpNPV1SDg25FXN5bjtCn6c6fseAbJ3nZdxi6OZ/IC+KwOwhVAc19d0nD
	kNnGX+CWZhbonNjOqFpfO+/AB5knkhoBc0cN5f015l0efwmHu6nUrm5+KJBdN0h06T89PRJ8HR8
	Gy4tqx2hPOw62rYWF7V3yWuvtL9ZLnsz47QLT6jbaiYTViATT0rrwe1NamkS7FsQDsvW/7XDnRD
	NQxKlNHR1e7K3zcZhQuha16InumpCdCVCfCvzvrZGHokWvbs716+/HvfCiTgWZ47G8Oi9N47jrQ
	zbdDUb2CLub3jcgF6CcLaGMrw+3Klmh0+T1T/6Ab9YS+lY/jVN23v2ovceOQXP3jYjt9E4A4W6m
	HdeWgjvkVhXPO7IK9NndKIVxWkqJrC3UO74ag=
X-Received: by 2002:a05:600c:8591:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488d6abe9e4mr148996225e9.26.1776112842604;
        Mon, 13 Apr 2026 13:40:42 -0700 (PDT)
Received: from foxbook (bfi125.neoplus.adsl.tpnet.pl. [83.28.46.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm330181675e9.7.2026.04.13.13.40.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Apr 2026 13:40:42 -0700 (PDT)
Date: Mon, 13 Apr 2026 22:40:38 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org, Ricardo Ribalda
 <ribalda@chromium.org>
Subject: Re: [PATCH v7 0/2] media: uvcvideo: Add quirks to prevent Razer
 Kiyo Pro xHCI cascade failure
Message-ID: <20260413224038.641af363.michal.pecio@gmail.com>
In-Reply-To: <20260410002831.1046407-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
	<20260410002831.1046407-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58688-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C5B53F3338
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu,  9 Apr 2026 17:28:29 -0700, JP Hein wrote:
> The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
> a well-documented failure mode that cascades into complete xHCI host
> controller death, disconnecting every USB device on the bus --
> including keyboards and mice, requiring a hard reboot.

For the record, reloading xhci-pci is usually enough to fix this.

> The device has two crash triggers:
> 
>   1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails
>      to reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR.
>      The stalled endpoint triggers an xHCI stop-endpoint timeout, and
>      the kernel declares the host controller dead.
> 
>   2. Rapid control transfers: sustained rapid UVC control operations
>      (hundreds over several seconds) overwhelm the firmware.

That's a bit speculative, it's not entirely clear what happens here.
2 seems possible, but Stop Endpoint timeout and some weird error codes
seen in those logs looks like problems with the HC.

And I known that some HCs are reliably killed by stopping SuperSpeed
UVC streams, at least with my camera.

> Patch 1 of the original 3-patch series (USB_QUIRK_NO_LPM for
> 1532:0e05) has been merged by Greg Kroah-Hartman and backported to
> stable kernels 6.1, 6.6, 6.12, 6.18, and 6.19.
> 
> This v7 series covers the remaining two UVC patches:
> 
> Patch 1/2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to
> rate-limit all USB control transfers (50ms minimum interval) in
> __uvc_query_ctrl().
> 
> Patch 2/2: UVC driver -- add Razer Kiyo Pro device table entry with
>   UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
>   UVC_QUIRK_NO_RESET_RESUME.

Do these patches actually make a practical difference?

If I'm not mistaken, the results of testing on 6.17 are:

1. The original trigger (spamming UVC control requests alone) doesn't
   cause breakage anymore.

2. New problems are seen when doing the above while streaming video,
   and they are still seen even with the UVC patches applied.

