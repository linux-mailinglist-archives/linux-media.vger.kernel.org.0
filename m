Return-Path: <linux-media+bounces-18201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD908976AE3
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F668B214D6
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D0F1AD9CF;
	Thu, 12 Sep 2024 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phUJWwHH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0341AD261;
	Thu, 12 Sep 2024 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148407; cv=none; b=JalHGaUZqa6qhQMoju3eGJ/TBI/k7l+DiqVql2lj5pokzXneKJ2CrewCEX5zUThzEr12VLH47CfixC8Fv1Dg/Pe1siAtmXYUc6NxGQwcyUlen9fZ8Q/3nBdlnQlMCNyieVm0i4WG6ICHvTyk6K1rXpJnMZLFZ7GBTcfa7MefnH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148407; c=relaxed/simple;
	bh=t0C22QyaCqzG2yvHQ2RZ31l9aCLaC6AArCao759kBig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FeRE6scgtQ1OkupcbPg/2sgvwzlP+fuGk2KbiLhGVpNyMKOxDxSWCWnVRT8wsFY/Glsx/qDGLIIpcOHnYXvDHc5qjaUXW7+VQk+Sp1hV2gP1nv7EVMhQ2pfc75j1ij+H7mMSBLDGqcDxi1FZ79aEuBRVJCNAm0ruKEUYyU5Svko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phUJWwHH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBF9C4CEDC;
	Thu, 12 Sep 2024 13:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148406;
	bh=t0C22QyaCqzG2yvHQ2RZ31l9aCLaC6AArCao759kBig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=phUJWwHH6rnE8bkaPS5BxOr0ZWkhbO+BUE9aCWP/w9gR/oGC6QZuCukN+3qMF0V5z
	 01Yf+wzehvymgJcdE31amCBxyugiUgdvMwyMszUvZgD8oGE0NTUHE0uorSCv1CyXiM
	 lLTyd78Kd9QbIH5NwhjLW/NJNxENw2W7AMTmWlkWenc4zp/5DBKbWHl03OKRjWXJwo
	 vVE0CwmTsL8Et8439qRFj3AFVUnupgAcV0kCVcMkmlnY8aXC7BcWovRNnpe/B1O/de
	 KAI3s3f9EFgC30Imiw1LC0OzxcECMaZEp1QbrJAtV/oUe5KII/QhgW775BSXsSvC/h
	 y0eRvGdA44MaQ==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5dfad5a9c21so513042eaf.0;
        Thu, 12 Sep 2024 06:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCk0BkN5xQhW3xr3OoHzVSbK6RG0tzDELAnNntZ7CUcfJBmOubCjAxtkOHjanOoasTMliC73aSdcrGjNM=@vger.kernel.org, AJvYcCVtkJ4tbQwPKctjPw7qHlMFvouLRWblYSlgUfE24odNhuHY/lNpj4vPniea6TWb/iKStREJJWUF7WCNFTI=@vger.kernel.org, AJvYcCW6OalGmcJQW4i8KbNEz0lcCtrdVlGx3UAT/ZOsUvivh8ZNWVBVAfoDBlUnkDTR7M0WukIwnDaMBqwhWR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1LaataDf2M85WUsoo02k/X7tKOucO6BmAmxGATaoSvcdsVEVo
	QnxiG1r8KpmW0ZHVVke4sZrlKsDB+a9VbPmI+3Zqqy0ALiUyOyTrthi3PYYuIWdxroJHq0s9rXZ
	HciVpiJqtFflFLALgFy4CgMe16rY=
X-Google-Smtp-Source: AGHT+IGg4vhvLJcnOfVSBmYnq3FKAUWcSd7Xn5LU0g3lK+44H8wIzNUpy3jTNLKz6gKKLp1J/aXormKK7RdaaGu/0X8=
X-Received: by 2002:a05:6358:914c:b0:1b8:40ad:8e73 with SMTP id
 e5c5f4694b2df-1bb14e23828mr181847855d.12.1726148405907; Thu, 12 Sep 2024
 06:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-13-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-13-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:39:49 +0200
X-Gmail-Original-Message-ID: <CAPybu_2Yt0VBuPDAWS2MGM0U3ncUQ7VZD1gju18-2DxUvtUL7A@mail.gmail.com>
Message-ID: <CAPybu_2Yt0VBuPDAWS2MGM0U3ncUQ7VZD1gju18-2DxUvtUL7A@mail.gmail.com>
Subject: Re: [PATCH 13/13] media: i2c: imx214: Add test pattern control
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> This adds V4L2_CID_TEST_PATTERN control support.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/imx214.c | 77 ++++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 75 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 6493a9b9ea88..6d67c7b307bd 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -181,6 +181,23 @@
>
>  #define IMX214_REG_ATR_FAST_MOVE       CCI_REG8(0x9300)
>
> +/* Test Pattern Control */
> +#define IMX214_REG_TEST_PATTERN                CCI_REG16(0x0600)
> +#define IMX214_TEST_PATTERN_DISABLE    0
> +#define IMX214_TEST_PATTERN_SOLID_COLOR        1
> +#define IMX214_TEST_PATTERN_COLOR_BARS 2
> +#define IMX214_TEST_PATTERN_GREY_COLOR 3
> +#define IMX214_TEST_PATTERN_PN9                4
> +
> +/* Test pattern colour components */
> +#define IMX214_REG_TESTP_RED           CCI_REG16(0x0602)
> +#define IMX214_REG_TESTP_GREENR                CCI_REG16(0x0604)
> +#define IMX214_REG_TESTP_BLUE          CCI_REG16(0x0606)
> +#define IMX214_REG_TESTP_GREENB                CCI_REG16(0x0608)
> +#define IMX214_TESTP_COLOUR_MIN                0
> +#define IMX214_TESTP_COLOUR_MAX                0x03ff
> +#define IMX214_TESTP_COLOUR_STEP       1
> +
>  /* IMX214 native and active pixel array size */
>  #define IMX214_NATIVE_WIDTH            4224U
>  #define IMX214_NATIVE_HEIGHT           3136U
> @@ -213,6 +230,22 @@ static const u32 imx214_mbus_formats[] =3D {
>         MEDIA_BUS_FMT_SBGGR10_1X10,
>  };
>
> +static const char * const imx214_test_pattern_menu[] =3D {
> +       "Disabled",
> +       "Color Bars",
> +       "Solid Color",
> +       "Grey Color Bars",
> +       "PN9"
> +};
> +
> +static const int imx214_test_pattern_val[] =3D {
> +       IMX214_TEST_PATTERN_DISABLE,
> +       IMX214_TEST_PATTERN_COLOR_BARS,
> +       IMX214_TEST_PATTERN_SOLID_COLOR,
> +       IMX214_TEST_PATTERN_GREY_COLOR,
> +       IMX214_TEST_PATTERN_PN9,
> +};
> +
>  struct imx214 {
>         struct device *dev;
>         struct clk *xclk;
> @@ -819,6 +852,26 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>                 cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
>                           format->height + ctrl->val, &ret);
>                 break;
> +       case V4L2_CID_TEST_PATTERN:
> +               cci_write(imx214->regmap, IMX214_REG_TEST_PATTERN,
> +                         imx214_test_pattern_val[ctrl->val], &ret);
> +               break;
> +       case V4L2_CID_TEST_PATTERN_RED:
> +               cci_write(imx214->regmap, IMX214_REG_TESTP_RED,
> +                         ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_TEST_PATTERN_GREENR:
> +               cci_write(imx214->regmap, IMX214_REG_TESTP_GREENR,
> +                         ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_TEST_PATTERN_BLUE:
> +               cci_write(imx214->regmap, IMX214_REG_TESTP_BLUE,
> +                         ctrl->val, &ret);
> +               break;
> +       case V4L2_CID_TEST_PATTERN_GREENB:
> +               cci_write(imx214->regmap, IMX214_REG_TESTP_GREENB,
> +                         ctrl->val, &ret);
> +               break;
>         default:
>                 ret =3D -EINVAL;
>         }
> @@ -846,14 +899,14 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         struct v4l2_ctrl_handler *ctrl_hdlr;
>         int exposure_max, exposure_def;
>         int hblank;
> -       int ret;
> +       int i, ret;
>
>         ret =3D v4l2_fwnode_device_parse(imx214->dev, &props);
>         if (ret < 0)
>                 return ret;
>
>         ctrl_hdlr =3D &imx214->ctrls;
> -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 12);
> +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 13);
>         if (ret)
>                 return ret;
>
> @@ -908,6 +961,26 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         if (imx214->vflip)
>                 imx214->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>
> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx214_ctrl_ops,
> +                                    V4L2_CID_TEST_PATTERN,
> +                                    ARRAY_SIZE(imx214_test_pattern_menu)=
 - 1,
> +                                    0, 0, imx214_test_pattern_menu);
> +       for (i =3D 0; i < 4; i++) {
> +               /*
> +                * The assumption is that
> +                * V4L2_CID_TEST_PATTERN_GREENR =3D=3D V4L2_CID_TEST_PATT=
ERN_RED + 1
> +                * V4L2_CID_TEST_PATTERN_BLUE   =3D=3D V4L2_CID_TEST_PATT=
ERN_RED + 2
> +                * V4L2_CID_TEST_PATTERN_GREENB =3D=3D V4L2_CID_TEST_PATT=
ERN_RED + 3
> +                */
> +               v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> +                                 V4L2_CID_TEST_PATTERN_RED + i,
> +                                 IMX214_TESTP_COLOUR_MIN,
> +                                 IMX214_TESTP_COLOUR_MAX,
> +                                 IMX214_TESTP_COLOUR_STEP,
> +                                 IMX214_TESTP_COLOUR_MAX);
> +               /* The "Solid color" pattern is white by default */
> +       }
> +
>         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
>                                 NULL,
>                                 V4L2_CID_UNIT_CELL_SIZE,
>
> --
> 2.46.0
>
>

