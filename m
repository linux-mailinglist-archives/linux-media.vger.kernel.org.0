Return-Path: <linux-media+bounces-47608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57325C7CA79
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 09:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2872A4E0369
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 08:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6CB26A0DB;
	Sat, 22 Nov 2025 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g3p/eL4l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CBEBE5E
	for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763799470; cv=none; b=I+LzYJ2p5racnqrZlrzbcvXwEtp67ap3g1Yyz3OcH6m1KCZKRxDkDrgc41YyMYv7LXCy3PleY7bFnTcRXDlibYW2xTxrLy3KqKpi+xnxmmMk9d4E0d1BjUKz7bExZb3lDPuLb9sssBrVKwnFWl1SecEoVY1kK+k0tEwifg6L6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763799470; c=relaxed/simple;
	bh=Q+PVZ4kdar2MdSzjqhlPZzJ+FOfvg1N1s48X+Mw4yuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ua/JSWG4asqdYlvHa2JK3oO7AouTFoKfeNBioA6nldkbbwB8fIT73tcCHPyZQYhVHY8ZcjkVxzUVcl10DSSLR5q6P6FCk8wAlpNJhFLlCQJ+SqkYInWNBaUjxH74bbBEt6ep6+7mXsjkFhN7Sd4rxgOcrLOc1xKk/kMNv70lsJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g3p/eL4l; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5959da48139so2831212e87.1
        for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 00:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763799466; x=1764404266; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRjvFd4wOXEFAtXsTjuMl2JLSZxyZigRdFDkSrC4wl0=;
        b=g3p/eL4lBN6LVTRb8Obee0LNmgtXufi4aDEYzKsDsB4VsanbmA6+iQmsjQRX5fTpzi
         oPwF9A/frl24EAg4Oa09wMF/vFEpOfB+FoU9RUkCUCIL9kf7WfRy0O5JCnkL+KOx0zOe
         K9mH46Jhcwy4FP5R3GZ1o8RVA7jkFXHW97HVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763799466; x=1764404266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRjvFd4wOXEFAtXsTjuMl2JLSZxyZigRdFDkSrC4wl0=;
        b=Y8O15XpvpC3mmVESfNZ/HrWVhc9M6wCDrN0tnFhZwpbqRetQGkaKU8HGNVk1cqqyTi
         TWJ+L64KB4P9uGEah9fFby5RH4Fvr82hpBf2PKTImGbKAWzSMmNg+32EEN0/If68cMSy
         jwL4CjaqcG2jFGbTtbl/pRObXgKLEcnmEkFD27IRrJFuVlv8wEnpgEaNq5+UEygdSMMs
         X9k0cZQIWfQTUW47sdJQuwUruB3cDccLJhzd6g5sjEJyxA6J56MriaD7e4egtErlkCL2
         ajERF9zNnOl07EVic57d5IYNfJ1toy3+9c5awk1VPoCR4yfs4HSRb1W5uWdIwIoe4q+P
         TNeg==
X-Forwarded-Encrypted: i=1; AJvYcCUN3VpOhC2PvL72VKSwNOGEJcVTZohYXB/CF44TvA1uhrg5bRZ2rH+mOFfmwA3v2rF/17d9Xpy2ev+3Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkn5uzmJaAvV3yqobsdM5YLYl5zFJKsZKsYy+a2KE84PJI61+H
	7PuWuEdcn5s5M49ADhjjktKvuB1bKzODf34DiTKu+w0QeGyykRVwOkB6BC8gzszlDvBEIsCFj0r
	zk0nTZA==
X-Gm-Gg: ASbGncsvVpYfalPkBjss3vbm2pPosMg16cr5Ky/oxzNevQ4DEetoYoqlNNuFWYYgTOS
	frkKcPnh1sH4D2cWrBiKJKLpg6UhmVcrvGWvmLO0G0ANMdlcw/PC0yX14XER7kEBTyFDkaIkK29
	9H51DcPl6KRdQ7iLUAkc62lQd+EcNIVA2Bp8eD9bhp2PaLj8o8JNzWu+gYCmOFYmA9EEVBjwA55
	/mzFj7RJ9QHZWm8wny/Ou1w7JMi1zGsynJ8fIR8lO63D6W2jjo3UWpGYzupa9YQEfbEVPWaGdWB
	bVOKIGUFU4q7uufxLA02ZuAV77R+GZoJLJKn2EZXGOzUWI/QsWfpEs9wqS0Yh6a1xe+GcQYsi19
	PtRacmUY2mz23V1XSJNvoLo29/YkGuHoMuSqb1P9TKzEwHZ97fltEzULCpNQ7PhXua8eog7tItV
	wmkcFgBYzTuawcK3XgumSyTZUeJpVXCn5Lpnc42yzTmo+Y3I/z
X-Google-Smtp-Source: AGHT+IEZD4xzBLSxW4Fd77ULHJd6Dj5frVOK+oEYs6SOBM5zYe7RkrQyLoDBAStmqTO4FeU3SDpUAQ==
X-Received: by 2002:a05:6512:3e0a:b0:57d:6fca:f208 with SMTP id 2adb3069b0e04-596a3eefe83mr1874552e87.45.1763799466352;
        Sat, 22 Nov 2025 00:17:46 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75731sm2239964e87.1.2025.11.22.00.17.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 00:17:45 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5958931c9c7so3291469e87.2
        for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 00:17:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoctpbNE/6yWtKhHXXLE5SzVup0zyzUZHRqAvQBfUBkFN6yqvzCtXwMnufyR8Tvb6sJ+Xp8XQ8gvGJgA==@vger.kernel.org
X-Received: by 2002:a05:6512:1395:b0:594:4a5a:34f with SMTP id
 2adb3069b0e04-596a3ebed8bmr1732962e87.18.1763799464636; Sat, 22 Nov 2025
 00:17:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122072558.2604753-1-dengjie03@kylinos.cn>
In-Reply-To: <20251122072558.2604753-1-dengjie03@kylinos.cn>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 22 Nov 2025 09:17:32 +0100
X-Gmail-Original-Message-ID: <CANiDSCuJZU9di2T_zQbk7NVr0--JyPUZkXGur11HKZF8qe3N2Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnvub5ajckWQrkkG_rRUUEm15YZugYA8gfkAYVOfQ2BQSZpErF6YPV6880
Message-ID: <CANiDSCuJZU9di2T_zQbk7NVr0--JyPUZkXGur11HKZF8qe3N2Q@mail.gmail.com>
Subject: Re: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during
 USB device hot-unplug
To: Jie Deng <dengjie03@kylinos.cn>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jie

On Sat, 22 Nov 2025 at 08:26, Jie Deng <dengjie03@kylinos.cn> wrote:
>
> Add safety checks to prevent kernel panic during the race window in
> USB device disconnection.

Can you share the kernel version that you are using?

This patch
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c93d73c9c2cfa7658f7100d201a47c4856746222
Should prevent the race that you are describing.


In your trace you have a reference to uvc_queue_streamoff that was
deleted by that patch

Regards!
>
> The issue occurs in a specific timing window during hot-unplug:
> - usb_disconnect() calls usb_disable_device() which sets
>   dev->actconfig->interface[i] to NULL
> - But dev->actconfig is not yet set to NULL
> - During this window, uvc_video_stop_streaming() calls usb_set_interface()
> - This eventually calls usb_ifnum_to_if() which accesses the already
>   NULL interface[i]->altsetting, causing a kernel panic
> logs:
> [ 9518.891254] Call trace:
> [ 9518.894817]  usb_ifnum_to_if+0x34/0x50
> [ 9518.899681]  usb_set_interface+0x108/0x3c8
> [ 9518.904898]  uvc_video_stop_streaming+0x3c/0x90 [uvcvideo]
> [ 9518.911500]  uvc_stop_streaming+0x24/0x90 [uvcvideo]
> [ 9518.917583]  __vb2_queue_cancel+0x44/0x458 [videobuf2_common]
> [ 9518.924444]  vb2_core_streamoff+0x20/0xb8 [videobuf2_common]
> [ 9518.931221]  vb2_streamoff+0x18/0x60 [videobuf2_v4l2]
> [ 9518.937390]  uvc_queue_streamoff+0x30/0x50 [uvcvideo]
^^^^^^^^


> [ 9518.943557]  uvc_ioctl_streamoff+0x40/0x68 [uvcvideo]
> [ 9518.949724]  v4l_streamoff+0x20/0x28
> [ 9518.954415]  __video_do_ioctl+0x17c/0x3e0
> [ 9518.959540]  video_usercopy+0x1d8/0x558
> [ 9518.964490]  video_ioctl2+0x14/0x1c
> [ 9518.969094]  v4l2_ioctl+0x3c/0x58
> [ 9518.973526]  do_vfs_ioctl+0x374/0x7b0
> [ 9518.978304]  ksys_ioctl+0x78/0xa8
> [ 9518.982734]  sys_ioctl+0xc/0x18
> [ 9518.986991]  __sys_trace_return+0x0/0x4
> [ 9518.991943] Code: eb04005f 54000100 f9400040 91002042 (f9400003)
> [ 9518.999153] ---[ end trace f7c7d3236806d9a4 ]---

