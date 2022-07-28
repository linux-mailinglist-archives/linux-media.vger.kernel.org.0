Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9269584749
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 22:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbiG1U5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 16:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiG1U5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 16:57:02 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542276C10D
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 13:56:58 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sz17so5139381ejc.9
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=g+cJCY8r9fc8rDpEr0szrs8C73W7uxOHCccnFnlfaUU=;
        b=D9/IWsjwsgLC4wByXb71hvHMhFqSIxbchTr7faw7eDCdhgZvQ79v/3l4oc3yd3rIAd
         VjNLbP7WFMK4Yw4AtcmMgTMW3+TxB2cPZafgzJrv5mVmAWoxic5d381SZ0eZEThuhhdr
         V7W/VHll1LJQhLjPi+WdeAnfw53oZ8NBFaVSZKdbpWtOMBbyX29kazBXsxZ5bmk6ohp/
         hOFGS2piziJJrcrAs9hpqdTzEQPsB2BqxaAMEQ3+frL9CCzYyU594wIMuu1KIFRZF/xs
         H5tnVkXwYvUHC2Sx6wodkZ/u2jl5faU0h5vkqhM8b6d6XqOUy7dJP529oqtfNFXmYEYG
         E8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=g+cJCY8r9fc8rDpEr0szrs8C73W7uxOHCccnFnlfaUU=;
        b=HEaShyU1Z0ItX+cb1wew7UBeDyGOFWBSWJKgqB1Lz/pMiJMY4EIpmOYb45jGUFgW6t
         Ypg3uaU4kxCt9jNZcu/uCsfuB4MtvP6+7M70bMvx4+dhVckfwjy+DFApqgtnpJZTrnUV
         LwIuNRdW0mnY+KYyKcbFrPIgnIbpkqr0F+pBZqkxok9sS9v0d6Hbdnreo3Xbp+xPHtbj
         sPwusAr3tQCG5i1c61adOX7g3d50zs1MC1MViUzP5wQMAlDfmMrQ999VHNQzAEj5SWD8
         gZTsre5/BMx+XZBYCF6HsinCOiAifqPBU+wEy7vcqvIRM05n882+SoGLo7C2pfxUmt1r
         vJ6Q==
X-Gm-Message-State: AJIora+qrbkroKh1H4nhRhpKeLOEByeV4gEONkaFViL4lkEsAQM7lTep
        pAbij/uNe0bNrVhiqEm8jifAo+I8VF9aqevOjWI=
X-Google-Smtp-Source: AGRyM1v3Y32o9LdIMWLrcGO77zwZT3fJAML0s2ZzUPEqwERqEn1+7d3b+9WikhYxUn2sSnfBJMH+a5u4XAxTVIAja1k=
X-Received: by 2002:a17:906:7950:b0:72f:d4a4:564d with SMTP id
 l16-20020a170906795000b0072fd4a4564dmr501977ejo.479.1659041816853; Thu, 28
 Jul 2022 13:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75VeKMJ7eSZ3SLki74o+LkL6CBfcx4RL90n2J20BE+8L+KA@mail.gmail.com> <8fe44de7-2cb5-eb9d-2e2b-ac6dc0af41a5@xs4all.nl>
In-Reply-To: <8fe44de7-2cb5-eb9d-2e2b-ac6dc0af41a5@xs4all.nl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 Jul 2022 22:56:20 +0200
Message-ID: <CAHp75Ve1SC_a0ZM2G-3j73dE7rZCxFbay0zzmB5_m_iJKma5tg@mail.gmail.com>
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

On Thu, Jul 28, 2022 at 3:23 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
> On 28/07/2022 14:02, Andy Shevchenko wrote:
> > On Thursday, July 28, 2022, Erling Ljunggren <hljunggr@cisco.com <mailt=
o:hljunggr@cisco.com>> wrote:

> >     Support reading and writing the EDID EEPROM through the
> >     v4l2 API.
> >
> > Why the normal way of representing as a memory (we have framework and d=
rivers) can=E2=80=99t work?
>
> Because support for EDID for video sinks is already part of the media sub=
system (V4L2).
> Normally it is integrated into an HDMI receiver, but in this case it is j=
ust the EDID
> support without the video receiver. It belongs in drivers/media in any ca=
se since EDIDs
> are closely tied to media.

It's fine. From the Linux perspective we do not reduplicate the
drivers that are done by other frameworks, right?

> > Moreover, this driver seems limited in support of variety of the eeprom=
 chips.
>
> Not quite sure what you mean. The cat24c208 is what this was developed fo=
r and
> the only one we have.
>
> Note that an EDID EEPROM !=3D a regular EEPROM: it has to support the VES=
A E-DDC
> standard, which a normal EEPROM doesn't. So these devices are specificall=
y made
> for this use-case.

What is the difference from a programming interface?
Can the nvmem driver(s) be reused (at24?)?

...

> >      drivers/media/i2c/cat24c208.c | 421 ++++++++++++++++++++++++++++++=
++++

It really seems silly to me to add so many LoCs for the existing
drivers and perhaps we need to extend the nvmem to support EDID rather
than copying everything again?

Note, I can be well mistaken by not understanding some underlying
issues, perhaps there is some documentation to read...

--=20
With Best Regards,
Andy Shevchenko
