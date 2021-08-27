Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371B13F9F21
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 20:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhH0SsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 14:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhH0Sr7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 14:47:59 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F078C061757
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 11:47:09 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a25so15809884ejv.6
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 11:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KeZQzHpEFEr9FV0/AKy8TSifxmzkQIz3WN598+K3z5s=;
        b=EwOw/8qGsz5LfJ7BC7neHVTtAykNj5pjJn1xJiY3JCFODNr/26l443lJfxC1RzAfpD
         xrp0bVmtffTVkaBqm7Yaj97uM1vuin3IyCmvDi2ea9tcG2Vs3du/WryXAbtLNA+QtPcT
         t3zono2PtDiKO44ezoJQHKhHm0hAeDBRKdcKdyar+9n2JlMBoLgD5Y1WMVfw6yRRY0nx
         7d9j4v2hbKZWVq3Ou6rIwzJ76cZfC22NeR6Gzulw1hnwfxwVomWLI+ezqf2csVnMc/kK
         9eRfxfPxDY6k6ig88DbFSp9mecIxVqlVhmDIa9Bq70jb2yW/Uqm/+5RkX8zh2ycHgm2c
         4SFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KeZQzHpEFEr9FV0/AKy8TSifxmzkQIz3WN598+K3z5s=;
        b=IVr/y4jAd6I8hvxp0WCj8p1Bf6ICDuHk/DuV7LfIHUKVubcOyGjMClGheKbEP93j9m
         fb7nl/LUWAQEoPkXqoXUzVXtDIqeBUxlT00nTgdQEYlgu5XllrGMfOFah914bvP8OaPs
         OcH0SFqsAUMjQIBpj2RQgYgi2OnAsZATe01Q8k6LLo65jrLBCX+rjafWVHlO9XlTJumr
         UvXip97K2dKGBFEvbNCl9l2MQmJ3o0itDT8h+X9i83acDOJ+cliMN5Zg75yqkDi/j511
         9WTkKkZ1qdz+iyUw995eQjZtRXk79lfRcdIET3ZDKw+lDqCrD0+R8AssLA9HyzS5vZB1
         IIdA==
X-Gm-Message-State: AOAM5334XqbuACuxu6Mm/i6JSw7VSkoV7PFoQK5PUb0k4tkHzF2CTo1y
        JMZaaeglHVKHg7r2WZ17OrKdCiqQT4pVY5nFA94WTg==
X-Google-Smtp-Source: ABdhPJwf6h9zxCC3+GMzcBE8zgyObabMspb9WcC2qQWnsSS9ftz3nV65WlAXUJb3X1Ru5AqKQyzmZZS+PwsruGuumLc=
X-Received: by 2002:a17:906:a0c9:: with SMTP id bh9mr11275816ejb.51.1630090028030;
 Fri, 27 Aug 2021 11:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
 <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com> <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com>
 <i917ig582epdnpkmjdtvtnap6u8c032c1r@4ax.com> <9d6336fff6f122a9a4510a111387a000c65f797b.camel@ndufresne.ca>
 <da18a240-22bd-54d2-6306-f39f10a05b22@collabora.com> <r4ehigheq602qijsnjd8govhl4f1dpnr35@4ax.com>
 <b5ae0ebe-de90-5ebb-5e69-ea66ae0e0639@collabora.com> <mdmhigh3ubgs6r89061v19iagjs0il9b89@4ax.com>
 <CAAEAJfA68tTeGgRHS2=hs5tQw2_3RhPgdXq6+k4GDX=0LMMBxQ@mail.gmail.com> <ec12d297-26ae-a214-59bc-619a925a79bc@collabora.com>
In-Reply-To: <ec12d297-26ae-a214-59bc-619a925a79bc@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 27 Aug 2021 15:46:56 -0300
Message-ID: <CAAEAJfBmnmgf5PB8YbW5hu73qz7t1O8+nzG3yFTWscAziX-mpQ@mail.gmail.com>
Subject: Re: [PATCH] media: hevc: fix pictures lists type
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 27 Aug 2021 at 12:26, Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 27/08/2021 =C3=A0 14:40, Ezequiel Garcia a =C3=A9crit :
> > On Fri, 27 Aug 2021 at 09:36, John Cox <jc@kynesim.co.uk> wrote:
> >>> Le 27/08/2021 =C3=A0 12:10, John Cox a =C3=A9crit :
> >>>>> Le 26/08/2021 =C3=A0 18:09, Nicolas Dufresne a =C3=A9crit :
> >>>>>> Le lundi 23 ao=C3=BBt 2021 =C3=A0 12:35 +0100, John Cox a =C3=A9cr=
it :
> >>>>>>> Hi
> >>>>>>>
> >>>>>>>> Le 23/08/2021 =C3=A0 11:50, John Cox a =C3=A9crit :
> >>>>>>>>>> The lists embedded Picture Order Count values which are s32 so=
 their type
> >>>>>>>>>> most be s32 and not u8.
> >>>>>>>>> I'm not convinced that you can't calculate all of those lists f=
rom the
> >>>>>>>>> info already contained in the DPB array so this is probably red=
undant
> >>>>>>>>> info though I grant that having the list pre-calced might make =
your life
> >>>>>>>>> easier, and the userland side will have calculated the lists to
> >>>>>>>>> calculate other required things so it isn't much extra work for=
 it.
> >>>>>>>> Yes the userland have already compute these lists and the number=
 of items
> >>>>>>>> in each of them.
> >>>>>>>> Build them in the kernel would means to also compute the values =
of NumPocStCurrBefore,
> >>>>>>>> NumPocStCurrAfter, NumPocLtCurr, NumPocStCurrAfter, NumPocStCurr=
Before and NumPocLtCurr
> >>>>>>>> and that requires information (NumNegativePics, NumPositivePics.=
..) not provided to the kernel.
> >>>>>>>> Since it have to be done in userland anyway, I'm reluctant to mo=
dify the API to redo in the kernel.
> >>>>>>> Well, fair enough, I'm not going to argue
> >>>>>>>
> >>>>>>>>> Even if you do need the lists wouldn't it be a better idea to h=
ave them
> >>>>>>>>> as indices into the DPB (you can't have a frame in any of those=
 lists
> >>>>>>>>> that isn't in the DPB) which already contains POCs then it will=
 still
> >>>>>>>>> fit into u8 and be smaller?
> >>>>>>>> Hantro HW works with indexes but I think it is more simple to se=
nd PoC rather than indexes.
> >>>>>>> I'd disagree but as I don't use the info I'm not concerned. Thoug=
h I
> >>>>>>> think I should point out that when Hantro converts the POCs to in=
dicies
> >>>>>>> it compares the now s32 POC in these lists with the u16 POC in th=
e DPB
> >>>>>>> so you might need to fix that too; by std (8.3.1) no POC diff can=
 be
> >>>>>>> outside s16 so you can mask & compare or use u16 POCs in the list=
s or
> >>>>>>> s32 in the DPB.
> >>>>>> Fun fact, my interpretation with the API when I drafted GStreamer =
support was
> >>>>>> that it was DPB indexes:
> >>>>>>
> >>>>>> https://gitlab.freedesktop.org/ndufresne/gst-plugins-bad/-/blob/he=
vc_wip/sys/v4l2codecs/gstv4l2codech265dec.c#L850
> >>>>>>
> >>>>>> It felt quite natural to be, since this is also how we pass refere=
nces for l0/l1
> >>>>>> (unused by hantro I guess).
> >>>>>>
> >>>>>> Looking at old rkvdec code as a refresher:
> >>>>>>
> >>>>>>      for (j =3D 0; j < run->num_slices; j++) {
> >>>>>>                    sl_params =3D &run->slices_params[j];
> >>>>>>                    dpb =3D sl_params->dpb;
> >>>>>>
> >>>>>>                    hw_ps =3D &priv_tbl->rps[j];
> >>>>>>                    memset(hw_ps, 0, sizeof(*hw_ps));
> >>>>>>
> >>>>>>                    for (i =3D 0; i <=3D sl_params->num_ref_idx_l0_=
active_minus1; i++) {
> >>>>>>                            WRITE_RPS(!!(dpb[sl_params->ref_idx_l0[=
i]].rps =3D=3D V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
> >>>>>>                                      REF_PIC_LONG_TERM_L0(i));
> >>>>>>                            WRITE_RPS(sl_params->ref_idx_l0[i], REF=
_PIC_IDX_L0(i));
> >>>>>>                    }
> >>>>>>
> >>>>>>                    for (i =3D 0; i <=3D sl_params->num_ref_idx_l1_=
active_minus1; i++) {
> >>>>>>                            WRITE_RPS(!!(dpb[sl_params->ref_idx_l1[=
i]].rps =3D=3D V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
> >>>>>>                                      REF_PIC_LONG_TERM_L1(i));
> >>>>>>                            WRITE_RPS(sl_params->ref_idx_l1[i], REF=
_PIC_IDX_L1(i));
> >>>>>>                    }
> >>>>>>
> >>>>>>
> >>>>>> This is code is clearly unsafe, but now I remember that dpb_entry =
has a flag
> >>>>>> "rps". So we know from the DPB in which of the list the reference =
lives, if any.
> >>>>>> In the case of RKVDEC the HW only cares to know if this is long te=
rm or not.
> >>>>>>
> >>>>>> So without looking at the spec, is that dpb represention enough to=
 reconstruct
> >>>>>> these array ? If we pass these array, shall we keep the rps flag ?=
 I think a
> >>>>>> little step back and cleanup will be needed. I doubt there is a si=
ngle answer,
> >>>>>> perhaps list what others do (VA, DXVA, NVDEC, Khronos, etc) and we=
 can
> >>>>>> collectively decide were we want V4L2 to sit ?
> >>>>> I have done some tests with Hantro driver and look at the spec, the=
 order of the PoC
> >>>>> in the reference lists matters. You can deducted the order for DPB =
rps flags.
> >>>>> I would suggest to remove rps flags to avoid information duplicatio=
n.
> >>>> I want the DPB rps member for long term reference marking.  I don't =
care
> >>>> about before / after, but LTR can't be deduced from PoC and if you a=
re
> >>>> going to keep the member you might as well keep before / after.
> >>> Ok so keep like it is.
> >>> In this case my patch is enough, right ?
> > The problem with the patch is that it breaks existing userspace.
> > Currently, there's no upstreamed userspace so this is not a huge
> > deal.
> >
> > However, it's definitely not a good practice. Even if these are
> > staging controls, I think a proper action item is to start discussing
> > what's missing on the HEVC interface as a whole, so it can be
> > moved to stable.
>
> I do agree I think it could the time to talk about moving the API to stab=
le.
> My plan is to get this patch merge before sending a RFC to move the API.
>

I'd rather not merge this patch, and instead merge all the changes in one g=
o,
so we avoid making further changes to the API.

The patch iself might look good, but I'd rather have the discussion on
the big picture,
and make sure we can all review the interface against the spec.

BTW, this should probably mean we have a plan to extend APIs if we need to.
Daniel Almeida (Cc) has the details for my proposal on that front, if you w=
ant
to push it forward.

Thanks,
Ezequiel
