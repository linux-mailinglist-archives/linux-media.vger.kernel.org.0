Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474373BA8BB
	for <lists+linux-media@lfdr.de>; Sat,  3 Jul 2021 14:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhGCMni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Jul 2021 08:43:38 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:34775 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhGCMnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Jul 2021 08:43:37 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.179]) with ESMTPSA (Nemesis)
 id 1MEmEf-1lyIB33nVD-00GG4T for <linux-media@vger.kernel.org>; Sat, 03 Jul
 2021 14:41:03 +0200
Received: by mail-qk1-f171.google.com with SMTP id e14so1346196qkl.9
        for <linux-media@vger.kernel.org>; Sat, 03 Jul 2021 05:41:02 -0700 (PDT)
X-Gm-Message-State: AOAM530zTKbdwvkiLGYmAmU2aw1skH/E4H9481PaqUqNKF6HBW/0kAdK
        IEwXTo7GYy1vyfer5OHBfQH8YkXq5d67hY4mCpM=
X-Google-Smtp-Source: ABdhPJxtyZp5CGqZPe060rYpeuBRUl1Bx2UkKd6T7QA4f6XgPeWh1t4LQrQ5aFq6IpmxuXMMfNbgs41TJBKaJLHz6dw=
X-Received: by 2002:a37:9c85:: with SMTP id f127mr4924113qke.294.1625316061810;
 Sat, 03 Jul 2021 05:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQUExJcvBtxsr0oeubRVLw@mail.gmail.com>
 <20210702220523.1807450b@coco.lan>
In-Reply-To: <20210702220523.1807450b@coco.lan>
From:   Tony Houghton <h@realh.co.uk>
Date:   Sat, 3 Jul 2021 13:40:50 +0100
X-Gmail-Original-Message-ID: <CA+GXpVXkB5AyyMeTwgMvY_1xCJ5+=TBNQdyJO5NS4xnpqDfz2Q@mail.gmail.com>
Message-ID: <CA+GXpVXkB5AyyMeTwgMvY_1xCJ5+=TBNQdyJO5NS4xnpqDfz2Q@mail.gmail.com>
Subject: Re: DVB reliability problems
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Q4HE61pLq3ZxYw8wHBA1LLhVWeLPpU+WE2HMae0Fvrhtdq0yHWm
 NVaWR53K9dEm73+pu1QqEdsgNvLN4+VdHnxMmwqXZSk8BUBNjWxXHvuxwi1X+0JaXkVG4GJ
 6sHyDy+mNzjTsFnCNOyMvB9opM9L47mCK7DUdhbwLzUh2B9T25bwdIy0g4YgABSZk3U6VDt
 wq63GS/+VUeDd+3G5Uvsw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aP//haSt6lM=:dcmFCpZQZmg9diup2IrQlN
 48U5Qd0NxxdVxYjOGWzKG+/khLiuLitC4x03ZG6k9i8tZadDaUs7zC15rkF//hEdSv2whGKUf
 EWP1+/NDB/6YjIYRkulGspW1Mxct4itJhNLwJ5/WGfIZJ7AKmjzdYXJ8AtSzOUqB/ELA1MGzs
 GwyiBuIbvLOdO/K5Hyn/bErjtOtVskZC8E4C/Udk8XfnsUbR0ycycnR2KGwg4ZywY4aNZAMU4
 yDmxwU1WY5p9OpO2temrRC9ekmyWLCdxGjbZPDusL2tsKsK8I34Z1PrvfT9OXRbNWdlAFzDcR
 ev+zCTRI36MwHDzjTc19h11xSFGiSQ/fnvoSYQ/Npm97noVhEdmcY4AVpDJGywfZq8A9diJIH
 Du5xHDtotC6kcNQqlJg+DTwDP7mrEJUwtfSxzn/nymMCgVCuyAnxKi32mId7uJFqQJPqKa4cO
 Aqgd9QPLNBd1GFLWabXpR7FBgOkhIoA2NA0SrzyNRrRK98g2J8/rlb+3vNQ69TdvlCCziNxC2
 1FOBqMosM8K7/Nkt2HcqX8+7pPucXfaQwV7qD8UAdVum0KZihn+r9HfHayMMRDN6neqsPcP9W
 5pu6U90ByBwqxdyshNz9VkwVf0Djyfljwwy/LOa33sAJDmgN/a0FiUFUWXaLFYz6QZQIL3+b1
 V2c1eVEhIHjfL14ssKG3ErJhJDl1yQOAYlPJELu0wH7HkWzOKDsH5EFTg4RrW7heR7UjQ/1vL
 jxD5V1e69KYVrElKXc3OAD0etERyk0gsx0dXeChw4FHx9FaKN039hSNGuZZvTTsaAbTxgHXxA
 CE59fUpbyYmPbI68PaGtJdZywi1TnNvL9XYhNj88XIxYORkdLO/y0BbIaPiAHJcqIjuJfZ3
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2 Jul 2021 at 21:05, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

[System hanging after DVB receivers fail]

> This is a very weird behavior. Never saw anything like that happening
> with an upstream Kernel. Are you using anything else like some
> proprietary driver or dvbloopback?
>
> Are there any messages printed by the Kernel when the machine starts
> to die?
>
> If you're not using dvbloopback or a proprietary driver, I would
> suspect that your PC hardware could have some issue... perhaps it
> is overheating or there are some power issues on it, as it doesn't
> make much sense that a fail to tune would cause a system hang.

It's an ARch Linux system, and everything is vanilla. I get the
impression the hanging is caused by blocking I/O on the device
descriptors, but at least on the last time I happened it hung on
shutdown after I had stopped all programs using the devices. So one of
the modules could have been still holding the bad descriptor open, but
I got the impression more than 90 seconds had passed before I pulled
the plug, so systemd should have killed it by then, if that was what
was blocking the shutdown.

Another symptom I've seen is that it can cause tvheadend to busy loop
with 100% on one CPU core, and become extremely slow to respond on its
web server and to shut down, so overheating is a remote possibility.
But as it's only affecting one core out of four, it's unlikely.
Perhaps too much power is being drawn from the USB subsytem, but I
would have thought Intel would have made sure their NUC PSUs are good
quality.

Years ago I saw something similar with a cheap Chinese IR receiver for
a Windows Media remote control, it would make the system hang when
plugged in. That may have been so long ago that it was kernel 2.x, let
alone 3.x.

Next time I notice the problem starting I'll check the logs straight
away, but the trouble with system hangs is that they tend to destroy
their evidence. I'll also see if unplugging the troublesome device and
re-inserting it without rebooting is enough to revive it, because that
could provide a better idea of hardware vs driver issues.

-- 
TH
