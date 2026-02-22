Return-Path: <linux-media+bounces-53146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBmII4V7m2nc0AMAu9opvQ
	(envelope-from <linux-media+bounces-53146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 22:56:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22266170855
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 22:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7DC83007501
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 21:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303C235C1B8;
	Sun, 22 Feb 2026 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuUmUTQB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C51359705
	for <linux-media@vger.kernel.org>; Sun, 22 Feb 2026 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771797376; cv=pass; b=t4ASHMFd4lyiGT5LGpNzXpReRuPZPAotHPEbQYWSzGIdVf0bYlIoY5j40pFPvyCJ68XiYx0I0ufL1Bl2EmO8GO/QO8fyH6QZfX1iQniZKnj+oS8i3OyyCsWmer3clSB1OCwefk3WXbUmTePqmzIgSyrfGjkoxEZcc3Pya3wetMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771797376; c=relaxed/simple;
	bh=JmSvQO5XqyT6TdvcO2hqlfP/xs6Gk//750J3WTyc8u0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MLKSn4Hke5B614LQ8u2Ex3rUK3BwUiAKVsjcXkve+CKidznHPjIDot7ZvF7rnYvc7sm3ZXClmi9C4iBjzrE3aRNpuEXu3euLjdcHz7/5pXxMVLVpXsJunZ4kvlX1AaIeuX4I66rBAzDwxMgR30xIjbZaCF8Yr3yQql/D+rWac0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuUmUTQB; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5674689e507so1604350e0c.3
        for <linux-media@vger.kernel.org>; Sun, 22 Feb 2026 13:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771797374; cv=none;
        d=google.com; s=arc-20240605;
        b=gTQh77KIk8Nx4kXRxHg23LAGH33fK72/zZWuTTa5MM3tzEBCWuQgEBBLwnplQzCqjL
         Zg2abMBLCJNbBvQfrvi7SCl4jzsibNjICuEV935p6282+qj9euAh/EPsn0xX7xtPtXcd
         b/YsSMu+Xl+9TFAUkM54rPnHcvDOTx6naI33FPVwzOazaKn2lmzA8B61Cl2cTWZwBXJW
         ZEipemtvpp1PiAlfcDkecwo8GT6RifuBGmaKin98TRDin13i068XhIMEgyfWXtnCvWzj
         9kmBnO3rqWKr85iZczwDNg1WZAWEo+OGdv9GvWG+mECY4+cT6gw1VFzv9Q+fixjDr6bx
         rziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
        fh=tc22h79tKXw4e+1vMwq1ISsfDS1PedHFCYBLj/bMJs8=;
        b=Egc6EiU2JyF1WIdiVdhDLqs4wo6VHG06vA5+v6BtlsMGm0tOrJHEPXMoHB5fkrNxPq
         ou+8vCXV3cDNuds26k9oztvmMAeYUpw3ruzdU1PhpzzOt72JX/5CqpYwzoYX5OL5/u2n
         s84FEq85k6EBU2uVBqLjNcasIdNtwNCDsBAl92bqXDPRFPQl1zmtd5WVk4ROrkpfW45G
         Fr4zo0Iix6pmuiaEAx2ofNxSy9nF80/tOlbZXqhi1db5UMZxcKS1h3ExW/9gdMh4plGB
         i7nQjUzB6IGrerYzA0mjPN3WKXJ0EyOi2W9uYft9lnigF8HKCXpty1Ugj2BwwEDA7YvN
         pTLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771797374; x=1772402174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
        b=PuUmUTQBb+Mb558N6vMGiEpSEsrP9fJKT7Yd10sPSRpeznTjeAmClndE+ROruMPtY6
         coIfG5XhLIYEpBgWdUKVm/qMOI2HaBVc/gz8RKSwVUK13g6kiPpL/3eVe/+tQgRrTrVQ
         Ez9f8FKMJPfvpeoHqU5X5trewXM4nQVr/1sttBiuF9eIZ7efTk+UcVgTB7N+ucixgaTs
         wzNHELCG3Jqq+w8MD6RRB32eRn31+kBete7k6qrsYZpR6IuRXh78xpsuOD71o7DK3Epi
         5TEMHk0ku1B8Gi6WL/wRv+cPVFcU/1As7KPc2yl3fByO73mc3GNboxakUUhNsJ4vj64k
         QMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771797374; x=1772402174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvZFs6ZWQcArHoivTdoRPMVBttlGZZKU4uro3YAyvz8=;
        b=TwNfYVcqsq57gXky+gw5vmQCWTQd83zvOTVcL9MVplu1RWmjAuu4zlnnxm7CUSV1tk
         dDIwkb8OneAnTNllcuujPVOgWOLPhO3o8TgCwnLz0H/kz7CEp0bb3w+Xvo/DWeuua+c/
         yxkKrhcsXE1gpz9IYDBEk/MH4rr8MHfLgwK02jiJIituV66Yhzs0ZdQEAKDZZRrE1PCa
         1NhMyyqQQRRhEMuYhNzrLiVlrk/zfOm0mFHECUQJ6PRhU32BIzZcdRoQczr1M8zzgrFp
         kyOpv9Scaf/0V1njKc/lGk+9G0o8VjfGeAUCic1+FxvvxXaNE75uPaqAVReSzzTDH7h0
         Druw==
X-Forwarded-Encrypted: i=1; AJvYcCUmk3DBvdAdQwEWpCt6VRgJrTnNuvtSCt7DIvbZBdqTr/PAH3W8ZeIhkLTusRMAs1qCXzzG7mpEKvDSAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWU/EDsgqX5jT3LQB6IhVHzIooiP9TPnN9gD5bbgJ4aFTP9M70
	TUB1Z5nYyZTKGN5VsYWHWeRbxn0jlvg+Fboic0R5is1RjRfsZIcSGJnNJDKpJMnxNsN0WjIPeU2
	WU4poPGf4Bg1iWBdZ04U+0YqpKOQxDDg=
X-Gm-Gg: AZuq6aIam2aDUKY7cExfKwSmzC4QZit3asexB4cVJz4a59fT0XZfC12S1+KGDS2LFc1
	V3bl6YvRNSDvyYWyO9E5snWU57ZNV6hE5EDQH0ov27lXnQIH737Xa5d5ZIUlr5ktk6/z9aED+nY
	trO4t6/+fNzHMi3IkbyFxY/y4ijzpYqH0uMiECcxLxAD1woMbv5JMKwraqh6mLsRx2Jb7Tqw9ku
	UkmvY14jfKz0syOaCjgOUSME7S9EhYe80p8HVyW1k3w+ZtTbs9Kb4se4UGtux+09soFpOg41fZp
	s010Zem1KH83NyMSTRyiIeHB1GXMjY4kozGanFtxxyzBJinFRW5WSdG3CvUAYEsDNAYB0Z9Kfwt
	wj3C7eyY8sA==
X-Received: by 2002:a05:6122:469b:b0:55b:1a1b:3273 with SMTP id
 71dfb90a1353d-568e47abec3mr2195110e0c.6.1771797374061; Sun, 22 Feb 2026
 13:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Sun, 22 Feb 2026 21:55:54 +0000
X-Gm-Features: AaiRm50d7jLgPyD4kdVKiyrm9CHXFWwo9PDyCMT5qvyZh7PMRFS6zqm3NMkVBvk
Message-ID: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
Subject: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: stable@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.45 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53146-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andresfperez@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22266170855
X-Rspamd-Action: no action

# OVERVIEW

Since kernel v6.16.1, switching from an X11 session to a text VT and back
freezes the display on a ThinkPad P15 Gen 2. The system remains responsive
over SSH; only the display is frozen. Bisecting identified commit
d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
ioctls") as the trigger. Reverting the logic change in that commit
fixes VT switching
on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. Wayla=
nd
compositors (e.g., river and sway) are not affected.

Last good:  v6.15.9
First bad:  v6.16.1
Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
camera for some ioctls

## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
CPU:        Intel Core i7-11800H (Tiger Lake-H)
iGPU:        Intel UHD Graphics (TGL GT1)
dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open)
Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
Firmware:   LENOVO N37ET61W (1.97)
OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manager

## Symptoms and reproduction steps:
1. Boot, start X11 on tty1 (startx).
2. Switch to tty2 (Ctrl+Alt+F2): works.
3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
   - Frozen on the last frame shown before switching away.
   - System is fully responsive over SSH.
   - Other VTs switch normally between each other as long as X11 is
not active on them.
   - Killing X does not recover the display. A reboot is required.

# DEBUG ANALYSIS

On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
configuration mismatches detected by intel_pipe_config_compare:

[drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
  (expected 30, found 24)
[drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
  (expected link 269484/524288, found link 336855/524288)
[drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_stat=
e
  (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
[drm:intel_pipe_config_compare] fastset requirement not met in port_clock
  (expected 270000, found 216000)
[drm:intel_atomic_check] forcing full modeset

On v6.15.9, the same VT switch shows no such messages.
no pipe_config_compare runs, no modeset, no freeze.

# BISECT AND VERIFICATION

The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
before video_ioctl2.

## VT switching verification across kernel versions:

  v6.12.74 arch pkg:   WORKS
  v6.15.9 arch pkg:    WORKS
  v6.15.9 from source: WORKS
  v6.16.1 with d1b618e reverted:     WORKS
  v6.17.9 with PM wrapping restored: WORKS
  v6.18.9 with PM wrapping restored: WORKS

  v6.16.1 from source:  FREEZES
  v6.16.1 arch pkg:     FREEZES
  v6.17.9 arch pkg:     FREEZES
  v6.18.9 from source:  FREEZES
  v6.18.9 arch pkg:     FREEZES

## Things that do not eliminate the freeze

  - module_blacklist=3Duvcvideo on boot
  - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
  - i915.enable_psr=3D0
  - Bypassing intel_vrr_transcoder_enable/disable (no-op)
  - xrandr --output eDP-1 --set "max bpc" 10
  - Xorg config FBDepth 30 (No effect on pipe_bpp)

## Workaround patch

Reverting the optimization from d1b618e to restore the unconditional
uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v=
4l2.c
index 9e4a251eca88..15057b47ec4f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *fi=
le,
  unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
  int ret;

- /* The following IOCTLs need to turn on the camera. */
- switch (converted_cmd) {
- case UVCIOC_CTRL_MAP:
- case UVCIOC_CTRL_QUERY:
- case VIDIOC_G_CTRL:
- case VIDIOC_G_EXT_CTRLS:
- case VIDIOC_G_INPUT:
- case VIDIOC_QUERYCTRL:
- case VIDIOC_QUERYMENU:
- case VIDIOC_QUERY_EXT_CTRL:
- case VIDIOC_S_CTRL:
- case VIDIOC_S_EXT_CTRLS:
- case VIDIOC_S_FMT:
- case VIDIOC_S_INPUT:
- case VIDIOC_S_PARM:
- case VIDIOC_TRY_EXT_CTRLS:
- case VIDIOC_TRY_FMT:
- ret =3D uvc_pm_get(handle->stream->dev);
- if (ret)
- return ret;
- ret =3D video_ioctl2(file, cmd, arg);
- uvc_pm_put(handle->stream->dev);
+ ret =3D uvc_pm_get(handle->stream->dev);
+ if (ret)
  return ret;
- }
-
- /* The other IOCTLs can run with the camera off. */
- return video_ioctl2(file, cmd, arg);
+ ret =3D video_ioctl2(file, cmd, arg);
+ uvc_pm_put(handle->stream->dev);
+ return ret;
 }

 const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {

Andr=C3=A9s

