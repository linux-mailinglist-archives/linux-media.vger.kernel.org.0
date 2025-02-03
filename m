Return-Path: <linux-media+bounces-25598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE16EA25F24
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 16:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25E8B162D8D
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 15:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783B320A5CF;
	Mon,  3 Feb 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+EwMecz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D425204689
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597546; cv=none; b=gPtT28q1lMU/U6wCgh5NqJj4uPZ2iYDuuQilQD03w9VsBejtI4zwGsVIqy6x4Iv9K2u8pUxGBJ2UePNylR9dhRAP7akzkHKnR9S6KaFO1+g8xED0uVpEBPd6+oIn32Rlz1GF/vAIlDhugyj15UDq3DGd/nfEgd7U6NlmQJx8aIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597546; c=relaxed/simple;
	bh=R2B4jIQdKb/vkOWps+vUmipjuzkyZom/shTiK3robDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fEDR2GnrtppFetoA1I2PjrZW6KCEKftRviT6b0QRuNSODvk6RLU0QtuUIm7vpGjyD1ehGECIj+d0kw5JeWs+TGXdXleUU9ZKT821GiZlXfdHS9m5c9ohSuCGj8tCFzxWQD5QekCvKD8tcP2b5YHL2YLMzNWIEgywlhFGqH3+TQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+EwMecz; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-860f0e91121so3073504241.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738597544; x=1739202344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+IOsVY4ARCr7MU51vy1vztEjycwnWv4/baRhzXM9zw=;
        b=T+EwMeczh3ykeoDl4idbuPr9CXrI1NpGKFpezzbnlohTwQ+Y4abKYRBaTXQE6YwNrK
         RBzgVoPZg3T5QJztdng+b7OfQRwOIgW3zoSrgJYvMLhiawdtVAVaiHsdbkNaoujHfMZ1
         ZPwEjK4r6T0Je04nwud3U2DvsJLMapzgNjh+yacv3KCgNeKNhyEKoKkXQbf+Cuxzb16+
         xhwaUx9odZN6hM5TdbcunMXxojUVyO3WxYXTFXZxr7oZYpnZfUjTomhV2LDqgQFqulMT
         F5VHOXiEeUKH5lZRzigy1o6QxM/ubj7JEXazo261Waq4MlQ4180wbVkVCMMhRk407bsa
         wJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738597544; x=1739202344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+IOsVY4ARCr7MU51vy1vztEjycwnWv4/baRhzXM9zw=;
        b=PFdRooqgsBe74z9wEK0SA4elw+uSjpcWZrT84G9otHPA5ewl0sw4ia+ewF5ginUqSQ
         N44RHtQxvlLHgxYJNjwIGE6bKYjWsGI1MAYI5Lsef1KeZkjHMJnHMzFOYuka21xJF3Gw
         H8uvaLCHMtHyiSiShZwrha1UojazUr4rmY/z9cvxVr+btORDEyYh9Lot7h2lB1SvMvsn
         Pqab3aMbyETex7ymJNSUhl8EKfQW1L4ifrLe3/cqpkReY3ACrjoeiaz08HjskalL2MDY
         9/ELrHjHjgoha5BayOdPoy16myXqXi2uXO8n1coB0AFdd2+B9Ajq1GMZcRDryk5hautj
         psew==
X-Gm-Message-State: AOJu0YzTJbAq833MHEypdAJuGAsbMWxOP7NfWqT4tw9vbIUjAsMQm67k
	Us7YH371+yX53AzT4jjTm0a9EU444fH6uyhyGa95PSFMyHFj3E3pysN30Z6/s+97AsT/HlVFjRe
	awsuF/diltvIl7an9PJmrjj8fo1A=
X-Gm-Gg: ASbGncsTjJyDyZeeUGoFLeW1xmgEBjTA9HqSRwrOvhlVwI9Dx/WIYpqKLYTaAIJOpRN
	QCGkKOX0E+vDu+z0ZT0tYrFeozh8Y1yZOGI8+FHmiq1GGPup3RaRdaFwmOdWkUtr3AV/WH3gk
X-Google-Smtp-Source: AGHT+IEKjg7nl9qIgi3vxLaKyVYMl3TMsCMX96XHniGqFps3ytd9gHoEMH7wBzanjklhw487INoiKlWCNXYHULyfBp0=
X-Received: by 2002:a05:6122:2206:b0:516:1b30:8779 with SMTP id
 71dfb90a1353d-51eaf08984cmr10819819e0c.6.1738597543974; Mon, 03 Feb 2025
 07:45:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com> <20250203085853.1361401-6-sakari.ailus@linux.intel.com>
In-Reply-To: <20250203085853.1361401-6-sakari.ailus@linux.intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Feb 2025 15:45:18 +0000
X-Gm-Features: AWEUYZkrmvtvuHoC2ATK-5FZ3WO2qd4URlkBkEOdYQ5kwKWfrYJad2cGJeJ_BBY
Message-ID: <CA+V-a8uUySbRAy5YSJ-s+wo8Y5aM82moonn-gef-euVg0rnWPQ@mail.gmail.com>
Subject: Re: [RFC v5 05/15] media: Documentation: Add scaling and post-scaler
 crop for common raw
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 8:59=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Document scaling and post-scaler digital crop operations for the common
> raw sensor model.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rs=
t b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> index b0bd09772ceb..f15e5495cc34 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -118,11 +118,18 @@ sub-sampling to achieve the desired size.
>
>  The digital crop operation takes place after binning and sub-sampling. I=
t is
>  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, strea=
m) pair
> -0/0. The resulting image size is further output by the sensor.
> +0/0.
> +
> +The scaling operation is performed after the digital crop. It is configu=
red by
> +setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0=
,
> +relative to the digital crop.
>
>  The sensor's output mbus code is configured by setting the format on the=
 (pad,
> -stream) pair 0/0. When setting the format, always use the same width and=
 height
> -as for the digital crop setting.
> +stream) pair 0/0. The width and height fields are used to configure post=
-scaler
> +digital crop if supported by the driver, affecting the right and bottom =
edges of
> +the frame. If post-scaler digital crop is not supported, the width and h=
eight
> +fields of the format will match the compose rectangle sizes applied on t=
he same
> +0/0 (pad, stream) pair.
>
>  Drivers may only support some of even none of these configurations, in w=
hich
>  case they do not expose the corresponding selection rectangles. If any s=
election
> @@ -180,12 +187,19 @@ Also refer to :ref:`Selection targets <v4l2-selecti=
on-targets-table>`.
>        - X
>        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_C=
OMPOSE``
>          rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - ``V4L2_SEL_TGT_COMPOSE``
> +      - \-
> +      - X
> +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> +        rectangle on (pad, stream) pair 0/0.
>      * - 0/0
>        - Format
>        - X
>        - X
> -      - Image data source format. Always assign the width and height fie=
lds of
> -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> +      - Image data source format and post-scaler crop. The width and hei=
ght
> +        fields of the format, used to configure post-scaler crop on the =
right
> +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT=
_COMPOSE``
>          rectangle on (pad, stream) pair 0/0. The media bus code reflects=
 the
>          pixel data output of the sensor.
>      * - 0/1
> --
> 2.39.5
>

