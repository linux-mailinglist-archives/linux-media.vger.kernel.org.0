Return-Path: <linux-media+bounces-16312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89593951E8E
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 17:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9303E1C2264D
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 15:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D460D1B4C23;
	Wed, 14 Aug 2024 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aD3hTgLo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB513C684
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723649370; cv=none; b=Qah/DSE4GlOq6WH7Akia0N9k4A+jdEi9OqkkxSHboBsvAfFmWcOoJ1JWUadXlG1fzl1AlH5VNsUVWG0z8OKVLAEX210FCdX/6ZiFSIfVFwj4PNsr16OHz1C/tJFuFCowN08+n3ENkGLU3Ykg9ZP1Epc9oxh07GQ9pnqx7AOB1Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723649370; c=relaxed/simple;
	bh=88FLFdNag2NdZRsP8uC+0OkRCiXdIm0ow5QYng93VnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxAQkdd6Z+LZFyN+aKwe1lws/avMjtHvEB/+hAP+HYzsJRUKNwxebUUlAop/la/ncZMKumaPLTIt3EYVdoAD6lzNgf3bBeilZTnpe2ciU36Vaz1I0d13hyvMHD+NAVIEcmS/9lWCq1ay3wxdL+7RWEADUSomLvDi9jxZEYp14gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aD3hTgLo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5b3fff87e6bso72703a12.0
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 08:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723649366; x=1724254166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z03NbPX8mgrPlFALFw7ePHKdBUgP2uPacW/KThKeInk=;
        b=aD3hTgLoznzGjRms+7yYfChC0ghgWhbDVY923/jmQoRjkueW9zDj1CdnjbbL6uhJ0f
         Vu/ZW+i7u3042u1DDG7r3GfhX7d5nHzQYdbGxFsuzWS7eUluX1SbhbDp+tPvvY1Sklbj
         IAphQ0VJuMJ/l+V0qEQSkowsZGGTogrY2u7wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723649366; x=1724254166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z03NbPX8mgrPlFALFw7ePHKdBUgP2uPacW/KThKeInk=;
        b=twFop4iIqTWBVXxMs7+zaywo8SlPzWLTKPERRQeZG08stHSOF9JcYmSjIj9GfQFP/X
         JFO9mFCrB8/GJMRI3eEdMZbEesUCJ2J242swtyozK4ToO+UKzou8OKsTzdnrrXTepy+f
         R3Y7+e0JxXT7pizNYr3zRtS4XIGWqte/NV6Njwa5y88TOpL6zlHhv1swr1ZBtvLH/0M+
         2E2lA7jbySVAz+scT6Yt+98qSjsg3VsX5q0O4HDHrFrw6nrxw068hfn7y4bONCNgFfnh
         JgVxIgf0EupN/FL65EM0wnt4gnjFc+7wj3NzbXd+j3lxWlx6vfrQNw1fsReKbANNikMd
         sUmw==
X-Forwarded-Encrypted: i=1; AJvYcCVzp8E5LO03ZqX66feTPy5swMQrOglwzhp6UDHT8FKiM9YLy7+x+JYGSz4Q+xkeaU1RsLyuRJW3rtHg3g7+GM4zUOfhP2lcIDdbA0M=
X-Gm-Message-State: AOJu0YzNjbTtjEkYyeRdeXUgSAE4aBpkJDFFY8aYZh9wMUpGLDG+tpkB
	TJgPZXCdpXdBmx6eBrPg7dB5DcET6Nx4lhh6CKEWPTExsjbLsl2p+PK8+u7w1Lred11UXU2dbJQ
	=
X-Google-Smtp-Source: AGHT+IHIF6V6hndlBeyK3vqWQg184nKYMPc7DHiwYwWqqnk+iHf8C82JqnGzm29dvbTGeWwKoG5n4g==
X-Received: by 2002:a05:6402:510c:b0:58c:2a57:b1e7 with SMTP id 4fb4d7f45d1cf-5bea1c6ccdemr2169407a12.8.1723649366030;
        Wed, 14 Aug 2024 08:29:26 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd187f29d0sm3975496a12.2.2024.08.14.08.29.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 08:29:25 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428e1915e18so46555615e9.1
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 08:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXK3eBmVzW6CEk8VCArfsKYwLTIGA+AmAHH67mY6PUIPerf7QtZKo563fsSrsbwEXpl6lZrDwgQMPlr0MX7TeGcK4FC+Y3Ne45aOHI=
X-Received: by 2002:adf:f6c6:0:b0:368:255d:e874 with SMTP id
 ffacd0b85a97d-3717781a735mr2234906f8f.46.1723649364737; Wed, 14 Aug 2024
 08:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729193219.1260463-1-frkoenig@chromium.org>
 <20240729193219.1260463-2-frkoenig@chromium.org> <75c4f50f-2cc0-1893-3765-68e5a479684c@quicinc.com>
In-Reply-To: <75c4f50f-2cc0-1893-3765-68e5a479684c@quicinc.com>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 14 Aug 2024 08:29:12 -0700
X-Gmail-Original-Message-ID: <CAMfZQbx96spJStUJj+-aPaekZJ6jYb05QqxUOdLp4GZ2s2BsRQ@mail.gmail.com>
Message-ID: <CAMfZQbx96spJStUJj+-aPaekZJ6jYb05QqxUOdLp4GZ2s2BsRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: venus: Reorder encoder property setting
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org, mchehab@kernel.org, 
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, 
	bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 9:38=E2=80=AFPM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 7/30/2024 12:49 AM, Fritz Koenig wrote:
> > Configure the generic controls before the codec specific ones.
> > Some codec specific controls can override the generic ones.
> >
> > Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> > ---
> > v2:
> > - requested testing methodology added to cover letter
> >
> >  drivers/media/platform/qcom/venus/venc.c | 183 +++++++++++------------
> >  1 file changed, 91 insertions(+), 92 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/p=
latform/qcom/venus/venc.c
> > index 3ec2fb8d9fab..ae24de125c56 100644
> > --- a/drivers/media/platform/qcom/venus/venc.c
> > +++ b/drivers/media/platform/qcom/venus/venc.c
> > @@ -688,98 +688,6 @@ static int venc_set_properties(struct venus_inst *=
inst)
> >       if (ret)
> >               return ret;
> >
> > -     if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264) {
> > -             struct hfi_h264_vui_timing_info info;
> > -             struct hfi_h264_entropy_control entropy;
> > -             struct hfi_h264_db_control deblock;
> > -             struct hfi_h264_8x8_transform h264_transform;
> > -
> > -             ptype =3D HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
> > -             info.enable =3D 1;
> > -             info.fixed_framerate =3D 1;
> > -             info.time_scale =3D NSEC_PER_SEC;
> > -
> > -             ret =3D hfi_session_set_property(inst, ptype, &info);
> > -             if (ret)
> > -                     return ret;
> > -
> > -             ptype =3D HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL;
> > -             entropy.entropy_mode =3D venc_v4l2_to_hfi(
> > -                                       V4L2_CID_MPEG_VIDEO_H264_ENTROP=
Y_MODE,
> > -                                       ctr->h264_entropy_mode);
> > -             entropy.cabac_model =3D HFI_H264_CABAC_MODEL_0;
> > -
> > -             ret =3D hfi_session_set_property(inst, ptype, &entropy);
> > -             if (ret)
> > -                     return ret;
> > -
> > -             ptype =3D HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL;
> > -             deblock.mode =3D venc_v4l2_to_hfi(
> > -                                   V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTE=
R_MODE,
> > -                                   ctr->h264_loop_filter_mode);
> > -             deblock.slice_alpha_offset =3D ctr->h264_loop_filter_alph=
a;
> > -             deblock.slice_beta_offset =3D ctr->h264_loop_filter_beta;
> > -
> > -             ret =3D hfi_session_set_property(inst, ptype, &deblock);
> > -             if (ret)
> > -                     return ret;
> > -
> > -             ptype =3D HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> > -             h264_transform.enable_type =3D 0;
> > -             if (ctr->profile.h264 =3D=3D V4L2_MPEG_VIDEO_H264_PROFILE=
_HIGH ||
> > -                 ctr->profile.h264 =3D=3D V4L2_MPEG_VIDEO_H264_PROFILE=
_CONSTRAINED_HIGH)
> > -                     h264_transform.enable_type =3D ctr->h264_8x8_tran=
sform;
> > -
> > -             ret =3D hfi_session_set_property(inst, ptype, &h264_trans=
form);
> > -             if (ret)
> > -                     return ret;
> > -
> > -     }
> > -
> > -     if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264 ||
> > -         inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_HEVC) {
> > -             /* IDR periodicity, n:
> > -              * n =3D 0 - only the first I-frame is IDR frame
> > -              * n =3D 1 - all I-frames will be IDR frames
> > -              * n > 1 - every n-th I-frame will be IDR frame
> > -              */
> > -             ptype =3D HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
> > -             idrp.idr_period =3D 0;
> > -             ret =3D hfi_session_set_property(inst, ptype, &idrp);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > -
> > -     if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_HEVC &&
> > -         ctr->profile.hevc =3D=3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10=
) {
> > -             struct hfi_hdr10_pq_sei hdr10;
> > -             unsigned int c;
> > -
> > -             ptype =3D HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI;
> > -
> > -             for (c =3D 0; c < 3; c++) {
> > -                     hdr10.mastering.display_primaries_x[c] =3D
> > -                             ctr->mastering.display_primaries_x[c];
> > -                     hdr10.mastering.display_primaries_y[c] =3D
> > -                             ctr->mastering.display_primaries_y[c];
> > -             }
> > -
> > -             hdr10.mastering.white_point_x =3D ctr->mastering.white_po=
int_x;
> > -             hdr10.mastering.white_point_y =3D ctr->mastering.white_po=
int_y;
> > -             hdr10.mastering.max_display_mastering_luminance =3D
> > -                     ctr->mastering.max_display_mastering_luminance;
> > -             hdr10.mastering.min_display_mastering_luminance =3D
> > -                     ctr->mastering.min_display_mastering_luminance;
> > -
> > -             hdr10.cll.max_content_light =3D ctr->cll.max_content_ligh=
t_level;
> > -             hdr10.cll.max_pic_average_light =3D
> > -                     ctr->cll.max_pic_average_light_level;
> > -
> > -             ret =3D hfi_session_set_property(inst, ptype, &hdr10);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > -
> >       if (ctr->num_b_frames) {
> >               u32 max_num_b_frames =3D NUM_B_FRAMES_MAX;
> >
> > @@ -922,6 +830,97 @@ static int venc_set_properties(struct venus_inst *=
inst)
> >       if (ret)
> >               return ret;
> >
> > +     if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264) {
> > +             struct hfi_h264_vui_timing_info info;
> > +             struct hfi_h264_entropy_control entropy;
> > +             struct hfi_h264_db_control deblock;
> > +             struct hfi_h264_8x8_transform h264_transform;
> > +
> > +             ptype =3D HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
> > +             info.enable =3D 1;
> > +             info.fixed_framerate =3D 1;
> > +             info.time_scale =3D NSEC_PER_SEC;
> > +
> > +             ret =3D hfi_session_set_property(inst, ptype, &info);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ptype =3D HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL;
> > +             entropy.entropy_mode =3D venc_v4l2_to_hfi(
> > +                                       V4L2_CID_MPEG_VIDEO_H264_ENTROP=
Y_MODE,
> > +                                       ctr->h264_entropy_mode);
> > +             entropy.cabac_model =3D HFI_H264_CABAC_MODEL_0;
> > +
> > +             ret =3D hfi_session_set_property(inst, ptype, &entropy);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ptype =3D HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL;
> > +             deblock.mode =3D venc_v4l2_to_hfi(
> > +                                   V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTE=
R_MODE,
> > +                                   ctr->h264_loop_filter_mode);
> > +             deblock.slice_alpha_offset =3D ctr->h264_loop_filter_alph=
a;
> > +             deblock.slice_beta_offset =3D ctr->h264_loop_filter_beta;
> > +
> > +             ret =3D hfi_session_set_property(inst, ptype, &deblock);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ptype =3D HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> > +             h264_transform.enable_type =3D 0;
> > +             if (ctr->profile.h264 =3D=3D V4L2_MPEG_VIDEO_H264_PROFILE=
_HIGH ||
> > +                 ctr->profile.h264 =3D=3D V4L2_MPEG_VIDEO_H264_PROFILE=
_CONSTRAINED_HIGH)
> > +                     h264_transform.enable_type =3D ctr->h264_8x8_tran=
sform;
> > +
> > +             ret =3D hfi_session_set_property(inst, ptype, &h264_trans=
form);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264 ||
> > +         inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_HEVC) {
> > +             /* IDR periodicity, n:
> > +              * n =3D 0 - only the first I-frame is IDR frame
> > +              * n =3D 1 - all I-frames will be IDR frames
> > +              * n > 1 - every n-th I-frame will be IDR frame
> > +              */
> > +             ptype =3D HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
> > +             idrp.idr_period =3D 0;
> > +             ret =3D hfi_session_set_property(inst, ptype, &idrp);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_HEVC &&
> > +         ctr->profile.hevc =3D=3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10=
) {
> > +             struct hfi_hdr10_pq_sei hdr10;
> > +             unsigned int c;
> > +
> > +             ptype =3D HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI;
> > +
> > +             for (c =3D 0; c < 3; c++) {
> > +                     hdr10.mastering.display_primaries_x[c] =3D
> > +                             ctr->mastering.display_primaries_x[c];
> > +                     hdr10.mastering.display_primaries_y[c] =3D
> > +                             ctr->mastering.display_primaries_y[c];
> > +             }
> > +
> > +             hdr10.mastering.white_point_x =3D ctr->mastering.white_po=
int_x;
> > +             hdr10.mastering.white_point_y =3D ctr->mastering.white_po=
int_y;
> > +             hdr10.mastering.max_display_mastering_luminance =3D
> > +                     ctr->mastering.max_display_mastering_luminance;
> > +             hdr10.mastering.min_display_mastering_luminance =3D
> > +                     ctr->mastering.min_display_mastering_luminance;
> > +
> > +             hdr10.cll.max_content_light =3D ctr->cll.max_content_ligh=
t_level;
> > +             hdr10.cll.max_pic_average_light =3D
> > +                     ctr->cll.max_pic_average_light_level;
> > +
> > +             ret =3D hfi_session_set_property(inst, ptype, &hdr10);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       switch (inst->hfi_codec) {
> >       case HFI_VIDEO_CODEC_H264:
> >               profile =3D ctr->profile.h264;
>
> Changing the order might cause issue for other functionalities.
>
> Also, Client should either set the commutative bitrate or layerwise
> bitrate. So, if the motive behind this re-order is to not update the
> commutative bitrate, then that is expected and this way there might not b=
e
> a need to change current order.
>
> Thanks,
> Dikshita

Somewhat orthogonal, how should the max bitrate be handled? If
ctr->bitrate_peak is not set, it is based off of the commutative
bitrate. Should it be based off of the bitrate of layer 0? or the
highest bitrate of the layers?

-Fritz

