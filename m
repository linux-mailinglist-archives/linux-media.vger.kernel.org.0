Return-Path: <linux-media+bounces-33224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B083AC1BC6
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 07:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C2A04E3C4F
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 05:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263BD22541F;
	Fri, 23 May 2025 05:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZxRZPTP3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82F22DCBE6
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 05:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747977701; cv=none; b=N+D/DhSDdhzxQ528oNH+zrjKVL6z0JfTxV8wkwkZzqPHb9JDTEj8MJfFOnHoSLJBq7qyHkh7MFk0Z54T6dRKdoOxa1ovoveReik5FrncGfhGR1pNejqKuNCCClBPB5g6EUBhowNTqMbuycCdNCB9DzLZDGw4Q43OCfgPD8nNNws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747977701; c=relaxed/simple;
	bh=1XaKlxFq3LcO0C0H1z1jUvbx3gvMbLvHbJSSMxMwTjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8uWmnGKYeQBaJfwkxvE+kUT4xxy57y5/Q7tbeAbLFoKPxoDgpDDfeVO2jQUvttuEim1M1mm/4DhbQckl5DB4gozbSGQsXqkf34T7TgyLkGlWjvyivxlrPtg+ludcGVx+/8JtEC+knTmai5RZmXMH793JSUjoODl/MpgXJJbAs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZxRZPTP3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acbb85ce788so1709980566b.3
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747977698; x=1748582498; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FQeCqANX1ggEdGfmr4oIV52QyNc90KVYuZrjHaO5Wxg=;
        b=ZxRZPTP3Pf2cSQys2ZAqSKfkR0rEvwQp1jIhy/3ZPu6lsy7VrjKdlaDCEWM4XqgFqm
         yJ/I8SQy6RlofoGc5RicbNtUZK+6SOuUMRQ9Zm/qZctgZItr/NKh0AK/evTn3orogenP
         Z0If6mUfgXwjWYsX20RcHq7HTGvrkT/KDNVsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747977698; x=1748582498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQeCqANX1ggEdGfmr4oIV52QyNc90KVYuZrjHaO5Wxg=;
        b=UT5R6pj+0WP+6aDOit3TAOBySLJfMdrAFh47EVTwRmh6bh9hheP5PegJJ0Qv0b9WwF
         6/xMFzo1nekKie6lagVLE9naxdrozi+15FxbrjF3XTYdKDGS8pQClfMQjBq/a2zQvae9
         xOX+7zOOuzTX81vLdv1a4E8mh/6KI2fTg7mSj8YXUfpnfFD8kmB5lTe/whb4lVYEc6JF
         Ph2L0TdVze7mwbLMsEm5sx/9q9aE5g0GX5LWKWg0/DjuI9chOjKv90YT81p7lvOVtMZW
         cpotmAWlWfq4MB502tpUeleVUU5lhKzzaCzxsX7UveT9OhiJMZfelTOSdVYWfmhC5oCs
         mdKQ==
X-Gm-Message-State: AOJu0YyYPhJUjlDdJmYlQkSwpcLlii70Uj+6JruVCskvvVkPse7ObMT9
	KMyYHy3OYemfs7xMAWO6y0hL8sRXVq28ghSpULpJpTKN0azHNe4P9YQjmOC+4wfhM+qb4UDjlko
	n9R8GNg==
X-Gm-Gg: ASbGncszxlVj/tB3m7eaDUYYa3/3mWuziX9MzzIZ5yLP/8u8/qZpxkiqG8dLY3F8ZN2
	Fq/oL86EEkhtDsCyC9MS0du/zawwLrZ+To7rK/P7mOg+MlKPQ6sAjLtVQP9M5/DyXZql4ENTtM6
	OizNfUkezfpUYyGMVWeHX/C1GVTqvYxaOCiAU6UBLLD+3jN5olVR27y1iWPFGj05QOSM+8sWheo
	FtK3O3iEEgOn0dH0FN0liBPD3niYwA/+mPJQRVxzIlDYkusOsH4yDYq4vU/WVMK94OVSmaV0Yy4
	LGwXmMw43D9vafaerH29u4k+ysr9VHmu9wwPXKOVOKH9MHgoxIxN+ZfGOvlCe1jHe7N3NlFpuYa
	pcfatf0gAtV3p6A==
X-Google-Smtp-Source: AGHT+IEwLyMJ4Cc6tfS7GbMCfmGN1rcPlEMve/0HwMQdvJ1Bcu2UzttTPOxDm1dpQaH3tIXGpggqIg==
X-Received: by 2002:a17:907:97ca:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad52d49e2c7mr2542975866b.13.1747977697757;
        Thu, 22 May 2025 22:21:37 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4cadc5sm1162184566b.167.2025.05.22.22.21.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 22:21:37 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad1b94382b8so1588967066b.0
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 22:21:37 -0700 (PDT)
X-Received: by 2002:a05:6512:428b:b0:54f:c074:869a with SMTP id
 2adb3069b0e04-550e72463admr7176236e87.45.1747977686106; Thu, 22 May 2025
 22:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOzCab90jOw9Euh84T301WOxh1R_TJse+AbNupYHR_1MF9vYLg@mail.gmail.com>
In-Reply-To: <CAOzCab90jOw9Euh84T301WOxh1R_TJse+AbNupYHR_1MF9vYLg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 07:21:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCuKHWCQbKZcFCWZ8hP2ZLNEYQYTL0w3S6sZFHp428A5PA@mail.gmail.com>
X-Gm-Features: AX0GCFtPwRkvFFtnUoXLDiZXl1Y_oTTdkyEE3Fn0CvvFGXCaHAps71e5vjHIugY
Message-ID: <CANiDSCuKHWCQbKZcFCWZ8hP2ZLNEYQYTL0w3S6sZFHp428A5PA@mail.gmail.com>
Subject: Re: USB UVC webcam cannot capture
To: Jerry Quinn <quinnj@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jerry

In your dmesg I am seeing some
usb 3-11.3: USB disconnect, device number 17

I am not sure if that is you removing the camera or the camera
deciding to leave the party on its own.
Have you tried connecting the camera to a different port? And using a
powered usb hub?

If that doesn't work:

Could you try to increase the trace level to the max?:
rmmod uvcvideo; modprobe uvcvideo trace=0xffffffff

And enabling v4l2 debugging:
echo 255 > /sys/class/video4linux/video0/dev_debug

Then capture a frame with v4l2-ctl or cheese.

and then share the dmesg output.

Thanks!


On Fri, 23 May 2025 at 01:57, Jerry Quinn <quinnj@gmail.com> wrote:
>
> Hi folks,
> I have a USB Sonix Technology L01 HD webcam that fails to capture
> video.  I get a protocol error when trying to capture frames with the
> current mainline kernel.
>
> I'm running the following to try to debug it:
>
> jlquinn@cerberus:~$ v4l2-ctl --device /dev/video0 --stream-mmap
> --stream-to=frame.raw --stream-count=1
> VIDIOC_STREAMON returned -1 (Protocol error)
>
> I've created a bugzilla report for this issue:
> https://bugzilla.kernel.org/show_bug.cgi?id=220148
>
> This is the kernel build I used:
> https://kernel.ubuntu.com/mainline/v6.15-rc7/amd64/
>
> jlquinn@cerberus:~/sw/src/cod/mainline/v6.15-rc7$ cat /proc/version
> Linux version 6.15.0-061500rc7-generic (kernel@balboa)
> (x86_64-linux-gnu-gcc-14 (Ubuntu 14.2.0-23ubuntu1) 14.2.0, GNU ld (GNU
> Binutils for Ubuntu) 2.44) #202505182143 SMP PREEMPT_DYNAMIC Sun May
> 18 22:13:39 UTC 2025
>
> jlquinn@cerberus:~/sw/src/cod/mainline/v6.15-rc7$ hostnamectl | grep
> "Operating System"
> Operating System: Ubuntu 24.04.2 LTS
>
>
> My device is:
> [ 2047.142578] usb 3-11.3: New USB device found, idVendor=26e0,
> idProduct=6230, bcdDevice= 1.00
> [ 2047.142594] usb 3-11.3: New USB device strings: Mfr=2, Product=1,
> SerialNumber=3
> [ 2047.142600] usb 3-11.3: Product: L01 HD Webcam
> [ 2047.142604] usb 3-11.3: Manufacturer: Sonix Technology Co., Ltd.
> [ 2047.142608] usb 3-11.3: SerialNumber: SN0001
> [ 2047.144927] usb 3-11.3: Found UVC 1.00 device L01 HD Webcam   (26e0:6230)
>
> dmesg, lsusb, and v4lc-compliance output and kernel config are
> attached to the bug report.
>
> Please let me know if I can provide anything else to help with looking
> at this issue.
>
> Thanks
> Jerry Quinn
>


-- 
Ricardo Ribalda

