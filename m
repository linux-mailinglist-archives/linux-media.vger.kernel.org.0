Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752523F9BB2
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 17:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245454AbhH0P1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 11:27:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56358 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245428AbhH0P1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 11:27:07 -0400
Received: from [IPv6:2a01:e0a:4cb:a870:de4d:a9ab:fdfa:6660] (unknown [IPv6:2a01:e0a:4cb:a870:de4d:a9ab:fdfa:6660])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 190421F44BB0;
        Fri, 27 Aug 2021 16:26:17 +0100 (BST)
Subject: Re: [PATCH] media: hevc: fix pictures lists type
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        John Cox <jc@kynesim.co.uk>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
 <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com>
 <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com>
 <i917ig582epdnpkmjdtvtnap6u8c032c1r@4ax.com>
 <9d6336fff6f122a9a4510a111387a000c65f797b.camel@ndufresne.ca>
 <da18a240-22bd-54d2-6306-f39f10a05b22@collabora.com>
 <r4ehigheq602qijsnjd8govhl4f1dpnr35@4ax.com>
 <b5ae0ebe-de90-5ebb-5e69-ea66ae0e0639@collabora.com>
 <mdmhigh3ubgs6r89061v19iagjs0il9b89@4ax.com>
 <CAAEAJfA68tTeGgRHS2=hs5tQw2_3RhPgdXq6+k4GDX=0LMMBxQ@mail.gmail.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <ec12d297-26ae-a214-59bc-619a925a79bc@collabora.com>
Date:   Fri, 27 Aug 2021 17:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfA68tTeGgRHS2=hs5tQw2_3RhPgdXq6+k4GDX=0LMMBxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 27/08/2021 à 14:40, Ezequiel Garcia a écrit :
> On Fri, 27 Aug 2021 at 09:36, John Cox <jc@kynesim.co.uk> wrote:
>>> Le 27/08/2021 à 12:10, John Cox a écrit :
>>>>> Le 26/08/2021 à 18:09, Nicolas Dufresne a écrit :
>>>>>> Le lundi 23 août 2021 à 12:35 +0100, John Cox a écrit :
>>>>>>> Hi
>>>>>>>
>>>>>>>> Le 23/08/2021 à 11:50, John Cox a écrit :
>>>>>>>>>> The lists embedded Picture Order Count values which are s32 so their type
>>>>>>>>>> most be s32 and not u8.
>>>>>>>>> I'm not convinced that you can't calculate all of those lists from the
>>>>>>>>> info already contained in the DPB array so this is probably redundant
>>>>>>>>> info though I grant that having the list pre-calced might make your life
>>>>>>>>> easier, and the userland side will have calculated the lists to
>>>>>>>>> calculate other required things so it isn't much extra work for it.
>>>>>>>> Yes the userland have already compute these lists and the number of items
>>>>>>>> in each of them.
>>>>>>>> Build them in the kernel would means to also compute the values of NumPocStCurrBefore,
>>>>>>>> NumPocStCurrAfter, NumPocLtCurr, NumPocStCurrAfter, NumPocStCurrBefore and NumPocLtCurr
>>>>>>>> and that requires information (NumNegativePics, NumPositivePics...) not provided to the kernel.
>>>>>>>> Since it have to be done in userland anyway, I'm reluctant to modify the API to redo in the kernel.
>>>>>>> Well, fair enough, I'm not going to argue
>>>>>>>
>>>>>>>>> Even if you do need the lists wouldn't it be a better idea to have them
>>>>>>>>> as indices into the DPB (you can't have a frame in any of those lists
>>>>>>>>> that isn't in the DPB) which already contains POCs then it will still
>>>>>>>>> fit into u8 and be smaller?
>>>>>>>> Hantro HW works with indexes but I think it is more simple to send PoC rather than indexes.
>>>>>>> I'd disagree but as I don't use the info I'm not concerned. Though I
>>>>>>> think I should point out that when Hantro converts the POCs to indicies
>>>>>>> it compares the now s32 POC in these lists with the u16 POC in the DPB
>>>>>>> so you might need to fix that too; by std (8.3.1) no POC diff can be
>>>>>>> outside s16 so you can mask & compare or use u16 POCs in the lists or
>>>>>>> s32 in the DPB.
>>>>>> Fun fact, my interpretation with the API when I drafted GStreamer support was
>>>>>> that it was DPB indexes:
>>>>>>
>>>>>> https://gitlab.freedesktop.org/ndufresne/gst-plugins-bad/-/blob/hevc_wip/sys/v4l2codecs/gstv4l2codech265dec.c#L850
>>>>>>
>>>>>> It felt quite natural to be, since this is also how we pass references for l0/l1
>>>>>> (unused by hantro I guess).
>>>>>>
>>>>>> Looking at old rkvdec code as a refresher:
>>>>>>
>>>>>>      for (j = 0; j < run->num_slices; j++) {
>>>>>>                    sl_params = &run->slices_params[j];
>>>>>>                    dpb = sl_params->dpb;
>>>>>>
>>>>>>                    hw_ps = &priv_tbl->rps[j];
>>>>>>                    memset(hw_ps, 0, sizeof(*hw_ps));
>>>>>>
>>>>>>                    for (i = 0; i <= sl_params->num_ref_idx_l0_active_minus1; i++) {
>>>>>>                            WRITE_RPS(!!(dpb[sl_params->ref_idx_l0[i]].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
>>>>>>                                      REF_PIC_LONG_TERM_L0(i));
>>>>>>                            WRITE_RPS(sl_params->ref_idx_l0[i], REF_PIC_IDX_L0(i));
>>>>>>                    }
>>>>>>
>>>>>>                    for (i = 0; i <= sl_params->num_ref_idx_l1_active_minus1; i++) {
>>>>>>                            WRITE_RPS(!!(dpb[sl_params->ref_idx_l1[i]].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
>>>>>>                                      REF_PIC_LONG_TERM_L1(i));
>>>>>>                            WRITE_RPS(sl_params->ref_idx_l1[i], REF_PIC_IDX_L1(i));
>>>>>>                    }
>>>>>>
>>>>>>
>>>>>> This is code is clearly unsafe, but now I remember that dpb_entry has a flag
>>>>>> "rps". So we know from the DPB in which of the list the reference lives, if any.
>>>>>> In the case of RKVDEC the HW only cares to know if this is long term or not.
>>>>>>
>>>>>> So without looking at the spec, is that dpb represention enough to reconstruct
>>>>>> these array ? If we pass these array, shall we keep the rps flag ? I think a
>>>>>> little step back and cleanup will be needed. I doubt there is a single answer,
>>>>>> perhaps list what others do (VA, DXVA, NVDEC, Khronos, etc) and we can
>>>>>> collectively decide were we want V4L2 to sit ?
>>>>> I have done some tests with Hantro driver and look at the spec, the order of the PoC
>>>>> in the reference lists matters. You can deducted the order for DPB rps flags.
>>>>> I would suggest to remove rps flags to avoid information duplication.
>>>> I want the DPB rps member for long term reference marking.  I don't care
>>>> about before / after, but LTR can't be deduced from PoC and if you are
>>>> going to keep the member you might as well keep before / after.
>>> Ok so keep like it is.
>>> In this case my patch is enough, right ?
> The problem with the patch is that it breaks existing userspace.
> Currently, there's no upstreamed userspace so this is not a huge
> deal.
>
> However, it's definitely not a good practice. Even if these are
> staging controls, I think a proper action item is to start discussing
> what's missing on the HEVC interface as a whole, so it can be
> moved to stable.

I do agree I think it could the time to talk about moving the API to stable.
My plan is to get this patch merge before sending a RFC to move the API.

Benjamin

>
> Otherwise, it almost feels like bikeshading.
>
> Thanks,
> Ezequiel
