Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37CED7516A5
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 05:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbjGMDNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jul 2023 23:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjGMDNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jul 2023 23:13:46 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC9B1BF0
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 20:13:45 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-767b6d6bb87so17942685a.2
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689218024; x=1691810024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kp01TNBK5W5j9juG4tQlzDEDUZGZwrwMeVA9No2lzd4=;
        b=BNq85ZZgBzRCzoK/fYZAyElwbVfHkDV9HSaSoQR65ISukRWEoY4aipKyAL+JCHew65
         6DvU+eI2XrB3URJuBnIGEutP5RHEIvNye95rZzDWb8Y3ne9emnyCE+3Txyn1SHOPHjbI
         7R23DwCJ+Pqn52jG3VGUGRieHDV8zkLntW44Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689218024; x=1691810024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kp01TNBK5W5j9juG4tQlzDEDUZGZwrwMeVA9No2lzd4=;
        b=DaLTRmm86sNZxHWdhgSRiHyq1V68vRcM3ZDAfYvqg9I73ZBzZ7/7BBOEeiVZzMk2rA
         NVIj54KsD6pISbZo7gwEtDvAnQRBrZQAIK50WvSKTro0I1l3+C0eMPB/juri4RZnYETt
         2qPfoS3c0GZyCneakjj5LPbnZDTO8woCpWF6R4yUgtfIkvYJj/1OG/4VGwvGfqJn1grC
         1M/RfDetKnJvCZ3jQTt7nVt0e1JlRA8sxnOblbGXwpYzyT6sPVCWY1Ui6767QMx8uenO
         vxQ9lGtVQKpcZ4QOl0EnC3SzZ8DnbYGEAZx/vzDNhCnOrFRvdqtMvH73h1hcfIJ7Aauy
         3DaQ==
X-Gm-Message-State: ABy/qLbbF9gRSE6yTZcE8+mSSk806Vyhj1qYOsvJ/KdKBrqK40OK+Y+w
        a28V/6l89TUh7gB2fdJiEZsJEJSS1e1NL2IGZLHZ4ant
X-Google-Smtp-Source: APBJJlEItL7oOEh04L9rcsGQbBPW7flDI+LLhm5S/cG7PN16AHgFOIZ752WrllzAGpz5A6ZEYVpI7A==
X-Received: by 2002:a05:620a:458a:b0:767:2e5a:cc with SMTP id bp10-20020a05620a458a00b007672e5a00ccmr285031qkb.26.1689218023926;
        Wed, 12 Jul 2023 20:13:43 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id h7-20020a05620a10a700b007677f66b160sm2610246qkk.124.2023.07.12.20.13.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 20:13:43 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7673180224bso19421885a.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 20:13:43 -0700 (PDT)
X-Received: by 2002:a0c:c548:0:b0:634:7c34:6c96 with SMTP id
 y8-20020a0cc548000000b006347c346c96mr207235qvi.7.1689218022590; Wed, 12 Jul
 2023 20:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230704040044.681850-1-randy.li@synaptics.com>
 <20230704040044.681850-2-randy.li@synaptics.com> <20452e233a9a4b39b58139081d818d3b1454105a.camel@ndufresne.ca>
 <20230712093129.pdcbvlxd5zphwr5m@chromium.org> <20230712094426.iot6f4rarlrtouvf@basti-XPS-13-9310>
In-Reply-To: <20230712094426.iot6f4rarlrtouvf@basti-XPS-13-9310>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 13 Jul 2023 12:13:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DiB-i+YBt9E8Rh5ngJ9KVCjdjXStV4s-f-m-YdqeCOEQ@mail.gmail.com>
Message-ID: <CAAFQd5DiB-i+YBt9E8Rh5ngJ9KVCjdjXStV4s-f-m-YdqeCOEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] [RESEND] media: v4l2-mem2mem: allow device run
 without buf
To:     Sebastian Fricke <sebastian.fricke@collabora.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hsia-Jun Li <randy.li@synaptics.com>,
        linux-media@vger.kernel.org, ayaka@soulik.info,
        hans.verkuil@cisco.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, hiroh@chromium.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        mcasas@chromium.org, Steve Cho <stevecho@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        "wenst@chromium.org" <wenst@chromium.org>,
        "nhebert@chromium.org" <nhebert@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 12, 2023 at 6:44=E2=80=AFPM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Hey Tomasz,
>
> On 12.07.2023 09:31, Tomasz Figa wrote:
> >On Fri, Jul 07, 2023 at 03:14:23PM -0400, Nicolas Dufresne wrote:
> >> Hi Randy,
> >>
> >> Le mardi 04 juillet 2023 =C3=A0 12:00 +0800, Hsia-Jun Li a =C3=A9crit =
:
> >> > From: Randy Li <ayaka@soulik.info>
> >> >
> >> > For the decoder supports Dynamic Resolution Change,
> >> > we don't need to allocate any CAPTURE or graphics buffer
> >> > for them at inital CAPTURE setup step.
> >> >
> >> > We need to make the device run or we can't get those
> >> > metadata.
> >> >
> >> > Signed-off-by: Randy Li <ayaka@soulik.info>
> >> > ---
> >> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 5 +++--
> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/=
v4l2-core/v4l2-mem2mem.c
> >> > index 0cc30397fbad..c771aba42015 100644
> >> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> >> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> >> > @@ -301,8 +301,9 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m=
_dev *m2m_dev,
> >> >
> >> >    dprintk("Trying to schedule a job for m2m_ctx: %p\n", m2m_ctx);
> >> >
> >> > -  if (!m2m_ctx->out_q_ctx.q.streaming
> >> > -      || !m2m_ctx->cap_q_ctx.q.streaming) {
> >> > +  if (!(m2m_ctx->out_q_ctx.q.streaming || m2m_ctx->out_q_ctx.buffer=
ed)
> >> > +      || !(m2m_ctx->cap_q_ctx.q.streaming
> >> > +           || m2m_ctx->cap_q_ctx.buffered)) {
> >>
> >> I have a two atches with similar goals in my wave5 tree. It will be ea=
sier to
> >> upstream with an actual user, though, I'm probably a month or two away=
 from
> >> submitting this driver again.
> >>
> >> https://gitlab.collabora.com/chipsnmedia/kernel/-/commit/ac59eafd5076c=
4deb3bfe1fb85b3b776586ef3eb
> >> https://gitlab.collabora.com/chipsnmedia/kernel/-/commit/5de4fbe0abb20=
b8e8d862b654f93e3efeb1ef251
> >>
> >
> >While I'm not going to NAK this series or those 2 patches if you send
> >them, I'm not really convinced that adding more and more complexity to
> >the mem2mem helpers is a good idea, especially since all of those seem
> >to be only needed by stateful video decoders.
> >
> >The mem2mem framework started as a set of helpers to eliminate boiler
> >plate from simple drivers that always get 1 CAPTURE and 1 OUTPUT buffer,
> >run 1 processing job on them and then return both of the to the userspac=
e
> >and I think it should stay like this.
> >
> >I think we're strongly in need of a stateful video decoder framework tha=
t
> >would actually address the exact problems that those have rather than
> >bending something that wasn't designed with them in mind to work around =
the
> >differences.
>
> Thanks for the feedback.
>
> I have recently discussed how we could approach creating a framework for
> the codecs side, with Hans Verkuil and Nicolas Dufresne.

That's great to hear, thanks. :)

>
> The first step we would have to do is come up with a list of
> requirements for that framework and expected future needs, maybe we can
> start a public discussion on the mailing list to generate a list like
> that.

Makes sense. Let me CC some ChromeOS folks working on video codec
drivers these days.

> But all in all this endeavor will probably require quite a bit of time
> and effort, do you think we could modify M2M a bit for our use case and
> then when we are in the process of creating the new framework, we could
> maybe think about simplifying the M2M framework again?

Sure, as I said, I'm not NAKing this series.

>
> >
> >Best regards,
> >Tomasz
>
> Greetings,
> Sebastian
>
> >
> >> Sebastien and I authored this without giving it much thought, but we b=
elieve
> >> this massively simplify our handling of DRC (dynamic resolution change=
).
> >>
> >> The main difference, is that we added ignore_streaming to the ctx, so =
that
> >> drivers can opt-in the mode of operation. Thinking it would avoid any =
potential
> >> side effects in drivers that aren't prepared to that. We didn't want t=
o tied it
> >> up to buffered, this is open to discussion of course, we do use buffer=
ed on both
> >> queues and use a slightly more advance job_ready function, that take i=
nto
> >> account our driver state.
> >>
> >> In short, Sebastien and I agree this small change is the right directi=
on, we
> >> simply have a different implementation. I can send it as RFC if one be=
lieve its
> >> would be useful now (even without a user).
> >>
> >> >            dprintk("Streaming needs to be on for both queues\n");
> >> >            return;
> >> >    }
> >>
