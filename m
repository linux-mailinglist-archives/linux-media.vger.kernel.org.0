Return-Path: <linux-media+bounces-40025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C1BB291E4
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 08:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D06653BD46E
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 06:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D5D23A98D;
	Sun, 17 Aug 2025 06:46:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117BFA926;
	Sun, 17 Aug 2025 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755413192; cv=none; b=sYxFBfCAE1yL+7jjlY3tBnJCKv1IFLug1Ws/xTx5rQE7HE6k7a449/bDgEDshjwqEA7WVKNIutJymUxOpEdWf9k9S1SfinlIjFFQDpOGhuCD3ejeMxoe8zM+5yaa4RgmLDLGy42pzKIbsIWo7gwZ3sS95s8qXXWIYk+JpFwR2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755413192; c=relaxed/simple;
	bh=YMSgLM0mF3QpldnUXp62uN4eW/I/q3Jei4UEHEn7jOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQUz5DF+gkGaJC/ujeayn9RUu2uT+UxksXdp8Qg2W2Rj9LqliBBUb6jwEkLGdp1AdxVWZTsHlxPl0Rcd5NGMN1hUZpVhfo5tMW1n3zoKdkONJOMWeDoqjjkE4MvxgzajSbW9Z9vI/1Sib4/QIY+JEKPnDVr7R5i+w4g7xnYAd5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb61f6044so544575466b.0;
        Sat, 16 Aug 2025 23:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755413188; x=1756017988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4iE49UKl+uVHD2k6pLjlBYb4I57eWu7vmtJvnTXVm8=;
        b=Odqgcuygtx/SR2ZdvSr99tnAqiYyXaVQmbV1dxo4hDaC6xGwFx+nTUZ6/vL75R3jZC
         j8DQR/Var34GET46t45O+mPGYH/p1VKwNfzD54jLBL0DfHQ7uy0lDmOyJuITIMu6A+d0
         021BIYPXYbK1BckYm64nI/FxyjjdzoaRg3GVeN7riU2RYi6uwi60iu6+DW2bYTUxmswZ
         qV4TpV/mV49QtAhnTCdNVXenNgm0cdBPNRlx3bmDRG+4X9+uTmg6bTW+rZHDoxbkTzoC
         9/j5TnSj8y+oJd5PqwxD5GK/Ri2PqfDvkDs/7k3XB2Oh6spFysc4uSXuA9q8AsCqFsS9
         WcbA==
X-Forwarded-Encrypted: i=1; AJvYcCW10rdci1TmQ5H03mAc9bgVhy+rBb3FSoDc6jHmPRq9pu7NWQ5B4PUpMovDcijk1xHQ/2kFbgnrg+mR@vger.kernel.org, AJvYcCXC8n8RNw70zaJS5pUyjEKz+pocxtMgqDQJsl4wc9iO1D7B15pn00/MgNbDjuUzyRIW+C6/0569kqFHGaJp@vger.kernel.org, AJvYcCXLhEP5Pgko1zfubBcKeW01HuTsCpMU5+0w2i/0rj12Oa2gzLR/IUQr88kSeruZ84ebMnzPPY4IZ0jobek=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWU7lxmGQQmcSA/QlaZv22a72fPaD+zEENFbSKh6G0v34LIXOS
	FbJcSjnTH5ufpaRj0eFe/NnsVhhPohKI/A2S4vApGTw2KDPyyF62cmgCinXfZZ6t
X-Gm-Gg: ASbGncufuBtd/n5E0CQQzEdh+vCLSuBCMw6xrW5e0VSEwAajelPdElnqC3GNL4kyYTn
	+XUAkKYiqmAVYWY2Mzvwq6mylUlq5aqv4hqgCyDvigdvacnEUiM/EPkS1gjnlSnLxS6aA7Yg9a4
	wsin372r6+1HqHI5tM6SWtAf+BehxFZv19aF9UsQ6oUL+J4We9WdW1F7ax/GHlju/L60PVueiXb
	wb1jMgxyoPC6WaWE+l0piXkgv/R1pLwszfPB7wZT1rz1GfNRJqEINJlF+BS6p8q9eB5hmxnRRXC
	xc3OQlAnHf9ov94F4UUD6pP9lA6FX+parhMvqF47JXfjnKiMwv2mHIQliOfG0AklQj2Hqbt0VZf
	wYWRsn2BBgXokt11WWU48vdVH7k/1PChQEKvJhOLia5Avg6paKwbtFDBn+w==
X-Google-Smtp-Source: AGHT+IFFIReg9N6niZq1ZOjIcxbP4RibuHxdiaMNSL7Y3EY4x60tmPfoZ93BsDkD/3E1NEjoWKLXsw==
X-Received: by 2002:a17:906:cc10:b0:af9:9e50:470 with SMTP id a640c23a62f3a-afcdb2dc6afmr690655766b.28.1755413188012;
        Sat, 16 Aug 2025 23:46:28 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53f54sm535485566b.24.2025.08.16.23.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 23:46:27 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61868d83059so6877256a12.0;
        Sat, 16 Aug 2025 23:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJdJb+ARqF0gP4MPK0GMRXyZFVTBtYtk0ZQsjfRAc8HNqlWW5tXkLaSy7NqOETfyPdRVlGsTvhXUi7ip4=@vger.kernel.org, AJvYcCUbD01QKWxpUcQ8kLYwbLby4PXSVUUbChBcZtcPlVVJ8OQpuFdqmoDhCkxckfrUVD1nm3CQ+8cYlL7cQg4g@vger.kernel.org, AJvYcCXokVVkOQbi09/Tf1vTu26NSbzFadCB0GVI02C8JRaEhT2AXeO8WvY0UEI7NUIWAb+nu8J477FAK8Fn@vger.kernel.org
X-Received: by 2002:a05:6402:40d2:b0:618:1705:83fb with SMTP id
 4fb4d7f45d1cf-618aebd4493mr7065681a12.4.1755413187389; Sat, 16 Aug 2025
 23:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816055432.131912-1-will@willwhang.com> <20250816055432.131912-3-will@willwhang.com>
 <7e27b69b-40df-4ac4-aebf-dbd00044b71b@kernel.org> <CAFoNnrxbzcF+YranTL8Von3BkROhq8X=RX5sa90M6PYgS_vjkQ@mail.gmail.com>
 <daa45e3e-84a6-4c39-854a-1429fb68d415@kernel.org>
In-Reply-To: <daa45e3e-84a6-4c39-854a-1429fb68d415@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Sat, 16 Aug 2025 23:46:15 -0700
X-Gmail-Original-Message-ID: <CAFoNnrw4yRKGL_m0=g14C583o13ptC6e84TN---ABdyeg8jMhg@mail.gmail.com>
X-Gm-Features: Ac12FXxOhzUIWHwvAenZm1RlxbjwEP1ls27GONYV_FpWmwfaA5GZDV3u-8IktZI
Message-ID: <CAFoNnrw4yRKGL_m0=g14C583o13ptC6e84TN---ABdyeg8jMhg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: imx585: Add Sony IMX585 image-sensor driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 11:10=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/08/2025 21:58, Will Whang wrote:
> > On Sat, Aug 16, 2025 at 1:04=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 16/08/2025 07:54, Will Whang wrote:
> >>> +
> >>> +static int imx585_set_ctrl(struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +     struct imx585 *imx585 =3D container_of(ctrl->handler, struct im=
x585, ctrl_handler);
> >>> +     const struct imx585_mode *mode, *mode_list;
> >>> +     struct v4l2_subdev_state *state;
> >>> +     struct v4l2_mbus_framefmt *fmt;
> >>> +     unsigned int num_modes;
> >>> +     int ret =3D 0;
> >>> +
> >>> +     state =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> >>> +     fmt =3D v4l2_subdev_state_get_format(state, 0);
> >>> +
> >>> +     get_mode_table(imx585, fmt->code, &mode_list, &num_modes);
> >>> +     mode =3D v4l2_find_nearest_size(mode_list, num_modes, width, he=
ight,
> >>> +                                   fmt->width, fmt->height);
> >>> +
> >>> +     /* Apply control only when powered (runtime active). */
> >>> +     if (!pm_runtime_get_if_active(imx585->clientdev))
> >>> +             return 0;
> >>> +
> >>> +     switch (ctrl->id) {
> >>> +     case V4L2_CID_EXPOSURE: {
> >>> +             u32 shr =3D (imx585->vmax - ctrl->val) & ~1U; /* SHR al=
ways a multiple of 2 */
> >>> +
> >>> +             dev_dbg(imx585->clientdev, "EXPOSURE=3D%u -> SHR=3D%u (=
VMAX=3D%u HMAX=3D%u)\n",
> >>> +                     ctrl->val, shr, imx585->vmax, imx585->hmax);
> >>> +
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_SHR, shr, =
NULL);
> >>> +             if (ret)
> >>> +                     dev_err_ratelimited(imx585->clientdev, "SHR wri=
te failed (%d)\n", ret);
> >>> +             break;
> >>> +     }
> >>> +     case V4L2_CID_ANALOGUE_GAIN:
> >>> +             dev_dbg(imx585->clientdev, "ANALOG_GAIN=3D%u\n", ctrl->=
val);
> >>
> >> Not much improved. Don't debug V4L2 calls.
> >>
> >> I already commented on this and you just send simialr code. Drop this
> >> completely.
> >>
> >
> > I need to debug V4L2 calls for image quality debugging. I don't
> > understand why I can not have dev_dbg().
> > What I read from your comments on the previous patch is that you don't
> > want to have a noisy driver and I sorta agree with that but for debug
> > purposes this is not an issue.
> > That is why I move it to dev_dbg instead of removing them, if you
> > think this is too noisy, then just don't turn on debugging.
> >
>
>
> Because you do not debug useful parts of the driver, but only invocation
> of v4l2 controls.
>
>
> >>
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_ANALOG_GAI=
N, ctrl->val, NULL);
> >>> +             if (ret)
> >>> +                     dev_err_ratelimited(imx585->clientdev, "Gain wr=
ite failed (%d)\n", ret);
> >>> +             break;
> >>> +     case V4L2_CID_VBLANK: {
> >>> +             u32 current_exposure =3D imx585->exposure->cur.val;
> >>> +
> >>> +             imx585->vmax =3D (mode->height + ctrl->val) & ~1U;
> >>> +
> >>> +             current_exposure =3D clamp_t(u32, current_exposure,
> >>> +                                        IMX585_EXPOSURE_MIN, imx585-=
>vmax - IMX585_SHR_MIN);
> >>> +             __v4l2_ctrl_modify_range(imx585->exposure,
> >>> +                                      IMX585_EXPOSURE_MIN, imx585->v=
max - IMX585_SHR_MIN, 1,
> >>> +                                      current_exposure);
> >>> +
> >>> +             dev_dbg(imx585->clientdev, "VBLANK=3D%u -> VMAX=3D%u\n"=
, ctrl->val, imx585->vmax);
> >>> +
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_VMAX, imx5=
85->vmax, NULL);
> >>> +             if (ret)
> >>> +                     dev_err_ratelimited(imx585->clientdev, "VMAX wr=
ite failed (%d)\n", ret);
> >>> +             break;
> >>> +     }
> >>> +     case V4L2_CID_HBLANK: {
> >>> +             u64 pixel_rate =3D (u64)mode->width * IMX585_PIXEL_RATE=
;
> >>> +             u64 hmax;
> >>> +
> >>> +             do_div(pixel_rate, mode->min_hmax);
> >>> +             hmax =3D (u64)(mode->width + ctrl->val) * IMX585_PIXEL_=
RATE;
> >>> +             do_div(hmax, pixel_rate);
> >>> +             imx585->hmax =3D (u32)hmax;
> >>> +
> >>> +             dev_dbg(imx585->clientdev, "HBLANK=3D%u -> HMAX=3D%u\n"=
, ctrl->val, imx585->hmax);
> >>> +
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_HMAX, imx5=
85->hmax, NULL);
> >>> +             if (ret)
> >>> +                     dev_err_ratelimited(imx585->clientdev, "HMAX wr=
ite failed (%d)\n", ret);
> >>> +             break;
> >>> +     }
> >>> +     case V4L2_CID_HFLIP:
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMODEH,=
 ctrl->val, NULL);
> >>> +             if (ret)
> >>> +                     dev_err_ratelimited(imx585->clientdev, "HFLIP w=
rite failed (%d)\n", ret);
> >>> +             break;
> >>> +     case V4L2_CID_VFLIP:
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMODEV,=
 ctrl->val, NULL);
> >>> +             if (ret)
> >>> +                     dev_err_ratelimited(imx585->clientdev, "VFLIP w=
rite failed (%d)\n", ret);
> >>> +             break;
> >>> +     case V4L2_CID_BRIGHTNESS: {
> >>> +             u16 blacklevel =3D min_t(u32, ctrl->val, 4095);
> >>> +
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEVEL, =
blacklevel, NULL);
> >>> +             if (ret)
> >>> +                     dev_err_ratelimited(imx585->clientdev, "BLKLEVE=
L write failed (%d)\n", ret);
> >>> +             break;
> >>> +     }
> >>> +     default:
> >>> +             dev_dbg(imx585->clientdev, "Unhandled ctrl %s: id=3D0x%=
x, val=3D0x%x\n",
> >>> +                     ctrl->name, ctrl->id, ctrl->val);
> >>> +             break;
> >>> +     }
> >>> +
> >>> +     pm_runtime_put(imx585->clientdev);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static const struct v4l2_ctrl_ops imx585_ctrl_ops =3D {
> >>> +     .s_ctrl =3D imx585_set_ctrl,
> >>> +};
> >>> +
> >>> +static int imx585_init_controls(struct imx585 *imx585)
> >>> +{
> >>> +     struct v4l2_ctrl_handler *hdl =3D &imx585->ctrl_handler;
> >>> +     struct v4l2_fwnode_device_properties props;
> >>> +     int ret;
> >>> +
> >>> +     ret =3D v4l2_ctrl_handler_init(hdl, 16);
> >>> +
> >>> +     /* Read-only, updated per mode */
> >>> +     imx585->pixel_rate =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>> +                                            V4L2_CID_PIXEL_RATE,
> >>> +                                            1, UINT_MAX, 1, 1);
> >>> +
> >>> +     imx585->link_freq =3D
> >>> +             v4l2_ctrl_new_int_menu(hdl, &imx585_ctrl_ops, V4L2_CID_=
LINK_FREQ,
> >>> +                                    0, 0, &link_freqs[imx585->link_f=
req_idx]);
> >>> +     if (imx585->link_freq)
> >>> +             imx585->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> >>> +
> >>> +     imx585->vblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>> +                                        V4L2_CID_VBLANK, 0, 0xFFFFF,=
 1, 0);
> >>> +     imx585->hblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>> +                                        V4L2_CID_HBLANK, 0, 0xFFFF, =
1, 0);
> >>> +     imx585->blacklevel =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>> +                                            V4L2_CID_BRIGHTNESS, 0, =
0xFFFF, 1,
> >>> +                                            IMX585_BLKLEVEL_DEFAULT)=
;
> >>> +
> >>> +     imx585->exposure =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>> +                                          V4L2_CID_EXPOSURE,
> >>> +                                          IMX585_EXPOSURE_MIN, IMX58=
5_EXPOSURE_MAX,
> >>> +                                          IMX585_EXPOSURE_STEP, IMX5=
85_EXPOSURE_DEFAULT);
> >>> +
> >>> +     imx585->gain =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops, V4L2_=
CID_ANALOGUE_GAIN,
> >>> +                                      IMX585_ANA_GAIN_MIN, IMX585_AN=
A_GAIN_MAX,
> >>> +                                      IMX585_ANA_GAIN_STEP, IMX585_A=
NA_GAIN_DEFAULT);
> >>> +
> >>> +     imx585->hflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>> +                                       V4L2_CID_HFLIP, 0, 1, 1, 0);
> >>> +     imx585->vflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>> +                                       V4L2_CID_VFLIP, 0, 1, 1, 0);
> >>> +
> >>> +     if (hdl->error) {
> >>> +             ret =3D hdl->error;
> >>> +             dev_err(imx585->clientdev, "control init failed (%d)\n"=
, ret);
> >>> +             goto err_free;
> >>> +     }
> >>> +
> >>> +     ret =3D v4l2_fwnode_device_parse(imx585->clientdev, &props);
> >>> +     if (ret)
> >>> +             goto err_free;
> >>> +
> >>> +     ret =3D v4l2_ctrl_new_fwnode_properties(hdl, &imx585_ctrl_ops, =
&props);
> >>> +     if (ret)
> >>> +             goto err_free;
> >>> +
> >>> +     imx585->sd.ctrl_handler =3D hdl;
> >>> +     return 0;
> >>> +
> >>> +err_free:
> >>> +     v4l2_ctrl_handler_free(hdl);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static void imx585_free_controls(struct imx585 *imx585)
> >>> +{
> >>> +     v4l2_ctrl_handler_free(imx585->sd.ctrl_handler);
> >>> +}
> >>> +
> >>> +/* -----------------------------------------------------------------=
---------
> >>> + * Pad ops / formats
> >>> + * -----------------------------------------------------------------=
---------
> >>> + */
> >>> +
> >>> +static int imx585_enum_mbus_code(struct v4l2_subdev *sd,
> >>> +                              struct v4l2_subdev_state *sd_state,
> >>> +                              struct v4l2_subdev_mbus_code_enum *cod=
e)
> >>> +{
> >>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>> +     unsigned int entries;
> >>> +     const u32 *tbl;
> >>> +
> >>> +     if (imx585->mono) {
> >>> +             if (code->index)
> >>> +                     return -EINVAL;
> >>> +             code->code =3D MEDIA_BUS_FMT_Y12_1X12;
> >>> +             return 0;
> >>> +     }
> >>> +
> >>> +     tbl =3D color_codes;
> >>> +     entries =3D ARRAY_SIZE(color_codes) / 4;
> >>> +
> >>> +     if (code->index >=3D entries)
> >>> +             return -EINVAL;
> >>> +
> >>> +     code->code =3D imx585_get_format_code(imx585, tbl[code->index *=
 4]);
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int imx585_enum_frame_size(struct v4l2_subdev *sd,
> >>> +                               struct v4l2_subdev_state *sd_state,
> >>> +                               struct v4l2_subdev_frame_size_enum *f=
se)
> >>> +{
> >>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>> +     const struct imx585_mode *mode_list;
> >>> +     unsigned int num_modes;
> >>> +
> >>> +     get_mode_table(imx585, fse->code, &mode_list, &num_modes);
> >>> +     if (fse->index >=3D num_modes)
> >>> +             return -EINVAL;
> >>> +     if (fse->code !=3D imx585_get_format_code(imx585, fse->code))
> >>> +             return -EINVAL;
> >>> +
> >>> +     fse->min_width  =3D mode_list[fse->index].width;
> >>> +     fse->max_width  =3D fse->min_width;
> >>> +     fse->min_height =3D mode_list[fse->index].height;
> >>> +     fse->max_height =3D fse->min_height;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int imx585_set_pad_format(struct v4l2_subdev *sd,
> >>> +                              struct v4l2_subdev_state *sd_state,
> >>> +                              struct v4l2_subdev_format *fmt)
> >>> +{
> >>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>> +     const struct imx585_mode *mode_list, *mode;
> >>> +     unsigned int num_modes;
> >>> +     struct v4l2_mbus_framefmt *format;
> >>> +
> >>> +     get_mode_table(imx585, fmt->format.code, &mode_list, &num_modes=
);
> >>> +     mode =3D v4l2_find_nearest_size(mode_list, num_modes, width, he=
ight,
> >>> +                                   fmt->format.width, fmt->format.he=
ight);
> >>> +
> >>> +     fmt->format.width        =3D mode->width;
> >>> +     fmt->format.height       =3D mode->height;
> >>> +     fmt->format.field        =3D V4L2_FIELD_NONE;
> >>> +     fmt->format.colorspace   =3D V4L2_COLORSPACE_RAW;
> >>> +     fmt->format.ycbcr_enc    =3D V4L2_YCBCR_ENC_601;
> >>> +     fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> >>> +     fmt->format.xfer_func    =3D V4L2_XFER_FUNC_NONE;
> >>> +
> >>> +     format =3D v4l2_subdev_state_get_format(sd_state, 0);
> >>> +
> >>> +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> >>> +             imx585_set_framing_limits(imx585, mode);
> >>> +
> >>> +     *format =3D fmt->format;
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +/* -----------------------------------------------------------------=
---------
> >>> + * Stream on/off
> >>> + * -----------------------------------------------------------------=
---------
> >>> + */
> >>> +
> >>> +static int imx585_enable_streams(struct v4l2_subdev *sd,
> >>> +                              struct v4l2_subdev_state *state, u32 p=
ad,
> >>> +                              u64 streams_mask)
> >>> +{
> >>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>> +     const struct imx585_mode *mode_list, *mode;
> >>> +     struct v4l2_subdev_state *st;
> >>> +     struct v4l2_mbus_framefmt *fmt;
> >>> +     unsigned int n_modes;
> >>> +     int ret;
> >>> +
> >>> +     ret =3D pm_runtime_get_sync(imx585->clientdev);
> >>> +     if (ret < 0) {
> >>> +             pm_runtime_put_noidle(imx585->clientdev);
> >>> +             return ret;
> >>> +     }
> >>> +
> >>> +     ret =3D cci_multi_reg_write(imx585->regmap, common_regs,
> >>> +                               ARRAY_SIZE(common_regs), NULL);
> >>> +     if (ret) {
> >>> +             dev_err(imx585->clientdev, "Failed to write common sett=
ings\n");
> >>> +             goto err_rpm_put;
> >>> +     }
> >>> +
> >>> +     ret =3D cci_write(imx585->regmap, IMX585_INCK_SEL, imx585->inck=
_sel_val, NULL);
> >>> +     if (!ret)
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEVEL, =
IMX585_BLKLEVEL_DEFAULT, NULL);
> >>> +     if (!ret)
> >>> +             ret =3D cci_write(imx585->regmap, IMX585_DATARATE_SEL,
> >>> +                             link_freqs_reg_value[imx585->link_freq_=
idx], NULL);
> >>> +     if (ret)
> >>> +             goto err_rpm_put;
> >>> +
> >>> +     ret =3D cci_write(imx585->regmap, IMX585_LANEMODE,
> >>> +                     (imx585->lane_count =3D=3D 2) ? 0x01 : 0x03, NU=
LL);
> >>> +     if (ret)
> >>> +             goto err_rpm_put;
> >>> +
> >>> +     /* Mono bin flag (datasheet: 0x01 mono, 0x00 color) */
> >>> +     ret =3D cci_write(imx585->regmap, IMX585_BIN_MODE, imx585->mono=
 ? 0x01 : 0x00, NULL);
> >>> +     if (ret)
> >>> +             goto err_rpm_put;
> >>> +
> >>> +     /* Sync configuration */
> >>> +     if (imx585->sync_mode =3D=3D SYNC_INT_FOLLOWER) {
> >>> +             dev_dbg(imx585->clientdev, "Internal sync follower: XVS=
 input\n");
> >>> +             cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x01, NUL=
L);
> >>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x03, NUL=
L); /* XHS out, XVS in */
> >>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x08, =
NULL); /* disable XVS OUT */
> >>> +     } else if (imx585->sync_mode =3D=3D SYNC_INT_LEADER) {
> >>> +             dev_dbg(imx585->clientdev, "Internal sync leader: XVS/X=
HS output\n");
> >>> +             cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x00, NUL=
L);
> >>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x00, NUL=
L); /* XHS/XVS out */
> >>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x0A, =
NULL);
> >>> +     } else {
> >>> +             dev_dbg(imx585->clientdev, "Follower: XVS/XHS input\n")=
;
> >>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x0F, NUL=
L); /* inputs */
> >>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x00, =
NULL);
> >>> +     }
> >>> +
> >>> +     imx585->common_regs_written =3D true;
> >>> +
> >>> +     /* Select mode */
> >>> +     st  =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> >>> +     fmt =3D v4l2_subdev_state_get_format(st, 0);
> >>> +
> >>> +     get_mode_table(imx585, fmt->code, &mode_list, &n_modes);
> >>> +     mode =3D v4l2_find_nearest_size(mode_list, n_modes, width, heig=
ht,
> >>> +                                   fmt->width, fmt->height);
> >>> +
> >>> +     ret =3D cci_multi_reg_write(imx585->regmap, mode->reg_list.regs=
,
> >>> +                               mode->reg_list.num_of_regs, NULL);
> >>> +     if (ret) {
> >>> +             dev_err(imx585->clientdev, "Failed to write mode regist=
ers\n");
> >>> +             goto err_rpm_put;
> >>> +     }
> >>> +
> >>> +     /* Disable digital clamp */
> >>> +     cci_write(imx585->regmap, IMX585_REG_DIGITAL_CLAMP, 0x00, NULL)=
;
> >>> +
> >>> +     /* Apply user controls after writing the base tables */
> >>> +     ret =3D __v4l2_ctrl_handler_setup(imx585->sd.ctrl_handler);
> >>> +     if (ret) {
> >>> +             dev_err(imx585->clientdev, "Control handler setup faile=
d\n");
> >>> +             goto err_rpm_put;
> >>> +     }
> >>> +
> >>> +     if (imx585->sync_mode !=3D SYNC_EXTERNAL)
> >>> +             cci_write(imx585->regmap, IMX585_REG_XMSTA, 0x00, NULL)=
;
> >>> +
> >>> +     ret =3D cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, IMX58=
5_MODE_STREAMING, NULL);
> >>> +     if (ret)
> >>> +             goto err_rpm_put;
> >>> +
> >>> +     dev_dbg(imx585->clientdev, "Streaming started\n");
> >>> +     usleep_range(IMX585_STREAM_DELAY_US,
> >>> +                  IMX585_STREAM_DELAY_US + IMX585_STREAM_DELAY_RANGE=
_US);
> >>> +
> >>> +     /* vflip, hflip cannot change during streaming */
> >>> +     __v4l2_ctrl_grab(imx585->vflip, true);
> >>> +     __v4l2_ctrl_grab(imx585->hflip, true);
> >>> +
> >>> +     return 0;
> >>> +
> >>> +err_rpm_put:
> >>> +     pm_runtime_put_autosuspend(imx585->clientdev);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static int imx585_disable_streams(struct v4l2_subdev *sd,
> >>> +                               struct v4l2_subdev_state *state, u32 =
pad,
> >>> +                               u64 streams_mask)
> >>> +{
> >>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>> +     int ret;
> >>> +
> >>> +     ret =3D cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, IMX58=
5_MODE_STANDBY, NULL);
> >>> +     if (ret)
> >>> +             dev_err(imx585->clientdev, "Failed to stop streaming\n"=
);
> >>> +
> >>> +     __v4l2_ctrl_grab(imx585->vflip, false);
> >>> +     __v4l2_ctrl_grab(imx585->hflip, false);
> >>> +
> >>> +     pm_runtime_put_autosuspend(imx585->clientdev);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/* -----------------------------------------------------------------=
---------
> >>> + * Power / runtime PM
> >>> + * -----------------------------------------------------------------=
---------
> >>> + */
> >>> +
> >>> +static int imx585_power_on(struct device *dev)
> >>> +{
> >>> +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>> +     int ret;
> >>> +
> >>> +     dev_dbg(imx585->clientdev, "power_on\n");
> >>> +
> >>> +     ret =3D regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->supp=
lies);
> >>> +     if (ret) {
> >>> +             dev_err(imx585->clientdev, "Failed to enable regulators=
\n");
> >>> +             return ret;
> >>> +     }
> >>> +
> >>> +     ret =3D clk_prepare_enable(imx585->xclk);
> >>> +     if (ret) {
> >>> +             dev_err(imx585->clientdev, "Failed to enable clock\n");
> >>> +             goto reg_off;
> >>> +     }
> >>> +
> >>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
> >>> +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
> >>> +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE=
_US);
> >>> +     return 0;
> >>> +
> >>> +reg_off:
> >>> +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static int imx585_power_off(struct device *dev)
> >>> +{
> >>> +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>> +
> >>> +     dev_dbg(imx585->clientdev, "power_off\n");
> >>> +
> >>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
> >>
> >> NAK, I wrote you this is broken and you just ignored and sending the s=
ame.
> >>
> >> You are mixing line level with logical level.
> >>
> >> There is no way your code actually works, unless you have broken DTS.
> >> Test your patches correctly (with proper, fixed DTS) and don't send th=
e
> >> same completely ignoring reviewers.
> >
> > See how imx219.c works, ask Sony don't ask me.
>
> So there is a bug, you claim that you may do the same bug and then say:
>
> > That is why I ignore your comments on this.
>
> and ignoring comments that your code is buggy. Great!
>
> If you ever decide to not follow reviewer's opinion, you MUST respond
> and you MUST say WHY in the changelog.
>
> Nothing that happened.
>
> But regardless, this is still buggy and this is still NAK.
>
> NAK means: Don't send the same code.

What on earth are you talking about?
See imx274.c,imx283.c,imx334.c,imx335.c,imx412.c,imx415.c.
Your claim that this is buggy doesn't make sense when all other Sony
imx drivers are using the same logic.


imx274.c:
/*
 * imx274_reset - Function called to reset the sensor
 * @priv: Pointer to device structure
 * @rst: Input value for determining the sensor's end state after reset
 *
 * Set the senor in reset and then
 * if rst =3D 0, keep it in reset;
 * if rst =3D 1, bring it out of reset.
 *
 */
static void imx274_reset(struct stimx274 *priv, int rst)
{
gpiod_set_value_cansleep(priv->reset_gpio, 0);
usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
gpiod_set_value_cansleep(priv->reset_gpio, !!rst);
usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
}


imx283.c:

/* Power/clock management functions */
static int imx283_power_on(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx283 *imx283 =3D to_imx283(sd);
int ret;

ret =3D regulator_bulk_enable(ARRAY_SIZE(imx283_supply_name),
    imx283->supplies);
if (ret) {
dev_err(imx283->dev, "failed to enable regulators\n");
return ret;
}

ret =3D clk_prepare_enable(imx283->xclk);
if (ret) {
dev_err(imx283->dev, "failed to enable clock\n");
goto reg_off;
}

gpiod_set_value_cansleep(imx283->reset_gpio, 0);

usleep_range(IMX283_XCLR_MIN_DELAY_US,
     IMX283_XCLR_MIN_DELAY_US + IMX283_XCLR_DELAY_RANGE_US);

return 0;

reg_off:
regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supplies);
return ret;
}

static int imx283_power_off(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx283 *imx283 =3D to_imx283(sd);

gpiod_set_value_cansleep(imx283->reset_gpio, 1);
regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supplies);
clk_disable_unprepare(imx283->xclk);

return 0;
}


imx334.c:

/**
 * imx334_power_on() - Sensor power on sequence
 * @dev: pointer to i2c device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx334_power_on(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx334 *imx334 =3D to_imx334(sd);
int ret;

gpiod_set_value_cansleep(imx334->reset_gpio, 1);

ret =3D clk_prepare_enable(imx334->inclk);
if (ret) {
dev_err(imx334->dev, "fail to enable inclk\n");
goto error_reset;
}

usleep_range(18000, 20000);

return 0;

error_reset:
gpiod_set_value_cansleep(imx334->reset_gpio, 0);

return ret;
}

/**
 * imx334_power_off() - Sensor power off sequence
 * @dev: pointer to i2c device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx334_power_off(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx334 *imx334 =3D to_imx334(sd);

gpiod_set_value_cansleep(imx334->reset_gpio, 0);

clk_disable_unprepare(imx334->inclk);

return 0;
}



imx335.c:

/**
 * imx335_power_on() - Sensor power on sequence
 * @dev: pointer to i2c device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx335_power_on(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx335 *imx335 =3D to_imx335(sd);
int ret;

ret =3D regulator_bulk_enable(ARRAY_SIZE(imx335_supply_name),
    imx335->supplies);
if (ret) {
dev_err(dev, "%s: failed to enable regulators\n",
__func__);
return ret;
}

usleep_range(500, 550); /* Tlow */

gpiod_set_value_cansleep(imx335->reset_gpio, 0);

ret =3D clk_prepare_enable(imx335->inclk);
if (ret) {
dev_err(imx335->dev, "fail to enable inclk\n");
goto error_reset;
}

usleep_range(20, 22); /* T4 */

return 0;

error_reset:
gpiod_set_value_cansleep(imx335->reset_gpio, 1);
regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);

return ret;
}

/**
 * imx335_power_off() - Sensor power off sequence
 * @dev: pointer to i2c device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx335_power_off(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx335 *imx335 =3D to_imx335(sd);

gpiod_set_value_cansleep(imx335->reset_gpio, 1);
clk_disable_unprepare(imx335->inclk);
regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);

return 0;
}


imx412.c
/**
 * imx412_power_on() - Sensor power on sequence
 * @dev: pointer to i2c device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx412_power_on(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx412 *imx412 =3D to_imx412(sd);
int ret;

ret =3D regulator_bulk_enable(ARRAY_SIZE(imx412_supply_names),
    imx412->supplies);
if (ret < 0) {
dev_err(dev, "failed to enable regulators\n");
return ret;
}

gpiod_set_value_cansleep(imx412->reset_gpio, 0);

ret =3D clk_prepare_enable(imx412->inclk);
if (ret) {
dev_err(imx412->dev, "fail to enable inclk\n");
goto error_reset;
}

usleep_range(1000, 1200);

return 0;

error_reset:
gpiod_set_value_cansleep(imx412->reset_gpio, 1);
regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
       imx412->supplies);

return ret;
}

/**
 * imx412_power_off() - Sensor power off sequence
 * @dev: pointer to i2c device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx412_power_off(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx412 *imx412 =3D to_imx412(sd);

clk_disable_unprepare(imx412->inclk);

gpiod_set_value_cansleep(imx412->reset_gpio, 1);

regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
       imx412->supplies);

return 0;
}

imx415.c:
static int imx415_power_on(struct imx415 *sensor)
{
int ret;

ret =3D regulator_bulk_enable(ARRAY_SIZE(sensor->supplies),
    sensor->supplies);
if (ret < 0)
return ret;

gpiod_set_value_cansleep(sensor->reset, 0);

udelay(1);

ret =3D clk_prepare_enable(sensor->clk);
if (ret < 0)
goto err_reset;

/*
* Data sheet states that 20 us are required before communication start,
* but this doesn't work in all cases. Use 100 us to be on the safe
* side.
*/
usleep_range(100, 200);

return 0;

err_reset:
gpiod_set_value_cansleep(sensor->reset, 1);
regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
return ret;
}

static void imx415_power_off(struct imx415 *sensor)
{
clk_disable_unprepare(sensor->clk);
gpiod_set_value_cansleep(sensor->reset, 1);
regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
}

> Best regards,
> Krzysztof

