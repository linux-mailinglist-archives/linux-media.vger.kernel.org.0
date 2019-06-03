Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA8E3299C
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 09:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfFCHa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 03:30:56 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36378 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFCHaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 03:30:55 -0400
Received: by mail-ed1-f67.google.com with SMTP id a8so25526381edx.3
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fo/05+9hcZwW8SjdLMg/XD5HT/ASZ+Wu485ITiG25q4=;
        b=QLQwRznFSB/E5WI16dNZSQ5jie0R77DHJ6JJlOD0tT30W++++l6AdGqNNSygq0F3ex
         hushvXYIIt7EpVLKqh6tIfIeeBRMU5bwbs5/asealweqDQ6LVVB+ixq6t30Y8v/vNunv
         /PuCgQE1eHrAPfVhm8Ug+s7AR6hwxlF8W3hck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fo/05+9hcZwW8SjdLMg/XD5HT/ASZ+Wu485ITiG25q4=;
        b=WzkaR41PCnCP6yB0+uQ0k0N2wQwOcV6I1ybql37QpIsWUM3q53VwlE66vv+fDUaUhp
         8LxR48WMUtim2lf2uUPey+Mt8vkQLggACN0R2gSWs92im1+vF/kz6rilJ7g6+8cR5FFZ
         5nRhO/a5ZY1tB5JR2yNiGqpLDZ6nMEfprHHJDxxMttnN+sR4pBsJ10DBiYeAp2AH196Y
         WsN11ays+9kqYoAT3W9ulJSG5/dsZI4oT84SOZOQZG0E0IgQOeCG/jcYqgxQTRJSygW2
         LO+whKnSl8y8UnOGgtmDeCNyivrtUueLrKA5x1F22l0Q48bvti4znCioMVF+VrCtcNAd
         LWyQ==
X-Gm-Message-State: APjAAAVes5YxByCyNnj1ew8Rh73IXZkoSkIXx3YXtYg3AHPxw6ONvaOX
        Ug+o3hfukJ5pA+x92HjwgbufZ3wTjNoJMQ==
X-Google-Smtp-Source: APXvYqxMKWtoagtak2vAszjFpnjLv4TS1qe9u9Pfvh4a4J+DdeIRPrUKmU/sbqZBsBheYkz35N4Ryw==
X-Received: by 2002:a17:906:858f:: with SMTP id v15mr22156936ejx.252.1559547053518;
        Mon, 03 Jun 2019 00:30:53 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id j3sm3775727edh.82.2019.06.03.00.30.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 00:30:52 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id d18so10844433wrs.5
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 00:30:52 -0700 (PDT)
X-Received: by 2002:a5d:568c:: with SMTP id f12mr15245783wrv.77.1559547052239;
 Mon, 03 Jun 2019 00:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
 <20190117162008.25217-11-stanimir.varbanov@linaro.org> <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
 <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org> <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
 <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org> <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
 <01b6683f-9378-e6f2-501f-e2213e6c690d@xs4all.nl> <CAAFQd5Dw-1A2gXuC54Z7808L6Vm9mjPpE7Kbj-TZC18_k_FgVA@mail.gmail.com>
 <a9b11ba0-adca-f974-67a5-a0fe54689bba@xs4all.nl> <CAAFQd5CMpQ4ODyeBPnOv4w9ktqPsiqJtSkpRhAx+XgQ=Lz9crQ@mail.gmail.com>
 <ee62fdb0-d8fa-0695-9088-5aaef48e485f@linaro.org> <0cf25512-97b3-f46a-c266-508368e261d8@xs4all.nl>
In-Reply-To: <0cf25512-97b3-f46a-c266-508368e261d8@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 3 Jun 2019 16:30:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AWSEyAyVVJ21C554cbLRE9tRfCM=iwwJMbmKNKS7NJ2g@mail.gmail.com>
Message-ID: <CAAFQd5AWSEyAyVVJ21C554cbLRE9tRfCM=iwwJMbmKNKS7NJ2g@mail.gmail.com>
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

On Mon, Jun 3, 2019 at 4:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/31/19 10:01 AM, Stanimir Varbanov wrote:
> > Hi,
> >
> > On 5/27/19 11:18 AM, Tomasz Figa wrote:
> >> On Mon, May 27, 2019 at 4:39 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>>
> >>> On 5/27/19 5:51 AM, Tomasz Figa wrote:
> >>>> On Tue, May 21, 2019 at 9:27 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>>>>
> >>>>> On 5/21/19 11:09 AM, Tomasz Figa wrote:
> >>>>>> Hi Stan,
> >>>>>>
> >>>>>> On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
> >>>>>> <stanimir.varbanov@linaro.org> wrote:
> >>>>>>>
> >>>>>>> Hi Tomasz,
> >>>>>>>
> >>>>>>> On 4/24/19 3:39 PM, Tomasz Figa wrote:
> >>>>>>>> On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
> >>>>>>>> <stanimir.varbanov@linaro.org> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Hans,
> >>>>>>>>>
> >>>>>>>>> On 2/15/19 3:44 PM, Hans Verkuil wrote:
> >>>>>>>>>> Hi Stanimir,
> >>>>>>>>>>
> >>>>>>>>>> I never paid much attention to this patch series since others were busy
> >>>>>>>>>> discussing it and I had a lot of other things on my plate, but then I heard
> >>>>>>>>>> that this patch made G_FMT blocking.
> >>>>>>>>>
> >>>>>>>>> OK, another option could be to block REQBUF(CAPTURE) until event from hw
> >>>>>>>>> is received that the stream is parsed and the resolution is correctly
> >>>>>>>>> set by application. Just to note that I'd think to this like a temporal
> >>>>>>>>> solution until gstreamer implements v4l events.
> >>>>>>>>>
> >>>>>>>>> Is that looks good to you?
> >>>>>>>>
> >>>>>>>> Hmm, I thought we concluded that gstreamer sets the width and height
> >>>>>>>> in OUTPUT queue before querying the CAPTURE queue and so making the
> >>>>>>>> driver calculate the CAPTURE format based on what's set on OUTPUT
> >>>>>>>> would work fine. Did I miss something?
> >>>>>>>
> >>>>>>> Nobody is miss something.
> >>>>>>>
> >>>>>>> First some background about how Venus implements stateful codec API.
> >>>>>>>
> >>>>>>> The Venus firmware can generate two events "sufficient" and
> >>>>>>> "insufficient" buffer requirements (this includes decoder output buffer
> >>>>>>> size and internal/scratch buffer sizes). Presently I always set minimum
> >>>>>>> possible decoder resolution no matter what the user said, and by that
> >>>>>>> way I'm sure that "insufficient" event will always be triggered by the
> >>>>>>> firmware (the other reason to take this path is because this is the
> >>>>>>> least-common-divider for all supported Venus hw/fw versions thus common
> >>>>>>> code in the driver). The reconfiguration (during codec Initialization
> >>>>>>> sequence) is made from STREAMON(CAPTURE) context. Now, to make that
> >>>>>>> re-configuration happen I need to wait for "insufficient" event from
> >>>>>>> firmware in order to know the real coded resolution.
> >>>>>>>
> >>>>>>> In the case of gstreamer where v4l2_events support is missing I have to
> >>>>>>> block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
> >>>>>>> STREAMON(CAPTURE) (vb2::start_streaming).
> >>>>>>>
> >>>>>>> I tried to set the coded resolution to the firmware as-is it set by
> >>>>>>> gstreamer but then I cannot receive the "sufficient" event for VP8 and
> >>>>>>> VP9 codecs. So I return back to the solution with minimum resolution above.
> >>>>>>>
> >>>>>>> I'm open for suggestions.
> >>>>>>
> >>>>>> I think you could still keep setting the minimum size and wait for the
> >>>>>> "insufficient" event. At the same time, you could speculatively
> >>>>>> advertise the expected "sufficient" size on the CAPTURE queue before
> >>>>>> the hardware signals those. Even if you mispredict them, you'll get
> >>>>>> the event, update the CAPTURE resolution and send the source change
> >>>>>> event to the application, which would then give you the correct
> >>>>>> buffers. Would that work for you?
> >>>>>
> >>>>> As I understand it this still would require event support, which gstreamer
> >>>>> doesn't have.
> >>>>
> >>>> I don't think it matches what I remember from the earlier discussion.
> >>>> As long as Gstreamer sets the visible resolution (from the container
> >>>> AFAIR) on OUTPUT, the driver would adjust it to something that is
> >>>> expected to be the right framebuffer resolution and so Gstreamer would
> >>>> be able to continue. Of course if the expected value doesn't match, it
> >>>> wouldn't work, but it's the same as currently for Coda AFAICT.
> >>>>
> >>>>>
> >>>>> I think it is OK to have REQBUFS sleep in this case. However, I would only
> >>>>
> >>>> Why REQBUFS? While that could possibly allow us to allocate the right
> >>>> buffers, Gstreamer wouldn't be able to know the right format, because
> >>>> it would query it before REQBUFS, wouldn't it?
> >>>
> >>> Oops, you are right. It's got to be in G_FMT(CAPTURE), but *only* if
> >>> nobody subscribed to the SOURCE_CHANGE event.
> >>>
> >>>>
> >>>> For this reason, s5p-mfc makes G_FMT(CAPTURE) blocking and if we
> >>>> decide to forcefully keep the compatibility, even with in drivers, we
> >>>> should probably do the same here.
> >>>>
> >>>>> enable this behavior if the application didn't subscribe to the SOURCE_CHANGE
> >>>>> event. That's easy enough to check in the driver. And that means that if the
> >>>>> application is well written, then the driver will behave in a completely
> >>>>> standard way that the compliance test can check.
> >>>>
> >>>> I guess one could have some helpers for this. They would listen to the
> >>>> source change events internally and block / wake-up appropriate ioctls
> >>>> whenever necessary.
> >>>
> >>> I really do not want this for new drivers. gstreamer should be fixed.
> >>> A blocking G_FMT is just plain bad. Only those drivers that do this, can
> >>> still block if nobody subscribed to EVENT_SOURCE_CHANGE.
> >>
> >> Yeah and that's why I just suggested to mimic coda, which doesn't
> >> block, but apparently gstreamer still works with it.
> >
> > Unfortunately in Venus case that is not an easy task (as I tried to
> > explain why above).
> >
> > To have an unified and common code for all different SoCs and
> > firmware/hardware versions I decided to set the minimum supported
> > resolution for the decoder (no matter what the user said) and trigger
> > the reconfiguration event always. Something more, I need the event also
> > to retrieve the minimum capture buffers
> > (V4L2_CID_MIN_BUFFERS_FOR_CAPTURE) and sizes for capture and
> > internal/scratch buffers as well, thus I really need to wait for that
> > event.
> >
> > So, just to confirm - you are fine with blocking G_FMT (not REQBUF) when
> > the user doesn't subscribe for v4l2 events?
>
> 'Fine' is too strong a word :-)
>
> But I think this is a reasonable compromise.
>
> Document carefully why you are doing this, since it is purely for backwards
> compatibility reasons. And perhaps at some point in the future the workaround
> might be removed again.

Thanks Hans. I don't have objections either.

Best regards,
Tomasz
