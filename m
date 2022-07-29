Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB57584FD5
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 14:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbiG2MBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 08:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbiG2MBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 08:01:35 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E851863E0
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 05:01:34 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id ss3so8090709ejc.11
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=fav9LHW85MW5A31j+u2D3uuP991nPSN2cpItGQ116t0=;
        b=CWdEF+GJZ24j406Kht+H6IxMHO5l9yucDU4VkcEvmcfxELePpMsuM5/u4Tn9mMpkYu
         2TOGVNSHnDrNDs51g4a5fFwtuTwQAYlAAdDQyMdr2RIh23Oe5WkPWDri/6ERUWrjhXAR
         xlnIwv7Q5B9VMUiMX7I58dok3RQzc54dbxS6WfMnyJKrjl7WzpYCnpX0dZkinuN0ukTz
         JZbzAdNIFphN6Qeu4vKafyEeykSM87BB0F6iCJFe1iCeQ/L8OHU2amyUcQlrz3v6sW25
         anOijJp1fn+fdIemelKXjh6P/aYeqwr8GchTKLYYWMeX9pY780qaiCDyzxHr60xE1ZuC
         1w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=fav9LHW85MW5A31j+u2D3uuP991nPSN2cpItGQ116t0=;
        b=08gQaKoY0wgaq+ldetCKbZVoeSq5KB2yIgUdL7n4C34Td80pECgah56KlpRuD6yZGi
         lQAEeCFNd5q6AZcNX2V1GY/zI/KSRp9R5XJZQKQIfjpiYLDmyPMB0//3WAClLUln29xa
         wiP4FsFItq8FZeeyawoFNkK7kkRcbQVWGhKFiK9afHWsqqahaL+jkfiJwicvtYOS6+1L
         bAWNI4kJ/PjizZ0qudsmLwQT+Zghd7SaPTSDh8tmSn8LyEjAkfCO3g8Z+Q3UppWw3U6T
         KwqIlMGpQvm5gb+VSPW4q5dDXH2ZYlEZWhz0uWRbD+cLzVYPGg6eixcAKiWdhNuDp3ej
         QQzg==
X-Gm-Message-State: AJIora+sW9f4zmxVTkbH4t6pTeuNQxdo5c0jf1944aMsX4rlUmNyqqeS
        OmRtcvyZh6KO4ZNouaSBlci4dV16fWgNt+1RgwQ=
X-Google-Smtp-Source: AGRyM1uqhXDbTbiD0neeYvD/xjKmT2gDhMBtMT7w0gkeBHliCSsHrKKzFoB3anuuXUOZLJkKYkzAFqKvuvfTOX2tpCM=
X-Received: by 2002:a17:907:6e02:b0:72b:9f16:1bc5 with SMTP id
 sd2-20020a1709076e0200b0072b9f161bc5mr2687955ejc.676.1659096092476; Fri, 29
 Jul 2022 05:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75VeKMJ7eSZ3SLki74o+LkL6CBfcx4RL90n2J20BE+8L+KA@mail.gmail.com>
 <8fe44de7-2cb5-eb9d-2e2b-ac6dc0af41a5@xs4all.nl> <CAHp75Ve1SC_a0ZM2G-3j73dE7rZCxFbay0zzmB5_m_iJKma5tg@mail.gmail.com>
 <b97dcd78-3565-e20f-274a-693972834107@xs4all.nl>
In-Reply-To: <b97dcd78-3565-e20f-274a-693972834107@xs4all.nl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Jul 2022 14:00:54 +0200
Message-ID: <CAHp75Vdw8z3m+gs-vU-O8Umh2CqstNUoMPs08-PtJxfuU8K=kA@mail.gmail.com>
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

On Fri, Jul 29, 2022 at 9:21 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
> On 28/07/2022 22:56, Andy Shevchenko wrote:
> > On Thu, Jul 28, 2022 at 3:23 PM Hans Verkuil <hverkuil-cisco@xs4all.nl>=
 wrote:
> >> On 28/07/2022 14:02, Andy Shevchenko wrote:
> >>> On Thursday, July 28, 2022, Erling Ljunggren <hljunggr@cisco.com <mai=
lto:hljunggr@cisco.com>> wrote:
> >
> >>>     Support reading and writing the EDID EEPROM through the
> >>>     v4l2 API.
> >>>
> >>> Why the normal way of representing as a memory (we have framework and=
 drivers) can=E2=80=99t work?
> >>
> >> Because support for EDID for video sinks is already part of the media =
subsystem (V4L2).
> >> Normally it is integrated into an HDMI receiver, but in this case it i=
s just the EDID
> >> support without the video receiver. It belongs in drivers/media in any=
 case since EDIDs
> >> are closely tied to media.
> >
> > It's fine. From the Linux perspective we do not reduplicate the
> > drivers that are done by other frameworks, right?
> >
> >>> Moreover, this driver seems limited in support of variety of the eepr=
om chips.
> >>
> >> Not quite sure what you mean. The cat24c208 is what this was developed=
 for and
> >> the only one we have.
> >>
> >> Note that an EDID EEPROM !=3D a regular EEPROM: it has to support the =
VESA E-DDC
> >> standard, which a normal EEPROM doesn't. So these devices are specific=
ally made
> >> for this use-case.
> >
> > What is the difference from a programming interface?
> > Can the nvmem driver(s) be reused (at24?)?
>
> No. EDID EEPROM devices are specific to storing EDIDs: they have two i2c
> ports, one connected to (typically) the HDMI bus (DDC lines) allowing a
> video source to read the EDID, the other is connected to the SoC to write=
 to
> and configure the device. The HDMI bus side has two i2c addresses (readin=
g the
> EEPROM and to write to the segment address for EDIDs > 256 bytes), the So=
C
> side has three i2c addresses: to configure the behavior, the segment addr=
ess,
> and to write the EDID from the SoC.
>
> So it is a much more complex device than a regular eeprom, and it really
> is dedicated to EDIDs only.

Thanks for the explanation, but it's still unclear what the
differences are in the programming interface there. Perhaps you may
simply register a platform device in this driver and reuse the rest
from at24?

> Also note that the V4L2 API is already used to get/set EDIDs, everything =
is
> in place for supporting that, including support for parsing EDIDs for the
> physical address, which is something that is needed if this is combined w=
ith
> HDMI CEC hardware. It's not implemented in this driver since it is not
> needed in our use-case, but that might change in the future.
>
> And by using the V4L2 API you can use v4l2-ctl --get-edid and --set-edid
> out of the box, using the standard API for EDIDs.

Bonus question: we have cat24c04/cat24c05 are recognized by at24
already, are they different to cat24c08?

--=20
With Best Regards,
Andy Shevchenko
