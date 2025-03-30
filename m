Return-Path: <linux-media+bounces-29012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1692A75D3B
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 00:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006AD3A7325
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 22:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A521C1DB356;
	Sun, 30 Mar 2025 22:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiJny3P3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F7F2F37
	for <linux-media@vger.kernel.org>; Sun, 30 Mar 2025 22:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743373776; cv=none; b=VXig5fHvSKv/Sl6vvJyPJ+YXDlZ9q/xn0v0+8qmeO3fOyDMuWeOgcWfHSkoDfOHv1HS9TArUo4GcQHgtV+HHtYz49zJLEpTRT/O86DC7DDwmsGy/ux6bMcfW9GPfh7Jt+IHISnRkNZTjGEGc2dOTtTZX7/uz7nU5PtCp/9jGews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743373776; c=relaxed/simple;
	bh=VQnHGCsmmNnoFTKPkhxGYivU1fObjQoP/SbTmZrrTe4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fSlH5oJ0AWlwk7gXjKDwNMnQ+i+A+MGVK6NHYWT/UdaZNup8G7tb0tj19Pav9e6vnNFiD2HUjxR6DcVCRt4TWnHEo+1WyAUCpdc+K1lavcyUN1x+Yub5Xh6d/d6X8kVfwbwV3/sLRWg6OC9/F1mDF/3VZ9Z8ekFn1hKIeRUYKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiJny3P3; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2c7e5fb8c38so2629050fac.1
        for <linux-media@vger.kernel.org>; Sun, 30 Mar 2025 15:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743373773; x=1743978573; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bPbkeCpYHMoFxztzaRRGgAWUufbGMg/Pm0Vvk00MKlc=;
        b=CiJny3P3cEuqgLExILvYIEjjfsu0CjPsFRruqju5pRd2UYex32hDi432f4HsPgVJVm
         kBD4PGG6aRsVblNu5lOsMxq5uOfTXSf9YUNeZhouwrh67CNPq9BGCVFWgwWWqqkL1VQN
         st4o5a1ZixWW1XWpuMdjpLidqpfSAR9PeArJBu3aSynXyjSPJGHGC3Yx6HSocSuUy+Iq
         XwBLNuLQMexHfC90anFilFZSrqfeJ/7fouSunHfZP7zF9CHuQVkX+YaSbTsEqotDE0uo
         sY9dd9IoDl+qh42lapaz9YZVknHXWcdDhQIMt8fTXy52QPlL0/NrWStL3JGcnFELCRyk
         GY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743373773; x=1743978573;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPbkeCpYHMoFxztzaRRGgAWUufbGMg/Pm0Vvk00MKlc=;
        b=K4qTe6rHS0Za6joSMYfh5Sook6YllUAYJ3oXTiS4TWmSBm2qQsZFJg1JWo1EFCS0oW
         N+lDbuS6Sdi/Tc63JC8mBkL+RHELfS4V5Po6YyqzBMAn97Z/jupvhgJE/k9OJORZHp/W
         ufz1yAFy4Ci6KlIbUY5Po05WWWftH+NhZZp/eo7Uf8Vqrs3RqvICNv0M2L1yOEZb2CNN
         JliAF7gx5UsRyCURK6QIZgoR8EivFHtvbCGJ0WF7WDG4O1e9x6+JT8eFPHSDfMQb3GWe
         TZhxRppN3yFChA0Qu6wcfnkoAwVtVj+H8/D9jycX3SeIpyuVvqeYkMyHGHfI4IcFZL5n
         9nqg==
X-Gm-Message-State: AOJu0Yxwg1rlswmIpEJPiGA8jVKdl3hV7FFVLKNcWodebfvyIVWzr7Qg
	5mCYh4eU/lA6c3XPsesMvLnffPQnXymmoP931S7oWYVEgg7u4p2HJqyw0NvsuAQckarEp9CqPeh
	iMO3pPzOojmCVt9wIToOLtZZS4cUMvele
X-Gm-Gg: ASbGnctK86HjE3+sYpREWxebgeWWsJ3tMjt93fZqB7p0ozbH58d4JnfkN0+vkeAYbRV
	rpPhRPGf6wNoRdMOLtMATVPGKLZkjLZm4RIHWau5Fv/3OPi5oSiowlvt+flR3sjksslja4YZxMb
	raorOE5wbIF45c0+WeAvv+YkWI5lo=
X-Google-Smtp-Source: AGHT+IHnLpO+eetPOjgsmcohSey9kZpuOUGFxqSHn39Opwn70S3WEwbfqqegaktxZPNQD8LjrsuhOK1si2bM1aN2JrQ=
X-Received: by 2002:a05:6870:7e11:b0:2c2:71f:2c0b with SMTP id
 586e51a60fabf-2cbcf501ee3mr4120878fac.11.1743373773179; Sun, 30 Mar 2025
 15:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Teo Tei <teo8976@gmail.com>
Date: Mon, 31 Mar 2025 00:29:22 +0200
X-Gm-Features: AQ5f1JqSNCSFIai7-AxVqISKOURAn2sYWTKDlYI0_evDsHM8TEvNGz6fqTNHym8
Message-ID: <CAJPaPmx0qVURX-SgyMN7Ddh=9CpEx6bfcja=LSP_FEmNqHQkog@mail.gmail.com>
Subject: v4l2-ctl bug: cannot list devices after disconnecting device 0
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I was unable to find a bug tracker for v4l2-utils, so I hope this is
the right place for reporting bugs.

My laptop has a built-in webcam that apparently is USB, and I have an
external one that I connect through a USB A port.
If I boot with the external camera already plugged, for whatever
reason the external one gets device ID /dev/device0 and the internal
one gets /dev/device2.
So, when I run v4l2-ctl --list-devices, I get (comments added):
```
WC250 Series BoF HD Webcam USB: (usb-0000:00:14.0-3):  # <<< external cam
       /dev/video0
       /dev/video1
       /dev/media0

USB2.0 HD UVC WebCam: USB2.0 HD (usb-0000:00:14.0-9): # <<< built-in cam
       /dev/video2
       /dev/video3
       /dev/media1
```

Then, if I disconnect the external one and try to run --list-devices
again, I get this error:
```
Cannot open device /dev/video0, exiting.
```
I'm pretty sure this is a bug, otherwise I can't see what I'm supposed to do.
I don't care whether the device IDs get reassigned or not when I
disconnect a device, --list-devices should always be able to list the
ones that are available.

For comparison, if I boot with the external camera disconnected and
_then_ I connect it, and run `v4l2-ctl --list-devices`, I get
something like this (I'm quoting from memory because I don't want to
reboot now):
```
USB2.0 HD UVC WebCam: USB2.0 HD (usb-0000:00:14.0-9):  # <<< built-in cam
       /dev/video0
       /dev/video1
       /dev/media0

WC250 Series BoF HD Webcam USB: (usb-0000:00:14.0-3):  # <<< external cam
       /dev/video2
       /dev/video3
       /dev/media1
```

and if I disconnect the external one, and re-run --list-devices,
everything works fine and I get this:
```
USB2.0 HD UVC WebCam: USB2.0 HD (usb-0000:00:14.0-9):  # <<< built-in cam
       /dev/video0
       /dev/video1
       /dev/media0
```
I don't get an error about device2 in this case (it wouldn't be a big
deal if I did, as it would not prevent me from listing device 0 in
this case).

