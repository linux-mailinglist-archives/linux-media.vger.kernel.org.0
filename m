Return-Path: <linux-media+bounces-25599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E9A25F30
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 16:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC6D5162DE8
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 15:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07C1209F5C;
	Mon,  3 Feb 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKyLjYpH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C86209F45
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597632; cv=none; b=RnZqCaUeGMnUDr7+icopG3dS59zfFv6h93uiI0VnN/Qb/1fGQCjjhdG6iLO3F4gf8Y78dUn7d3m78rz1myIPb8Xa+aoce2IIKky9g+e3+9d1uRjgmBriyDEz9E7+rjMO+5sVHMZUi4gimsVtKSWrJYI7omQMdgbc20SFlQmPzao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597632; c=relaxed/simple;
	bh=FV/2089FDbqRkHZlKDcuo7PwbcWXdMaCBoAUmpp3xxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLDWN4vsmL8XMWpcwQrt7n4Kf0j/2eByqhbRr6bnW8+C+IWR2vVHYT80rJlmjBS+ZaSG+kf1xuCurGXL2R9tAAnA3ei7J2dfa+dMtKV/w/d2zrKNIrb8Tw49tm4twYOWqD3p9r1n0OnmsCRg0+Gmunco7ygYpJazPwY3LIkOcvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKyLjYpH; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso2453780241.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738597628; x=1739202428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yjO6bNc+kjDdPIYt8K1odcJ4xQyqy1EKrl9KRJqNpY=;
        b=IKyLjYpH69eqPolTR/jK8BaNGDhfFUvxIh1kkHwmLUe5IY6GuC8K/GXY1qb/SsrF4n
         tEjgKZ7vNVO8oKNYHObLop2DGD85uNLp+kiz4PJSjYpgrvZbr6znXcnK4kz9PtgXOvU8
         OBKlmNxg1xP2w8jljXt13ZGOwyHytz/gWz32J8+jVcHa9pYSvJloC+U4UKV81b1k27bz
         +hZEiRRk2EA6P81KPmwYw/DrGTmaIym7za7j2Fe7UUUJkqZHV1e1t6yu4lXC1tn5xSTV
         0HiK/UkhHBBTth+r9wmNoPhajYAhv8r6l6NhfMZCs/cGl123yejlGSQET1hBuvWHMA+H
         /QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738597628; x=1739202428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yjO6bNc+kjDdPIYt8K1odcJ4xQyqy1EKrl9KRJqNpY=;
        b=TMflXvV62+f+plSjvDc4lnXzAEkKEpktokKutDqx6BlHACjVLBzPuwrKiDouilfaLR
         2QTQmj7tBYs6u3lvlHViTNmxG3j0s47XHWgJZrSxLB+Oe74ZGXP+mU1qtSWmGNd5v6WR
         DMarQw9hqbjao0FiNalpfQLYY7acbl86XDxzVAP2i3Dg/kzNt5zdyR0A0kzvkoFrjCI8
         zrYmkMAhtn/6eHAxNojY+dQmHRs+KTE+d3XAZYk769x9sQD0a/6SCno+havfm1iBs7dm
         zjoo0w8o+1yw20pS6pBH7YjR4vcRLUS0VfMJRKKtzTU1rv3gZ8k1jq8GOWRudF+IPSFH
         aJNQ==
X-Gm-Message-State: AOJu0YyyWcCHE3v18STAvjLXXewA44lh5XXKdHu5kZvPCjizyaYk0QnH
	S7brwSAp/RMw7z5Q+UZAPzeMRMaoBbp9Y9nIpSOQOmQp0XSJn1j35w4ju+a/5IHNZE+tIhXZ4Cl
	giDA1sEhZiPdD9amBQROUhyXiG23UevlhN+E=
X-Gm-Gg: ASbGnctbbzdpyXv5a1M9ICWEWNl12LtWwPl8T/W0ZF6L65aSmo/nHfZaTthdugDhCxL
	QyWsKj7x9EyAFFmaAqUpQ6SmTvz8ddM8nQ4pxLOAMPic3JBaE2yCEkqFEKjoepvQSgRGsAN0X
X-Google-Smtp-Source: AGHT+IGdIIzyfccwd7cigg0GjaLVXgwDbsnNWxoX0aSyk/wZYwbBh7ifY9vIZpcvGCgyGWOrhhEsSGsdb3P0auU+Kw8=
X-Received: by 2002:a05:6122:3181:b0:51b:8949:c9a7 with SMTP id
 71dfb90a1353d-51e9e5161abmr15952563e0c.8.1738597628525; Mon, 03 Feb 2025
 07:47:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com> <20250203085853.1361401-7-sakari.ailus@linux.intel.com>
In-Reply-To: <20250203085853.1361401-7-sakari.ailus@linux.intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Feb 2025 15:46:42 +0000
X-Gm-Features: AWEUYZlts5y64ujwgmKpckBD0rZYfbqC6je986XFleXbT6JFfG32_A7JYQAPHSk
Message-ID: <CA+V-a8sRGK1+5NFnoq7UNjgYyaa+LYUxJB0SB+bdjW61byEr9A@mail.gmail.com>
Subject: Re: [RFC v5 06/15] media: uapi: Add V4L2_CID_CONFIG_MODEL control
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
> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
>  include/uapi/linux/v4l2-controls.h                           | 3 +++
>  3 files changed, 12 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-proces=
s.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 27803dca8d3e..2ae17ed99729 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -55,3 +55,7 @@ Image Process Control IDs
>      control value divided by e.g. 0x100, meaning that to get no
>      digital gain the control value needs to be 0x100. The no-gain
>      configuration is also typically the default.
> +
> +``V4L2_CID_CONFIG_MODEL (bitmask)``
> +    Which configuration models the sub-device supports. Please see
> +    :ref:`media_subdev_config_model`. This is a read-only control.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 1ea52011247a..24c9c25e20d1 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_TEST_PATTERN:             return "Test Pattern";
>         case V4L2_CID_DEINTERLACING_MODE:       return "Deinterlacing Mod=
e";
>         case V4L2_CID_DIGITAL_GAIN:             return "Digital Gain";
> +       case V4L2_CID_CONFIG_MODEL:             return "Sub-device config=
uration model";
>
>         /* DV controls */
>         /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> @@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enu=
m v4l2_ctrl_type *type,
>         case V4L2_CID_DV_RX_POWER_PRESENT:
>                 *type =3D V4L2_CTRL_TYPE_BITMASK;
>                 break;
> +       case V4L2_CID_CONFIG_MODEL:
> +               *flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +               *type =3D V4L2_CTRL_TYPE_BITMASK;
> +               break;
>         case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>         case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
>                 *type =3D V4L2_CTRL_TYPE_INTEGER;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 974fd254e573..731add75d9ee 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN                  (V4L2_CID_IMAGE_PROC_CLAS=
S_BASE + 3)
>  #define V4L2_CID_DEINTERLACING_MODE            (V4L2_CID_IMAGE_PROC_CLAS=
S_BASE + 4)
>  #define V4L2_CID_DIGITAL_GAIN                  (V4L2_CID_IMAGE_PROC_CLAS=
S_BASE + 5)
> +#define V4L2_CID_CONFIG_MODEL                  (V4L2_CID_IMAGE_PROC_CLAS=
S_BASE + 6)
> +
> +#define V4L2_CID_CONFIG_MODEL_COMMON_RAW       (1U << 0)
>
>  /*  DV-class control IDs defined by V4L2 */
>  #define V4L2_CID_DV_CLASS_BASE                 (V4L2_CTRL_CLASS_DV | 0x9=
00)
> --
> 2.39.5
>

