Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0802C66FD
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 14:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbgK0Nig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 08:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729662AbgK0Nig (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 08:38:36 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6533CC0613D2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 05:38:36 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id w187so4626058pfd.5
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 05:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BHAQM3gbyGwhXE/CkIZq3MYKF3CjSmKc6NmkE6A/KD8=;
        b=HQsyzCOW6lrMVYUftuhnFNbIrnjBX4Qn7rk/0mUYyTP2ydEyAmevy6jObnBrjHsDCa
         p1jujtG+16rNbXB2l56ZkswRy6i8LxNUZ1xCf6HhU9rsxKf16l603x8pTRS21eFm2CNk
         R4jX08wA448hCp+VC7YaYh79x/nEF1BjT61WFn35SQzS95MWKoNIYoQ+oSauoL+HLbJW
         eAQ5m4xJFsJj6hlUG5s/UOJI3cpOkNMoUBPJ0/CbuoRvLaqI2gJiwz6sy0X45EL5731I
         Ew3PrXT1v73/JXGQ6aO3eIHqtSiZI8A600P/5KMDT0+n6Pejqf4nvqSqgk4RFLUk931i
         zwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHAQM3gbyGwhXE/CkIZq3MYKF3CjSmKc6NmkE6A/KD8=;
        b=rfibzEuZtQCPAUCSezCkw2dIUKPgs7awkjx/TTE7NZJ2AkOQ4E+n+KSbg8FHjtzjTm
         uuTcLb68yUpmNr6DbAbCsHQvI4DkYwHKPEeGeYnqtNuG8kqrCByTB6UksrY9rYAhTwqG
         +mfk+5gnzBILSDEY79TdSayaY+3m2AsVw+2NJFQddej1v6LnwHUmph8TgU020ZIuQX5f
         tSYX+Qhbg7b4j/yOpeHJsyJIFSyK7yFa1+Y9gdPQlC1OjG4j4yjJHdIVBZqNxj17ZJBx
         jRRCm/9T6ieBrD7xmmkEW+v1DbL6kdkr1rpFoFpu3dAm2F2ON/4uejOL1z8O0AJbwWWQ
         cmJg==
X-Gm-Message-State: AOAM531tKcogULsybAae7FtVJjSR4e75pj0+RgU+FK/hpWJqLpO05IZy
        qP31sgD/M8CbodovB9pmRvmbQU1WpJU6JUr5dQDR1g==
X-Google-Smtp-Source: ABdhPJxIgmBiENGM0aRcDgRaqDEoKLP411fFBFZhwKYHUmRZmp8QBtnDEjJHRbwZQsu0PF+Ejnj3nowgX4qJLPMl7EI=
X-Received: by 2002:a17:90a:fc92:: with SMTP id ci18mr10008326pjb.75.1606484315870;
 Fri, 27 Nov 2020 05:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <cf0b935d-3ccd-8360-1b52-89fab0b181eb@linux.intel.com> <CAG3jFyssMMHpi4WgWmeDjuVYKz12UwJoBT0WoOsdB4PZxnuqSw@mail.gmail.com>
 <e132769f-cfb5-141a-6cd1-603d82a92b9e@linux.intel.com> <CAAFQd5A=kYufStO7ni4j6f+grDpsoigskcj1LdiG9NRN=cvviQ@mail.gmail.com>
 <CAG3jFyuzTPzgTWCHOc1cpXeSe7GyCET0cTYF9r3aOPXdCuZTsw@mail.gmail.com> <CAAFQd5AVs4EeV+q87SSdUW3uW_LComGV=HG5J2XaacDvbAgYXg@mail.gmail.com>
In-Reply-To: <CAAFQd5AVs4EeV+q87SSdUW3uW_LComGV=HG5J2XaacDvbAgYXg@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 27 Nov 2020 14:38:24 +0100
Message-ID: <CAG3jFyvxLCk=U7Dt8O3poja7yHiRR5B3jq9Xbh_Nsigrjrckcw@mail.gmail.com>
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

Thanks for digging into this everyone!

Assuming Tomasz doesn't find any stretching, I think we can conclude
that this mode works, and should be kept. Thanks Dongchun for parsing
the datasheet and finding the Bayer mode issue for the two other
recently added resolutions.

On Fri, 27 Nov 2020 at 11:26, Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Thu, Nov 26, 2020 at 7:00 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Wed, 25 Nov 2020 at 08:32, Tomasz Figa <tfiga@chromium.org> wrote:
> > >
> > > Hi Bingbu,
> > >
> > > On Wed, Nov 25, 2020 at 1:15 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> > > >
> > > >
> > > >
> > > > On 11/24/20 6:20 PM, Robert Foss wrote:
> > > > > On Tue, 24 Nov 2020 at 10:42, Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> > > > >>
> > > > >> Hi, Robert
> > > > >>
> > > > >> I remember that the full size of ov8856 image sensor is 3296x2480 and we can get the 3280x2464
> > > > >> frames based on current settings.
> > > > >>
> > > > >> Do you have any issues with this mode?
> > > > >
> > > > > As far as I can tell using the 3280x2464 mode actually yields an
> > > > > output resolution that is 3264x2448.
> > > > >
> > > > > What does your hardware setup look like? And which revision of the
> > > > > sensor are you using?
> > > > >
> > > >
> > > > Robert, the sensor revision I am using is v1.1. I just checked the actual output pixels on our
> > > > hardware, the output resolution with 2464 mode is 3280x2464, no black pixels.
> > > >
> > > > As Tomasz said, some ISP has the requirement of extra pixel padding, From the ov8856 datasheet,
> > > > the central 3264x2448 pixels are *suggested* to be output from the pixel array and the boundary
> > > > pixels can be used for additional processing. In my understanding, the 32 dummy lines are not
> > > > black lines.
> > >
> > > The datasheet says that only 3264x2448 are active pixels. What pixel
> > > values are you seeing outside of that central area? In the datasheet,
> > > those look like "optically black" pixels, which are not 100% black,
> > > but rather as if the sensor cells didn't receive any light - noise can
> > > be still there.
> > >
> >
> > I've been developing support for some Qcom ISP functionality, and
> > during the course of this I ran into the issue I was describing, where
> > the 3280x2464 mode actually outputs 3264x2448.
> >
> > I can think of two reasons for this, either ISP driver bugs on my end
> > or the fact that the sensor is being run outside of the specification
> > and which could be resulting in differences between how the ov8856
> > sensors behave.
>
> I just confirmed and we're indeed using this mode in a number of our
> projects based on the Intel ISP and it seems to be producing a proper
> image with all pixels of the 3280x2464 matrix having proper values.
> I'm now double checking whether this isn't some processing done by the
> ISP, but I suspect the quality would be bad if it stretched the
> central 3264x2448 part into the 3280x2464 frame.
>
> Best regards,
> Tomasz
