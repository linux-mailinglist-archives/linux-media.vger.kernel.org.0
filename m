Return-Path: <linux-media+bounces-16156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB9E94F1F3
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 17:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE13A1F21B15
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 15:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F9F18455E;
	Mon, 12 Aug 2024 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kHnjI34t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E28184557
	for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723477419; cv=none; b=abGcdhU4uevZTyqHX0KlOBTdDl7E3MQRgIi9c4qNVaXQQGU1ydwQIFKpkBXQ2wfTNkAfhd7IQFx6fy/T8S9Nzy2k2MQBtTP4t525VQy/ptaqLBfHO1j9GKNlmM6UCXmsmnSZzJoV9ljm1B3GhzGJrgISLckIQJa2P4phVcG5p4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723477419; c=relaxed/simple;
	bh=3kOvnMVYW7av2a+huHCr2n5DSaksCSkSs0iMTDiHD2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTyQ+afmb8YF0irlMPFd5NSjNqsPljTN2whLRZ2MRieAwv714mMAnXygDsGJ3xHUI8fnV26FnNFKejwkkTeCe+qGd5dHbCB0wAOd7d3gtF3lBNC4cYmxc+7+GkJ+zdLsX8TMqqhf008GzR1l54Toyp7Qb3Ep/KvJJZsL55vUaHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kHnjI34t; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bb8e62570fso5439280a12.1
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723477415; x=1724082215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoPA3c1/J0JLM6OVJT2nSwrGLSZuJDtxvQK5QtxjibY=;
        b=kHnjI34tLoQiXC9jlj5GNF2xFUM0iFNqzWC/1KdSgkATCV2kvMCunWeCPedZo154T1
         b+Wo6fXYWIH5fWAieQ6PGB7/CJGMNqucTqKw7yvy9BIaXA8K+38/sMu6+WW8TwaApEyc
         Yqsr0H/5oMK+/PXwlEDkBScJKfpm5js70EdKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723477415; x=1724082215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoPA3c1/J0JLM6OVJT2nSwrGLSZuJDtxvQK5QtxjibY=;
        b=JXoStqSrxgp0iO4F5pQH5mlOaUq3ZQpzy2Y86jFsmSMhhPHhFjpEpFVuMLAoQ7DL1B
         gdtjKx0aaoQffBk6YOjlzGVVUVht4qoqVt477X/nRJ/nvUUdy86aiX9rl68txlM7tom9
         e27nnXXgBMn6G8lNSJekgw85gkhSgMRLvBdFv+SmT1Q8oV9kRX9sVGOCqMVVdIAuhDe7
         yC2zAQaXACbN6DedTUCSIXdUqZmQznO7RIDpxiwPJqPlu1iwAfni0aomt8hmG+pXK9FZ
         V3TEdgD0ztq6GPyVRtRIJeN13mU5pmJJtJpjxSXV0/XX6d5gsUjWBd8yoqu5BtQD5dMa
         V1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQoZPtmcORWAnvLZMfx8nB1pcPuwOrpCXgD2KwStMy0+SBznnhKT8dwR6MB33hIAFCsliG4bN/horRJ+HKVGVOMMB2iE1B1rxt9Os=
X-Gm-Message-State: AOJu0YzTIrUJr3upDzp9OQqt2h37u3zF3UByPIDp8UthRNExlK9q1/Y+
	FUXxhZklHR8gaLeMgSWb+crD6GI+dl+W0VZ7LtW1BsYy/EB4TIH3stH7eikEZQUMHey03wNeRCA
	=
X-Google-Smtp-Source: AGHT+IEVic/JhsAOXq5TkQiDJIF7wWt1U9046R7LvUTirAhQyHTM5EICvWxq36+PaeN/pGdetOt8Uw==
X-Received: by 2002:a17:907:1c0e:b0:a7a:b620:aa2f with SMTP id a640c23a62f3a-a80ed1d23ebmr53424966b.15.1723477415032;
        Mon, 12 Aug 2024 08:43:35 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb24321dsm236709966b.213.2024.08.12.08.43.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 08:43:33 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42809d6e719so34495035e9.3
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 08:43:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV07cwmvxw0KJpEDkbUTF3zlcPIhpieHCQYCWy5MjvxFJ9FOc3WoAfWmLHWq3jIMJn/9E2aqeQJ+n9V8c1dSr98GBb0QXEsG/lg15c=
X-Received: by 2002:adf:e3c6:0:b0:367:8f81:fa09 with SMTP id
 ffacd0b85a97d-3716cd1fe9emr497255f8f.47.1723477413125; Mon, 12 Aug 2024
 08:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729193219.1260463-1-frkoenig@chromium.org>
 <20240729193219.1260463-4-frkoenig@chromium.org> <ac5cf884-adf6-0c39-f375-469964fa1b0e@quicinc.com>
 <CAMfZQbzabrPzpWg-AwsdSbf+MzozDnTRfY_ENkr7mbx5GESUYQ@mail.gmail.com>
In-Reply-To: <CAMfZQbzabrPzpWg-AwsdSbf+MzozDnTRfY_ENkr7mbx5GESUYQ@mail.gmail.com>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Mon, 12 Aug 2024 08:43:20 -0700
X-Gmail-Original-Message-ID: <CAMfZQbyk9pW0NYgbpqAs8zEBDmJ8tYOJQy+O23d0W1Y902KAPw@mail.gmail.com>
Message-ID: <CAMfZQbyk9pW0NYgbpqAs8zEBDmJ8tYOJQy+O23d0W1Y902KAPw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: venus: Enable h.264 hierarchical coding
To: Fritz Koenig <frkoenig@chromium.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-media@vger.kernel.org, 
	mchehab@kernel.org, stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, 
	bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 9:03=E2=80=AFAM Fritz Koenig <frkoenig@chromium.org>=
 wrote:
>
> On Mon, Aug 5, 2024 at 3:23=E2=80=AFAM Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
> >
> >
> >
> > On 7/30/2024 12:49 AM, Fritz Koenig wrote:
> > > The series of V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls
> > > provides the functionality for temporal layering. These controls allo=
w
> > > for different framerates in a single stream.
> > >
> > > HFI supports hierarchical P encoding and the ability to specify the
> > > bitrate for the different layers.
> > >
> > > Connect the controls that V4L2 provides and HFI supports.
> > >
> > > Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> > > ---
> > > v2:
> > > - update commit message
> > >
> > >  drivers/media/platform/qcom/venus/core.h      |  4 +
> > >  drivers/media/platform/qcom/venus/venc.c      | 24 ++++++
> > >  .../media/platform/qcom/venus/venc_ctrls.c    | 84 +++++++++++++++++=
++
> > >  3 files changed, 112 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media=
/platform/qcom/venus/core.h
> > > index 55202b89e1b9..fc9552311a71 100644
> > > --- a/drivers/media/platform/qcom/venus/core.h
> > > +++ b/drivers/media/platform/qcom/venus/core.h
> > > @@ -274,6 +274,10 @@ struct venc_controls {
> > >       s32 h264_loop_filter_beta;
> > >       u32 h264_8x8_transform;
> > >
> > > +     u32 h264_hier_enabled;
> > > +     u32 h264_hier_p_layers;
> > > +     u32 h264_hier_p_bitrate[6];
> > > +
> > >       u32 hevc_i_qp;
> > >       u32 hevc_p_qp;
> > >       u32 hevc_b_qp;
> > > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media=
/platform/qcom/venus/venc.c
> > > index ae24de125c56..301b0015b356 100644
> > > --- a/drivers/media/platform/qcom/venus/venc.c
> > > +++ b/drivers/media/platform/qcom/venus/venc.c
> > > @@ -875,6 +875,30 @@ static int venc_set_properties(struct venus_inst=
 *inst)
> > >               ret =3D hfi_session_set_property(inst, ptype, &h264_tra=
nsform);
> > >               if (ret)
> > >                       return ret;
> > > +
> > > +             if (ctr->h264_hier_enabled) {
> > > +                     unsigned int i;
> > > +
> > > +                     ptype =3D HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NU=
M_ENH_LAYER;
> > > +                     ret =3D hfi_session_set_property(inst, ptype, &=
ctr->h264_hier_p_layers);
> > > +                     if (ret)
> > > +                             return ret;
> > > +
> > > +                     ptype =3D HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_L=
AYER;
> > > +                     ret =3D hfi_session_set_property(inst, ptype, &=
ctr->h264_hier_p_layers);
> > > +                     if (ret)
> > > +                             return ret;
> > > +
> > > +                     for (i =3D 0; i < ctr->h264_hier_p_layers; ++i)=
 {
> > > +                             ptype =3D HFI_PROPERTY_CONFIG_VENC_TARG=
ET_BITRATE;
> > > +                             brate.bitrate =3D ctr->h264_hier_p_bitr=
ate[i];
> > > +                             brate.layer_id =3D i;
> > > +
> > > +                             ret =3D hfi_session_set_property(inst, =
ptype, &brate);
> > > +                             if (ret)
> > > +                                     return ret;
> > > +                     }
> > > +             }
> > >       }
> > >
> > >       if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264 ||
> > > diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers=
/media/platform/qcom/venus/venc_ctrls.c
> > > index 6304cc97d37f..4cad8058339a 100644
> > > --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> > > +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> > > @@ -345,6 +345,52 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl=
)
> > >
> > >               ctr->h264_8x8_transform =3D ctrl->val;
> > >               break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
> > > +             if (ctrl->val !=3D V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CO=
DING_P)
> > > +                     return -EINVAL;
> > > +             break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> > > +             ctr->h264_hier_enabled =3D ctrl->val;
> > > +             break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
> > > +             ctr->h264_hier_p_layers =3D ctrl->val;
> > > +             break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
> > > +             ctr->h264_hier_p_bitrate[0] =3D ctrl->val;
> > > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_b=
itrate[0], 0);
> > > +             if (ret)
> > > +                     return ret;
> > > +             break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
> > > +             ctr->h264_hier_p_bitrate[1] =3D ctrl->val;
> > > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_b=
itrate[1], 1);
> > > +             if (ret)
> > > +                     return ret;
> > > +             break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
> > > +             ctr->h264_hier_p_bitrate[2] =3D ctrl->val;
> > > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_b=
itrate[2], 2);
> > > +             if (ret)
> > > +                     return ret;
> > > +             break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
> > > +             ctr->h264_hier_p_bitrate[3] =3D ctrl->val;
> > > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_b=
itrate[3], 3);
> > > +             if (ret)
> > > +                     return ret;
> > > +             break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
> > > +             ctr->h264_hier_p_bitrate[4] =3D ctrl->val;
> > > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_b=
itrate[4], 4);
> > > +             if (ret)
> > > +                     return ret;
> > > +             break;
> > > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
> > > +             ctr->h264_hier_p_bitrate[5] =3D ctrl->val;
> > > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_b=
itrate[5], 5);
> > > +             if (ret)
> > > +                     return ret;
> > > +             break;
> > >       default:
> > >               return -EINVAL;
> > >       }
> > > @@ -627,6 +673,44 @@ int venc_ctrl_init(struct venus_inst *inst)
> > >                         V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
> > >                         ((4096 * 2304) >> 8), 1, 0);
> > >
> > > +     if (IS_V4(inst->core) || IS_V6(inst->core)) {
> > Hi Fritz,
> > is this change tested on any V6 device?
> >
> No, it has only been tested on V4 (SC7180)
>
This series has now also been tested on SC7280 as well
> -Fritz
> > Thanks,
> > Dikshita
> > > +             v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_=
ops,
> > > +                                    V4L2_CID_MPEG_VIDEO_H264_HIERARC=
HICAL_CODING_TYPE,
> > > +                                    V4L2_MPEG_VIDEO_H264_HIERARCHICA=
L_CODING_P,
> > > +                                    1, V4L2_MPEG_VIDEO_H264_HIERARCH=
ICAL_CODING_P);
> > > +
> > > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > > +                               V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL=
_CODING, 0, 1, 1, 0);
> > > +
> > > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > > +                               V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL=
_CODING_LAYER, 0,
> > > +                               6, 1, 0);
> > > +
> > > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_=
L0_BR, BITRATE_MIN, BITRATE_MAX,
> > > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > > +
> > > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_=
L1_BR, BITRATE_MIN, BITRATE_MAX,
> > > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > > +
> > > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_=
L2_BR, BITRATE_MIN, BITRATE_MAX,
> > > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > > +
> > > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_=
L3_BR, BITRATE_MIN, BITRATE_MAX,
> > > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > > +
> > > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_=
L4_BR, BITRATE_MIN, BITRATE_MAX,
> > > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > > +
> > > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_=
L5_BR, BITRATE_MIN, BITRATE_MAX,
> > > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > > +     }
> > > +
> > >       ret =3D inst->ctrl_handler.error;
> > >       if (ret)
> > >               goto err;

