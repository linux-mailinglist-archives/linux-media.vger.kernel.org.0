Return-Path: <linux-media+bounces-40021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B3B29082
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 22:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410CF3AFB63
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 19:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A2B2E36FA;
	Sat, 16 Aug 2025 19:58:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A19224B0E;
	Sat, 16 Aug 2025 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755374311; cv=none; b=eh3Zd/WTIyW1cJqBvAmdJjVOAqwlXbsXgB+NRaN5GDbGPpYQgUrcaP8rpJS82xnX2oPezLH6G8wVEMMbgIqt5yVJyqnEk22/ndR1l8eziS35+nQzz6hYFu0WGN8eodhYIt/H76DyAmCC05HTJyylDnmyFghfHi6SnG85rYR9CVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755374311; c=relaxed/simple;
	bh=z5XYRJYzrT1EslZIsmeq/5F2XE/nivWMcNNUtmhUQPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB7+9gkIfAc6vl0iyLLjL/aOwVRUN3BoudARIYlxhNMkZiWm7M20EJ3sv8f9/IWClz5VGm65UYHlvSLdqPofw1BA8FY8QuNGjlBMUc6UHaOvLufpTQQUgn5qzmSA9QCHIdWIx09rMpjDbeFiGLsJbSZpE/gJFRCb4RqffZ+yf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so393097966b.3;
        Sat, 16 Aug 2025 12:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755374308; x=1755979108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8uLL2ui2jPynLpU+TlLItADM8r1FPM/9nwIi8VuAgo=;
        b=uToohNxlmZEKFsV4xAseu3e3Prjm8n+dLwp+nii55zTm8R0L3neJB0WHXXilXFOMzy
         D1A4o2kntSGaY3viJokuewZ/NiGsT5IgW9FlNstd7EN1WVFgT6pJjtRJT1et/b9TIvPD
         LeenmzLD9DN/vNnF+RNArdzrNGf27SOW/s3AxDFVFgr3A3N9tPzpTbfXytNDTT/ZB0w3
         KH072JoDnMcmtPUKypM8IY/XOqeFCSrVnzA9Vu4VA0UR9Vmx7Ybb5kH4s/6fRjRe+PsV
         T0iUDtqDUxKkgEHzsthl42EyT7GnaGqHzAMP8Zy2SfcUzxBT1RQZBH3fvE0/l5Q56snq
         9Xqg==
X-Forwarded-Encrypted: i=1; AJvYcCUoi9KxsnIvXDEWniWTl6Iq3WC6GBJJ1+6XG+7TVi+pPIxHSXFNVblpjCxuevihT37E/AXAZ3U5PyRM@vger.kernel.org, AJvYcCUuCL5HPstSWmpFIZnABOHPwbszwqEKobDZtSVn93tlriI1g9c6h9YElEHWt+4R86ztL0gGW5RNkcOUMHpK@vger.kernel.org, AJvYcCXXAlICLDpfAbXmhHRhK6AUs+QYaPZXeBIZsGUbA3K/HVddi+/txEDSbxv0frkC9tcufA0wkEzZcn7dnAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YybMACzMPiBQnMaXWt8o5mPeSb9rXBngqjIMlqWrKmP8EqVbYwZ
	h+Y7wjtBo5o73+paFudz1Sfyjt0UvYo4McO4hX3c72felbYrLbJrWqAXq9zFk98G7LI=
X-Gm-Gg: ASbGnctZE5w7vsZqAyKDYABe7HIIPIwS/6xP1x2YHwP9w7hZnQdcX/lUd6kcqcyHHzh
	ESxdMVOUQS5NVKe40wcebjz20qrU4IZROvxp8HwM8hPh3xMpvrhP/SyfDH2PoWumHRzQjFtRpg3
	saG+/8NVDV4vmf/pfxx+j/6tfStqtj5tJBS5qSCp6nk4UAiA2HwhTpV/uFbAKNe90rET03xDO75
	x4CHwHFCm/OBukWx26rE6QK6uE9uCv4h3OTNFWGW7IJPZNdxiKpxRgipe0SVavp1YwEYBdyaWE8
	O2el80q4yD8vzCT4rQ2GwjyJzmwCZogQftMHXD1I6CHvD/V8XPIPE2FrRC06PBMSMAK93Ukpweu
	He3K2f8ViAsnQD7LNRWRXjqL+sDYbEGPhh6qzOzAEW7TJVbAkPtiqdAAJeQ==
X-Google-Smtp-Source: AGHT+IH8W+RGFFFAVHQJ/5fUifzN3PIFdsMXkZv9ff0ffRQSLT6/4rpzjWqDNNT+D18bT5Qi0Fczpg==
X-Received: by 2002:a17:907:7e8d:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-afceae9cda5mr324455466b.53.1755374307481;
        Sat, 16 Aug 2025 12:58:27 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53ed7sm437630666b.12.2025.08.16.12.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 12:58:27 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6188b5b11b2so3677351a12.0;
        Sat, 16 Aug 2025 12:58:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6cfqauldNUBQH0yp6zR9yJv3MzwWWj4zN1LBbfbNgxJNHEQ0+Q9MHMdH/JT1c4uP7Sg1mig5QtKa+@vger.kernel.org, AJvYcCUB9uPp5QvPa7o7kTNBENMLckCSVVbgN7gmJAx/NIX12N8vk2smt2VW2km5kWREexV6wRTEcHf4YCypVu0=@vger.kernel.org, AJvYcCV4ccGO60tznhD4JWErf4/YzLKn8IrL1BNBYHXMEnL/qLmpZfyZnWSDvRINw+vLzL/d5G9rmRk1ORqijfCp@vger.kernel.org
X-Received: by 2002:a05:6402:210a:b0:615:274e:6509 with SMTP id
 4fb4d7f45d1cf-619b7070f96mr2754331a12.9.1755374306907; Sat, 16 Aug 2025
 12:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816055432.131912-1-will@willwhang.com> <20250816055432.131912-3-will@willwhang.com>
 <7e27b69b-40df-4ac4-aebf-dbd00044b71b@kernel.org>
In-Reply-To: <7e27b69b-40df-4ac4-aebf-dbd00044b71b@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Sat, 16 Aug 2025 12:58:15 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxbzcF+YranTL8Von3BkROhq8X=RX5sa90M6PYgS_vjkQ@mail.gmail.com>
X-Gm-Features: Ac12FXwSSm6Ecst_WrVprCorqJYKftt2IDGMJ2tLaGWqHF0cr1tL1ThYM8oXA08
Message-ID: <CAFoNnrxbzcF+YranTL8Von3BkROhq8X=RX5sa90M6PYgS_vjkQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: imx585: Add Sony IMX585 image-sensor driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 1:04=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/08/2025 07:54, Will Whang wrote:
> > +
> > +static int imx585_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct imx585 *imx585 =3D container_of(ctrl->handler, struct imx5=
85, ctrl_handler);
> > +     const struct imx585_mode *mode, *mode_list;
> > +     struct v4l2_subdev_state *state;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     unsigned int num_modes;
> > +     int ret =3D 0;
> > +
> > +     state =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> > +     fmt =3D v4l2_subdev_state_get_format(state, 0);
> > +
> > +     get_mode_table(imx585, fmt->code, &mode_list, &num_modes);
> > +     mode =3D v4l2_find_nearest_size(mode_list, num_modes, width, heig=
ht,
> > +                                   fmt->width, fmt->height);
> > +
> > +     /* Apply control only when powered (runtime active). */
> > +     if (!pm_runtime_get_if_active(imx585->clientdev))
> > +             return 0;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_EXPOSURE: {
> > +             u32 shr =3D (imx585->vmax - ctrl->val) & ~1U; /* SHR alwa=
ys a multiple of 2 */
> > +
> > +             dev_dbg(imx585->clientdev, "EXPOSURE=3D%u -> SHR=3D%u (VM=
AX=3D%u HMAX=3D%u)\n",
> > +                     ctrl->val, shr, imx585->vmax, imx585->hmax);
> > +
> > +             ret =3D cci_write(imx585->regmap, IMX585_REG_SHR, shr, NU=
LL);
> > +             if (ret)
> > +                     dev_err_ratelimited(imx585->clientdev, "SHR write=
 failed (%d)\n", ret);
> > +             break;
> > +     }
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             dev_dbg(imx585->clientdev, "ANALOG_GAIN=3D%u\n", ctrl->va=
l);
>
> Not much improved. Don't debug V4L2 calls.
>
> I already commented on this and you just send simialr code. Drop this
> completely.
>

I need to debug V4L2 calls for image quality debugging. I don't
understand why I can not have dev_dbg().
What I read from your comments on the previous patch is that you don't
want to have a noisy driver and I sorta agree with that but for debug
purposes this is not an issue.
That is why I move it to dev_dbg instead of removing them, if you
think this is too noisy, then just don't turn on debugging.

>
> > +             ret =3D cci_write(imx585->regmap, IMX585_REG_ANALOG_GAIN,=
 ctrl->val, NULL);
> > +             if (ret)
> > +                     dev_err_ratelimited(imx585->clientdev, "Gain writ=
e failed (%d)\n", ret);
> > +             break;
> > +     case V4L2_CID_VBLANK: {
> > +             u32 current_exposure =3D imx585->exposure->cur.val;
> > +
> > +             imx585->vmax =3D (mode->height + ctrl->val) & ~1U;
> > +
> > +             current_exposure =3D clamp_t(u32, current_exposure,
> > +                                        IMX585_EXPOSURE_MIN, imx585->v=
max - IMX585_SHR_MIN);
> > +             __v4l2_ctrl_modify_range(imx585->exposure,
> > +                                      IMX585_EXPOSURE_MIN, imx585->vma=
x - IMX585_SHR_MIN, 1,
> > +                                      current_exposure);
> > +
> > +             dev_dbg(imx585->clientdev, "VBLANK=3D%u -> VMAX=3D%u\n", =
ctrl->val, imx585->vmax);
> > +
> > +             ret =3D cci_write(imx585->regmap, IMX585_REG_VMAX, imx585=
->vmax, NULL);
> > +             if (ret)
> > +                     dev_err_ratelimited(imx585->clientdev, "VMAX writ=
e failed (%d)\n", ret);
> > +             break;
> > +     }
> > +     case V4L2_CID_HBLANK: {
> > +             u64 pixel_rate =3D (u64)mode->width * IMX585_PIXEL_RATE;
> > +             u64 hmax;
> > +
> > +             do_div(pixel_rate, mode->min_hmax);
> > +             hmax =3D (u64)(mode->width + ctrl->val) * IMX585_PIXEL_RA=
TE;
> > +             do_div(hmax, pixel_rate);
> > +             imx585->hmax =3D (u32)hmax;
> > +
> > +             dev_dbg(imx585->clientdev, "HBLANK=3D%u -> HMAX=3D%u\n", =
ctrl->val, imx585->hmax);
> > +
> > +             ret =3D cci_write(imx585->regmap, IMX585_REG_HMAX, imx585=
->hmax, NULL);
> > +             if (ret)
> > +                     dev_err_ratelimited(imx585->clientdev, "HMAX writ=
e failed (%d)\n", ret);
> > +             break;
> > +     }
> > +     case V4L2_CID_HFLIP:
> > +             ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMODEH, c=
trl->val, NULL);
> > +             if (ret)
> > +                     dev_err_ratelimited(imx585->clientdev, "HFLIP wri=
te failed (%d)\n", ret);
> > +             break;
> > +     case V4L2_CID_VFLIP:
> > +             ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMODEV, c=
trl->val, NULL);
> > +             if (ret)
> > +                     dev_err_ratelimited(imx585->clientdev, "VFLIP wri=
te failed (%d)\n", ret);
> > +             break;
> > +     case V4L2_CID_BRIGHTNESS: {
> > +             u16 blacklevel =3D min_t(u32, ctrl->val, 4095);
> > +
> > +             ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEVEL, bl=
acklevel, NULL);
> > +             if (ret)
> > +                     dev_err_ratelimited(imx585->clientdev, "BLKLEVEL =
write failed (%d)\n", ret);
> > +             break;
> > +     }
> > +     default:
> > +             dev_dbg(imx585->clientdev, "Unhandled ctrl %s: id=3D0x%x,=
 val=3D0x%x\n",
> > +                     ctrl->name, ctrl->id, ctrl->val);
> > +             break;
> > +     }
> > +
> > +     pm_runtime_put(imx585->clientdev);
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops imx585_ctrl_ops =3D {
> > +     .s_ctrl =3D imx585_set_ctrl,
> > +};
> > +
> > +static int imx585_init_controls(struct imx585 *imx585)
> > +{
> > +     struct v4l2_ctrl_handler *hdl =3D &imx585->ctrl_handler;
> > +     struct v4l2_fwnode_device_properties props;
> > +     int ret;
> > +
> > +     ret =3D v4l2_ctrl_handler_init(hdl, 16);
> > +
> > +     /* Read-only, updated per mode */
> > +     imx585->pixel_rate =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> > +                                            V4L2_CID_PIXEL_RATE,
> > +                                            1, UINT_MAX, 1, 1);
> > +
> > +     imx585->link_freq =3D
> > +             v4l2_ctrl_new_int_menu(hdl, &imx585_ctrl_ops, V4L2_CID_LI=
NK_FREQ,
> > +                                    0, 0, &link_freqs[imx585->link_fre=
q_idx]);
> > +     if (imx585->link_freq)
> > +             imx585->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     imx585->vblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> > +                                        V4L2_CID_VBLANK, 0, 0xFFFFF, 1=
, 0);
> > +     imx585->hblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> > +                                        V4L2_CID_HBLANK, 0, 0xFFFF, 1,=
 0);
> > +     imx585->blacklevel =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> > +                                            V4L2_CID_BRIGHTNESS, 0, 0x=
FFFF, 1,
> > +                                            IMX585_BLKLEVEL_DEFAULT);
> > +
> > +     imx585->exposure =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> > +                                          V4L2_CID_EXPOSURE,
> > +                                          IMX585_EXPOSURE_MIN, IMX585_=
EXPOSURE_MAX,
> > +                                          IMX585_EXPOSURE_STEP, IMX585=
_EXPOSURE_DEFAULT);
> > +
> > +     imx585->gain =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops, V4L2_CI=
D_ANALOGUE_GAIN,
> > +                                      IMX585_ANA_GAIN_MIN, IMX585_ANA_=
GAIN_MAX,
> > +                                      IMX585_ANA_GAIN_STEP, IMX585_ANA=
_GAIN_DEFAULT);
> > +
> > +     imx585->hflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> > +                                       V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +     imx585->vflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> > +                                       V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +     if (hdl->error) {
> > +             ret =3D hdl->error;
> > +             dev_err(imx585->clientdev, "control init failed (%d)\n", =
ret);
> > +             goto err_free;
> > +     }
> > +
> > +     ret =3D v4l2_fwnode_device_parse(imx585->clientdev, &props);
> > +     if (ret)
> > +             goto err_free;
> > +
> > +     ret =3D v4l2_ctrl_new_fwnode_properties(hdl, &imx585_ctrl_ops, &p=
rops);
> > +     if (ret)
> > +             goto err_free;
> > +
> > +     imx585->sd.ctrl_handler =3D hdl;
> > +     return 0;
> > +
> > +err_free:
> > +     v4l2_ctrl_handler_free(hdl);
> > +     return ret;
> > +}
> > +
> > +static void imx585_free_controls(struct imx585 *imx585)
> > +{
> > +     v4l2_ctrl_handler_free(imx585->sd.ctrl_handler);
> > +}
> > +
> > +/* -------------------------------------------------------------------=
-------
> > + * Pad ops / formats
> > + * -------------------------------------------------------------------=
-------
> > + */
> > +
> > +static int imx585_enum_mbus_code(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     unsigned int entries;
> > +     const u32 *tbl;
> > +
> > +     if (imx585->mono) {
> > +             if (code->index)
> > +                     return -EINVAL;
> > +             code->code =3D MEDIA_BUS_FMT_Y12_1X12;
> > +             return 0;
> > +     }
> > +
> > +     tbl =3D color_codes;
> > +     entries =3D ARRAY_SIZE(color_codes) / 4;
> > +
> > +     if (code->index >=3D entries)
> > +             return -EINVAL;
> > +
> > +     code->code =3D imx585_get_format_code(imx585, tbl[code->index * 4=
]);
> > +     return 0;
> > +}
> > +
> > +static int imx585_enum_frame_size(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_frame_size_enum *fse=
)
> > +{
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     const struct imx585_mode *mode_list;
> > +     unsigned int num_modes;
> > +
> > +     get_mode_table(imx585, fse->code, &mode_list, &num_modes);
> > +     if (fse->index >=3D num_modes)
> > +             return -EINVAL;
> > +     if (fse->code !=3D imx585_get_format_code(imx585, fse->code))
> > +             return -EINVAL;
> > +
> > +     fse->min_width  =3D mode_list[fse->index].width;
> > +     fse->max_width  =3D fse->min_width;
> > +     fse->min_height =3D mode_list[fse->index].height;
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx585_set_pad_format(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_format *fmt)
> > +{
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     const struct imx585_mode *mode_list, *mode;
> > +     unsigned int num_modes;
> > +     struct v4l2_mbus_framefmt *format;
> > +
> > +     get_mode_table(imx585, fmt->format.code, &mode_list, &num_modes);
> > +     mode =3D v4l2_find_nearest_size(mode_list, num_modes, width, heig=
ht,
> > +                                   fmt->format.width, fmt->format.heig=
ht);
> > +
> > +     fmt->format.width        =3D mode->width;
> > +     fmt->format.height       =3D mode->height;
> > +     fmt->format.field        =3D V4L2_FIELD_NONE;
> > +     fmt->format.colorspace   =3D V4L2_COLORSPACE_RAW;
> > +     fmt->format.ycbcr_enc    =3D V4L2_YCBCR_ENC_601;
> > +     fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> > +     fmt->format.xfer_func    =3D V4L2_XFER_FUNC_NONE;
> > +
> > +     format =3D v4l2_subdev_state_get_format(sd_state, 0);
> > +
> > +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +             imx585_set_framing_limits(imx585, mode);
> > +
> > +     *format =3D fmt->format;
> > +     return 0;
> > +}
> > +
> > +/* -------------------------------------------------------------------=
-------
> > + * Stream on/off
> > + * -------------------------------------------------------------------=
-------
> > + */
> > +
> > +static int imx585_enable_streams(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state, u32 pad=
,
> > +                              u64 streams_mask)
> > +{
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     const struct imx585_mode *mode_list, *mode;
> > +     struct v4l2_subdev_state *st;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     unsigned int n_modes;
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_get_sync(imx585->clientdev);
> > +     if (ret < 0) {
> > +             pm_runtime_put_noidle(imx585->clientdev);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D cci_multi_reg_write(imx585->regmap, common_regs,
> > +                               ARRAY_SIZE(common_regs), NULL);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to write common settin=
gs\n");
> > +             goto err_rpm_put;
> > +     }
> > +
> > +     ret =3D cci_write(imx585->regmap, IMX585_INCK_SEL, imx585->inck_s=
el_val, NULL);
> > +     if (!ret)
> > +             ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEVEL, IM=
X585_BLKLEVEL_DEFAULT, NULL);
> > +     if (!ret)
> > +             ret =3D cci_write(imx585->regmap, IMX585_DATARATE_SEL,
> > +                             link_freqs_reg_value[imx585->link_freq_id=
x], NULL);
> > +     if (ret)
> > +             goto err_rpm_put;
> > +
> > +     ret =3D cci_write(imx585->regmap, IMX585_LANEMODE,
> > +                     (imx585->lane_count =3D=3D 2) ? 0x01 : 0x03, NULL=
);
> > +     if (ret)
> > +             goto err_rpm_put;
> > +
> > +     /* Mono bin flag (datasheet: 0x01 mono, 0x00 color) */
> > +     ret =3D cci_write(imx585->regmap, IMX585_BIN_MODE, imx585->mono ?=
 0x01 : 0x00, NULL);
> > +     if (ret)
> > +             goto err_rpm_put;
> > +
> > +     /* Sync configuration */
> > +     if (imx585->sync_mode =3D=3D SYNC_INT_FOLLOWER) {
> > +             dev_dbg(imx585->clientdev, "Internal sync follower: XVS i=
nput\n");
> > +             cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x01, NULL)=
;
> > +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x03, NULL)=
; /* XHS out, XVS in */
> > +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x08, NU=
LL); /* disable XVS OUT */
> > +     } else if (imx585->sync_mode =3D=3D SYNC_INT_LEADER) {
> > +             dev_dbg(imx585->clientdev, "Internal sync leader: XVS/XHS=
 output\n");
> > +             cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x00, NULL)=
;
> > +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x00, NULL)=
; /* XHS/XVS out */
> > +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x0A, NU=
LL);
> > +     } else {
> > +             dev_dbg(imx585->clientdev, "Follower: XVS/XHS input\n");
> > +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x0F, NULL)=
; /* inputs */
> > +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x00, NU=
LL);
> > +     }
> > +
> > +     imx585->common_regs_written =3D true;
> > +
> > +     /* Select mode */
> > +     st  =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> > +     fmt =3D v4l2_subdev_state_get_format(st, 0);
> > +
> > +     get_mode_table(imx585, fmt->code, &mode_list, &n_modes);
> > +     mode =3D v4l2_find_nearest_size(mode_list, n_modes, width, height=
,
> > +                                   fmt->width, fmt->height);
> > +
> > +     ret =3D cci_multi_reg_write(imx585->regmap, mode->reg_list.regs,
> > +                               mode->reg_list.num_of_regs, NULL);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to write mode register=
s\n");
> > +             goto err_rpm_put;
> > +     }
> > +
> > +     /* Disable digital clamp */
> > +     cci_write(imx585->regmap, IMX585_REG_DIGITAL_CLAMP, 0x00, NULL);
> > +
> > +     /* Apply user controls after writing the base tables */
> > +     ret =3D __v4l2_ctrl_handler_setup(imx585->sd.ctrl_handler);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Control handler setup failed\=
n");
> > +             goto err_rpm_put;
> > +     }
> > +
> > +     if (imx585->sync_mode !=3D SYNC_EXTERNAL)
> > +             cci_write(imx585->regmap, IMX585_REG_XMSTA, 0x00, NULL);
> > +
> > +     ret =3D cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, IMX585_=
MODE_STREAMING, NULL);
> > +     if (ret)
> > +             goto err_rpm_put;
> > +
> > +     dev_dbg(imx585->clientdev, "Streaming started\n");
> > +     usleep_range(IMX585_STREAM_DELAY_US,
> > +                  IMX585_STREAM_DELAY_US + IMX585_STREAM_DELAY_RANGE_U=
S);
> > +
> > +     /* vflip, hflip cannot change during streaming */
> > +     __v4l2_ctrl_grab(imx585->vflip, true);
> > +     __v4l2_ctrl_grab(imx585->hflip, true);
> > +
> > +     return 0;
> > +
> > +err_rpm_put:
> > +     pm_runtime_put_autosuspend(imx585->clientdev);
> > +     return ret;
> > +}
> > +
> > +static int imx585_disable_streams(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *state, u32 pa=
d,
> > +                               u64 streams_mask)
> > +{
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     int ret;
> > +
> > +     ret =3D cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, IMX585_=
MODE_STANDBY, NULL);
> > +     if (ret)
> > +             dev_err(imx585->clientdev, "Failed to stop streaming\n");
> > +
> > +     __v4l2_ctrl_grab(imx585->vflip, false);
> > +     __v4l2_ctrl_grab(imx585->hflip, false);
> > +
> > +     pm_runtime_put_autosuspend(imx585->clientdev);
> > +
> > +     return ret;
> > +}
> > +
> > +/* -------------------------------------------------------------------=
-------
> > + * Power / runtime PM
> > + * -------------------------------------------------------------------=
-------
> > + */
> > +
> > +static int imx585_power_on(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     int ret;
> > +
> > +     dev_dbg(imx585->clientdev, "power_on\n");
> > +
> > +     ret =3D regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->suppli=
es);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to enable regulators\n=
");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(imx585->xclk);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to enable clock\n");
> > +             goto reg_off;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
> > +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
> > +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_U=
S);
> > +     return 0;
> > +
> > +reg_off:
> > +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
> > +     return ret;
> > +}
> > +
> > +static int imx585_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +
> > +     dev_dbg(imx585->clientdev, "power_off\n");
> > +
> > +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
>
> NAK, I wrote you this is broken and you just ignored and sending the same=
.
>
> You are mixing line level with logical level.
>
> There is no way your code actually works, unless you have broken DTS.
> Test your patches correctly (with proper, fixed DTS) and don't send the
> same completely ignoring reviewers.

See how imx219.c works, ask Sony don't ask me.
That is why I ignore your comments on this.

> Best regards,
> Krzysztof

