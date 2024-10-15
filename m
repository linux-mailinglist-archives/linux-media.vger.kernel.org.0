Return-Path: <linux-media+bounces-19706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C699FBA7
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 00:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF8ADB2203A
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 22:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DF41D63DE;
	Tue, 15 Oct 2024 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BEaSpKpv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F570146A9B
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 22:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032501; cv=none; b=gv8v+hqOUhe2fT92KGWtEuSXEjcDrEpK5l1tANZFqnx/ePvf+N8HAcpZ2jx56nsw0o+Altu7N2YxgpUyzjN3Xp5qPciBovCtqdzZOyJjKNplYnnjDe/lTSKpwnflg4ZX9EvVTFDeIuWsrv6Cbf9jEe74IhoUoZ234QWpUhrB5Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032501; c=relaxed/simple;
	bh=7iWSSPGf8QiacangIGWXN/WcTOwVCk43rYBmIcX7PKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6lPcIoNSVcktQ8818hm2YDes2nmW7V4y45nRw4diXVFz2yz4ZUzjmqz66I3txfI3Q3KdXYl5fZht2SyIUKKCK7sFwnoHSnw0XvGl+JARDWk0BOHMrb2Gsn025w++DLZazxNCSNpHyBJjHuuFdAYpW6XH+yhsMvS7pkPN7mh88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BEaSpKpv; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so58571631fa.3
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 15:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729032497; x=1729637297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9deZMrdsoekpJ9dDYChmkSz47OQPl6TKz/3bjf39fVM=;
        b=BEaSpKpvMLNfi9oMrHIzfIi/L1I+QLgV3ik+PHk02v9VAAQjY9TpeoKfYnupvQbVUr
         IZzFimGLTV3RjfJ+CG83pEhjHLYpBD79TSVa4H+Jg2yGZD8rCagAIxce4FXeHoLaLA6q
         KlAyfaEHzRIdgd8vIXejXYHBPTyaElLhPnj8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729032497; x=1729637297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9deZMrdsoekpJ9dDYChmkSz47OQPl6TKz/3bjf39fVM=;
        b=qVFgSytT4gLdUk6NGdMiey1my4+eZQvu+eMiMvZd/tkb/y2K32WsnLr8IvAW3uRv31
         SFuyWr2ooIuV7DAtyAFWUSVV8YOb+E+579/CItRU421X4s2bSkPVnkGCqRC2QPrpt4fi
         Tkc09cQ/wZ1tSQbx1oINT1xMCtoYaZCXAaUXScMvSs7urIpPpmMEDcSIH34JUQPAQBXO
         4obedV52tv9fyuQmo6Q13eWcpDHdM0HKaxqOrEIgidXdxlGpjPStAWzIBCflkvDXmwBM
         tZB4EdyzJaAeqVbYbqM22PgyYE0Qcomq+W0kvffJyUPAdTDVCmfeMc7PIIXz8j5FnPTo
         JmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUxd4x84k/29Vc3tG2CQfOrhhDY9rm1Bc7szWMaeGtIFjMOX0JN04ZUN5ynh+hKoogS+bNEmnNRnM4cA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywou6s5Z4WoenjqVev5qayl8y71j9Pd17zyqNB8Nm/8dwAXpfJI
	TB66ff76h3E0YE+9zOKucKjFcLJZ8Fzqwj2eRGP366l9Cc28ZEL1Im2t83eFCy8d8CEFBQKS88s
	=
X-Google-Smtp-Source: AGHT+IFn1SHjA2bnsGiBIEOCxBGX7/EQTjwAOOIPoO6K+QO5GkEnQtKoAnj35+DZMC1ZrHrBiRHhKw==
X-Received: by 2002:a05:651c:2123:b0:2fb:3d86:d932 with SMTP id 38308e7fff4ca-2fb61b4c18fmr13737371fa.12.1729032496828;
        Tue, 15 Oct 2024 15:48:16 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d6269sm1122780a12.2.2024.10.15.15.48.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:48:15 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c93e9e701fso1288a12.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 15:48:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAuCr1Mtzhs9rVctvUp/lbojDmqsr8uBg/UtOXEseec7J+w8pbvwYzcBZjRSwgyGC0TYnOQh9jIlnPKQ==@vger.kernel.org
X-Received: by 2002:a05:6402:5109:b0:5c8:aefb:746d with SMTP id
 4fb4d7f45d1cf-5c99934a456mr77657a12.5.1729032494271; Tue, 15 Oct 2024
 15:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814-submit-v3-0-f7d05e3e8560@chromium.org>
 <20240814-submit-v3-2-f7d05e3e8560@chromium.org> <65026fea-c591-d072-e7e8-2abf1fd057ce@quicinc.com>
In-Reply-To: <65026fea-c591-d072-e7e8-2abf1fd057ce@quicinc.com>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Tue, 15 Oct 2024 15:48:01 -0700
X-Gmail-Original-Message-ID: <CAMfZQbyfB_tnoc+cvBOqhJ1SaOD=ued-tnOD-jz3=sMH4-y_qg@mail.gmail.com>
Message-ID: <CAMfZQbyfB_tnoc+cvBOqhJ1SaOD=ued-tnOD-jz3=sMH4-y_qg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: venus: Enable h.264 hierarchical coding
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Fritz Koenig <frkoenig@chromium.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 12:05=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 8/15/2024 3:44 AM, Fritz Koenig wrote:
> > HFI supports hierarchical P encoding and the ability to specify the
> > bitrate for the different layers.
> >
> > Connect the controls that V4L2 provides and HFI supports.
> >
> > Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.h       |  4 ++
> >  drivers/media/platform/qcom/venus/venc.c       | 85 +++++++++++++++---=
------
> >  drivers/media/platform/qcom/venus/venc_ctrls.c | 92 ++++++++++++++++++=
++++++++
> >  3 files changed, 151 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/p=
latform/qcom/venus/core.h
> > index 55202b89e1b9..fd46a7778d8c 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -26,6 +26,7 @@
> >  #define VIDC_CLKS_NUM_MAX            4
> >  #define VIDC_VCODEC_CLKS_NUM_MAX     2
> >  #define VIDC_RESETS_NUM_MAX          2
> > +#define VIDC_MAX_HIER_CODING_LAYER 6
> >
> >  extern int venus_fw_debug;
> >
> > @@ -255,6 +256,7 @@ struct venc_controls {
> >       u32 rc_enable;
> >       u32 const_quality;
> >       u32 frame_skip_mode;
> > +     u32 layer_bitrate;
> >
> >       u32 h264_i_period;
> >       u32 h264_entropy_mode;
> > @@ -273,6 +275,8 @@ struct venc_controls {
> >       s32 h264_loop_filter_alpha;
> >       s32 h264_loop_filter_beta;
> >       u32 h264_8x8_transform;
> > +     u32 h264_hier_layers;
> > +     u32 h264_hier_layer_bitrate[VIDC_MAX_HIER_CODING_LAYER];
> >
> >       u32 hevc_i_qp;
> >       u32 hevc_p_qp;
> > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/p=
latform/qcom/venus/venc.c
> > index 3ec2fb8d9fab..af2c92069967 100644
> > --- a/drivers/media/platform/qcom/venus/venc.c
> > +++ b/drivers/media/platform/qcom/venus/venc.c
> > @@ -734,6 +734,29 @@ static int venc_set_properties(struct venus_inst *=
inst)
> >               if (ret)
> >                       return ret;
> >
> > +             if (ctr->layer_bitrate) {
> > +                     unsigned int i;
> > +
> > +                     ptype =3D HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_=
ENH_LAYER;
> > +                     ret =3D hfi_session_set_property(inst, ptype, &ct=
r->h264_hier_layers);
> > +                     if (ret)
> > +                             return ret;
> > +
> > +                     ptype =3D HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAY=
ER;
> > +                     ret =3D hfi_session_set_property(inst, ptype, &ct=
r->layer_bitrate);
> > +                     if (ret)
> > +                             return ret;
> > +
> > +                     for (i =3D 0; i < ctr->h264_hier_layers; ++i) {
> > +                             ptype =3D HFI_PROPERTY_CONFIG_VENC_TARGET=
_BITRATE;
> > +                             brate.bitrate =3D ctr->h264_hier_layer_bi=
trate[i];
> > +                             brate.layer_id =3D i;
> > +
> > +                             ret =3D hfi_session_set_property(inst, pt=
ype, &brate);
> > +                             if (ret)
> > +                                     return ret;
> > +                     }
> > +             }
> >       }
> >
> >       if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264 ||
> > @@ -823,45 +846,47 @@ static int venc_set_properties(struct venus_inst =
*inst)
> >                       return ret;
> >       }
> >
> > -     if (!ctr->bitrate)
> > -             bitrate =3D 64000;
> > -     else
> > -             bitrate =3D ctr->bitrate;
> > +     if (!ctr->layer_bitrate) {
> > +             if (!ctr->bitrate)
> > +                     bitrate =3D 64000;
> > +             else
> > +                     bitrate =3D ctr->bitrate;
> >
> > -     ptype =3D HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> > -     brate.bitrate =3D bitrate;
> > -     brate.layer_id =3D 0;
> > +             ptype =3D HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> > +             brate.bitrate =3D bitrate;
> > +             brate.layer_id =3D 0;
> >
> > -     ret =3D hfi_session_set_property(inst, ptype, &brate);
> > -     if (ret)
> > -             return ret;
> > +             ret =3D hfi_session_set_property(inst, ptype, &brate);
> > +             if (ret)
> > +                     return ret;
> >
> > -     if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264 ||
> > -         inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_HEVC) {
> > -             ptype =3D HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HE=
ADER;
> > -             if (ctr->header_mode =3D=3D V4L2_MPEG_VIDEO_HEADER_MODE_S=
EPARATE)
> > -                     en.enable =3D 0;
> > +             if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264 ||
> > +                             inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT=
_HEVC) {
> > +                     ptype =3D HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQ=
UENCE_HEADER;
> > +                     if (ctr->header_mode =3D=3D V4L2_MPEG_VIDEO_HEADE=
R_MODE_SEPARATE)
> why move this ctrl setting inside ctr->layer_bitrate check?
> I don't think this depends on layer bitrate.

This was sloppy on my part. I did not look close enough to see that
this wasn't bitrate related.

Will update and send a new patchset.
>
> Thanks,
> Dikshita
> > +                             en.enable =3D 0;
> > +                     else
> > +                             en.enable =3D 1;
> > +
> > +                     ret =3D hfi_session_set_property(inst, ptype, &en=
);
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +
> > +             if (!ctr->bitrate_peak)
> > +                     bitrate *=3D 2;
> >               else
> > -                     en.enable =3D 1;
> > +                     bitrate =3D ctr->bitrate_peak;
> >
> > -             ret =3D hfi_session_set_property(inst, ptype, &en);
> > +             ptype =3D HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
> > +             brate.bitrate =3D bitrate;
> > +             brate.layer_id =3D 0;
> > +
> > +             ret =3D hfi_session_set_property(inst, ptype, &brate);
> >               if (ret)
> >                       return ret;
> >       }
> >
> > -     if (!ctr->bitrate_peak)
> > -             bitrate *=3D 2;
> > -     else
> > -             bitrate =3D ctr->bitrate_peak;
> > -
> > -     ptype =3D HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
> > -     brate.bitrate =3D bitrate;
> > -     brate.layer_id =3D 0;
> > -
> > -     ret =3D hfi_session_set_property(inst, ptype, &brate);
> > -     if (ret)
> > -             return ret;
> > -
> >       ptype =3D HFI_PROPERTY_PARAM_VENC_SESSION_QP;
> >       if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_HEVC) {
> >               quant.qp_i =3D ctr->hevc_i_qp;
> > diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/m=
edia/platform/qcom/venus/venc_ctrls.c
> > index 3e1f6f26eddf..e340783a4ef2 100644
> > --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> > +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> > @@ -346,6 +346,55 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
> >
> >               ctr->h264_8x8_transform =3D ctrl->val;
> >               break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
> > +             if (ctrl->val !=3D V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODI=
NG_P)
> > +                     return -EINVAL;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> > +             ctr->layer_bitrate =3D ctrl->val;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
> > +             if (ctrl->val > VIDC_MAX_HIER_CODING_LAYER)
> > +                     return -EINVAL;
> > +             ctr->h264_hier_layers =3D ctrl->val;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
> > +             ctr->h264_hier_layer_bitrate[0] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_layer=
_bitrate[0], 0);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
> > +             ctr->h264_hier_layer_bitrate[1] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_layer=
_bitrate[1], 1);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
> > +             ctr->h264_hier_layer_bitrate[2] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_layer=
_bitrate[2], 2);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
> > +             ctr->h264_hier_layer_bitrate[3] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_layer=
_bitrate[3], 3);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
> > +             ctr->h264_hier_layer_bitrate[4] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_layer=
_bitrate[4], 4);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
> > +             ctr->h264_hier_layer_bitrate[5] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_layer=
_bitrate[5], 5);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -628,6 +677,49 @@ int venc_ctrl_init(struct venus_inst *inst)
> >                         V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
> >                         ((4096 * 2304) >> 8), 1, 0);
> >
> > +     if (IS_V4(inst->core) || IS_V6(inst->core)) {
> > +             v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_op=
s,
> > +                                    V4L2_CID_MPEG_VIDEO_H264_HIERARCHI=
CAL_CODING_TYPE,
> > +                                    V4L2_MPEG_VIDEO_H264_HIERARCHICAL_=
CODING_P,
> > +                                    1, V4L2_MPEG_VIDEO_H264_HIERARCHIC=
AL_CODING_P);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_C=
ODING, 0, 1, 1, 0);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_C=
ODING_LAYER, 0,
> > +                               VIDC_MAX_HIER_CODING_LAYER, 1, 0);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0=
_BR,
> > +                               BITRATE_MIN, BITRATE_MAX, BITRATE_STEP,=
 BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1=
_BR,
> > +                               BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2=
_BR,
> > +                               BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3=
_BR,
> > +                               BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4=
_BR,
> > +                               BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5=
_BR,
> > +                               BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +     }
> > +
> >       ret =3D inst->ctrl_handler.error;
> >       if (ret)
> >               goto err;
> >

