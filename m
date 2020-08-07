Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48DA23EDAC
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 15:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgHGNJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 09:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgHGNJd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 09:09:33 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EF3C061574
        for <linux-media@vger.kernel.org>; Fri,  7 Aug 2020 06:09:32 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id m22so2006593eje.10
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2020 06:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C2XCXsmJyA7W5usz6rBfTizoWqy9Uyp5cHVW9IvGA2c=;
        b=axN4FL/COED5Z5yRiWtsARF1hdhL5JgTJpfZqkBRCXe4tFeCxtQCgehSz7hPjibXzw
         jwYp+AotTyirGdBNg0299qV5KbQxVHSXao/FMMViaFCst/9JCu9xJSDK31A3nNMqhJvE
         RoyggGI4FWc+l3ItIb1XuejWp3OM4WSzgaWNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C2XCXsmJyA7W5usz6rBfTizoWqy9Uyp5cHVW9IvGA2c=;
        b=D0UlW4Sjp2qpmTRBsWhhBkLtYEHppoLavLXDUnoZmZiCfE6v2EzUUuTOHXQkKvD31m
         +r0px9Fm4dFa0RZ3Y/vrmLEXLIBk7/8UGhI/ybUbtGPBR3nk6O32iN1A3h38bXJmtRWY
         acU05vrApaThkBiu7nLS99TZjWLZEcdKWbsFgb2mQi822QDh1+hgeo2keXIBizFgwcX2
         hRCF1V5r07650PRDxcRFN7GasJ2NpE/4aK22ZAIg1gxNC/Lsgx+F/YAZnUzrqPwXCQd4
         BJe9sK0GHX3wcnOtwfZG4bo4M5G6I53Gjs7vllRP652QWo5dOEkjQNYNHwi+ydBDkJN0
         Gxzg==
X-Gm-Message-State: AOAM531iYgYF/gE1s9lj6kCSBQLQXWO9cHvoRzNYPqLN3ySMjWJRGJu3
        gJjNGiWXVSjvQ60qqXzhza7Eu/WjFRtxKB83InrZYQ==
X-Google-Smtp-Source: ABdhPJxrEzTPKTvRkUAnTnQZpqhKI9YTMaeAolXGnU7xz6Imi4rKSsQrGfHqItdJEg+dDbPYVlolH1F5VhxwHH1WaNw=
X-Received: by 2002:a17:906:3850:: with SMTP id w16mr9706026ejc.205.1596805770763;
 Fri, 07 Aug 2020 06:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200710144520.RESEND.1.Id0f52f486e277b5af30babac8ba6b09589962a68@changeid>
 <20200710070332.GA1175842@kroah.com> <CANMq1KDcKWgyYYP_m0-WV7602g7zUbU0PPkvwXxbSTF5vFfKGQ@mail.gmail.com>
 <CANMq1KC7CgUT+neoOUZbnr8MbDgqEikqt2vn8dxAS1rpX=C2aA@mail.gmail.com>
 <20200807062809.GB979264@kroah.com> <CANMq1KD_hJ_ST3du7dcSd8GBtdL4d-C1pWbxXz8Wu8w79-2fUg@mail.gmail.com>
 <20200807100444.0f2d3c94@coco.lan>
In-Reply-To: <20200807100444.0f2d3c94@coco.lan>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 7 Aug 2020 21:09:20 +0800
Message-ID: <CANMq1KD1HDT75YqwyqW-wdGZGSjuq_GvGdwYNF2ZU8Cgx6HHEg@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: atomisp: Replace trace_printk by pr_info
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, lkml <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 7, 2020 at 4:04 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> Em Fri, 7 Aug 2020 14:51:12 +0800
> Nicolas Boichat <drinkcat@chromium.org> escreveu:
>
> > On Fri, Aug 7, 2020 at 2:28 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Aug 07, 2020 at 09:50:23AM +0800, Nicolas Boichat wrote:
> > > > On Fri, Jul 24, 2020 at 8:41 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > > > >
> > > > > On Fri, Jul 10, 2020 at 3:03 PM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Jul 10, 2020 at 02:45:29PM +0800, Nicolas Boichat wrote:
> > > > > > > trace_printk should not be used in production code, replace it
> > > > > > > call with pr_info.
> > > > > > >
> > > > > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > > > ---
> > > > > > > Sent this before as part of a series (whose 4th patch was a
> > > > > > > change that allows to detect such trace_printk), but maybe it's
> > > > > > > easier to get individual maintainer attention by splitting it.
> > > > > >
> > > > > > Mauro should take this soon:
> > > > > >
> > > > > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > >
> > > > > Mauro: did you get a chance to look at this? (and the other similar
> > > > > patch "media: camss: vfe: Use trace_printk for debugging only")
> > > >
> > > > Mauro: Another gentle ping. Thanks.
> > >
> > > It's the middle of the merge window, maintainers can't do anything until
> > > after 5.9-rc1 is out, sorry.
> >
> > Huh, wait, looks like Mauro _did_ pick it (found it in this email
> > "[GIT PULL for v5.8-rc7] media fixes").
> >
> > My bad then, I was expecting an ack ,-)
>
> Never expect acks. Kernel maintainers usually don't send them.

For some reasons I'm working mainly with maintainers who do ,-) I'll
adjust my expectations, thanks.

> Yet, in the case of media, you should probably have received
> an automatic e-mail from our patchwork instance.

Nope, didn't receive anything. But I'm happy to blame gmail for that...

Anyway, I'll ping you again after the merge window closes about
"media: camss: vfe: Use trace_printk for debugging only" (I _think_
that one didn't get merged). Hopefully not too many other
trace_printks made it through the cracks in the meantime ,-)

Thanks, have a good weekend,

>
> Thanks,
> Mauro
