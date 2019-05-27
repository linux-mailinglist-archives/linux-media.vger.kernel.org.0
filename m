Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0F62AD6B
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 05:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfE0Dvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 23:51:42 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33293 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfE0Dvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 23:51:41 -0400
Received: by mail-ed1-f67.google.com with SMTP id n17so24608980edb.0
        for <linux-media@vger.kernel.org>; Sun, 26 May 2019 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D0QV8qyfvSFrB2pCHlJaBkLaI6mf2LLeBc50MxxOpH8=;
        b=MJglQuI93h/MaSGCbXpu+1/2njRn2SFnTRXg0exJjB8T3VjOTgwLuhH/Wnbh501X8T
         pLiLZ+agaxbwhmWjj1kTZilthQ4/cuEYUj96l7xADwCpD7aCog/g6PqXbBiUBc48Dw6o
         XqeoEdTY/p4h78o3Odmn+2BjwEbXmyr3yQWwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D0QV8qyfvSFrB2pCHlJaBkLaI6mf2LLeBc50MxxOpH8=;
        b=KsIxrhTj8E+BSXWnYUa9/EzbukeNmHA0KQBTOx4Z6ijfG9wqjVG4XKttccaL5+GRco
         /EO7yvqJtX7d+Jq9sxkypwy/hXapd8hM+4Dmtfb/YKxD/yLb3ZxDVdIQyJL8gRNTJ0z0
         p4w2AIacdGL+SR9KExlpEJ+g4QFVsMLcFQcm9nVN+vF8y/S79ungl37epc3ARgCk+qBu
         J/rGFiWFKUe91nybUBG1DZT38OVAVWFjB9X57Iu9BxLwF4OIbdMuqkYubjDvH0L9Uuwc
         a/6ymaZgWIxaCAN6ehEE9rWG//MF8LKbSQE+MG99j4XsxwXeibXomoLCbyn1AaoGJhqA
         Zz8A==
X-Gm-Message-State: APjAAAX5n2PW2OouETxOdnHF2GBcH8g1q+A/dP6ueNdUBMXAgKCWve3s
        aMausqYz0SaDhU3n3N4L3pAxo5Z9RwsJZA==
X-Google-Smtp-Source: APXvYqybOioPUSlFVWa6P21IP7+bjfz+gHDpV5SyaLDR69Noy2+OKYxDNbwBrF3sHgWuucg0fVpmpQ==
X-Received: by 2002:a50:ae84:: with SMTP id e4mr121002953edd.33.1558929099524;
        Sun, 26 May 2019 20:51:39 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id v16sm2934168edm.56.2019.05.26.20.51.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 20:51:38 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id d17so1434084wmb.3
        for <linux-media@vger.kernel.org>; Sun, 26 May 2019 20:51:38 -0700 (PDT)
X-Received: by 2002:a1c:994f:: with SMTP id b76mr7388714wme.90.1558929098045;
 Sun, 26 May 2019 20:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
 <20190117162008.25217-11-stanimir.varbanov@linaro.org> <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
 <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org> <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
 <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org> <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
 <01b6683f-9378-e6f2-501f-e2213e6c690d@xs4all.nl>
In-Reply-To: <01b6683f-9378-e6f2-501f-e2213e6c690d@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 27 May 2019 12:51:26 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dw-1A2gXuC54Z7808L6Vm9mjPpE7Kbj-TZC18_k_FgVA@mail.gmail.com>
Message-ID: <CAAFQd5Dw-1A2gXuC54Z7808L6Vm9mjPpE7Kbj-TZC18_k_FgVA@mail.gmail.com>
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Malathi Gottam <mgottam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 21, 2019 at 9:27 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/21/19 11:09 AM, Tomasz Figa wrote:
> > Hi Stan,
> >
> > On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> Hi Tomasz,
> >>
> >> On 4/24/19 3:39 PM, Tomasz Figa wrote:
> >>> On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
> >>> <stanimir.varbanov@linaro.org> wrote:
> >>>>
> >>>> Hi Hans,
> >>>>
> >>>> On 2/15/19 3:44 PM, Hans Verkuil wrote:
> >>>>> Hi Stanimir,
> >>>>>
> >>>>> I never paid much attention to this patch series since others were busy
> >>>>> discussing it and I had a lot of other things on my plate, but then I heard
> >>>>> that this patch made G_FMT blocking.
> >>>>
> >>>> OK, another option could be to block REQBUF(CAPTURE) until event from hw
> >>>> is received that the stream is parsed and the resolution is correctly
> >>>> set by application. Just to note that I'd think to this like a temporal
> >>>> solution until gstreamer implements v4l events.
> >>>>
> >>>> Is that looks good to you?
> >>>
> >>> Hmm, I thought we concluded that gstreamer sets the width and height
> >>> in OUTPUT queue before querying the CAPTURE queue and so making the
> >>> driver calculate the CAPTURE format based on what's set on OUTPUT
> >>> would work fine. Did I miss something?
> >>
> >> Nobody is miss something.
> >>
> >> First some background about how Venus implements stateful codec API.
> >>
> >> The Venus firmware can generate two events "sufficient" and
> >> "insufficient" buffer requirements (this includes decoder output buffer
> >> size and internal/scratch buffer sizes). Presently I always set minimum
> >> possible decoder resolution no matter what the user said, and by that
> >> way I'm sure that "insufficient" event will always be triggered by the
> >> firmware (the other reason to take this path is because this is the
> >> least-common-divider for all supported Venus hw/fw versions thus common
> >> code in the driver). The reconfiguration (during codec Initialization
> >> sequence) is made from STREAMON(CAPTURE) context. Now, to make that
> >> re-configuration happen I need to wait for "insufficient" event from
> >> firmware in order to know the real coded resolution.
> >>
> >> In the case of gstreamer where v4l2_events support is missing I have to
> >> block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
> >> STREAMON(CAPTURE) (vb2::start_streaming).
> >>
> >> I tried to set the coded resolution to the firmware as-is it set by
> >> gstreamer but then I cannot receive the "sufficient" event for VP8 and
> >> VP9 codecs. So I return back to the solution with minimum resolution above.
> >>
> >> I'm open for suggestions.
> >
> > I think you could still keep setting the minimum size and wait for the
> > "insufficient" event. At the same time, you could speculatively
> > advertise the expected "sufficient" size on the CAPTURE queue before
> > the hardware signals those. Even if you mispredict them, you'll get
> > the event, update the CAPTURE resolution and send the source change
> > event to the application, which would then give you the correct
> > buffers. Would that work for you?
>
> As I understand it this still would require event support, which gstreamer
> doesn't have.

I don't think it matches what I remember from the earlier discussion.
As long as Gstreamer sets the visible resolution (from the container
AFAIR) on OUTPUT, the driver would adjust it to something that is
expected to be the right framebuffer resolution and so Gstreamer would
be able to continue. Of course if the expected value doesn't match, it
wouldn't work, but it's the same as currently for Coda AFAICT.

>
> I think it is OK to have REQBUFS sleep in this case. However, I would only

Why REQBUFS? While that could possibly allow us to allocate the right
buffers, Gstreamer wouldn't be able to know the right format, because
it would query it before REQBUFS, wouldn't it?

For this reason, s5p-mfc makes G_FMT(CAPTURE) blocking and if we
decide to forcefully keep the compatibility, even with in drivers, we
should probably do the same here.

> enable this behavior if the application didn't subscribe to the SOURCE_CHANGE
> event. That's easy enough to check in the driver. And that means that if the
> application is well written, then the driver will behave in a completely
> standard way that the compliance test can check.

I guess one could have some helpers for this. They would listen to the
source change events internally and block / wake-up appropriate ioctls
whenever necessary.

Another question: If we intend this to be implemented in new drivers
too, should it be documented in the spec?

Best regards,
Tomasz
