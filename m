Return-Path: <linux-media+bounces-61805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGnJMINeCGrclQMAu9opvQ
	(envelope-from <linux-media+bounces-61805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 14:09:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD455BAA1
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 14:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7D8E301D30D
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 12:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BD23D669F;
	Sat, 16 May 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUMu2dqp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7043D669E
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933338; cv=pass; b=Evthkq/ayyyrfTEOJhAkgjLqDgROAwY1zliqhaGDlM/LEtorT++Vl2CIkD/2yeEJI27Pbr5ImKfjdEXTRPsf4wv4bTq/B9wr2jcD7eC/cRmK1Prw0IVi3q7ueNb7qx01isBaPVmjguHpgMjK7e9gISXGsrrsBzQ199pByl5hBqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933338; c=relaxed/simple;
	bh=UnZHnr16Ldb8b7+gY3OvT6xRffrGcqKrfxvcPgb6SRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leYIX4AN5Od6Hosngb6GORxEJ9doVWkW3BQ+ndwW4c2hzt22bs2SyRCM928ogglT5SrXPfggsPxDrjCQbCuIZy3KBR5MeEvod66heZcsvh8vXvxcjy6zyUtJc4gOaD7YjUJzfFo4IIXlPxwQ2xaOfj5gkqaDOf8FVLu1jzVQTIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUMu2dqp; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65c396d3b36so1152895d50.0
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 05:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778933335; cv=none;
        d=google.com; s=arc-20240605;
        b=QhuCCeSOe2O5OxB7GaA0AImyr1iR1hHQjPUsuZ4nBOij87eZgx1wU68pnYsngewvk7
         Ak2DrtxCq1QjaE0CYeW8vd6n9YiOlfSvKWAOcWCv2tMk5Blxnvu2AG3OaMDEeMqMFh1+
         MS/wtzH0Qo1xpe/lGQCS2sf1BC9h7LFhtDgyXPFFJiI1GtEeO+OsdY7k9qhJC+x/w3iw
         WNFJcWFE4GkVo+s8749SFDhZooKiERfH7Xp7mwEP63s1xgXQgJ9G53uZkO973F0AzFtH
         o0IY+KgbsvT5UiswxtR1Df4NXBFZ+AidGLw9bYUuLuSAJR+aj498gExoALBWwa9eYRbP
         rpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXKN0MkYU+n3rTPZHnEN2kaQtyY3hF+mGwCAYWY3s6g=;
        fh=SVhFwmMYYcLTBV4DRrnwhkHe3ApaqQMQuVn6R9jU9oM=;
        b=BlPSFt+yMWn8BQn0fq5jK0kvWzwvWpgMLRG56xeFxVZUyT5XA2zcTwFGG+FyZRgNfb
         q/WTQrZx2/HBYCpg7KquHeu72t83XmkwprBV9VTd4JaJObDzbT3BmazSSL3iZEqkZIuT
         SO1DwY+BHqKbxu37c0KtMxxEF55/JmK5CDrR0tUvNDkwfsf4QQRWw9IKaAl45+FVffQX
         ddaG0fGQiQaY0KF5n6jUXx+uiw3IKc0cEcoNUYt6aCrQXyQpeNISAQmCW0pjCu46RhvZ
         mOEvUgmyX+KCj6kgMuy8/56jewL4RgULjk0RRpZqcdBgOQ/SvhtfgJZ+vXC8yPdp7kU8
         sBag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778933335; x=1779538135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXKN0MkYU+n3rTPZHnEN2kaQtyY3hF+mGwCAYWY3s6g=;
        b=VUMu2dqpcYG/XSzkhzXBHSbpFNtoHjl/UpICA4xG/acFuVpLV/UR5+FSRQIku0OFXu
         kFs9o4jDLrtti2Y8bJ+f9Exf37dHstAKNSr7B3UJc7ZyMUqvtibf3KPnlSgVgUVWFZMI
         KmTfzI9A4mWyLV4HYfqOP98okxgISzjeiPl/HiEhQG+TUJ+NeeBLn4Jiavj55gJQPxqW
         bVmHOiTMOgVtAJ8bCe7Wafl9PPzAvBLVhn4Ph/xazGLbFd3CwYLRNOv4LxxJfy2NaPme
         Haztj0m/AZ/3LcncGduWOAFvZ6SOlGkCHPO8xWz5wT20xZ0bbR4GXJy5/ZYE/QdDlSPz
         kI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778933335; x=1779538135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXKN0MkYU+n3rTPZHnEN2kaQtyY3hF+mGwCAYWY3s6g=;
        b=OOeeIH28/DmCV7NlytUaWuvOdOjU5nBro2tKBevEfRNwHi3OEu70sKWLdtXLaAJRYk
         Bs8CvHDNI8JT00TF3eNReOtWHPCQcfoSwcy4d50855wJ4kODRr0Gpn7K/0oLZVZm3lEV
         uQ6ABaUnj2OBVVeoMEJEa2JjxhsATuXiSqKMqO/uPPLTJzWeaiEraX+c3PLqnwvZEixP
         CtpRFtirVU1vJYU0Rq+0DMm7CApuJFFvAM7v4xfJXul2HhdnFCzsEqmnQrLHHavvLbNM
         LOQNp2zL9XRaLeCs14eWaOOoKp5xmHfiy9s+u4JvF2iYfTQXs5emZUGubaJ/juFSLcgg
         aR3Q==
X-Forwarded-Encrypted: i=1; AFNElJ86aMcJbA89N+aIV0iF64M8ebgzz8rVTGw9zNzjCC5miqUVqPcVjJDTBnHWleQ108JoQ3boz5KTZA+gdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd8/miEfXnXgetA01e5p+JGqPSNnnh+swLCWHo/uoszajL81id
	62BRq9emDJY93KWdwQqItcT/EyrMh3LA6t2CKCOCucH9tHoUWG6TnQ4XQZI53H2Tu2soVCUzH8a
	LF1QsmTfC7ZhAHwgDSkEYoKD+TZUMh5MUZYiz
X-Gm-Gg: Acq92OEfJl21L35bAFspwBHbedf+TCEYMQZLOJYNmp0ExMZeciKI0asq6teGFIdVP7J
	iWpfbSnP/pXGzVzr7chNeFiDazvkyMauLRUv+mwpwxv0P3gfVmuSUBRViVe19gMkXP/uRVVP3GJ
	Cp4tjNlCyOfGlQUYL8N1CF+dMHGoUAPHstrf8uUsQUANnVcoMaWHgNVZZKp762pK3b/AocpmeQQ
	+ttpUnQUwN+a3DrHwvlyoyTfN95BYow9juWnEuX2+UJ1ud+9HZOAPFHHois2qEWGviWTmxOS0lw
	V0exzNsy/DlZoNwwp8lD1O+3SQgrhkFEtcTAOdrLNLYflYAuzwFn7ZQqPIg=
X-Received: by 2002:a53:d015:0:b0:651:c29e:f0b0 with SMTP id
 956f58d0204a3-65e22701655mr7274124d50.4.1778933335045; Sat, 16 May 2026
 05:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <20260516-jorth-syncobj-v1-12-88ede9d98a81@gmail.com> <2026051652-pork-omission-b762@gregkh>
In-Reply-To: <2026051652-pork-omission-b762@gregkh>
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 14:08:44 +0200
X-Gm-Features: AVHnY4LliAXwIRGSinLMXXpk0k3pE4bCMnvt3uyz5Wz7sqrJHyVxIP5cb_UqBE8
Message-ID: <CAHijbEU3+3ZoxTuUCkJx=a75_yNxt2Nn3UKU7gbS-Xf1bPqBUg@mail.gmail.com>
Subject: Re: [PATCH 12/12] misc/syncobj: add new device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 31DD455BAA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61805-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 1:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, May 16, 2026 at 01:06:15PM +0200, Julian Orth wrote:
> > This device makes the DRM_IOCTL_SYNCOBJ_* ioctls available via a
> > dedicated device. This allows applications to use syncobjs without
> > having to open device nodes in /dev/dri, on systems that don't have any
> > such nodes, or on systems whose devices don't support the
> > DRIVER_SYNCOBJ_TIMELINE feature.
> >
> > Wayland uses syncobjs as its buffer synchronization mechanism. Most
> > compositors use the DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a pure
> > CPU wait for syncobj point. DRM devices are not involved in this proces=
s
> > except insofar that a DRM device needs to be used to access the ioctl.
> >
> > Similarly, a software-rendered client might perform rendering on a
> > dedicated thread and use the wayland syncobj protocol to submit frames
> > before they finish rendering. Again, this does not involve DRM devices
> > except insofar ... as above.
> >
> > As an added benefit, this device removes the need to translate between
> > file descriptors and handles.
> >
> > Signed-off-by: Julian Orth <ju.orth@gmail.com>
> > ---
> >  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
> >  drivers/misc/Kconfig                               |  10 +
> >  drivers/misc/Makefile                              |   1 +
> >  drivers/misc/syncobj.c                             | 404 +++++++++++++=
++++++++
> >  include/uapi/linux/syncobj.h                       |  75 ++++
> >  5 files changed, 491 insertions(+)
>
> As this is a bunch of user-facing code, why not do this in rust to at
> least get some semblance of proper parsing of user data sanity?  Or is
> the api to the drm layer just to complex for that at the moment?

I didn't consider using rust because I'm not familiar with rust in the kern=
el.

But even if I had considered it, I probably would not have done it
because drm_syncobj currently has no rust bindings. The driver as-is
is just a thin layer around drm_syncobj.c so if drm_syncobj gains rust
bindings it should be easy to convert the driver.

>
> Just curious, not a criticism of this in C at all.
>
> thanks,
>
> greg k-h

