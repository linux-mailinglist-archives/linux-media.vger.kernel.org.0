Return-Path: <linux-media+bounces-50340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF6D0D7EB
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 16:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CFB4D3008CA4
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 15:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602D02FE05D;
	Sat, 10 Jan 2026 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mF+qa6BU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3525A33F
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057597; cv=none; b=Eb9UDdOk9Y7su8soEsRHwH3qyPygU1/EJbAZhie9jrgyiAB9olLGe1DQXjYXQRRwdfK7Z0BV30orWvv2cHSUbNVLLcUNldTYlYbAnWjQ3tUa4Yut2NWV5tXrbA8oALI/3M+whtC90HI0wTsGD7dYwMAMGRMTVIbDGUG43efdleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057597; c=relaxed/simple;
	bh=WQvn+u+Jd2MUC1UEDqAxOjgH6JRsCV8dAvYV5oi1MsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGYSw92fbPDPcc1828tvpTeEpvEqLIQb/htgVyRhn+ZZ7DWPgyhDAh528FrdBhHYSWoSuQtrl3reIpGOcvk19lbWIKAFpqnoLrcTATLQC8VAT5ZyBUtLSzBCYeVhs90VcwFL4jwlVg6xYzy8/WMmiDdwffOV/NqXOOrtB7IS1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mF+qa6BU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c565b888dso4428665a91.0
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057596; x=1768662396; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UGkBqQ3dEyH02b9Cz6V2aAVzB1sEUkHSYsagBfz+8BQ=;
        b=mF+qa6BU1ujStg0lEkGcbm5gem5tzKZH4/Si+Nk3wK5yWKsj1cw5YsES7jUBiNcyuK
         CX/PnAy3vorPN4io7gjqdBYs8fAGjcfiyXcRhUaPMz6EluL7qwuU47OxZUBnoJmLzUD3
         9926Xk7OjAyF6b526C7hljqXmohs0yv/q9LiREIH5qvQ0rSFRFw9XG3bNJHPPlW+CvUm
         GTEsXp6d/p+ftoy+Duh8Q5e7e6lciIaJCeCTn01W9iSOkzSr+cFGF7sGS4jIv60CbY6c
         yTA+34YOkXTQf3isoa10Z/ORAuMpdoiazed0tKB3wIgWELb5VYxDVFnS93kk53ZMiHtx
         PEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057596; x=1768662396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGkBqQ3dEyH02b9Cz6V2aAVzB1sEUkHSYsagBfz+8BQ=;
        b=xBMZsaKxcd9OmvdKTTzcMXj3M3JZhW8Gfc4yekPG0RcMepiPFAnNga62IAxa9jHQbZ
         OCs7I0LNXA4+IRrsvat3xMXxDZw5nkTta3ou9WPPUzhPmBb4wbXZzoHray/IM1fT4rdk
         Ri94kkWoaGsPFcjbrFOr3abMehRCJag0sI7CKJhFrg/2umffIiAt/yHIVclnsIL00ZF2
         Py3QERa5KuUnPuURxpxEgGxPgg8596XU0vp1dqWops4NKYIrth1+TaThTLP13T5UGfl3
         h5fkaoecuXLZ/BWxT/0BM54YL1Spdo9LtWEY9+undCvR3xVhpZAIdYXZqWEeNURXcyEw
         PPCg==
X-Forwarded-Encrypted: i=1; AJvYcCXyz6ig5CDkyZ5NKsz11gXSdw3OwapWFWEds4PT46zS+TRP48+UGhOXvlxmHy0TvZouPDRmFe9Ew4mD3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymp3dfpCeRhP4h3vo22j47umozP0Hyl85pTa/imlGJDFMf9zT8
	e8yn6vZBcdoYJsqrm9GLTfWUc10N8TMLhPou7boEDpMv64FvxUaNOi7iWuYNw5xXOSQgcAvUOud
	zWH2iWulTk5+PjeUOPuvMmtcQi3PLCkg=
X-Gm-Gg: AY/fxX4Pd//fvQp4KPktfTweS9aCu7MJWdXoR9Jvz14cvgZB3lqc5iiRd1qSwjyLT27
	CCuTPJafmOs3NAwHpxmdYvSL1lqRKGXHO8IANZI5raVG5jXhDEFeqakiz/pUyHmKbg9CQrCcyYX
	6A7q+OQYtp1e1uUyPn9w6cwo4rEfdFcB5WttDJ4HavwvOIsxOeNW43SUb3oAqX59+Bmh19dQyBt
	IuIVkegwKEgTRt+gHs++kMPgPDeQzvxM3leQ462Vbqngjn9JKgI5sRagsr9DJnRl2HrbBeFk199
	C/vB7aEa
X-Google-Smtp-Source: AGHT+IFzQQ/5f5DJe4nBElHnSw7Mgu6aLxPMI120DA2DbnwxqPMk6MVlVdDhGW69nPu5bRwxBN71E4Utx4hB5sJTCnk=
X-Received: by 2002:a17:90b:3b8f:b0:339:d1f0:c740 with SMTP id
 98e67ed59e1d1-34f68b83b12mr12282185a91.1.1768057595938; Sat, 10 Jan 2026
 07:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110145829.1274298-1-aha310510@gmail.com>
In-Reply-To: <20260110145829.1274298-1-aha310510@gmail.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Sun, 11 Jan 2026 00:06:34 +0900
X-Gm-Features: AQt7F2rrBoH9FkuYqOWIJsvvsgVyWVOjjSL1GKk8EjPCgKiGJlK03oV7Mi8JbCI
Message-ID: <CAO9qdTGc8A0ge_pfRavAQNpsnjoUXz4-Sm_3dE2oVX7CEpmTUg@mail.gmail.com>
Subject: Re: [PATCH v3] media: hackrf: fix to not free memory after the device
 is registered in hackrf_probe()
To: mchehab@kernel.org
Cc: crope@iki.fi, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com, 
	syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com, 
	Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Jeongjun Park <aha310510@gmail.com> wrote:
>
> In hackrf driver, the following race condition occurs:
> ```
>                 CPU0                                            CPU1
> hackrf_probe()
>   kzalloc(); // alloc hackrf_dev
>   ....
>   v4l2_device_register();
>   ....
>                                                 fd = sys_open("/path/to/dev"); // open hackrf fd
>                                                 ....
>   v4l2_device_unregister();
>   ....
>   kfree(); // free hackrf_dev
>   ....
>                                                 sys_ioctl(fd, ...);
>                                                   v4l2_ioctl();
>                                                     video_is_registered() // UAF!!
>                                                 ....
>                                                 sys_close(fd);
>                                                   v4l2_release() // UAF!!
>                                                     hackrf_video_release()
>                                                       kfree(); // DFB!!
> ```
>
> When a V4L2 or video device is unregistered, the device node is removed so
> new open() calls are blocked.
>
> However, file descriptors that are already open-and any in-flight I/O-do
> not terminate immediately; they remain valid until the last reference is
> dropped and the driver's release() is invoked.
>
> Therefore, freeing device memory on the error path after hackrf_probe()
> has registered dev it will lead to a race to use-after-free vuln, since
> those already-open handles haven't been released yet.
>
> And since release() free memory too, race to use-after-free and
> double-free vuln occur.
>
> To prevent this, if device is registered from probe(), it should be
> modified to free memory only through release() rather than calling
> kfree() directly.
>
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6ffd76b5405c006a46b7
> Reported-by: syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f1b20958f93d2d250727
> Fixes: 8bc4a9ed8504 ("[media] hackrf: add support for transmitter")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---

Cc: Hans Verkuil <hverkuil+cisco@kernel.org>

