Return-Path: <linux-media+bounces-57516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHoyDXU/yWk7wgUAu9opvQ
	(envelope-from <linux-media+bounces-57516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 17:04:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9910D352855
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 17:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0625B300F5CE
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 15:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F6237DE9C;
	Sun, 29 Mar 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="PYJM/xmG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF79B67E
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774796637; cv=pass; b=agctGwBYaItb5LGaoBm4HQC8KrjItXRFY+M+vpUc8C7kQgFyxYn6G9Qqmzquzr8nBTYEzEat0AQdVJ72ciEjRvTMU+7nM5HCKOsi/CLtg32/dCN+MDoFmUWJERGsJbsv/dFvI1UI9o3eqRgpUa469tLBx2LEzgJAmTcl/YIO7L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774796637; c=relaxed/simple;
	bh=7fn3Z+2dnye8ym96U8WpPLIEbXEMZnKCkPCfscZBs5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXoFq7C8YcYeRVkE6rKePlZ8/9xR0wJS2YEZoPJJkgFjjFAd1W7JhCU0/RC2kG8v830ZYhIsosOlvw+5//Ze3n48cn96WyRaiGDAA5UQ9mZCaNFVIbk4jtMI25I2BgajKDm6xVnFzTSbmjKbiJ3q3mUUiyEIqvY2//rmmISmjIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=PYJM/xmG; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64f48a5c3d8so4943549d50.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 08:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774796634; cv=none;
        d=google.com; s=arc-20240605;
        b=Ier2PSTg9U7WEsWxwK7MXQSb67aX8m1qKFAns/rOGWEAbnfukMwZqkUhBn2jCzYC+k
         q8hPWBUyPcWnX6PvsjSPyEC2WMiQLVf6NrNfZlafU04TZoJplI28QW/mLvBXFsXgvxmj
         usFcgLPHLuN8v4UvHcQW9scuO34SA6fL2rnSJxGjcfbNUwFdRFt8fsBai3EShXAUdfB3
         vBt3ZuEG9lwWJ5lh+sRQwSMfMDy84mVpabtgNC42NZTVH4JeZ1Jt964ET6svDmX2Hm2R
         sv7wEvx+AesXiXhOjEsIgPueeEPQZhB2aw+l67pM15akpV2GWCkTsV6BTJlDkANAZK6u
         eHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fkpr6x8ZyyJkz5iE6Uzz9ElyoBGLMbtXkFG8ALfJ6/c=;
        fh=rmBzRTM8KMcwkXLgqgiBKRydPZDuKWuzZa+kfUzGP+g=;
        b=C2eAx+8zWxUBMgt6w8Gea0o9qtkSzcDQgU4uZr0YCFYhMGyp2qbs5W/aEjE5XXjcXZ
         OiYAgjPOWjiTlGn+Ug/5Q/CgqecrBkgnPndutTH1SzS1Inkh2mh+KZURNb3cUTUDe2UP
         RKjIQloSk0YXYhTYZIMoRpwPvjw7Dx+kQJgfl/EBVYyaUAYfTh6v7WteCE17VvLnrEM+
         rcNlq4sBMgnD2mBpcl7l0VlWFwCcGmKEu+SFRrHnpaRD1CZILlaz3uBVRGs6sC5MpGp0
         RYT06fHYZW9UbO9TkGko+jhxUhH+KfppTK2YkwFKICmBxP6aetqU0DHLC+GpdWt56W3L
         MpfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774796634; x=1775401434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkpr6x8ZyyJkz5iE6Uzz9ElyoBGLMbtXkFG8ALfJ6/c=;
        b=PYJM/xmGj4WlXxJz3E7rYM16yoPekuH/t0vpGv5havGLAAuo2ANVyVZH0dGqwKF811
         uvv4SBd1KoUdDAKyQUHplWJPyqJPzRBvMqIh96SQSb9+A3HO0hvUIfaiRR3Puxe3WJSd
         zQEf1N1d6EM1d1BHTCCQFiTP5L5gHggivWmvrIBJta2mM5pcfen2BrPwLCxoIn1wTRYN
         SiPaEduwkeHBadCioL3rHyF3Ua9BzIc5yuZCgHZ0skXyUjn2uRaElvHwesHIpUXBKCi+
         USKp4nO1XPhRIIoCqVcK/o3CCYws0zx+GZKig0YnQgRjuqVNaFlX55tWeKD0asZLAwq4
         SIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774796634; x=1775401434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fkpr6x8ZyyJkz5iE6Uzz9ElyoBGLMbtXkFG8ALfJ6/c=;
        b=hNQcV9yfQtt0+PoboqESeQ/wBhWY6CeAoZp4ycJLHhCZx+0YyMiXc9+JME4PMwlAcQ
         mfnEwU444MT8zVk4sPie/Vc+9OuSFNKsY0KwecJlOQdoKl0L6aERWiXjfWF9Z56vggB6
         AX85XlJ3dYH8NCt0XYYXBYlNKJpAKvhPVQqIzh86rmH9ArIhMIpcKWSMuNH1reHc2lUh
         JK/jBUXeVFtRHaFfRTEGILSOihAUlpu7HTbwVobKS1nMnMs7ckNADEub462WVhoao7pF
         mHLAKS9oO0m2Kd2+5BGE5BzXH5cdzTzWaflYGuMUcMDdUqI8MozA+4Zh7RULEFManyjQ
         PX6g==
X-Forwarded-Encrypted: i=1; AJvYcCVoqh8Sx0iclJnm28TYRYepiCETHvwveQNawPWBlTKDUb5MCdXqcNdNyGGnlMtpi/TYnCgHEcBgoYv+cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVnbvjW/Pm4/2v3pYEejoLY1wIEXeYK7FPYUoxrNWAmLPXJAx
	oPfqlromsDPe7k9+VTEa8DwHt+ngIb2/hDlcT4hXlU1gP6GZjw6y9kGOY5fEz5hHA94tpv7q6NG
	geQqPexc5a1ko90NYr1nYvR5kDQE+rMkdV2F+KmBu1za4WQ/efM/wBdbh
X-Gm-Gg: ATEYQzyXvKwMXIvTU1mHeM2tYj0SnFnQnH1Rt6AmFORUVJGQFZplygJOmY4DwUUyZQ0
	pD3h3tigPXqcx37JiEEh/+R/uC5VmFh7cGtMHodMRbFis7JjH1YFGqIhoWprgp4X0/8FIKDploj
	mka4wSzxgVSVuxOMWRVKXHwP6zPaQCva+UdHkowvtMc3EEEkUPdhb7L4AKEMcYiuC04cpwLBkT8
	JibiYSPxww9uw5+fh+Unpxk/MCh/9Ea9OLdXlWlqWP3WlM2XBtAozqpudVq4XUU9ZH3tCmcu0nT
	hsxtaKb+nIlzXoM=
X-Received: by 2002:a05:690e:1c08:b0:64c:9ec3:d710 with SMTP id
 956f58d0204a3-64ff73acdb5mr9325664d50.41.1774796633749; Sun, 29 Mar 2026
 08:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321223713.1219297-1-jp@jphein.com> <20260322055354.03399a32.michal.pecio@gmail.com>
 <CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com> <20260323085845.6bf57b3b.michal.pecio@gmail.com>
In-Reply-To: <20260323085845.6bf57b3b.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Sun, 29 Mar 2026 08:03:42 -0700
X-Gm-Features: AQROBzD7GC_TrwPeTrvW3mp5jNE4JvirNKJp_EKtrLyJ9BYIvabbB9bj_SkkwFk
Message-ID: <CAD5VvzDWF7SO0Aytp3K_uXV6ZYoqEqN1dhfv7VtMAHSpHP+qTA@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-57516-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,techempower.org:url,jphein.com:dkim,jphein.com:url,stress-test-kiyo.sh:url]
X-Rspamd-Queue-Id: 9910D352855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

I have now tested on 6.17.0-19-generic (Ubuntu 25.04) with dynamic
debug enabled for xhci_hcd and usbcore, and without any of my proposed
patches or workarounds applied. No udev quirks, no LPM disable, no
control throttle -- completely stock kernel.

Results: the stress test passes 50/50 rounds with 0ms delay. On
6.8.0-106-generic the same test crashed consistently around round 25.

The xHCI error handling changes between 6.8 and 6.17 appear to have
resolved the cascade failure. The controller no longer escalates to
hc_died() when the device firmware stalls.

The UVC probe control EPIPE (-32) still occurs at device init:

    uvcvideo 2-3.4:1.1: Failed to set UVC probe control : -32 (exp. 26).

And with dynamic debug enabled, the kernel logs show it dynamically
disabling U1 LPM when the device responds slowly:

    usb 2-3.4: Hub-initiated U1 disabled due to long timeout 16800us

So the kernel is now handling both the LPM issues and the error
recovery gracefully without needing the quirks I proposed.

I have not tested on non-Intel hardware. The firmware is already at
the latest version (1.5.0.1) per Razer's standalone updater.

Full debug log from the stress test is available at:

    https://github.com/jphein/kiyo-xhci-fix

Given these results, it seems like the patch series may no longer be
needed for current kernels. Happy to provide any additional testing or
logs.

JP


On Mon, Mar 23, 2026 at 12:58=E2=80=AFAM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> On Sun, 22 Mar 2026 15:10:28 -0700, Jeffrey Hein wrote:
> > Both failure modes are in the device firmware (version 8.21), not the
> > kernel, so they exist on any kernel version.  On 6.8.0-106-generic
> > (where I tested), the TRB_STOP_RING case in
> > xhci_handle_command_timeout() goes straight to xhci_halt() +
> > xhci_hc_died() without attempting per-device recovery.
>
> Command timeout is a failure of the xHCI controller, not the device,
> and as Alan said, it's generally not supposed to happen so we are
> curious how it happens and if it can be prevented in xhci-hcd.
>
> Device behavior may be a contributing factor, as can be a kernel bug
> or controller HW bug. It would be helpful if somebody tried this on
> non-Intel hardware and on current kernels, because there were various
> changes to xHCI error handling over the last two years.
>
> > The stress test script is in the series repository:
> >
> >     https://github.com/jphein/kiyo-xhci-fix
> >
> > stress-test-kiyo.sh exercises UVC controls via v4l2-ctl at maximum
> > rate -- brightness, contrast, saturation, white balance, exposure,
> > focus, pan/tilt/zoom -- cycling through their full ranges each round.
> > With 0ms delay between controls, the crash consistently occurs around
> > round 25 of 50 (~5-10 seconds of sustained rapid SET_CUR).
>
> OK, I will see if it does anything interesting on my hardware, but it
> may be nothing because I don't have this camera.
>
> Did you try it on a different camera in the same USB port?
>
> > That said, the firmware lockup itself is controller-independent -- the
> > device stops responding to USB control transfers regardless of the
> > host controller.  What varies is the host controller's response to the
> > resulting stop-endpoint timeout.  On 6.8, xhci-hcd takes the
> > TRB_STOP_RING timeout straight to hc_died()
>
> Nope, this is controller dependent because Stop Endpoint is a command
> to the controller and it has no reason to fail. Something is broken.
>
> Could you boot a newer kernel (compile 7.0-rc5 yourself or at least get
> latest release (or beta) of your distribution), enable dynamic debug
>
> echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
> echo 'module usbcore +p' >/proc/dynamic_debug/control
>
> then connect the camera, crash it again and send dmesg output?
>
> Regards,
> Michal



--=20
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

