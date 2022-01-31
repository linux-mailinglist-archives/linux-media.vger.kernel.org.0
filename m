Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237BB4A4965
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236914AbiAaOdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236840AbiAaOdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:33:17 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF2AC061714
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:33:16 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id w25so26289329edt.7
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VQxgpG0SHlF4438W0MfTc6DWnFSigKtY7OQp5A9AEC4=;
        b=G2Mxdk59QFuG13MvHYbK3MCEvWPpk26GvxfPPv3h9rd4PQNyTU4ik1oq43WsYIwHp1
         OGGj5I2rT7+o9+6FctLQpU8Kf4NZn5ixy5PRZerz/Bew6uQim8AVhEwXf44xGQmI96CS
         3gDa3xp4USI507XlVrzUzsU/lVlP9t9GyYrsGvEKVulWKE9dajfcOVlsu5/73gAyDWUy
         F1X/uKdw4mPiZnfTgmtjnQIelcZTc47uHUaTWnqkD6i8UIHb56YE45TNB9st8nWjuepE
         MBifEbS4KwE3mDG9IVrzpJzvwt7qV1O9I/TRspx3aoZco9dfUV1Jdtd5iCxiRuy4n65G
         RUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VQxgpG0SHlF4438W0MfTc6DWnFSigKtY7OQp5A9AEC4=;
        b=sjcAUeBewayAPLf+26PjXWl1VjAd17Tr5+KTG0ixwCO79KB4iL4pqIo9QF1xQJZNXr
         2/x30SNWNh990BSaBmIXargQqdf1/7qTFuxPrmV4j3Mb1F6SAoPob2ugZJIxpebcH9um
         rErKDdjx0mbSaAmilcDJJUPEom2yOQbbW1NcRVXhPhOrXRGwpiMtg3TDJZl6dQ4YfVY2
         sx0KTQIOWzZCu776Nz59ehLZLgAYjaPpDxr96Omgigcq5tLyi4xMyA/hmhsfKTSgne4Z
         +aUawcfJnsxDM4iCaK5OlXGRUsoAlis8pevwodmj4CnwR12moXILjF8JoLhhaZDIfxS5
         v3Ww==
X-Gm-Message-State: AOAM530tD+a47FFzvPTLeuYRbQFt8BszQUr0xyi+z/lJpNW1bq0xGfI8
        kJLF1ptsrYHgDCuvm4SHPebn7udpKmzawgcjQ0FT7caW
X-Google-Smtp-Source: ABdhPJxirt0GPyiX+BFei3/eu+ACptNdTuoc23gErydZJ16AchjUAWE1aDhGqY8zJEMtWTLo/2b8aYV4nVNdA/VjH7I=
X-Received: by 2002:a05:6402:27d1:: with SMTP id c17mr20750703ede.367.1643639595008;
 Mon, 31 Jan 2022 06:33:15 -0800 (PST)
MIME-Version: 1.0
References: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
 <CAHCN7xKxyZGoQdQ=6uOHpd4COV2CV5b=bbCAhv5cyQCspPf8QQ@mail.gmail.com> <3fd135621147ae938c357931579ec1110c935afa.camel@ndufresne.ca>
In-Reply-To: <3fd135621147ae938c357931579ec1110c935afa.camel@ndufresne.ca>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 31 Jan 2022 08:33:04 -0600
Message-ID: <CAHCN7xKHPPDPeN2q3uD8b_Wzs_6KrO+_Qh2zHh4id8YZJJjPcw@mail.gmail.com>
Subject: Re: hantro: g2: Does the postprocessor needs 32byte aligned width ?
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     "jernej.skrabec" <jernej.skrabec@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 31, 2022 at 8:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le vendredi 28 janvier 2022 =C3=A0 12:43 -0600, Adam Ford a =C3=A9crit :
> > On Fri, Jan 28, 2022 at 12:35 PM Nicolas Dufresne <nicolas@ndufresne.ca=
> wrote:
> > >
> > > Hi Adam,
> > >
> > > Jernej and I had to deal with user report which show a stride issue w=
ith the G2
> > > on Allwinner H6.
> > >
> > > https://forum.libreelec.tv/thread/17565-nightly-images-for-a64-h3-h5-=
h6-and-r40-boards/?postID=3D166086#post166086
> > >
> > > We quickly found that the stride alignment set to 16 needs to be 32. =
Though we
> > > noticed that this is only needed when using the G2 postprocessor (NV1=
2), while
> > > it worked fine with tiles (NV12_4L4).
> >
> > Out of curiosity, would it hurt to make the G2 alignment to be 32 even
> > if it's not required?
>
> Aligning tile to 32 can be complex, I don't think the code is ready to ha=
ndle
> padded tiled buffers. About the post-prob, I'd like to first understand w=
hy is
> this.
>
> >
> > >
> > > We were wondering if you, or anyone here on the list could test this =
on IMX8MQ
> > > and IMX8MM. We'd like know if this is specific to the older G2 on H6.=
 To trigger
> > > this, you need a video with a resolution like 1552x1080 as used in th=
e report.
> > > We can help you get one if needed.
> >
> > If you have a video you want me to try and instructions on how you
> > want me to test it, I can give it a shot. The imx8mm doesn't have a
> > video display driver yet, but I think the imx8mq does.  I am not as
> > familiar with that board as I am with the 8mm.  The testing I have
> > done to date has only been done with fluster.
>
> If you have fluster/gstreamer ready, and some display, I suppose you can =
try and
> kmssink (worked for me with the vendor display driver). To get the same v=
ideo,
> you can probably download temporarily that youtube video with youtube-dl,
> careful not to share the file, this is copyrighted content, but it ease t=
esting
> and debugging, so I suspect it falls in fair use (INAL).
>
> youtube-dl -f 248 https://www.youtube.com/watch?v=3DTUVcZfQe-Kw
> gst-launch-1.0 filesrc location=3D"Dua Lipa - Levitating Featuring DaBaby=
 (Official Music Video)-TUVcZfQe-Kw.webm" ! parsebin ! v4l2slvp9dec ! video=
convert ! kmssink

Sounds good.  I have a few tasks to do before I can get back to this,
but I'll try to do it later today or tonight.

adam
>
> regards,
> Nicolas
>
> >
> > adam
> >
> > >
> > > regards,
> > > Nicolas
>
