Return-Path: <linux-media+bounces-53154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAPpBrMLnGlL/QMAu9opvQ
	(envelope-from <linux-media+bounces-53154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:11:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D8172F58
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 085033029E45
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 08:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A617D34D390;
	Mon, 23 Feb 2026 08:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gN5sxjFt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A570A34CFAE
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771834268; cv=none; b=YV/I13vUum1CH6EtHegRJ0rN4rgqJAIQBmNyEw9CUJ/Mqu6hZVek1BACDvtpaaUSWNI3fQMUh7EWZtG+svf8vVTjcolkQfov1ngtXcO5Fl7EMmr/Hfd2KX/zLfo7dooacrGpqVkE9k370Gt3Zy6f1b9M0KMPoE4VTthub1ZFnWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771834268; c=relaxed/simple;
	bh=QLIG/cvAGKHL/QsPZAk+8/0vWlzhWoHy3RyVHMRjPY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUVhTttF+r6/ee+s7tGB0RpA+Njks/sgN+Vi8u/S762V5gnL17Zd7sjPOjQkPu3gapsrTqwNiIGkJ6du3agyDjBhQkJ7lU7tC9VCwEt24NO3n96YYCSR3dnE9MZ+mGo9UB9ea3hF18FEWqmxDeeIkffel17QEcFuRvsaZVf5JBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gN5sxjFt; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9047e72201so581509666b.2
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 00:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771834264; x=1772439064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPcLFGqvXQ/TrcZMbc9zEuLscnPpwUEKK1FNGlp3euE=;
        b=gN5sxjFtWbIVi2Q5Q11QttZo1KKAjedKe32bHdDSHtJ/zHm/tuJoblxJfJEPw6EX6+
         BZ9uXHWwqXezbueEWS57r5cRpc4rjDW1l+ByLKKYri3Vd5NJdv625IfIC7WTogoph03b
         tCkZBIQwUCz5GDpuRmU/vuI91YzUtJw+l1miY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771834264; x=1772439064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPcLFGqvXQ/TrcZMbc9zEuLscnPpwUEKK1FNGlp3euE=;
        b=bypc2NT3u8sp/oFy8wfQUOdNv5FGgmjhVszYRRJXIBo3B0bVTbm4qcjZzSY7gmdS23
         /lUIaq8e181s0+g6X15NUCU9l14KMO6Y1PuORyRaGr2X0n++YgXH6OQuAs96IUGmgCWi
         QTgZKE9AnHgnt4cy4uU+D7PwzkcXT3X+XArA9zf3zTz9mkZwhzkjX1EIylR5dBFzDDZD
         16QBrc0dt8TEU2nYaT2pzWlDT+nKOt410UTuOmLRmi4JHmqyceFmj12PNrvZ/8bVcVBV
         fo+VO62cW5eN5selBQlxdDM8oz1asd0sE07TDUOYXKhRg8ocC7kNTTzD6fJ4s6fyVIl0
         uGfg==
X-Forwarded-Encrypted: i=1; AJvYcCXzlLYayxyT/Z5A2W+NnP0DPMYotKoDhRimb5mT9RgQdpfHkm8+X0fPF8eR9k71C+9y/MDDPvZ9FUDHAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKBC8mLWBXcc6UbPI+BcQR0Q+PP9qJdTBzfyJVw2FkU/XOC9fr
	QAAtYmeCwJFHPH/QEtM/Khw1PqFoqIGl5xMyPkc98xJncH1L0xKVmCqrpL+3HFGPLQ+2tcz3FVq
	leS0DSg==
X-Gm-Gg: AZuq6aIpaNgwLnx23oJLg/3vmBgEbwDxtpAZWokDzu3M1R+POHmev9pJd1+RF9lb2b4
	p+UnmC4dkxBo4AH9sTEx0ByAwbHW6M6mOnWACqf83rA59KHkVCwEJWFwEgumAFka98+teKrTOan
	VNPHzf6ka0hjHPNFwFmjU18k2fa0IeWmdhef7WSKHaOuJhl60ELwokF2bxkzdTaqaqcHv3n3E5S
	AlQ88JEvgRS0KeDHYv9uxrPU6hhV1S2gFf4OFhskeq/AAleOGDbtcM4AOecmTFqemIqZWkghbzv
	dTjCmcu/w/tFziuKvj1fv2SjpYNRJcQNdmb2YMjJ4iu/VGlYng+yVgqopH4X+UbtC/JHgUoa7dX
	YtVvMzF7DMkdCKORxdWha9una/5mdcppXEcB9OCuuz15J1cS5TwH8n0UMSi+6ozIR+VKXOxxjMb
	rmLygNRv7I5a73oB3gwUNYLMLWHe/Hc6b4R4VaDiK3HEat4HKxLae1VUVCo7iD
X-Received: by 2002:a17:907:1c02:b0:b87:1e94:ef6a with SMTP id a640c23a62f3a-b9081b3b135mr491567266b.47.1771834264217;
        Mon, 23 Feb 2026 00:11:04 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5d47fsm291000866b.11.2026.02.23.00.11.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 00:11:03 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b884d5c787bso660385566b.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 00:11:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVVzUv7UFVd384evi1OmT+QtBB5UuQ1GG9P68bSHENcSWK9A3JmVAo4pkfCo0BIFhBPON+8PiHOKh2lw==@vger.kernel.org
X-Received: by 2002:a17:907:94cc:b0:b87:12d2:fa1a with SMTP id
 a640c23a62f3a-b908191f1d6mr445251466b.12.1771834262096; Mon, 23 Feb 2026
 00:11:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
In-Reply-To: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Feb 2026 09:10:49 +0100
X-Gmail-Original-Message-ID: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
X-Gm-Features: AaiRm53F0LIMOe6xezXE30KkDM_p2uBY1AB8eOErFcvfTTb2PhOgsWveImx1C0M
Message-ID: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53154-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: B95D8172F58
X-Rspamd-Action: no action

Hi Andr=C3=A9s

Thanks for doing the bisecting

On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gmail.=
com> wrote:
>
> # OVERVIEW
>
> Since kernel v6.16.1, switching from an X11 session to a text VT and back
> freezes the display on a ThinkPad P15 Gen 2. The system remains responsiv=
e
> over SSH; only the display is frozen. Bisecting identified commit
> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> ioctls") as the trigger. Reverting the logic change in that commit
> fixes VT switching
> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. Way=
land
> compositors (e.g., river and sway) are not affected.
>
> Last good:  v6.15.9
> First bad:  v6.16.1
> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> camera for some ioctls
>
> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> CPU:        Intel Core i7-11800H (Tiger Lake-H)
> iGPU:        Intel UHD Graphics (TGL GT1)
> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open=
)
> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> Firmware:   LENOVO N37ET61W (1.97)
> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manage=
r
>
> ## Symptoms and reproduction steps:
> 1. Boot, start X11 on tty1 (startx).
> 2. Switch to tty2 (Ctrl+Alt+F2): works.
> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
>    - Frozen on the last frame shown before switching away.
>    - System is fully responsive over SSH.
>    - Other VTs switch normally between each other as long as X11 is
> not active on them.
>    - Killing X does not recover the display. A reboot is required.
>
> # DEBUG ANALYSIS
>
> On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
> configuration mismatches detected by intel_pipe_config_compare:
>
> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
>   (expected 30, found 24)
> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
>   (expected link 269484/524288, found link 336855/524288)
> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_st=
ate
>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> [drm:intel_pipe_config_compare] fastset requirement not met in port_clock
>   (expected 270000, found 216000)
> [drm:intel_atomic_check] forcing full modeset
>
> On v6.15.9, the same VT switch shows no such messages.
> no pipe_config_compare runs, no modeset, no freeze.
>
> # BISECT AND VERIFICATION
>
> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
> before video_ioctl2.
>
> ## VT switching verification across kernel versions:
>
>   v6.12.74 arch pkg:   WORKS
>   v6.15.9 arch pkg:    WORKS
>   v6.15.9 from source: WORKS
>   v6.16.1 with d1b618e reverted:     WORKS
>   v6.17.9 with PM wrapping restored: WORKS
>   v6.18.9 with PM wrapping restored: WORKS
>
>   v6.16.1 from source:  FREEZES
>   v6.16.1 arch pkg:     FREEZES
>   v6.17.9 arch pkg:     FREEZES
>   v6.18.9 from source:  FREEZES
>   v6.18.9 arch pkg:     FREEZES
>
> ## Things that do not eliminate the freeze
>
>   - module_blacklist=3Duvcvideo on boot
>   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)

This is puzzling me a bit... You are saying that if you do not build
the uvc driver, the freeze is still happening?

Am I understanding this correctly?

>   - i915.enable_psr=3D0
>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
>   - xrandr --output eDP-1 --set "max bpc" 10
>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
>
> ## Workaround patch
>
> Reverting the optimization from d1b618e to restore the unconditional
> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc=
_v4l2.c
> index 9e4a251eca88..15057b47ec4f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *=
file,
>   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
>   int ret;
>
> - /* The following IOCTLs need to turn on the camera. */
> - switch (converted_cmd) {
> - case UVCIOC_CTRL_MAP:
> - case UVCIOC_CTRL_QUERY:
> - case VIDIOC_G_CTRL:
> - case VIDIOC_G_EXT_CTRLS:
> - case VIDIOC_G_INPUT:
> - case VIDIOC_QUERYCTRL:
> - case VIDIOC_QUERYMENU:
> - case VIDIOC_QUERY_EXT_CTRL:
> - case VIDIOC_S_CTRL:
> - case VIDIOC_S_EXT_CTRLS:
> - case VIDIOC_S_FMT:
> - case VIDIOC_S_INPUT:
> - case VIDIOC_S_PARM:
> - case VIDIOC_TRY_EXT_CTRLS:
> - case VIDIOC_TRY_FMT:
> - ret =3D uvc_pm_get(handle->stream->dev);
> - if (ret)
> - return ret;
> - ret =3D video_ioctl2(file, cmd, arg);
> - uvc_pm_put(handle->stream->dev);
> + ret =3D uvc_pm_get(handle->stream->dev);
> + if (ret)
>   return ret;
> - }
> -
> - /* The other IOCTLs can run with the camera off. */
> - return video_ioctl2(file, cmd, arg);
> + ret =3D video_ioctl2(file, cmd, arg);
> + uvc_pm_put(handle->stream->dev);
> + return ret;
>  }
>
>  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
>
> Andr=C3=A9s
>


--=20
Ricardo Ribalda

