Return-Path: <linux-media+bounces-50695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A95B2D1EE70
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5C3A303E650
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 12:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1B0399A5E;
	Wed, 14 Jan 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gKPJV0TZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359FB399A59;
	Wed, 14 Jan 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395092; cv=none; b=g8X4LtWHXI/zQMZW75UDya3FGcYzHE6iNfxuz+xHop/NyrWvb1jyUgs+UzhJXg55rvLBzkSceSDNPxXTahb4FG0LKx3+HkSz7ON86mC34KsemvAytWbP0AKgQ/R0EEUe8AjefaD4utfMku3ZELr6jtUYWqWA5q2DVxs7Sena3Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395092; c=relaxed/simple;
	bh=LvhYESA3d/xLPNEnsIiUTbDMUK5xZBgP4wYl7OyKiPg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=osAq7XMJnl9mXuQMhIagY83rPOCsYlgoS5aXuiLjEdXhP11wpRq2hae8+MMTHtlP1mu7/QTP7MC6amCLpAceLq6udajec1hyfJexOmW0ETsvo8MhAf23zC/r9bagA7zRg0QRTpZ6mHqkVvv+dhwE8eNnpLxGOzgaODbyu95UHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gKPJV0TZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:76ee:df3c:dc54:9316:8c06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B11E51D1C;
	Wed, 14 Jan 2026 13:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768395060;
	bh=LvhYESA3d/xLPNEnsIiUTbDMUK5xZBgP4wYl7OyKiPg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gKPJV0TZL7DpdFfPqhISX9/wmMFI54zNFEjDo9PkLQfmRzuZmAeQJNye1SZKH4Yvn
	 pWboHp2TJandomfOPJDB/Wi6c+MtYRIdcrXgrdkC2n/WgT+/cB1W8EtpDhILbZaH4K
	 BUgyQQeQvZEa1uDgjceaWNF2XqNHMCkVKz9djoPo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251230083220.2405247-9-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com> <20251230083220.2405247-9-r-donadkar@ti.com>
Subject: Re: [PATCH v9 08/19] media: staging: starfive: Move to enabel-disable streams in starfive drivers
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Wed, 14 Jan 2026 18:21:21 +0530
Message-ID: <176839508123.9154.16324392708272572564@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Rishikesh,

Thanks for the patch.

> Subject: [PATCH v9 08/19] media: staging: starfive: Move to enabel-disabl=
e streams in starfive drivers

s/enabel/enable

Quoting Rishikesh Donadkar (2025-12-30 14:02:09)
> The enable_streams() API in v4l2 supports passing a bitmask to enable
> each pad/stream combination individually on any media subdev. Use this
> API instead of  s_stream() API in the starfive drivers

nit: I think the description can be explicit that this driver does not
support "multiple streams" (at least right now), but just switching to the
new API while ignoring the passed streams mask.

>=20
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../staging/media/starfive/camss/stf-isp.c    | 43 ++++++++++++-------
>  .../staging/media/starfive/camss/stf-video.c  |  4 +-
>  2 files changed, 30 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/sta=
ging/media/starfive/camss/stf-isp.c
> index df7a903fbb1b0..4930ffb0e07a6 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp.c
> @@ -55,27 +55,43 @@ int stf_isp_init(struct stfcamss *stfcamss)
>         return 0;
>  }
> =20
> -static int isp_set_stream(struct v4l2_subdev *sd, int enable)
> +static int isp_sd_enable_stream(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *state,
> +                               u32 pad, u64 streams_mask)
>  {
>         struct stf_isp_dev *isp_dev =3D v4l2_get_subdevdata(sd);
>         struct v4l2_subdev_state *sd_state;
>         struct v4l2_mbus_framefmt *fmt;
>         struct v4l2_rect *crop;
> +       int ret;
> =20
> -       sd_state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +       sd_state =3D v4l2_subdev_get_locked_active_state(sd);
>         fmt =3D v4l2_subdev_state_get_format(sd_state, STF_ISP_PAD_SINK);
>         crop =3D v4l2_subdev_state_get_crop(sd_state, STF_ISP_PAD_SRC);
> =20
> -       if (enable) {
> -               stf_isp_reset(isp_dev);
> -               stf_isp_init_cfg(isp_dev);
> -               stf_isp_settings(isp_dev, crop, fmt->code);
> -               stf_isp_stream_set(isp_dev);
> -       }
> +       stf_isp_reset(isp_dev);
> +       stf_isp_init_cfg(isp_dev);
> +       stf_isp_settings(isp_dev, crop, fmt->code);
> +       stf_isp_stream_set(isp_dev);
> +
> +       ret =3D v4l2_subdev_enable_streams(isp_dev->source_subdev, 1, BIT=
(0));

Given you have a streams_mask argument in this function now, it might be
cleaner to use it here (and let stf-video populate it with BIT(0)).

> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> =20
> -       v4l2_subdev_call(isp_dev->source_subdev, video, s_stream, enable);
> +static int isp_sd_disable_stream(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state,
> +                                u32 pad, u64 streams_mask)
> +{
> +       struct stf_isp_dev *isp_dev =3D v4l2_get_subdevdata(sd);
> +       int ret;
> +
> +       ret =3D v4l2_subdev_disable_streams(isp_dev->source_subdev, 1, BI=
T(0));

Same here.

> +       if (ret)
> +               return ret;
> =20
> -       v4l2_subdev_unlock_state(sd_state);
>         return 0;
>  }
> =20
> @@ -300,20 +316,17 @@ static int isp_init_formats(struct v4l2_subdev *sd,
>         return isp_set_format(sd, sd_state, &format);
>  }
> =20
> -static const struct v4l2_subdev_video_ops isp_video_ops =3D {
> -       .s_stream =3D isp_set_stream,
> -};
> -
>  static const struct v4l2_subdev_pad_ops isp_pad_ops =3D {
>         .enum_mbus_code =3D isp_enum_mbus_code,
>         .get_fmt =3D v4l2_subdev_get_fmt,
>         .set_fmt =3D isp_set_format,
>         .get_selection =3D isp_get_selection,
>         .set_selection =3D isp_set_selection,
> +       .enable_streams =3D isp_sd_enable_stream,
> +       .disable_streams =3D isp_sd_disable_stream,
>  };
> =20
>  static const struct v4l2_subdev_ops isp_v4l2_ops =3D {
> -       .video =3D &isp_video_ops,
>         .pad =3D &isp_pad_ops,
>  };
> =20
> diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/s=
taging/media/starfive/camss/stf-video.c
> index a0420eb6a0aa0..2db29bf8bdef8 100644
> --- a/drivers/staging/media/starfive/camss/stf-video.c
> +++ b/drivers/staging/media/starfive/camss/stf-video.c
> @@ -287,7 +287,7 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
> =20
>         video->ops->start_streaming(video);
> =20
> -       ret =3D v4l2_subdev_call(video->source_subdev, video, s_stream, t=
rue);
> +       ret =3D v4l2_subdev_enable_streams(video->source_subdev, 1, BIT(0=
));

Now that I think of it, it was not necessary to implement enable / disable
API for the ISP subdev driver given v4l2_subdev_*_streams falls back on
s_stream. But it's anyway good to move drivers, so I guess it's alright.

>         if (ret) {
>                 dev_err(video->stfcamss->dev, "stream on failed\n");
>                 goto err_pm_put;
> @@ -311,7 +311,7 @@ static void video_stop_streaming(struct vb2_queue *q)
> =20
>         video->ops->stop_streaming(video);
> =20
> -       v4l2_subdev_call(video->source_subdev, video, s_stream, false);
> +       v4l2_subdev_disable_streams(video->source_subdev, 1, BIT(0));
> =20
>         pm_runtime_put(video->stfcamss->dev);
> =20
> --=20
> 2.34.1
>=20
>=20

Thanks,
    Jai

