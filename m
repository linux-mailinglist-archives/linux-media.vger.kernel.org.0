Return-Path: <linux-media+bounces-53184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FMkAdI/nGlLCQQAu9opvQ
	(envelope-from <linux-media+bounces-53184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 12:53:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249D175BB5
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 12:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 549913075FBB
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 11:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D31362137;
	Mon, 23 Feb 2026 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdJl8l2Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0AA361676
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847548; cv=pass; b=HyGsO9IcL0Al+9tGtj/paQ6y/aMnsjVPGUuMuKpamp5u6Kk0fwVKQsargSkuuk4YhRWHuT/FuneLnXwtpU+KSI25c7LBjbpi5je46qOBH/QdWwkDTMd7URScoY7rr7y90s/tlLacD8bAQNsFUZgdTzyjmkyxiw1pqqwXjkSwuSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847548; c=relaxed/simple;
	bh=+d1Gsvyn8shZSpEx0gTkDzpXXrDC99n6t6b6nk1CH4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njVRtLUvPd1ahrLksY1qZAMcRJSBUzz0eBScngEf+AOhEMRrRvIlpc49r23uta+eJjWqubgaeZsMKHC3Sj0MGiC6aZ+lvRWSlb8kCntnvNepARdVVjdDqBj0XSYzQ94Cmyqwdrn5F4qez7D2iTYy+W9b6M3YkG9XRpFLOCRs4tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdJl8l2Q; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5665171836cso5092776e0c.2
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 03:52:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771847546; cv=none;
        d=google.com; s=arc-20240605;
        b=KfKJYERySgr1PHL3Awshi80ksWzO5PxFMO93gWr0hjJ4/hph5odgcNa/maOctegNH4
         OKv5qOz/XrwJpAYUN7lmhta3IuabM0hGWd86v5OmmLLrBiTQwyNFGMHf5torBJspP95a
         C/qJAuRIAxSenY7Tz+eIcxSvpEmI827TZp4+2srq3W+qglWM7w5K8XiPBj0FhA7mEBpT
         QAd9FqWFF87G2zIUZ6BI8/TwAvNU78JM3vriKNcA5e5f1Q6MGl26+IkxqGDceWkq/pHd
         fqnwAtQ+DwrGaDiwI3Eaj3rBABHBBP1j5EO7yG0Yv0+UK1rd6Cf75qjcy/SUg/7jwEpy
         EpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
        fh=Px5A/LS7cljdi4SwQ49cuctum3nopG5CYU22rUPQdB0=;
        b=V8Vcr2cg74XaI6OxwFwPtJdZ2BtwKqT6ZYiu6hjfcbalcyDMo3uNUqSlQ6u43LiT//
         eDFreZr9wgdlk0+7EjWZpC2Ph5erGkzbqP0hU932QuKkJM5GvpeHTlBzbcak0cP387vg
         T2Rn5Dnb0gY+162V/ElL/04jc8V2FkDTOnQPm3PDl4Lkq97VZufNqFBk7O15VDrFARI4
         FObz7qxipr9awXnaE8a951F7cR/MUb+4WQFdkMfXd3b/RC1Z8xqkXh7y1HYP1gFhp1o6
         n6wfJaBnHmuD9rfYPxpn4djQbOsu+lAw/rUsymedtioeH3Tvw4BtVWQnSal2YT1FvlvV
         as1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771847546; x=1772452346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
        b=SdJl8l2QMJn/VU+mTyUzHNxQy6JuPSh+scKd7W1IfTFQwiE3YjeJ1jbmy4gWvqCeco
         iGVdyh/woxtkDEOZCh0qgb/vJ3O3QFq2B5tBKa8dFLhfvqUabEVfGcGJ4pK2hAsnGBOh
         dMWS81ePtRWe5t4s1tcAuffVJ5/pzB5vONQ8nAl3Axm79NS2ScR1gh0Kjv5C/6eLtayU
         QtJWALveyZYv2fPrBBfmRxvtSR0juoXb3j21C1SVVvwzphUMDBzuPdnJ8YI1/LPSNiPT
         ngqOYR5LgX8IN47IlqL5q1Yjo8mjhGHENxLUfjtZTwNUV1HPWDrNPCpQ6tgO+sdh2q8Y
         atFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771847546; x=1772452346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
        b=uK+Al1hH3JLivU7Bv55bH7BLCShRwMn1Jszk9+wnygvOpX5DhTyWJImsNGMgKBf2eg
         pkjSR4E47zzPttYEMxvXTds34lQysBKJKxJb9YnAuUNGfH34ECotHsk2Jqt3e7LfrB66
         3ct/uhy5Fo6cBQTLcErrwQAuOTClmoZ5Z9iOvSNf4qFp3umaaOszDDAVVSxNpOOLPXpM
         nQQAYtK/acTZEmd+XllEsfJD3AgfSWo/Im1MNOt0m3Gn6zd3eslo4zANnf2VQ/xmQVEK
         SIE84qe7uNfIZp26alBRY3n2e7JAZR6UhuyGMdmYWXdEcfIV2ruNpmH2nH/3N0z6vqW/
         EAJA==
X-Forwarded-Encrypted: i=1; AJvYcCWSgD7r0klMtJ5KE8jEqEoJJeHjBFvq2r/qZNOOn7jMJnLkwxMVtC5F47+eNhoRaswVr7LGXU2CISdYWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPfXSgDFZDundpA6gssecT7gI74fTwM3PD9QYPZUYxiez8m1y
	qhPXhfloZM/tTyhTUAmNy/KLSSk3Lp1GlgOkFEOgXq7KdnrhGm4Ui3jLB8V/rJ5Wkg4ffYee6h9
	2dkrS0w33Ny+GMgkKJ83c8ytqBJ64VEA=
X-Gm-Gg: AZuq6aK9B2WvkLTsvDNdUBYn3iOHctPJ+/ZGgLuuQERJYlnaECy3O4gOLk5xjv4uDTM
	TaM4lORByU1Z8RaT25sAagYWuiCoXKhwTl6PhuE2xpjrJBCUAbKivxu0FDAUedqjfo1nNd4f+Qt
	BUXmm9hSJB0UjpnM0Ldo/f0z2CPG/sqiMi3Uj/xnvT0SWkBaLkoy2M4aZq6/VrkECtrHNnZASU9
	xnO3K8P4vXAIeugVPVIaQvwmCyzr1M+Zl4vBzu9JMdG+VdCbK3Ip/bvt87iJz8rdHRBBsChiwiq
	phnBwNOW9PiUZhRDVKIFHr0hS54DAQ0Cy7FKLEc4d46K0cpDzksl7fq8CWQ75r3GLo/s9il3hhM
	AWEom+UhDdQ==
X-Received: by 2002:a05:6102:4194:b0:5eb:fc32:935c with SMTP id
 ada2fe7eead31-5feb2ea40afmr3964742137.3.1771847545558; Mon, 23 Feb 2026
 03:52:25 -0800 (PST)
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
Date: Mon, 23 Feb 2026 11:52:04 +0000
X-Gm-Features: AaiRm53kqVqwYlk73dxvSEeN9WnimirsmxYiC5QcBDjE53JtGAA8jfNwC48NL8s
Message-ID: <CAD0gVBs4m9FpBZ9eVcxRK5y601WPkatGE6e9fi1iK0YA=CiMHw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53184-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,leemhuis.info:email]
X-Rspamd-Queue-Id: 5249D175BB5
X-Rspamd-Action: no action

Thorsten,

It's worth a shot. I'll give it a try and report back.

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

