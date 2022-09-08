Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3636F5B2768
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 22:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiIHUFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 16:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiIHUFO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 16:05:14 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1D44F1AB
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 13:05:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id b35so8045239edf.0
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oYoMt/v4vTlvpwdp5QQQGqpsc3YBcNWm+x8yTK+1ubg=;
        b=dOJPq7Wusw1pL6kq0BYBbAiv7pjtsionq/uuf0Ea1uB+B8txvvHlycgWgbbI2G4oCd
         q6WrXvkp5lx9nDDlIxJqYShctzvTNxYlGQHHigNVabH9fbzhbmbLjSrLEYDHe3GjKQcY
         XXLXxFhJ179HXVnDpfDOKPFAlmlfWb6GMdOu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oYoMt/v4vTlvpwdp5QQQGqpsc3YBcNWm+x8yTK+1ubg=;
        b=prTMsZ1Ao93XKrfdwKeK8VHNA8D51nOEvSeUYjTpRAaZbciwqv7gyCAv4d3z1del22
         NnvFmrAdF0beSWRV2thTIHXdsAO5Fel2DFnMqr3h8/Q6tW9zlu8P8LjYIbLCPTBOPnRX
         0IQyI9VWFgVSbWauh/Oe2pp01RVTLHwzXamidZ8rwTlh3KCBFMHRMjwE/70JxI0ACkIw
         zmaw17Vyk+PvRzSKIdHA2eQHdAyUlNxgWsW+XcrTd9FPmdXLQ2h8ZunVsEVErHDAQ+Ii
         b/Q74IdmPIuR5JutEn5+zfIEQRiTBI8R1/BF8kQ8dPAfbU3W7BDCuIj46516BNZu/fhy
         z7bw==
X-Gm-Message-State: ACgBeo3eF+fOH9Iaeb2HWC4YpXcyLbCLMGuWmOmuzNFdqmdBv244s7ze
        kDZzPnkrAAN4GMCVfUYwurDfahIOKMsgwpybYLE=
X-Google-Smtp-Source: AA6agR6rqk7Wk04PYH00LjaWKK8Jq2VHr56WLDzYEcl+7BEq9skORUEvGhuz48/47CznHUIa1w/Uow==
X-Received: by 2002:a05:6402:1f01:b0:445:fbe8:4b2e with SMTP id b1-20020a0564021f0100b00445fbe84b2emr8620550edb.192.1662667509327;
        Thu, 08 Sep 2022 13:05:09 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id lc19-20020a170906dff300b0074182109623sm1627543ejc.39.2022.09.08.13.05.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 13:05:08 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id q21so18409900edc.9
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 13:05:08 -0700 (PDT)
X-Received: by 2002:aa7:d883:0:b0:44e:bbbe:d661 with SMTP id
 u3-20020aa7d883000000b0044ebbbed661mr8717798edq.248.1662667507693; Thu, 08
 Sep 2022 13:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com> <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat> <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat> <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat> <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
 <CANiDSCuVj6kU9i24wVXqF5Kwr=Dbq56exKEJn9JyeEFUYe9xuw@mail.gmail.com> <YxpC80eZzusR3doI@pendragon.ideasonboard.com>
In-Reply-To: <YxpC80eZzusR3doI@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 8 Sep 2022 22:04:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCtt-K29r+CSdM9vio9wJCp1iTnbVnHECadmwiZdHKcE7g@mail.gmail.com>
Message-ID: <CANiDSCtt-K29r+CSdM9vio9wJCp1iTnbVnHECadmwiZdHKcE7g@mail.gmail.com>
Subject: Re: [Media Summit] ChromeOS Kernel CAM
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 8 Sept 2022 at 21:31, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Thu, Sep 08, 2022 at 08:13:57PM +0200, Ricardo Ribalda wrote:
> > On Thu, 8 Sept 2022 at 20:13, Ricardo Ribalda wrote:
> > > On Thu, 8 Sept 2022 at 17:34, Maxime Ripard wrote:
> > > > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> > > > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > > > > > > Hi Ricardo,
> > > > > > > >
> > > > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > > > > > > > - Still on slide 16, V4L2 as an API is usable without disclosing vendor
> > > > > > > > > >   IP. What is not possible is upstreaming a driver. I don't see this as
> > > > > > > > > >   significantly different between V4L2 and the new API proposal. I
> > > > > > > > > >   expect this to be discussed on Monday.
> > > > > > > > >
> > > > > > > > > I am only considering upstream drivers. There is not much to discuss
> > > > > > > > > for downstream or closed drivers :)
> > > > > > > >
> > > > > > > > Are we really discussing upstream *drivers*? If anything, it looks like
> > > > > > > > the Kcam proposal moves most of the drivers out of upstream.
> > > > > > >
> > > > > > > Given that the API proposal sets at a significant lower level than V4L2
> > > > > > > in the stack, the concept of "userspace driver" (I meant it in the sense
> > > > > > > of GPU support in mesa) plays a bigger role. It would be good to clarify
> > > > > > > what is meant by "driver" and maybe use the term "kernel driver" when
> > > > > > > only the kernel part is covered, to avoid misunderstandings.
> > > > > >
> > > > > > I think there's a bit of a misunderstanding about what exactly is in a
> > > > > > DRM driver, and what is in Mesa.
> > > > > >
> > > > > > Mesa doesn't program the hardware at all, it's merely a glorified
> > > > > > compiler. It's not more of a driver than GCC is an OS. Most importantly
> > > > > > for our discussion, Mesa doesn't perform any kind of register access (or
> > > > > > register access request), only the (kernel) driver does that.
> > > > >
> > > > > Mesa compiles shaders, but also more generally produces command streams
> > > > > that are passed as blobs to the DRM driver, which then forwards them to
> > > > > the device with as little processing and validation as possible (when
> > > > > the device is designed with multi-clients in mind, that processing and
> > > > > validation can be reduced a lot).
> > > >
> > > > That's true, but at no point in time is the CPU ever touches that
> > > > command stream blob in the case of DRM...
> > >
> > > As Laurent says, the latest hardware is very similar to GPUs, you pass
> > > a set of commands to a firmware that does the actual R/W to the
> > > hardware.
>
> *Some* of the latest hardware. There are new SoCs getting to the market
> today with GPUs that are fully programmed from the kernel, and even more
> that are fully programmable from the kernel even if the stack provided
> by the SoC vendor has a firmware that takes care of programming the ISP.
>
> One thing that isn't clear in your proposal is where the line is drawn.
> Passing a blob to the ISP firmware involves some kind of communication
> mechanism, which ultimately deals with hardware registers somewhere.
> It's not clear if those registers are part of the blob that userspace
> passes to the kernel. I'd assume not, but clarifying where the line is
> would be useful.
>
> > > For hardware that is a register set, the vendor should have a good
> > > idea about what kind of validation should be needed: raw access (deny
> > > list) or more abstracted (allow list).
> > >
> > > The most critical part is the DMA, and that will always be abstracted.
> > > Also I doubt that we will have new hardware without an IOMMU, so we
> > > have the same layers of security as today.
>
> I know of SoCs in the making that have ISPs and no IOMMU.

I guess this is why you meant with reserving CVE ranges :)


>
> > > > > Recent ISPs have a similar architecture, with a set of registers used
> > > > > to communicate with the ISP firmware, and then most of the hardware
> > > > > registers for the actual image processing blocks being programmed
> > > > > based from the command stream. "Command stream" may not be a very good
> > > > > term for ISPs as it's not really a stream of commands, but
> > > > > conceptually, we're dealing with a blob that is computed by userspace.
> > > >
> > > > ... while in Kcam, the CPU knows and will interpret that command stream.
> > > > Maybe not in all cases, but it's still a significant difference.
> > > >
> > > > If we had to draw a parallel with something else in the kernel, it looks
> > > > way more like eBPF or the discussion we had on where to parse the
> > > > bitstreams for stateless codecs.
> > > >
> > > > The first one has been severely constrained to avoid the issues we've
> > > > raised, and we all know how the second one went.
> > >
> > > In eBPF, you are moving some user code to the kernel, with an unstable API.
> > >
> > > In KCAM, (and in DRM), you let the user build a set of operations,
> > > that you pass to the kernel via a stable API, then it is validated and
> > > scheduled by the kernel.
> > >
> > > X11 was much more bizarre, the GPIO iomem was remapped into userspace.
> >
> > s/GPIO/GPU/ ;)
>
> --
> Regards,
>
> Laurent Pinchart

Looking forward to Monday :)

-- 
Ricardo Ribalda
