Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E017E607A
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 23:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjKHWrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 17:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjKHWrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 17:47:00 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315442587
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 14:46:58 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-66d1a05b816so1655826d6.1
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 14:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699483617; x=1700088417; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kasTMy/fe+OtJRFIni156cJ9mNbjQLd1RyatLG2PiIA=;
        b=YLXUu8sh2eqKIx9/J1YmqveMK9rQfT2KQgUft4HXgCaAIUCWuClsDQQFTedC8HKpx0
         F/Dz6JKxaeVJR0xwquRaoaiR0o4VqrUBVlpm1uGaXuV58JRZLg1HUeOyPqXiiTn7a/SU
         Edxat2xNnKEZamBLQs+aI/U3gQ99dsM0+wSvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699483617; x=1700088417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kasTMy/fe+OtJRFIni156cJ9mNbjQLd1RyatLG2PiIA=;
        b=S2ln5E1xR/gNS7wTgmn8d2d6QhCgGrH2Kgh3frsTY5HWnH2A4D9t1DaLF2xc922tB9
         TAhr8U92eIAkVTsNGgG3Y8TfeSmEC4QaOJSFxqB2itYL2e+ws2E2KY9CUSkZFN0CdX3R
         y5OfqOxu6LHbTAEwXI+j/BZECy6V0QuKeh/w6ZJh11Der/iFJDWnolx1fa56/ZE0YnGQ
         MGUUG2Pbck6QGInD0onv6ubiKb5rAR8IkbzcVm5m7cWloRlvrti9wbnXvX2pSY5z2Fae
         zpOG/AR5ePUgxBbTdEuB60q7cMS1I6CImWRqkwkWDeIzOE7boGSn8TUo84jr8f3TRl/R
         ZoVw==
X-Gm-Message-State: AOJu0Yyw/0nHkRjraUsTrcmuwAUEo+4pjNT8o7/OOmMqzvU9Mgi0vAyV
        nz9uHWUAAHolyq9pyHSDayrCznm4A2qzwcDPlnEj3Q==
X-Google-Smtp-Source: AGHT+IHhFv4V3QkScvBh4CkFBiLpPDyx+ByvjMCZdg3jGJOmyDGr7+jEelDaH3+lzOT7k+awDyZWUg==
X-Received: by 2002:ad4:5ca8:0:b0:66d:690d:42b8 with SMTP id q8-20020ad45ca8000000b0066d690d42b8mr3285454qvh.22.1699483616936;
        Wed, 08 Nov 2023 14:46:56 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id d4-20020a0ce704000000b0066d04196c39sm1523231qvn.81.2023.11.08.14.46.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 14:46:56 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-67131800219so1585546d6.3
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 14:46:55 -0800 (PST)
X-Received: by 2002:ad4:5f4e:0:b0:656:3612:7954 with SMTP id
 p14-20020ad45f4e000000b0065636127954mr3631272qvg.1.1699483615502; Wed, 08 Nov
 2023 14:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org>
 <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu> <CAN_q1f_HV7Etb9i2c2_c6Trm2hAJUyd068UskJfMvT=OyiKXpA@mail.gmail.com>
 <fe672e31315b8f9c44a693c909d464a299e76093.camel@ndufresne.ca>
 <CAEZL83qR2bDq35yvCV-WvkaL6ZbPvSxQH+j=ViG6Kq8-0Mzq1Q@mail.gmail.com>
 <CANiDSCtDQ9Wg57YzVAJ1o5WQRmy1QPW8td8V2Scc08MmWtOwFg@mail.gmail.com> <03ac47742945cc04e4663b87563b47a96ed3ec1f.camel@ndufresne.ca>
In-Reply-To: <03ac47742945cc04e4663b87563b47a96ed3ec1f.camel@ndufresne.ca>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 8 Nov 2023 23:46:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCunRRyod3Rg+L9ZsffOZyC7CKbMVTHX3u-n5iuNyZQk0w@mail.gmail.com>
Message-ID: <CANiDSCunRRyod3Rg+L9ZsffOZyC7CKbMVTHX3u-n5iuNyZQk0w@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
To:     nicolas@ndufresne.ca
Cc:     Esker Wong <esker@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Esker Wong <esker@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas

On Wed, 8 Nov 2023 at 21:32, <nicolas@ndufresne.ca> wrote:
>
> The fact that you interpret the time from FRAME_SYNC to DQBUF (well the
> READ IO notification) as the actual latency is yours of course. It
> assumes that the camera on the other end does not introduce other

We want to use this signal to measure how much power is used since we
start receiving the frame until we can use it.
I agree with you that the latency between capture and dqbuf should be
measured using the timestamp. That is not our use case here.

> source of latency (or that these are negligible). You are also going to
> introduce a lot of jitter, since it relies on when the OS decides to
> wake up your process.

We have measured a jitter of around 2.5 msec, which is acceptable for our needs.

>
> I think my opinion resides in if you can accurately *enough* implement
> what the spec says for FRAME_SYNC then do it, otherwise just don't lie.

What the specs says is:
```
Triggered immediately when the reception of a frame has begun
```
In my opinion, that is true for usb devices, we are triggering it as
soon as the transfer has started to the eyes of the driver. We cannot
trigger earlier than that.


> I think for ISO, "after the first chunk" i a small lie, but acceptable.
> But for BULK, the way it was explained is that it will be always very
> close to DQBUF time. and it should not emit FRAME_SYNC for this type of
> UVC device. If it fits other events fine of course, I'm just making a
> judgment on if its fits V4L2_EVENT_FRAME_SYNC or not.

nit: I believe that you have swapped iso and bulk on this description

>
> In term of accuracy, if timestamp was passed with the FRAME_SYNC event,
> it would not matter how fast your process the event anymore and greatly
> improve accuracy.

+1 to that. If we could easily change the uAPI for FRAME_SYNC that
should definitely be implemented.

>
> >
> > Not to mention that the UVC timestamping requires a bit of love.
> >
> > @Laurent Pinchart, @Kieran Bingham  any progress reviewing :P :
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=10083
>
> Thanks for working on this by the way, hope someone will find the time
> to review this. The timestamps should in theory provide a jitter free

It already has a couple of Reviewed-by stamped in.... ;)

> measurement of the delay Esker is trying to measure, and if it wasn't
> of bugs (and crazy complexity) it would in the worst case match the
> transfer time.

Sorry to repeat myself, but just to avoid the confusion: Esker needs
to know how much power is used since we start receiving a frame until
it is available for dqbuf, not de frame latency.

Regards!
>
> Nicolas
>
