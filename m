Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01FC1C26C5
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 18:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgEBQIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 12:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728222AbgEBQIv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 12:08:51 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8D8C061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 09:08:49 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x2so3135770pfx.7
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sgTe61io6s/MCR/KvWkJFQaI7UpTIgjUcL7ux7PkIAU=;
        b=gl6YUUaIs8OGFwlUrjRqEMioyvu3Iil01ZtWbeGWcfjy2APUTDRzIHjXhokRD4PY8+
         l3dVp+TP6Fjzmg5zRixM7SzzAUl5l934tiX2/RsWa1wenKQyA1C5xJRlpPIX2HIbEPtf
         2S7htveY2enuAQkPPjeC7Y05YZof5ig43Imr1TAXo+UID5e+yLlCSpmTmSEgtdr5S5WR
         3wboG2ACypEGaJ7SN2FTlng5lmOD/x6cxWUxBzFfYiWCezduwYoTa3PBWTldwGH/yAir
         1zvBjQiw7cXDYpepuNhD4lGjh9sso8LLqQXRWlLRZdbigWTqHWSZLnX5YErHVyUFrT15
         8mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sgTe61io6s/MCR/KvWkJFQaI7UpTIgjUcL7ux7PkIAU=;
        b=cK4rckynW2Kn6BYg99zV7ldaWASOKKPRrGwtT2d8Zs0Bq+43ECZYBG0v/jg9jbKt/+
         xmhur2FdmsqzDsfiuug4U+dRUaP5o1VqTaSgWC+VwuWPpUBkPqrsh4aRGLMFcuMa31Az
         l6gDKv/1EOOGFRIytfh1Igd/g91r7XSe8snXNggT88aCtZ/M7jOimsHaZxPe31N0dvrV
         8FGYDdkiJ8h6OM+Fi0pkcBb0mk6kvRtMzPxR9+dRoElfBYLtsml0JwI/1qEfwDd+eplg
         XuUfq+qFcj6T700Vb9xXWoPIFg7IN1UHsJfK1bt9Phq2Qg6d+3AJmo8bGmruGzpIjIym
         qIoQ==
X-Gm-Message-State: AGi0PubCESYRxQVBMvDu/Rj5QpV6RBxVgttq/UjR6JYxJydXmiP+Skru
        /iY4mAaSfXmC1kax7y0SFYsQoN83PWy8NLj4Kro=
X-Google-Smtp-Source: APiQypLI5t5zmoNaIq/OCkINiErJ3OC9cC01mR6dWmAmc5KXzGotaZvCddqC1LZZkdFzcjKX7GoRgpUjruEfHAJWVis=
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr9624477pfr.36.1588435728403;
 Sat, 02 May 2020 09:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
In-Reply-To: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 2 May 2020 19:08:36 +0300
Message-ID: <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
Subject: Re: atomisp kernel driver(s)
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 18, 2020 at 5:42 PM Patrik Gfeller <patrik.gfeller@gmail.com> wrote:
>
> Hello Mauro et al,
>
> I've recently switched to Linux, and I'm very impressed. Almost
> everything thing works out of the box. Only the webcam on my device does
> not. I did some digging and if I'm right an atomisp driver would be
> required. Is this correct? Below the output of lspci:
>
> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor
> x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0
> VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
> Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium
> Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
> Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
> 00:0b.0 Signal processing controller: Intel Corporation
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
> Management Controller (rev 36) 00:14.0 USB controller: Intel Corporation
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
> Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
> Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express
> Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless
> Network Adapter (rev 31)
>
> According to the history it looks like the driver was removed from the
> kernel in 2018 and replaced with a dummy driver (to make sure power save
> works).
>
> Is there a chance that the atomisp driver will return to the kernel?
> There are quite a few older tablets and 2in1 devices that would benefit.
> Unfortunately I do not understand the removed code (my coding skills are
> very basic) and can thus not help to change what ever is necessary to
> make it fit for the kernel :-( (does not sound like a beginner project).
> However - I would be glad to help out to help testing an ISP driver.
>
> However - even without the cam it is a very impressing operating system
> which I enjoy very much. I would like to thank all of you for your work
> that benefits so many people!

I follow your attempts to enable that driver (I, myself, spent a lot
of time to an attempt of getting this driver in a shape). However, I
guess you started from a wrong side. Even with access to internal tree
for Android firmware we didn't manage to find a proper one to whatever
has been published in drivers/staging. So, to get it done, one should
first to find a *working* Android for the certain device. Without that
it will be a journey of wasted time and big disappointment.

My achievements end with no getting IRQ from the driver (and I was
experimenting on MRD-7 CRB).

P.S. I also have some (semi-) debug patches I can share. Perhaps they
will give some more ideas. Btw, based on this discussion I think that
it can be power issues with sensors that possible affect IRQ
generation inside SiliconHive vector processor. In IPU3 the dedicated
PMIC is used for camera devices, and I have no idea of the design for
old ones.


-- 
With Best Regards,
Andy Shevchenko
