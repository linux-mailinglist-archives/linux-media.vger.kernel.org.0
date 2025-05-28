Return-Path: <linux-media+bounces-33554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640BAC70ED
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 20:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3068C1621C2
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 18:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833B220E6E4;
	Wed, 28 May 2025 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jd1UUUrD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331AF43147
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748457041; cv=none; b=DEZQXvkirU3pIWiRvr5UswvYsz+725Eo4v5Eh1kcTFkfWhlBzy0RzLwuwmKkbagrD3IHCzEzHmnK8ycsz9tIhny+3xHnXr6NVr+RS5iYmpdxwbZbF1JYU2fHm4geVB0UfrFItSmYX3gm+x/o5L9rTeEMu5mR+FO8CVbCZnrGYJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748457041; c=relaxed/simple;
	bh=VcHk4A5APx5MgwHuMS/DXh2U3W1e9vpFhkxKNj8JdcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnARnGBCVx2Z6L5XKQJIMthx9NIlHqfzZqeZu7JiOtyeu/dEEEj2Mbztw7ZvB+xyhg3ZUTQ2Ci/Yq/okSUcxNUQlTTc13XqexU4YRuVlyerbFz5nmByF5PH01lj/yqNfjEn0my611jhwCJBbBpDpUUjqFHzhbzT5GZVAIwf1Et4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jd1UUUrD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54d6f93316dso30901e87.2
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748457037; x=1749061837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOC9P0AevgKbOlqYcGYv2bGZ2F2NQtUFPNxcZKliwp0=;
        b=jd1UUUrDfEOCbxlNoZw9ZPfiCTjpudmoIDYqb3SdSk/t3yn2sKixSbp8EV1beB9395
         gNriNW7Um66+0HVGIqrRgmvY1tYvMx2rAujVSPVFjUaQ9LVMFd+OG1ZYQEsfR0RjvJwQ
         et2UbypbdLvFPW+JMObt2TXGTHdi499tS1JKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748457037; x=1749061837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOC9P0AevgKbOlqYcGYv2bGZ2F2NQtUFPNxcZKliwp0=;
        b=TVMF+B8eoSCt8AIkJ8wylyCPQFJvRqZGi0Jpf6xL7LEmXoIAEyHKp49cpdr0s1XnDB
         zfs4eKZWGcF2wC8G5lRbdyPCjM0tlzpgsB8DSMWtfdQ1BME/fPo4cyTKKnDj3HSylrQr
         HXKBNiOvcUaMojbc8zdELeGdAMDI8lDU+8LnF/pyCsJehiiV5I6okMSfOuzULqMA8hWd
         cvZnPu5g76k2iGjfOtsepcidCZX50v/hGBJwQnqWFhrJ/OFWRm9OH8y4o5Hi0Vs2gZqA
         vsPzMlJqrcZKNfN7BCIpaLLs/0JnDjBWNaJ0YqvVBN1Log8IYcUBZ96ivoXOfZsjw3uR
         YgLA==
X-Gm-Message-State: AOJu0YztSBs75CuUXUcaBj8jHfIBy0s1NQZ5WKk90LPw/cLuQlU3jk3I
	0knDJMB8xSf8kStKg+k9er+4pIfude3vJ+LaBuadeF+fVF8/ECpPcD8B/AXp4talRPbkgf66zQD
	lCE2rYtps
X-Gm-Gg: ASbGncshjqRzQCvl2WQB6K7RsBQnE28I4rNavqHC/YpmDfWVdsEr+5CQf2YOknsd0lr
	1QJEF35vHzEi/vEsZ34g8N7u1fp08xQLZ945Umosy5HqFWfDs/eHg96X3PXJ8IU4b0fdHiVPkU3
	xO6u3FDx9UhwqVw1vjff8uK9caVOwyTzn6HHtxnmXeJNsLZCwWNh3roFHTgIEAYSmtu7SlXmm+a
	cBt9xDg94otumqSz0e2RTBl08t/K2qdP2NzBy2iOwMYY6KVax9g+eQasFZeHXXlncbBBHyMg65p
	cOEYld0D4QGobvz77289Gnb4AAK95ho+Ceaj6nqEXBe4sKYOD2zMYcNqPW5jxW5Los6fSBT4d9O
	08tGya12z+x+zSw==
X-Google-Smtp-Source: AGHT+IFmTvfZ/DXyTDL0+KZ46j0ExMQKiTh60CXRTx3+cUkxhnonta6ccbeJHrfBH2tgHSqp1Ptmeg==
X-Received: by 2002:a05:6512:671a:b0:553:2191:d32f with SMTP id 2adb3069b0e04-5532191d4f6mr3735107e87.44.1748457036960;
        Wed, 28 May 2025 11:30:36 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f629a79sm382917e87.55.2025.05.28.11.30.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 11:30:36 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553331c3dc7so31808e87.3
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:30:36 -0700 (PDT)
X-Received: by 2002:a05:6512:12ca:b0:553:2698:99c5 with SMTP id
 2adb3069b0e04-55326989b58mr2983836e87.39.1748457035780; Wed, 28 May 2025
 11:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAME8Xxh9KhiWD3xu3O19Av6KWTsKa_eUT6q+Pk4ECMC3PQYWAw@mail.gmail.com>
 <CANiDSCtaRH7Oi4mDTg0Ptou=-SZwu_AiOJQBgYwRSncNUm-NqQ@mail.gmail.com>
 <CANiDSCvFQ2e_EH7Yop3K41X5KzL55bzjJvk7U9etN4NAefBkAA@mail.gmail.com> <CAME8XxgGLyOsvX+wFix_y3+k0DRqxHX+E0M8Mz64ymbGaf9iCA@mail.gmail.com>
In-Reply-To: <CAME8XxgGLyOsvX+wFix_y3+k0DRqxHX+E0M8Mz64ymbGaf9iCA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 20:30:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCsdweqtnjnmo7or0_Jt0p4-AkRc2hqmvsCBqGDSoteX2g@mail.gmail.com>
X-Gm-Features: AX0GCFs8SeTJOozUhi8ttLmmi8VkbLcOPZ4gqjN6_-yVPyuVpyrD9_1KkQkREJ0
Message-ID: <CANiDSCsdweqtnjnmo7or0_Jt0p4-AkRc2hqmvsCBqGDSoteX2g@mail.gmail.com>
Subject: Re: Device not support on new Lenovo Legion laptop
To: Flavio F Lima <flavioislima@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Flavio

On Wed, 28 May 2025 at 20:10, Flavio F Lima <flavioislima@gmail.com> wrote:
>
> Hi Ricardo. Sorry for the delay in response.
>
> Yes, actually I tried different values and none of them worked. I even tr=
ied using a conf inside modprobe.d with this and other configs but without =
luck.

Sad to hear that :(

If you are comfortable building your own kernel. you could try with this pa=
tch:

diff --git a/drivers/media/usb/uvc/uvc_video.c
b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..bad773fe9cfd 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1153,10 +1153,13 @@ static int uvc_video_decode_start(struct
uvc_streaming *stream,
         * - bHeaderLength value can't be larger than the packet size.
         */
        if (len < 2 || data[0] < 2 || data[0] > len) {
+               printk(KERN_ERR "%s:%d data[0]=3D0x%.2x len=3D%d\n",
__FILE__, __LINE__, data[0], len);
                stream->stats.frame.nb_invalid++;
                return -EINVAL;
        }

+       printk(KERN_ERR "%s:%d data[0]=3D0x%.2x data[1]=3D0x%.2x\n",
__FILE__, __LINE__, data[0], data[1]);
+
        header_len =3D data[0];
        fid =3D data[1] & UVC_STREAM_FID;

and then report back the output of dmesg.

>
> Thanks!
>
>
> Em qua., 28 de mai. de 2025, 19:03, Ricardo Ribalda <ribalda@chromium.org=
> escreveu:
>>
>> Hi Flavio
>>
>> Did it worked for you?
>>
>> On Mon, 19 May 2025 at 23:35, Ricardo Ribalda <ribalda@chromium.org> wro=
te:
>> >
>> > Hi Flavio
>> >
>> > Thanks for the report
>> >
>> > Could you try setting quirks to 16?
>> >
>> > rmmod uvcvideo; modprobe uvcvideo quirks=3D16
>> >
>> > And then retrying?
>> >
>> > Regards
>> >
>> > On Mon, 19 May 2025 at 22:18, Flavio F Lima <flavioislima@gmail.com> w=
rote:
>> > >
>> > > Hi!
>> > >
>> > > Thanks for working on the Linux UVC drivers.
>> > > I am contacting you since I have a new Lenovo laptop and I am using =
it with OpenSuse Tumbleweed but the camera won't work at all. It simply sta=
ys black on any app I open.
>> > >
>> > > So I found out about your website and followed the step-by-step to p=
rovide the info so you folks can debug the issue.
>> > >
>> > > I am sending both the lsusb and the dmesg log attached.
>> > > Let me know if you need any more info.
>> > >
>> > > Thanks!
>> > >
>> > > Fl=C3=A1vio F Lima
>> >
>> >
>> >
>> > --
>> > Ricardo Ribalda
>>
>>
>>
>> --
>> Ricardo Ribalda



--=20
Ricardo Ribalda

