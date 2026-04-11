Return-Path: <linux-media+bounces-58589-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMJ5K09P2mld0AgAu9opvQ
	(envelope-from <linux-media+bounces-58589-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:40:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2C3E0235
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C60D13072AB4
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E7928150F;
	Sat, 11 Apr 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaJqVQ36"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6646259CBD
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775914783; cv=none; b=jivVhSlRH0yPni86Q2KdN0gcNwyYa1tJ1QBbhOyTrWoCfeYeTJ3iMnxSofW+P7oSlETtcNf3AnqzeDsXPdxR2b3DdqlwQDmL7y7jNp8u/QjdDuVpWW//lWi7vf48+TvMzrN/lQonsfvoikiaVzhJakRL9ANJwtsVKaLzXtzQurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775914783; c=relaxed/simple;
	bh=GlYCZfWgWZ+Auk8Kau0yI40Dl4yPnI6VLalMiXlRhRg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TX2b6FURSfK8PaMhd/RL3a71E9jRtuyyHj+lG8I3/EBxcsxXu86r++83yc48+4aRAIV3usqICwdd8hXLc1BdewpxM1Z9KNRoaWwYvogz/VY/kzeLLnE9WjCBLDYqWD72xjtYQ0I7zsD0JGmcEK/bnMqzP1bq8jiQ2fg/w0Qxg+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaJqVQ36; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so2486005e9.2
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775914780; x=1776519580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDRr3a1WzbFHjnYdc5Yz0jdXm1HUWqyueTEULNfk4+U=;
        b=NaJqVQ36UnAvMXD6iIduaGM/LB1QYrOxPYSAR5JnvcrjYm0aFHr6nXJNegqNQr6CO4
         5mB9QEvjTUFJ9YODYPs+OOl8Kc/ctWPJ7f5/NHSb4+01tml3n3zyw1b7C6GskQc+ZDH+
         3h9mPl4gZ/U9jzNEKGV6yNMWc9wPZtl0KR5MnVKFBAoYnQzqLGEhM+1W3HLCNWeRQxF8
         1CU1zmrGd8P3lwvc28Gt49CfLkm9mPL91GaaRYQApA49bO3DfakkZCYx6Vqx0jaPEIZc
         48zGYJysJiLfBx70dLWSWeTXMo6yIKjk0bhKiqOj6DW2VTcHabry0aFhPNjeb4MyRCvZ
         jaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775914780; x=1776519580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDRr3a1WzbFHjnYdc5Yz0jdXm1HUWqyueTEULNfk4+U=;
        b=ULgu3RL4wYXZfiqZsI5LrqvPwnTCo5ceXs8JZIuLDcbL6lvZbp3wzH91x4JPWWEHBQ
         JOxK7TsH3lrGAatv8+opZIXaP9wQ8ZsSLQoUqOePxQCgCLKFoYNqHe1RcpVfyMeYclJ4
         CdVuhZIHvzV4y4E/6eHU6b576AxqpYoAdslyWmchb4/0GDz3j8JlQQsYJVQ/pqO765xN
         5ZLUzIKZuF773TkxYaZuxPAnUkeMwSHNvgVOBnxOd2kkE8uOoKh403rA0dof2DBuZQ+N
         u7mXILYGtfprIhiXSlGVtG3QVLHvAraATH0fq5ujDlsgltDgGVnDYSyZCiUqyHLidUQK
         YC5w==
X-Forwarded-Encrypted: i=1; AJvYcCXRjVSdRp+khuyXcuvhpC3sE6y3CB2gW8OnyAwFDXSf1W0FQCKS1pqjuKwzVmS0f3/iXlkXZCEy7N5UaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBRCSXIftfd1nLW0hmuEIDI2rngQlkfQBm40szOeKMXj3sfhNB
	KjmKkP7tNSK93vlfmy2YfvvSTTuv5pHWi+tjk74VfBPct7JVJSmGhL/1
X-Gm-Gg: AeBDievByBrCkDSlrSfLK6A4jBVPNpjQBsiCf7YbA7rcNcZaKBTK+qSFT4FQoj2YRi1
	vpZHb9kQQ/qwWkZhF28fGjfgyLYa8l+Q+ttU/vkRwewz2hzKFjKa5oqABF2lxOfOumtVnjbaxO4
	HGz9z06jYTzP6um1IFFP6xhr9BVm3k5ovo0L3xZTX/4v607LZm9uv/Lwfyk6bPgkU80H424m1l8
	x+G4dCFBoz8ObV1KP4vmCqejLDMde5XXK92TKq00O3BPzW0+R3Fmh/mlfkQI6EIdbJOroJlQjTu
	H3DS49lY18O38j8vOCU72SnoQ8Ah+AyCqesdQaURYneKc363IEXj0Wb2YZPa0QjqySROUpFuT3e
	WvWLVimE9nXnOKL3C/fAm6+/UkjuD00AWag3My9AFNAAIjldas9ie116WtRkwCI14rtJ4BjocVu
	A3A6nq35vp/0kAd8abJD1hzlwbBOrnHE7BxLc=
X-Received: by 2002:a05:600c:8585:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-488d684bcb0mr70355895e9.14.1775914780064;
        Sat, 11 Apr 2026 06:39:40 -0700 (PDT)
Received: from foxbook (bfi125.neoplus.adsl.tpnet.pl. [83.28.46.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5347ea5sm169775625e9.8.2026.04.11.06.39.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 11 Apr 2026 06:39:39 -0700 (PDT)
Date: Sat, 11 Apr 2026 15:39:35 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, JP Hein <jp@jphein.com>, Alan
 Stern <stern@rowland.harvard.edu>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
Message-ID: <20260411153935.2fc5c030.michal.pecio@gmail.com>
In-Reply-To: <c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com>
References: <20260331003806.212565-1-jp@jphein.com>
	<20260331003806.212565-3-jp@jphein.com>
	<CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
	<20260409100247.7cfb62d1.michal.pecio@gmail.com>
	<20260409221749.5e6bccab.michal.pecio@gmail.com>
	<c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58589-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2AA2C3E0235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 11 Apr 2026 00:48:05 +0300, Mathias Nyman wrote:
> > Five seconds later two control URBs are unlinked:
> > Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Cancel URB 00000000122aa5e2, dev 3.1, ep 0x0, starting at offset 0x11e227b40
> > Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: // Ding dong!
> > Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Cancel URB 000000008a55bcd3, dev 3.1, ep 0x0, starting at offset 0x11e227b20
> > Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Not queuing Stop Endpoint on slot 18 ep 0 in state 0x44  
> 
> log continues with:
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Removing canceled TD starting at 0x11e227b40 (dma) in stream 0 URB 00000000122aa5e2
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Removing canceled TD starting at 0x11e227b20 (dma) in stream 0 URB 000000008a55bcd3
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Set TR Deq ptr 0x11e227b40, cycle 0
> 
> One theory could be that xHC control endpoint refuses to restart when
> its dequeue pointer is moved to a no-op TD like in this case (second
> cancelled URB).

This could explain why it doesn't work later, but not why these URBs
have been unlinked after making no progress for 5 seconds. EP0 was
probably still functioning normally during those submit-unlink cycles
on 0x85 and there were no EP0 unlinks until these above.

Another corner case which could potentially confuse HCs is Set TR Deq
to a Link TRB, but it doesn't occur in this log on any endpoint.

By the way, are you able to find out what this is?
198 falls into the "vendor defined error" range and vendor is Intel.

crash-6.17.0-xhci-test-20260410-154243.log, isochronous URB unlink:
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Transfer error for slot 36 ep 2 on endpoint
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: ERROR Unknown event condition 198 for slot 36 ep 2 , HC probably busted
[Fri Apr 10 15:44:31 2026] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 36 ep 2

