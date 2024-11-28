Return-Path: <linux-media+bounces-22239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA59DBB78
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2201B16416E
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8151B3940;
	Thu, 28 Nov 2024 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6iLmHdT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5176A17993
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732812313; cv=none; b=s0H1E3eSiEmzbBhXYxjsiKT8HkRF3z4pRM/26iKOSfG74dfjJfdgwBEGR1kllQn5DWMGf7vOMwxzqNOXR3zDAmTFZD8nwbyfj9fELonwxbBaTJ3XbS4qSvFZQzSmvAxhKuc9mb3DERnj+8wbi6jeotdVZjTV7bTl+/gKwB+0MJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732812313; c=relaxed/simple;
	bh=1apssLQ+1zUXOBn8FaWJ70vHm6cSbFcA0No3jn4K1OU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYxdfdiRhXXcdSSER3CRLgUAlOG1DMYRxwNgQ7tRAI/SXGV1csfQIhRF0Q8wTvK2K68D8ICHohRj4z+v/JI0gx8Dr/S2ksIlBK2utfMhjeQgQt0dcHKGKlDSfynOy1aK6cXIE8S/3rEvWf3a+OWYnZz8CREg1jupemCvwWJJjx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6iLmHdT; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5152685b0d7so298853e0c.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732812311; x=1733417111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoZ8vSYYOArn73E0djYqR09T6DXTTdH5cjYekkZnuEY=;
        b=k6iLmHdT55DE166cQcLUdhWY6pxVmLjer6fbAbnYM3H2BfjypMm3jy/RFd7qNT64L/
         LJ5+JWcPSqoB1NBG7o2BzQiHsOZpnxLlRDJZVrEa95vZssoNr/U8mrZl33v2g0Py9SeF
         OHJSiUllZrMb6yTmsIR9CRKlfrU/wi5A2b6zRfko6MFAOhcVL/VyHdj2oJGY+lhrFLRO
         0WIENZQ8TxzjKYZ7huZXyGVU8xW0HO1esybxpoFSd+i6MU3wUKSHtKvbddvkOcXD7zNT
         Jv1AhsGMZrKnYyY1HPRQVm0eHQz/lnu7A+rKmg+kSRkXlX3bvps4mUYygGAspz+Dgz27
         TRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732812311; x=1733417111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoZ8vSYYOArn73E0djYqR09T6DXTTdH5cjYekkZnuEY=;
        b=Gm2l3iHgI//ua5EFwD+c8ZNFn9DzWAc7gHnhKF8/GjpAic8XNVXjMMUZ/dlitco+lB
         jITMfGe4UHiytpYRbCW3bFVKfQcg5hbHsDDstMQsiqoPvTMQeJmXWoMPi5QE2kfmkYx2
         CobRIa2Z3ORwwHh20axmVJ3hh7WVpP+G0QSnYjJsszB5bMN7sb0g7eLmWo5wWp2o5ce8
         A90JAMnLTslxXifxQI8NJ4WTnIBHoWmBL8a8qWJLyfF2a3HwbDF5M8cJJTU7jxfn4plM
         grdFphTlgu/O7BzmnhX4rkQkQxm3ZnMBVzEGHlnpNJZQ0d/84vjWxeTJVPkvPRFMontv
         z4og==
X-Forwarded-Encrypted: i=1; AJvYcCX1Y2idaKWQ90DDhshc9w3UztGFIDd/yCOeNxF9YGb3FsqgYgvNQGse7Crt3BqWRMR7LQhWZ0ZXHh4KHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDl4qPEPyunx6CF2VC3u1FlMzRvLzWUd0nqQ1N++CF+R/aj9SV
	i84bFofB3T6bAdX7SdDtHVC5Tqko2DkJCQCexEgWUhHZ3+r9H+R1yIuZqMorRv+8WGDkBBN6+W7
	7eKaJ6yhGtAlfEBnBj0cEFYPLwbM=
X-Gm-Gg: ASbGncvq4jXO+p7ewDc/D4Xh+4KEzJFP58Kw0d4wfY7D3ITlrkYdf/VxE9kQrhsIjsr
	Ej2Vt+F45E1Rm8kb6DQMv5O/sl5360g==
X-Google-Smtp-Source: AGHT+IE5sy0mcL2s5WHpC2ST0OtNEFtelCTHXyVBE2SJudat3ffAPHODlhB6eVW1gmTvA/CHyQy2PGuM4IT2GayobzM=
X-Received: by 2002:a05:6122:a0d:b0:4f5:199b:2a61 with SMTP id
 71dfb90a1353d-51556ad01admr8800672e0c.9.1732812311112; Thu, 28 Nov 2024
 08:45:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128152338.4583-1-hdegoede@redhat.com> <20241128152338.4583-3-hdegoede@redhat.com>
In-Reply-To: <20241128152338.4583-3-hdegoede@redhat.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 28 Nov 2024 17:44:55 +0100
Message-ID: <CAPybu_3aK3vrEeY+4iwpfmz2OwhZyz4aoo8RKk3HqLAPxO2M5w@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: ov2740: Add camera orientation and sensor
 rotation controls
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Nov 28, 2024 at 4:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Add camera orientation and sensor rotation controls using
> the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
> helpers.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2740.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index e7a611967b40..998e1977978d 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -755,15 +755,17 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops =
=3D {
>
>  static int ov2740_init_controls(struct ov2740 *ov2740)
>  {
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov2740->sd);
nit: dont you prefer to pass the i2c_client as a parameter?
>         struct v4l2_ctrl_handler *ctrl_hdlr;
>         const struct ov2740_mode *cur_mode;
>         s64 exposure_max, h_blank, pixel_rate;
>         u32 vblank_min, vblank_max, vblank_default;
> +       struct v4l2_fwnode_device_properties props;
>         int size;
>         int ret;
>
>         ctrl_hdlr =3D &ov2740->ctrl_handler;
> -       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>         if (ret)
>                 return ret;
>
> @@ -813,6 +815,13 @@ static int ov2740_init_controls(struct ov2740 *ov274=
0)
>                                      V4L2_CID_TEST_PATTERN,
>                                      ARRAY_SIZE(ov2740_test_pattern_menu)=
 - 1,
>                                      0, 0, ov2740_test_pattern_menu);
> +
> +       ret =3D v4l2_fwnode_device_parse(&client->dev, &props);
> +       if (ret)
There is no need to v4l2_ctrl_handler_free(ctrl_hdlr); here?

> +               return ret;
> +
> +       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops, &pro=
ps);
> +
>         if (ctrl_hdlr->error) {
>                 v4l2_ctrl_handler_free(ctrl_hdlr);
>                 return ctrl_hdlr->error;
> --
> 2.47.0
>
>


--=20
Ricardo Ribalda

