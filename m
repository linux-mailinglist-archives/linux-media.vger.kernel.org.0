Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1ACC2C6311
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgK0K0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:26:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbgK0K0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:26:52 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE59C0613D4
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 02:26:51 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id mc24so6884073ejb.6
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 02:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TkOHQKTJtQe0c6uHCNCzZuOlIoXCuox8ChgdYtvl4RE=;
        b=I0vC7PwpEZCoL+lnpk/fcIdWjkizsXIdAAx6LJtXiXI4leglPhdLPhqlMA3icki53i
         HyBgryTsqI560+oieoEt98fIs/iMG03u7BlRn1+Vey0aZDXZpYayYbNJ/T7j4nF4pCld
         W+i8jO16z3gPu8VWqtP5HFsbuVLr7/0HxK3yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TkOHQKTJtQe0c6uHCNCzZuOlIoXCuox8ChgdYtvl4RE=;
        b=Sup/9ntaHRfXFp8roJoiwieMFUxINh+YSaB782aKPuJsRkW0JkTl1lHTewAJ0En9Fi
         aFfWLaZkmmW8m8w8W3a/aCcSZYqP3u0m5sLyO9YXlljvAerrcd2+WB4OL6bVq4g+Rhf4
         JrCaP24Sn/m4EcEeJhV2Ksl5YQGhIyMgvEM2AQjgI/S29WunrJfSINr7OCrLy7dEPOvV
         Mjj6ovuMQCimvtxIUaOowiAIU7hRe5Q/ESCRd7Ei0xKzgii8dNN2pp9CdD1kSPxUCrpY
         CZejuOEHJQSiPtqiAVJ0WaM8bLiaPC0CYPQxfrhX57EpdID+tJzp+eN1BhCkH90SsNrz
         zUDQ==
X-Gm-Message-State: AOAM532zJLR+AFvcqsGvB5FLZb7wguknlWwepU6ystgddONMdx2QAOKt
        Kkel5nYySZruZ/JoNX2etDjdf1vz+yb0Tg==
X-Google-Smtp-Source: ABdhPJxQAjGBrxupUsz+3La7eoulQPcimdnGou/eRcK5M4I2AjB/UvoQytaDBvFQUnrmpIp6QCkh8Q==
X-Received: by 2002:a17:906:180b:: with SMTP id v11mr6827855eje.466.1606472809581;
        Fri, 27 Nov 2020 02:26:49 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id q5sm4587336ejr.89.2020.11.27.02.26.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 02:26:48 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id u12so5041373wrt.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 02:26:48 -0800 (PST)
X-Received: by 2002:adf:e54f:: with SMTP id z15mr9785451wrm.159.1606472807482;
 Fri, 27 Nov 2020 02:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <cf0b935d-3ccd-8360-1b52-89fab0b181eb@linux.intel.com> <CAG3jFyssMMHpi4WgWmeDjuVYKz12UwJoBT0WoOsdB4PZxnuqSw@mail.gmail.com>
 <e132769f-cfb5-141a-6cd1-603d82a92b9e@linux.intel.com> <CAAFQd5A=kYufStO7ni4j6f+grDpsoigskcj1LdiG9NRN=cvviQ@mail.gmail.com>
 <CAG3jFyuzTPzgTWCHOc1cpXeSe7GyCET0cTYF9r3aOPXdCuZTsw@mail.gmail.com>
In-Reply-To: <CAG3jFyuzTPzgTWCHOc1cpXeSe7GyCET0cTYF9r3aOPXdCuZTsw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 27 Nov 2020 19:26:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AVs4EeV+q87SSdUW3uW_LComGV=HG5J2XaacDvbAgYXg@mail.gmail.com>
Message-ID: <CAAFQd5AVs4EeV+q87SSdUW3uW_LComGV=HG5J2XaacDvbAgYXg@mail.gmail.com>
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

On Thu, Nov 26, 2020 at 7:00 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Wed, 25 Nov 2020 at 08:32, Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > Hi Bingbu,
> >
> > On Wed, Nov 25, 2020 at 1:15 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> > >
> > >
> > >
> > > On 11/24/20 6:20 PM, Robert Foss wrote:
> > > > On Tue, 24 Nov 2020 at 10:42, Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> > > >>
> > > >> Hi, Robert
> > > >>
> > > >> I remember that the full size of ov8856 image sensor is 3296x2480 and we can get the 3280x2464
> > > >> frames based on current settings.
> > > >>
> > > >> Do you have any issues with this mode?
> > > >
> > > > As far as I can tell using the 3280x2464 mode actually yields an
> > > > output resolution that is 3264x2448.
> > > >
> > > > What does your hardware setup look like? And which revision of the
> > > > sensor are you using?
> > > >
> > >
> > > Robert, the sensor revision I am using is v1.1. I just checked the actual output pixels on our
> > > hardware, the output resolution with 2464 mode is 3280x2464, no black pixels.
> > >
> > > As Tomasz said, some ISP has the requirement of extra pixel padding, From the ov8856 datasheet,
> > > the central 3264x2448 pixels are *suggested* to be output from the pixel array and the boundary
> > > pixels can be used for additional processing. In my understanding, the 32 dummy lines are not
> > > black lines.
> >
> > The datasheet says that only 3264x2448 are active pixels. What pixel
> > values are you seeing outside of that central area? In the datasheet,
> > those look like "optically black" pixels, which are not 100% black,
> > but rather as if the sensor cells didn't receive any light - noise can
> > be still there.
> >
>
> I've been developing support for some Qcom ISP functionality, and
> during the course of this I ran into the issue I was describing, where
> the 3280x2464 mode actually outputs 3264x2448.
>
> I can think of two reasons for this, either ISP driver bugs on my end
> or the fact that the sensor is being run outside of the specification
> and which could be resulting in differences between how the ov8856
> sensors behave.

I just confirmed and we're indeed using this mode in a number of our
projects based on the Intel ISP and it seems to be producing a proper
image with all pixels of the 3280x2464 matrix having proper values.
I'm now double checking whether this isn't some processing done by the
ISP, but I suspect the quality would be bad if it stretched the
central 3264x2448 part into the 3280x2464 frame.

Best regards,
Tomasz
