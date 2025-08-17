Return-Path: <linux-media+bounces-40028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A04DB291F5
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 09:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D13DB4E144A
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 07:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346A11FDE22;
	Sun, 17 Aug 2025 07:15:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E37DA93;
	Sun, 17 Aug 2025 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755414943; cv=none; b=bFFCoDp6V03TTUu6naVPcjfG6GbQoSywmZ1sIwikgJWjyb3zDgLg/+TVm/KV/Wa2mUaFgAh89PzLN4wplyCQrNjPcMuumKeeuvLZg9n+0s3AVa1vGNNab3HyJQsGnb2hZn1qBYPalT3M/NWBqPS+ydcvKeFBwzTc8GrPyPJz8qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755414943; c=relaxed/simple;
	bh=R74fpgHV5bubaaCAJP/uiD9gx/gZdvcLZ2Dn4YbgF+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Szx/EvWqBQgcqPozdaPFFanzGZ+EeLmQDYssmANP1RpqpdWKtutEZZ7n4ugLRbHyTkwPM5FWREiS0gNFVIzAKci1zSUFtVboVZIa6gZ+yD5EBYE4v5uAKHy7ChfbXvyDoSz/gyOiMm8Dvi+kas64tRZj11gJKZdsRcFwcDzAheM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso452369066b.3;
        Sun, 17 Aug 2025 00:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755414940; x=1756019740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msDghKQiEArCForsiHN/x1NxAoQ84ayOH6l5qycWZKI=;
        b=VyVsDRZI5S/G6t4g/PjmA69tm5/A/ieUn+AAEfwzOrllc7k24B5gIyNAz5yFtFCapO
         xndLfzjM7jlJbZ+V4JG7xpv9ktGoJHX8xp19VKRvjQKmvSJOsWBN02MJ5tHyCkO+932W
         ymhe1euMdcTF8ict6b90oLtNW5Rd80gqluhrQSMNzXoaSmkKq9MlT3uG6g7tJsEWAltK
         eA1JGSoFqnya4y0jFsNXxgpszqQetE1tPq4B6QQDx43mJpj3iY1U4Ip/TNi70PPfu7IH
         JAzJ1jiDeN+X0kbPs0krpKibQ4pJvzEpCt8X+0yf1AwSJX84ydv1X0H0mQMWhVDSU3hD
         5h8g==
X-Forwarded-Encrypted: i=1; AJvYcCUP0HA4f2uwa+uEhQfuOHbPu5234NgztJfGtdPODxm5IDjFKuczo6ztItPmyQ6naoPj/887f6hKGu/teJw=@vger.kernel.org, AJvYcCUaDzF/ihwBXjbcoIVokYe65jRYe5KOGH7D3uqhgDhy37ITO/uviwJ3BJZosTj9/FlXG0mkpLwXGYX6W3xo@vger.kernel.org, AJvYcCVYHXm169WWy/bUt/orv43SmLpCTkHpGhlHEl73qc8oyuT8jbC9/o56+gvsDUGnpFBwsJSptzWJmlUP@vger.kernel.org
X-Gm-Message-State: AOJu0YyIVdoamS7cUkOxiR8tbUyrPP/kBDNhlazYOiCj8FNzcbl46QGV
	G8lKVCA0Mx/igTUk8OfZYUf1CjxwCjUpWmcQOkT4W4ODcr2K8x5D4dzlT2SMY196
X-Gm-Gg: ASbGnct8NmRRYhzsL9Yy05Tfpvj+8t0I5ENM0K04s13p9KEkWY0ClPFRGY+mbHRCjCg
	EWX3owo3SrVSAwnY7Be9lN2aTnp2Ut2QzwuuFkp55/2SCg9hjqnzJkZ/3f5+qYrMDd5d2o+SFSh
	yLJa83JPJ7C3NGamq0g9nrFz6zmqXqckOqGZQF3tmvb21iSTfSokKf6ZIv/K3eaBtvN9rRglmvE
	ehSOTidXj/zbVqZ/0FKw3YIQ39QVt63+FAYa39zFLiLUoZwGQriXlHH6snmBGJ9VNMIo1OcXWne
	eASG7NlQVtd3ox8wVU5OQSR6+ExigQyVTqptKDga647xzqv7TjimmsIf/GTG1zux9JSXPh0s/43
	njvmfMO8xBCG8xSBFBQn16eHjQlEursV+tBvslkcVuKYpmA2d+u0jI76aTQ==
X-Google-Smtp-Source: AGHT+IEkdF0VJVnYMb+wWPiWnwW6U+KVzP6A9I+zA5yN5BHG+RS4rb5u0u/UOUHme596FFITYETSAg==
X-Received: by 2002:a17:907:1b26:b0:af1:d32f:3e89 with SMTP id a640c23a62f3a-afcdc328bb7mr749395766b.31.1755414939328;
        Sun, 17 Aug 2025 00:15:39 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd018b54sm530406066b.104.2025.08.17.00.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 00:15:39 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-618b62dbb21so3144938a12.2;
        Sun, 17 Aug 2025 00:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlUZbI1/Q81I682QY+7zUQUoYV+Y8NCsxwQtoH9Dlh5iS3tHKRa33rWmQt2jN8Uq14w7sc06oUrpfS@vger.kernel.org, AJvYcCXDobujuGctW8mXF8NgMITDCepp0EFREgrUwJ+Hq5k77jCi8thUdXkSpne2u++6y3TnMVSL9EYAeyJ5AEPK@vger.kernel.org, AJvYcCXv6J7tiHAfGiGjtbxOLzbd5xUnTsVN/UC3utUlHM7SlwHx2+nwq5XhRk3M50Vc4R4MYNKgQVz5Yop0q3Q=@vger.kernel.org
X-Received: by 2002:a05:6402:430c:b0:615:979c:e8b2 with SMTP id
 4fb4d7f45d1cf-618b056058amr5437479a12.29.1755414938757; Sun, 17 Aug 2025
 00:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816055432.131912-1-will@willwhang.com> <20250816055432.131912-3-will@willwhang.com>
 <7e27b69b-40df-4ac4-aebf-dbd00044b71b@kernel.org> <CAFoNnrxbzcF+YranTL8Von3BkROhq8X=RX5sa90M6PYgS_vjkQ@mail.gmail.com>
 <daa45e3e-84a6-4c39-854a-1429fb68d415@kernel.org> <CAFoNnrw4yRKGL_m0=g14C583o13ptC6e84TN---ABdyeg8jMhg@mail.gmail.com>
 <04fd00bb-beb4-4f35-88fb-bf1cc7691505@kernel.org>
In-Reply-To: <04fd00bb-beb4-4f35-88fb-bf1cc7691505@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Sun, 17 Aug 2025 00:15:26 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxd_2=9aJqo9yQ8bcDsyW9pVRCfmUU6tOHoeX5wEB2AhA@mail.gmail.com>
X-Gm-Features: Ac12FXx6i85Vcrq3vGsLOS4pU-WzsVWk1KJOpcUjg8iVl-rUJIYpZYKz0J8s2v4
Message-ID: <CAFoNnrxd_2=9aJqo9yQ8bcDsyW9pVRCfmUU6tOHoeX5wEB2AhA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: imx585: Add Sony IMX585 image-sensor driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 12:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 17/08/2025 08:46, Will Whang wrote:
> > On Sat, Aug 16, 2025 at 11:10=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 16/08/2025 21:58, Will Whang wrote:
> >>> On Sat, Aug 16, 2025 at 1:04=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 16/08/2025 07:54, Will Whang wrote:
> >>>>> +
> >>>>> +static int imx585_set_ctrl(struct v4l2_ctrl *ctrl)
> >>>>> +{
> >>>>> +     struct imx585 *imx585 =3D container_of(ctrl->handler, struct =
imx585, ctrl_handler);
> >>>>> +     const struct imx585_mode *mode, *mode_list;
> >>>>> +     struct v4l2_subdev_state *state;
> >>>>> +     struct v4l2_mbus_framefmt *fmt;
> >>>>> +     unsigned int num_modes;
> >>>>> +     int ret =3D 0;
> >>>>> +
> >>>>> +     state =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> >>>>> +     fmt =3D v4l2_subdev_state_get_format(state, 0);
> >>>>> +
> >>>>> +     get_mode_table(imx585, fmt->code, &mode_list, &num_modes);
> >>>>> +     mode =3D v4l2_find_nearest_size(mode_list, num_modes, width, =
height,
> >>>>> +                                   fmt->width, fmt->height);
> >>>>> +
> >>>>> +     /* Apply control only when powered (runtime active). */
> >>>>> +     if (!pm_runtime_get_if_active(imx585->clientdev))
> >>>>> +             return 0;
> >>>>> +
> >>>>> +     switch (ctrl->id) {
> >>>>> +     case V4L2_CID_EXPOSURE: {
> >>>>> +             u32 shr =3D (imx585->vmax - ctrl->val) & ~1U; /* SHR =
always a multiple of 2 */
> >>>>> +
> >>>>> +             dev_dbg(imx585->clientdev, "EXPOSURE=3D%u -> SHR=3D%u=
 (VMAX=3D%u HMAX=3D%u)\n",
> >>>>> +                     ctrl->val, shr, imx585->vmax, imx585->hmax);
> >>>>> +
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_SHR, shr=
, NULL);
> >>>>> +             if (ret)
> >>>>> +                     dev_err_ratelimited(imx585->clientdev, "SHR w=
rite failed (%d)\n", ret);
> >>>>> +             break;
> >>>>> +     }
> >>>>> +     case V4L2_CID_ANALOGUE_GAIN:
> >>>>> +             dev_dbg(imx585->clientdev, "ANALOG_GAIN=3D%u\n", ctrl=
->val);
> >>>>
> >>>> Not much improved. Don't debug V4L2 calls.
> >>>>
> >>>> I already commented on this and you just send simialr code. Drop thi=
s
> >>>> completely.
> >>>>
> >>>
> >>> I need to debug V4L2 calls for image quality debugging. I don't
> >>> understand why I can not have dev_dbg().
> >>> What I read from your comments on the previous patch is that you don'=
t
> >>> want to have a noisy driver and I sorta agree with that but for debug
> >>> purposes this is not an issue.
> >>> That is why I move it to dev_dbg instead of removing them, if you
> >>> think this is too noisy, then just don't turn on debugging.
> >>>
> >>
> >>
> >> Because you do not debug useful parts of the driver, but only invocati=
on
> >> of v4l2 controls.
> >>
> >>
> >>>>
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_ANALOG_G=
AIN, ctrl->val, NULL);
> >>>>> +             if (ret)
> >>>>> +                     dev_err_ratelimited(imx585->clientdev, "Gain =
write failed (%d)\n", ret);
> >>>>> +             break;
> >>>>> +     case V4L2_CID_VBLANK: {
> >>>>> +             u32 current_exposure =3D imx585->exposure->cur.val;
> >>>>> +
> >>>>> +             imx585->vmax =3D (mode->height + ctrl->val) & ~1U;
> >>>>> +
> >>>>> +             current_exposure =3D clamp_t(u32, current_exposure,
> >>>>> +                                        IMX585_EXPOSURE_MIN, imx58=
5->vmax - IMX585_SHR_MIN);
> >>>>> +             __v4l2_ctrl_modify_range(imx585->exposure,
> >>>>> +                                      IMX585_EXPOSURE_MIN, imx585-=
>vmax - IMX585_SHR_MIN, 1,
> >>>>> +                                      current_exposure);
> >>>>> +
> >>>>> +             dev_dbg(imx585->clientdev, "VBLANK=3D%u -> VMAX=3D%u\=
n", ctrl->val, imx585->vmax);
> >>>>> +
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_VMAX, im=
x585->vmax, NULL);
> >>>>> +             if (ret)
> >>>>> +                     dev_err_ratelimited(imx585->clientdev, "VMAX =
write failed (%d)\n", ret);
> >>>>> +             break;
> >>>>> +     }
> >>>>> +     case V4L2_CID_HBLANK: {
> >>>>> +             u64 pixel_rate =3D (u64)mode->width * IMX585_PIXEL_RA=
TE;
> >>>>> +             u64 hmax;
> >>>>> +
> >>>>> +             do_div(pixel_rate, mode->min_hmax);
> >>>>> +             hmax =3D (u64)(mode->width + ctrl->val) * IMX585_PIXE=
L_RATE;
> >>>>> +             do_div(hmax, pixel_rate);
> >>>>> +             imx585->hmax =3D (u32)hmax;
> >>>>> +
> >>>>> +             dev_dbg(imx585->clientdev, "HBLANK=3D%u -> HMAX=3D%u\=
n", ctrl->val, imx585->hmax);
> >>>>> +
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_HMAX, im=
x585->hmax, NULL);
> >>>>> +             if (ret)
> >>>>> +                     dev_err_ratelimited(imx585->clientdev, "HMAX =
write failed (%d)\n", ret);
> >>>>> +             break;
> >>>>> +     }
> >>>>> +     case V4L2_CID_HFLIP:
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMODE=
H, ctrl->val, NULL);
> >>>>> +             if (ret)
> >>>>> +                     dev_err_ratelimited(imx585->clientdev, "HFLIP=
 write failed (%d)\n", ret);
> >>>>> +             break;
> >>>>> +     case V4L2_CID_VFLIP:
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMODE=
V, ctrl->val, NULL);
> >>>>> +             if (ret)
> >>>>> +                     dev_err_ratelimited(imx585->clientdev, "VFLIP=
 write failed (%d)\n", ret);
> >>>>> +             break;
> >>>>> +     case V4L2_CID_BRIGHTNESS: {
> >>>>> +             u16 blacklevel =3D min_t(u32, ctrl->val, 4095);
> >>>>> +
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEVEL=
, blacklevel, NULL);
> >>>>> +             if (ret)
> >>>>> +                     dev_err_ratelimited(imx585->clientdev, "BLKLE=
VEL write failed (%d)\n", ret);
> >>>>> +             break;
> >>>>> +     }
> >>>>> +     default:
> >>>>> +             dev_dbg(imx585->clientdev, "Unhandled ctrl %s: id=3D0=
x%x, val=3D0x%x\n",
> >>>>> +                     ctrl->name, ctrl->id, ctrl->val);
> >>>>> +             break;
> >>>>> +     }
> >>>>> +
> >>>>> +     pm_runtime_put(imx585->clientdev);
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static const struct v4l2_ctrl_ops imx585_ctrl_ops =3D {
> >>>>> +     .s_ctrl =3D imx585_set_ctrl,
> >>>>> +};
> >>>>> +
> >>>>> +static int imx585_init_controls(struct imx585 *imx585)
> >>>>> +{
> >>>>> +     struct v4l2_ctrl_handler *hdl =3D &imx585->ctrl_handler;
> >>>>> +     struct v4l2_fwnode_device_properties props;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     ret =3D v4l2_ctrl_handler_init(hdl, 16);
> >>>>> +
> >>>>> +     /* Read-only, updated per mode */
> >>>>> +     imx585->pixel_rate =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_op=
s,
> >>>>> +                                            V4L2_CID_PIXEL_RATE,
> >>>>> +                                            1, UINT_MAX, 1, 1);
> >>>>> +
> >>>>> +     imx585->link_freq =3D
> >>>>> +             v4l2_ctrl_new_int_menu(hdl, &imx585_ctrl_ops, V4L2_CI=
D_LINK_FREQ,
> >>>>> +                                    0, 0, &link_freqs[imx585->link=
_freq_idx]);
> >>>>> +     if (imx585->link_freq)
> >>>>> +             imx585->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONL=
Y;
> >>>>> +
> >>>>> +     imx585->vblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>> +                                        V4L2_CID_VBLANK, 0, 0xFFFF=
F, 1, 0);
> >>>>> +     imx585->hblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>> +                                        V4L2_CID_HBLANK, 0, 0xFFFF=
, 1, 0);
> >>>>> +     imx585->blacklevel =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_op=
s,
> >>>>> +                                            V4L2_CID_BRIGHTNESS, 0=
, 0xFFFF, 1,
> >>>>> +                                            IMX585_BLKLEVEL_DEFAUL=
T);
> >>>>> +
> >>>>> +     imx585->exposure =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>> +                                          V4L2_CID_EXPOSURE,
> >>>>> +                                          IMX585_EXPOSURE_MIN, IMX=
585_EXPOSURE_MAX,
> >>>>> +                                          IMX585_EXPOSURE_STEP, IM=
X585_EXPOSURE_DEFAULT);
> >>>>> +
> >>>>> +     imx585->gain =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops, V4L=
2_CID_ANALOGUE_GAIN,
> >>>>> +                                      IMX585_ANA_GAIN_MIN, IMX585_=
ANA_GAIN_MAX,
> >>>>> +                                      IMX585_ANA_GAIN_STEP, IMX585=
_ANA_GAIN_DEFAULT);
> >>>>> +
> >>>>> +     imx585->hflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>> +                                       V4L2_CID_HFLIP, 0, 1, 1, 0)=
;
> >>>>> +     imx585->vflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>> +                                       V4L2_CID_VFLIP, 0, 1, 1, 0)=
;
> >>>>> +
> >>>>> +     if (hdl->error) {
> >>>>> +             ret =3D hdl->error;
> >>>>> +             dev_err(imx585->clientdev, "control init failed (%d)\=
n", ret);
> >>>>> +             goto err_free;
> >>>>> +     }
> >>>>> +
> >>>>> +     ret =3D v4l2_fwnode_device_parse(imx585->clientdev, &props);
> >>>>> +     if (ret)
> >>>>> +             goto err_free;
> >>>>> +
> >>>>> +     ret =3D v4l2_ctrl_new_fwnode_properties(hdl, &imx585_ctrl_ops=
, &props);
> >>>>> +     if (ret)
> >>>>> +             goto err_free;
> >>>>> +
> >>>>> +     imx585->sd.ctrl_handler =3D hdl;
> >>>>> +     return 0;
> >>>>> +
> >>>>> +err_free:
> >>>>> +     v4l2_ctrl_handler_free(hdl);
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static void imx585_free_controls(struct imx585 *imx585)
> >>>>> +{
> >>>>> +     v4l2_ctrl_handler_free(imx585->sd.ctrl_handler);
> >>>>> +}
> >>>>> +
> >>>>> +/* ---------------------------------------------------------------=
-----------
> >>>>> + * Pad ops / formats
> >>>>> + * ---------------------------------------------------------------=
-----------
> >>>>> + */
> >>>>> +
> >>>>> +static int imx585_enum_mbus_code(struct v4l2_subdev *sd,
> >>>>> +                              struct v4l2_subdev_state *sd_state,
> >>>>> +                              struct v4l2_subdev_mbus_code_enum *c=
ode)
> >>>>> +{
> >>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>> +     unsigned int entries;
> >>>>> +     const u32 *tbl;
> >>>>> +
> >>>>> +     if (imx585->mono) {
> >>>>> +             if (code->index)
> >>>>> +                     return -EINVAL;
> >>>>> +             code->code =3D MEDIA_BUS_FMT_Y12_1X12;
> >>>>> +             return 0;
> >>>>> +     }
> >>>>> +
> >>>>> +     tbl =3D color_codes;
> >>>>> +     entries =3D ARRAY_SIZE(color_codes) / 4;
> >>>>> +
> >>>>> +     if (code->index >=3D entries)
> >>>>> +             return -EINVAL;
> >>>>> +
> >>>>> +     code->code =3D imx585_get_format_code(imx585, tbl[code->index=
 * 4]);
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int imx585_enum_frame_size(struct v4l2_subdev *sd,
> >>>>> +                               struct v4l2_subdev_state *sd_state,
> >>>>> +                               struct v4l2_subdev_frame_size_enum =
*fse)
> >>>>> +{
> >>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>> +     const struct imx585_mode *mode_list;
> >>>>> +     unsigned int num_modes;
> >>>>> +
> >>>>> +     get_mode_table(imx585, fse->code, &mode_list, &num_modes);
> >>>>> +     if (fse->index >=3D num_modes)
> >>>>> +             return -EINVAL;
> >>>>> +     if (fse->code !=3D imx585_get_format_code(imx585, fse->code))
> >>>>> +             return -EINVAL;
> >>>>> +
> >>>>> +     fse->min_width  =3D mode_list[fse->index].width;
> >>>>> +     fse->max_width  =3D fse->min_width;
> >>>>> +     fse->min_height =3D mode_list[fse->index].height;
> >>>>> +     fse->max_height =3D fse->min_height;
> >>>>> +
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int imx585_set_pad_format(struct v4l2_subdev *sd,
> >>>>> +                              struct v4l2_subdev_state *sd_state,
> >>>>> +                              struct v4l2_subdev_format *fmt)
> >>>>> +{
> >>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>> +     const struct imx585_mode *mode_list, *mode;
> >>>>> +     unsigned int num_modes;
> >>>>> +     struct v4l2_mbus_framefmt *format;
> >>>>> +
> >>>>> +     get_mode_table(imx585, fmt->format.code, &mode_list, &num_mod=
es);
> >>>>> +     mode =3D v4l2_find_nearest_size(mode_list, num_modes, width, =
height,
> >>>>> +                                   fmt->format.width, fmt->format.=
height);
> >>>>> +
> >>>>> +     fmt->format.width        =3D mode->width;
> >>>>> +     fmt->format.height       =3D mode->height;
> >>>>> +     fmt->format.field        =3D V4L2_FIELD_NONE;
> >>>>> +     fmt->format.colorspace   =3D V4L2_COLORSPACE_RAW;
> >>>>> +     fmt->format.ycbcr_enc    =3D V4L2_YCBCR_ENC_601;
> >>>>> +     fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> >>>>> +     fmt->format.xfer_func    =3D V4L2_XFER_FUNC_NONE;
> >>>>> +
> >>>>> +     format =3D v4l2_subdev_state_get_format(sd_state, 0);
> >>>>> +
> >>>>> +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> >>>>> +             imx585_set_framing_limits(imx585, mode);
> >>>>> +
> >>>>> +     *format =3D fmt->format;
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +/* ---------------------------------------------------------------=
-----------
> >>>>> + * Stream on/off
> >>>>> + * ---------------------------------------------------------------=
-----------
> >>>>> + */
> >>>>> +
> >>>>> +static int imx585_enable_streams(struct v4l2_subdev *sd,
> >>>>> +                              struct v4l2_subdev_state *state, u32=
 pad,
> >>>>> +                              u64 streams_mask)
> >>>>> +{
> >>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>> +     const struct imx585_mode *mode_list, *mode;
> >>>>> +     struct v4l2_subdev_state *st;
> >>>>> +     struct v4l2_mbus_framefmt *fmt;
> >>>>> +     unsigned int n_modes;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     ret =3D pm_runtime_get_sync(imx585->clientdev);
> >>>>> +     if (ret < 0) {
> >>>>> +             pm_runtime_put_noidle(imx585->clientdev);
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     ret =3D cci_multi_reg_write(imx585->regmap, common_regs,
> >>>>> +                               ARRAY_SIZE(common_regs), NULL);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(imx585->clientdev, "Failed to write common se=
ttings\n");
> >>>>> +             goto err_rpm_put;
> >>>>> +     }
> >>>>> +
> >>>>> +     ret =3D cci_write(imx585->regmap, IMX585_INCK_SEL, imx585->in=
ck_sel_val, NULL);
> >>>>> +     if (!ret)
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEVEL=
, IMX585_BLKLEVEL_DEFAULT, NULL);
> >>>>> +     if (!ret)
> >>>>> +             ret =3D cci_write(imx585->regmap, IMX585_DATARATE_SEL=
,
> >>>>> +                             link_freqs_reg_value[imx585->link_fre=
q_idx], NULL);
> >>>>> +     if (ret)
> >>>>> +             goto err_rpm_put;
> >>>>> +
> >>>>> +     ret =3D cci_write(imx585->regmap, IMX585_LANEMODE,
> >>>>> +                     (imx585->lane_count =3D=3D 2) ? 0x01 : 0x03, =
NULL);
> >>>>> +     if (ret)
> >>>>> +             goto err_rpm_put;
> >>>>> +
> >>>>> +     /* Mono bin flag (datasheet: 0x01 mono, 0x00 color) */
> >>>>> +     ret =3D cci_write(imx585->regmap, IMX585_BIN_MODE, imx585->mo=
no ? 0x01 : 0x00, NULL);
> >>>>> +     if (ret)
> >>>>> +             goto err_rpm_put;
> >>>>> +
> >>>>> +     /* Sync configuration */
> >>>>> +     if (imx585->sync_mode =3D=3D SYNC_INT_FOLLOWER) {
> >>>>> +             dev_dbg(imx585->clientdev, "Internal sync follower: X=
VS input\n");
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x01, N=
ULL);
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x03, N=
ULL); /* XHS out, XVS in */
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x08=
, NULL); /* disable XVS OUT */
> >>>>> +     } else if (imx585->sync_mode =3D=3D SYNC_INT_LEADER) {
> >>>>> +             dev_dbg(imx585->clientdev, "Internal sync leader: XVS=
/XHS output\n");
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x00, N=
ULL);
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x00, N=
ULL); /* XHS/XVS out */
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x0A=
, NULL);
> >>>>> +     } else {
> >>>>> +             dev_dbg(imx585->clientdev, "Follower: XVS/XHS input\n=
");
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x0F, N=
ULL); /* inputs */
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x00=
, NULL);
> >>>>> +     }
> >>>>> +
> >>>>> +     imx585->common_regs_written =3D true;
> >>>>> +
> >>>>> +     /* Select mode */
> >>>>> +     st  =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> >>>>> +     fmt =3D v4l2_subdev_state_get_format(st, 0);
> >>>>> +
> >>>>> +     get_mode_table(imx585, fmt->code, &mode_list, &n_modes);
> >>>>> +     mode =3D v4l2_find_nearest_size(mode_list, n_modes, width, he=
ight,
> >>>>> +                                   fmt->width, fmt->height);
> >>>>> +
> >>>>> +     ret =3D cci_multi_reg_write(imx585->regmap, mode->reg_list.re=
gs,
> >>>>> +                               mode->reg_list.num_of_regs, NULL);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(imx585->clientdev, "Failed to write mode regi=
sters\n");
> >>>>> +             goto err_rpm_put;
> >>>>> +     }
> >>>>> +
> >>>>> +     /* Disable digital clamp */
> >>>>> +     cci_write(imx585->regmap, IMX585_REG_DIGITAL_CLAMP, 0x00, NUL=
L);
> >>>>> +
> >>>>> +     /* Apply user controls after writing the base tables */
> >>>>> +     ret =3D __v4l2_ctrl_handler_setup(imx585->sd.ctrl_handler);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(imx585->clientdev, "Control handler setup fai=
led\n");
> >>>>> +             goto err_rpm_put;
> >>>>> +     }
> >>>>> +
> >>>>> +     if (imx585->sync_mode !=3D SYNC_EXTERNAL)
> >>>>> +             cci_write(imx585->regmap, IMX585_REG_XMSTA, 0x00, NUL=
L);
> >>>>> +
> >>>>> +     ret =3D cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, IMX=
585_MODE_STREAMING, NULL);
> >>>>> +     if (ret)
> >>>>> +             goto err_rpm_put;
> >>>>> +
> >>>>> +     dev_dbg(imx585->clientdev, "Streaming started\n");
> >>>>> +     usleep_range(IMX585_STREAM_DELAY_US,
> >>>>> +                  IMX585_STREAM_DELAY_US + IMX585_STREAM_DELAY_RAN=
GE_US);
> >>>>> +
> >>>>> +     /* vflip, hflip cannot change during streaming */
> >>>>> +     __v4l2_ctrl_grab(imx585->vflip, true);
> >>>>> +     __v4l2_ctrl_grab(imx585->hflip, true);
> >>>>> +
> >>>>> +     return 0;
> >>>>> +
> >>>>> +err_rpm_put:
> >>>>> +     pm_runtime_put_autosuspend(imx585->clientdev);
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static int imx585_disable_streams(struct v4l2_subdev *sd,
> >>>>> +                               struct v4l2_subdev_state *state, u3=
2 pad,
> >>>>> +                               u64 streams_mask)
> >>>>> +{
> >>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     ret =3D cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, IMX=
585_MODE_STANDBY, NULL);
> >>>>> +     if (ret)
> >>>>> +             dev_err(imx585->clientdev, "Failed to stop streaming\=
n");
> >>>>> +
> >>>>> +     __v4l2_ctrl_grab(imx585->vflip, false);
> >>>>> +     __v4l2_ctrl_grab(imx585->hflip, false);
> >>>>> +
> >>>>> +     pm_runtime_put_autosuspend(imx585->clientdev);
> >>>>> +
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +/* ---------------------------------------------------------------=
-----------
> >>>>> + * Power / runtime PM
> >>>>> + * ---------------------------------------------------------------=
-----------
> >>>>> + */
> >>>>> +
> >>>>> +static int imx585_power_on(struct device *dev)
> >>>>> +{
> >>>>> +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     dev_dbg(imx585->clientdev, "power_on\n");
> >>>>> +
> >>>>> +     ret =3D regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->su=
pplies);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(imx585->clientdev, "Failed to enable regulato=
rs\n");
> >>>>> +             return ret;
> >>>>> +     }
> >>>>> +
> >>>>> +     ret =3D clk_prepare_enable(imx585->xclk);
> >>>>> +     if (ret) {
> >>>>> +             dev_err(imx585->clientdev, "Failed to enable clock\n"=
);
> >>>>> +             goto reg_off;
> >>>>> +     }
> >>>>> +
> >>>>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
> >>>>> +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
> >>>>> +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RAN=
GE_US);
> >>>>> +     return 0;
> >>>>> +
> >>>>> +reg_off:
> >>>>> +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies)=
;
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +static int imx585_power_off(struct device *dev)
> >>>>> +{
> >>>>> +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>> +
> >>>>> +     dev_dbg(imx585->clientdev, "power_off\n");
> >>>>> +
> >>>>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
> >>>>
> >>>> NAK, I wrote you this is broken and you just ignored and sending the=
 same.
> >>>>
> >>>> You are mixing line level with logical level.
> >>>>
> >>>> There is no way your code actually works, unless you have broken DTS=
.
> >>>> Test your patches correctly (with proper, fixed DTS) and don't send =
the
> >>>> same completely ignoring reviewers.
> >>>
> >>> See how imx219.c works, ask Sony don't ask me.
> >>
> >> So there is a bug, you claim that you may do the same bug and then say=
:
> >>
> >>> That is why I ignore your comments on this.
> >>
> >> and ignoring comments that your code is buggy. Great!
> >>
> >> If you ever decide to not follow reviewer's opinion, you MUST respond
> >> and you MUST say WHY in the changelog.
> >>
> >> Nothing that happened.
> >>
> >> But regardless, this is still buggy and this is still NAK.
> >>
> >> NAK means: Don't send the same code.
> >
> > What on earth are you talking about?
>
> Why are you sending me this in two copies?
>
> Do you understand the difference betweeen logical level and line level?
>
> > See imx274.c,imx283.c,imx334.c,imx335.c,imx412.c,imx415.c.
> > Your claim that this is buggy doesn't make sense when all other Sony
> > imx drivers are using the same logic.
> >
> >
> > imx274.c:
> > /*
> >  * imx274_reset - Function called to reset the sensor
> >  * @priv: Pointer to device structure
> >  * @rst: Input value for determining the sensor's end state after reset
> >  *
> >  * Set the senor in reset and then
> >  * if rst =3D 0, keep it in reset;
> >  * if rst =3D 1, bring it out of reset.
>
> Buggy driver, another old poor code.
>
>
> >  *
> >  */
> > static void imx274_reset(struct stimx274 *priv, int rst)
> > {
> > gpiod_set_value_cansleep(priv->reset_gpio, 0);
> > usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> > gpiod_set_value_cansleep(priv->reset_gpio, !!rst);
> > usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> > }
> >
> >
> > imx283.c:
> >
>
> Way you paste code makes it very unreadable. It's easier to point
> web.git references.
>
>
> Anyway, look also here:
>
> >
> > static void imx415_power_off(struct imx415 *sensor)
> > {
> > clk_disable_unprepare(sensor->clk);
> > gpiod_set_value_cansleep(sensor->reset, 1);
>
>
> But if you claim that reset has to be asserted for this device to work -
> and that's what your code is doing - then this is not a reset line.
>
> Do you understand what is the meaning of asserted reset (or to assert
> reset line)?

And in all the examples I provided to you, this is the only IMX415
that has the logic inverted.
I can apply the same logic and say this is buggy and wrong.

Do you understand this is writing the GPIO directly and has nothing to
do with what you think it should be?
Ask Sony why they use logic high =3D normal mode and logic low =3D reset.

Quote your previous comments:
> This is not how resets work. Logical reset value high means it is
> asserted and device does not work.

> Read carefully your datasheet. Because if you claim above this is not a
> reset line, but some other.

imx283.c is the latest one landed in 2024, can you read it carefully
and reply again?


> Best regards,
> Krzysztof

