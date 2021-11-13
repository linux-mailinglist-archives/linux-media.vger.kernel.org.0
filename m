Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FA444F02D
	for <lists+linux-media@lfdr.de>; Sat, 13 Nov 2021 01:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbhKMAKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 19:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhKMAKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 19:10:41 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B069C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:07:50 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id m6so20956414oim.2
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbBgetScU27GXnZRVMZzRRMu64Soa+fKqbuwkiLwxkE=;
        b=lwxeDMEQl4R5Y4lt1rGEGkolpK51Yykzuk6ApKDHuL1SNoyRnCgOjc70BJIDWupdoX
         Rhped2L/oEGQfGyDZexdkfG4eHfXAs7wOfb/khMwdL5GQi6UGYiRmFLqenQNzbiya29I
         fQ9t2lgTo8f9HxU/WuoYQm6fNiT3n4kR9KlDHhGaYBNkO0iqmbWj/zqoRqNycjitAYFb
         4Qed65HlYkAyW2x/UnvWXG9NTkcSDK8oRgRg6eRKAtmQ9C2LvsxUPIt2LckXCudobANs
         eOGyWhNt/2ERB/BsOYAlqH8jv2dcQwHG2PAPdcynJgyx0UV1fm6drccSPYBSCEgTmbk0
         N2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbBgetScU27GXnZRVMZzRRMu64Soa+fKqbuwkiLwxkE=;
        b=mODUuRK7NHc/KxmrfSfWJ28n+3z6jrw6p51ObymygGq4CmRc4Rjk+RfTe+Ob9Qc5tH
         kYnYLnbeTbeYf7zIx+hXWuAHi+0WuY4g72NhtllD6zaTrKEsrgoFG25gSfqjVxiptn43
         joF5GlY/gWZBhQWHmWKI2m6GmmaBpwGkCmRrb8/PKtGNOnKAelBWDGbqJEmVL+bt/8Hg
         gBqcY8Ib/j6RytayDIZ560BUu5gjoDfuHGZk/+NcHjkAujiy55KAIbCc6qb5BcO54NWN
         yMDBaPd9dazMPeLr6ngc8T5wHyYldd156Jmv2CU4fLTDNjshOM7naWTcbdaUWSutVyEq
         5wbA==
X-Gm-Message-State: AOAM530i4gSGEB/uLbQU61J55EMf/vfVJKMMwJS8hNerFtBrwRt4JubA
        tGOWBIOU/JCumwncxOl5AR4MuiGBpcZTZwx5T8Q=
X-Google-Smtp-Source: ABdhPJx8JZEcGGBHcB43WA6smaHEQGOHs0P5hQAJBDFs4uoajrw4dfpZOHYd94WyXcVvwUKuCwI3OFaLtgNSn/pUsB4=
X-Received: by 2002:a05:6808:118c:: with SMTP id j12mr15991550oil.65.1636762069733;
 Fri, 12 Nov 2021 16:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
 <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
 <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
 <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com>
 <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com>
 <CADvTj4rnc0eJ8a=E-z+O=MQZFDa7XtKoeDkm4LDmVsYXjSVCxw@mail.gmail.com> <CANiDSCtKz90fu5RF8aC=6fB3X_g_68B86=w0L+C_YK0Go6K9nw@mail.gmail.com>
In-Reply-To: <CANiDSCtKz90fu5RF8aC=6fB3X_g_68B86=w0L+C_YK0Go6K9nw@mail.gmail.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Fri, 12 Nov 2021 17:07:38 -0700
Message-ID: <CADvTj4pKngXK0ihOEMVjs1jA8YJz=1bFJiNdx81zMqS=T7AzNg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 5:02 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi
>
> On Sat, 13 Nov 2021 at 00:59, James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > On Fri, Nov 12, 2021 at 4:50 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > HI James
> > >
> > > You are getting -EPROTO while trying to get the current value of a
> > > control. I believe this is a hardware/firmware error.
> >
> > Hmm, any idea why v4l2-compliance passes some of the time but not
> > always?
>
> Race condition in the firmware?
> Not enough current to complete a request and end up in some kind of brown-out?

Hmm, think that might be the way the camera might be indicating commands
are being sent too fast? Maybe a retry on the first -EPROTO seen would be
enough to fix it?

>
> It is difficult to know without access to the hardware :)
>
> Maybe you can replicate what causes the error with just v4l-ctl calls
> and then ping the manufacturer with a simple repro.
>
> >
> > >
> > >
> > > Best regards!
>
>
>
> --
> Ricardo Ribalda
