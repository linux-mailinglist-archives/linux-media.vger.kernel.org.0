Return-Path: <linux-media+bounces-15783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B6947EF5
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 18:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8FCD2814B1
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 16:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1071915B0FF;
	Mon,  5 Aug 2024 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jv8xiAIO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A446B524D7
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722873801; cv=none; b=HzsBZ52WJjHZLEeJQ5/B56/mbhB4sGDZ65K+IBDl+ltVTPGj+Gnq8DdtYyB1AU1uzJt4AiZI0Jd9QIkQK+jH0D2IX4BH3kzJ1HkEwmkNmr+UfOUxUN4h8F99HGriOC6vQnb6OjU1bWeYC1mbFkG9QpnBGBfXgOg7vvFCSEcYSwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722873801; c=relaxed/simple;
	bh=lmGjyuFLmT00O6a+tQu7wkFb/mwpo75BiHBUT1o9um8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4NWrcTw+h/ihX1PxqO5hATsbOXNQ3Vw/3amCxDvJr4wTo2yxqBAkgnygE6TQ+mgZv/BEyTqylUbWKneZuM2H8xqsXFm265sBuDB+mdudE/u2qhwHHhuf9QpCnxQRiX2sdSJIRVtiRVlVh6eJV8TWHzTIL58/TI3K+oORIPxAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jv8xiAIO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so15391119a12.2
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2024 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722873797; x=1723478597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9v27vP2NZV1Ma6ikEELz9OFmslJYzSccuzA2H+okEw=;
        b=jv8xiAIOYNyCYEGLULl/tNcLLq5WHwBGrrHIG+C1qcHar0yXvDd25gig7XUx4XFPTV
         skyDJjriM988jrerUVnNK6IMrc+la1V3LIWKSKKPeWyX6j1i2dJifiUctNqAn8GMY0Vq
         KO3JyH/tfds9eKi/K9708eGudZWRFcMRHsP1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722873797; x=1723478597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9v27vP2NZV1Ma6ikEELz9OFmslJYzSccuzA2H+okEw=;
        b=ZjQKzHNnxHVQTfKNJvIz9RaG0SiHMelHZ5mgBOnjNNcB5CtQdNBYQmka9EW8t5VVxr
         CdyST1o9ZSE3bSdEUreY6Jmsm5WGXk8Vz6wR1gmBjdivBmp0GeLcYGan5+xWb7qfp3HV
         h7XZTn9xFz7nr6L+v7KzigzUIQWom8pkZKrpoJGcDvss4tSDdd/KKZNindF4QZUVeXRX
         DbtH9uC9nE/5eeNNhB0fB68uRc456qyLo30pq7sC90yhX41IKpGonA5MzDjqK93CEgCC
         d4v/EAuTZmy9R2+9wEwIwsb3j/o8BAg/ArKd0op65QiUVUCVKIYN22a32CnvA4V9FNP0
         iG0A==
X-Forwarded-Encrypted: i=1; AJvYcCVZu3Bixwz75Wv6sHERv7zHlJ31d/m6qf8jJx4QiLi/qNsiyVKzhUcr+pDSgmTdsJy2fNjxADRxTedS71u2Lo+fNLn3WYFFsmuD8YI=
X-Gm-Message-State: AOJu0Yx0O/m+G2XNpJLyQKqZWf7WYmg6ldrld2gtB9NhDoX6YLimaXZK
	2oRNiPXB1sgmq/IH7Ok+k1KQ8P1CQG4aNtnQ8M3vmT2nvH4VxI9Wufofo0Cyo4As1aM94xGva8I
	=
X-Google-Smtp-Source: AGHT+IG3uMPaDsGFiLy8zsetLVFMugmBzcWORr4VbLjITCZiyTaEytaMtZFukM/pCsh4OLUqB1X2GA==
X-Received: by 2002:a17:907:7e84:b0:a7a:8cc7:ca48 with SMTP id a640c23a62f3a-a7dc50a4c78mr880541366b.46.1722873797333;
        Mon, 05 Aug 2024 09:03:17 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ecb551sm464540166b.223.2024.08.05.09.03.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 09:03:16 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-369f68f63b1so5571120f8f.2
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2024 09:03:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqDQjxG7IJm1esFHrd3p/Vv45w7VoeYNXO/8991GpzpOMtWUYFBQlrEXRHwP48KoyaJJwmFPwUyxTVq6WzpaSLf/sDJUc7J02OPw4=
X-Received: by 2002:a5d:5647:0:b0:360:9cf4:58ce with SMTP id
 ffacd0b85a97d-36bbc161325mr6958406f8f.46.1722873796049; Mon, 05 Aug 2024
 09:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729193219.1260463-1-frkoenig@chromium.org>
 <20240729193219.1260463-4-frkoenig@chromium.org> <ac5cf884-adf6-0c39-f375-469964fa1b0e@quicinc.com>
In-Reply-To: <ac5cf884-adf6-0c39-f375-469964fa1b0e@quicinc.com>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Mon, 5 Aug 2024 09:03:04 -0700
X-Gmail-Original-Message-ID: <CAMfZQbzabrPzpWg-AwsdSbf+MzozDnTRfY_ENkr7mbx5GESUYQ@mail.gmail.com>
Message-ID: <CAMfZQbzabrPzpWg-AwsdSbf+MzozDnTRfY_ENkr7mbx5GESUYQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: venus: Enable h.264 hierarchical coding
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org, mchehab@kernel.org, 
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, 
	bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 3:23=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 7/30/2024 12:49 AM, Fritz Koenig wrote:
> > The series of V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls
> > provides the functionality for temporal layering. These controls allow
> > for different framerates in a single stream.
> >
> > HFI supports hierarchical P encoding and the ability to specify the
> > bitrate for the different layers.
> >
> > Connect the controls that V4L2 provides and HFI supports.
> >
> > Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> > ---
> > v2:
> > - update commit message
> >
> >  drivers/media/platform/qcom/venus/core.h      |  4 +
> >  drivers/media/platform/qcom/venus/venc.c      | 24 ++++++
> >  .../media/platform/qcom/venus/venc_ctrls.c    | 84 +++++++++++++++++++
> >  3 files changed, 112 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/p=
latform/qcom/venus/core.h
> > index 55202b89e1b9..fc9552311a71 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -274,6 +274,10 @@ struct venc_controls {
> >       s32 h264_loop_filter_beta;
> >       u32 h264_8x8_transform;
> >
> > +     u32 h264_hier_enabled;
> > +     u32 h264_hier_p_layers;
> > +     u32 h264_hier_p_bitrate[6];
> > +
> >       u32 hevc_i_qp;
> >       u32 hevc_p_qp;
> >       u32 hevc_b_qp;
> > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/p=
latform/qcom/venus/venc.c
> > index ae24de125c56..301b0015b356 100644
> > --- a/drivers/media/platform/qcom/venus/venc.c
> > +++ b/drivers/media/platform/qcom/venus/venc.c
> > @@ -875,6 +875,30 @@ static int venc_set_properties(struct venus_inst *=
inst)
> >               ret =3D hfi_session_set_property(inst, ptype, &h264_trans=
form);
> >               if (ret)
> >                       return ret;
> > +
> > +             if (ctr->h264_hier_enabled) {
> > +                     unsigned int i;
> > +
> > +                     ptype =3D HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_=
ENH_LAYER;
> > +                     ret =3D hfi_session_set_property(inst, ptype, &ct=
r->h264_hier_p_layers);
> > +                     if (ret)
> > +                             return ret;
> > +
> > +                     ptype =3D HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAY=
ER;
> > +                     ret =3D hfi_session_set_property(inst, ptype, &ct=
r->h264_hier_p_layers);
> > +                     if (ret)
> > +                             return ret;
> > +
> > +                     for (i =3D 0; i < ctr->h264_hier_p_layers; ++i) {
> > +                             ptype =3D HFI_PROPERTY_CONFIG_VENC_TARGET=
_BITRATE;
> > +                             brate.bitrate =3D ctr->h264_hier_p_bitrat=
e[i];
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
> > diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/m=
edia/platform/qcom/venus/venc_ctrls.c
> > index 6304cc97d37f..4cad8058339a 100644
> > --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> > +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> > @@ -345,6 +345,52 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
> >
> >               ctr->h264_8x8_transform =3D ctrl->val;
> >               break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
> > +             if (ctrl->val !=3D V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODI=
NG_P)
> > +                     return -EINVAL;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> > +             ctr->h264_hier_enabled =3D ctrl->val;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
> > +             ctr->h264_hier_p_layers =3D ctrl->val;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
> > +             ctr->h264_hier_p_bitrate[0] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_bit=
rate[0], 0);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
> > +             ctr->h264_hier_p_bitrate[1] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_bit=
rate[1], 1);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
> > +             ctr->h264_hier_p_bitrate[2] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_bit=
rate[2], 2);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
> > +             ctr->h264_hier_p_bitrate[3] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_bit=
rate[3], 3);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
> > +             ctr->h264_hier_p_bitrate[4] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_bit=
rate[4], 4);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
> > +             ctr->h264_hier_p_bitrate[5] =3D ctrl->val;
> > +             ret =3D dynamic_bitrate_update(inst, ctr->h264_hier_p_bit=
rate[5], 5);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -627,6 +673,44 @@ int venc_ctrl_init(struct venus_inst *inst)
> >                         V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
> >                         ((4096 * 2304) >> 8), 1, 0);
> >
> > +     if (IS_V4(inst->core) || IS_V6(inst->core)) {
> Hi Fritz,
> is this change tested on any V6 device?
>
No, it has only been tested on V4 (SC7180)

-Fritz
> Thanks,
> Dikshita
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
> > +                               6, 1, 0);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0=
_BR, BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1=
_BR, BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2=
_BR, BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3=
_BR, BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4=
_BR, BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +
> > +             v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> > +                               V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5=
_BR, BITRATE_MIN, BITRATE_MAX,
> > +                               BITRATE_STEP, BITRATE_DEFAULT);
> > +     }
> > +
> >       ret =3D inst->ctrl_handler.error;
> >       if (ret)
> >               goto err;

