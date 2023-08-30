Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709DB78D290
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 05:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238213AbjH3Div (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 23:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237775AbjH3Div (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 23:38:51 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEA51B0
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 20:38:48 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-44d60bb6aa5so2299325137.2
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 20:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693366727; x=1693971527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdgZcvMXHkxZjnyYrS3QkK4MDpO+xXqtU6pz/g9B33Y=;
        b=n+o7a8/jg4xtjjjaqpbEt3Q1Eu3vJIC+F9aCSMP5ywO8A0KDK4mXWKrsEzp1eym6Rk
         Du+zWKY4M1SJjjS0ZXtpo5AuI1itf7h4ogTfpVTfhyMuTQOtoMx4SNgHxqu8dMOeDpUV
         Vmf9esEjCb5NMUS3F4ZkXAZ4LFqkssP4CxiBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693366727; x=1693971527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdgZcvMXHkxZjnyYrS3QkK4MDpO+xXqtU6pz/g9B33Y=;
        b=a2HhzqGKuXsWi+v2hKrmn5t4Zy8UreaPUN2x13CRVTo214KZduTB8RqYL91s/g0Z1w
         OLToe/DdUbiihz1/uMklv1TCmEgATIirv/ihnZO21ziRV7kiJBMg4ffhieja8ugWGev5
         p3e97P6xA4jOFZtJtObM9awFBThwfgL8PXBIfZTTslewiIYdX23j/Biszm1lVWR2Ej1K
         Wizv97NBk0bCvJ8OTCiu4FxQPn0Zq/Q50H5Be0r58cpRSLUR1HvA/GpMBQk+JZ081+lt
         9ul60z+t7bwhbcX1Ph6hZ0kikUgLffnQgzzhkVxzvUEl12uj2EYDJxq73ssr1zcZ5AUg
         Eu+g==
X-Gm-Message-State: AOJu0Yw+Z73v2NAH8UClVQHHjzTZ0+cPL8jdx62rJIojWaOxhNyws/0A
        njGVicAP+5NIF1rAX20u0s4jcKPPqSyN32OJyMGFoA==
X-Google-Smtp-Source: AGHT+IFs9NFnbcKWUGXFHV1qRYAJK+3xA2eONKYJjzTOUIe/hu4vxA8oibx1FVVt5NrDQLWElf7+zWCIwTamKrWjXnM=
X-Received: by 2002:a67:ec05:0:b0:44e:92dc:7f12 with SMTP id
 d5-20020a67ec05000000b0044e92dc7f12mr972109vso.30.1693366727227; Tue, 29 Aug
 2023 20:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230824013858.303105-1-marex@denx.de> <CAHCN7xLDmMv7T_fT7vY3iq+KMWuPM9tBP_2AJ-X04L7ZTRWPOw@mail.gmail.com>
 <80d9a66f-c703-6057-e084-1a6d2214d775@denx.de> <CAGXv+5GQFtCAYbfSbEJeHA4Os0O6WuD64V-xcZ9uDD33HbuhhQ@mail.gmail.com>
 <f6f55f46-bd6e-4dde-4484-86d1c385c8fe@denx.de> <CAGXv+5EJ1asWymfjNcyLANSgQdJPcjT6MXUVwTYOEQ3PtVtXBQ@mail.gmail.com>
 <a445f1fc-6b38-e58b-a3ca-81c05e19f66e@denx.de>
In-Reply-To: <a445f1fc-6b38-e58b-a3ca-81c05e19f66e@denx.de>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 30 Aug 2023 11:38:36 +0800
Message-ID: <CAGXv+5ESeqzzGAooMUFLiwJEzLneTRDbLggyzTFeq32NzDDUiw@mail.gmail.com>
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

On Sun, Aug 27, 2023 at 5:44=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 8/25/23 10:52, Chen-Yu Tsai wrote:
> > On Fri, Aug 25, 2023 at 4:33=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 8/25/23 09:09, Chen-Yu Tsai wrote:
> >>> On Thu, Aug 24, 2023 at 9:08=E2=80=AFPM Marek Vasut <marex@denx.de> w=
rote:
> >>>>
> >>>> On 8/24/23 12:39, Adam Ford wrote:
> >>>>> On Wed, Aug 23, 2023 at 8:39=E2=80=AFPM Marek Vasut <marex@denx.de>=
 wrote:
> >>>>>>
> >>>>>> The i.MX8MM/N/P does not define the .reset op since reset of the V=
PU is
> >>>>>> done by genpd. Check whether the .reset op is defined before calli=
ng it
> >>>>>> to avoid NULL pointer dereference.
> >>>>>>
> >>>>>> Note that the Fixes tag is set to the commit which removed the res=
et op
> >>>>>> from i.MX8M Hantro G2 implementation, this is because before this =
commit
> >>>>>> all the implementations did define the .reset op.
> >>>>>
> >>>>> I am surprised I didn't have issues when I was testing the 8MQ and
> >>>>> 8MM, but this makes sense.
> >>>>
> >>>> You need to trigger the VPU watchdog to trigger the crash, that mean=
s
> >>>> you have to get the VPU into some weird state where it fails to deco=
de
> >>>> frame. Then it triggers the reset and ... boom.
> >>>>
> >>>> See this patch, that contains a gstreamer invocation to generate suc=
h
> >>>> trigger condition input data:
> >>>>
> >>>> [PATCH] media: verisilicon: Do not enable G2 postproc downscale if
> >>>> source is narrower than destination
> >>>>
> >>>> "
> >>>> To generate input test data to trigger this bug, use e.g.:
> >>>> $ gst-launch-1.0 videotestsrc !
> >>>> video/x-raw,width=3D272,height=3D256,format=3DI420 ! \
> >>>>                     vp9enc ! matroskamux ! filesink location=3D/tmp/=
test.vp9
> >>>> To trigger the bug upon decoding (note that the NV12 must be forced,=
 as
> >>>> that assures the output data would pass the G2 postproc):
> >>>> $ gst-launch-1.0 filesrc location=3D/tmp/test.vp9 ! matroskademux !
> >>>> vp9parse ! \
> >>>>                     v4l2slvp9dec ! video/x-raw,format=3DNV12 ! video=
convert
> >>>> ! fbdevsink
> >>>> "
> >>>
> >>> Does it completely recover afterwards? In my previous trials the hard=
ware
> >>> ended up in some bizzare state: while decoding succeeds, the output's=
 md5sum
> >>> didn't match up.
> >>
> >> Have you got a testcase that triggers this, one I can try ?
> >>
> >> I am not entirely sure whether this is happening here as well or not,
> >> but I can imagine that the power domain went down and back up between
> >> tests, so the VPU would be power cycled (and therefore reset) that way=
.
> >> So, I think it is worth testing that.
> >
> > This was last year while I was writing HEVC decoding code for Chromium.
> > IIRC the SAODBLK_A_MainConcept_4 test vector from the official HEVC tes=
t
> > suite does cause our stack to crash, but Gstreamer seemed to handle it
> > OK. It could be that the Chromium decoder stack is passing bad values t=
o
> > the decoder.
>
> That can be easily tested with ftrace enabled. I was just tracking down
> an issue with gstreamer and added the following patch to the hantro
> driver. Then:
>
> echo > /sys/kernel/debug/tracing/trace
> <run fail test>
> cat /sys/kernel/debug/tracing/trace > /tmp/fail.trace
> echo > /sys/kernel/debug/tracing/trace
> <run pass test>
> cat /sys/kernel/debug/tracing/trace > /tmp/pass.trace
> # remove time stamps etc.
> diff /tmp/{fail,pass}.trace
>
> You should see whether some register programming differs between
> gstreamer and chromium.

I ended up using VISL to compare the controls set. I did find a bug.
It still hard hangs after a couple frames, so I guess I'd need to use
your method, but do printk instead.

BTW, I wonder if we shouldn't add a reset op, if only just to stop the
hardware? That is, do the same two register writes as in the Hantro G2
interrupt handler.

ChenYu


> diff --git a/drivers/media/platform/verisilicon/hantro.h
> b/drivers/media/platform/verisilicon/hantro.h
> index dea35a501ba30..529f1ab478ec8 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -353,8 +353,7 @@ extern int hantro_debug;
>
>   #define vpu_debug(level, fmt, args...)                         \
>          do {                                                    \
> -               if (hantro_debug & BIT(level))          \
> -                       pr_info("%s:%d: " fmt,                  \
> +               trace_printk("%s:%d: " fmt,                     \
>                                   __func__, __LINE__, ##args);   \
>          } while (0)
