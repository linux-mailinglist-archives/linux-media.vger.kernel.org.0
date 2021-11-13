Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9C744F034
	for <lists+linux-media@lfdr.de>; Sat, 13 Nov 2021 01:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbhKMAOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 19:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbhKMAOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 19:14:35 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79977C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:11:44 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so16257243ote.8
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vVILGSVOwP1qrP2aP0MCuGz3iabPnzydV39LFRHAjnA=;
        b=BPvPbGFaR/DWgEMog2XuyRM7Qg013WYbmyUk9j691+8m/OtZl0Vmq16KzKSbztlymm
         LMFikVEcHaOoswwcZEleyWsD08NHg90jeJ+z0jhPdqcRvV68I40U+5U+iZjJyfO9wNo9
         c+yOIRemyZqss8znwxdttsmk09uBP2d0+QNaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVILGSVOwP1qrP2aP0MCuGz3iabPnzydV39LFRHAjnA=;
        b=mg0HtfHpNuyg/mjdKgZCOTGMC7QwLNl1pNbfPtNV7aeyJWU2tEVf0i2I/pmEIlqiTf
         fiKRyTyDHMsSihYY5bC7y5BThUFMKYMcHdSJznqFqVaxEKtH6YgZl7nirvPDqtePwONa
         d9f6Hg4GMLi4eMkXpR8Fl85KRFMfyMtDx4WrH8wmzrNuZm+33UfM6lVCPUnGsrUym4K7
         gl6xD0moaqRh8oB6zdEhPxf1JAqpPX2XALJP8GaWJecauYt7zgdl5asnTIyT1eBLFg5j
         V7gLDhUzWifF9h8MobszzgN8GdEo+SfPtyj08PU5BrCQY4hUyylsnwY9SEM23UFpqk5B
         503A==
X-Gm-Message-State: AOAM531ZwWAPhhUgjB+Y6vGRq2e2VF8KTISado/s7z6dxUS5DlpPf0dd
        IPYYmSioKqfs9j/ZePlEgEhYrf7VJnsU0MDN
X-Google-Smtp-Source: ABdhPJy/V7L88pI7Fre3HX0Sbp5AKj7XGAdiatHgk1Y+v2izP+msMoY3wV6L+/Tvvn6/zA+xD3XIbw==
X-Received: by 2002:a9d:5f3:: with SMTP id 106mr15786949otd.340.1636762303571;
        Fri, 12 Nov 2021 16:11:43 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id ay42sm1821150oib.22.2021.11.12.16.11.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 16:11:43 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id bf8so20899058oib.6
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:11:42 -0800 (PST)
X-Received: by 2002:a05:6808:6ce:: with SMTP id m14mr16071026oih.134.1636762302522;
 Fri, 12 Nov 2021 16:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
 <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
 <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
 <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com>
 <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com>
 <CADvTj4rnc0eJ8a=E-z+O=MQZFDa7XtKoeDkm4LDmVsYXjSVCxw@mail.gmail.com>
 <CANiDSCtKz90fu5RF8aC=6fB3X_g_68B86=w0L+C_YK0Go6K9nw@mail.gmail.com> <CADvTj4pKngXK0ihOEMVjs1jA8YJz=1bFJiNdx81zMqS=T7AzNg@mail.gmail.com>
In-Reply-To: <CADvTj4pKngXK0ihOEMVjs1jA8YJz=1bFJiNdx81zMqS=T7AzNg@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sat, 13 Nov 2021 01:11:31 +0100
X-Gmail-Original-Message-ID: <CANiDSCu2KSPr=vwAeb38axPc8=C-GVwsKBJv2UXtVSSkMhrgTw@mail.gmail.com>
Message-ID: <CANiDSCu2KSPr=vwAeb38axPc8=C-GVwsKBJv2UXtVSSkMhrgTw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI

On Sat, 13 Nov 2021 at 01:07, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> On Fri, Nov 12, 2021 at 5:02 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi
> >
> > On Sat, 13 Nov 2021 at 00:59, James Hilliard <james.hilliard1@gmail.com> wrote:
> > >
> > > On Fri, Nov 12, 2021 at 4:50 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > >
> > > > HI James
> > > >
> > > > You are getting -EPROTO while trying to get the current value of a
> > > > control. I believe this is a hardware/firmware error.
> > >
> > > Hmm, any idea why v4l2-compliance passes some of the time but not
> > > always?
> >
> > Race condition in the firmware?
> > Not enough current to complete a request and end up in some kind of brown-out?
>
> Hmm, think that might be the way the camera might be indicating commands
> are being sent too fast? Maybe a retry on the first -EPROTO seen would be
> enough to fix it?
>

I do not think that it is part of the uvc standard :).

What is the model/vendor of the camera?

You might have to implement a quirk for it.

> >
> > It is difficult to know without access to the hardware :)
> >
> > Maybe you can replicate what causes the error with just v4l-ctl calls
> > and then ping the manufacturer with a simple repro.
> >
> > >
> > > >
> > > >
> > > > Best regards!
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda
