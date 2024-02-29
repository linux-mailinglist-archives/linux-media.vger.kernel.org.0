Return-Path: <linux-media+bounces-6188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8986D047
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 18:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80311C219DC
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 17:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D2D6CBF2;
	Thu, 29 Feb 2024 17:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ofh6ZF7P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EC85E082
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709226814; cv=none; b=lOGvpbwdXpp4C5AWjAwVLYw5SxTfQNNOqFKWft3zrWOMtO2dyQqUTFgV6ZiICzZBgo5wfTgnZazXQB+Tdq7RdwIRwP/nybGQXBZ+Y/8oqM+0jvlJHLDO59DuIklaTav76DOSBvBf2w72BlDyNjj2qU+PyOd08DCi1YXN5tuFMrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709226814; c=relaxed/simple;
	bh=BPU1J2m6r0RUK4gYCJNau6WBo+FVfY1p0kdioEOlKh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyTR7ZEIV7BWFFBHld6ym+r/rS91CzVnyIAQZA3kdZOlxb25KCguqTTukD4x+M8+A6EABmPp0Ad3QafZQ5wqupA6xLrLBbhDAmjd9pj+geNmiJYbIDW3/eRGXSlTWi4VZNxcXUFGvDlC4sqE1Nng3gyL+MLQggJ5/2WQYARIJp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ofh6ZF7P; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6900f479e3cso10357566d6.0
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 09:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709226811; x=1709831611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQVXD3qgKNPuMjrjDiQ1s1xekqDHxJ94cxmRetI8JhU=;
        b=Ofh6ZF7P/nZmhEptZyf2fHH8ScuXu38s1tr2GL1kWVYlnK/uIpX60sxmpvYSeLvqQ9
         4o3VFNAKyyEJGP4ez/jeMnHp3tmce8FlbhsaKhZM5kWTFhdXHZAo7ZAAYzIMkaJLxP2u
         88xZLXuLieJIxUrcOqydgaKTPjBpa/nLPHEck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709226811; x=1709831611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQVXD3qgKNPuMjrjDiQ1s1xekqDHxJ94cxmRetI8JhU=;
        b=JzP14m8sojMxs8Qv10o5bsi3q38LQOOiaDahQMw7f0N+ABKp4+TF6kDqQEmNZvlVTw
         Bv0ddQ5B/ims5bk6w+frGBdQDGKWJHZlMwIpTD7V8Xwl+MzOH9dbg/cwYwwM4UoXEx3Q
         YfTLuyQgRjn4x63lOc7RtQvkBC3IpNPYdHaJQYkQxxjdpZy3iI5Igkv9Yghcd7F6iI5Q
         LkLZXNtZ4RNWIM+DHDBkSc8rh2pyBx3utOrhZuTrO/rV2wf3RLYe09ez/X5NVRTlvhPm
         uXAcUfNollfS02f4OyKIAHkt27+PKsWRcazyHlVeW8FCk2yiY6YVzs0D7TDKzueO38LN
         xlbQ==
X-Gm-Message-State: AOJu0YxG05ApXOYts0z83rvD+z8sStWdKkvsgEzRX0p7MNCFJd9/u3/K
	+Gnc+Bdc1h2rkI6gzjqUjx2kfrU45Ai36TtGG0SaWpeQAWTGKleWqqyNWWT6vEgdCVWip09jfDc
	=
X-Google-Smtp-Source: AGHT+IF0x25lCWnAAf9jyblMJLZrDlG7Tv2V7ev2yfDy7P/I/n7lAu2nXiwZpvL7x9FCnFOGfYlLcQ==
X-Received: by 2002:a0c:f54e:0:b0:68f:8ddd:aad4 with SMTP id p14-20020a0cf54e000000b0068f8dddaad4mr2947299qvm.35.1709226810950;
        Thu, 29 Feb 2024 09:13:30 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id mf5-20020a0562145d8500b0068c88a31f1bsm936012qvb.89.2024.02.29.09.13.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 09:13:30 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6900f479e3cso10357176d6.0
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 09:13:30 -0800 (PST)
X-Received: by 2002:a05:6214:12e:b0:68f:30a1:4bea with SMTP id
 w14-20020a056214012e00b0068f30a14beamr3296627qvs.33.1709226810036; Thu, 29
 Feb 2024 09:13:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQmf3EXdt9kTcvR1QMUtO7TUTgRSgVBAZRPmMkBxaBT4hMLTQ@mail.gmail.com>
In-Reply-To: <CAEQmf3EXdt9kTcvR1QMUtO7TUTgRSgVBAZRPmMkBxaBT4hMLTQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 29 Feb 2024 18:13:12 +0100
X-Gmail-Original-Message-ID: <CANiDSCtDbX4M=e-kVr4ZG_K+KrpNSkrb_+iaKYYOC9arLCQ-gw@mail.gmail.com>
Message-ID: <CANiDSCtDbX4M=e-kVr4ZG_K+KrpNSkrb_+iaKYYOC9arLCQ-gw@mail.gmail.com>
Subject: Re: Camera on Dell Inspiron 16 5630 not working - Dropping payload
 (out of sync)
To: =?UTF-8?Q?Zbyn=C4=9Bk_Winkler?= <zbynek.winkler@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zbyn=C4=9Bk

Have you tried the different quirks on the uvcvideo?

If you have the time, try something like:

rmmod uvcvideo
modprobe uvcvideo quirks=3D0x1

try using it....

rmmod uvcvideo
modprobe uvcvideo quirks=3D0x2

try using it....

rmmod uvcvideo
modprobe uvcvideo quirks=3D0x4

until you reach quirks=3D0x2000 (I think 0x10 might do the trick...)

if that doesn't work maybe you could save the usb traces with
wireshark so we can have a better idea of what is going on

Regards!



On Fri, 26 Jan 2024 at 12:12, Zbyn=C4=9Bk Winkler <zbynek.winkler@gmail.com=
> wrote:
>
> Hello,
>
> I have a Dell Inspiron 16 5630 (0C15) and the camera is not working.
> Any app I try
> it first turns on the LED signalling the camera is active but after
> about 1s it turns off
> and the apps report the camera as not working.
>
> I am running Debian 12, uname -rv says
>
> 6.1.0-17-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.69-1 (2023-12-30)
>
> lsusb shows the camera as
>
> Device 003: ID 0bda:5556 Realtek Semiconductor Corp. Integrated_Webcam_FH=
D
>
> Output of lsusb -vd 0bda:5556 attached. I have found
> https://www.ideasonboard.org/uvc/faq/#faq2
> so I have enabled the trace. The output is also attached. Here is a sampl=
e
>
> [   86.877268] usb 1-6: frame 1 stats: 0/0/1432 packets, 0/0/1432 pts
> (early !initial), 1431/1432 scr, last pts/stc/sof 0/2695207/1271
> [   86.909295] usb 1-6: Frame complete (EOF found)
> [   86.909307] usb 1-6: Dropping payload (out of sync)
>
> Any help appreciated,
> Zbyn=C4=9Bk



--=20
Ricardo Ribalda

