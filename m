Return-Path: <linux-media+bounces-40031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DF9B29219
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 09:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5D4E1B23F8E
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 07:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7716245022;
	Sun, 17 Aug 2025 07:54:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BE51F1534;
	Sun, 17 Aug 2025 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755417247; cv=none; b=bc8gec+ahxWZoD/cWR2Lzh40usg8vxzS+WiPV/WYHUGHIIvkCSVYEsrhHGBXtoZCXhabllRoGJ3Ob3I5MXPScjncAUBeFSNCdbvLl12I6bI6+kNpYIo/dBkVwx/4ESuuY1lBwThzsO5RBVG4nndM0Pi8QgU2NpKXuqYlItctSwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755417247; c=relaxed/simple;
	bh=dFNEH3DBQRb6DeG4VgSzzHMhq4yfSuddQasF4f8shtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5w3iuUrXK4kqWMjpqIARNBwpyAQ4gEEK2pwF7VG2gzuuTyJCxIFCU16SSwAYHZjMq0AwSTjv6av6bN/ibNURfABOG/SoV9VVEuCpnTS6CeuqLNjwJ7fZgYIqlfOocrSnSE62jESW17wc+gDRrOypiOo89e6ZDqpVgiPJDA35uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so4227466a12.2;
        Sun, 17 Aug 2025 00:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755417243; x=1756022043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvFPvw3ODLOuGGOyDSjZpsXiHQ4JYKNbBYwRUilxaEI=;
        b=ISTGT79+Wxs4xei1RIJCEq9VLEbMQ65pUnPsviln6R3Lq1QBoBpR91lUjV1sF6Ntzx
         JqpLCWcYemAIqNXnYsf0jOFOnaQKTAuZ1emYEVdWKX6a2qBiii82qf/RRh+DKJV5ERD0
         QRAztA9XjAw6lZz/hxyXQc0ujj+CNd9iQYY1eYUG9FvpQljnb/X1dEHuh2ebXdZrRj6p
         /T+bLuz3kdVGRKug3aum2TP1hDtgXPFrua/ZYfzP10bUP5EwWEmFFuFXOofJrvCGlhWB
         Nz5AY2sHQIA7tq50cY0OP2hGUD7PoLElToHyhbasFSHqs1CNBYlUaFewiGV35+a+2UMq
         GgGg==
X-Forwarded-Encrypted: i=1; AJvYcCUbiYczoAExbo+tDQf45fWB3Cox+qOMXC6biJGqA5ERpx9NasvZNoH8eTjgmfwgzkAJmPuyedP5d2WPVDzg@vger.kernel.org, AJvYcCWijuyBm/rc1s3uOdpICNf41yR0shHgNzsjY72wXLS3vM9Nd+J4kgEGI1hUhqThardbE1lguAlUDgfV@vger.kernel.org, AJvYcCXYBDuDYJYgc0aYFNzpfhlDv/m9c54foBmAIzvICHMYI0ZjN9MPKIzrbB8yfnRWFX3THKcnbLXt3rkHrHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyglsZ4hQuxxWk9pvtDwzDcsfA4L63YbWm7q1ff/6YZUE9YKtR6
	m6x2NMyqdnd4RUOgSBsc1AyBWkHrN2GTFOb5ilDGJrKaL9bGWd7dxDjUdtdu7lkF
X-Gm-Gg: ASbGncsz64MwzPW3ZUan+C/0lMikx5uPJWjkCYIVOiyc34Gmog6sHZpJPcR5kQt1W6y
	Gg/nrwThCbwPNvi1SAT5Ixiqzr0VCIeoWyMkeRLPzABBFwbT3FwOCIBs6AKtf0Ts/8Wxs37MFMd
	WDSdfkAYsMt+vOfzwVFWFlft179nqROvs6gcibGgCNu6l59V6YzP76P+dpMVDyFyyqizsOVMVEv
	AdQu8yJ+7Gc+8kylESZtN1tpYlit94WnNJWVyzpNb9o0CMoblcHPhQeRqBxwLGYj3To4gMjvt9v
	1If/NEpb1woplhODgt/mdfOvK8tLRhb/+thLiUPYDAoKmoIGUURXptGkCyioOYrijqWBI+f/hel
	W2/9FScCeFxlyx79ItoO/ASdZv4NmtsbtJ8akSDUNSywqoT9+vOL7hO9wJQ==
X-Google-Smtp-Source: AGHT+IHOM4lsak4FnM3O1288uN2ewq9i1MGuYnbciRt8ebAHLRqn42B1X3lseHWTDl/I9ncV4hCOLQ==
X-Received: by 2002:a05:6402:13d2:b0:615:9d94:2934 with SMTP id 4fb4d7f45d1cf-618b053ae77mr7739597a12.10.1755417242781;
        Sun, 17 Aug 2025 00:54:02 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9d31c1sm4830499a12.2.2025.08.17.00.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 00:54:02 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61a2a5b06cdso882937a12.1;
        Sun, 17 Aug 2025 00:54:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeggnHYscxj5IFv2vA1XT4WW1oG/UoeU6Bhj4KquM/Sm+iQVpg1S+LeG7a6koYLwg3y4bR7UfMO0idPaM=@vger.kernel.org, AJvYcCX+mtEdsfvcDeWrq+prkMujk89Z/vsJwihMbTUYPIHciYVTI2X3fOFtYlkVTgmk5emA6TeIpKXdaFUCsL0N@vger.kernel.org, AJvYcCXMN9Ryr2KrPTCk7RstbMNRVmTb25Sm1dxPCRf6HuulWZDXLcv5qgJZwjf1jzako26wNwaUnKVBoSXk@vger.kernel.org
X-Received: by 2002:a05:6402:35cb:b0:615:cc03:e6ab with SMTP id
 4fb4d7f45d1cf-618b052b625mr6208270a12.2.1755417242131; Sun, 17 Aug 2025
 00:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816055432.131912-1-will@willwhang.com> <20250816055432.131912-3-will@willwhang.com>
 <7e27b69b-40df-4ac4-aebf-dbd00044b71b@kernel.org> <CAFoNnrxbzcF+YranTL8Von3BkROhq8X=RX5sa90M6PYgS_vjkQ@mail.gmail.com>
 <daa45e3e-84a6-4c39-854a-1429fb68d415@kernel.org> <CAFoNnrw4yRKGL_m0=g14C583o13ptC6e84TN---ABdyeg8jMhg@mail.gmail.com>
 <04fd00bb-beb4-4f35-88fb-bf1cc7691505@kernel.org> <CAFoNnrxd_2=9aJqo9yQ8bcDsyW9pVRCfmUU6tOHoeX5wEB2AhA@mail.gmail.com>
 <11e35902-a19a-44b2-b816-15a495048d41@kernel.org>
In-Reply-To: <11e35902-a19a-44b2-b816-15a495048d41@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Sun, 17 Aug 2025 00:53:49 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxT83nz0qxf8HTapqOXuEQ0Vh+RbxyqRGQy_sJp9nzpAg@mail.gmail.com>
X-Gm-Features: Ac12FXziY5B7hT1FP4aLM9Y-5ly6Z4APwPKg1LIjWscoB6HMYs2D6Nm-u3tPjhE
Message-ID: <CAFoNnrxT83nz0qxf8HTapqOXuEQ0Vh+RbxyqRGQy_sJp9nzpAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: imx585: Add Sony IMX585 image-sensor driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 12:35=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 17/08/2025 09:15, Will Whang wrote:
> > On Sun, Aug 17, 2025 at 12:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 17/08/2025 08:46, Will Whang wrote:
> >>> On Sat, Aug 16, 2025 at 11:10=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> >>>>
> >>>> On 16/08/2025 21:58, Will Whang wrote:
> >>>>> On Sat, Aug 16, 2025 at 1:04=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> >>>>>>
> >>>>>> On 16/08/2025 07:54, Will Whang wrote:
> >>>>>>> +
> >>>>>>> +static int imx585_set_ctrl(struct v4l2_ctrl *ctrl)
> >>>>>>> +{
> >>>>>>> +     struct imx585 *imx585 =3D container_of(ctrl->handler, struc=
t imx585, ctrl_handler);
> >>>>>>> +     const struct imx585_mode *mode, *mode_list;
> >>>>>>> +     struct v4l2_subdev_state *state;
> >>>>>>> +     struct v4l2_mbus_framefmt *fmt;
> >>>>>>> +     unsigned int num_modes;
> >>>>>>> +     int ret =3D 0;
> >>>>>>> +
> >>>>>>> +     state =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> >>>>>>> +     fmt =3D v4l2_subdev_state_get_format(state, 0);
> >>>>>>> +
> >>>>>>> +     get_mode_table(imx585, fmt->code, &mode_list, &num_modes);
> >>>>>>> +     mode =3D v4l2_find_nearest_size(mode_list, num_modes, width=
, height,
> >>>>>>> +                                   fmt->width, fmt->height);
> >>>>>>> +
> >>>>>>> +     /* Apply control only when powered (runtime active). */
> >>>>>>> +     if (!pm_runtime_get_if_active(imx585->clientdev))
> >>>>>>> +             return 0;
> >>>>>>> +
> >>>>>>> +     switch (ctrl->id) {
> >>>>>>> +     case V4L2_CID_EXPOSURE: {
> >>>>>>> +             u32 shr =3D (imx585->vmax - ctrl->val) & ~1U; /* SH=
R always a multiple of 2 */
> >>>>>>> +
> >>>>>>> +             dev_dbg(imx585->clientdev, "EXPOSURE=3D%u -> SHR=3D=
%u (VMAX=3D%u HMAX=3D%u)\n",
> >>>>>>> +                     ctrl->val, shr, imx585->vmax, imx585->hmax)=
;
> >>>>>>> +
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_SHR, s=
hr, NULL);
> >>>>>>> +             if (ret)
> >>>>>>> +                     dev_err_ratelimited(imx585->clientdev, "SHR=
 write failed (%d)\n", ret);
> >>>>>>> +             break;
> >>>>>>> +     }
> >>>>>>> +     case V4L2_CID_ANALOGUE_GAIN:
> >>>>>>> +             dev_dbg(imx585->clientdev, "ANALOG_GAIN=3D%u\n", ct=
rl->val);
> >>>>>>
> >>>>>> Not much improved. Don't debug V4L2 calls.
> >>>>>>
> >>>>>> I already commented on this and you just send simialr code. Drop t=
his
> >>>>>> completely.
> >>>>>>
> >>>>>
> >>>>> I need to debug V4L2 calls for image quality debugging. I don't
> >>>>> understand why I can not have dev_dbg().
> >>>>> What I read from your comments on the previous patch is that you do=
n't
> >>>>> want to have a noisy driver and I sorta agree with that but for deb=
ug
> >>>>> purposes this is not an issue.
> >>>>> That is why I move it to dev_dbg instead of removing them, if you
> >>>>> think this is too noisy, then just don't turn on debugging.
> >>>>>
> >>>>
> >>>>
> >>>> Because you do not debug useful parts of the driver, but only invoca=
tion
> >>>> of v4l2 controls.
> >>>>
> >>>>
> >>>>>>
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_ANALOG=
_GAIN, ctrl->val, NULL);
> >>>>>>> +             if (ret)
> >>>>>>> +                     dev_err_ratelimited(imx585->clientdev, "Gai=
n write failed (%d)\n", ret);
> >>>>>>> +             break;
> >>>>>>> +     case V4L2_CID_VBLANK: {
> >>>>>>> +             u32 current_exposure =3D imx585->exposure->cur.val;
> >>>>>>> +
> >>>>>>> +             imx585->vmax =3D (mode->height + ctrl->val) & ~1U;
> >>>>>>> +
> >>>>>>> +             current_exposure =3D clamp_t(u32, current_exposure,
> >>>>>>> +                                        IMX585_EXPOSURE_MIN, imx=
585->vmax - IMX585_SHR_MIN);
> >>>>>>> +             __v4l2_ctrl_modify_range(imx585->exposure,
> >>>>>>> +                                      IMX585_EXPOSURE_MIN, imx58=
5->vmax - IMX585_SHR_MIN, 1,
> >>>>>>> +                                      current_exposure);
> >>>>>>> +
> >>>>>>> +             dev_dbg(imx585->clientdev, "VBLANK=3D%u -> VMAX=3D%=
u\n", ctrl->val, imx585->vmax);
> >>>>>>> +
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_VMAX, =
imx585->vmax, NULL);
> >>>>>>> +             if (ret)
> >>>>>>> +                     dev_err_ratelimited(imx585->clientdev, "VMA=
X write failed (%d)\n", ret);
> >>>>>>> +             break;
> >>>>>>> +     }
> >>>>>>> +     case V4L2_CID_HBLANK: {
> >>>>>>> +             u64 pixel_rate =3D (u64)mode->width * IMX585_PIXEL_=
RATE;
> >>>>>>> +             u64 hmax;
> >>>>>>> +
> >>>>>>> +             do_div(pixel_rate, mode->min_hmax);
> >>>>>>> +             hmax =3D (u64)(mode->width + ctrl->val) * IMX585_PI=
XEL_RATE;
> >>>>>>> +             do_div(hmax, pixel_rate);
> >>>>>>> +             imx585->hmax =3D (u32)hmax;
> >>>>>>> +
> >>>>>>> +             dev_dbg(imx585->clientdev, "HBLANK=3D%u -> HMAX=3D%=
u\n", ctrl->val, imx585->hmax);
> >>>>>>> +
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_HMAX, =
imx585->hmax, NULL);
> >>>>>>> +             if (ret)
> >>>>>>> +                     dev_err_ratelimited(imx585->clientdev, "HMA=
X write failed (%d)\n", ret);
> >>>>>>> +             break;
> >>>>>>> +     }
> >>>>>>> +     case V4L2_CID_HFLIP:
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMO=
DEH, ctrl->val, NULL);
> >>>>>>> +             if (ret)
> >>>>>>> +                     dev_err_ratelimited(imx585->clientdev, "HFL=
IP write failed (%d)\n", ret);
> >>>>>>> +             break;
> >>>>>>> +     case V4L2_CID_VFLIP:
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_FLIP_WINMO=
DEV, ctrl->val, NULL);
> >>>>>>> +             if (ret)
> >>>>>>> +                     dev_err_ratelimited(imx585->clientdev, "VFL=
IP write failed (%d)\n", ret);
> >>>>>>> +             break;
> >>>>>>> +     case V4L2_CID_BRIGHTNESS: {
> >>>>>>> +             u16 blacklevel =3D min_t(u32, ctrl->val, 4095);
> >>>>>>> +
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEV=
EL, blacklevel, NULL);
> >>>>>>> +             if (ret)
> >>>>>>> +                     dev_err_ratelimited(imx585->clientdev, "BLK=
LEVEL write failed (%d)\n", ret);
> >>>>>>> +             break;
> >>>>>>> +     }
> >>>>>>> +     default:
> >>>>>>> +             dev_dbg(imx585->clientdev, "Unhandled ctrl %s: id=
=3D0x%x, val=3D0x%x\n",
> >>>>>>> +                     ctrl->name, ctrl->id, ctrl->val);
> >>>>>>> +             break;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     pm_runtime_put(imx585->clientdev);
> >>>>>>> +     return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static const struct v4l2_ctrl_ops imx585_ctrl_ops =3D {
> >>>>>>> +     .s_ctrl =3D imx585_set_ctrl,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +static int imx585_init_controls(struct imx585 *imx585)
> >>>>>>> +{
> >>>>>>> +     struct v4l2_ctrl_handler *hdl =3D &imx585->ctrl_handler;
> >>>>>>> +     struct v4l2_fwnode_device_properties props;
> >>>>>>> +     int ret;
> >>>>>>> +
> >>>>>>> +     ret =3D v4l2_ctrl_handler_init(hdl, 16);
> >>>>>>> +
> >>>>>>> +     /* Read-only, updated per mode */
> >>>>>>> +     imx585->pixel_rate =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_=
ops,
> >>>>>>> +                                            V4L2_CID_PIXEL_RATE,
> >>>>>>> +                                            1, UINT_MAX, 1, 1);
> >>>>>>> +
> >>>>>>> +     imx585->link_freq =3D
> >>>>>>> +             v4l2_ctrl_new_int_menu(hdl, &imx585_ctrl_ops, V4L2_=
CID_LINK_FREQ,
> >>>>>>> +                                    0, 0, &link_freqs[imx585->li=
nk_freq_idx]);
> >>>>>>> +     if (imx585->link_freq)
> >>>>>>> +             imx585->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_O=
NLY;
> >>>>>>> +
> >>>>>>> +     imx585->vblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>>>> +                                        V4L2_CID_VBLANK, 0, 0xFF=
FFF, 1, 0);
> >>>>>>> +     imx585->hblank =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>>>> +                                        V4L2_CID_HBLANK, 0, 0xFF=
FF, 1, 0);
> >>>>>>> +     imx585->blacklevel =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_=
ops,
> >>>>>>> +                                            V4L2_CID_BRIGHTNESS,=
 0, 0xFFFF, 1,
> >>>>>>> +                                            IMX585_BLKLEVEL_DEFA=
ULT);
> >>>>>>> +
> >>>>>>> +     imx585->exposure =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_op=
s,
> >>>>>>> +                                          V4L2_CID_EXPOSURE,
> >>>>>>> +                                          IMX585_EXPOSURE_MIN, I=
MX585_EXPOSURE_MAX,
> >>>>>>> +                                          IMX585_EXPOSURE_STEP, =
IMX585_EXPOSURE_DEFAULT);
> >>>>>>> +
> >>>>>>> +     imx585->gain =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops, V=
4L2_CID_ANALOGUE_GAIN,
> >>>>>>> +                                      IMX585_ANA_GAIN_MIN, IMX58=
5_ANA_GAIN_MAX,
> >>>>>>> +                                      IMX585_ANA_GAIN_STEP, IMX5=
85_ANA_GAIN_DEFAULT);
> >>>>>>> +
> >>>>>>> +     imx585->hflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>>>> +                                       V4L2_CID_HFLIP, 0, 1, 1, =
0);
> >>>>>>> +     imx585->vflip =3D v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> >>>>>>> +                                       V4L2_CID_VFLIP, 0, 1, 1, =
0);
> >>>>>>> +
> >>>>>>> +     if (hdl->error) {
> >>>>>>> +             ret =3D hdl->error;
> >>>>>>> +             dev_err(imx585->clientdev, "control init failed (%d=
)\n", ret);
> >>>>>>> +             goto err_free;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     ret =3D v4l2_fwnode_device_parse(imx585->clientdev, &props)=
;
> >>>>>>> +     if (ret)
> >>>>>>> +             goto err_free;
> >>>>>>> +
> >>>>>>> +     ret =3D v4l2_ctrl_new_fwnode_properties(hdl, &imx585_ctrl_o=
ps, &props);
> >>>>>>> +     if (ret)
> >>>>>>> +             goto err_free;
> >>>>>>> +
> >>>>>>> +     imx585->sd.ctrl_handler =3D hdl;
> >>>>>>> +     return 0;
> >>>>>>> +
> >>>>>>> +err_free:
> >>>>>>> +     v4l2_ctrl_handler_free(hdl);
> >>>>>>> +     return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static void imx585_free_controls(struct imx585 *imx585)
> >>>>>>> +{
> >>>>>>> +     v4l2_ctrl_handler_free(imx585->sd.ctrl_handler);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +/* -------------------------------------------------------------=
-------------
> >>>>>>> + * Pad ops / formats
> >>>>>>> + * -------------------------------------------------------------=
-------------
> >>>>>>> + */
> >>>>>>> +
> >>>>>>> +static int imx585_enum_mbus_code(struct v4l2_subdev *sd,
> >>>>>>> +                              struct v4l2_subdev_state *sd_state=
,
> >>>>>>> +                              struct v4l2_subdev_mbus_code_enum =
*code)
> >>>>>>> +{
> >>>>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>>>> +     unsigned int entries;
> >>>>>>> +     const u32 *tbl;
> >>>>>>> +
> >>>>>>> +     if (imx585->mono) {
> >>>>>>> +             if (code->index)
> >>>>>>> +                     return -EINVAL;
> >>>>>>> +             code->code =3D MEDIA_BUS_FMT_Y12_1X12;
> >>>>>>> +             return 0;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     tbl =3D color_codes;
> >>>>>>> +     entries =3D ARRAY_SIZE(color_codes) / 4;
> >>>>>>> +
> >>>>>>> +     if (code->index >=3D entries)
> >>>>>>> +             return -EINVAL;
> >>>>>>> +
> >>>>>>> +     code->code =3D imx585_get_format_code(imx585, tbl[code->ind=
ex * 4]);
> >>>>>>> +     return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int imx585_enum_frame_size(struct v4l2_subdev *sd,
> >>>>>>> +                               struct v4l2_subdev_state *sd_stat=
e,
> >>>>>>> +                               struct v4l2_subdev_frame_size_enu=
m *fse)
> >>>>>>> +{
> >>>>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>>>> +     const struct imx585_mode *mode_list;
> >>>>>>> +     unsigned int num_modes;
> >>>>>>> +
> >>>>>>> +     get_mode_table(imx585, fse->code, &mode_list, &num_modes);
> >>>>>>> +     if (fse->index >=3D num_modes)
> >>>>>>> +             return -EINVAL;
> >>>>>>> +     if (fse->code !=3D imx585_get_format_code(imx585, fse->code=
))
> >>>>>>> +             return -EINVAL;
> >>>>>>> +
> >>>>>>> +     fse->min_width  =3D mode_list[fse->index].width;
> >>>>>>> +     fse->max_width  =3D fse->min_width;
> >>>>>>> +     fse->min_height =3D mode_list[fse->index].height;
> >>>>>>> +     fse->max_height =3D fse->min_height;
> >>>>>>> +
> >>>>>>> +     return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int imx585_set_pad_format(struct v4l2_subdev *sd,
> >>>>>>> +                              struct v4l2_subdev_state *sd_state=
,
> >>>>>>> +                              struct v4l2_subdev_format *fmt)
> >>>>>>> +{
> >>>>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>>>> +     const struct imx585_mode *mode_list, *mode;
> >>>>>>> +     unsigned int num_modes;
> >>>>>>> +     struct v4l2_mbus_framefmt *format;
> >>>>>>> +
> >>>>>>> +     get_mode_table(imx585, fmt->format.code, &mode_list, &num_m=
odes);
> >>>>>>> +     mode =3D v4l2_find_nearest_size(mode_list, num_modes, width=
, height,
> >>>>>>> +                                   fmt->format.width, fmt->forma=
t.height);
> >>>>>>> +
> >>>>>>> +     fmt->format.width        =3D mode->width;
> >>>>>>> +     fmt->format.height       =3D mode->height;
> >>>>>>> +     fmt->format.field        =3D V4L2_FIELD_NONE;
> >>>>>>> +     fmt->format.colorspace   =3D V4L2_COLORSPACE_RAW;
> >>>>>>> +     fmt->format.ycbcr_enc    =3D V4L2_YCBCR_ENC_601;
> >>>>>>> +     fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> >>>>>>> +     fmt->format.xfer_func    =3D V4L2_XFER_FUNC_NONE;
> >>>>>>> +
> >>>>>>> +     format =3D v4l2_subdev_state_get_format(sd_state, 0);
> >>>>>>> +
> >>>>>>> +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> >>>>>>> +             imx585_set_framing_limits(imx585, mode);
> >>>>>>> +
> >>>>>>> +     *format =3D fmt->format;
> >>>>>>> +     return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +/* -------------------------------------------------------------=
-------------
> >>>>>>> + * Stream on/off
> >>>>>>> + * -------------------------------------------------------------=
-------------
> >>>>>>> + */
> >>>>>>> +
> >>>>>>> +static int imx585_enable_streams(struct v4l2_subdev *sd,
> >>>>>>> +                              struct v4l2_subdev_state *state, u=
32 pad,
> >>>>>>> +                              u64 streams_mask)
> >>>>>>> +{
> >>>>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>>>> +     const struct imx585_mode *mode_list, *mode;
> >>>>>>> +     struct v4l2_subdev_state *st;
> >>>>>>> +     struct v4l2_mbus_framefmt *fmt;
> >>>>>>> +     unsigned int n_modes;
> >>>>>>> +     int ret;
> >>>>>>> +
> >>>>>>> +     ret =3D pm_runtime_get_sync(imx585->clientdev);
> >>>>>>> +     if (ret < 0) {
> >>>>>>> +             pm_runtime_put_noidle(imx585->clientdev);
> >>>>>>> +             return ret;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     ret =3D cci_multi_reg_write(imx585->regmap, common_regs,
> >>>>>>> +                               ARRAY_SIZE(common_regs), NULL);
> >>>>>>> +     if (ret) {
> >>>>>>> +             dev_err(imx585->clientdev, "Failed to write common =
settings\n");
> >>>>>>> +             goto err_rpm_put;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     ret =3D cci_write(imx585->regmap, IMX585_INCK_SEL, imx585->=
inck_sel_val, NULL);
> >>>>>>> +     if (!ret)
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_REG_BLKLEV=
EL, IMX585_BLKLEVEL_DEFAULT, NULL);
> >>>>>>> +     if (!ret)
> >>>>>>> +             ret =3D cci_write(imx585->regmap, IMX585_DATARATE_S=
EL,
> >>>>>>> +                             link_freqs_reg_value[imx585->link_f=
req_idx], NULL);
> >>>>>>> +     if (ret)
> >>>>>>> +             goto err_rpm_put;
> >>>>>>> +
> >>>>>>> +     ret =3D cci_write(imx585->regmap, IMX585_LANEMODE,
> >>>>>>> +                     (imx585->lane_count =3D=3D 2) ? 0x01 : 0x03=
, NULL);
> >>>>>>> +     if (ret)
> >>>>>>> +             goto err_rpm_put;
> >>>>>>> +
> >>>>>>> +     /* Mono bin flag (datasheet: 0x01 mono, 0x00 color) */
> >>>>>>> +     ret =3D cci_write(imx585->regmap, IMX585_BIN_MODE, imx585->=
mono ? 0x01 : 0x00, NULL);
> >>>>>>> +     if (ret)
> >>>>>>> +             goto err_rpm_put;
> >>>>>>> +
> >>>>>>> +     /* Sync configuration */
> >>>>>>> +     if (imx585->sync_mode =3D=3D SYNC_INT_FOLLOWER) {
> >>>>>>> +             dev_dbg(imx585->clientdev, "Internal sync follower:=
 XVS input\n");
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x01,=
 NULL);
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x03,=
 NULL); /* XHS out, XVS in */
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x=
08, NULL); /* disable XVS OUT */
> >>>>>>> +     } else if (imx585->sync_mode =3D=3D SYNC_INT_LEADER) {
> >>>>>>> +             dev_dbg(imx585->clientdev, "Internal sync leader: X=
VS/XHS output\n");
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x00,=
 NULL);
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x00,=
 NULL); /* XHS/XVS out */
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x=
0A, NULL);
> >>>>>>> +     } else {
> >>>>>>> +             dev_dbg(imx585->clientdev, "Follower: XVS/XHS input=
\n");
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x0F,=
 NULL); /* inputs */
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x=
00, NULL);
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     imx585->common_regs_written =3D true;
> >>>>>>> +
> >>>>>>> +     /* Select mode */
> >>>>>>> +     st  =3D v4l2_subdev_get_locked_active_state(&imx585->sd);
> >>>>>>> +     fmt =3D v4l2_subdev_state_get_format(st, 0);
> >>>>>>> +
> >>>>>>> +     get_mode_table(imx585, fmt->code, &mode_list, &n_modes);
> >>>>>>> +     mode =3D v4l2_find_nearest_size(mode_list, n_modes, width, =
height,
> >>>>>>> +                                   fmt->width, fmt->height);
> >>>>>>> +
> >>>>>>> +     ret =3D cci_multi_reg_write(imx585->regmap, mode->reg_list.=
regs,
> >>>>>>> +                               mode->reg_list.num_of_regs, NULL)=
;
> >>>>>>> +     if (ret) {
> >>>>>>> +             dev_err(imx585->clientdev, "Failed to write mode re=
gisters\n");
> >>>>>>> +             goto err_rpm_put;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     /* Disable digital clamp */
> >>>>>>> +     cci_write(imx585->regmap, IMX585_REG_DIGITAL_CLAMP, 0x00, N=
ULL);
> >>>>>>> +
> >>>>>>> +     /* Apply user controls after writing the base tables */
> >>>>>>> +     ret =3D __v4l2_ctrl_handler_setup(imx585->sd.ctrl_handler);
> >>>>>>> +     if (ret) {
> >>>>>>> +             dev_err(imx585->clientdev, "Control handler setup f=
ailed\n");
> >>>>>>> +             goto err_rpm_put;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     if (imx585->sync_mode !=3D SYNC_EXTERNAL)
> >>>>>>> +             cci_write(imx585->regmap, IMX585_REG_XMSTA, 0x00, N=
ULL);
> >>>>>>> +
> >>>>>>> +     ret =3D cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, I=
MX585_MODE_STREAMING, NULL);
> >>>>>>> +     if (ret)
> >>>>>>> +             goto err_rpm_put;
> >>>>>>> +
> >>>>>>> +     dev_dbg(imx585->clientdev, "Streaming started\n");
> >>>>>>> +     usleep_range(IMX585_STREAM_DELAY_US,
> >>>>>>> +                  IMX585_STREAM_DELAY_US + IMX585_STREAM_DELAY_R=
ANGE_US);
> >>>>>>> +
> >>>>>>> +     /* vflip, hflip cannot change during streaming */
> >>>>>>> +     __v4l2_ctrl_grab(imx585->vflip, true);
> >>>>>>> +     __v4l2_ctrl_grab(imx585->hflip, true);
> >>>>>>> +
> >>>>>>> +     return 0;
> >>>>>>> +
> >>>>>>> +err_rpm_put:
> >>>>>>> +     pm_runtime_put_autosuspend(imx585->clientdev);
> >>>>>>> +     return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int imx585_disable_streams(struct v4l2_subdev *sd,
> >>>>>>> +                               struct v4l2_subdev_state *state, =
u32 pad,
> >>>>>>> +                               u64 streams_mask)
> >>>>>>> +{
> >>>>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>>>> +     int ret;
> >>>>>>> +
> >>>>>>> +     ret =3D cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, I=
MX585_MODE_STANDBY, NULL);
> >>>>>>> +     if (ret)
> >>>>>>> +             dev_err(imx585->clientdev, "Failed to stop streamin=
g\n");
> >>>>>>> +
> >>>>>>> +     __v4l2_ctrl_grab(imx585->vflip, false);
> >>>>>>> +     __v4l2_ctrl_grab(imx585->hflip, false);
> >>>>>>> +
> >>>>>>> +     pm_runtime_put_autosuspend(imx585->clientdev);
> >>>>>>> +
> >>>>>>> +     return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +/* -------------------------------------------------------------=
-------------
> >>>>>>> + * Power / runtime PM
> >>>>>>> + * -------------------------------------------------------------=
-------------
> >>>>>>> + */
> >>>>>>> +
> >>>>>>> +static int imx585_power_on(struct device *dev)
> >>>>>>> +{
> >>>>>>> +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >>>>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>>>> +     int ret;
> >>>>>>> +
> >>>>>>> +     dev_dbg(imx585->clientdev, "power_on\n");
> >>>>>>> +
> >>>>>>> +     ret =3D regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->=
supplies);
> >>>>>>> +     if (ret) {
> >>>>>>> +             dev_err(imx585->clientdev, "Failed to enable regula=
tors\n");
> >>>>>>> +             return ret;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     ret =3D clk_prepare_enable(imx585->xclk);
> >>>>>>> +     if (ret) {
> >>>>>>> +             dev_err(imx585->clientdev, "Failed to enable clock\=
n");
> >>>>>>> +             goto reg_off;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
> >>>>>>> +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
> >>>>>>> +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_R=
ANGE_US);
> >>>>>>> +     return 0;
> >>>>>>> +
> >>>>>>> +reg_off:
> >>>>>>> +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplie=
s);
> >>>>>>> +     return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int imx585_power_off(struct device *dev)
> >>>>>>> +{
> >>>>>>> +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >>>>>>> +     struct imx585 *imx585 =3D to_imx585(sd);
> >>>>>>> +
> >>>>>>> +     dev_dbg(imx585->clientdev, "power_off\n");
> >>>>>>> +
> >>>>>>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
> >>>>>>
> >>>>>> NAK, I wrote you this is broken and you just ignored and sending t=
he same.
> >>>>>>
> >>>>>> You are mixing line level with logical level.
> >>>>>>
> >>>>>> There is no way your code actually works, unless you have broken D=
TS.
> >>>>>> Test your patches correctly (with proper, fixed DTS) and don't sen=
d the
> >>>>>> same completely ignoring reviewers.
> >>>>>
> >>>>> See how imx219.c works, ask Sony don't ask me.
> >>>>
> >>>> So there is a bug, you claim that you may do the same bug and then s=
ay:
> >>>>
> >>>>> That is why I ignore your comments on this.
> >>>>
> >>>> and ignoring comments that your code is buggy. Great!
> >>>>
> >>>> If you ever decide to not follow reviewer's opinion, you MUST respon=
d
> >>>> and you MUST say WHY in the changelog.
> >>>>
> >>>> Nothing that happened.
> >>>>
> >>>> But regardless, this is still buggy and this is still NAK.
> >>>>
> >>>> NAK means: Don't send the same code.
> >>>
> >>> What on earth are you talking about?
> >>
> >> Why are you sending me this in two copies?
>
> Respond here
You send the reply to both V3 and V2, so double reply.
>
> >>
> >> Do you understand the difference betweeen logical level and line level=
?
>
> Respond here
Do you understand this is writing GPIO? This has never been related to
the discussion.
I have kept telling you you got this sensor usage wrong.

>
> >>
> >>> See imx274.c,imx283.c,imx334.c,imx335.c,imx412.c,imx415.c.
> >>> Your claim that this is buggy doesn't make sense when all other Sony
> >>> imx drivers are using the same logic.
> >>>
> >>>
> >>> imx274.c:
> >>> /*
> >>>  * imx274_reset - Function called to reset the sensor
> >>>  * @priv: Pointer to device structure
> >>>  * @rst: Input value for determining the sensor's end state after res=
et
> >>>  *
> >>>  * Set the senor in reset and then
> >>>  * if rst =3D 0, keep it in reset;
> >>>  * if rst =3D 1, bring it out of reset.
> >>
> >> Buggy driver, another old poor code.
> >>
> >>
> >>>  *
> >>>  */
> >>> static void imx274_reset(struct stimx274 *priv, int rst)
> >>> {
> >>> gpiod_set_value_cansleep(priv->reset_gpio, 0);
> >>> usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> >>> gpiod_set_value_cansleep(priv->reset_gpio, !!rst);
> >>> usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> >>> }
> >>>
> >>>
> >>> imx283.c:
> >>>
> >>
> >> Way you paste code makes it very unreadable. It's easier to point
> >> web.git references.
> >>
> >>
> >> Anyway, look also here:
> >>
> >>>
> >>> static void imx415_power_off(struct imx415 *sensor)
> >>> {
> >>> clk_disable_unprepare(sensor->clk);
> >>> gpiod_set_value_cansleep(sensor->reset, 1);
> >>
> >>
> >> But if you claim that reset has to be asserted for this device to work=
 -
> >> and that's what your code is doing - then this is not a reset line.
> >>
> >> Do you understand what is the meaning of asserted reset (or to assert
> >> reset line)?
>
> So you do not understand above and yet you keep arguing with maintainer.
>
> >
> > And in all the examples I provided to you, this is the only IMX415
> > that has the logic inverted.
>
> And? All other drivers, camera sensors, hwmon, iio, codecs and whatnot?
>
Are those Sony image sensors?
>
> > I can apply the same logic and say this is buggy and wrong.
>
> We are not going to talk imaginary things.
>
So you can imagine this code is buggy even though I tell you this is correc=
t?
Of course I tested it already.

> > Do you understand this is writing the GPIO directly and has nothing to
>
> It is not. Again, you are mixing logical level with line level. You
> never responded to that part, you never used actual arguments except
> some vague statements like above.
>
> You do not write GPIO directly.
>
> Each driver is supposed to use logical level.
>
hmm? Code in the tree disagree with you? Are you going to arguing that
all the 90% of Sony image sensor drivers are old and buggy?

For writing GPIO directly, what is devm_gpiod_get_optional for?

>
> > do with what you think it should be?
> > Ask Sony why they use logic high =3D normal mode and logic low =3D rese=
t.
>
> Again you are mixing knowledge. Line level is completely irrelevant
> here. 99% of devices has active low reset line.
>
> >
> > Quote your previous comments:
> >> This is not how resets work. Logical reset value high means it is
> >> asserted and device does not work.
> >
> >> Read carefully your datasheet. Because if you claim above this is not =
a
> >> reset line, but some other.
> >
> > imx283.c is the latest one landed in 2024, can you read it carefully
> > and reply again?
>
> I will not because arguments "I found such code somewhere, so I will not
> respond to actual arguments just use that code" are invalid.
>
> You cannot make reset asserted and claim "this is operating stage". I
> explained why: because it does not work with correct DTS. If it works
> for you, then because your DTS is not correct.
>
> Apparently you do not understand what is assertion and what is logical
> state of GPIO (I asked this three times), but you keep disagreeing.
> That's basic knowledge, so please kindly go to Wikipedia or
> stackoverflow, because you are now wasting reviewers time. You do not
> respond to reviewers arguments.
>
You are asking me to code a bug in the driver and the arguments don't
make sense.
As much as I appreciate your feedback, I want a working driver
upstream and will have to point to the existing code base to prove
that it works.

I understand your points that you want me to code a bug (from my point
of view), I will take that feedback to consider but the only way
forward is to remove the optional reset gpio I guess.

> As I said: code is wrong so NAK.
>
>
> Best regards,
> Krzysztof

