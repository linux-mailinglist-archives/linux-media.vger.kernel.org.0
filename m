Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450E271FDF8
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbjFBJfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbjFBJfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:35:14 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC7D134
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:35:12 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-568a1011488so19320237b3.0
        for <linux-media@vger.kernel.org>; Fri, 02 Jun 2023 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685698511; x=1688290511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TNtL+HaHYcCzGsAszlpcGyTOt/sHQdc5dZnH/1SKHwg=;
        b=VTIKds4k8goHyWLnVwAdSTDSNCltN6lOwySDeCr66xfAJHTuIWO/+c/3QA4B5IW3Ov
         Fz4XHo0U7ipaY1P0WPWckMPGlA1bbZ0Cn7j5tGL48oaTZ7wBDQ8B3dcM3wbyPIo3myVH
         KfcIwoYQrVm3xQLoM9+i9WO+3DLSQPysQLlesra3dviKei2SzduyGixoR4Xh15N74Tcl
         5Rl3hTJYNBjOhThMj/5L8ZJfkETKWVhGImPZ1VhqMOpAPAxQ1JdlVOxeW9awbK1W/v6S
         PxFyE4OdZcrJ4+aNDGRZRhL2yhPuW/TbjICb5g3SlD2We1b0QYbeWAlv7AngZR+tT3KR
         EVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685698511; x=1688290511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNtL+HaHYcCzGsAszlpcGyTOt/sHQdc5dZnH/1SKHwg=;
        b=VApTc2MMgA1Zse+GkNS7S7dRnFsVyzGlBxi0rPvAXzWCVrFJZJA59onDH53h1wNfFV
         RlWMgF+0o0cj5xJ1aeCq39+gEegm9PPkfxWvghXHCdTwxuMgF4XxShj/gDqO0tD2p80X
         +sDJLoD+QEzFZvRSQWVoSaZawWhofM3zZrNw3ol8m9HhwSP1a3pN4++WhrJMh4bIDhqG
         L/JhSQWWulyPXELITfKlFaZ5e3TEUoaLt0qS7OWmwX78wzp1Wd9wfpJTzxXR60HfeN3a
         kXuTRv/ErLXliC4WPgD5zaGB9SQU+b1hEIaeNcxi5NfqVB45iSU5jRanhyExlN2gMcA2
         morQ==
X-Gm-Message-State: AC+VfDx6zRblUhCfzrhGn+rFmJQSLHzG1k/uDdcEHZQvGb2EobiIIcUD
        XX1vbNnlEKWz3YMMu0eGPkGVT2Kbb9FOXizyGZspbw==
X-Google-Smtp-Source: ACHHUZ7jpwo/bhl0qKAKPfXftPrUtP3EvEXTaWpvaGd0n//icnWr7FwFoCptZbKunqFUa2wU+ZRNc6HA35mcfrbOSzg=
X-Received: by 2002:a0d:df81:0:b0:565:9387:9c61 with SMTP id
 i123-20020a0ddf81000000b0056593879c61mr12659553ywe.7.1685698511423; Fri, 02
 Jun 2023 02:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <CAEmqJPp_3e248mKRMK2fY2vwQi=HzqCsP6zTyWfOXFYbOFC0_Q@mail.gmail.com> <ZHmsddS7gaAyFu+N@kekkonen.localdomain>
In-Reply-To: <ZHmsddS7gaAyFu+N@kekkonen.localdomain>
From:   Naushir Patuck <naush@raspberrypi.com>
Date:   Fri, 2 Jun 2023 10:35:08 +0100
Message-ID: <CAEmqJPq9wS6mAvCYF2ryo4+sr0wO2OGMC_qNoaBjWW6V9sF=TA@mail.gmail.com>
Subject: Re: [RFC 0/7] Generic line based metadata support, internal pads
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, 2 Jun 2023 at 09:46, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Naushir,
>
> On Fri, Jun 02, 2023 at 08:54:35AM +0100, Naushir Patuck wrote:
> > Hi Sakari,
> >
> > Thank you for working on this. Sensor metadata is something that
> > Raspberry Pi do make extensive use of, and our downstream changes to
> > support it, although a bit hacky, are not too dissimilar to your proposal
> > here.
> >
> > On Fri, 5 May 2023 at 22:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi folks,
> > >
> > > Here are a few patches to add support generic, line based metadata as well
> > > as internal source pads. While the amount of code is not very large, to
> > > the contrary it is quite small actually IMO, I presume what this is about
> > > and why it is being proposed requires some explaining.
> > >
> > > Metadata mbus codes and formats have existed for some time in V4L2. They
> > > however have been only used by drivers that produce the data itself and
> > > effectively this metadata has always been statistics of some sort (at
> > > least when it comes to ISPs). What is different here is that we intend to
> > > add support for metadata originating from camera sensors.
> > >
> > > Camera sensors produce different kinds of metadata, embedded data (usually
> > > register address--value pairs used to capture the frame, in a more or less
> > > sensor specific format), histograms (in a very sensor specific format),
> > > dark pixels etc. The number of these formats is probably going to be about
> > > as large as image data formats if not larger, as the image data formats
> > > are much better standardised but a smaller subset of them will be
> > > supported by V4L2, at least initially but possibly much more in the long
> > > run.
> > >
> > > Having this many device specific formats would be a major problem for all
> > > the other drivers along that pipeline (not to mention the users of those
> > > drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> > > receiver drivers that have DMA: the poor driver developer would not only
> > > need to know camera sensor specific formats but to choose the specific
> > > packing of that format suitable for the DMA used by the hardware. It is
> > > unlikely many of these would ever get tested while being present on the
> > > driver API. Also adding new sensors with new embedded data formats would
> > > involve updating all bridge and CSI-2 receiver drivers. I don't expect
> > > this to be a workable approach.
> > >
> > > Instead what I'm proposing is to use specific metadata formats on the
> > > sensor devices only, on internal pads (more about those soon) of the
> > > sensors, only visible in the UAPI, and then generic mbus formats along the
> > > pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> > > to bit depth and packing). This would unsnarl the two, defining what data
> > > there is (specific mbus code) and how that is transported and packed
> > > (generic mbus codes and V4L2 formats).
> > >
> > > The user space would be required to "know" the path of that data from the
> > > sensor's internal pad to the V4L2 video node. I do not see this as these
> > > devices require at least some knowledge of the pipeline, i.e. hardware at
> > > hand. Separating what the data means and how it is packed may even be
> > > beneficial: it allows separating code that interprets the data (sensor
> > > internal mbus code) from the code that accesses it (packing).
> > >
> > > These formats are in practice line based, meaning that there may be
> > > padding at the end of the line, depending on the bus as well as the DMA.
> > > If non-line based formats are needed, it is always possible to set the
> > > "height" field to 1.
> >
> > One thing that may be worth considering or clarifying - for the case of
> > the BCM2835 Unicam CSI-2 device, we only have 2x DMA output channels. So
> > one will match image data packets, and the other will match "everything
> > else". Typically "everything else" would only be CSI-2 embedded data, but
> > in the case of the Raspberry Pi Camera v3 (IMX708), it includes embedded
> > data, PDAF data, and HDR histogram data. Each of these outputs can be
> > programmed to use a different packet ID in the sensor, but since Unicam
> > only has a single DMA for "everything else", it all gets dumped into one
> > metadata buffer. But given we know the exact structure of the data
> > streams, it's trivial for useland to find the right bits in this buffer.
> > Of course, other CSI-2 receivers with more DMA channels might allow these
> > streams to end up in their own buffers.
> >
> > Nothing in your series seems to stop us operating Unicam in this way,
> > particularly because there is no fixed definition of the data format for
> > V4L2_META_FMT_GENERIC_8. So I don't think it's a problem, but perhaps
> > it's worth documenting that the metadata might include multiple streams
> > from the sensor?
>
> I believe this happens on other hardware, too, indeed. Currently the
> documentation says that
>
>         Any number of routes from streams on sink pads towards streams on
>         source pads is allowed, to the extent supported by drivers. For
>         every stream on a source pad, however, only a single route is
>         allowed.
>
>         (Documentation/userspace-api/media/v4l/dev-subdev.rst)
>
> This probably needs to be changed to allow what you'd need?

Yes, that last sentence sounds like it would (artificially wrt your
series) limit
metadata buffers to only handle a single output stream.  However, I may have got
the context of the paragraph wrong as well :)

Regards,
Naush

>
> --
> Kind regards,
>
> Sakari Ailus
