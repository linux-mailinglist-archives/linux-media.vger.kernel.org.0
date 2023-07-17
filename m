Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB29C7565A7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 16:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjGQOAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 10:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjGQOAw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 10:00:52 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CC8E1
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 07:00:50 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-635e5b06aaeso23496936d6.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1689602449; x=1692194449;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=86pGFUJupmtwTHTpb8fR3031C4UxpHPWG3ugQ4iErHk=;
        b=wWoDGSviZ+r9PuadCbQ87GlGxcRCX8TOW4isThzs9X8FYihl6u/s5uiBgtsmMbAG1H
         05tswht2rJyqhUvuwrQgLk9OODiOyWtkc9yF/nf5zwiZkg1x/+9fOTabon8iX7J+VBpt
         ahY3wxM5lDTCTqEiFuIs0bwAbEZjw8vudUsTRLrM0LgYsXA9kLONurxX+E/6PsZpmQOP
         T+cKmnLdngK6Tki/roAsbfA8j7vTTRUxuz5jBskGuJXns3q6A4dTf4Jz3U51Znu6cAtK
         Ipo1InNeNzpty3h1iM1nNIHyuY8OPyFt8Lmv1QCs7qr88LN3WyIE8AS4KNNPLNTNgh20
         Aa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689602449; x=1692194449;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86pGFUJupmtwTHTpb8fR3031C4UxpHPWG3ugQ4iErHk=;
        b=e+yNnJGttDgZ7HSkHAfNi36YTiQWcygNZ5wtpjm77GqoGyLrhA0BamD+DEUcghcYUP
         8DtabbAjAoYV3PMdSTO5dRD56yACk9eoottLJg7JF6Zs3r1SswgJbUkhMxJtbr2ss9kx
         RVfx+Jt7U8YOt9ouBKAQlnV5ax/fIU45GvJS3hwjMeugtEFsHv/1hA+FWXphGjLRhzXm
         WPY8nCKXQPB0oIYKgkBvCgehPUlN9qQ0LxuD5FUXwGIY9J7j3jExDEXHUu2i60YoTLJB
         NSsqPSrQvCDQu6ER28lDOFUSqnvUg1KVKHjR2DPp3QQkKvSpmGE+E63bh+Y1oz766o5h
         N2CA==
X-Gm-Message-State: ABy/qLbp6BD2/tX6vcHEHPc9kuWImCkVS50YlnQJXIeYSdZPj5wKulcu
        Uy+7H27/QX1jn/rgVlfVpmfDLw==
X-Google-Smtp-Source: APBJJlFy2BueHga5KIqJLVY4NNcrJRztiGYh+rqKXVsvH85sXWXfghYPwEKfhvq0Rca36ytZr6fXFA==
X-Received: by 2002:a05:6214:12e:b0:62d:f096:be06 with SMTP id w14-20020a056214012e00b0062df096be06mr11982581qvs.22.1689602449229;
        Mon, 17 Jul 2023 07:00:49 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:83d4::7a9])
        by smtp.gmail.com with ESMTPSA id j13-20020a0cf30d000000b0063013c621fasm6340095qvl.68.2023.07.17.07.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 07:00:48 -0700 (PDT)
Message-ID: <17ca8c5ee31ac8e48bb2ac7f89f6bae84816c893.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] [RESEND] media: v4l2-mem2mem: allow device run
 without buf
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hsia-Jun Li <randy.li@synaptics.com>, linux-media@vger.kernel.org,
        ayaka@soulik.info, hans.verkuil@cisco.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, hiroh@chromium.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        Sebastian Fricke <sebastian.fricke@collabora.com>
Date:   Mon, 17 Jul 2023 10:00:48 -0400
In-Reply-To: <20230712093129.pdcbvlxd5zphwr5m@chromium.org>
References: <20230704040044.681850-1-randy.li@synaptics.com>
         <20230704040044.681850-2-randy.li@synaptics.com>
         <20452e233a9a4b39b58139081d818d3b1454105a.camel@ndufresne.ca>
         <20230712093129.pdcbvlxd5zphwr5m@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 12 juillet 2023 =C3=A0 09:31 +0000, Tomasz Figa a =C3=A9crit=C2=
=A0:
> On Fri, Jul 07, 2023 at 03:14:23PM -0400, Nicolas Dufresne wrote:
> > Hi Randy,
> >=20
> > Le mardi 04 juillet 2023 =C3=A0 12:00 +0800, Hsia-Jun Li a =C3=A9crit=
=C2=A0:
> > > From: Randy Li <ayaka@soulik.info>
> > >=20
> > > For the decoder supports Dynamic Resolution Change,
> > > we don't need to allocate any CAPTURE or graphics buffer
> > > for them at inital CAPTURE setup step.
> > >=20
> > > We need to make the device run or we can't get those
> > > metadata.
> > >=20
> > > Signed-off-by: Randy Li <ayaka@soulik.info>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-mem2mem.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v=
4l2-core/v4l2-mem2mem.c
> > > index 0cc30397fbad..c771aba42015 100644
> > > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > > @@ -301,8 +301,9 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_=
dev *m2m_dev,
> > > =20
> > >  	dprintk("Trying to schedule a job for m2m_ctx: %p\n", m2m_ctx);
> > > =20
> > > -	if (!m2m_ctx->out_q_ctx.q.streaming
> > > -	    || !m2m_ctx->cap_q_ctx.q.streaming) {
> > > +	if (!(m2m_ctx->out_q_ctx.q.streaming || m2m_ctx->out_q_ctx.buffered=
)
> > > +	    || !(m2m_ctx->cap_q_ctx.q.streaming
> > > +		 || m2m_ctx->cap_q_ctx.buffered)) {
> >=20
> > I have a two atches with similar goals in my wave5 tree. It will be eas=
ier to
> > upstream with an actual user, though, I'm probably a month or two away =
from
> > submitting this driver again.
> >=20
> > https://gitlab.collabora.com/chipsnmedia/kernel/-/commit/ac59eafd5076c4=
deb3bfe1fb85b3b776586ef3eb
> > https://gitlab.collabora.com/chipsnmedia/kernel/-/commit/5de4fbe0abb20b=
8e8d862b654f93e3efeb1ef251
> >=20
>=20
> While I'm not going to NAK this series or those 2 patches if you send
> them, I'm not really convinced that adding more and more complexity to
> the mem2mem helpers is a good idea, especially since all of those seem
> to be only needed by stateful video decoders.
>=20
> The mem2mem framework started as a set of helpers to eliminate boiler
> plate from simple drivers that always get 1 CAPTURE and 1 OUTPUT buffer,
> run 1 processing job on them and then return both of the to the userspace
> and I think it should stay like this.

Its a bit late to try and bring that argument. It should have been raised c=
ouple
of years ago (before I even started helping with these CODEC). Now that all=
 the
newly written stately decoders uses this framework, it is logical to keep
reducing the boiler plate for these too. In my opinion, the job_ready()
callback, should have been a lot more flexible from the start. And allowing
driver to make it more powerful does not really add that much complexity.

Speaking of complexity, driving the output manually (outside of the job
workqueue) during sequence initialization is a way more complex and risky t=
hen
this. Finally, sticking with 1:1 pattern means encoder, detilers, image
enhancement reducing framerate, etc. would all be unwelcome to use this. Wh=
ich
in short, means no one should even use this.

>=20
> I think we're strongly in need of a stateful video decoder framework that
> would actually address the exact problems that those have rather than
> bending something that wasn't designed with them in mind to work around t=
he
> differences.

The bend is already there, of course I'd be happy to help with any new
framework. Specially on modern stateless, were there is a need to do better
scheduling. Just ping me if you have some effort starting, I don't currentl=
y
have a budget or bandwidth to write new drivers or port existing drivers th=
em on
a newly written framework.

Nicolas


[...]
