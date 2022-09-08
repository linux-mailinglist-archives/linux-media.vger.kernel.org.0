Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFBB5B2568
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 20:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiIHSNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 14:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiIHSNe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 14:13:34 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2719AD021F
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 11:13:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id nc14so39927869ejc.4
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 11:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uC39EJU1LieWTCdjO37tR6KulVcAfaOgh8zkalgEnME=;
        b=EqfMzEEuLJ61BfDA2XCo0NGKuENrR3qY8XkT0epVEDiMSo2oYA5V1C0PCLgUkWXWia
         dDAeJknyz0jrhwFawcDm6CK5FmTtvhsTkx9z+1m5EviJ4i0LdwPC/mIPJdYMvsHcpsX8
         t176pV95FCE74hDj7W9M9bodLWU4IBN5vd6Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uC39EJU1LieWTCdjO37tR6KulVcAfaOgh8zkalgEnME=;
        b=GXqXKcpbLKvsJfSmjr6sBpT15KvzL8T5rnTgUcKh++XBAjnhY0ud6MRVl/MjYyJq+i
         5Ld1lrOmrUr8FGQ/hEATTgzyD/Ya6b6Gwr3TQDD5HJRGdaKBf893xwXalivmWHQmJEWV
         MkuPlO/tPyjQq5tvZjHls/AwGhUvhzdA+Aozabob6UwsnGGpdTgVThOnudqYk+AvZySV
         tzNx9a4CqYCrqpCZG65Jgcae3gsVZDYFe3YvZFfATq9l+MYecHoZpMSySIY84EN6mgDB
         INXengGNgnJhXK7I7OObTPS/haLqqT58mjlxEoz2bHJ7bE5rGtKgDYnKBlEcdw8xzvWw
         YEjQ==
X-Gm-Message-State: ACgBeo0KqW0TCRXqJ3qCkOIpklETvKRXB+tJAOlXy4GnOZ0ppM5p4CR+
        idVDizlQmJQmBYMpnkNmh3CVQCK1eGqjOHabtYY=
X-Google-Smtp-Source: AA6agR7Rf/ZjMPHQ0NRbJK1MqZmUf3/vixFJiinGZU0aySwOazPq9/z1OE0nHt+ULpAqH3Vf/KutWA==
X-Received: by 2002:a17:907:3e85:b0:73d:60cc:5d06 with SMTP id hs5-20020a1709073e8500b0073d60cc5d06mr7160984ejc.722.1662660811569;
        Thu, 08 Sep 2022 11:13:31 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id f2-20020a17090631c200b0073dddffbe70sm1500773ejf.224.2022.09.08.11.13.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 11:13:30 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id gh9so18052826ejc.8
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 11:13:29 -0700 (PDT)
X-Received: by 2002:a17:907:2ccb:b0:76f:908:bc56 with SMTP id
 hg11-20020a1709072ccb00b0076f0908bc56mr7170168ejc.763.1662660808959; Thu, 08
 Sep 2022 11:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com> <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat> <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat> <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat>
In-Reply-To: <20220908153430.fctitaofbj6hqot3@houat>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 8 Sep 2022 20:13:17 +0200
X-Gmail-Original-Message-ID: <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
Message-ID: <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
Subject: Re: [Media Summit] ChromeOS Kernel CAM
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

On Thu, 8 Sept 2022 at 17:34, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > > > Hi Ricardo,
> > > > >
> > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > > > > - Still on slide 16, V4L2 as an API is usable without disclosing vendor
> > > > > > >   IP. What is not possible is upstreaming a driver. I don't see this as
> > > > > > >   significantly different between V4L2 and the new API proposal. I
> > > > > > >   expect this to be discussed on Monday.
> > > > > >
> > > > > > I am only considering upstream drivers. There is not much to discuss
> > > > > > for downstream or closed drivers :)
> > > > >
> > > > > Are we really discussing upstream *drivers*? If anything, it looks like
> > > > > the Kcam proposal moves most of the drivers out of upstream.
> > > >
> > > > Given that the API proposal sets at a significant lower level than V4L2
> > > > in the stack, the concept of "userspace driver" (I meant it in the sense
> > > > of GPU support in mesa) plays a bigger role. It would be good to clarify
> > > > what is meant by "driver" and maybe use the term "kernel driver" when
> > > > only the kernel part is covered, to avoid misunderstandings.
> > >
> > > I think there's a bit of a misunderstanding about what exactly is in a
> > > DRM driver, and what is in Mesa.
> > >
> > > Mesa doesn't program the hardware at all, it's merely a glorified
> > > compiler. It's not more of a driver than GCC is an OS. Most importantly
> > > for our discussion, Mesa doesn't perform any kind of register access (or
> > > register access request), only the (kernel) driver does that.
> >
> > Mesa compiles shaders, but also more generally produces command streams
> > that are passed as blobs to the DRM driver, which then forwards them to
> > the device with as little processing and validation as possible (when
> > the device is designed with multi-clients in mind, that processing and
> > validation can be reduced a lot).
>
> That's true, but at no point in time is the CPU ever touches that
> command stream blob in the case of DRM...

As Laurent says, the latest hardware is very similar to GPUs, you pass
a set of commands to a firmware that does the actual R/W to the
hardware.

For hardware that is a register set, the vendor should have a good
idea about what kind of validation should be needed: raw access (deny
list) or more abstracted (allow list).

The most critical part is the DMA, and that will always be abstracted.
Also I doubt that we will have new hardware without an IOMMU, so we
have the same layers of security as today.

>
> > Recent ISPs have a similar architecture, with a set of registers used
> > to communicate with the ISP firmware, and then most of the hardware
> > registers for the actual image processing blocks being programmed
> > based from the command stream. "Command stream" may not be a very good
> > term for ISPs as it's not really a stream of commands, but
> > conceptually, we're dealing with a blob that is computed by userspace.
>
> ... while in Kcam, the CPU knows and will interpret that command stream.
> Maybe not in all cases, but it's still a significant difference.
>
> If we had to draw a parallel with something else in the kernel, it looks
> way more like eBPF or the discussion we had on where to parse the
> bitstreams for stateless codecs.
>
> The first one has been severely constrained to avoid the issues we've
> raised, and we all know how the second one went.

In eBPF, you are moving some user code to the kernel, with an unstable API.

In KCAM, (and in DRM), you let the user build a set of operations,
that you pass to the kernel via a stable API, then it is validated and
scheduled by the kernel.

X11 was much more bizarre, the GPIO iomem was remapped into userspace.




--
Ricardo Ribalda
