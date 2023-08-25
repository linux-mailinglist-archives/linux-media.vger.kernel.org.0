Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0F87880A5
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 09:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235051AbjHYHKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 03:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243165AbjHYHKJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 03:10:09 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC241B2
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 00:10:07 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-447b64b0555so197591137.3
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 00:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692947406; x=1693552206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5EX+gwEzyeXF6XC8LlxAhzlJjAglCGWrtHefzLPF+8=;
        b=LJadvTAQbkRD+f2MXTNggP1h9mqxL1WMjnMYDI16hPt+7eD1BS/AnNFT3Z+Y5SAtF2
         bPujg8GPq0w8RmF19iA5PaTICmJjLrGjZoYZgtiPA8GjS0cq/LT4S3XPHwiHkV+kwccA
         dNsW3KnbQ8J0x6mwSaR9lTfpZo8lFrZQcnVOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692947406; x=1693552206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5EX+gwEzyeXF6XC8LlxAhzlJjAglCGWrtHefzLPF+8=;
        b=GgjrM+oRQqxdRbziUsGc1nRcH58sQ840aEH5eNF/dG+FDRYjpWFJ+hxXPcVtAWbE3d
         /i3SHFhDBimjl7jP9Vlfa+R5K0VUaotlVJu3Gw7VPD110uKDU+PctFuBPB95d4DEne7k
         aYytVQlVOVy8hkto71gPwhtyCBX9dJ5UYg5E+xmXcwF9A5QVmgm4+X03FQv7kr0Kz92F
         jF+kky5aPpvIfd1h/ZozWK2LCGJt+EktQt0Fk5/ibB74mTCTCmTHq9csXxsdfikKDZ1x
         m7kvzWwLev+FerVLm7Et46Flt6yz+scCtAQe2ubP3D6nd+9VG4/49gm4bt9mZeeYmiK6
         6d7g==
X-Gm-Message-State: AOJu0Yxg2U08W0WIPnyaXQvOOd7vLExUSDR/9wagcSzJ/ZTSOUsNsVWg
        hoHzYRRD4fZitoJ7hm5Z4Ps7qKQAsRKnx5DSVV7j4w==
X-Google-Smtp-Source: AGHT+IELhk/HTvcIhwAadwlBpkdyC2BiGJq2vICCqJaShJfw+ZzEb2D437iYFlXAbO2f7fxTazAzhv3Nk+9AeByo1g8=
X-Received: by 2002:a05:6102:4ae:b0:44e:9113:ac58 with SMTP id
 r14-20020a05610204ae00b0044e9113ac58mr4394723vsa.6.1692947406554; Fri, 25 Aug
 2023 00:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230824013858.303105-1-marex@denx.de> <CAHCN7xLDmMv7T_fT7vY3iq+KMWuPM9tBP_2AJ-X04L7ZTRWPOw@mail.gmail.com>
 <80d9a66f-c703-6057-e084-1a6d2214d775@denx.de>
In-Reply-To: <80d9a66f-c703-6057-e084-1a6d2214d775@denx.de>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 25 Aug 2023 15:09:55 +0800
Message-ID: <CAGXv+5GQFtCAYbfSbEJeHA4Os0O6WuD64V-xcZ9uDD33HbuhhQ@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: Check whether reset op is defined before use
To:     Marek Vasut <marex@denx.de>
Cc:     Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 24, 2023 at 9:08=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 8/24/23 12:39, Adam Ford wrote:
> > On Wed, Aug 23, 2023 at 8:39=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> The i.MX8MM/N/P does not define the .reset op since reset of the VPU i=
s
> >> done by genpd. Check whether the .reset op is defined before calling i=
t
> >> to avoid NULL pointer dereference.
> >>
> >> Note that the Fixes tag is set to the commit which removed the reset o=
p
> >> from i.MX8M Hantro G2 implementation, this is because before this comm=
it
> >> all the implementations did define the .reset op.
> >
> > I am surprised I didn't have issues when I was testing the 8MQ and
> > 8MM, but this makes sense.
>
> You need to trigger the VPU watchdog to trigger the crash, that means
> you have to get the VPU into some weird state where it fails to decode
> frame. Then it triggers the reset and ... boom.
>
> See this patch, that contains a gstreamer invocation to generate such
> trigger condition input data:
>
> [PATCH] media: verisilicon: Do not enable G2 postproc downscale if
> source is narrower than destination
>
> "
> To generate input test data to trigger this bug, use e.g.:
> $ gst-launch-1.0 videotestsrc !
> video/x-raw,width=3D272,height=3D256,format=3DI420 ! \
>                   vp9enc ! matroskamux ! filesink location=3D/tmp/test.vp=
9
> To trigger the bug upon decoding (note that the NV12 must be forced, as
> that assures the output data would pass the G2 postproc):
> $ gst-launch-1.0 filesrc location=3D/tmp/test.vp9 ! matroskademux !
> vp9parse ! \
>                   v4l2slvp9dec ! video/x-raw,format=3DNV12 ! videoconvert
> ! fbdevsink
> "

Does it completely recover afterwards? In my previous trials the hardware
ended up in some bizzare state: while decoding succeeds, the output's md5su=
m
didn't match up.

ChenYu
