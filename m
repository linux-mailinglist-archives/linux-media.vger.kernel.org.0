Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060CE24B2E
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 11:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfEUJKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 05:10:02 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36751 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbfEUJKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 05:10:02 -0400
Received: by mail-ed1-f68.google.com with SMTP id a8so28303942edx.3
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PSdPOItR/QwQaJqAWDzyHjSOY0FhX0Q6RByw0iZfWqY=;
        b=LRgF3QOdZRfOdkdcevF4kHXKpLVf+DmgnDacDANvUI/gJ05zyHF+rFhWral3BX2t5a
         AJ+s8NZT0eJHefNlxPmxnDRpDW3x3YNDwEXIYtO228pxHr+jNhr45VMKgvEdUUF0YW8k
         t3rsUQityMohQJFpsxx9FCJ4P2P235mLpB1no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PSdPOItR/QwQaJqAWDzyHjSOY0FhX0Q6RByw0iZfWqY=;
        b=Lwfv3+Nu61ZS+lw5HTYJVgCwNJ0TcMqVMZUbA7kbj0TBpjogD7X11BjHD0UrBY24+4
         cNhJdM1T+XHTwqLoBzE6OmBl6m0MSrvmUwAfN+pOx3851Nfn9LvH6u5198C0lldOhHD4
         MmcDJT/qNo9htC5nHl2uoa15ZNbyKZasAg5H2kjJANQqd7xutM2yM6l9d/angJtd6gqd
         lus1HreGLHPfQCyPP1MBjC+CSEGl2tEBDfQ7E5AmPEravnxVxth/a6oPPv4WunZTGh3X
         wbtR3lqGmMgyKRV1EasOHeKLNuHMU7KxKJr8YqOM2W4/nQR3rvYlgV+JdtdjaCmQW2V0
         tYhQ==
X-Gm-Message-State: APjAAAXq26sYGHVML7JIgvK3PiHVqGwttQwUAqkkk8E0U6gCM34ObHS6
        xsG03NVR9Txz+JFgvVKbmK4/MI0O1T+w44ua
X-Google-Smtp-Source: APXvYqzsOaUHJebXLr/recgudfL5fDPkIK+VzkzmpN7ODZPvsGh0qZqv0ppZGU/lukb3GxhxB9oTRA==
X-Received: by 2002:a50:92c9:: with SMTP id l9mr81006043eda.75.1558429799536;
        Tue, 21 May 2019 02:09:59 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id f25sm6166878ede.44.2019.05.21.02.09.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 02:09:58 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id g12so17372250wro.8
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 02:09:58 -0700 (PDT)
X-Received: by 2002:a5d:5048:: with SMTP id h8mr681332wrt.177.1558429797759;
 Tue, 21 May 2019 02:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
 <20190117162008.25217-11-stanimir.varbanov@linaro.org> <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
 <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org> <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
 <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org>
In-Reply-To: <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 21 May 2019 18:09:45 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
Message-ID: <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
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

Hi Stan,

On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Tomasz,
>
> On 4/24/19 3:39 PM, Tomasz Figa wrote:
> > On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> Hi Hans,
> >>
> >> On 2/15/19 3:44 PM, Hans Verkuil wrote:
> >>> Hi Stanimir,
> >>>
> >>> I never paid much attention to this patch series since others were busy
> >>> discussing it and I had a lot of other things on my plate, but then I heard
> >>> that this patch made G_FMT blocking.
> >>
> >> OK, another option could be to block REQBUF(CAPTURE) until event from hw
> >> is received that the stream is parsed and the resolution is correctly
> >> set by application. Just to note that I'd think to this like a temporal
> >> solution until gstreamer implements v4l events.
> >>
> >> Is that looks good to you?
> >
> > Hmm, I thought we concluded that gstreamer sets the width and height
> > in OUTPUT queue before querying the CAPTURE queue and so making the
> > driver calculate the CAPTURE format based on what's set on OUTPUT
> > would work fine. Did I miss something?
>
> Nobody is miss something.
>
> First some background about how Venus implements stateful codec API.
>
> The Venus firmware can generate two events "sufficient" and
> "insufficient" buffer requirements (this includes decoder output buffer
> size and internal/scratch buffer sizes). Presently I always set minimum
> possible decoder resolution no matter what the user said, and by that
> way I'm sure that "insufficient" event will always be triggered by the
> firmware (the other reason to take this path is because this is the
> least-common-divider for all supported Venus hw/fw versions thus common
> code in the driver). The reconfiguration (during codec Initialization
> sequence) is made from STREAMON(CAPTURE) context. Now, to make that
> re-configuration happen I need to wait for "insufficient" event from
> firmware in order to know the real coded resolution.
>
> In the case of gstreamer where v4l2_events support is missing I have to
> block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
> STREAMON(CAPTURE) (vb2::start_streaming).
>
> I tried to set the coded resolution to the firmware as-is it set by
> gstreamer but then I cannot receive the "sufficient" event for VP8 and
> VP9 codecs. So I return back to the solution with minimum resolution above.
>
> I'm open for suggestions.

I think you could still keep setting the minimum size and wait for the
"insufficient" event. At the same time, you could speculatively
advertise the expected "sufficient" size on the CAPTURE queue before
the hardware signals those. Even if you mispredict them, you'll get
the event, update the CAPTURE resolution and send the source change
event to the application, which would then give you the correct
buffers. Would that work for you?

Best regards,
Tomasz
