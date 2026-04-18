Return-Path: <linux-media+bounces-59081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI/FEcq+42muKQEAu9opvQ
	(envelope-from <linux-media+bounces-59081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 19:26:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A55421CDD
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 19:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1ECAA3030D2D
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 17:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C42329C6D;
	Sat, 18 Apr 2026 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="kBlEteeT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FB43128B6
	for <linux-media@vger.kernel.org>; Sat, 18 Apr 2026 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776533185; cv=pass; b=Q4wnuD7222/0jqRGtYhY+4/1OEZJIgCLX6dQke7G/2BGXYrFkW2ItmjQjW6mszW7QFRZhO1ePGu/UXcPM0Vk21Vqr2hLKVScJT+4O+/Ax+MW0umhSKqVUmyaLWcjYLKYYVUXGZK1lzP7rJ3s+p/ti+tDePde9BT0ZmYXwEDiDNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776533185; c=relaxed/simple;
	bh=9OVsWG6+yc4+IAvVazyFSY2sDQ3pP+4KRfr8oJkRS/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iR1BbzVxlgaOhfLvkS0NZyLUAVDM1P+Q4UmDFd3l3d9PMHym1p1gw/1/0ILjlftEIfho1DAgbzRNaYEV/JSXdOiRgETu04/AcTrV9UFrOnWsniTdi/K0xrzrmCx63WEqe6MOnwLR4GCBH7pPcRmWQ3eq9lGAbh2QQN+oscM6C0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=kBlEteeT; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-651b4d09141so2399356d50.1
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2026 10:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776533183; cv=none;
        d=google.com; s=arc-20240605;
        b=jnbCT29hxzZens4Vmi6LHT0r19LJqGLYQmmCNzuB+bMjO+iGtpMPsbzizx+syyP+5o
         7p0LVQvndt73f8eJxeKWzcPpiubYk7a7ZL6225hBziMvXtKWTCAPJBMWRMq6cA/LrVcB
         rjVmuUHyVno2B//cAJsrZrSzUidCGhhPGuyU0Wfd62cVIk6uPgD4VaW6u1v34JN8lU7W
         vBRztb+1swN9oVnNGBtlpptLOO0vMTtAk51T7DJLwAOva6bO9Vy842iXeb9/AYfugtR5
         Ndbp4HUWXCFDr+OJ4Jgz6O7ScPBWsUCsoG/P9mFE3S0TYtvQssarP7rejUoZJEQznXko
         Ym2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qr4o9m1Sz2A5IAyiMrV0/JGv2mxMgPeLICxxVAR+oDc=;
        fh=mRr42nH8yqh/XuoYZn1Es6yQnbsWzNEybarEGWRpuPY=;
        b=De1RJv8zXZ9g/tuUo1UYm5vx2TDGpgfM+AtnYOq3AZpMzXJqLSISpqhLKpL2s6Wbpz
         W/6ggyLQHbbazR607qvurVb4jHvImi8knzGvb7j/SXVu9/l/QKKLlpAUqXyFNyDnxP1z
         RNaqGomuMow1kzrmIrP8YnoKAPaCvLNX2fVpd6FOjeEQAcXOSMRbFCJ3DKxoBZuqCZwh
         STscvKEHXeDqzD1rkABPKJS/psrsE8QZS7rdQkgD6KwkWlTaynyWk1MLhw7aD7XO52KZ
         HeOB6rWNIcfL5CnWd1yFyphDmHU16qd8taHCcbVw4MKir7hi8ifxQizOz5IcT24AwOiS
         cEvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1776533183; x=1777137983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qr4o9m1Sz2A5IAyiMrV0/JGv2mxMgPeLICxxVAR+oDc=;
        b=kBlEteeTSQbhKrYiIBlvUR+L7J957RLNnvCHYJBbbAzwbO/vFLLoa+/sFl8VXSWeFR
         pZZztKTSgwZFVG+GMgfzrGyGq+YCXb3g17wVLx6Ol2hesU8vemN3yvwuqRtBU8w/yfhR
         U+bjNfLQi3PY96Fa4K/kSG5eLTw/8VMp7JI18BGXNCe2eNYMqV+CF0Yn/c8kXZbztBjS
         g2jUmrrmw0uP5+wsyDWAQAhLn6PdcgTJa3648rruloIhE7EmgAFG7tt2/9qXwx874HXf
         Hs10CzuUUbxGR3iAfN3nn2FzmfRskc8lJ7U95l5TOQJosBpaOyKF0wNWjBlGmT90eQkZ
         N/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776533183; x=1777137983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qr4o9m1Sz2A5IAyiMrV0/JGv2mxMgPeLICxxVAR+oDc=;
        b=T4tX0K7xP1HAHo1erFwSRWLRDkMiPHsYUKYM/h02RsOBJOxkm4OX80jG5A0zezVAxM
         ySkkU0q26IyaGgRsG8sSBjQ9TPOWto4Xa5/V1mJbVrMNpAy7dI9sqQoDM0verX9wLrbv
         heH/X2XbtVxggciBJ1j44lwblfBjHjaFDUh9EihAYiBQthk8Yx7mISMDblwzK5O9ky/k
         pRthok2B/HzsURdJL8E7H5GX97hVk9N2RbrJmjOWYZzUzTknEz8onKIaCb0BE1tmLtr+
         C7lRS8IW+/xarbzIXnmYqhREsCEiote7Pe7Gqx3yuusfKta/OkUKV/MUPUUh1XEkXEtU
         sGvg==
X-Forwarded-Encrypted: i=1; AFNElJ8JWX4WxuRT5oywcMV1hm7g51YJkaNMOYDVC/UOjjNEkXyOi9woJqCbknGHTRhIINqSsSeQH2ggkrDgiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHJC05YbtQWNYAscxGunMJr4/GD26i0uyQTzA89+ShYPmkVD4y
	MoECsTFSD3fiPVzNSOjMAk5Pm2X4lS/S6rHTZEUw23iM4i5wjLtVx+X4XRvkZlaQZubL93n8Cwf
	ffxMDDSW3P7KesYqS7pnwN/F3x9sh4fVsPdZW4K1LImZ0SITobkHRRA==
X-Gm-Gg: AeBDieuf89X7+oao11yP3Ic1TX/5OObQHtGS8grk1lgL+fmPwaYSIxEiZxmErhq5Em3
	pvhEKO5EJMUCVdSSWbYfcfuqa6WnhyLgEVvZm/kwc1IWYG5cZ0H8IJ78v7QmWpCW9hz6RiFl31t
	xaDDTDqmHh/pzcdQ/xpjalDrgF6JgNQh3gzYloooRS9aE+zBGAf414ZKL4+X84sayt3p3Pq7QFw
	wDOy4CG0AJ0JNo8jPSzsofBpjJKsHkPydglfEv3FxiWly+s+0+bB5VOUHqk4jlUTjtoaVj+jhbb
	bZBS6fJSyrpiFxFic4s0/XB9eVWbSZrVydjB9O4C1Q2DC2yvKpO0V2l7vtq/NPPZE6T3k50WWza
	/afNK2rj1SOM=
X-Received: by 2002:a05:690e:4012:b0:650:26c1:ee84 with SMTP id
 956f58d0204a3-653119490b8mr5649970d50.11.1776533182977; Sat, 18 Apr 2026
 10:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260410002831.1046407-1-jp@jphein.com>
 <20260413224038.641af363.michal.pecio@gmail.com>
In-Reply-To: <20260413224038.641af363.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Sat, 18 Apr 2026 10:26:12 -0700
X-Gm-Features: AQROBzCJK66u477M-5iydhRUHoCBK8pZ0OF1PsxdK9d8NCvSpOfl9itMzhHM0ys
Message-ID: <CAD5VvzDpq2CTzZNCx28aNzNvqV4TkJpB19DbJr2ZZKWtYUe0Qg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] media: uvcvideo: Add quirks to prevent Razer Kiyo
 Pro xHCI cascade failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59081-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,jphein.com:dkim,jphein.com:url]
X-Rspamd-Queue-Id: B9A55421CDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 22:40:38 +0200, Michal Pecio wrote:
> For the record, reloading xhci-pci is usually enough to fix this.

You're right that reloading xhci-pci is a recovery path -- I'll note
it. The reason the cover letter says "hard reboot" is that when the HC
dies, every USB device on the bus disconnects with it, keyboard and
mouse included, so triggering the reload requires SSH from a second
machine, SysRq, or some other non-USB input path. For most users on a
single-machine desktop the practical recovery is a reboot. I'll reword
in the next respin to capture both: "recovery requires rmmod/modprobe
xhci-pci or a reboot; since the local input devices disconnect with
the HC, most single-machine users will reboot."

> That's a bit speculative, it's not entirely clear what happens here.
> 2 seems possible, but Stop Endpoint timeout and some weird error codes
> seen in those logs looks like problems with the HC.

Fair. I'll reword trigger #2 to drop the firmware-internals claim and
describe only what we can observe: sustained rapid control activity
correlates with the device entering a stalled state that then triggers
a separate xHCI-layer failure. Your dual-cancel discussion with Mathias
and the vendor-defined event 198 are the right place to characterise
the HC-side mechanism; these UVC patches don't claim to explain or fix
it.

> Do these patches actually make a practical difference?

For CTRL_THROTTLE vs no mitigation, yes -- and I should have led with
this. Without any patches the stress test crashes the HC reproducibly
at round ~25 (many dmesg captures on file). With CTRL_THROTTLE alone
the same stress test runs 500+ rounds without failure. I also tested
USB_QUIRK_NO_LPM, DISABLE_AUTOSUSPEND, and avoid_reset_quirk
individually via sysfs, and each failed to prevent the stress-test
crash in isolation; a combined udev rule with all three still crashed
at ~round 25. Only CTRL_THROTTLE (or the coarser
USB_QUIRK_DELAY_CTRL_MSG at 200 ms) prevented it.

Where my data is actually thin is the interaction with your xhci test
patch specifically. The Apr 10 runs comparing "full stack + your
patch" (HC died) against "your patch alone" (HC survived) are N=3D1
each, and the lock-up path is timing-sensitive, so I shouldn't be
drawing conclusions from single outcomes on that axis. Before
respinning, I'll run a replication matrix on 6.17:

  * stock (no patches)
  * stock + your xhci test patch
  * stock + NO_LPM
  * stock + NO_LPM + CTRL_THROTTLE
  * stock + NO_LPM + CTRL_THROTTLE + your xhci test patch

each under two workloads -- control-spam only, and control-spam during
an active v4l2 stream -- at N >=3D 5 per cell, with xhci_hcd and usbcore
dynamic debug enabled. I'll post the matrix with logs before the next
respin. That should tell us whether CTRL_THROTTLE still earns its keep
once your xhci patch is applied, which is the real open question.

Two things I'll fold in regardless of how the matrix reads:

  1. The cover-letter language fixes above.

  2. Clarifying in the commit messages that CTRL_THROTTLE and the
     device-table entry are a device-local firmware-workaround layer,
     not a claim on the HC-side issue -- which is Mathias's territory
     and I don't want to conflate them.

If the matrix shows the throttle doesn't buy anything above your xhci
patch, I'll say so plainly and we can discuss whether the device-table
entry alone (DISABLE_AUTOSUSPEND + NO_RESET_RESUME, matching the
Logitech Rally Bar entry in uvc_driver.c) is still worth landing on
its own.

Thanks for the pushback -- it forced me to look harder at my own data.

JP


On Mon, Apr 13, 2026 at 1:40=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Thu,  9 Apr 2026 17:28:29 -0700, JP Hein wrote:
> > The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
> > a well-documented failure mode that cascades into complete xHCI host
> > controller death, disconnecting every USB device on the bus --
> > including keyboards and mice, requiring a hard reboot.
>
> For the record, reloading xhci-pci is usually enough to fix this.
>
> > The device has two crash triggers:
> >
> >   1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails
> >      to reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR.
> >      The stalled endpoint triggers an xHCI stop-endpoint timeout, and
> >      the kernel declares the host controller dead.
> >
> >   2. Rapid control transfers: sustained rapid UVC control operations
> >      (hundreds over several seconds) overwhelm the firmware.
>
> That's a bit speculative, it's not entirely clear what happens here.
> 2 seems possible, but Stop Endpoint timeout and some weird error codes
> seen in those logs looks like problems with the HC.
>
> And I known that some HCs are reliably killed by stopping SuperSpeed
> UVC streams, at least with my camera.
>
> > Patch 1 of the original 3-patch series (USB_QUIRK_NO_LPM for
> > 1532:0e05) has been merged by Greg Kroah-Hartman and backported to
> > stable kernels 6.1, 6.6, 6.12, 6.18, and 6.19.
> >
> > This v7 series covers the remaining two UVC patches:
> >
> > Patch 1/2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to
> > rate-limit all USB control transfers (50ms minimum interval) in
> > __uvc_query_ctrl().
> >
> > Patch 2/2: UVC driver -- add Razer Kiyo Pro device table entry with
> >   UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
> >   UVC_QUIRK_NO_RESET_RESUME.
>
> Do these patches actually make a practical difference?
>
> If I'm not mistaken, the results of testing on 6.17 are:
>
> 1. The original trigger (spamming UVC control requests alone) doesn't
>    cause breakage anymore.
>
> 2. New problems are seen when doing the above while streaming video,
>    and they are still seen even with the UVC patches applied.



--=20
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

