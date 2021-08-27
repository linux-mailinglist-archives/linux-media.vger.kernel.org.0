Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028133F9918
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 14:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245111AbhH0Mlc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 08:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245091AbhH0Mlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 08:41:31 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC44C0613CF
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 05:40:42 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z10so9670947edb.6
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2nPzWi/NZ8hWZLaCBAACfozkVkQ+SBGjdnmjr0f1fk0=;
        b=RwzREXGmXZLMaMprMGO8kB9mnWGLW8SQErl4tSQVsIK/KqoBVVxl1/Wq2h1t2Uo+9d
         QOrHKGNvA2U6wQxbmXnW4h71pi0WefyUBpIBfs/uQ+Qx0v6Vjsbg/nZ3x203R98otZ98
         0FCT2PP/x2T+1iLNqVS0xbaXj1nuOE82BSLT1mtM6VHfj8yxvIUxFGvd8TNVwDKqE32N
         DBA/08T68yVXIc8aC0ZfEAAj+2y9Jbu2rrwLvRyvRVdIYHkN5wiOL+X2IX1USapxVuCQ
         26wQi505C21Q/tVHAiZdrLbJh7csq6sr/jq89U6UvVGnrFJV+KXPvaccOIVx3qMAk3ST
         Op+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2nPzWi/NZ8hWZLaCBAACfozkVkQ+SBGjdnmjr0f1fk0=;
        b=gkcPXO7vP907brEtQ1B79kibE6OGTyxJ/Ir7t69h8HtTC/086SV3ZeGkuj0aUc8i3q
         aCQp0fJ8lRgIRYL9i+D5WfIfk8khoHyZXsR2Z8lHJ0AvYfW1SDLoPzog37zC6+K4k7Fv
         QG0cIur/CvjNBwIDHO5Dx+ZMvAE43Gemuyd3LB6EDv+tHLz68BxZH1L7ZApdljUaL/f2
         g2ZfzChI9AkX2KhYQeMd44Ecd+dwKBXpKOZya6wam3+Rm3GbV9QdkJrVungESLdveiS2
         Xyja4UmXRALCE9VVqJ7GZfvQybLY7RuxLZczJm1WvAU2e9OK03n+cwxxyCJvLY1gpz2m
         GXQg==
X-Gm-Message-State: AOAM531n0jxtJ0/WR+ypShGnGlwcbDwfRN7OtetTqenxSqvnXPe3BSQy
        hIgO3FW+uzfd7uB2m6EAIlVvswvYdsWz4igZtpRs5w==
X-Google-Smtp-Source: ABdhPJy6G5l8EbEo8HSfL/otUq0S7HfOLOVnL6opEuMcGSY2+ANC9ilYGkfZb35yEZdkaPtAXtv1jZ5IeYfEWWayyO4=
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr9584544edw.134.1630068041190;
 Fri, 27 Aug 2021 05:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
 <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com> <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com>
 <i917ig582epdnpkmjdtvtnap6u8c032c1r@4ax.com> <9d6336fff6f122a9a4510a111387a000c65f797b.camel@ndufresne.ca>
 <da18a240-22bd-54d2-6306-f39f10a05b22@collabora.com> <r4ehigheq602qijsnjd8govhl4f1dpnr35@4ax.com>
 <b5ae0ebe-de90-5ebb-5e69-ea66ae0e0639@collabora.com> <mdmhigh3ubgs6r89061v19iagjs0il9b89@4ax.com>
In-Reply-To: <mdmhigh3ubgs6r89061v19iagjs0il9b89@4ax.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 27 Aug 2021 09:40:29 -0300
Message-ID: <CAAEAJfA68tTeGgRHS2=hs5tQw2_3RhPgdXq6+k4GDX=0LMMBxQ@mail.gmail.com>
Subject: Re: [PATCH] media: hevc: fix pictures lists type
To:     John Cox <jc@kynesim.co.uk>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 27 Aug 2021 at 09:36, John Cox <jc@kynesim.co.uk> wrote:
>
> >Le 27/08/2021 =C3=A0 12:10, John Cox a =C3=A9crit :
> >>> Le 26/08/2021 =C3=A0 18:09, Nicolas Dufresne a =C3=A9crit :
> >>>> Le lundi 23 ao=C3=BBt 2021 =C3=A0 12:35 +0100, John Cox a =C3=A9crit=
 :
> >>>>> Hi
> >>>>>
> >>>>>> Le 23/08/2021 =C3=A0 11:50, John Cox a =C3=A9crit :
> >>>>>>>> The lists embedded Picture Order Count values which are s32 so t=
heir type
> >>>>>>>> most be s32 and not u8.
> >>>>>>> I'm not convinced that you can't calculate all of those lists fro=
m the
> >>>>>>> info already contained in the DPB array so this is probably redun=
dant
> >>>>>>> info though I grant that having the list pre-calced might make yo=
ur life
> >>>>>>> easier, and the userland side will have calculated the lists to
> >>>>>>> calculate other required things so it isn't much extra work for i=
t.
> >>>>>> Yes the userland have already compute these lists and the number o=
f items
> >>>>>> in each of them.
> >>>>>> Build them in the kernel would means to also compute the values of=
 NumPocStCurrBefore,
> >>>>>> NumPocStCurrAfter, NumPocLtCurr, NumPocStCurrAfter, NumPocStCurrBe=
fore and NumPocLtCurr
> >>>>>> and that requires information (NumNegativePics, NumPositivePics...=
) not provided to the kernel.
> >>>>>> Since it have to be done in userland anyway, I'm reluctant to modi=
fy the API to redo in the kernel.
> >>>>> Well, fair enough, I'm not going to argue
> >>>>>
> >>>>>>> Even if you do need the lists wouldn't it be a better idea to hav=
e them
> >>>>>>> as indices into the DPB (you can't have a frame in any of those l=
ists
> >>>>>>> that isn't in the DPB) which already contains POCs then it will s=
till
> >>>>>>> fit into u8 and be smaller?
> >>>>>> Hantro HW works with indexes but I think it is more simple to send=
 PoC rather than indexes.
> >>>>> I'd disagree but as I don't use the info I'm not concerned. Though =
I
> >>>>> think I should point out that when Hantro converts the POCs to indi=
cies
> >>>>> it compares the now s32 POC in these lists with the u16 POC in the =
DPB
> >>>>> so you might need to fix that too; by std (8.3.1) no POC diff can b=
e
> >>>>> outside s16 so you can mask & compare or use u16 POCs in the lists =
or
> >>>>> s32 in the DPB.
> >>>> Fun fact, my interpretation with the API when I drafted GStreamer su=
pport was
> >>>> that it was DPB indexes:
> >>>>
> >>>> https://gitlab.freedesktop.org/ndufresne/gst-plugins-bad/-/blob/hevc=
_wip/sys/v4l2codecs/gstv4l2codech265dec.c#L850
> >>>>
> >>>> It felt quite natural to be, since this is also how we pass referenc=
es for l0/l1
> >>>> (unused by hantro I guess).
> >>>>
> >>>> Looking at old rkvdec code as a refresher:
> >>>>
> >>>>     for (j =3D 0; j < run->num_slices; j++) {
> >>>>                   sl_params =3D &run->slices_params[j];
> >>>>                   dpb =3D sl_params->dpb;
> >>>>
> >>>>                   hw_ps =3D &priv_tbl->rps[j];
> >>>>                   memset(hw_ps, 0, sizeof(*hw_ps));
> >>>>
> >>>>                   for (i =3D 0; i <=3D sl_params->num_ref_idx_l0_act=
ive_minus1; i++) {
> >>>>                           WRITE_RPS(!!(dpb[sl_params->ref_idx_l0[i]]=
.rps =3D=3D V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
> >>>>                                     REF_PIC_LONG_TERM_L0(i));
> >>>>                           WRITE_RPS(sl_params->ref_idx_l0[i], REF_PI=
C_IDX_L0(i));
> >>>>                   }
> >>>>
> >>>>                   for (i =3D 0; i <=3D sl_params->num_ref_idx_l1_act=
ive_minus1; i++) {
> >>>>                           WRITE_RPS(!!(dpb[sl_params->ref_idx_l1[i]]=
.rps =3D=3D V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
> >>>>                                     REF_PIC_LONG_TERM_L1(i));
> >>>>                           WRITE_RPS(sl_params->ref_idx_l1[i], REF_PI=
C_IDX_L1(i));
> >>>>                   }
> >>>>
> >>>>
> >>>> This is code is clearly unsafe, but now I remember that dpb_entry ha=
s a flag
> >>>> "rps". So we know from the DPB in which of the list the reference li=
ves, if any.
> >>>> In the case of RKVDEC the HW only cares to know if this is long term=
 or not.
> >>>>
> >>>> So without looking at the spec, is that dpb represention enough to r=
econstruct
> >>>> these array ? If we pass these array, shall we keep the rps flag ? I=
 think a
> >>>> little step back and cleanup will be needed. I doubt there is a sing=
le answer,
> >>>> perhaps list what others do (VA, DXVA, NVDEC, Khronos, etc) and we c=
an
> >>>> collectively decide were we want V4L2 to sit ?
> >>> I have done some tests with Hantro driver and look at the spec, the o=
rder of the PoC
> >>> in the reference lists matters. You can deducted the order for DPB rp=
s flags.
> >>> I would suggest to remove rps flags to avoid information duplication.
> >> I want the DPB rps member for long term reference marking.  I don't ca=
re
> >> about before / after, but LTR can't be deduced from PoC and if you are
> >> going to keep the member you might as well keep before / after.
> >
> >Ok so keep like it is.
> >In this case my patch is enough, right ?
>

The problem with the patch is that it breaks existing userspace.
Currently, there's no upstreamed userspace so this is not a huge
deal.

However, it's definitely not a good practice. Even if these are
staging controls, I think a proper action item is to start discussing
what's missing on the HEVC interface as a whole, so it can be
moved to stable.

Otherwise, it almost feels like bikeshading.

Thanks,
Ezequiel
