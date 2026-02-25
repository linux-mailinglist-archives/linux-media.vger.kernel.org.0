Return-Path: <linux-media+bounces-53335-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CTWG7rynmnoXwQAu9opvQ
	(envelope-from <linux-media+bounces-53335-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:01:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2FF197BE3
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC6E304FF94
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB59E3B8BC5;
	Wed, 25 Feb 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx+/wbwW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2D395DA5
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024482; cv=pass; b=Y7qmtoK0EQoSbev3wVSPZb1Uc8wmhzPz2+R5dEFaIcPhgHjJcJFZPpWBkNcMblzj/m8xRQvKaJKXpliyXnurpl+OfgNGgdxzuZ8TszrayFjg4Xf/cXdLNpC09dPOU+T+776nw7ikYkTI8LnU3LM9Eil7eY8kz+HT1R/v+w8dBWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024482; c=relaxed/simple;
	bh=1tAIusFpnU4ufM+/wV8RC3EgxfAFojZFioxLejPzG2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NiR8Cgb+XSekLTc0/AH5CYdzUTgPXBTWw25dWF/JEIhe4vee+bRwntIN4hH8J6wO9XKBBGEgoqqraGmUqC6cB+VoWuoXMkMa6N6efvco/0p9cMjC1Wc2lm0R9Ym3ixzRsko+Pj4Exk9e1uTUCAKQftVTYswINIPIMBZcUUpPrhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx+/wbwW; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so1838293241.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 05:01:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772024480; cv=none;
        d=google.com; s=arc-20240605;
        b=kuzzgGQA1whOQ1OcPcgou2Mm745GYxEbNzhTKSR+Ora4M+kfRlbrURD4iCkuXv6R5v
         XVK/g1O4WqWJZAMlB9dNizfoXUlyEMQ/Qi4q2P0lB1OsvXM/DS21BRFOA+3J5ekTd4P/
         7lQmn7dM83E4HM94ioJb26j52zS4iacA/UD1B7AMYIxLHQf48F/IuX2AaXjqgdOYarVi
         UBML6Wiuf7hmYo1GBMTZmGVYM0D3giIMxrJLeOrx8gOV+xQPisV6oMyCd+naiJ+Bg5xL
         gDIi42fxZirTDu2MEaeos7TGTqcgSEkRzk+p//v6w38bNBEXLj9CwMDGO2GBwcLUjt9j
         mcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
        fh=Np2HgLcamASbuAxQbS4ZkeK7dgYQuVeVmCW/8/PDuzQ=;
        b=kNJwphnaReb+GthrT6ug4w40AeOKz67HMqCnWPUu/PXj1lMP3zS1LCYmdq3sCr5PRQ
         NQTZACOGiPmtVTY75JMVNo4D2eOpXPYCL9IP/nq1YL2ICH3IQY4RouYqU31KW+JnM7oa
         /5zs8aZdpHPyDiH8z42WCY2DPtIM5k+HDrzavsW07YH+/RSchjCOinznNZULJCj4pX53
         bftORoW8YaB1IO1vWiRv/8NWb7KdSv9a5fk2yEBZgQPpRyTQA+A/hI30vSBjc1ugXHbb
         EjdNOB74D2EHJkWYmVddZO1kZH2r+f2HH8iCbwgNMykK3XH0FOBy29+lqK5gy80QHEOq
         TyXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772024480; x=1772629280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
        b=Nx+/wbwWunXzbbfFilcKdSFCesuuE0IMVsAGeeMFjfxoACDUPiikxyTnPzRdC1J2LH
         dcJMicLRqqjpRCScivOfCnAyapR6XbHVj1sxLlc2+1YCLYDKDYaNETgku2xcqdSGHdC/
         xdbpc14HzIQZ1O8oVUEoH7G0h+G8gflu2bWgfEf04QbR2YUi7CKCkifQovtrZNSCoW8B
         Lb/gAssSoWu2LZAzZ9LkLQihkk1D8l7+PHnNHpDAQNeM3/xTIxmyhMrBf9KRAmqpacMB
         +2UppO8dXGASn+b4JtgCGsup8fCb7hOgmom3uSXVzYyNhj8lJxkHqLhF4yyzSAijcm+D
         rILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772024480; x=1772629280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
        b=hh17aS1m26K31yIVYGuiik9JEj0Bub3EkTx0oE8U6/p36rzDfL85qFwXBSM8ckr7vE
         5a5GV0nnXwUSjiJ481DyNzqdU8Cpv4ZhGpK77CvUX5jh+BKOjSS9FQbnKDG1iFehxQ+b
         TBZDz3bmkrF7Zj3DlCE5IfAIoN1wNrhKUjxn45jVlC7H6hO7xrLmcZjX7ntLyU4xbRTu
         iQ2xqQKEckrwn97A/aExk/6eoShRV2r3yJObMQTda/JHTZJfg4jclmHgtZF3d3P1vj5h
         VSSVIOYyBSbErN8b8MdmrZuYwIFJBvqucuzlslb8dEydHldRwhcRqlLcppH9IwC76cfz
         orrw==
X-Forwarded-Encrypted: i=1; AJvYcCWkfEL//UkrtOtS02+T4Rb/P13uVPSobya5js+MeVtkcnZUOOhZtEcoGD7egi121tVu/6hISS9mmZkd8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx8Kl8bxmQiUJ6E7p8tVesX/eazRQQzQS7kUMmFXil+UvuZ+sS
	0eqIrmvqN3f7xl7ZHC6BTo3cbBfmAYqNgUqrmLoGI3dBQeg0NHur9ueMmAIysO3RKUHQDyWOCDd
	tlWr0PYwYyzif/FMl+VBmmyzegWwokG8=
X-Gm-Gg: ATEYQzz079jYGNZojaM7V2E4KH9cOoUwnr2Ul8yOnCob6bmf3JLeUfkJSHw1TtPK78n
	zB3siqntNZ5FG6U8UG/J3YN8/UKP/C0xRX9K7QHcQGF20dekZsXrCIGfWiI4y7Qib6ZCxWUVHyB
	a6WcrTes5Re+5pUgCdEVDmdcDIe4cJZi3XraOdOIrKClBH2u+yPeYjd+aSHf/45//4/M/L5NByO
	Q872PmK9i6rllqOmAT0JwfcnPRUWYrS3WBaFj+WcLKBh2NVNeeAS4sjCin/hxrrQqONZQ1avO0W
	XWclavJLnsV6t7+NNbF2Q9/w4r4StCv6O1aieJX1gh/ojP0YisW3nbCnd74Z4Po4U5DucHvXLo4
	FSgyF24UgpQ==
X-Received: by 2002:a05:6102:c48:b0:5fe:13bc:f13a with SMTP id
 ada2fe7eead31-5feb30f2f8bmr6491053137.36.1772024478156; Wed, 25 Feb 2026
 05:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com> <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
In-Reply-To: <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Wed, 25 Feb 2026 13:00:55 +0000
X-Gm-Features: AaiRm53w9VqfdeuFM3tO4rVuI77Og9DiXXronH78foC19VF0BgkGYZqa119Jqws
Message-ID: <CAD0gVBvB6grt+Px_KV15eFFp8akuttEk6XY_r6L1yyuP75K+7A@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.49 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53335-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andresfperez@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,leemhuis.info:email]
X-Rspamd-Queue-Id: CA2FF197BE3
X-Rspamd-Action: no action

Thorsten,

So I built vanilla 7.0-rc1. I also added these kernel params:
    nvidia-drm.modeset=3D0
    modprobe.blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm
    rd.driver.blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm

then I booted into it. this is what my nvidia loadout looks like on my
usual 6.18.9:
    + uname -r
    6.18.9-arch1-2
    + lsmod
    + grep -E nvidia|nouveau
    nvidia_drm            147456  3
    nvidia_modeset       2121728  3 nvidia_drm
    nvidia_uvm           2568192  0
    nvidia              16306176  34 nvidia_uvm,nvidia_modeset
    drm_ttm_helper         16384  2 nvidia_drm,xe
    video                  81920  4 thinkpad_acpi,xe,i915,nvidia_modeset
    + lspci -nnk
    + grep -iA2 VGA\|3D\|Display
    00:02.0 VGA compatible controller [0300]: Intel Corporation
TigerLake-H GT1 [UHD Graphics] [8086:9a60] (rev 01)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: i915
    --
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation
TU117GLM [T1200 Laptop GPU] [10de:1fbc] (rev a1)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: nvidia

and this is what it looked like in vanilla 7.0-rc1 with blacklisted nvidia:
    + uname -r
    7.0.0-rc1-dirty
    + lsmod
    + grep -E nvidia|nouveau
    + lspci -nnk
    + grep -iA2 VGA\|3D\|Display
    00:02.0 VGA compatible controller [0300]: Intel Corporation
TigerLake-H GT1 [UHD Graphics] [8086:9a60] (rev 01)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: i915
    --
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation
TU117GLM [T1200 Laptop GPU] [10de:1fbc] (rev a1)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel modules: nouveau

when I did a VT switch, it froze. my 90s failsafe triggered and rebooted me=
.
then I rebuilt 7.0-rc1 with my patch, rebooted with the same efi
loader, and was able to perform VT switching without any issues.

Andr=C3=A9s

On Mon, Feb 23, 2026 at 8:26=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
>
>
> On 2/23/26 09:10, Ricardo Ribalda wrote:
> > Hi Andr=C3=A9s
> >
> > Thanks for doing the bisecting
> >
> > On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gm=
ail.com> wrote:
> >>
> >> # OVERVIEW
> >>
> >> Since kernel v6.16.1, switching from an X11 session to a text VT and b=
ack
> >> freezes the display on a ThinkPad P15 Gen 2. The system remains respon=
sive
> >> over SSH; only the display is frozen. Bisecting identified commit
> >> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> >> ioctls") as the trigger. Reverting the logic change in that commit
> >> fixes VT switching
> >> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. =
Wayland
> >> compositors (e.g., river and sway) are not affected.
> >>
> >> Last good:  v6.15.9
> >> First bad:  v6.16.1
> >> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> >> camera for some ioctls
> >>
> >> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> >> CPU:        Intel Core i7-11800H (Tiger Lake-H)
> >> iGPU:        Intel UHD Graphics (TGL GT1)
> >> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-o=
pen)
>
> Could this be caused by nvidia's own driver, even if it is not supposed
> to be involved? Might be worth ruling out with a proper vanilla kernel,
> ideally really fresh, so 7.0-rc1.
>
> Ciao, Thorsten
>
> >> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> >> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> >> Firmware:   LENOVO N37ET61W (1.97)
> >> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display man=
ager
> >>
> >> ## Symptoms and reproduction steps:
> >> 1. Boot, start X11 on tty1 (startx).
> >> 2. Switch to tty2 (Ctrl+Alt+F2): works.
> >> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
> >>    - Frozen on the last frame shown before switching away.
> >>    - System is fully responsive over SSH.
> >>    - Other VTs switch normally between each other as long as X11 is
> >> not active on them.
> >>    - Killing X does not recover the display. A reboot is required.
> >>
> >> # DEBUG ANALYSIS
> >>
> >> On v6.16.1, the VT switch back to X triggers a full modeset due to pip=
e
> >> configuration mismatches detected by intel_pipe_config_compare:
> >>
> >> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bp=
p
> >>   (expected 30, found 24)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
> >>   (expected link 269484/524288, found link 336855/524288)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw=
_state
> >>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in port_cl=
ock
> >>   (expected 270000, found 216000)
> >> [drm:intel_atomic_check] forcing full modeset
> >>
> >> On v6.15.9, the same VT switch shows no such messages.
> >> no pipe_config_compare runs, no modeset, no freeze.
> >>
> >> # BISECT AND VERIFICATION
> >>
> >> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> >> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> >> certain V4L2 IOCTLS to call video_ioctl2 directly without first callin=
g
> >> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_=
get
> >> before video_ioctl2.
> >>
> >> ## VT switching verification across kernel versions:
> >>
> >>   v6.12.74 arch pkg:   WORKS
> >>   v6.15.9 arch pkg:    WORKS
> >>   v6.15.9 from source: WORKS
> >>   v6.16.1 with d1b618e reverted:     WORKS
> >>   v6.17.9 with PM wrapping restored: WORKS
> >>   v6.18.9 with PM wrapping restored: WORKS
> >>
> >>   v6.16.1 from source:  FREEZES
> >>   v6.16.1 arch pkg:     FREEZES
> >>   v6.17.9 arch pkg:     FREEZES
> >>   v6.18.9 from source:  FREEZES
> >>   v6.18.9 arch pkg:     FREEZES
> >>
> >> ## Things that do not eliminate the freeze
> >>
> >>   - module_blacklist=3Duvcvideo on boot
> >>   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
> >
> > This is puzzling me a bit... You are saying that if you do not build
> > the uvc driver, the freeze is still happening?
> >
> > Am I understanding this correctly?
> >
> >>   - i915.enable_psr=3D0
> >>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
> >>   - xrandr --output eDP-1 --set "max bpc" 10
> >>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
> >>
> >> ## Workaround patch
> >>
> >> Reverting the optimization from d1b618e to restore the unconditional
> >> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/=
uvc_v4l2.c
> >> index 9e4a251eca88..15057b47ec4f 100644
> >> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct fil=
e *file,
> >>   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
> >>   int ret;
> >>
> >> - /* The following IOCTLs need to turn on the camera. */
> >> - switch (converted_cmd) {
> >> - case UVCIOC_CTRL_MAP:
> >> - case UVCIOC_CTRL_QUERY:
> >> - case VIDIOC_G_CTRL:
> >> - case VIDIOC_G_EXT_CTRLS:
> >> - case VIDIOC_G_INPUT:
> >> - case VIDIOC_QUERYCTRL:
> >> - case VIDIOC_QUERYMENU:
> >> - case VIDIOC_QUERY_EXT_CTRL:
> >> - case VIDIOC_S_CTRL:
> >> - case VIDIOC_S_EXT_CTRLS:
> >> - case VIDIOC_S_FMT:
> >> - case VIDIOC_S_INPUT:
> >> - case VIDIOC_S_PARM:
> >> - case VIDIOC_TRY_EXT_CTRLS:
> >> - case VIDIOC_TRY_FMT:
> >> - ret =3D uvc_pm_get(handle->stream->dev);
> >> - if (ret)
> >> - return ret;
> >> - ret =3D video_ioctl2(file, cmd, arg);
> >> - uvc_pm_put(handle->stream->dev);
> >> + ret =3D uvc_pm_get(handle->stream->dev);
> >> + if (ret)
> >>   return ret;
> >> - }
> >> -
> >> - /* The other IOCTLs can run with the camera off. */
> >> - return video_ioctl2(file, cmd, arg);
> >> + ret =3D video_ioctl2(file, cmd, arg);
> >> + uvc_pm_put(handle->stream->dev);
> >> + return ret;
> >>  }
> >>
> >>  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
> >>
> >> Andr=C3=A9s
> >>
> >
> >
>

