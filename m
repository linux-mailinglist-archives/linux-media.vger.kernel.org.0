Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85752FA1A9
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 14:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392383AbhARNbi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 08:31:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392237AbhARN3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 08:29:34 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112E7C061573
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 05:28:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id a12so24091915lfl.6
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 05:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EMcMo4Nhs3kbIVIc6PapK3iiBlpQZgXsDeEubhmtP7s=;
        b=pN31Gw4EGcrmbs0HpZVh5CTFmXGSGExG5jqLQDHpQD87AhbagK1pWrcHfA7xdV2mNZ
         r9dXWAhN4mACgB/epIEZpo1TNxFcWC0DJhZO4eL+Owg0W0XCr9YcSufkpkttWKJQrWjp
         LDEFrTi/DI62smfhtJARGP1nsESFnffY8iL296SLPotcVK1E+Eah9T65OkZnShmdrCVx
         WOLhp5fkPwwXBzXsq35n2q/hFaAkVcdtA4Fz4OletoGbQMxS5Etm6oCsDGKUvsCJ/NnR
         HXk33npKTlXF5ye4h5mWkAzkFt5pDrQn7IPaQmfD+jTf0Pkkff5/KAYU1kJBtTYaz4OI
         D3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EMcMo4Nhs3kbIVIc6PapK3iiBlpQZgXsDeEubhmtP7s=;
        b=uLThRur2zNOcFgWI/ueJeVhoeKpfRzLZqQabaAGXgVJ2H1KShEZj/XK1o6asKeteTP
         LMAuFFYZlzb0IA4kLbTSt2qxkQkUvhWd8buuj99HaSTEfNwMNHVsXyAt+QydXH3R+jB9
         iUiDkjckLsOlDno4LyKHQC9K27PJQPmTt+IcA4T+fij/m3s8aAHMqiFYJpwZ2Fj3eBS4
         VHlX99HfNYUSi8E1yoRfYN/sOiM4kKlZQyJc8gAMhEpyeX3W+sntDeCiJY7s/vbyHKHW
         Ocyk4sXzKVrlIotRfhjE/Q/e1rFuJbrTi2QUDss6UuLRFlPqndjZgsV6pV83wE1ZgQKZ
         FTsw==
X-Gm-Message-State: AOAM530Gpvql+6xNv40BORxPrui/2Qf7wI1ie0CawlYevjQQhurk66K9
        czgNPV/3ttraViyoMwClKxBX7jsc9P//GwGqjlEkXPG0rz/Xig==
X-Google-Smtp-Source: ABdhPJy0QwwXqVbwS90/9m8FdVx0m90JRABBmc8LqIQTrgQJwYjG51Gve5CJHlpPm453Ai3ac9bhOo7ZrlBPQLW9J3g=
X-Received: by 2002:a19:e20a:: with SMTP id z10mr12367089lfg.295.1610976532511;
 Mon, 18 Jan 2021 05:28:52 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
 <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
 <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
 <CAOMZO5DBRGqn5DTsMG3RRHdN1HMo7CtP6HYw3PajK3A6Y6iCoQ@mail.gmail.com>
 <CAKQmDh-KgO4TameRQs_D3_rdW8n0oY-ZLmbsQzWQPOkUJdiObw@mail.gmail.com>
 <CAOMZO5DCzodXDVygMfnhJi=DF3W64NZJQxLBT6LoOJ_V6NJ9Hg@mail.gmail.com> <4366a936909a3f33788719f00441e81b1f3576f7.camel@pengutronix.de>
In-Reply-To: <4366a936909a3f33788719f00441e81b1f3576f7.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 18 Jan 2021 10:28:40 -0300
Message-ID: <CAOMZO5CyDtEW4Uo3u9ANRro5fV4DBx3WLKDc_ok8HB41mNKF5w@mail.gmail.com>
Subject: Re: Coda: imx53 plays video with incorrect colors
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Thanks for your reply.

On Mon, Jan 18, 2021 at 9:40 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> The driver could be modified to switch the DP->DI0/DC->DI1 mapping
> around to DP->DI1/DC->DI0 when required. As a simple test, you can
> switch statically with:

It does change the colors but still does not play the video with the
correct colors. Looks like it plays in black-and-white now.

> Or, as a workaround, add a v4l2convert element and use the IC to convert
> to BGRx between decoder and kmssink.

Yes, I have tried to do this, but it says that v4l2convert does not
support bt601 colorimetry, and then a segfault occurs:

# gst-launch-1.0 filesrc location=/media/clip.mp4 ! qtdemux !
h264parse ! v4l2h264dec ! v4l2convert ! video/x-raw,format=BGRx !
kmssink
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
ERROR: from element /GstPipeline:pipeline0/v4l2convert:v4l2convert0:
Device '/dev/video4' does not support bt601 colorimetry
Additional debug info:
../sys/v4l2/gstv4l2object.c(4032): gst_v4l2_object_set_format_full ():
/GstPipeline:pipeline0/v4l2convert:v4l2convert0:
Device wants 2:4:5:4 colorimetry
ERROR: pipeline doesn't want to preroll.
Setting pipeline to NULL ...
Caught SIGSEGV
exec gdb failed: No such file or directory
Spinning.  Please run 'gdb gst-launch-1.0 217' to continue debugging,
Ctrl-C to quit, or Ctrl-\ to dump core.

Is the Gstreamer pipeline above correct?

Thanks
