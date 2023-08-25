Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93FC97882AA
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 10:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243935AbjHYIw4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 04:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238636AbjHYIwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 04:52:30 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5D61BCA
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 01:52:27 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4871e5dbe0cso1067277e0c.1
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692953546; x=1693558346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHr+Qq1uitu62iKr088XeD1/7TeAJk3ah8bA3XKzwuw=;
        b=m4RRn1K5bUH+Dsc1vCqLMvY/vMrcrMKR70n2hrLnquJbgoslRBtFgHnFB0CbrnqDqe
         zeJMjCbDAdepOY2TLO2jjL5qF8HyVAfhFg4klQJIIMgmJjKQWRY9APJDB0mPPlULfDo9
         eRDZNVHi73X6ZqWEA3UxR3ajKDAojtpq2sNs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692953546; x=1693558346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHr+Qq1uitu62iKr088XeD1/7TeAJk3ah8bA3XKzwuw=;
        b=LrQMqxU3EDbhKGG3bM80hgE/3OKh/6dFwfNETUkgbuK71G8vUl8UFNzMR7umBatwuS
         oinPq9M4ARraf9v3kqizry8GDAc8hwswmhvrsnGJjuLCVuMq0hljPTjyETCAEDTJhxXr
         e23iTQ8MLQoS7+NVR553YxfBLPuRnEBYnI9hPAKKRCHp+1uxVzpCjTmMrgUANw1q47Je
         IAEBT8/ZBzwsrh1gmcOwYACuWcyOHycEJF31e9B95wIMwchJPxC/1lTFX7ESmMeBuuTr
         hr35131XfQ6XlBGes8L5cWXDPwac3mqvu6pktTGvTHX4FaCl6M1tp0+hf2mohj2GY9KE
         5uTw==
X-Gm-Message-State: AOJu0YxpvJbexvHPriOwj+NqkeQuFFDzg4zy4UviTrjpMPClB5ba8Jxs
        5S3OkS63tDku4HooNK5Fp+DKYGmHC4qNOvV5opfUhEU0kTZSGLvB
X-Google-Smtp-Source: AGHT+IGOgxhyvET+eU8ks00qzpOpALW19oXgWOUc7rX/swOy6YUeNMdxA5fc4ZJkYp7Gd11utXe0H3HuMdNtDNpGPjA=
X-Received: by 2002:a1f:f843:0:b0:48d:f92:729a with SMTP id
 w64-20020a1ff843000000b0048d0f92729amr9223611vkh.5.1692953546658; Fri, 25 Aug
 2023 01:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230824013858.303105-1-marex@denx.de> <CAHCN7xLDmMv7T_fT7vY3iq+KMWuPM9tBP_2AJ-X04L7ZTRWPOw@mail.gmail.com>
 <80d9a66f-c703-6057-e084-1a6d2214d775@denx.de> <CAGXv+5GQFtCAYbfSbEJeHA4Os0O6WuD64V-xcZ9uDD33HbuhhQ@mail.gmail.com>
 <f6f55f46-bd6e-4dde-4484-86d1c385c8fe@denx.de>
In-Reply-To: <f6f55f46-bd6e-4dde-4484-86d1c385c8fe@denx.de>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 25 Aug 2023 16:52:15 +0800
Message-ID: <CAGXv+5EJ1asWymfjNcyLANSgQdJPcjT6MXUVwTYOEQ3PtVtXBQ@mail.gmail.com>
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

On Fri, Aug 25, 2023 at 4:33=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 8/25/23 09:09, Chen-Yu Tsai wrote:
> > On Thu, Aug 24, 2023 at 9:08=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 8/24/23 12:39, Adam Ford wrote:
> >>> On Wed, Aug 23, 2023 at 8:39=E2=80=AFPM Marek Vasut <marex@denx.de> w=
rote:
> >>>>
> >>>> The i.MX8MM/N/P does not define the .reset op since reset of the VPU=
 is
> >>>> done by genpd. Check whether the .reset op is defined before calling=
 it
> >>>> to avoid NULL pointer dereference.
> >>>>
> >>>> Note that the Fixes tag is set to the commit which removed the reset=
 op
> >>>> from i.MX8M Hantro G2 implementation, this is because before this co=
mmit
> >>>> all the implementations did define the .reset op.
> >>>
> >>> I am surprised I didn't have issues when I was testing the 8MQ and
> >>> 8MM, but this makes sense.
> >>
> >> You need to trigger the VPU watchdog to trigger the crash, that means
> >> you have to get the VPU into some weird state where it fails to decode
> >> frame. Then it triggers the reset and ... boom.
> >>
> >> See this patch, that contains a gstreamer invocation to generate such
> >> trigger condition input data:
> >>
> >> [PATCH] media: verisilicon: Do not enable G2 postproc downscale if
> >> source is narrower than destination
> >>
> >> "
> >> To generate input test data to trigger this bug, use e.g.:
> >> $ gst-launch-1.0 videotestsrc !
> >> video/x-raw,width=3D272,height=3D256,format=3DI420 ! \
> >>                    vp9enc ! matroskamux ! filesink location=3D/tmp/tes=
t.vp9
> >> To trigger the bug upon decoding (note that the NV12 must be forced, a=
s
> >> that assures the output data would pass the G2 postproc):
> >> $ gst-launch-1.0 filesrc location=3D/tmp/test.vp9 ! matroskademux !
> >> vp9parse ! \
> >>                    v4l2slvp9dec ! video/x-raw,format=3DNV12 ! videocon=
vert
> >> ! fbdevsink
> >> "
> >
> > Does it completely recover afterwards? In my previous trials the hardwa=
re
> > ended up in some bizzare state: while decoding succeeds, the output's m=
d5sum
> > didn't match up.
>
> Have you got a testcase that triggers this, one I can try ?
>
> I am not entirely sure whether this is happening here as well or not,
> but I can imagine that the power domain went down and back up between
> tests, so the VPU would be power cycled (and therefore reset) that way.
> So, I think it is worth testing that.

This was last year while I was writing HEVC decoding code for Chromium.
IIRC the SAODBLK_A_MainConcept_4 test vector from the official HEVC test
suite does cause our stack to crash, but Gstreamer seemed to handle it
OK. It could be that the Chromium decoder stack is passing bad values to
the decoder.


ChenYu
