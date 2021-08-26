Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DFF3F8B8D
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 18:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243026AbhHZQJy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 12:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhHZQJy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 12:09:54 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A091C061757
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 09:09:06 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id n24so4394065ion.10
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=obE600IesKQmDmwyD821NNK+F6//3iLV39WLIJL6Ks8=;
        b=K5JLzsqcj6/HourX2pXPIWYBju/il2qywAfLw92UpfYVrk2cT2aoWtLLl7cXumooxt
         KC4zn1QYAGG7OEC5OnLDCTry/ST1QAP1Fw/POBwjf9dAVUeNjh3qk+kerRUFmN4BeW6v
         xshViRVMIDUypF/pK/R1ERDZ1njR8lao+IiQ197Id3oao0Ta++NSHhpxQMUkYregCseJ
         JpRVzKXcPrNfddcYnZAV/GVxI9eOa/JB8LJRj4OBERweGI6SGIo3odF6W5A8xPja3G8I
         ccRaWcAThLLTm0nx9JM7ch5Qz8CTsLLOVgu+i+RJ7ThrhzqK+JEegIMd5YTcRMGW+92z
         X7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=obE600IesKQmDmwyD821NNK+F6//3iLV39WLIJL6Ks8=;
        b=Kqhnx390D9NKv+iDzRlzipZIPhAfpUIi24AEvsPvtsjmEYCrkXr9jgw5Ni+iA5sYG7
         nvJpfIS+NN1bMMxC/JhdNYTr0lUlS1qOr4ULLISjFVrMCLJfD8CWR6YdS/LOGHRCsT+4
         gvx6upTfX+NMfpVjek4YYahbwM13QwFo7ALutOuuiAUvwSufy9OFwVf0r2qMHIU/iZCw
         VOiS/YtyanbqAqdWWmaws8GRSFqayZmeH4CxaJTc1FxEMZWab0AkUGc3NvSTD1h3rXfV
         YKJU6SM8VjbmLwBfYsPzkDMccshTGZLz/TEcigF0U5g6zDG9CQEHPzFNCyu8gfHW+YtW
         m4mQ==
X-Gm-Message-State: AOAM5338pK6SdlA37P/cb4ow8v9ReiZFsH9fhwNnGI2w7uSaevczCny6
        OIeZbYSkPTSsYXWwxHKiEPtzgsVWhM+aQw==
X-Google-Smtp-Source: ABdhPJz+5ImupLkQ5rD06tciHcP63UZK1AdzLCI3qXvZ1K5BCgBaMRiJMBP8cSRJNeOzW6eZ2Ktt9A==
X-Received: by 2002:a02:a81a:: with SMTP id f26mr4059049jaj.79.1629994145935;
        Thu, 26 Aug 2021 09:09:05 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id b16sm1944829ila.1.2021.08.26.09.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 09:09:05 -0700 (PDT)
Message-ID: <9d6336fff6f122a9a4510a111387a000c65f797b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: hevc: fix pictures lists type
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Date:   Thu, 26 Aug 2021 12:09:03 -0400
In-Reply-To: <i917ig582epdnpkmjdtvtnap6u8c032c1r@4ax.com>
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
         <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com>
         <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com>
         <i917ig582epdnpkmjdtvtnap6u8c032c1r@4ax.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 23 août 2021 à 12:35 +0100, John Cox a écrit :
> Hi
> 
> > Le 23/08/2021 à 11:50, John Cox a écrit :
> > > > The lists embedded Picture Order Count values which are s32 so their type
> > > > most be s32 and not u8.
> > > I'm not convinced that you can't calculate all of those lists from the
> > > info already contained in the DPB array so this is probably redundant
> > > info though I grant that having the list pre-calced might make your life
> > > easier, and the userland side will have calculated the lists to
> > > calculate other required things so it isn't much extra work for it.
> > 
> > Yes the userland have already compute these lists and the number of items
> > in each of them.
> > Build them in the kernel would means to also compute the values of NumPocStCurrBefore,
> > NumPocStCurrAfter, NumPocLtCurr, NumPocStCurrAfter, NumPocStCurrBefore and NumPocLtCurr
> > and that requires information (NumNegativePics, NumPositivePics...) not provided to the kernel.
> > Since it have to be done in userland anyway, I'm reluctant to modify the API to redo in the kernel.
> 
> Well, fair enough, I'm not going to argue
> 
> > > Even if you do need the lists wouldn't it be a better idea to have them
> > > as indices into the DPB (you can't have a frame in any of those lists
> > > that isn't in the DPB) which already contains POCs then it will still
> > > fit into u8 and be smaller?
> > 
> > Hantro HW works with indexes but I think it is more simple to send PoC rather than indexes.
> 
> I'd disagree but as I don't use the info I'm not concerned. Though I
> think I should point out that when Hantro converts the POCs to indicies
> it compares the now s32 POC in these lists with the u16 POC in the DPB
> so you might need to fix that too; by std (8.3.1) no POC diff can be
> outside s16 so you can mask & compare or use u16 POCs in the lists or
> s32 in the DPB.

Fun fact, my interpretation with the API when I drafted GStreamer support was
that it was DPB indexes:

https://gitlab.freedesktop.org/ndufresne/gst-plugins-bad/-/blob/hevc_wip/sys/v4l2codecs/gstv4l2codech265dec.c#L850

It felt quite natural to be, since this is also how we pass references for l0/l1
(unused by hantro I guess).

Looking at old rkvdec code as a refresher:

  for (j = 0; j < run->num_slices; j++) {
                sl_params = &run->slices_params[j];
                dpb = sl_params->dpb;

                hw_ps = &priv_tbl->rps[j];
                memset(hw_ps, 0, sizeof(*hw_ps));

                for (i = 0; i <= sl_params->num_ref_idx_l0_active_minus1; i++) {
                        WRITE_RPS(!!(dpb[sl_params->ref_idx_l0[i]].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
                                  REF_PIC_LONG_TERM_L0(i));
                        WRITE_RPS(sl_params->ref_idx_l0[i], REF_PIC_IDX_L0(i));
                }

                for (i = 0; i <= sl_params->num_ref_idx_l1_active_minus1; i++) {
                        WRITE_RPS(!!(dpb[sl_params->ref_idx_l1[i]].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
                                  REF_PIC_LONG_TERM_L1(i));
                        WRITE_RPS(sl_params->ref_idx_l1[i], REF_PIC_IDX_L1(i));
                }


This is code is clearly unsafe, but now I remember that dpb_entry has a flag
"rps". So we know from the DPB in which of the list the reference lives, if any.
In the case of RKVDEC the HW only cares to know if this is long term or not.

So without looking at the spec, is that dpb represention enough to reconstruct
these array ? If we pass these array, shall we keep the rps flag ? I think a
little step back and cleanup will be needed. I doubt there is a single answer,
perhaps list what others do (VA, DXVA, NVDEC, Khronos, etc) and we can
collectively decide were we want V4L2 to sit ?

> 
> Regards
> 
> John Cox
> 
> > Benjamin
> > 
> > > 
> > > Full disclosure: Pi decode doesn't use this info at all so I'm only
> > > arguing from a theoretical point of view - I think it is only relevant
> > > if your h/w is parsing the reference list setups.
> > > 
> > > Regards
> > > 
> > > John Cox
> > > 
> > > > Reported-by: John Cox <jc@kynesim.co.uk>
> > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > ---
> > > > Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 +++---
> > > > include/media/hevc-ctrls.h                                | 6 +++---
> > > > 2 files changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > index 976d34445a24..db9859ddc8b2 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > @@ -3323,15 +3323,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > > >      * - __u8
> > > >        - ``num_poc_lt_curr``
> > > >        - The number of reference pictures in the long-term set.
> > > > -    * - __u8
> > > > +    * - __s32
> > > >        - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > > >        - PocStCurrBefore as described in section 8.3.2 "Decoding process for reference
> > > >          picture set.
> > > > -    * - __u8
> > > > +    * - __s32
> > > >        - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > > >        - PocStCurrAfter as described in section 8.3.2 "Decoding process for reference
> > > >          picture set.
> > > > -    * - __u8
> > > > +    * - __s32
> > > >        - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > > >        - PocLtCurr as described in section 8.3.2 "Decoding process for reference
> > > >          picture set.
> > > > diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> > > > index 781371bff2ad..04cd62e77f25 100644
> > > > --- a/include/media/hevc-ctrls.h
> > > > +++ b/include/media/hevc-ctrls.h
> > > > @@ -219,9 +219,9 @@ struct v4l2_ctrl_hevc_decode_params {
> > > > 	__u8	num_poc_st_curr_before;
> > > > 	__u8	num_poc_st_curr_after;
> > > > 	__u8	num_poc_lt_curr;
> > > > -	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> > > > -	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> > > > -	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> > > > +	__s32	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> > > > +	__s32	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> > > > +	__s32	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> > > > 	__u64	flags;
> > > > };
> > > > 


