Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D48B19FD54
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 20:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgDFSjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 14:39:06 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35628 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgDFSjG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 14:39:06 -0400
Received: by mail-lj1-f195.google.com with SMTP id k21so855366ljh.2
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dlGauv/gwjoDujB4MH+B5KyDEaA+12ibnhptLlYUwMA=;
        b=E40DFvZVd8tOX1lmtNcaNUhLeQ/B3zLjIOBAz8LyRe2Ut+vNuU+mO74dFShKmTPEta
         A9Aj9hWVaLSxq7kkRLAfnb0IwnORL2oD0JOtFAHQh8nmeKdgG4vma0bjUHvDKgXM/s0h
         0aNacKULOUyHJ5MJroirBU1k00ANPpNoM5xpDWOGFFNxrT1znMkzXIW+gamStFxHblLA
         VFK+MvekYZbh1m5liUb0Jv047PDeahOPKFAiPCc7s4iNV5xYeSsRfxQ6TdyNmgZEe+yi
         INLamBt1jygRvSiEAX7YyNmMKK+Rz3wnB0wvxJnWfpwLhG7shio3mJyuhojjjwspVMJ6
         xdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dlGauv/gwjoDujB4MH+B5KyDEaA+12ibnhptLlYUwMA=;
        b=NEFk/JOSEo5/3tjVcfyB/AtkLVmurXxsR7P4+u71LVgS5Owk7J5o8MrB4gW7G2hv+r
         VW8XWtJJb/vgwVvMwZLJZcsinXWd7AwqetrIfIa0ZeEjdwyU1ZDKPNtGcpGWAxNzFGTG
         5als9g9ge71Bb8dwq1sD3/Hm+PXsqCaxiOoN2wuGkHjzx5KJZo2uRDoFj83Pc27GfivX
         DJHca8BsOHlBb+dEE4fIe09ibdY1n9mzjQzGOmD1ZvEcG0tVJq2i/xQkNSOSpUtNS5Ja
         IYWF/HEcIUgO+Er8HX2ThDLPHipAv6V0LLYOK4h5Mkfm5UuEEehAwuP3zet7l5AQ/Mt/
         Dhbw==
X-Gm-Message-State: AGi0PuZ1Oo2Bw51A0+XsmX0Al4DSQdHSEbtgSwbpkPhZx1fx3R2MSDoS
        /C63+Wahzag5Kbu+YBQBDvljUd/66K+MbdrdSTk=
X-Google-Smtp-Source: APiQypL1HdOiWzPad3RzAQaS9SeVE4F6t3IUCleIYkYHc9WaqBeASo2jT/Tm6Xjgp+8CqrfIeV+BvSYHFy23XbJ5PEQ=
X-Received: by 2002:a2e:9819:: with SMTP id a25mr407526ljj.288.1586198344306;
 Mon, 06 Apr 2020 11:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
 <77add588-5756-8684-3e8f-0f46cbb2442b@gmail.com> <CAOMZO5C32M-JzCtfd7_=HtyfMqyqYd6adUEj1XRB6SYGoq0a0Q@mail.gmail.com>
In-Reply-To: <CAOMZO5C32M-JzCtfd7_=HtyfMqyqYd6adUEj1XRB6SYGoq0a0Q@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 6 Apr 2020 15:39:27 -0300
Message-ID: <CAOMZO5Ask2GF7fA=K6_RYF7138YEhsg4ERqvyS5SRt6jkh8QvQ@mail.gmail.com>
Subject: Re: imx6: Cannot register mem2mem
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Mon, Apr 6, 2020 at 2:46 PM Fabio Estevam <festevam@gmail.com> wrote:

> >   &mipi_csi {
> > -       status = "okay";
> > +       status = "disabled";
>
> I tried this suggestion and then mem2mem is successfully probed.

Ok, so now I connected the ov5640 module as per your suggestion and
this is what I get with a clean 5.6.2:

[    6.618296] imx-media: ov5640 1-003c:0 -> imx6-mipi-csi2:0
[    6.644522] imx-media: Registered ipu_ic_pp csc/scaler as /dev/video8

However,  the v4l2video8convert Gstreamer element is not detected:

# gst-inspect-1.0 | grep convert
video4linux2:  v4l2convert: V4L2 Video Converter
audioconvert:  audioconvert: Audio converter

If I do the kernel hack I mentioned previously then I can get v4l2video8convert:

--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -213,10 +213,6 @@ v4l2_async_notifier_try_complete(struct
v4l2_async_notifier *notifier)
        if (!notifier->v4l2_dev)
                return 0;

-       /* Is everything ready? */
-       if (!v4l2_async_notifier_can_complete(notifier))
-               return 0;
-
        return v4l2_async_notifier_call_complete(notifier);
 }

# gst-inspect-1.0 | grep convert
video4linux2:  v4l2video11convert: V4L2 Video Converter
video4linux2:  v4l2video10convert: V4L2 Video Converter
video4linux2:  v4l2video9convert: V4L2 Video Converter
video4linux2:  v4l2convert: V4L2 Video Converter
audioconvert:  audioconvert: Audio converter

What am I missing in order to get the v4l2videoXconvert Gstreamer
element without hacking the kernel?

Thanks
