Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90A5F511D8C
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 20:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239273AbiD0PLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 11:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239133AbiD0PLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 11:11:43 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398CC203F5B
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 08:08:29 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id s4so1523964qkh.0
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=BGXgRkm7KfAuxs/lpObycbS7QSUjU1DegZpjJv5xMRo=;
        b=zQCZg/1gEuydchdqj6KgGuunQzzEztTpMwRrPhBiadpx9coH4AxqBO1HpODzdIHeVh
         ZO7Svx7GUbRvl93GxQFyUkRwfSjo3I7TZ0RKbbUhR2DlLz5iEm9FkTkeOxnyG7+czP9x
         vfrl9y0VK8vlKPZZi3FNtbDlGkwqinateCU8uXhRG0XNkl8wd6IH+vk4ZnehGkOWCctK
         gpnG2qvACm3Tz5lSWnpg7gmhlIxxMQ1Ebc4FS/xxc0kRi/vVUGugtDxGL7eGZVkznZJI
         WElUfnl3w5FOkimxquM6ZIQj8xIKQKcxxlSCJu0QL5CDLDxt+xZvfqGivWjfS/5v9rNJ
         gYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=BGXgRkm7KfAuxs/lpObycbS7QSUjU1DegZpjJv5xMRo=;
        b=b6Y7DiOG1uU6PjIDqHOW8VpZFCFqHPJhgHRw+m8Ld+qAxTw4iyeVrWAC2X1nQV0d7n
         l1Yw1uqcUS27jeulVoOT0Iw3zEOUmg/hkI1E7qtb+ltSLZnedLAJj+qUyYlbrPUAVv3I
         ntpeu2XHrGWCCU5/YxJ/qnT926FSeuzN0BP8Zvej7sUO6dr5+duZv9liQac2edWfSBqS
         /+n3dipmWsCDCn93k1qWEFMPtMtCUEdGewr9WiHYbTmO/nuLFxUGm4DjmjfgZ2z0ZINJ
         bJhi30beXCLB0qnUyMSjYVHg1gTxmHOWgYHlRIFdRQU2pw6fSX4QT+oiXdOdIZqKA7QH
         Z1dg==
X-Gm-Message-State: AOAM531M1yO44enVV9QjWEcpzBAI8RMvpQTMNd5zaka5M1gXFo+6Z87J
        lojmui+ILrp99864Y7FBILwK9g==
X-Google-Smtp-Source: ABdhPJyz8xzV4hhv6gSPTzvzMZAdA3dvuWPN46Ns7zosNhqLq064CpZ10rj++94CM0mckZX+Q3aAOQ==
X-Received: by 2002:a05:620a:4450:b0:69e:a2ca:e7d7 with SMTP id w16-20020a05620a445000b0069ea2cae7d7mr16860296qkp.178.1651072107898;
        Wed, 27 Apr 2022 08:08:27 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id k20-20020a05622a03d400b002ec16d2694fsm10227421qtx.39.2022.04.27.08.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:08:27 -0700 (PDT)
Message-ID: <a78920881b2ffaf1fba04bc9ebeda591ec0dfd87.camel@ndufresne.ca>
Subject: Re: [PATCH v4 03/24] media: videobuf2-v4l2: Warn on holding buffers
 without support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sebastian Fricke <sebastian.fricke@collabora.com>,
        linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-kernel@vger.kernel.org
Date:   Wed, 27 Apr 2022 11:08:24 -0400
In-Reply-To: <CAAFQd5C6qmxmn4y=cx5Mtb3p8vcTAFm6Jfc1vMAE8+x9iwhDZg@mail.gmail.com>
References: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
         <20220426125751.108293-4-nicolas.dufresne@collabora.com>
         <CAAFQd5C6qmxmn4y=cx5Mtb3p8vcTAFm6Jfc1vMAE8+x9iwhDZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 27 avril 2022 =C3=A0 13:31 +0900, Tomasz Figa a =C3=A9crit=C2=
=A0:
> Hi Nicolas, Sebastian,
>=20
> On Tue, Apr 26, 2022 at 9:58 PM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > From: Sebastian Fricke <sebastian.fricke@collabora.com>
> >=20
> > Using V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag without specifying the
> > subsystem flag VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF, results in
> > silently ignoring it.
> > Warn the user via a debug print when the flag is requested but ignored
> > by the videobuf2 framework.
> >=20
> > Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-v4l2.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
>=20
> Thanks for the patch. Please see my comments inline.
>=20
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/=
media/common/videobuf2/videobuf2-v4l2.c
> > index 6edf4508c636..812c8d1962e0 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -329,8 +329,13 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buf=
fer *vb, struct v4l2_buffer *b
> >                  */
> >                 vbuf->flags &=3D ~V4L2_BUF_FLAG_TIMECODE;
> >                 vbuf->field =3D b->field;
> > -               if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOL=
D_CAPTURE_BUF))
> > +               if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOL=
D_CAPTURE_BUF)) {
> > +                       if (vbuf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTUR=
E_BUF)
> > +                               dprintk(q, 1,
> > +                                       "Request holding buffer (%d), u=
nsupported on output queue\n",
> > +                                       b->index);
>=20
> I wonder if we shouldn't just fail such a QBUF operation. Otherwise
> the application would get unexpected behavior from the kernel.
> Although it might be too late to do it now if there are applications
> that rely on this implicit ignore...

In the context of this patchset, the statu quo seems to be the logical thin=
g to
do. We can raise this up in a separate thread. The side effect is of course
confusing for developers, but it is hard for me to tell if a hard failure m=
ay
break an existing software.

regards,
Nicolas

>=20
> Best regards,
> Tomasz

