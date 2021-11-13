Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBCA44F03A
	for <lists+linux-media@lfdr.de>; Sat, 13 Nov 2021 01:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbhKMA2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 19:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhKMA2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 19:28:06 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1716C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:25:14 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id o83so20933123oif.4
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zZAZZx1LVl20KnbrFNI6+fVxRPW2xcMhYesGki1iisk=;
        b=YEe3kB61aKUGepFRCrKw2wFXbogl/Q+xilPEYWBJY9bUwtaael+elaEu1Cg2ufTQOb
         9MlV+0necupvyvclSNLs893gOVOwiUKY9xs5xkdg2Qe4tz+P1wx4rYrZLkxYZSsBtuvd
         Gzd8FUsG8NqJAF7mimsdjg44hUqOrslQ89wt04JsClbDUX2qaEtO8FxufdGQq8LvuDiP
         yFxqKhbbrlnGninSSXXvbs1eJXAU846cywF4lyvx8cX9lAo3LlCSd6e10DIRhr1Moo4C
         LSSgUAXTERlGyK7azU0ON6eaTNtDngeZaXo38gneGtoIoEng6oLmjrCFm+dYNVwNTxep
         CCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zZAZZx1LVl20KnbrFNI6+fVxRPW2xcMhYesGki1iisk=;
        b=yqPIRcIwTDTuIB1HOr+VkyGlLxFaxU3VZaRqa2UyuPvgqHLjDXf40Yibr+mNoxkJ68
         uK4cmK/gsiNkleHhFRpM6klOOVaHJsVu35oKkj9gj8htf2m/SUQmNAzDc5r6lMwNZ4D6
         rt0THKZeeHOZGGY9o2z/341tgrS5popGsgGhaZj9fiSM9pTns0nXthXEY7TD1hHXlx8E
         Z5jTT7MZBChLof5iXuLKkICkH0iNgAhLJBkR7RP+8UTlVvC11mNdI1so8/ZL4lu9X2Z1
         d8oYa0oVFZcxNiE5mHKzlyxgu74MWvHzWZjoCkOlsOHsxnh7+LZQZHJR6TZQCKJgKupT
         3D2Q==
X-Gm-Message-State: AOAM531Cd/tw4GkkB0t8Q/TQRcSk7/FJqeZj5G/UOgOslgv/ouSi22KZ
        q8ek09D9uTUGpYbc8PmKxL1MC65oNkAKsMR/0tc=
X-Google-Smtp-Source: ABdhPJxUDcxVk+yb99akQC+B2itbWtW9iuMkeyxLfGI2/2BrHKa/hwn7RlgQM3Nwf1bWF/IhChEbKzDjKRLkCg7fzPc=
X-Received: by 2002:a05:6808:3027:: with SMTP id ay39mr30584470oib.39.1636763114144;
 Fri, 12 Nov 2021 16:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
 <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
 <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
 <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com>
 <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com>
 <CADvTj4rnc0eJ8a=E-z+O=MQZFDa7XtKoeDkm4LDmVsYXjSVCxw@mail.gmail.com>
 <CANiDSCtKz90fu5RF8aC=6fB3X_g_68B86=w0L+C_YK0Go6K9nw@mail.gmail.com>
 <CADvTj4pKngXK0ihOEMVjs1jA8YJz=1bFJiNdx81zMqS=T7AzNg@mail.gmail.com> <CANiDSCu2KSPr=vwAeb38axPc8=C-GVwsKBJv2UXtVSSkMhrgTw@mail.gmail.com>
In-Reply-To: <CANiDSCu2KSPr=vwAeb38axPc8=C-GVwsKBJv2UXtVSSkMhrgTw@mail.gmail.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Fri, 12 Nov 2021 17:25:02 -0700
Message-ID: <CADvTj4pPDrL_-pbo0gh5wcaS1DdD7p8idG3T65sLMtO7hkPr8Q@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 5:11 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> HI
>
> On Sat, 13 Nov 2021 at 01:07, James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > On Fri, Nov 12, 2021 at 5:02 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > Hi
> > >
> > > On Sat, 13 Nov 2021 at 00:59, James Hilliard <james.hilliard1@gmail.com> wrote:
> > > >
> > > > On Fri, Nov 12, 2021 at 4:50 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > > >
> > > > > HI James
> > > > >
> > > > > You are getting -EPROTO while trying to get the current value of a
> > > > > control. I believe this is a hardware/firmware error.
> > > >
> > > > Hmm, any idea why v4l2-compliance passes some of the time but not
> > > > always?
> > >
> > > Race condition in the firmware?
> > > Not enough current to complete a request and end up in some kind of brown-out?
> >
> > Hmm, think that might be the way the camera might be indicating commands
> > are being sent too fast? Maybe a retry on the first -EPROTO seen would be
> > enough to fix it?
> >
>
> I do not think that it is part of the uvc standard :).

The vendors seem to think the windows uvc driver is the standard I think. :)

>
> What is the model/vendor of the camera?

No idea, something someone found in china from a random vendor.

>
> You might have to implement a quirk for it.

Hmm, looking at a pcap the windows uvc driver looks like it might be sending
a bunch of GET_CUR multiple times for the same request, maybe it makes sense
to try and emulate the behavior there.

>
> > >
> > > It is difficult to know without access to the hardware :)
> > >
> > > Maybe you can replicate what causes the error with just v4l-ctl calls
> > > and then ping the manufacturer with a simple repro.
> > >
> > > >
> > > > >
> > > > >
> > > > > Best regards!
> > >
> > >
> > >
> > > --
> > > Ricardo Ribalda
>
>
>
> --
> Ricardo Ribalda
