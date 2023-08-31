Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52EB878E514
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 05:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242910AbjHaD1T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 23:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbjHaD1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 23:27:18 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFAECEB
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 20:27:10 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-48d0eb04c8cso153107e0c.0
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 20:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693452430; x=1694057230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cktt+6oO4/QGxOpepmZMJD5o/OMk1/3OdHU9NoLOIPI=;
        b=C1ILpVSUhxpl1mEtuQwYV7nuLgzoYTaddLcVy86PeLxpflxnD6GNVPZSwznwf0EYEs
         DLaJWY+6mXlXThyNm66iOSsvRApD8VDpVUUWthqO7MXbtHxewUcjNV5MGh0faFFot1rn
         S287sN8zhLyDj9g0J35qRfRjSAB0yvb0nChBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693452430; x=1694057230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cktt+6oO4/QGxOpepmZMJD5o/OMk1/3OdHU9NoLOIPI=;
        b=V00MSid94klCy39wtAwudmkzGkMTG/EAUe36+ZvQeQybljKXQUnLGfQLmiGxmB8KK1
         /K4mhhiOifE2T+gHdTt/uuQmzJu8eL7J+rkfGwwwCS/72T7T6zEESpopXHULA+WInqG8
         A/OfuLWBSoDYlsPUiiC5kuhTswgH5oyoOznbC7qkzH4whSon+eXlp9CMvfrkYZR+X8nr
         DOvUsei0rH/k7YfkNHa5hQZb06UdIoXE6HCwVvhe63N288Y4/SLUmuhGUr4lJvppA8DT
         dvqTosMae8kxZuv2jaNr8F+Rzpwz8kprbu26rGJuc6shEZK/wqNmcqfWPoTPEO+9FudX
         w9OA==
X-Gm-Message-State: AOJu0YzGmnv5XKs8wRxSYGhEylXHxjpUwz54Q/9T5s4D59H/dBkheFEz
        4pY4lAyqKPogMtsECh59IHYCZYes821odUGRwltmRdLyL+afKKmG
X-Google-Smtp-Source: AGHT+IFDfFY5SuEgR+07TOP51AB/1qobwysn6FTj5OlGXRe80wUPiDPQ6elLo4yny7JYq4qV58qrU6hngAkS89LGhng=
X-Received: by 2002:a67:fe93:0:b0:44e:9a71:27a1 with SMTP id
 b19-20020a67fe93000000b0044e9a7127a1mr3335342vsr.17.1693452429873; Wed, 30
 Aug 2023 20:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230824013858.303105-1-marex@denx.de> <CAHCN7xLDmMv7T_fT7vY3iq+KMWuPM9tBP_2AJ-X04L7ZTRWPOw@mail.gmail.com>
 <80d9a66f-c703-6057-e084-1a6d2214d775@denx.de> <CAGXv+5GQFtCAYbfSbEJeHA4Os0O6WuD64V-xcZ9uDD33HbuhhQ@mail.gmail.com>
 <f6f55f46-bd6e-4dde-4484-86d1c385c8fe@denx.de> <CAGXv+5EJ1asWymfjNcyLANSgQdJPcjT6MXUVwTYOEQ3PtVtXBQ@mail.gmail.com>
 <a445f1fc-6b38-e58b-a3ca-81c05e19f66e@denx.de> <CAGXv+5ESeqzzGAooMUFLiwJEzLneTRDbLggyzTFeq32NzDDUiw@mail.gmail.com>
 <3a5ef85d-ee82-a1aa-1bf0-9fcb5efec833@denx.de>
In-Reply-To: <3a5ef85d-ee82-a1aa-1bf0-9fcb5efec833@denx.de>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 31 Aug 2023 11:26:58 +0800
Message-ID: <CAGXv+5HqA69qrKmdENnWMawzwm5bzdDQ_8brwci4b5qyReWx6g@mail.gmail.com>
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

On Thu, Aug 31, 2023 at 3:13=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 8/30/23 05:38, Chen-Yu Tsai wrote:
> > On Sun, Aug 27, 2023 at 5:44=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 8/25/23 10:52, Chen-Yu Tsai wrote:
> >>> On Fri, Aug 25, 2023 at 4:33=E2=80=AFPM Marek Vasut <marex@denx.de> w=
rote:
> >>>>
> >>>> On 8/25/23 09:09, Chen-Yu Tsai wrote:
> >>>>> On Thu, Aug 24, 2023 at 9:08=E2=80=AFPM Marek Vasut <marex@denx.de>=
 wrote:
> >>>>>>
> >>>>>> On 8/24/23 12:39, Adam Ford wrote:
> >>>>>>> On Wed, Aug 23, 2023 at 8:39=E2=80=AFPM Marek Vasut <marex@denx.d=
e> wrote:
> >>>>>>>>
> >>>>>>>> The i.MX8MM/N/P does not define the .reset op since reset of the=
 VPU is
> >>>>>>>> done by genpd. Check whether the .reset op is defined before cal=
ling it
> >>>>>>>> to avoid NULL pointer dereference.
> >>>>>>>>
> >>>>>>>> Note that the Fixes tag is set to the commit which removed the r=
eset op
> >>>>>>>> from i.MX8M Hantro G2 implementation, this is because before thi=
s commit
> >>>>>>>> all the implementations did define the .reset op.
> >>>>>>>
> >>>>>>> I am surprised I didn't have issues when I was testing the 8MQ an=
d
> >>>>>>> 8MM, but this makes sense.
> >>>>>>
> >>>>>> You need to trigger the VPU watchdog to trigger the crash, that me=
ans
> >>>>>> you have to get the VPU into some weird state where it fails to de=
code
> >>>>>> frame. Then it triggers the reset and ... boom.
> >>>>>>
> >>>>>> See this patch, that contains a gstreamer invocation to generate s=
uch
> >>>>>> trigger condition input data:
> >>>>>>
> >>>>>> [PATCH] media: verisilicon: Do not enable G2 postproc downscale if
> >>>>>> source is narrower than destination
> >>>>>>
> >>>>>> "
> >>>>>> To generate input test data to trigger this bug, use e.g.:
> >>>>>> $ gst-launch-1.0 videotestsrc !
> >>>>>> video/x-raw,width=3D272,height=3D256,format=3DI420 ! \
> >>>>>>                      vp9enc ! matroskamux ! filesink location=3D/t=
mp/test.vp9
> >>>>>> To trigger the bug upon decoding (note that the NV12 must be force=
d, as
> >>>>>> that assures the output data would pass the G2 postproc):
> >>>>>> $ gst-launch-1.0 filesrc location=3D/tmp/test.vp9 ! matroskademux =
!
> >>>>>> vp9parse ! \
> >>>>>>                      v4l2slvp9dec ! video/x-raw,format=3DNV12 ! vi=
deoconvert
> >>>>>> ! fbdevsink
> >>>>>> "
> >>>>>
> >>>>> Does it completely recover afterwards? In my previous trials the ha=
rdware
> >>>>> ended up in some bizzare state: while decoding succeeds, the output=
's md5sum
> >>>>> didn't match up.
> >>>>
> >>>> Have you got a testcase that triggers this, one I can try ?
> >>>>
> >>>> I am not entirely sure whether this is happening here as well or not=
,
> >>>> but I can imagine that the power domain went down and back up betwee=
n
> >>>> tests, so the VPU would be power cycled (and therefore reset) that w=
ay.
> >>>> So, I think it is worth testing that.
> >>>
> >>> This was last year while I was writing HEVC decoding code for Chromiu=
m.
> >>> IIRC the SAODBLK_A_MainConcept_4 test vector from the official HEVC t=
est
> >>> suite does cause our stack to crash, but Gstreamer seemed to handle i=
t
> >>> OK. It could be that the Chromium decoder stack is passing bad values=
 to
> >>> the decoder.
> >>
> >> That can be easily tested with ftrace enabled. I was just tracking dow=
n
> >> an issue with gstreamer and added the following patch to the hantro
> >> driver. Then:
> >>
> >> echo > /sys/kernel/debug/tracing/trace
> >> <run fail test>
> >> cat /sys/kernel/debug/tracing/trace > /tmp/fail.trace
> >> echo > /sys/kernel/debug/tracing/trace
> >> <run pass test>
> >> cat /sys/kernel/debug/tracing/trace > /tmp/pass.trace
> >> # remove time stamps etc.
> >> diff /tmp/{fail,pass}.trace
> >>
> >> You should see whether some register programming differs between
> >> gstreamer and chromium.
> >
> > I ended up using VISL to compare the controls set. I did find a bug.
> > It still hard hangs after a couple frames, so I guess I'd need to use
> > your method, but do printk instead.
> >
> > BTW, I wonder if we shouldn't add a reset op, if only just to stop the
> > hardware? That is, do the same two register writes as in the Hantro G2
> > interrupt handler.
>
> You mean these two ?
>
> 38         vdpu_write(vpu, 0, G2_REG_INTERRUPT);
> 39         vdpu_write(vpu, G2_REG_CONFIG_DEC_CLK_GATE_E, G2_REG_CONFIG);

Yes.

> As far as I understand this, that only clears IRQ and gates the clock
> off, but it doesn't reset the IP state, does it ?

That's right, but it would stop the hardware from continuing to do whatever
it is doing before it gets shut down through runtime PM. I'm not sure it
would make that much of a difference, but it did seem like something that
could be done.

ChenYu
