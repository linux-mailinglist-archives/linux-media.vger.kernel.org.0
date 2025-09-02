Return-Path: <linux-media+bounces-41501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF7B3F436
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26D9B48256F
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F62E1F0E;
	Tue,  2 Sep 2025 05:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsMHzg2p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4DF2DF15F;
	Tue,  2 Sep 2025 05:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756789902; cv=none; b=O8sRfgl/YAn5peMPVHiTAwp+mMdyeA5mdvxsH6Xj/Yrm4nuVOcqNUsJHSTpKtVk9osJHWW5DAqb27rfgKf7ELOvUiIVHmLIq57I3db8sjnY5lLUOTxk/0PlXf7cZhIIXbWo+fWI3LjV4flhMUKFDuP6geJfpNkxYQfanml11CrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756789902; c=relaxed/simple;
	bh=8rS0LIP0u53ptk9V+ACTPr8p9/DgftmEoayF11LgyCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1ObKghPCOoKH6Kq3v64XCbAEC8vMbO8XK7SS4oQfAUolnxklF0B2i/qZQq0fqzAjkHtCVk+EArpNlpNqxiEMvDDZNDP199NqE7q7JYgOp79ivuMG062qwQmr1KIHSQ1OL2VV1oGrnkQhL8omAUq6wa0LZrfmF1W2aUA6PDLkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsMHzg2p; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3dad6252eacso35441f8f.1;
        Mon, 01 Sep 2025 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756789899; x=1757394699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTCTGbNV0A/hFnSRRaapGnfqcH++dszehZn/PYcxf4U=;
        b=MsMHzg2pClQlK21qR3YlSVADY9b/vUeaZLujPOLaQLugvFmkT+GjUTXwwwmGnGSM2M
         3JqYRyVlFmOlScgZua1JBat4JylV87s/u492INKJKP5kFyECM606NUwoc9bqwjlgrVlr
         A2QpK+27IUysgmpShGhf7VjQeofl3GjvDkl2cQKLM0nHh4mQ4t6RWOs2Ag+Vmam7w9sg
         oAU4jvE/IOzDHkDJAXvvrp3mUjehzA+D0wP7BbOXcHc2sVQ+8Of4jcLRkRUnkhe8A9Yn
         VytrYBJQOcu9F0Q2ee1Z2/1YFB4iOEFUgM4VH6jMFndRblBs92b8ZGV7KKqfM4paEXQI
         9YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756789899; x=1757394699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTCTGbNV0A/hFnSRRaapGnfqcH++dszehZn/PYcxf4U=;
        b=T5fpc6mVbseF6HF606UDN3UTHqsE8WwY87eYBAj8AaHF4FYabIzXdY2rEMHm7Clf0x
         ZtPVR+akB8CMOV7GZLP6f469ieqzQaDFt40xPJEu3hRE8Ytqur/U7z7oYku+mUtXPOyV
         9l5dQF+lRIjKOdvjCIszd6AFf+F4kHR6hP24RK2Xwizi6s5G/C78EP+0/lPiRXwLbYW9
         cn8Syu9YhheeJZYIBq5j7eDcQozMsOTN16dVA7yjgwbOsm5dvxWjX5JaZUa0Acs//9gP
         Fd9bI8nRhSdRKT4MG6zlXmaAufe6O/tRAt6jkKEhab7v0yp245eIoSHiCM97xB0tPTEC
         1x1A==
X-Forwarded-Encrypted: i=1; AJvYcCU691HcVK3G1F09fwa/2XqXjf4rqiouM+76Sfedx5ihD+jiRphLiTnEG5p9DdHdTehHsIGCAzA8Sx19@vger.kernel.org, AJvYcCVjGuP/0E4L/aPAhB7zpHv6wEFYMUCHKMi/cmccceVhcZhZRZ2AWPKBVJyYjykRiZRnzhhyXvsNbg7L@vger.kernel.org, AJvYcCVjjCPZUk3wYNg9z0LlMONEw9QdKBEKiLEb6OuG5BRuj6mZl2O1D1yOMiYs169ohOUYQeENG/nw6kLrEdM=@vger.kernel.org, AJvYcCVyoqLcdovXsxpAaKd5Ka3E+LXgy8BG8+nD4Otj7IcQY1wd6Vm7c4zzOislITEMRPL68ltGxkAdsfCyYaI5@vger.kernel.org, AJvYcCWVp46WO68cgoy0zyLgVc/2/Ao6ERBm96fS/yzAestk5FoQw9tS8+cHZT/w0oV7fqnWHr5WJp1kqToVFaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS15/QUwFMaDQ7C8NCNTfjI8uWSvlO+8NE8vR8zG+oXbH+3QW0
	LePqNL+OL0QszTXWsXztXTbi/A8a90fw2bAajfn6gTn/er1ysxZjrfOdJA1o0fAQ1epQ7PjRwrf
	m4DBaQ2ZC8YAth7MCqdtFUFCu6DsCCaA=
X-Gm-Gg: ASbGncvMTj3aNcOO7nXId46XSnLjuP2/blVvwbbjCWdZzPCi0w6oAsI660SYc/EErol
	Uut+7zydqPdcTjp+0jXLUPPI6GYRj2tpLmG1xKkUOpfLdqR6x136+Dg5w1mZ4ua75GolBTPXMRI
	0sGmz98EiWdAkQEKSVlwfqmtLAo2EuBQyEHZGfZa4xTALevGb9OlvVYBQVTuybwIGORuEqbdGw+
	6jEa1qKwUA2RKdeWus=
X-Google-Smtp-Source: AGHT+IGa3PRa1/gPaTBOeY7kLDsRJnMljXOD1O/8RwlykLwiecvwVwe6PtEAfF2dKWb9ZplPBeb9IGmICuTGLrkPfCk=
X-Received: by 2002:a05:6000:290f:b0:3b7:8914:cd94 with SMTP id
 ffacd0b85a97d-3d1de5b0a87mr5975119f8f.41.1756789898968; Mon, 01 Sep 2025
 22:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-16-clamor95@gmail.com>
 <3765586.e9J7NaK4W3@senjougahara>
In-Reply-To: <3765586.e9J7NaK4W3@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Sep 2025 08:11:27 +0300
X-Gm-Features: Ac12FXwYaklM9dfwRJGJ0niOGEaCaWCMSJaDJ1qiJ-WWQceVJ49LceOdwSONuvs
Message-ID: <CAPVz0n2Qo97fcshY=pCUzXn2zNe-akbtgsmhFA=vqvQ28ppZ5A@mail.gmail.com>
Subject: Re: [PATCH v1 15/19] staging: media: tegra-video: tegra20: expand
 format support with RAW8/10 and YUV422 1X16
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 2 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 04:10 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add support for Bayer formats (RAW8 and RAW10) and YUV422_8 1X16 versio=
ns
> > of existing YUV422_8 2X8.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 71 ++++++++++++++++++++-
> >  1 file changed, 69 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c
> > b/drivers/staging/media/tegra-video/tegra20.c index
> > 67631e0c9ffc..b466fe7f4504 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -186,6 +186,18 @@ static void tegra20_vi_get_input_formats(struct
> > tegra_vi_channel *chan, case MEDIA_BUS_FMT_YVYU8_2X8:
> >               (*yuv_input_format) =3D VI_INPUT_YUV_INPUT_FORMAT_YVYU;
> >               break;
> > +     /* RAW8 */
> > +     case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +     case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +     case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +     case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +     /* RAW10 */
> > +     case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +     case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +     case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +     case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +             (*yuv_input_format) =3D VI_INPUT_INPUT_FORMAT_BAYER;
>
> Should this be main_input_format instead of yuv_input_format?
>

Yes, it should be main_input_format, you are correct. Thank you.

> > +             break;
> >       }
> >  }
> >
> > @@ -220,6 +232,18 @@ static void tegra20_vi_get_output_formats(struct
> > tegra_vi_channel *chan, case V4L2_PIX_FMT_YVU420:
> >               (*main_output_format) =3D
> VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
> >               break;
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SBGGR10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +             (*main_output_format) =3D
> VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
> > +             break;
> >       }
> >  }
> >
> > @@ -300,6 +324,16 @@ static void tegra20_channel_queue_setup(struct
> > tegra_vi_channel *chan) case V4L2_PIX_FMT_VYUY:
> >       case V4L2_PIX_FMT_YUYV:
> >       case V4L2_PIX_FMT_YVYU:
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SBGGR10:
> >               if (chan->vflip)
> >                       chan->start_offset +=3D stride * (height - 1);
> >               if (chan->hflip)
> > @@ -365,6 +399,19 @@ static void tegra20_channel_vi_buffer_setup(struct
> > tegra_vi_channel *chan, tegra20_vi_write(chan,
> > TEGRA_VI_VB0_BASE_ADDRESS(OUT_1),  base); tegra20_vi_write(chan,
> > TEGRA_VI_VB0_START_ADDRESS(OUT_1), base + chan->start_offset); break;
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SBGGR10:
> > +             tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_2),
> base);
> > +             tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_2),
> base +
> > chan->start_offset); +                break;
> >       }
> >  }
> >
> > @@ -446,12 +493,15 @@ static int tegra20_chan_capture_kthread_start(voi=
d
> > *data) static void tegra20_camera_capture_setup(struct tegra_vi_channel
> > *chan) {
> >       u32 output_fourcc =3D chan->format.pixelformat;
> > +     u32 data_type =3D chan->fmtinfo->img_dt;
> >       int width  =3D chan->format.width;
> >       int height =3D chan->format.height;
> >       int stride_l =3D chan->format.bytesperline;
> >       int stride_c =3D (output_fourcc =3D=3D V4L2_PIX_FMT_YUV420 ||
> >                       output_fourcc =3D=3D V4L2_PIX_FMT_YVU420) ? 1 : 0=
;
> > -     int output_channel =3D OUT_1;
> > +     int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> > +                           data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> > +                           OUT_2 : OUT_1;
> >       int main_output_format;
> >       int yuv_output_format;
> >
> > @@ -580,6 +630,20 @@ static const struct tegra_video_format
> > tegra20_video_formats[] =3D { TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8=
, 16,
> > YVYU),
> >       TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> >       TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
> > +     /* RAW 8 */
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
> > +     /* RAW 10 */
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
> >  };
> >
> >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > @@ -606,9 +670,12 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> >  static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_c=
han)
> >  {
> >       struct tegra_vi_channel *vi_chan =3D
> > v4l2_get_subdev_hostdata(&vip_chan->subdev); +        u32 data_type =3D
> > vi_chan->fmtinfo->img_dt;
> >       int width  =3D vi_chan->format.width;
> >       int height =3D vi_chan->format.height;
> > -     int output_channel =3D OUT_1;
> > +     int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> > +                           data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> > +                           OUT_2 : OUT_1;
> >
> >       unsigned int main_input_format;
> >       unsigned int yuv_input_format;
>
>
>
>

