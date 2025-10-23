Return-Path: <linux-media+bounces-45360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B927BC004C3
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B52B1A66AB8
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE55E2D9EEC;
	Thu, 23 Oct 2025 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XJ8nSsJL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B9C2D9784
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761212363; cv=none; b=dHMeOAdNALYl9OL0Tue0SPJfdgZwJ8c+FTQkSxWQR+wOO8GPwjcps0MRp9Zpwv6RwjJ6DELBlE18vBOWJ2148IUuiKo/DatBsFJ9rIUKSO2BrVEmkdxC9TVoFozH4IclfISl8M/359QglGwIZ+XXpVFKYl83n+iFFi4OlfkdyLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761212363; c=relaxed/simple;
	bh=JNXZ1+vsFDA2N180Cme7mi+TudjMe4/Mm2eVfLrgcDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYo59EHrRx7gi1+ztvmb3gYg3W8v+dBHGj22IXGqdAwXjHs3n5Cg23jN6B7bZzby5lx0DppKge9dv33+36Ad8NcKs8h8qtwKuBuFuffSScccKA3dQQtwEHjTTueoWP3FidbpdcYUS/I3qfzLskYk2rmuLo6E7oWpli0DcwloGl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XJ8nSsJL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761212359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bV9AxIEwtAzigPqTW1B0MGv/sVDnaqdjt9VW9vC9SaE=;
	b=XJ8nSsJLfN7uG3NbE1Fg28wMpFfe1tDXufkn238a2E/7Py5AwtH9Lh5zusOFe7XIgJ63O0
	1GuQDtLof5ZxEnSLFioeVaRum/HJXQGncHGfJm1er5J57pB9jSFFUzmNtkNJ/g0Krbs0D3
	JQ+nqjELwQgFz9y7sTBp7HxExJ5AQMI=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-2er5fsxZO0GKBvR7pA4uSg-1; Thu, 23 Oct 2025 05:39:18 -0400
X-MC-Unique: 2er5fsxZO0GKBvR7pA4uSg-1
X-Mimecast-MFC-AGG-ID: 2er5fsxZO0GKBvR7pA4uSg_1761212357
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-3c90bdcdc82so999348fac.2
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 02:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761212356; x=1761817156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV9AxIEwtAzigPqTW1B0MGv/sVDnaqdjt9VW9vC9SaE=;
        b=VZ66+YAz1iH9dL1d2UOa/y7EEEBVz1jaJMYitAYGG3iflGyKXWRj2suQNQ6iJMRAee
         Xi9EgJeDu4E60ofLF0NUEJBWg+OD2BBEdqZ5WvDKc2j+AyzVMTMZr0Z21yUU60AY/M/r
         lVpcNoLWwbWgT8QeRCJ2nBkyzbBrx8AdaWZyLHgNy/hVFD7aBEsPUpu8HYCnR3Y/WdW0
         Ppjdx6BskaamU/Nj1dVTckmE8hhEIY1z7gVd3ZZuhcxsyDY6bD2LYhctBIeejPmPovGl
         toCUwIq4/0rUfLYy+Jo5Ma8JB1BVQGdeGG+PSkKuI3+ytWuRl+YQKmnwWxmV3Lso6yR3
         r3yg==
X-Forwarded-Encrypted: i=1; AJvYcCWm9fnuHusP5CglFhzw7l/y4oy/0USkXlGe6AzrWJpuWsxm9+WIwDAdZywsWGBGpo/IikJynueOITMKXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPKMWTCzdZTFU/hViajE6bjfz5DxrFpnrC44eds6L33q5EAVu
	oKL+JO7JJSCrwyNeA873Ob0GLYCGWHC0x4BKeMi2NUSLlvcxyMTMzYpbvj1PGqYzf/EBPgYUzjO
	8NMjMykFdsvmcq5yO8AdsQoLNa2gvQd7zwECNtiE9v0yKKENesnMDhW8tRUTG9/ca7riBoGgw6B
	94isvmrkea14ICuHUEzj7EIRyDQ4xNwMxNNfkxEFJrhtYkgFX+5Q==
X-Gm-Gg: ASbGnctMFRcYVd2xo1p2vG4b2XrPNjqELFThzpxEyYnPfNBtHYJN0EN2ldvhttu3gAH
	5wVMTT3qz5u92zek5bUxHUQx0srcQ1CU2qJJ0l2TrhkgNRVDsp5zPcVv17npqE5DqLpNDRPfcb4
	lriNtwhdtdqOJyCKSFX7xeVXiCMhrWDxTvomOQujwJpMgMGSGdYcsLlLM=
X-Received: by 2002:a05:6871:eb01:b0:3cd:a995:6c8 with SMTP id 586e51a60fabf-3cdc5aa762cmr880884fac.44.1761212356404;
        Thu, 23 Oct 2025 02:39:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUZ69G0byGuWuWygPjGnNzTe9qq3v5DQcwkRzqD6LbRDFWvPFIQJRqk6bBKqICO5Jy43oUnhGqcxmRFmBJCVE=
X-Received: by 2002:a05:6871:eb01:b0:3cd:a995:6c8 with SMTP id
 586e51a60fabf-3cdc5aa762cmr880871fac.44.1761212355927; Thu, 23 Oct 2025
 02:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021080325.141435-1-hpa@redhat.com> <0ff4c0e0-be18-4e76-adbb-c4f3736edd1d@kernel.org>
In-Reply-To: <0ff4c0e0-be18-4e76-adbb-c4f3736edd1d@kernel.org>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 23 Oct 2025 17:39:03 +0800
X-Gm-Features: AS18NWA4O83vrQYAEifq0lK24sJQ0z4J4Y2D2IrLM5WdH7hRutUgJZPY-CJ-PZU
Message-ID: <CAEth8oHbWVKQo=TPt0VZU7QCXqMupsnxwjVZ8ODUQdfBOeZCqA@mail.gmail.com>
Subject: Re: [PATCH v9] media: Add t4ka3 camera sensor driver
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,


On Wed, Oct 22, 2025 at 7:09=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi,
>
> On 21-Oct-25 10:03, kate Hsuan wrote:
> > From: Kate Hsuan <hpa@redhat.com>
> >
> > Add the t4ka3 driver from:
> > https://github.com/kitakar5525/surface3-atomisp-cameras.git
> >
> > With many cleanups / changes (almost a full rewrite) to make it suitabl=
e
> > for upstream:
> >
> > * Remove the VCM and VCM-OTP support, the mainline kernel models VCMs a=
nd
> >   calibration data eeproms as separate v4l2-subdev-s.
> >
> > * Remove the integration-factor t4ka3_get_intg_factor() support and IOC=
TL,
> >   this provided info to userspace through an atomisp private IOCTL.
> >
> > * Turn atomisp specific exposure/gain IOCTL into standard v4l2 controls=
.
> >
> > * Use normal ACPI power-management in combination with runtime-pm suppo=
rt
> >   instead of atomisp specific GMIN power-management code.
> >
> > * Turn into a standard V4L2 sensor driver using
> >   v4l2_async_register_subdev_sensor().
> >
> > * Add vblank, hblank, and link-freq controls; drop get_frame_interval()=
.
> >
> > * Use CCI register helpers.
> >
> > * Calculate values for modes instead of using fixed register-value list=
s,
> >   allowing arbritrary modes.
> >
> > * Add get_selection() and set_selection() support
> >
> > * Add a CSI2 bus configuration check
> >
> > This been tested on a Xiaomi Mipad2 tablet which has a T4KA3 sensor wit=
h
> > DW9761 VCM as back sensor.
> >
> > Co-developed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> > Changes in v9:
> > 1. Apply Hans' fix patch to fix the lock issue and squash it into this
> >    patch.
> > https://lore.kernel.org/linux-media/33dd5660-efb6-47e0-9672-f3ae6575118=
5@kernel.org/
>
> Thank you for the new version. Some small review remarks below.
>

Thank you for reviewing.

> ...
>
> > +static void t4ka3_fill_format(struct t4ka3_data *sensor,
> > +                           struct v4l2_mbus_framefmt *fmt,
> > +                           unsigned int width, unsigned int height)
> > +{
> > +     memset(fmt, 0, sizeof(*fmt));
> > +     fmt->width =3D width;
> > +     fmt->height =3D height;
> > +     fmt->field =3D V4L2_FIELD_NONE;
> > +     fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
>
> Since the sensor gives raw uncalibrated color data this should be:
>
>         fmt->colorspace =3D V4L2_COLORSPACE_RAW;
Okay
>
> > +     t4ka3_set_bayer_order(sensor, fmt);
> > +}
>
> ...
>
> > +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_format *format)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *try_fmt;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     const struct v4l2_rect *crop;
> > +     unsigned int width, height;
> > +     int min, max, def, ret =3D 0;
> > +
> > +     crop =3D t4ka3_get_active_crop(sensor);
> > +     fmt =3D t4ka3_get_active_format(sensor);
> > +
> > +     /* Limit set_fmt max size to crop width / height */
> > +     width =3D clamp_val(ALIGN(format->format.width, 2),
> > +                       T4KA3_MIN_CROP_WIDTH, crop->width);
> > +     height =3D clamp_val(ALIGN(format->format.height, 2),
> > +                        T4KA3_MIN_CROP_HEIGHT, crop->height);
> > +     t4ka3_fill_format(sensor, &format->format, width, height);
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +             try_fmt =3D v4l2_subdev_state_get_format(sd_state, 0);
> > +             *try_fmt =3D format->format;
> > +             return 0;
> > +     }
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && sensor->str=
eaming)
> > +             return -EBUSY;
> > +
> > +     *v4l2_subdev_state_get_format(sd_state, 0) =3D format->format;
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return 0;
> > +
> > +     t4ka3_calc_mode(sensor);
> > +
> > +     /* vblank range is height dependent adjust and reset to default *=
/
> > +     t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, =
1, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     def =3D T4KA3_ACTIVE_WIDTH - fmt->width;
>
> This should be:
>
>         def =3D T4KA3_PIXELS_PER_LINE - fmt->width;
Okay. It is the maximum width and makes the hblank wider.
>
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, =
1, def);
> > +     if (ret)
> > +             return ret;
>
> Add a blank line here please.
Okay
>
> > +     ret =3D __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* exposure range depends on vts which may have changed */
> > +     ret =3D t4ka3_update_exposure_range(sensor);
>
> This is not necessary as the t4ka3_s_ctrl(vblank) call above
> calls t4ka3_s_ctrl(VBLANK) which already does this, so the comment
> and the call can be dropped and then the "return ret" here:

Got it and I traced the code a bit.
The t4ka3_update_exposure_range() is invoked when
__v4l2_ctrl_s_ctrl(); is called.
So, I'll remove it.
>
> > +     return ret;
>
> can be replaced by a simple "return 0;"
>
> > +}
>
> ...
>
> > +static int t4ka3_enable_stream(struct v4l2_subdev *sd, struct v4l2_sub=
dev_state *state,
> > +                            u32 pad, u64 streams_mask)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_get_sync(sensor->sd.dev);
> > +     if (ret < 0) {
> > +             dev_err(sensor->dev, "power-up err.\n");
> > +             goto error_exit;
>
> This is wrong even on failure pm_runtime_get...() still
> increases the pm-counter, so this should be goto error_powerdown; and
> then the unused error_exit label can be removed.

Okay. I'll correct this.
>
> > +     }
> > +
> > +     cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> > +                         ARRAY_SIZE(t4ka3_init_config), &ret);
> > +     /* enable group hold */
> > +     cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> > +     cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
> > +                         ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     ret =3D t4ka3_set_mode(sensor);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     ret =3D cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_r=
egs,
> > +                               ARRAY_SIZE(t4ka3_post_mode_set_regs), N=
ULL);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     /* Restore value of all ctrls */
> > +     ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     /* disable group hold */
> > +     cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> > +     cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     sensor->streaming =3D 1;
> > +
> > +     return ret;
>
> Please use return 0 here.
>
> > +
> > +error_powerdown:
> > +     pm_runtime_put(sensor->sd.dev);
> > +error_exit:
> > +     return ret;
> > +}
>
> ...
>
> > +static int t4ka3_set_selection(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state,
> > +                            struct v4l2_subdev_selection *sel)
> > +{
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +     struct v4l2_mbus_framefmt *format;
> > +     struct v4l2_rect *crop;
> > +     struct v4l2_rect rect;
> > +
> > +     if (sel->target !=3D V4L2_SEL_TGT_CROP)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Clamp the boundaries of the crop rectangle to the size of the =
sensor
> > +      * pixel array. Align to multiples of 2 to ensure Bayer pattern i=
sn't
> > +      * disrupted.
> > +      */
> > +     rect.left =3D clamp_val(ALIGN(sel->r.left, 2),
> > +                           T4KA3_NATIVE_START_LEFT, T4KA3_NATIVE_WIDTH=
);
> > +     rect.top =3D clamp_val(ALIGN(sel->r.top, 2),
> > +                          T4KA3_NATIVE_START_TOP, T4KA3_NATIVE_HEIGHT)=
;
>
> It is better to replace these 2 clamps:
>
> > +     rect.width =3D clamp_val(ALIGN(sel->r.width, 2),
> > +                            T4KA3_MIN_CROP_WIDTH, T4KA3_NATIVE_WIDTH);
> > +     rect.height =3D clamp_val(ALIGN(sel->r.height, 2),
> > +                             T4KA3_MIN_CROP_HEIGHT, T4KA3_NATIVE_HEIGH=
T);
>
> with:
>
>         rect.width =3D clamp_val(ALIGN(sel->r.width, 2), T4KA3_MIN_CROP_W=
IDTH,
>                                T4KA3_NATIVE_WIDTH - rect.left);
>         rect.height =3D clamp_val(ALIGN(sel->r.height, 2), T4KA3_MIN_CROP=
_HEIGHT,
>                                 T4KA3_NATIVE_HEIGHT - rect.top);
>
> then this first clamp for width / height also makes sure width / height
> are not too large and then this comment + 2 more "clamps":
>
> > +     /* Make sure the crop rectangle isn't outside the bounds of the a=
rray */
> > +     rect.width =3D min_t(unsigned int, rect.width,
> > +                        T4KA3_NATIVE_WIDTH - rect.left);
> > +     rect.height =3D min_t(unsigned int, rect.height,
> > +                         T4KA3_NATIVE_HEIGHT - rect.top);
>
> can be dropped.

Okay. Simplifying the clamp is better.

>
> > +
> > +     crop =3D v4l2_subdev_state_get_crop(state, sel->pad);
> > +
> > +     *crop =3D rect;
>
> This assignment needs to be moved to after the check below if the crop
> size has changed. When doing this assignment first then the below check
> for changed size will always fail because crop and rect are now the same.
>
> (after moving down please group the assingment with the "sel->r =3D rect"
> assignment)
Okay
>
> > +
> > +     if (rect.width !=3D crop->width || rect.height !=3D crop->height)=
 {
> > +             /*
> > +              * Reset the output image size if the crop rectangle size=
 has
> > +              * been modified.
> > +              */
> > +             format =3D v4l2_subdev_state_get_format(state, sel->pad);
> > +             format->width =3D rect.width;
> > +             format->height =3D rect.height;
> > +             if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +                     t4ka3_calc_mode(sensor);
> > +     }
> > +
> > +     sel->r =3D rect;


> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +t4ka3_enum_mbus_code(struct v4l2_subdev *sd,
> > +                  struct v4l2_subdev_state *sd_state,
> > +                  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     if (code->index)
> > +             return -EINVAL;
> > +
> > +     code->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> > +     return 0;
> > +}
> > +
> > +static int t4ka3_enum_frame_size(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +     struct v4l2_rect *crop;
> > +
> > +     if (fse->index >=3D T4KA3_FRAME_SIZES)
> > +             return -EINVAL;
> > +
> > +     crop =3D v4l2_subdev_state_get_crop(sd_state, fse->pad);
> > +     if (!crop)
> > +             return -EINVAL;
>
> There is no need to check for !crop. Now that the active-state
> from the subdev is used there will always be a crop rect.

got it.

>
> > +
> > +     fse->min_width =3D crop->width / (fse->index + 1);
> > +     fse->min_height =3D crop->height / (fse->index + 1);
> > +     fse->max_width =3D fse->min_width;
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static int t4ka3_init_controls(struct t4ka3_data *sensor)
> > +{
> > +     const struct v4l2_ctrl_ops *ops =3D &t4ka3_ctrl_ops;
> > +     struct t4ka3_ctrls *ctrls =3D &sensor->ctrls;
> > +     struct v4l2_ctrl_handler *hdl =3D &ctrls->handler;
> > +     struct v4l2_fwnode_device_properties props;
> > +     int ret, min, max, def;
> > +     static const char * const test_pattern_menu[] =3D {
> > +             "Disabled",
> > +             "Solid White",
> > +             "Color Bars",
> > +             "Gradient",
> > +             "Random Data",
> > +     };
> > +
> > +     v4l2_ctrl_handler_init(hdl, 11);
> > +
> > +     hdl->lock =3D &sensor->lock;
> > +
> > +     ctrls->vflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1=
, 1, 0);
> > +     ctrls->hflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1=
, 1, 0);
> > +
> > +     ctrls->test_pattern =3D v4l2_ctrl_new_std_menu_items(hdl, ops,
> > +                                                        V4L2_CID_TEST_=
PATTERN,
> > +                                                        ARRAY_SIZE(tes=
t_pattern_menu) - 1,
> > +                                                        0, 0, test_pat=
tern_menu);
> > +     ctrls->link_freq =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_L=
INK_FREQ,
> > +                                               0, 0, sensor->link_freq=
);
> > +     ctrls->pixel_rate =3D v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL=
_RATE,
> > +                                           0, T4KA3_PIXEL_RATE,
> > +                                           1, T4KA3_PIXEL_RATE);
> > +
> > +     v4l2_subdev_lock_state(sensor->sd.active_state);
> > +     t4ka3_calc_mode(sensor);
> > +     t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> > +     v4l2_subdev_unlock_state(sensor->sd.active_state);
> > +
> > +     ctrls->vblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, mi=
n, max, 1, def);
> > +
> > +     def =3D T4KA3_ACTIVE_WIDTH;
>
> This should be :
>
>         def =3D T4KA3_PIXELS_PER_LINE - T4KA3_ACTIVE_WIDTH;
Okay

>
> > +     ctrls->hblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> > +                                       def, def, 1, def);
> > +
> > +     max =3D T4KA3_LINES_PER_FRAME_30FPS - T4KA3_COARSE_INTEGRATION_TI=
ME_MARGIN;
> > +     ctrls->exposure =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE=
,
> > +                                         0, max, 1, max);
> > +
> > +     ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAI=
N,
> > +                                     T4KA3_MIN_GLOBAL_GAIN_SUPPORTED,
> > +                                     T4KA3_MAX_GLOBAL_GAIN_SUPPORTED,
> > +                                     1, T4KA3_MIN_GLOBAL_GAIN_SUPPORTE=
D);
> > +
> > +     ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
> > +     if (ret)
> > +             return ret;
> > +
> > +     v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> > +
> > +     if (hdl->error)
> > +             return hdl->error;
> > +
> > +     ctrls->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +     ctrls->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +     ctrls->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +     ctrls->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     sensor->sd.ctrl_handler =3D hdl;
> > +     return 0;
> > +}
>
> ...
>
> > +static void t4ka3_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct t4ka3_data *sensor =3D to_t4ka3_sensor(sd);
> > +
> > +     v4l2_async_unregister_subdev(&sensor->sd);
>
> You are missing a v4l2_subdev_cleanup(sd); here (this is the
> cleanup for the recently added v4l2_subdev_init_finalize() call.
I read the document again and I found it. v4l2_subdev_cleanup() has to
be called when removing the module.

>
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>
> Also lets move media_entity_cleanup() last so that things
> are in the exact reverse order of probe(), so that will
> result in:
>
>         v4l2_async_unregister_subdev(&sensor->sd);
>         v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>         v4l2_subdev_cleanup(sd);
>         media_entity_cleanup(&sensor->sd.entity);
I'll carefully deal with the call sequence.
>
>
> > +
> > +     /*
> > +      * Disable runtime PM. In case runtime PM is disabled in the kern=
el,
> > +      * make sure to turn power off manually.
> > +      */
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             t4ka3_pm_suspend(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static int t4ka3_probe(struct i2c_client *client)
> > +{
> > +     struct t4ka3_data *sensor;
> > +     int ret;
> > +
> > +     /* allocate sensor device & init sub device */
> > +     sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL=
);
> > +     if (!sensor)
> > +             return -ENOMEM;
> > +
> > +     sensor->dev =3D &client->dev;
> > +
> > +     ret =3D t4ka3_check_hwcfg(sensor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mutex_init(&sensor->lock);
> > +
> > +     sensor->link_freq[0] =3D T4KA3_LINK_FREQ;
> > +
> > +     v4l2_i2c_subdev_init(&sensor->sd, client, &t4ka3_ops);
> > +     sensor->sd.internal_ops =3D &t4ka3_internal_ops;
> > +
> > +     sensor->powerdown_gpio =3D devm_gpiod_get(&client->dev, "powerdow=
n",
> > +                                             GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->powerdown_gpio))
> > +             return dev_err_probe(&client->dev, PTR_ERR(sensor->powerd=
own_gpio),
> > +                                  "getting powerdown GPIO\n");
> > +
> > +     sensor->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "res=
et",
> > +                                                  GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->reset_gpio))
> > +             return dev_err_probe(&client->dev, PTR_ERR(sensor->reset_=
gpio),
> > +                                  "getting reset GPIO\n");
> > +
> > +     sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(sensor->regmap))
> > +             return PTR_ERR(sensor->regmap);
> > +
> > +     ret =3D t4ka3_pm_resume(sensor->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     pm_runtime_set_active(&client->dev);
> > +     pm_runtime_get_noresume(&client->dev);
> > +     pm_runtime_enable(&client->dev);
> > +
> > +     sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
> > +     if (ret)
> > +             goto err_media_entity;
>
> If functions fail, there matching cleanup function should not be
> called, so this should be a "goto err_pm_disable;"

My bad. Since the media_entity_pads_init() fails, the corresponding
structures haven't been initialised or allocated.
So, disable the pm.
>
> > +
> > +     sensor->sd.state_lock =3D sensor->ctrls.handler.lock;
> > +     ret =3D v4l2_subdev_init_finalize(&sensor->sd);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to init subdev: %d", ret);
> > +             goto err_subdev_entry;
>
> and this should be a "goto err_media_entity_cleanup;"
The same as above.

>
> > +     }
> > +
> > +     ret =3D t4ka3_init_controls(sensor);
> > +     if (ret)
> > +             goto err_controls;
>
> controls are special and do need have v4l2_ctrl_handler_free()
> called on error to init, so this is correct,
>
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret)
> > +             goto err_subdev_entry;
>
> But this should also be "goto err_controls;"
okay.
>
> > +
> > +     pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > +     pm_runtime_use_autosuspend(&client->dev);
> > +     pm_runtime_put_autosuspend(&client->dev);
> > +
> > +     return 0;
> > +
> > +err_subdev_entry:
> > +     v4l2_subdev_cleanup(&sensor->sd);
> > +
> > +err_controls:
> > +     v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>
> and the order of these 2 is wrong, now if t4ka3_init_controls()
> fails, the v4l2_subdev_cleanup() is skipped even though
> v4l2_subdev_init_finalize() has run.
>
> > +
> > +err_media_entity:
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +     pm_runtime_disable(&client->dev);
> > +     pm_runtime_put_noidle(&client->dev);
>
Got it.

I'll propose a v10 patch to include all the fixes. :)

> probe() has done a t4ka3_pm_resume() before it gets
> here, so this needs a t4ka3_pm_suspend() to match.
>
> After all this is fixed, the error exit paths
> with the gotos should look like this:
>
> err_controls:
>         v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>         v4l2_subdev_cleanup(&sensor->sd);
>
> err_media_entity:
>         media_entity_cleanup(&sensor->sd.entity);
>
> err_pm_disable:
>         pm_runtime_disable(&client->dev);
>         pm_runtime_put_noidle(&client->dev);
>         t4ka3_pm_suspend(&client->dev);
>
> > +
> > +     return ret;
> > +}
> > +
> > +static struct acpi_device_id t4ka3_acpi_match[] =3D {
> > +     { "XMCC0003" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
> > +
> > +static struct i2c_driver t4ka3_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "t4ka3",
> > +             .acpi_match_table =3D ACPI_PTR(t4ka3_acpi_match),
> > +             .pm =3D pm_sleep_ptr(&t4ka3_pm_ops),
> > +     },
> > +     .probe =3D t4ka3_probe,
> > +     .remove =3D t4ka3_remove,
> > +};
> > +module_i2c_driver(t4ka3_driver)
> > +
> > +MODULE_DESCRIPTION("A low-level driver for T4KA3 sensor");
> > +MODULE_AUTHOR("HARVEY LV <harvey.lv@intel.com>");
> > +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> > +MODULE_LICENSE("GPL");
>
> Regards,
>
> Hans
>
>


--=20
BR,
Kate


