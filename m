Return-Path: <linux-media+bounces-56639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMAQARJpwGlkHgQAu9opvQ
	(envelope-from <linux-media+bounces-56639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:11:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 558AB2EAFB0
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43911300EAA6
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 22:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23D737E317;
	Sun, 22 Mar 2026 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="IuGXGlHa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BACA372EDE
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 22:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217442; cv=pass; b=e2SLUaUb8NktcSkksS4GDiZROSSZyvdod7qt0Gt7bREFUQQmkx4PFf+C69ijgGNglBpd+CtdoVkvB4eT4zuoHXK5G1h7JiUZaPeIJOjYamOgcofmCti93ZjChzE2wdMzb5oXJ0j00dR4lZ7Ks8Mvr4HXJ0DAnDOmACg0O4gh3DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217442; c=relaxed/simple;
	bh=x1w5Bh0hXE+R1kbLYv8/Hm/OkWz4e0lUE37K2HZ1y7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auLcB67iplgV0gQqki3jZMAkiDC0Lk0mBMvhixuP1R8ReP8m4Sqv8XrZ3CYSoOj9dX+T4Fp4+r1zuIuAe7O1nNooJUBJaA3/9vbHNudfgCvD2hxiD5OaRVetTJGqwAWCjdSChndGzWHGTgUDBguOHu0aB/if9kMLqBgmGHF3BHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=IuGXGlHa; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ae222d978so3685633d50.1
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 15:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774217440; cv=none;
        d=google.com; s=arc-20240605;
        b=gnDWKLvWxElHuYFq5yPG9MB697LROQr6IySwVJmqEx//0Gp8l2s2ouhJ7q8Wyg+6ZI
         CRfA7V4M6rAuxLOx4k66nj18Zb9EuwWGdkOKhf7ECAF/dve18hJiFbbFnaJqu+GlOiIs
         helHIZOt14Cq2zs+vp9ziPkSw6NHjwLHG7WSfIkOFDGLxNhKDe8VnQ7vHt1kz1DSvPcn
         A1fEcmG0FhoLUx06ieVvLW5PCyhTnhEJtSu+X1FIO3iOzRYwAj0UWmOtGgFb4ZpkHVo1
         9sCX7Ip5Vc9kD8OaHc29Gm5/haW3EcOWXyn0H+w4pW0IsOavl3IwninG1skvLBlvPN+T
         uQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=maqbUFDVU1fBNlyXTgUimX3uQ68hwxMNeXFRVOxQKxo=;
        fh=LR/gpxdtVypJ06NNLM4wst/XbN8sOyUIZFkAcETLJHc=;
        b=QRvtg3vuykxv/rjAlh+wKe0SgoPrA49GyKVVpeHeI9Kuo99q8J/Zv6ASvkDqhikY44
         /u+NpIweO/tXgb4NoSfUxyb/w/Xa23Z0gv4DHgccmLkD482WNscWIF24Fo0uGHePiw+S
         Uy9QGKXVU3/FUwGj2AEf8oUrzLIhAlGW/3aBT6dMU/pb/7lWL0QDP9gQjOQop6TkQBhC
         mfpSTIYriNf9gMbYcOPXaRCjdcgxpLQ3yErmJxKou5jCeY28QGEO9XQTp0SGR7cIfCTI
         1jXPqOmixChhZHGv9la1xp8FrIrO4lo/FgDCPOKBSb9CIBUviC5jCjfs5jiwVx+VJVz1
         77Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217440; x=1774822240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maqbUFDVU1fBNlyXTgUimX3uQ68hwxMNeXFRVOxQKxo=;
        b=IuGXGlHa4iH+Gcl8bb3EaOnNcJ9RRFEMwHQ7+dvu13CvZhC/k8a3BpgiCxclaCRjTn
         h6P5bT1AnsG2fo+JKsMCnbAUTsuoS2xMMFrI94Q0QQLd+1NYC1X0CkKdBhf1KGNwc+kt
         x41naSrQPydOKrO26TQeN0r48fMo7Vs9SkLPlZjrj22lQT/uN2sWjmwFslMe53ofXxcn
         Gmj4oFHqB1ONXUpdyIPGpPEyIV9OjGL77vmNNznDy6qk14/CM+4+++6kwGrHRQvlAb6Q
         HRFJqNoD/gVQi9cCF1EtjMJRNgVbIYGKZuy0d8hsWLGQFYgkXHHvwf+igorImMOVi/yv
         FeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217440; x=1774822240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maqbUFDVU1fBNlyXTgUimX3uQ68hwxMNeXFRVOxQKxo=;
        b=JLOrR3/uUPNTZs5Gofkqnbvsh+mq9+Tez02FAyTQ2vu5DtgzahA9WwtxpZqcoPR7cC
         VANgiok36/de0ElhDaDEoZLUWvMTFuYbGSUi/MxwnLhuPLCRuKb06nbFG+1Ne+rp3CPV
         jO3MsRJRfhclfom8Z8mR7WzHjNksIf90qoI5W+C33UHJt0fHy8bAxbuC3P7sadiZj1uB
         TYX4lzs6J+E+wA1t20XAl2uYwtyQOkcM2vfk4rSXw45OthxgBoB3tyo5jSFEW0cyEcgR
         kRNvClULoUj+Vs1qkopUQ5J9YhwB9XJxOvM9TV1xionK4U147La/m5UU6ylLvsimX8gk
         NF0g==
X-Forwarded-Encrypted: i=1; AJvYcCUfSOdnlMSYBkhwQHWQ6RE8KlX076yHPCjzwGSzn/k7xmMMO0zlTf0T79oq67g840VshiyoNzuuQNsDDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB2kGF0IDjlepLUDdHE4muT5vBDBFrtHQvEs4Tcs50tsN4fXEU
	Q50IhJTIcXReK/6xN1eyispPWiGm44xpE3nHmHwu7LFCtUh2eh6bww/F5N+i56ydz1FvgmgtIZj
	SWhQoJmqe0fQ7Ddj4eVBs+3Blx10kv+A/S5PygirT
X-Gm-Gg: ATEYQzxVkYmO09qvs7oB4ALmBoWGsgh/4NS0j0WRgQkGFEh9f6/Eij1eJ1hxnpLqWrK
	S4l2B1D0MggImESIuNyM/lImU2UnWPpKGgMYAIk2nyQ8zFphRlsTMNaGtcaEB6Nwel47juMRvwt
	dG/L/mf3zxOYuSp2oy+SllW5T+gH7Z7hrBi2okCFH2czZdxSHgbWLCwtk6NROjCU5j1V+XXQIWq
	bBb0HkDtwvwz1DmP+F9GACYEa0N/aFUMm/252OyrjadKy9091a1n0XF64txUp+ADUMOGv+xt4J7
	n3to
X-Received: by 2002:a05:690c:112:b0:79a:ac83:ac7a with SMTP id
 00721157ae682-79aac83b0ebmr30223357b3.36.1774217439889; Sun, 22 Mar 2026
 15:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321223713.1219297-1-jp@jphein.com> <20260322055354.03399a32.michal.pecio@gmail.com>
In-Reply-To: <20260322055354.03399a32.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Sun, 22 Mar 2026 15:10:28 -0700
X-Gm-Features: AaiRm50oRG8Mr0cjFR7cCSGQaef51kLZ44-yoCLNOycpoaWX8w5YS5O5MF0Hd74
Message-ID: <CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com>
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56639-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stress-test-kiyo.sh:url,mail.gmail.com:mid,jphein.com:dkim,jphein.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,techempower.org:url]
X-Rspamd-Queue-Id: 558AB2EAFB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 09:54:00PM -0700, Michal Pecio wrote:
> On Sat, 21 Mar 2026 15:37:02 -0700, JP Hein wrote:
> > This has been reported as Ubuntu Launchpad Bug #2061177 and affects
> > multiple kernel versions (tested on 6.5.x through 6.8.x).
>
> > Tested on:
> >   - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
>
> How many of those problems still exist on current releases,
> where these patches would end up applied?

Both failure modes are in the device firmware (version 8.21), not the
kernel, so they exist on any kernel version.  On 6.8.0-106-generic
(where I tested), the TRB_STOP_RING case in
xhci_handle_command_timeout() goes straight to xhci_halt() +
xhci_hc_died() without attempting per-device recovery.  I have not
verified whether this path has changed in a more recent kernel.

I have personally reproduced the crash on 6.8.0-106-generic (Ubuntu
24.04).  The "6.5.x through 6.8.x" in the cover letter was overstated
-- I should have said the Launchpad bug has reports across those
versions, but I have only tested on 6.8.

> Does anyone have a repro?

Yes.  The stress test script is in the series repository:

    https://github.com/jphein/kiyo-xhci-fix

stress-test-kiyo.sh exercises UVC controls via v4l2-ctl at maximum
rate -- brightness, contrast, saturation, white balance, exposure,
focus, pan/tilt/zoom -- cycling through their full ranges each round.
With 0ms delay between controls, the crash consistently occurs around
round 25 of 50 (~5-10 seconds of sustained rapid SET_CUR).

To reproduce:

    bash stress-test-kiyo.sh 50

With the CTRL_THROTTLE patch applied (50ms rate limit), the same test
passes 50/50 rounds reliably.

> How does it behave on non-Intel USB controllers?

I have only tested on Intel Cannon Lake PCH xHCI (8086:a36d).  I do
not have a system with a non-Intel xHCI controller and this camera to
test with.

That said, the firmware lockup itself is controller-independent -- the
device stops responding to USB control transfers regardless of the host
controller.  What varies is the host controller's response to the
resulting stop-endpoint timeout.  On 6.8, xhci-hcd takes the
TRB_STOP_RING timeout straight to hc_died(), which kills the entire
bus.  A controller whose driver implemented per-device recovery could
isolate the failure to just the offending device.

The NO_LPM and CTRL_THROTTLE quirks operate at the USB core and UVC
driver level respectively, so they prevent the firmware from reaching
the lockup state regardless of which xHCI controller is underneath.

JP



On Sat, Mar 21, 2026 at 9:54=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sat, 21 Mar 2026 15:37:02 -0700, JP Hein wrote:
> > This has been reported as Ubuntu Launchpad Bug #2061177 and affects
> > multiple kernel versions (tested on 6.5.x through 6.8.x).
>
> > Tested on:
> >   - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
>
> How many of those problems still exist on current releases,
> where hese patches would end up applied?
>
> Does anyone have a repro?
>
> How does it behave on non-Intel USB controllers?
>
> Regards,
> Michal



--
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

