Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0948956B8CA
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 13:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238001AbiGHLqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 07:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237969AbiGHLqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 07:46:00 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420C37E000
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 04:45:59 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id k14so26802179qtm.3
        for <linux-media@vger.kernel.org>; Fri, 08 Jul 2022 04:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JbuTE/sYGfB/u9RuQ+/SyWj+9yxevQ2jtsS2cgSNlhw=;
        b=URm/NgS0To0qsY9/LZVdswPKZ7FoFpvRTBf/fd/LvRSegCIt2qB0kj7EGUR4wbFxeO
         td4YwWff9zhJN12hH59b097Ot+gaLP8lb7+TrPp9YvC94buWoTlyvjpxM4xFSZGgoHPa
         NK9OWj2Sfxg2SjygXcstyqA4jYbaXxkUaQKkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbuTE/sYGfB/u9RuQ+/SyWj+9yxevQ2jtsS2cgSNlhw=;
        b=im8FeynAngqKUzj9cqYO/VhrGHS4tt++z00GRtKc7nuHi11XHP4ydwTedGu+ikpG2v
         XM6eUYKgLVcUXBDL1+aUTBYWAKO2lp0bbXuRSSXh0tEAfjnx6kQuERoqkveYvcTxX6CI
         8rMmS6IrQJ5laSqMWIpj2Lw9jGuRhFAe/Bc0zp3j5EP/erAIl48o6P3774fAqdZxC8Sc
         kSTWvQ1a0U6LYnHMTA6LdZ+rUV2stC2gMkeJOoU9ESL7gsiG0+ny03v4xC2Sp6TWj+gg
         7D6buGLBsDfYyW0J+eDx4WmpiCNwlLe4pRr/tFsCKIZn+kRGewe+jZlD307fQuUlFk7K
         RPxA==
X-Gm-Message-State: AJIora9I875sld97m+mtgTFCD+XvePb7iY+aO/E20/avL/i+vqHhAIeD
        Oheh95dbpiTnO8OyuPfbuXMlqayHangsdA==
X-Google-Smtp-Source: AGRyM1uNIVumi0KDY7MrDMdRhDfnjzCrjKwses8fCsLIeQE2zowd2niAR+68fe5myK51tY6yAt4Zhw==
X-Received: by 2002:a05:622a:4:b0:31d:2a64:3d1c with SMTP id x4-20020a05622a000400b0031d2a643d1cmr2366710qtw.43.1657280758032;
        Fri, 08 Jul 2022 04:45:58 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id o4-20020ac87c44000000b003164efd0a5fsm17470142qtv.41.2022.07.08.04.45.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 04:45:55 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id f73so6555307yba.10
        for <linux-media@vger.kernel.org>; Fri, 08 Jul 2022 04:45:55 -0700 (PDT)
X-Received: by 2002:a05:6902:154f:b0:66e:df8f:4553 with SMTP id
 r15-20020a056902154f00b0066edf8f4553mr367670ybu.222.1657280755013; Fri, 08
 Jul 2022 04:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
 <20220706182657.210650-7-ezequiel@vanguardiasur.com.ar> <CAAFQd5BSDnZ6MyXfcRWNM9f9WF82sjPX3F1ZjYjcOuz3b1fPkw@mail.gmail.com>
 <YsgTM1zYMDHa2HJd@eze-laptop>
In-Reply-To: <YsgTM1zYMDHa2HJd@eze-laptop>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 8 Jul 2022 20:45:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B4KMo5=O2zDit3e3BFottnzuDpC9kgvHHAr+y4yhannw@mail.gmail.com>
Message-ID: <CAAFQd5B4KMo5=O2zDit3e3BFottnzuDpC9kgvHHAr+y4yhannw@mail.gmail.com>
Subject: Re: [PATCH 6/8] rkvdec: Use vb2_find_buffer
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 8, 2022 at 8:21 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Tomasz,
>
> On Fri, Jul 08, 2022 at 01:40:53PM +0900, Tomasz Figa wrote:
> > Hi Ezequiel,
> >
> > On Thu, Jul 7, 2022 at 3:27 AM Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > > Use the newly introduced vb2_find_buffer API to get a vb2_buffer
> > > given a buffer timestamp.
> > >
> > > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > > ---
> > >  drivers/staging/media/rkvdec/rkvdec-h264.c | 41 ++++++++--------------
> > >  drivers/staging/media/rkvdec/rkvdec-vp9.c  | 10 +++---
> > >  2 files changed, 19 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > > index 2992fb87cf72..4af5a831bde0 100644
> > > --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> > > +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> > > @@ -109,7 +109,7 @@ struct rkvdec_h264_run {
> > >         const struct v4l2_ctrl_h264_sps *sps;
> > >         const struct v4l2_ctrl_h264_pps *pps;
> > >         const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
> > > -       int ref_buf_idx[V4L2_H264_NUM_DPB_ENTRIES];
> > > +       struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
> >
> > How do we guarantee that those pointers remain valid through the
> > lifetime of this structure?
> >
>
> The rkvdec_h264_run is populated in .device_run, and used to program
> the hardware for each decode job.
>
> So these videobuf2 buffer won't outlive a given decode job. The vb2
> queue can't be released (so buffers can't be released) while
> a job is runnning (i.e. the driver is in a "streaming" state).
>
> We should be good, right?

Makes sense, thanks!

I think the only other comment was about the new helper being
initially inline and then turned back into a regular function, so if
we don't get any other comments in a few more days, feel free to
ignore that one.

Best regards,
Tomasz

>
> Thanks for the review,
> Ezequiel
>
> > Best regards,
> > Tomasz
> >
> > >  };
> > >
> > >  struct rkvdec_h264_ctx {
> > > @@ -742,17 +742,16 @@ static void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
> > >                 struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > >                 const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
> > >                 struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> > > -               int buf_idx = -1;
> > > +               struct vb2_buffer *buf = NULL;
> > >
> > >                 if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
> > > -                       buf_idx = vb2_find_timestamp(cap_q,
> > > -                                                    dpb[i].reference_ts, 0);
> > > -                       if (buf_idx < 0)
> > > +                       buf = vb2_find_buffer(cap_q, dpb[i].reference_ts);
> > > +                       if (!buf)
> > >                                 pr_debug("No buffer for reference_ts %llu",
> > >                                          dpb[i].reference_ts);
> > >                 }
> > >
> > > -               run->ref_buf_idx[i] = buf_idx;
> > > +               run->ref_buf[i] = buf;
> > >         }
> > >  }
> > >
> > > @@ -805,7 +804,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> > >                         if (WARN_ON(ref->index >= ARRAY_SIZE(dec_params->dpb)))
> > >                                 continue;
> > >
> > > -                       dpb_valid = run->ref_buf_idx[ref->index] >= 0;
> > > +                       dpb_valid = run->ref_buf[ref->index] != NULL;
> > >                         bottom = ref->fields == V4L2_H264_BOTTOM_FIELD_REF;
> > >
> > >                         set_ps_field(hw_rps, DPB_INFO(i, j),
> > > @@ -881,24 +880,6 @@ static const u32 poc_reg_tbl_bottom_field[16] = {
> > >         RKVDEC_REG_H264_POC_REFER2(1)
> > >  };
> > >
> > > -static struct vb2_buffer *
> > > -get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_h264_run *run,
> > > -           unsigned int dpb_idx)
> > > -{
> > > -       struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > > -       struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> > > -       int buf_idx = run->ref_buf_idx[dpb_idx];
> > > -
> > > -       /*
> > > -        * If a DPB entry is unused or invalid, address of current destination
> > > -        * buffer is returned.
> > > -        */
> > > -       if (buf_idx < 0)
> > > -               return &run->base.bufs.dst->vb2_buf;
> > > -
> > > -       return vb2_get_buffer(cap_q, buf_idx);
> > > -}
> > > -
> > >  static void config_registers(struct rkvdec_ctx *ctx,
> > >                              struct rkvdec_h264_run *run)
> > >  {
> > > @@ -971,8 +952,14 @@ static void config_registers(struct rkvdec_ctx *ctx,
> > >
> > >         /* config ref pic address & poc */
> > >         for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> > > -               struct vb2_buffer *vb_buf = get_ref_buf(ctx, run, i);
> > > -
> > > +               struct vb2_buffer *vb_buf = run->ref_buf[i];
> > > +
> > > +               /*
> > > +                * If a DPB entry is unused or invalid, address of current destination
> > > +                * buffer is returned.
> > > +                */
> > > +               if (!vb_buf)
> > > +                       vb_buf = &dst_buf->vb2_buf;
> > >                 refer_addr = vb2_dma_contig_plane_dma_addr(vb_buf, 0);
> > >
> > >                 if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> > > diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/staging/media/rkvdec/rkvdec-vp9.c
> > > index c2f42e76be10..d8c1c0db15c7 100644
> > > --- a/drivers/staging/media/rkvdec/rkvdec-vp9.c
> > > +++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
> > > @@ -383,17 +383,17 @@ get_ref_buf(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
> > >  {
> > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > >         struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> > > -       int buf_idx;
> > > +       struct vb2_buffer *buf;
> > >
> > >         /*
> > >          * If a ref is unused or invalid, address of current destination
> > >          * buffer is returned.
> > >          */
> > > -       buf_idx = vb2_find_timestamp(cap_q, timestamp, 0);
> > > -       if (buf_idx < 0)
> > > -               return vb2_to_rkvdec_decoded_buf(&dst->vb2_buf);
> > > +       buf = vb2_find_buffer(cap_q, timestamp);
> > > +       if (!buf)
> > > +               buf = &dst->vb2_buf;
> > >
> > > -       return vb2_to_rkvdec_decoded_buf(vb2_get_buffer(cap_q, buf_idx));
> > > +       return vb2_to_rkvdec_decoded_buf(buf);
> > >  }
> > >
> > >  static dma_addr_t get_mv_base_addr(struct rkvdec_decoded_buffer *buf)
> > > --
> > > 2.34.3
> > >
