Return-Path: <linux-media+bounces-35003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356EADBA5B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 21:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE11172844
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 19:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC50289357;
	Mon, 16 Jun 2025 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="joWrUbcV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF31FAC50
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750103663; cv=none; b=Xvi+b+tftA/jSI75p/uknUiUqci0wj2alUhqwn0gOnS646/R9rRxwjYxT2DHk/Nu5s6dl++L6gGRCtus/y1s3Nif55R/SGQAIBjmUJWRq/+VR1YRrkOU1PHDKSkwjVwgYiyU5IZHtGiGkgP8PbJj1vDQR50x3OIuAgwhJskINxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750103663; c=relaxed/simple;
	bh=DzQkA5W6ZIhKPWw5S/j85sM++f2+cNXvXoRn/1gennM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HItRPthfk1b6HuppcltbYQGM9c7tGr9zKqV0v3Gc2m+HS371bkz7hXM7oVZoDHtg3EP6IARvHNBgXCS7YieZ8ozP4iB31/akxeYpPcrf1329ZX+NSSAwGPGa9v90n/gLNtF+Gw5Aro+H5D8G/cpV5robIG7HOP+dRCdGG5PJdmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=joWrUbcV; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553644b8f56so5073285e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750103660; x=1750708460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXz3Yj+fndsiQvF8Y+I/xW2CmjWY6qouxuqd1z1WGzE=;
        b=joWrUbcVy3eik7doCl+hmdq6sNlw4yWfPKU84yVJlxQHivOk+vxnyTp6M44sSblc35
         8qXBHEqWrbuVbtM1VJWVPYTD4ZAv9ueh4w4w2s3qyo7zyu0BZ+fFBfdzBeSQZjqSh30q
         qdsDHlaugCzCJaH+DKGpXfMSJQsRMjHmC46D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750103660; x=1750708460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXz3Yj+fndsiQvF8Y+I/xW2CmjWY6qouxuqd1z1WGzE=;
        b=NtoQRzEqgbhH0vvmb4nDQsu9MnVSu++F2r1v6398Jhye5rnGpDPB0xIL5jG/+NNoMv
         TrcFUShQ/9hXPoiomTn6n4VvNkzZuCrN6fDmUGio8/aadLCu3FJJIGQZvTB9K96o+CwR
         J8Cf8Nkr4CkfV4w6te0nEqxBWh2T+6GDAGl1wSqHBl5pwNH9uHKCPwSLrJzaDhrVFgtF
         7f8f3ZHK6U/sk2cYd2nQMvZp8z24LolUdT0l8Sx1mHelIgo6r8hIFWBZ+pVoEeGgQGhX
         ET6WGCVTslSO9zTmD/zDqpg6KKhismXc4ZT/3AbJjJdk/ED75dcCEkYUIf6P6M8tb/kk
         FSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9XdPGNP5hU39D48LFOY4HJVxP6nwee39TYiK2RM+xgfiRKRtSzX1npbfw4lzRTZkyeoq4H6zOMbxdFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbBWHefDttPoEVdQfW/dd/PT58dHl0jHPdL8fEKgmQcv81LiA
	91C+n4pEvqdisK8fcqNkF7sJA/4PKQ2xrbZqr855UCEEYnMWbreCpyDfA9n3IZbqvoKLiFp82/P
	0/Ck=
X-Gm-Gg: ASbGncvTiklJEQTqieJ4YGJffRUodkMkweyXSuklAyGuhe3MTe8vbTmL9GzuExe74XF
	Nlrhx65cTP45TqOP/NncycExR+tvs420fnuddKCMIYdTs85GCjt1PCJTaXeOVe5gUVO4RQx9bW4
	5xYgw7LxJ1iZXER3W3aQQqA/wAwDvcssgvkl2Q6dcchaAIv7My1npL97GMwNcUGZYh7/nqI8NCW
	sCBUrFVkipo/emMa/5fxgnUg+C6o8vVKQ4jPe7sUbUYkLOEPj1yLG21H71cd1CBe9MZ5kDAA4q2
	60r2zZbLOggu++dwUFw3tQuDA25BP1m8d94Q+64RG1GOtmIvsSTw/TVnn4+g4AQ/Id5AmpzLvls
	lCwzx2xa3ZbADxi0FRPkf+Tmo
X-Google-Smtp-Source: AGHT+IHQ5IMO2+x40o1mrUFrb7oRHEUZkf29jkWZ7U+dq6GR1SlZJJAWd8mjYD/RANTQ3b2Aba2aFQ==
X-Received: by 2002:a05:6512:3b9d:b0:553:36b7:7b14 with SMTP id 2adb3069b0e04-553b6f18119mr2564921e87.37.1750103659870;
        Mon, 16 Jun 2025 12:54:19 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac143a7fsm1663938e87.87.2025.06.16.12.54.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 12:54:19 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553644b8f56so5073251e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 12:54:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCik4o776UT5/9qfvZKE2EG+SGwN024kTgEwpzQZcLceDQT/2m5otPp0yy+l5dr/1UX0/X5HsGnxdmMw==@vger.kernel.org
X-Received: by 2002:a05:6512:2351:b0:553:24b7:2f61 with SMTP id
 2adb3069b0e04-553b6f5a056mr2704851e87.57.1750103657726; Mon, 16 Jun 2025
 12:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org> <20250616-test-v7-3-b8c0f98494fa@chromium.org>
 <3d08da09653034128c48e97c1f6fad59c2ff5f35.camel@ndufresne.ca>
In-Reply-To: <3d08da09653034128c48e97c1f6fad59c2ff5f35.camel@ndufresne.ca>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 21:54:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCtRE+kEt=1jr=L+EB_axbAeg_-bhD1FAPe2xufuC_nmeA@mail.gmail.com>
X-Gm-Features: AX0GCFso7Umw_6wpxvuce0gLpPYr1ipCL6-nm2w3EzXeGlmtVoG3SHyPy3-SJDI
Message-ID: <CANiDSCtRE+kEt=1jr=L+EB_axbAeg_-bhD1FAPe2xufuC_nmeA@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] media: venus: Remove timeperframe from inst
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, Hans Verkuil <hans.verkuil@cisco.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas


On Mon, 16 Jun 2025 at 21:37, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Hi Ricardo,
>
> Le lundi 16 juin 2025 =C3=A0 15:29 +0000, Ricardo Ribalda a =C3=A9crit :
> > The driver only cares about whole fps. We can infer the timeperframe
> > from the fps field. Remove the redundant field.
>
> I do have reserved about this change. Video standards commonly uses fract=
ional
> rates for videos. If my memory is correct, venus uses Q16 ... So with thi=
s change,
> we now round all frame rate passed to encoders to an integer, which will =
introduce
> error in the resulting bitrate.
>
> Perhaps it was already broken, but if so, it should be fixed instead ?

It seems like today it only supports integer frame rates, or at least
timeperframe is not used anywhere in the code, this is why I
implemented the change.

In other words, when the driver was returning a fractional it was lying (a =
bit).

I do not have the hardware to test this, the best thing I can offer is
to remove this patch from the set and rebase the code.

My main concern is to fix the "division errors" from the static analyzer :)

>
> regards,
> Nicolas
>
> >
> > Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.h |  2 --
> >  drivers/media/platform/qcom/venus/vdec.c | 15 ++++++++-------
> >  drivers/media/platform/qcom/venus/venc.c | 16 ++++++++--------
> >  3 files changed, 16 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/p=
latform/qcom/venus/core.h
> > index 5b1ba1c69adba14c3560a4bc6d09435529f295a6..9cfb860e01e752bf9856a35=
50f59c8c7b43647d2 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -413,7 +413,6 @@ enum venus_inst_modes {
> >   * @tss:             timestamp metadata
> >   * @payloads:                cache plane payload to use it for clock/B=
W scaling
> >   * @fps:             holds current FPS
> > - * @timeperframe:    holds current time per frame structure
> >   * @fmt_out: a reference to output format structure
> >   * @fmt_cap: a reference to capture format structure
> >   * @num_input_bufs:  holds number of input buffers
> > @@ -484,7 +483,6 @@ struct venus_inst {
> >       struct venus_ts_metadata tss[VIDEO_MAX_FRAME];
> >       unsigned long payloads[VIDEO_MAX_FRAME];
> >       u64 fps;
> > -     struct v4l2_fract timeperframe;
> >       const struct venus_format *fmt_out;
> >       const struct venus_format *fmt_cap;
> >       unsigned int num_input_bufs;
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/p=
latform/qcom/venus/vdec.c
> > index fca27be61f4b869840904cc0577949635bc63cab..7d6612234d18a49573dc502=
d48ee61a900b63194 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -471,10 +471,12 @@ static int vdec_s_parm(struct file *file, void *f=
h, struct v4l2_streamparm *a)
> >               return -EINVAL;
> >
> >       memset(cap->reserved, 0, sizeof(cap->reserved));
> > -     if (!timeperframe->denominator)
> > -             timeperframe->denominator =3D inst->timeperframe.denomina=
tor;
> > -     if (!timeperframe->numerator)
> > -             timeperframe->numerator =3D inst->timeperframe.numerator;
> > +
> > +     if (!timeperframe->numerator || !timeperframe->denominator) {
> > +             timeperframe->numerator =3D 1;
> > +             timeperframe->denominator =3D inst->fps;
> > +     }
> > +
> >       cap->readbuffers =3D 0;
> >       cap->extendedmode =3D 0;
> >       cap->capability =3D V4L2_CAP_TIMEPERFRAME;
> > @@ -487,7 +489,8 @@ static int vdec_s_parm(struct file *file, void *fh,=
 struct v4l2_streamparm *a)
> >       fps =3D min(VENUS_MAX_FPS, fps);
> >
> >       inst->fps =3D fps;
> > -     inst->timeperframe =3D *timeperframe;
> > +     timeperframe->numerator =3D 1;
> > +     timeperframe->denominator =3D inst->fps;
> >
> >       return 0;
> >  }
> > @@ -1622,8 +1625,6 @@ static void vdec_inst_init(struct venus_inst *ins=
t)
> >       inst->out_width =3D frame_width_min(inst);
> >       inst->out_height =3D frame_height_min(inst);
> >       inst->fps =3D 30;
> > -     inst->timeperframe.numerator =3D 1;
> > -     inst->timeperframe.denominator =3D 30;
> >       inst->opb_buftype =3D HFI_BUFFER_OUTPUT;
> >  }
> >
> > diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/p=
latform/qcom/venus/venc.c
> > index b9ccee870c3d1238e04cef5e9344bd992d86d737..4979392aa20b6dc94895c70=
89878531b92b57754 100644
> > --- a/drivers/media/platform/qcom/venus/venc.c
> > +++ b/drivers/media/platform/qcom/venus/venc.c
> > @@ -401,10 +401,10 @@ static int venc_s_parm(struct file *file, void *f=
h, struct v4l2_streamparm *a)
> >
> >       memset(out->reserved, 0, sizeof(out->reserved));
> >
> > -     if (!timeperframe->denominator)
> > -             timeperframe->denominator =3D inst->timeperframe.denomina=
tor;
> > -     if (!timeperframe->numerator)
> > -             timeperframe->numerator =3D inst->timeperframe.numerator;
> > +     if (!timeperframe->numerator || !timeperframe->denominator) {
> > +             timeperframe->numerator =3D 1;
> > +             timeperframe->denominator =3D inst->fps;
> > +     }
> >
> >       out->capability =3D V4L2_CAP_TIMEPERFRAME;
> >
> > @@ -416,8 +416,9 @@ static int venc_s_parm(struct file *file, void *fh,=
 struct v4l2_streamparm *a)
> >       do_div(fps, us_per_frame);
> >       fps =3D min(VENUS_MAX_FPS, fps);
> >
> > -     inst->timeperframe =3D *timeperframe;
> >       inst->fps =3D fps;
> > +     timeperframe->numerator =3D 1;
> > +     timeperframe->denominator =3D inst->fps;
> >
> >       return 0;
> >  }
> > @@ -431,7 +432,8 @@ static int venc_g_parm(struct file *file, void *fh,=
 struct v4l2_streamparm *a)
> >               return -EINVAL;
> >
> >       a->parm.output.capability |=3D V4L2_CAP_TIMEPERFRAME;
> > -     a->parm.output.timeperframe =3D inst->timeperframe;
> > +     a->parm.output.timeperframe.numerator =3D 1;
> > +     a->parm.output.timeperframe.denominator =3D inst->fps;
> >
> >       return 0;
> >  }
> > @@ -1454,8 +1456,6 @@ static void venc_inst_init(struct venus_inst *ins=
t)
> >       inst->out_width =3D 1280;
> >       inst->out_height =3D 720;
> >       inst->fps =3D 15;
> > -     inst->timeperframe.numerator =3D 1;
> > -     inst->timeperframe.denominator =3D 15;
> >       inst->hfi_codec =3D HFI_VIDEO_CODEC_H264;
> >  }
> >



--=20
Ricardo Ribalda

