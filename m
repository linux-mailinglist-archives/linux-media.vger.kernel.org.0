Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88B92B2631
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 22:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgKMVEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 16:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgKMVEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 16:04:31 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0259BC0613D1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 13:04:31 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id cq7so12357958edb.4
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 13:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QFCanyEL2bt8WZM2BM6I1qNGZKu2+1kVgCzE//lkIqY=;
        b=mkXOXtKWT+mUg5opCyqaIbmFvJybos5AO2aYJHNhAMUTZgi/1fr2kb3wJRKaYZMmpV
         x6Qu+WWZsDwmTs5UTocuWoz5lVGinp219EdTQx3V4T7gK/v+DOIoog7MrUp7NzLKxgv0
         0xXA+mhrFKwHAdh4ABMihcjw74oA4Z2wWOFHQ1yGdlQqQ4JM0RgygVZ9M1RWerpkXDEA
         UJVwnvhLcO2jd9Fx+jTvNPASXwfrpnvV3xpDKE/Eiz8ieMTO9XMdn3EAeLhRIa4rnQGp
         U6+3zjj+4VMqHS8+JGlc2FQ5T+RXAaJjvU3t33k97qptrFh5l9BHpRodZVBvwOjRzDtU
         tSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QFCanyEL2bt8WZM2BM6I1qNGZKu2+1kVgCzE//lkIqY=;
        b=NNpatwv5tLhBejNY6X7h2JpTg+JWSeCD8PrqW9cl+n/g5VW2rLN4S6zopcgNEyx5yI
         UxYHat2GfEcFKG0iyA6vjdfe5yYcooJl5ndaYuvOSXQSGQyZp282UH2BixQy+nxugKoo
         ymQo4P9C1V5Wyu5PIKmlkbQjq5OdI96HEzp07F/IaXtdaw6/x6FvUEXVPaOFPHFEc0IA
         +OCXmoo1o0bXv3Kq1kOSaV/ZZtulKeg7Ial8wd3vI5YW+8W1/Axb0v/xcl3Aflu0x4JJ
         bZ8IpPdWEwwmnNhTZXKq4BA4IMqbXTZ2v66p/qrltwQLsj+lDfgnyC2UjnXG+lGP/Qm/
         QRmA==
X-Gm-Message-State: AOAM532Nn1yBXTOzkmdxzaHXrlJreR4Q+Qq7H+tH4MtNAKeBVyCl1nzC
        Pv2Wrhc8pxCvQutlprvk17jiE/MCv9/WPZ/Z/hVsExKfT1gZFg==
X-Google-Smtp-Source: ABdhPJxZrCsqnMw2fnSUCxadTjE8fpqqGwDrrJmTxU0lIPDZd8P8bhyJNZvLc0a6DOc0x12QxR2q8ZSDOu97VaTD/ac=
X-Received: by 2002:aa7:c94b:: with SMTP id h11mr4384348edt.322.1605301469750;
 Fri, 13 Nov 2020 13:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar> <c5c1859a-34b2-bdb2-c3ac-3a0c96d7c019@xs4all.nl>
 <20200820133539.GF6593@pendragon.ideasonboard.com> <ba821e4a-9b30-7428-b864-189ad64abb40@vanguardiasur.com.ar>
In-Reply-To: <ba821e4a-9b30-7428-b864-189ad64abb40@vanguardiasur.com.ar>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 13 Nov 2020 18:04:18 -0300
Message-ID: <CAAEAJfCGsAJfxFUVdcQ69mcQqgjEMk-Od4NOAwB02H60+GzD1w@mail.gmail.com>
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
To:     "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        kieran.bingham@ideasonboard.com, gjasny@googlemail.com,
        xavier.claessens@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        user.vdr@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

On Thu, 20 Aug 2020 at 19:19, Ariel D'Alessandro
<ariel@vanguardiasur.com.ar> wrote:
>
> Hi Laurent,
>
> On 8/20/20 10:35 AM, Laurent Pinchart wrote:
> > Hi Hans,
> >
> > On Thu, Aug 20, 2020 at 02:42:56PM +0200, Hans Verkuil wrote:
> >> On 06/08/2020 17:55, Ariel D'Alessandro wrote:
> >>> Supports building libraries and tools found in contrib/, lib/ and
> >>> utils/ directories, along with the implemented gettext translations.
> >>>
> >>> Also supports generating plain HTML documentation and manual pages using
> >>> Doxygen.
> >>>
> >>> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> >>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> >>> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>> Acked-by: Gregor Jasny <gjasny@googlemail.com>
> >>> [Gregor: Control symbol visibility]
> >>> Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
> >>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> >>> ---
> >>>  .gitignore                                    |    1 +
> >>>  Makefile.am                                   |    3 +-
> >>>  README.md                                     |   85 +-
> >>>  contrib/Makefile.am                           |    3 +-
> >>>  contrib/cobalt-ctl/Makefile.am                |    2 +
> >>>  contrib/cobalt-ctl/meson.build                |    8 +
> >>>  contrib/decode_tm6000/Makefile.am             |    2 +
> >>>  contrib/decode_tm6000/meson.build             |   14 +
> >>>  contrib/gconv/Makefile.am                     |    2 +-
> >>>  contrib/gconv/meson.build                     |   44 +
> >>>  contrib/meson.build                           |   13 +
> >>>  contrib/rds-saa6588/Makefile.am               |    2 +
> >>>  contrib/rds-saa6588/meson.build               |    7 +
> >>>  contrib/test/Makefile.am                      |    3 +-
> >>>  contrib/test/meson.build                      |  143 +
> >>>  contrib/xc3028-firmware/Makefile.am           |    2 +-
> >>>  contrib/xc3028-firmware/meson.build           |   11 +
> >>>  doc/Doxyfile.in                               | 2351 +++++++++++++++++
> >>
> >> 2351 lines to add this file?!
> >>
> >> Is this really needed? And if so, please add this in a separate patch in the
> >> next version. This huge file pollutes the diff, making it very hard to review.
> >
> > Note that Doxyfile.in is generated by Doxygen. I agree Doygen support
> > could be split to a separate to ease review, possibly with one patch
> > that adds the generated file, and a second patch that modifies it.
>
> Sounds like a good way to go. will do.
>

Any updates on this patch?

Thanks,
Ezequiel
