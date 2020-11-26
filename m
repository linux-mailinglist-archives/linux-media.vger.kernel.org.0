Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AFD2C51BB
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 11:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733240AbgKZKAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 05:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731032AbgKZKAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 05:00:31 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FF1C0617A7
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 02:00:31 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id y7so1191233pfq.11
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 02:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5XA0ApxkdYkNVzbIa+l8SCSGXdHgS+0zpLkv05NT+6E=;
        b=m/RAn4j/Di3wbxTiswv/NVX8FZj2MzWPsbTEE7oMx3mNtlF6JO/27T0BRHMKcqIx13
         CapfIcx0h4gRcqnXfy+cI5SEK3zwX7s5+5p7S1/0E82mWg5yOUeF8bCu0ubwExUHV+bD
         al8kPtWGEzCEhvuz878g9apzGL2qKBZ8EbVwjtvYHcZFULVedxWzibmB8aza+tgg+uhd
         bni3r/77FyvJHj6UEuLeopgMSUVWpmQ/StuSk6nJQtsCotugBXB89qgpOQ9uUqAnNKp8
         Ew8nmtAanqUzxGb90N7HyWpw95CEtrZZw3i4hH5DZVZPZNvZjr24dub5IcVyK9ukEaLO
         0bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5XA0ApxkdYkNVzbIa+l8SCSGXdHgS+0zpLkv05NT+6E=;
        b=i1nmW/XC1a904sj7Hl9CQc/2n5SvcJj2mHO7dhf6Km3ZnPgljJnrl+Q11aWIKjQdyW
         FSEm0qRki9W+j08KChAXud+YCdqgabBrQg1VDobSisiWTB8kGrAf2pVQxFFN+8AXdwvD
         hzhRLCW5w/SgEjJso4MDJmmB9W+mVJaBPg6ix4hUz1LLzONIlT6NJJNLSFMZqjtQ7DcY
         xOcqhpDwS0ijk7QtT5K/jz9FUG69A/mXNSmcclJT+NJ3uq3uOSuSXVusqw8ExGXE/jRy
         RUkvyAlIK3jBO3ogOAJ3Zgdt+IzL+Rj/6Vya4b6XHs6eIF8lF/8HojMViBuVqoRz5g8a
         8uOQ==
X-Gm-Message-State: AOAM532oehJMqKRziN5I8VLoe671XG2xXap+c23L2ehYMXRxn9WLmls6
        rgxzjTQOXVgYwItHG08g+QIl02UyypgO/cVD9QCtVA==
X-Google-Smtp-Source: ABdhPJy7ZZ7UL8kL3olk5JHgIK/nEWOE+28BBi6hBer2nnJ+GOvZcds4PdIwtYEbFYRVCRACPbg2VxWduqguu37vNOM=
X-Received: by 2002:a63:a84f:: with SMTP id i15mr2035192pgp.120.1606384830699;
 Thu, 26 Nov 2020 02:00:30 -0800 (PST)
MIME-Version: 1.0
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <cf0b935d-3ccd-8360-1b52-89fab0b181eb@linux.intel.com> <CAG3jFyssMMHpi4WgWmeDjuVYKz12UwJoBT0WoOsdB4PZxnuqSw@mail.gmail.com>
 <e132769f-cfb5-141a-6cd1-603d82a92b9e@linux.intel.com> <CAAFQd5A=kYufStO7ni4j6f+grDpsoigskcj1LdiG9NRN=cvviQ@mail.gmail.com>
In-Reply-To: <CAAFQd5A=kYufStO7ni4j6f+grDpsoigskcj1LdiG9NRN=cvviQ@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 Nov 2020 11:00:19 +0100
Message-ID: <CAG3jFyuzTPzgTWCHOc1cpXeSe7GyCET0cTYF9r3aOPXdCuZTsw@mail.gmail.com>
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ben Kao <ben.kao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 25 Nov 2020 at 08:32, Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Bingbu,
>
> On Wed, Nov 25, 2020 at 1:15 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> >
> >
> >
> > On 11/24/20 6:20 PM, Robert Foss wrote:
> > > On Tue, 24 Nov 2020 at 10:42, Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> > >>
> > >> Hi, Robert
> > >>
> > >> I remember that the full size of ov8856 image sensor is 3296x2480 and we can get the 3280x2464
> > >> frames based on current settings.
> > >>
> > >> Do you have any issues with this mode?
> > >
> > > As far as I can tell using the 3280x2464 mode actually yields an
> > > output resolution that is 3264x2448.
> > >
> > > What does your hardware setup look like? And which revision of the
> > > sensor are you using?
> > >
> >
> > Robert, the sensor revision I am using is v1.1. I just checked the actual output pixels on our
> > hardware, the output resolution with 2464 mode is 3280x2464, no black pixels.
> >
> > As Tomasz said, some ISP has the requirement of extra pixel padding, From the ov8856 datasheet,
> > the central 3264x2448 pixels are *suggested* to be output from the pixel array and the boundary
> > pixels can be used for additional processing. In my understanding, the 32 dummy lines are not
> > black lines.
>
> The datasheet says that only 3264x2448 are active pixels. What pixel
> values are you seeing outside of that central area? In the datasheet,
> those look like "optically black" pixels, which are not 100% black,
> but rather as if the sensor cells didn't receive any light - noise can
> be still there.
>

I've been developing support for some Qcom ISP functionality, and
during the course of this I ran into the issue I was describing, where
the 3280x2464 mode actually outputs 3264x2448.

I can think of two reasons for this, either ISP driver bugs on my end
or the fact that the sensor is being run outside of the specification
and which could be resulting in differences between how the ov8856
sensors behave.
