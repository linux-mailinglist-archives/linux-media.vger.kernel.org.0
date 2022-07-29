Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1ADA5851CB
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 16:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235283AbiG2Osl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 10:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiG2Osi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 10:48:38 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465AB5A8BA
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 07:48:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id w5so6076837edd.13
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=1ijiDpox3fnCdD+RHNsE0+XsEwjTZ0jf7QV1Q4hm9F4=;
        b=kwDIU472HlzbQh9JX918BeyPJsLDXDCG2ypA0Rllz4wzlJHz+twsXWxiWyYTv2lGJd
         tCsXVob+IZ69csYsAnO9pids+diatw8YybPECs0CLj1uXJ7MzvvyalCthPy/wFxMurwv
         TAPutS+f+rN6lJ/3ZtBYutp/z5nQVFbzJAGES9MpZ70ORDnYkmCZ89aDfz0x9xmxNFSw
         +CySzlsBDaF3F3H4oFbhc/QQsUuuqs0RzGvzg4pxkyaDS7qz/aKIUM/EseYV0IUk/vrW
         3H/IquzhegQS8Ni8WbdJ7WGpmaCgpdrtKLLq+rhWDBp6qS8cuRjOUy7xNo3vXn855suK
         /t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=1ijiDpox3fnCdD+RHNsE0+XsEwjTZ0jf7QV1Q4hm9F4=;
        b=BaXIjrUZ0obYvV1eRANwkVkK1Nus0Y9uWyBJ/K+lHuGBFAGBIQ6Rz2Qh8ufcUNHwko
         JUcMzo3JHn50uskSOb5V/QtlMRTYWnWBkaZIOSRlZjtrX2IUuU3GOV5WleinqkS3tiCM
         U+4tvwuML6jRYqM4YWHdwxJKfegrMEHTWWNC2m4g3vb2vSdbnOQT6Guq/1I/R0MpuIt5
         jJuCGnYy4TVoomK7OBzI5XGwRBPmdtdTFPtUlVk6yucRfEFpxp9jg9fshrPQGTMQasLX
         EOJNZU6dmnLlVKqFR9faTcIK/6VhH6+eiwTnd13Z3bpmAVpZUBNnvwIi91cNfEIVjC4n
         uKhA==
X-Gm-Message-State: AJIora/w/JpdeibD8zs/TDyLrWo3dWKji9ry1lEpc2bCi5CUAiFrcz5T
        ZfV3HPzAy1qZ0xlTtiBIdrFOEWjnSgCvQS2a2jc1hIZHRlc=
X-Google-Smtp-Source: AGRyM1tlhwTy7ZwNmpoa0KHT6f3bb7wWf4+Oafun9zLZsBBibZTCVgXQwE+Swa449qN7UWLEUTNRFtsld4ve0IxoQDI=
X-Received: by 2002:a05:6402:280b:b0:43b:5d75:fcfa with SMTP id
 h11-20020a056402280b00b0043b5d75fcfamr3868293ede.114.1659106115676; Fri, 29
 Jul 2022 07:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75VeKMJ7eSZ3SLki74o+LkL6CBfcx4RL90n2J20BE+8L+KA@mail.gmail.com>
 <8fe44de7-2cb5-eb9d-2e2b-ac6dc0af41a5@xs4all.nl> <CAHp75Ve1SC_a0ZM2G-3j73dE7rZCxFbay0zzmB5_m_iJKma5tg@mail.gmail.com>
 <b97dcd78-3565-e20f-274a-693972834107@xs4all.nl> <CAHp75Vdw8z3m+gs-vU-O8Umh2CqstNUoMPs08-PtJxfuU8K=kA@mail.gmail.com>
 <9ddc981e-81fb-e4a7-9056-7134b1805ad2@xs4all.nl>
In-Reply-To: <9ddc981e-81fb-e4a7-9056-7134b1805ad2@xs4all.nl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Jul 2022 16:47:58 +0200
Message-ID: <CAHp75VfPgFsx93H+xqVsW7KFzP9oMmN0kJMykTcXv_45JUo9Sw@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Erling Ljunggren <hljunggr@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Jonathan Selnes <jonathansb1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 29, 2022 at 2:11 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
> On 29/07/2022 14:00, Andy Shevchenko wrote:
> > On Fri, Jul 29, 2022 at 9:21 AM Hans Verkuil <hverkuil-cisco@xs4all.nl>=
 wrote:
> >> On 28/07/2022 22:56, Andy Shevchenko wrote:
> >>> On Thu, Jul 28, 2022 at 3:23 PM Hans Verkuil <hverkuil-cisco@xs4all.n=
l> wrote:
> >>>> On 28/07/2022 14:02, Andy Shevchenko wrote:
> >>>>> On Thursday, July 28, 2022, Erling Ljunggren <hljunggr@cisco.com <m=
ailto:hljunggr@cisco.com>> wrote:
> >>>
> >>>>>     Support reading and writing the EDID EEPROM through the
> >>>>>     v4l2 API.
> >>>>>
> >>>>> Why the normal way of representing as a memory (we have framework a=
nd drivers) can=E2=80=99t work?
> >>>>
> >>>> Because support for EDID for video sinks is already part of the medi=
a subsystem (V4L2).
> >>>> Normally it is integrated into an HDMI receiver, but in this case it=
 is just the EDID
> >>>> support without the video receiver. It belongs in drivers/media in a=
ny case since EDIDs
> >>>> are closely tied to media.
> >>>
> >>> It's fine. From the Linux perspective we do not reduplicate the
> >>> drivers that are done by other frameworks, right?
> >>>
> >>>>> Moreover, this driver seems limited in support of variety of the ee=
prom chips.
> >>>>
> >>>> Not quite sure what you mean. The cat24c208 is what this was develop=
ed for and
> >>>> the only one we have.
> >>>>
> >>>> Note that an EDID EEPROM !=3D a regular EEPROM: it has to support th=
e VESA E-DDC
> >>>> standard, which a normal EEPROM doesn't. So these devices are specif=
ically made
> >>>> for this use-case.
> >>>
> >>> What is the difference from a programming interface?
> >>> Can the nvmem driver(s) be reused (at24?)?
> >>
> >> No. EDID EEPROM devices are specific to storing EDIDs: they have two i=
2c
> >> ports, one connected to (typically) the HDMI bus (DDC lines) allowing =
a
> >> video source to read the EDID, the other is connected to the SoC to wr=
ite to
> >> and configure the device. The HDMI bus side has two i2c addresses (rea=
ding the
> >> EEPROM and to write to the segment address for EDIDs > 256 bytes), the=
 SoC
> >> side has three i2c addresses: to configure the behavior, the segment a=
ddress,
> >> and to write the EDID from the SoC.
> >>
> >> So it is a much more complex device than a regular eeprom, and it real=
ly
> >> is dedicated to EDIDs only.
> >
> > Thanks for the explanation, but it's still unclear what the
> > differences are in the programming interface there. Perhaps you may
> > simply register a platform device in this driver and reuse the rest
> > from at24?
>
> No, it's really different from a regular eeprom.
>
> >> Also note that the V4L2 API is already used to get/set EDIDs, everythi=
ng is
> >> in place for supporting that, including support for parsing EDIDs for =
the
> >> physical address, which is something that is needed if this is combine=
d with
> >> HDMI CEC hardware. It's not implemented in this driver since it is not
> >> needed in our use-case, but that might change in the future.
> >>
> >> And by using the V4L2 API you can use v4l2-ctl --get-edid and --set-ed=
id
> >> out of the box, using the standard API for EDIDs.
> >
> > Bonus question: we have cat24c04/cat24c05 are recognized by at24
> > already, are they different to cat24c08?
> >
>
> Yes, they are different.

Thanks for your patience and elaboration, I got it.

Would this driver be used only by v4l2? Or potentially some other
hardware may need it (DRM?)?


--=20
With Best Regards,
Andy Shevchenko
