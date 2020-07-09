Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE646219575
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 02:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgGIA7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 20:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgGIA7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 20:59:37 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BE6C061A0B
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 17:59:37 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id h18so248647qvl.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2020 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Lwy/TUmMO5Z/1GlX8cJ31apZHSAxwS7d7SzRutu1MJ0=;
        b=ET/M19TQjjEkmefFj2CMQwprybD/BLQRr97CSRxnIaNeqxpWggWTX79xfT98AbQksA
         Itn1U3XblGbyN5j01FOIE4COxzij3/ecEXBQ28/B3+CkSLP6156pYvXrcd9CPuCCrBf8
         n0mDyma6G/7AKmGDpNpG26QB2tYJpdGGDyjw5QnUSGIHsgk0KzHNRGSYODCLhHp9Botr
         CYYMkVsktfwHvdQP20FXID0+qLH/uu6vuahRLeJp0cwqJ9cUy/pOJwRPdRx1rm0mrVcs
         Q3bAcXL4kZRewbwjGVA2WDWRgVSfv/FkqzbwSk7U4je+rx/wZK5QqNKnHREnvbRWQbyC
         SCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Lwy/TUmMO5Z/1GlX8cJ31apZHSAxwS7d7SzRutu1MJ0=;
        b=LkwD82Z9cHKA44meQEPYxr1Wv7EH6CQqEKJlGvKssbZiGxW/sIbgPvMkjPypZGr9HM
         UK3G4kO0Pdu30NfS6wKCoUG9vgRJEkUybQb0iGMgoQIMpZ/PGs6WcuMoSFzorcG89sZc
         dbKY5maP9uSZ9CEcTkwQvCXLHsdPtcGec8a57RWTc60z4uA3Kr+Op9ZD64Bj2fItFkMn
         jpLBFTJH/fIoREEkryuWMy2LFP8N+Nz+v0Z9EV6AXaKh3lyCJlriwJrlLt1w2+123dM+
         8j3l3scaCQhEBP4EAxSpIGm9ybPPFgw8CzYD/xLKPDbSasejXVnfUqLtNWEAACW8yUEb
         GW8g==
X-Gm-Message-State: AOAM531oZhmRraQtOhubMvLLogjGIMuVzjD6Ex9+Y35OE9YgtpNSS7fz
        W+KMTVpezxCLqd3AdJsDb7h82Q==
X-Google-Smtp-Source: ABdhPJy0dhosaYd4+tncZ23pF3TfazXsuH+2tE7yu4vVoTb7EieibAGJOCdi09ESkIvxyCpS/aQFVA==
X-Received: by 2002:ad4:57c7:: with SMTP id y7mr61409102qvx.124.1594256376656;
        Wed, 08 Jul 2020 17:59:36 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id g17sm1593649qto.73.2020.07.08.17.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 17:59:35 -0700 (PDT)
Message-ID: <f485930bb8d8a5506e9ffd6804d08945920fce61.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: uapi: h264: update reference lists
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 08 Jul 2020 20:59:34 -0400
In-Reply-To: <3602665.eG79kSnugm@jernej-laptop>
References: <20200604185745.23568-1-jernej.skrabec@siol.net>
         <20200604185745.23568-2-jernej.skrabec@siol.net>
         <CAAEAJfAx4=RGJBVPccVFNYxNUqom7tkQD=J9oMfqajGxn6k+Zg@mail.gmail.com>
         <3602665.eG79kSnugm@jernej-laptop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 08 juillet 2020 à 17:57 +0200, Jernej Škrabec a écrit :
> Hi!
> 
> Dne sreda, 08. julij 2020 ob 15:28:52 CEST je Ezequiel Garcia napisal(a):
> > Hello Jernej,
> > 
> > I'd like to post a new H264 uAPI cleanup series soon,
> > would you mind resending this, or otherwise do you
> > mind if I include this patch in the series?
> 
> I don't mind at all. Currently my focus was elsewhere...
> 
> > See below for a tiny comment.
> > 
> > On Thu, 4 Jun 2020 at 15:55, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> > > When dealing with with interlaced frames, reference lists must tell if
> > > each particular reference is meant for top or bottom field. This info
> > > is currently not provided at all in the H264 related controls.
> > > 
> > > Make reference lists hold a structure which will also hold flags along
> > > index into DPB array. Flags will tell if reference is meant for top or
> > > bottom field.
> > > 
> > > Currently the only user of these lists is Cedrus which is just compile
> > > fixed here. Actual usage of newly introduced flags will come in
> > > following commit.
> > > 
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > > 
> > >  .../media/v4l/ext-ctrls-codec.rst             | 40 ++++++++++++++++++-
> > >  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
> > >  include/media/h264-ctrls.h                    | 12 +++++-
> > >  3 files changed, 51 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst index
> > > d0d506a444b1..6c36d298db20 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > @@ -1843,10 +1843,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type
> > > -> 
> > >      * - __u32
> > >      
> > >        - ``slice_group_change_cycle``
> > >        -
> > > 
> > > -    * - __u8
> > > +    * - struct :c:type:`v4l2_h264_reference`
> > > 
> > >        - ``ref_pic_list0[32]``
> > >        - Reference picture list after applying the per-slice modifications
> > > 
> > > -    * - __u8
> > > +    * - struct :c:type:`v4l2_h264_reference`
> > > 
> > >        - ``ref_pic_list1[32]``
> > >        - Reference picture list after applying the per-slice modifications
> > >      
> > >      * - __u32
> > > 
> > > @@ -1926,6 +1926,42 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type
> > > -
> > > 
> > >        - ``chroma_offset[32][2]``
> > >        -
> > > 
> > > +``Picture Reference``
> > > +
> > > +.. c:type:: v4l2_h264_reference
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table:: struct v4l2_h264_reference
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 1 2
> > > +
> > > +    * - __u16
> > > +      - ``flags``
> > > +      - See :ref:`Picture Reference Flags <h264_reference_flags>`
> > > +    * - __u8
> > > +      - ``index``
> > > +      -
> > > +
> > > +.. _h264_reference_flags:
> > > +
> > > +``Picture Reference Flags``
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 1 2
> > > +
> > > +    * - ``V4L2_H264_REFERENCE_FLAG_TOP_FIELD``
> > > +      - 0x00000001
> > > +      -
> > > +    * - ``V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD``
> > > +      - 0x00000002
> > > +      -
> > > +
> > > 
> > >  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
> > >  
> > >      Specifies the decode parameters (as extracted from the bitstream)
> > >      for the associated H264 slice data. This includes the necessary
> > > 
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> > > 54ee2aa423e2..cce527bbdf86 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > @@ -166,8 +166,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx
> > > *ctx,> 
> > >  static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> > >  
> > >                                    struct cedrus_run *run,
> > > 
> > > -                                  const u8 *ref_list, u8 num_ref,
> > > -                                  enum cedrus_h264_sram_off sram)
> > > +                                  const struct v4l2_h264_reference
> > > *ref_list, +                                  u8 num_ref, enum
> > > cedrus_h264_sram_off sram)> 
> > >  {
> > >  
> > >         const struct v4l2_ctrl_h264_decode_params *decode =
> > >         run->h264.decode_params; struct vb2_queue *cap_q;
> > > 
> > > @@ -188,7 +188,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx
> > > *ctx,> 
> > >                 int buf_idx;
> > >                 u8 dpb_idx;
> > > 
> > > -               dpb_idx = ref_list[i];
> > > +               dpb_idx = ref_list[i].index;
> > > 
> > >                 dpb = &decode->dpb[dpb_idx];
> > >                 
> > >                 if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > > 
> > > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > > index 080fd1293c42..9b1cbc9bc38e 100644
> > > --- a/include/media/h264-ctrls.h
> > > +++ b/include/media/h264-ctrls.h
> > > @@ -140,6 +140,14 @@ struct v4l2_h264_pred_weight_table {
> > > 
> > >  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED    0x04
> > >  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH             0x08
> > > 
> > > +#define V4L2_H264_REFERENCE_FLAG_TOP_FIELD             0x01
> > > +#define V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD          0x02
> > > +
> > > +struct v4l2_h264_reference {
> > > +       __u8 flags;
> > > +       __u8 index;
> > > +};
> > > +
> > > 
> > >  struct v4l2_ctrl_h264_slice_params {
> > >  
> > >         /* Size in bytes, including header */
> > >         __u32 size;
> > > 
> > > @@ -182,8 +190,8 @@ struct v4l2_ctrl_h264_slice_params {
> > > 
> > >          * Entries on each list are indices into
> > >          * v4l2_ctrl_h264_decode_params.dpb[].
> > >          */
> > > 
> > > -       __u8 ref_pic_list0[32];
> > > -       __u8 ref_pic_list1[32];
> > > +       struct v4l2_h264_reference ref_pic_list0[32];
> > > +       struct v4l2_h264_reference ref_pic_list1[32];
> > 
> > Could we use a macro for "32" here? Something like:
> > 
> > #define V4L2_H264_REF_PIC_LIST_LEN (V4L2_H264_NUM_DPB_ENTRIES * 2).
> > 
> > Does it make sense to add a comment as well?
> > 
> > I was thinking something along these lines:
> > 
> > """
> > Pictures in the DPB can be a frame, a complementary field pair or a
> > single field.
> 
> To be honest, I don't know if user has a free choice to select same or 
> different destination (capture) buffer for another field. I never tested it and 
> I'm not sure how to test it with ffmpeg. HW deinterlacing cores on Allwinner 
> SoCs support only interleaved fields as a input, that's why I never though 
> about separate fields.

When setting the format, one will choose V4L2_FIELD_INTERLACED_TB/BT.
Most driver will support that, but if not, they can update field in the
structure. Interlaced being very common, I think it's fine to only
support that, but the drive must enforce this field value.

But I know the Xilinx ZynqMP will do ALTERNATE instead, which would be
each field get decoded in it's own buffer. That, to be honest, I
haven't though about. The tricky part is for H264, since it means 1
slice may populate two capture buffers and I don't know if we can
support this right now.

For now I'd say we should just ensure that whatever userspace ask, we
enforce V4L2_FIELD_INTERLACED_TB/BT appropriately. That is likely not
complete, just look at how interlacing is signal in the bitstream.

> 
> Best regards,
> Jernej
> 
> > Therefore, reference pictures lists need twice as much entries, so it
> > can reference
> > either field of a field pair.
> > """
> > 
> > While it doesn't replace proper H264 specification reading,
> > it would add some clarity.
> > 
> > Thanks,
> > Ezequiel
> 
> 
> 

