Return-Path: <linux-media+bounces-53183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOrnBXU/nGlLCQQAu9opvQ
	(envelope-from <linux-media+bounces-53183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 12:52:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A3175B6A
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 12:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82C3E303BB02
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 11:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BCD35C1B8;
	Mon, 23 Feb 2026 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA1G06i6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C08360722
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847498; cv=pass; b=RQdm8d07FD6Wy9c+HEgAcqMhoCzqyjDnKWqBlhn1u5Fk464QQcdo6llxmI+dKE9HJNrh4ch9kbuNewqDE7zfKyAHK3D16ls+QV1cLzymp9pAqoYX1+YL7hDQKKhRf7MlamosbERqe3T6sQmEYPvGP7Qmw9NlOuRoUnJNlkLYXM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847498; c=relaxed/simple;
	bh=6iocD9MNSzx4u2ot8rxH8bvtMLCokh3pHlrbgw2W8ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQ89Df5jHByT8Eh5S04iwn5dIvT2k+1sJpIJ0tEpdWY2XKraIx0umfkNpqayWqKOlvN9P+CtzEPjkV1ZHdiwbC/6AlWnHrEBRnrPZXWl/QbCXA+yk6v/iLdkisRoR1eacna/SFMU7GUhMYZyG53RDsiVVBJSXlPKDWptPKpWJmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nA1G06i6; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5fc41f88ff1so997112137.2
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 03:51:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771847495; cv=none;
        d=google.com; s=arc-20240605;
        b=h5fz6oY3+dzDRJ9gICXhZsQ4W7lKk4ul8PJ+Nts/ylbG5wMuSwPjIJ05EGS5p1bhTG
         0amPrF7Aj0dmeZA1ei0BFZ7SFVBwZueuU7UGSNof0hEF5qa3N6rr6PM6Tu02vyhE7t7b
         UiIW7xQFl15BD3Zh4Ab9XsE1mQIyIaGWOcaeJmtXlLsXoIfW356uYrqK3h4VSv0Fi44m
         9LSbgbmTGhWNqKyAu3NBuI0RnjlIUVeExHcq0rsEFTv9s3IDKrCpDxIPDX2zT1S5SBzG
         8mG3KTeStvF3UgADybrCieyfrSK8w+OKKoMgOLSGpGigETwmw6P5rpULvbXHZ4fl5fz7
         uyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
        fh=Gyun4k0REF2Xe/sYXc7DsfcCaqMxw1i8GqAEIsDpmrc=;
        b=bKx+LlskGNGLyssJ0RP7bbUO1U1s1qan0iKGYwIpOl4G6VPoqaItm6CVBc+CTntA7s
         9cRHbF7r3e8Y5MGbxH+zo1ekB2oWX4c7qtUIIO6SwHYrI1kRqvvmRHRf4nkeXwaeWH+C
         dUVUo43mVeN7VdxICGfylhAF0DjXGKnfuBy6MvEkJVvkZd875nSbzAQD2cgvfNmMRSBA
         78hIVl8m6sL4jCsVerNUCQcgdXHnt8QHmbzu5yp5eGEFS0l1qm9ENh2FxBj3s1DNsWd4
         ZklaNZHZcSrPU6janoL++gehB8VfuGt2d6Mqn1kuSKFJQ4UAPJrkrTDmhsDRM+rBpHpL
         zZVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771847495; x=1772452295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
        b=nA1G06i6cyzu5cXu8J8mZuLliJ9xeC1xvtVBi6ohONN6T1CKlAcj6tXM7hdSo/vqM8
         +EWfbaaX1/gKWWBN1mjYYtbPTkTgPa0TD7jfKF9a9P+oE3kNx4Brrzt3yxa+Ec7ZpZjb
         2IJh3WyreNBPWeW4VngZwznynpfdqwGbpvOOK564OgRIS41lQdMlBx3Ln0HNnXmJ+5Tu
         aefEcp4+metaECtfTzrhAjnvm+7LLZQzF0VBf72+mIP+ZpmNYSFpDQPmBSVdHeZYk8Em
         X0lzobHwhvSv83cAP8lnZhCx+y4O0AAmeCVXIANlUxwX0dodwK5JsvtXxXgXDH0Xhpkb
         zsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771847495; x=1772452295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
        b=cO0n/oxIKDLWex/Io564iLBiYBW7xQRqtZL4cSmH0gLeQTjiJgd5HfVXL2svY7ZyZJ
         ykqpgAStt1rExDPppN4N+RWoAQeQyEBeokx+XZT9Bl6t/4NXfPrtlO+W/0ahDHlAgeay
         /himWSq1vECg326kQ3zPFGr3FSzMgwoFT9srt4uPEu1QO5vCqnuEdNb2GSxN9J/3xI2Q
         VJgQ+H+qIIOhGduA3hhZSvmwiO0RF5F9UToe04lKMTZCkHtvtxDOK4NTMKpJI0dAW2Kh
         XdmyvaqFTdV4h84860D1N6nrTtD2MrZmZIvw+P3Cj//i9OO9CJbRqB5F2jcN1XLp0daB
         5eCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmDxSQBhjTXt+U24fgXCyOJ/UkSHne8/x5ttrymuy68aLAPKCbE8yjHKDM1jyyNlrNRsBzpyGycASWmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfuIdFya+DXSWHAkdeopj4dOP/Oo0PIxIY+X3I1ub+GoH8l4Df
	ud8sxRoO7Gxn/lGfZyPgx0G9AZwyEXg8MYFaiNDmI7K1YFyHyzPMvLc78DqJXv2hfcESmggwSxk
	HPt/O4VZllJNA0DTOcUCD8mHjdPAkZ2k=
X-Gm-Gg: AZuq6aKs+5upB0zBNO7z1Qti9l4iJp1lUGaDxyso5+uUqckZHEk8tFzy03JYTatgFR7
	oYFpvyql416lftSo1XtclHwWxky9em3B2MLJzSU0gcZf8Vjg4rBPJluIT1FuozlbYZ/h8cmyHde
	zRHxdUJj3InDLpU1NBgmuQ+If17pbmmwdTGX4unXwsJdm29pGfsCq7IAO9Kh2v16YHzx3HUU6xg
	NeHe+hwts5fY2lyLwMvZw1IV3L8pdiIBSNhMpzuiLQrxxoe4uKn+f+rPWcI3OlsdkJUblm1uvt0
	24z+dXkLg1WGhCwEYvWPpSAc8hHs88bIHXwMkAMtv1DycN9mc/Rv0wNRv0IeSI9UIRA64v847Fs
	ww4UyIVgcsA==
X-Received: by 2002:a05:6102:e0e:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5feb310b93bmr3236127137.32.1771847494951; Mon, 23 Feb 2026
 03:51:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
In-Reply-To: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Mon, 23 Feb 2026 11:51:14 +0000
X-Gm-Features: AaiRm52aszgholXfDNGG6k-0d1fHGX88p3iT8Mn4sxSWllcwfxYwH-T9tRbXK5Q
Message-ID: <CAD0gVBtWhQqnxVt7kvQoQcbazGiLH-rUNrTfnZZpm40-jKvTUA@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: stable@vger.kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53183-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:email]
X-Rspamd-Queue-Id: 611A3175B6A
X-Rspamd-Action: no action

Ricardo,

Listen, I'm right there with you, scratching my head. First thing I
did when I bisected to that commit was modprobe -r that module. Easy
sacrifice; I don't use my camera that often. When it still froze, I
assumed that maybe something related to module init was still
lingering, so I disabled it by kernel boot param. When that didn't
work, I just didn't build it in at all. Then I ignored it and tried a
few other things. Eventually I came back to that commit. Instead of
patching any code, I just added a comment to the file, thinking maybe
this is just some build artifact that's causing a false positive. No
dice. So far, the only thing that has allowed VT switching to work is
restoring those PM calls around the video_ioctl2 call. I am not
presenting it as a solution (quite the contrary!), I am presenting it
solely because it's all I've got to go on.

Andr=C3=A9s

On Mon, Feb 23, 2026 at 8:18=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi Andr=C3=A9s
>
> Thanks for doing the bisecting
>
> On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gmai=
l.com> wrote:
> >
> > # OVERVIEW
> >
> > Since kernel v6.16.1, switching from an X11 session to a text VT and ba=
ck
> > freezes the display on a ThinkPad P15 Gen 2. The system remains respons=
ive
> > over SSH; only the display is frozen. Bisecting identified commit
> > d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> > ioctls") as the trigger. Reverting the logic change in that commit
> > fixes VT switching
> > on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. W=
ayland
> > compositors (e.g., river and sway) are not affected.
> >
> > Last good:  v6.15.9
> > First bad:  v6.16.1
> > Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> > camera for some ioctls
> >
> > ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> > CPU:        Intel Core i7-11800H (Tiger Lake-H)
> > iGPU:        Intel UHD Graphics (TGL GT1)
> > dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-op=
en)
> > Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> > Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> > Firmware:   LENOVO N37ET61W (1.97)
> > OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display mana=
ger
> >
> > ## Symptoms and reproduction steps:
> > 1. Boot, start X11 on tty1 (startx).
> > 2. Switch to tty2 (Ctrl+Alt+F2): works.
> > 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
> >    - Frozen on the last frame shown before switching away.
> >    - System is fully responsive over SSH.
> >    - Other VTs switch normally between each other as long as X11 is
> > not active on them.
> >    - Killing X does not recover the display. A reboot is required.
> >
> > # DEBUG ANALYSIS
> >
> > On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
> > configuration mismatches detected by intel_pipe_config_compare:
> >
> > [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
> >   (expected 30, found 24)
> > [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
> >   (expected link 269484/524288, found link 336855/524288)
> > [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_=
state
> >   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> > [drm:intel_pipe_config_compare] fastset requirement not met in port_clo=
ck
> >   (expected 270000, found 216000)
> > [drm:intel_atomic_check] forcing full modeset
> >
> > On v6.15.9, the same VT switch shows no such messages.
> > no pipe_config_compare runs, no modeset, no freeze.
> >
> > # BISECT AND VERIFICATION
> >
> > The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> > commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> > certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
> > uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_g=
et
> > before video_ioctl2.
> >
> > ## VT switching verification across kernel versions:
> >
> >   v6.12.74 arch pkg:   WORKS
> >   v6.15.9 arch pkg:    WORKS
> >   v6.15.9 from source: WORKS
> >   v6.16.1 with d1b618e reverted:     WORKS
> >   v6.17.9 with PM wrapping restored: WORKS
> >   v6.18.9 with PM wrapping restored: WORKS
> >
> >   v6.16.1 from source:  FREEZES
> >   v6.16.1 arch pkg:     FREEZES
> >   v6.17.9 arch pkg:     FREEZES
> >   v6.18.9 from source:  FREEZES
> >   v6.18.9 arch pkg:     FREEZES
> >
> > ## Things that do not eliminate the freeze
> >
> >   - module_blacklist=3Duvcvideo on boot
> >   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
>
> This is puzzling me a bit... You are saying that if you do not build
> the uvc driver, the freeze is still happening?
>
> Am I understanding this correctly?
>
> >   - i915.enable_psr=3D0
> >   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
> >   - xrandr --output eDP-1 --set "max bpc" 10
> >   - Xorg config FBDepth 30 (No effect on pipe_bpp)
> >
> > ## Workaround patch
> >
> > Reverting the optimization from d1b618e to restore the unconditional
> > uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
> > index 9e4a251eca88..15057b47ec4f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file=
 *file,
> >   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
> >   int ret;
> >
> > - /* The following IOCTLs need to turn on the camera. */
> > - switch (converted_cmd) {
> > - case UVCIOC_CTRL_MAP:
> > - case UVCIOC_CTRL_QUERY:
> > - case VIDIOC_G_CTRL:
> > - case VIDIOC_G_EXT_CTRLS:
> > - case VIDIOC_G_INPUT:
> > - case VIDIOC_QUERYCTRL:
> > - case VIDIOC_QUERYMENU:
> > - case VIDIOC_QUERY_EXT_CTRL:
> > - case VIDIOC_S_CTRL:
> > - case VIDIOC_S_EXT_CTRLS:
> > - case VIDIOC_S_FMT:
> > - case VIDIOC_S_INPUT:
> > - case VIDIOC_S_PARM:
> > - case VIDIOC_TRY_EXT_CTRLS:
> > - case VIDIOC_TRY_FMT:
> > - ret =3D uvc_pm_get(handle->stream->dev);
> > - if (ret)
> > - return ret;
> > - ret =3D video_ioctl2(file, cmd, arg);
> > - uvc_pm_put(handle->stream->dev);
> > + ret =3D uvc_pm_get(handle->stream->dev);
> > + if (ret)
> >   return ret;
> > - }
> > -
> > - /* The other IOCTLs can run with the camera off. */
> > - return video_ioctl2(file, cmd, arg);
> > + ret =3D video_ioctl2(file, cmd, arg);
> > + uvc_pm_put(handle->stream->dev);
> > + return ret;
> >  }
> >
> >  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
> >
> > Andr=C3=A9s
> >
>
>
> --
> Ricardo Ribalda

