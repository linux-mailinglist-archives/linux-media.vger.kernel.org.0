Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38F2858A7A8
	for <lists+linux-media@lfdr.de>; Fri,  5 Aug 2022 10:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240393AbiHEIC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Aug 2022 04:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbiHEICx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Aug 2022 04:02:53 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A948465F4
        for <linux-media@vger.kernel.org>; Fri,  5 Aug 2022 01:02:52 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c24so1350208qkm.4
        for <linux-media@vger.kernel.org>; Fri, 05 Aug 2022 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4wOHPbZoYRAqfIebnUevULpJBC1vr7zEcqjVR5HsHDw=;
        b=eQvVdmdOC75u7/+yDzxuHCzHQcO51+pZ+PGbobWra0UlvhyigtFcIv5/lbnhc06Hul
         hw5bqvP+OJ7e7lgCVK6KGJDNvDjbHlESJyY3YSJCuCbg7PSsZKS1Bb6UDhRDQH37L6zd
         UWxnozSF8o6+lEcKVTh/oAGTde9avRWXCgzP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4wOHPbZoYRAqfIebnUevULpJBC1vr7zEcqjVR5HsHDw=;
        b=VHefAae/DVcd/WP4cz6pfu/nspv/vjUyebWF6wkMPP2yHIRAF7vx8Vz4qxphlNalvz
         RTJfcP/tlrfswpUrp7KtilrM2gnAKLGYN2N+JwBLnuTTHNpEJbR+wA+AD5g+JbPcjQC3
         /39XEAOo0a7lWzTgNaSyQrDkvRgc8bIDC3cqs1tE62KjcI/NuOie3NA9UmyYMKakBL4I
         uHtfCo4rnp/Xy9IUcWwC5wfRFJtbUEHnShM03P9W0Rdb/lA5nbCDx5fUbXSuI0t268Tc
         jXsLC3rfOq2hc+GdJ+pQcx6J4a2ct0UeUjZetceU8mwzbTOGcqRQIBy2xQCxwXHC4B9F
         H6wg==
X-Gm-Message-State: ACgBeo3QgsoA85EZKqYIxQ7eptVvqZQVqdWFVwd0q0grOEBbemPfNxH2
        Ay7rB6Vtefvoq+y50D9Qmf3C7UOqLXelUQ==
X-Google-Smtp-Source: AA6agR68k37onZ2IxTaMCu/AJnuY5KvWaniltHnQmF+bfCs4VARpphFm7JjMMknP1Zn4wUf8P9NXxw==
X-Received: by 2002:a05:620a:3705:b0:6b9:6ff:559d with SMTP id de5-20020a05620a370500b006b906ff559dmr3980723qkb.365.1659686571434;
        Fri, 05 Aug 2022 01:02:51 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id k22-20020ac86056000000b002f936bae288sm2143506qtm.87.2022.08.05.01.02.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 01:02:49 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 204so2721523yba.1
        for <linux-media@vger.kernel.org>; Fri, 05 Aug 2022 01:02:48 -0700 (PDT)
X-Received: by 2002:a25:6a46:0:b0:67b:66ad:ae40 with SMTP id
 f67-20020a256a46000000b0067b66adae40mr3760913ybc.261.1659686568243; Fri, 05
 Aug 2022 01:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl> <194a3931-7546-9f26-0607-4ce9f12e9599@xs4all.nl>
In-Reply-To: <194a3931-7546-9f26-0607-4ce9f12e9599@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 5 Aug 2022 17:02:37 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D2SL-15eGifaGnFC_aN=XSd=2Rk-YHPdbUBi0tKj0kkA@mail.gmail.com>
Message-ID: <CAAFQd5D2SL-15eGifaGnFC_aN=XSd=2Rk-YHPdbUBi0tKj0kkA@mail.gmail.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hidenorik@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Jul 25, 2022 at 4:41 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> On 7/15/22 10:15, Hans Verkuil wrote:
> > Hi all,
> >
> > The Linux Foundation organized a meeting room for us to use on Monday S=
eptember 12
> > at the Convention Centre Dublin. It is co-located with the Open Source =
Summit Europe,
> > see https://events.linuxfoundation.org/open-source-summit-europe/ for m=
ore info.
> >
> > To attend this Media Summit no registration is required for the OSSE, b=
ut you do need
> > to register with me by sending me an email. There is a maximum of 20 pa=
rticipants.
> >
> > I send out a request for topics in May and got quite a few replies:
> >
> > https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.ca=
mel@ndufresne.ca/T/
> >
> > If you have more ideas for topics, then reply either to that message (p=
referred) or this
> > one.
> >
> > See here for more details about the conference:
> >
> > https://events.linuxfoundation.org/open-source-summit-europe/
> >
> > It is primarily meant for media developers to meet face-to-face. Whethe=
r there will
> > be a possibility to participate remotely is not certain at this time. P=
ast experience
> > shows that meetings like this are a poor fit for remote attendance, unl=
ess you have
> > a meeting room that is designed for such purposes, which we don't have.
> >
> > The actual agenda will depend on who will attend, I hope to be able to =
put that
> > together around mid August. But the link above with the 'Request for To=
pics' thread
> > will give a good indication of what to expect.
> >
> > So, if you want to attend, then let me know by email. Please reply as s=
oon as possible,
> > even if you are not entirely certain yet if you can attend.
>
> The current list of attendees is:
>
> Sakari Ailus
> Kieran Bingham
> Nicolas Dufresne
> Benjamin Gaignard
> Paul Kocialkowski
> Jacopo Mondi
> Laurent Pinchart
> Ricardo Ribalda
> Maxime Ripard
> Dave Stevenson (from 11 am)
> Hans Verkuil
> Philipp Zabel
>
> Tentative:
>
> Jernej =C5=A0krabec
>
> So 12 confirmed attendees. The room holds 20 people, so if you are intere=
sted and
> able to attend, then just let me know, there are still seats available.

+CC Hidenori from my team who was interested in joining too.

Do we still have some seats left?

Best regards,
Tomasz

>
> I plan to post a first draft agenda next week.
>
> >
> > The health and safety regulations will be those of the OSSE LF:
> >
> > https://events.linuxfoundation.org/open-source-summit-europe/attend/hea=
lth-and-safety/
> >
> > Code of conduct:
> >
> > https://events.linuxfoundation.org/open-source-summit-europe/attend/cod=
e-of-conduct/
> >
> > A final note: the total cost is at most $650 (depends on the number of =
people):
> > that's for a whiteboard, powerstrips and refreshments (coffee, tea, sod=
a, water).
> >
> > It would be nice if this can be sponsored by one or more companies. I'l=
l ask
> > my manager if Cisco can contribute to this (once he's back from vacatio=
n), but
> > if other companies want to contribute as well, then let me know and we =
can
> > split the bill. And start off the meeting with a nice slide saying: "Sp=
onsored by:".
>
> Collabora offered to sponsor this, many thanks for that!
>
> Regards,
>
>         Hans
