Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EDC1EFE9B
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 19:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgFERN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 13:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgFERN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 13:13:27 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC9EC08C5C2
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 10:13:26 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id j32so9061730qte.10
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2020 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rHr7itMwj0PiPq9H+uXZajLfSOPoVtswSHCJ/uAQsm4=;
        b=sutPteYahxMet7Xu1/aGxvidF5fpONwql8J9iaHQeTBhuSlG6v0mzZ38XXiXamKUoM
         Q9bjjpMV6iFJF9aLhwAP1sQftb9ptsoD6ZFjHfMAc7Xhz6URLpNoU+aaKYk4Cx1QGn5W
         j5Y8rBcBDZvHhS1yGy1wXscJ5DawiiDp8glqEZph6kV145YTe2IzWnhm8sn1rbOiKhTJ
         ZiqMiNwkH4ivokp+lmARtcPH3HKz4yTg7J6FpDU0ZZ+vQ855hoT4gDcC4GGI4RlbGnAk
         piGBT5IG1Rt14Y1jV+wovSEk4uf1hnTfg34ZfceQu8ZDGMkECSQVk36/X2F5A8+5ccep
         SEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rHr7itMwj0PiPq9H+uXZajLfSOPoVtswSHCJ/uAQsm4=;
        b=dLuEtFybOA5BTsSRQwg6mBlSh2gmzZRHXBkMDD+ZK9QCWRFUSzklUZXG42XPL01TUa
         QPPfjjThdfehBvPHDYIxItC4X28nzrW6j+0+IOEy5R+nShJL0lyKfIXzYdPYjaV0Fvor
         wSTErUtZzxWGralA1q39zJBESVD5a+zUrQXuOmpF4PNEEhRAWhcfNCBex/TJ2bJVuh87
         9+l2Z1JqAEYR4LR9NOwnFQlx4vPXa6dYil1JHtq80htRWpPaXO6kRUoG+GL0jqekaiJ1
         1sp90FedQt4zf/uSlndq09lKQUu5vkpLhJ3lx3rpT/ouDPMFgNzEERZDFM1+83DNwD/3
         E6fw==
X-Gm-Message-State: AOAM5330Xf+vlUuw1axrZBieOjLizK6kL7eB+ATGw1wmRAtupd6W1B7V
        uFwCTW7ZbLCfcl3sPcy71Pir2w==
X-Google-Smtp-Source: ABdhPJzAo611o2M6HhEIIa1EkNwa7ONj9dewqWnD6aH1w0/QGIFAoQ8zEpfQ6p9WGA14HQA4Cqr5bQ==
X-Received: by 2002:ac8:4542:: with SMTP id z2mr10524331qtn.90.1591377205955;
        Fri, 05 Jun 2020 10:13:25 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id o6sm289276qtd.59.2020.06.05.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 10:13:25 -0700 (PDT)
Message-ID: <981458bfa639bbb9dbc7577256fde0a4c6259d53.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: uapi: h264: update reference lists
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Jernej Skrabec <jernej.skrabec@siol.net>,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     mchehab@kernel.org, wens@csie.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, jonas@kwiboo.se,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Date:   Fri, 05 Jun 2020 13:13:24 -0400
In-Reply-To: <21efb826506f23d348fa58ca8b29eaca8c9dae55.camel@ndufresne.ca>
References: <20200604185745.23568-1-jernej.skrabec@siol.net>
         <20200604185745.23568-2-jernej.skrabec@siol.net>
         <21efb826506f23d348fa58ca8b29eaca8c9dae55.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry, missed one thing.

Le vendredi 05 juin 2020 à 13:08 -0400, Nicolas Dufresne a écrit :
> Le jeudi 04 juin 2020 à 20:57 +0200, Jernej Skrabec a écrit :
> > When dealing with with interlaced frames, reference lists must tell if
> > each particular reference is meant for top or bottom field. This info
> > is currently not provided at all in the H264 related controls.
> > 
> > Make reference lists hold a structure which will also hold flags along
> > index into DPB array. Flags will tell if reference is meant for top or
> > bottom field.
> > 
> > Currently the only user of these lists is Cedrus which is just compile
> > fixed here. Actual usage of newly introduced flags will come in
> > following commit.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> This looks like the right approach to me and is extensible if anything
> else is needed for MVC and SVC special referencing (at least will be
> enough for what H.264 actually supports in this regard).
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> > ---
> >  .../media/v4l/ext-ctrls-codec.rst             | 40 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
> >  include/media/h264-ctrls.h                    | 12 +++++-
> >  3 files changed, 51 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index d0d506a444b1..6c36d298db20 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1843,10 +1843,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u32
> >        - ``slice_group_change_cycle``
> >        -
> > -    * - __u8
> > +    * - struct :c:type:`v4l2_h264_reference`
> >        - ``ref_pic_list0[32]``
> >        - Reference picture list after applying the per-slice modifications
> > -    * - __u8
> > +    * - struct :c:type:`v4l2_h264_reference`
> >        - ``ref_pic_list1[32]``
> >        - Reference picture list after applying the per-slice modifications
> >      * - __u32
> > @@ -1926,6 +1926,42 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - ``chroma_offset[32][2]``
> >        -
> >  
> > +``Picture Reference``
> > +
> > +.. c:type:: v4l2_h264_reference
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table:: struct v4l2_h264_reference
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u16
> > +      - ``flags``
> > +      - See :ref:`Picture Reference Flags <h264_reference_flags>`
> > +    * - __u8
> > +      - ``index``
> > +      -
> > +
> > +.. _h264_reference_flags:
> > +
> > +``Picture Reference Flags``
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - ``V4L2_H264_REFERENCE_FLAG_TOP_FIELD``
> > +      - 0x00000001
> > +      -
> > +    * - ``V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD``
> > +      - 0x00000002
> > +      -
> > +
> >  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
> >      Specifies the decode parameters (as extracted from the bitstream)
> >      for the associated H264 slice data. This includes the necessary
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > index 54ee2aa423e2..cce527bbdf86 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -166,8 +166,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
> >  
> >  static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> >  				   struct cedrus_run *run,
> > -				   const u8 *ref_list, u8 num_ref,
> > -				   enum cedrus_h264_sram_off sram)
> > +				   const struct v4l2_h264_reference *ref_list,
> > +				   u8 num_ref, enum cedrus_h264_sram_off sram)
> >  {
> >  	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
> >  	struct vb2_queue *cap_q;
> > @@ -188,7 +188,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> >  		int buf_idx;
> >  		u8 dpb_idx;
> >  
> > -		dpb_idx = ref_list[i];
> > +		dpb_idx = ref_list[i].index;
> >  		dpb = &decode->dpb[dpb_idx];
> >  
> >  		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > index 080fd1293c42..9b1cbc9bc38e 100644
> > --- a/include/media/h264-ctrls.h
> > +++ b/include/media/h264-ctrls.h
> > @@ -140,6 +140,14 @@ struct v4l2_h264_pred_weight_table {
> >  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
> >  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
> >  
> > +#define V4L2_H264_REFERENCE_FLAG_TOP_FIELD		0x01
> > +#define V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD		0x02
> > +
> > +struct v4l2_h264_reference {
> > +	__u8 flags;
> > +	__u8 index;
> > +};
> > +
> >  struct v4l2_ctrl_h264_slice_params {
> >  	/* Size in bytes, including header */
> >  	__u32 size;
> > @@ -182,8 +190,8 @@ struct v4l2_ctrl_h264_slice_params {
> >  	 * Entries on each list are indices into
> >  	 * v4l2_ctrl_h264_decode_params.dpb[].
> >  	 */

This comment needs to be updated or moved inside the structure.

> > -	__u8 ref_pic_list0[32];
> > -	__u8 ref_pic_list1[32];
> > +	struct v4l2_h264_reference ref_pic_list0[32];
> > +	struct v4l2_h264_reference ref_pic_list1[32];
> >  
> >  	__u32 flags;
> >  };

