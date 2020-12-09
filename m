Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7822D3A23
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 06:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgLIFH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 00:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbgLIFH5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 00:07:57 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094F4C0613D6
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 21:07:17 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id bo9so213952ejb.13
        for <linux-media@vger.kernel.org>; Tue, 08 Dec 2020 21:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q3NLgFg9+0RUlIIykuKLWs9CjD4F435j35iR2qAmKLE=;
        b=NxGkpUi/oOts1K+HQSMMHnnn+b8Y+8y6ViAjMpa+UMz0Lkfj3C4lCDwNfKpX7hpU69
         Y2JH7fXNBhnthgZQpr9PyPyu1OVysoq6+lMZ8QkM/nk0C9lAGjEc8UbJSZ8pgv7iDU+Y
         r1Zc2in6pxy8+ig3ljiDeAHzT+NoC07QkFixw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q3NLgFg9+0RUlIIykuKLWs9CjD4F435j35iR2qAmKLE=;
        b=UuwbvgGmMmNR5PmEHOtpbh9pnV865u1tC6kOWY7djrBc++devqSffwmoMzXMEAkM6S
         /r2xiNxP6Wz8I/mbxYguqmQJAjLdT52zH8zeZRs4FzRHNiMU2Hggj9dmHlxj9krEM9Fo
         uYijKjA3kRdwlyjhGtXj78RXssZybTPJwzaGYM4sXt8Mz40igUxWksiAGQqof0Oq2t7b
         r88a0Og4CCT+NdI5lM7OvFbt54o5OysuHQKR3W+kQ/dwpVvtAa7DMTlvx8XJmIKmSLBF
         8xFtubcHeB8F9MRLfknxKhPlKFwDFdSM2wTQuHrHbcK0G9bKa7CJzitl0A8MNY3s2Vft
         v1MQ==
X-Gm-Message-State: AOAM532w3wbxAL7vRcquthFs4DR03ZzXkR4zWzrkK+maX0y1cEvvZZ6i
        bALM22W8fRNLHQ1wYVAuir06FwnW+3U1tQ==
X-Google-Smtp-Source: ABdhPJxXXb9V5xSVlzV7W5zxZdcfBOCCVgRdmoNmA58LSpaJxw+pS6XrVmCISzDEx4sWsV666SnsSA==
X-Received: by 2002:a17:906:c046:: with SMTP id bm6mr562330ejb.436.1607490435371;
        Tue, 08 Dec 2020 21:07:15 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id e19sm367302edr.61.2020.12.08.21.07.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 21:07:14 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id x6so284446wro.11
        for <linux-media@vger.kernel.org>; Tue, 08 Dec 2020 21:07:13 -0800 (PST)
X-Received: by 2002:adf:bb0e:: with SMTP id r14mr543768wrg.159.1607490433220;
 Tue, 08 Dec 2020 21:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <cf0b935d-3ccd-8360-1b52-89fab0b181eb@linux.intel.com> <CAG3jFyssMMHpi4WgWmeDjuVYKz12UwJoBT0WoOsdB4PZxnuqSw@mail.gmail.com>
 <e132769f-cfb5-141a-6cd1-603d82a92b9e@linux.intel.com> <CAAFQd5A=kYufStO7ni4j6f+grDpsoigskcj1LdiG9NRN=cvviQ@mail.gmail.com>
 <CAG3jFyuzTPzgTWCHOc1cpXeSe7GyCET0cTYF9r3aOPXdCuZTsw@mail.gmail.com>
 <CAAFQd5AVs4EeV+q87SSdUW3uW_LComGV=HG5J2XaacDvbAgYXg@mail.gmail.com> <CAG3jFyvxLCk=U7Dt8O3poja7yHiRR5B3jq9Xbh_Nsigrjrckcw@mail.gmail.com>
In-Reply-To: <CAG3jFyvxLCk=U7Dt8O3poja7yHiRR5B3jq9Xbh_Nsigrjrckcw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 9 Dec 2020 14:07:01 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CkTx6MwSw8NXjV6xb5Xj5fn_M8ON7YtgvVDhFiY-qx_Q@mail.gmail.com>
Message-ID: <CAAFQd5CkTx6MwSw8NXjV6xb5Xj5fn_M8ON7YtgvVDhFiY-qx_Q@mail.gmail.com>
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
To:     Robert Foss <robert.foss@linaro.org>
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

On Fri, Nov 27, 2020 at 10:38 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Thanks for digging into this everyone!
>
> Assuming Tomasz doesn't find any stretching, I think we can conclude
> that this mode works, and should be kept. Thanks Dongchun for parsing
> the datasheet and finding the Bayer mode issue for the two other
> recently added resolutions.

I checked the raw output and it actually seems to have 3296x2464
non-black pixels. The rightmost 16 ones seem a copy of the ones from
3248. That might be just some padding from the output DMA, though.

Generally all the datasheets I've seen still suggest that only the
middle 3264x2448 are active pixels to be output, so this warrants
double checking this with Omnivision. Let me see what we can do about
this.

Best regards,
Tomasz

>
> On Fri, 27 Nov 2020 at 11:26, Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Thu, Nov 26, 2020 at 7:00 PM Robert Foss <robert.foss@linaro.org> wrote:
> > >
> > > On Wed, 25 Nov 2020 at 08:32, Tomasz Figa <tfiga@chromium.org> wrote:
> > > >
> > > > Hi Bingbu,
> > > >
> > > > On Wed, Nov 25, 2020 at 1:15 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On 11/24/20 6:20 PM, Robert Foss wrote:
> > > > > > On Tue, 24 Nov 2020 at 10:42, Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> > > > > >>
> > > > > >> Hi, Robert
> > > > > >>
> > > > > >> I remember that the full size of ov8856 image sensor is 3296x2480 and we can get the 3280x2464
> > > > > >> frames based on current settings.
> > > > > >>
> > > > > >> Do you have any issues with this mode?
> > > > > >
> > > > > > As far as I can tell using the 3280x2464 mode actually yields an
> > > > > > output resolution that is 3264x2448.
> > > > > >
> > > > > > What does your hardware setup look like? And which revision of the
> > > > > > sensor are you using?
> > > > > >
> > > > >
> > > > > Robert, the sensor revision I am using is v1.1. I just checked the actual output pixels on our
> > > > > hardware, the output resolution with 2464 mode is 3280x2464, no black pixels.
> > > > >
> > > > > As Tomasz said, some ISP has the requirement of extra pixel padding, From the ov8856 datasheet,
> > > > > the central 3264x2448 pixels are *suggested* to be output from the pixel array and the boundary
> > > > > pixels can be used for additional processing. In my understanding, the 32 dummy lines are not
> > > > > black lines.
> > > >
> > > > The datasheet says that only 3264x2448 are active pixels. What pixel
> > > > values are you seeing outside of that central area? In the datasheet,
> > > > those look like "optically black" pixels, which are not 100% black,
> > > > but rather as if the sensor cells didn't receive any light - noise can
> > > > be still there.
> > > >
> > >
> > > I've been developing support for some Qcom ISP functionality, and
> > > during the course of this I ran into the issue I was describing, where
> > > the 3280x2464 mode actually outputs 3264x2448.
> > >
> > > I can think of two reasons for this, either ISP driver bugs on my end
> > > or the fact that the sensor is being run outside of the specification
> > > and which could be resulting in differences between how the ov8856
> > > sensors behave.
> >
> > I just confirmed and we're indeed using this mode in a number of our
> > projects based on the Intel ISP and it seems to be producing a proper
> > image with all pixels of the 3280x2464 matrix having proper values.
> > I'm now double checking whether this isn't some processing done by the
> > ISP, but I suspect the quality would be bad if it stretched the
> > central 3264x2448 part into the 3280x2464 frame.
> >
> > Best regards,
> > Tomasz
