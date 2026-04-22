Return-Path: <linux-media+bounces-59273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGZhJBxV6GkcJQIAu9opvQ
	(envelope-from <linux-media+bounces-59273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:57:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E18F544208C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89010303CEB9
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 04:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180E12E0B5C;
	Wed, 22 Apr 2026 04:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUYB4Zic"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C922C325C
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776833589; cv=pass; b=BE4HFC6smXj/9VkYdiIZkgwBN+QTA2R83kMUx5APHRUSCnlnfCGvlXxVtAg8IrqS9KZ7W41vHOKvkvFL/d3t+50mE5+5gJHVotl4oJ/deEABnOlyK0vR+O6SyBQXHxKPheRas3fUg9NxFiwAMtYyI8oSsWVNz246lESmklUZJEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776833589; c=relaxed/simple;
	bh=7JxIR1evf6uoeZklR1j4XWwFV73Bf8cVxdP9i/m78mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/3wpVJgA0iHiHQQl0i6z0s3I35dVM9wvsy6IlyiORc++7LKz0D0+XtQzxPP5y8jZIkdsx0kX8NmhggXrVZMQjbOXU/+8CHnYVdTBUrbVU3j/Y0thofNTVZd/EB6/HVC1Q4HXxDIHd+fYjFSY6CzAAKE/4Pqi36C97j+IyG8CwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUYB4Zic; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbec19732eso4427610a34.3
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 21:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776833587; cv=none;
        d=google.com; s=arc-20240605;
        b=gOkEVVfzLkjvpxs56aEFO42AeCSKrDTzU08nOUdSqdds6qwIeURcSUcdzR1mpTJC/M
         Q78ViFQeyXoPDq7Q6l90ZHzhwScwdDdtXuS5UYvt1xiSKYta6SMahJzBBJWGjO3p9tRM
         zysZSEqtGWbBsaR1J5+xSRWsndPjZEpBB954Kyd+x++4Cmy9Rq1VSI6uXCX01uuImtv8
         qmPJSbWHK9QoNrpIQHmPdB6boNY3qGiaTBqYrf75butKIAZPT34s6Bza526SzncElJQX
         cQwA94nhR43MBAoalb6igBZEUC+chlddbtGk6NT5l1HbU1lZhS2iYd3pmaOcgWzFaT8b
         E4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tRkGrclI0mBsZSfdpLDaPDeWbPieOyl8ARy2Cp3anbs=;
        fh=QFtkXplWZqndlM3Sf+Bmecz2UJqjZhvwUmq7RKOh3bo=;
        b=Zdy6pLPQmhLu2IoDxS/ebU3c4JObY4krwhq1P7Mlco0OZ0HlOhe+sb/D63FFcztXB/
         voh4rQ9FS5kylFP6hYYbnFGsdINC2ZIOLjx8un/K5AEY0QswQsTnzfQYpQW87+C6fldU
         ZI/vmqGCIr1j9nSucgf4XEfamgZxc32x++H7UvWBOzwi7C6oyB9gslJCpMyp+KomG/O7
         /jwPeznGTM4OhBvY7QBJm+mdow+YK+ypqQ7kC/wlHxs3aeZr9UCJEi2X0MQB1ODca1JF
         TV+mMSu1HIBigwvmZQBp9AT+HKBvgZqWawCQk0gcjBkBugpJ/u0f3PBueW6oXwHhS2Y7
         uYAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776833587; x=1777438387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRkGrclI0mBsZSfdpLDaPDeWbPieOyl8ARy2Cp3anbs=;
        b=RUYB4Zic3TLM5X2sc0oC+kqchdl3KRdn02fy7+WuTCEdgeWMQ0Yfqi/NpJUzrpJKev
         px4b2sK9hB9NnRcd8BNJQvxnhyEynYCIUKOctyHJEP1czcjiieO25GohqosL2Fg3RU3h
         UZnIYhHLwj1Fxc1oOzweyFECeO/z9i0vbjP9VQ4WmWUKKrKhsnPHorZoqWOG/SMwWX5n
         xmkxH/dzRgkXNkkZ6/OJA1a1SLRQDQlKTUNkcMlLNfwsC84emb5Wulf/iAGN4muiQjCC
         BWBwveJWIqaHBlklE5GJOcs7dRbtLmR3bQsob0BQScibRBqxVgNuXWsTD01I1k3iGAZE
         yy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776833587; x=1777438387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tRkGrclI0mBsZSfdpLDaPDeWbPieOyl8ARy2Cp3anbs=;
        b=OeBYYBZO1eOGqKtQC2snvSDEMTYBe+BRafcVAe38WnvClVkS9E0/i01+zCIEZ9zUSL
         c/ugkNusk0Jld5znqBFNSjadQlsvD59uU4yC7MmX0wRRFh/gFFWMDBaDriLSnl7NTrLg
         MePt48eYw+bYtraaIwld1sN9qNKQyYOy8rOwL41Ti5AWZC8z0lzf0J/ZQinYC9SEPRqO
         8LzYa6pIfvsYmo/oC9gLOScOqALcZ7eRoe7oMmtr4p70ts2TDGzHlrgX3WY0fswqkVEA
         aTdoLOss1jNIA2pBIpNz9TPyFJf4/Oz/hXRPa7MSFA/99WMIvrpSVmYasFWVeEx5vgoB
         0GuQ==
X-Gm-Message-State: AOJu0YwdawEleJ8Zlq3z9YpniKwPXNv1rrlLVxhh1gALYDs7Sss4xDnu
	gDwyMkLyS0rGKGewg+Oam59i0bCN3Lk1DWKT8IiSvCeJoGtWsD49VBzrJL44DCs5uo7GHPXrkUp
	iBLNo3b0pz0eZNPdYZAXNNNQdmySKnz2SoU9WV+s=
X-Gm-Gg: AeBDietJFyDo2+pWVd41LVEM+ff6YCIsv18W5DOQhlmu3NFKN+fZ40LECdb4zR/GdCr
	cvNzW4R2UGDdGjo56hkAod+y60L4rDFzCqCDJ9go4Rus//iW3frqFmAgWczGscl4hKpw3MM6Vwf
	/wNFKEd8DF1MvKkJFGLusjpO0clq2LMAtqvyQ2xl0GalAqqoU1kw3M+76BfJx6i8H66G/s49qG1
	0+/IlEqCLj213ZK+0/MleLyXtQ1BS/36KCQQDUJmWE9hJ2WjmenKDsVbwQRgQ3BrEB6puYCJOYg
	OCxkSvxBl7ZqV52v2qKUH3qSjfQE40XlYfLFgTtamMIZibocDBkHjDp0RyR6mIDcwMXMzfVTODO
	X0nA=
X-Received: by 2002:a05:6820:162c:b0:695:b571:e579 with SMTP id
 006d021491bc7-695b571faa3mr15720eaf.10.1776833586790; Tue, 21 Apr 2026
 21:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214050943.6306-1-arash.golgol@gmail.com>
In-Reply-To: <20260214050943.6306-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 22 Apr 2026 08:23:16 +0330
X-Gm-Features: AQROBzBFnDqrchgvEfWAAWvQNi_wn-YCQ35sx-0Z7I-ZU1mNeNTjPho-SF69ozI
Message-ID: <CAMxPZkhkjqd2Y91TUpZsTJT2SppPqLrQpdYi5LWmzM8tLxV8Tg@mail.gmail.com>
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, linux-sunxi@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59273-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E18F544208C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I was hoping this patch would make its way into media-tree, but it seems
it hasn't been applied yet.

Is there anything missing or any modifications needed from my side?
I'd appreciate any feedback.

Regards,
Arash Golgol

On Sat, Feb 14, 2026 at 8:40=E2=80=AFAM Arash Golgol <arash.golgol@gmail.co=
m> wrote:
>
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
>
> The sun6i-mipi-csi2 hardware does not perform any format conversion.
> Enforce identical formats on the sink and source pads in the set_fmt()
> and init_state() callbacks.
>
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes in v3:
>     - link to v2: https://patchwork.kernel.org/project/linux-media/patch/=
20260209055529.16644-1-arash.golgol@gmail.com/
>     - Keep error path jumping to error_v4l2_notifier_cleanup on
>     bridge setup failure
>
> Changes in v2:
>     - link to v1: https://patchwork.kernel.org/project/linux-media/patch/=
20260206123455.46476-1-arash.golgol@gmail.com/
>     - Simplify control flow by dropping the else at end of s_stream()
>     - Call v4l2_subdev_cleanup() on bridge setup failure before
>     notifier registration
>
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++---------
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  2 files changed, 53 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2=
.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> index b06cb73015cd..682bdd82098c 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi=
_csi2_device *csi2_dev)
>                            SUN6I_MIPI_CSI2_CTL_EN, 0);
>  }
>
> -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi=
2_dev)
> +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi=
2_dev,
> +                                      const struct v4l2_mbus_framefmt *m=
bus_format)
>  {
>         struct regmap *regmap =3D csi2_dev->regmap;
>         unsigned int lanes_count =3D
>                 csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> -       struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
>         const struct sun6i_mipi_csi2_format *format;
>         struct device *dev =3D csi2_dev->dev;
>         u32 version =3D 0;
> @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>         struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_sub=
dev;
>         union phy_configure_opts dphy_opts =3D { 0 };
>         struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi=
_dphy;
> -       struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *mbus_format;
>         const struct sun6i_mipi_csi2_format *format;
>         struct phy *dphy =3D csi2_dev->dphy;
>         struct device *dev =3D csi2_dev->dev;
> @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subd=
ev *subdev, int on)
>         unsigned long pixel_rate;
>         int ret;
>
> -       if (!source_subdev)
> -               return -ENODEV;
> +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
> +       if (!source_subdev) {
> +               ret =3D -ENODEV;
> +               goto unlock;
> +       }
>
>         if (!on) {
>                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
> @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>
>         ret =3D pm_runtime_resume_and_get(dev);
>         if (ret < 0)
> -               return ret;
> +               goto unlock;
>
>         /* Sensor Pixel Rate */
>
> @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>                 goto error_pm;
>         }
>
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_MIPI_CSI2_PAD_SI=
NK);
>         format =3D sun6i_mipi_csi2_format_find(mbus_format->code);
>         if (WARN_ON(!format)) {
>                 ret =3D -ENODEV;
> @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>
>         /* Controller */
>
> -       sun6i_mipi_csi2_configure(csi2_dev);
> +       sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
>         sun6i_mipi_csi2_enable(csi2_dev);
>
>         /* D-PHY */
> @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>         if (ret && ret !=3D -ENOIOCTLCMD)
>                 goto disable;
>
> -       return 0;
> +       ret =3D 0;
> +       goto unlock;
>
>  disable:
>         phy_power_off(dphy);
> @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>  error_pm:
>         pm_runtime_put(dev);
>
> +unlock:
> +       v4l2_subdev_unlock_state(state);
>         return ret;
>  }
>
> @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbu=
s_framefmt *mbus_format)
>  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
>                                       struct v4l2_subdev_state *state)
>  {
> -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> -       unsigned int pad =3D SUN6I_MIPI_CSI2_PAD_SINK;
> -       struct v4l2_mbus_framefmt *mbus_format =3D
> -               v4l2_subdev_state_get_format(state, pad);
> -       struct mutex *lock =3D &csi2_dev->bridge.lock;
> +       unsigned int pad;
>
> -       mutex_lock(lock);
> +       /*
> +        * This subdev does not perform format conversion,
> +        * initialize both pads identically.
> +        */
> +       for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> +               struct v4l2_mbus_framefmt *mbus_format;
>
> -       mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> -       mbus_format->width =3D 640;
> -       mbus_format->height =3D 480;
> +               mbus_format =3D v4l2_subdev_state_get_format(state, pad);
>
> -       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +               mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_cod=
e;
> +               mbus_format->width =3D 640;
> +               mbus_format->height =3D 480;
>
> -       mutex_unlock(lock);
> +               sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +       }
>
>         return 0;
>  }
> @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *=
subdev,
>         return 0;
>  }
>
> -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> -                                  struct v4l2_subdev_state *state,
> -                                  struct v4l2_subdev_format *format)
> -{
> -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &csi2_dev->bridge.lock;
> -
> -       mutex_lock(lock);
> -
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> -                                                            format->pad)=
;
> -       else
> -               *mbus_format =3D csi2_dev->bridge.mbus_format;
> -
> -       mutex_unlock(lock);
> -
> -       return 0;
> -}
> -
>  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
>                                    struct v4l2_subdev_state *state,
>                                    struct v4l2_subdev_format *format)
>  {
> -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &csi2_dev->bridge.lock;
> +       struct v4l2_mbus_framefmt *fmt;
>
> -       mutex_lock(lock);
> +       /* The format on the source pad always matches the sink pad. */
> +       if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> +               return v4l2_subdev_get_fmt(subdev, state, format);
>
> -       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +       sun6i_mipi_csi2_mbus_format_prepare(&format->format);
>
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> -                       *mbus_format;
> -       else
> -               csi2_dev->bridge.mbus_format =3D *mbus_format;
> +       /* Set the format on the sink pad. */
> +       fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> +       *fmt =3D format->format;
>
> -       mutex_unlock(lock);
> +       /* Propagate the format to the source pad. */
> +       fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_S=
OURCE);
> +       *fmt =3D format->format;
>
>         return 0;
>  }
>
>  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops =3D {
>         .enum_mbus_code =3D sun6i_mipi_csi2_enum_mbus_code,
> -       .get_fmt        =3D sun6i_mipi_csi2_get_fmt,
> +       .get_fmt        =3D v4l2_subdev_get_fmt,
>         .set_fmt        =3D sun6i_mipi_csi2_set_fmt,
>  };
>
> @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_=
mipi_csi2_device *csi2_dev)
>         bool notifier_registered =3D false;
>         int ret;
>
> -       mutex_init(&bridge->lock);
> -
>         /* V4L2 Subdev */
>
>         v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i=
_mipi_csi2_device *csi2_dev)
>         if (ret)
>                 return ret;
>
> +       /* V4L2 Subdev finalize */
> +
> +       ret =3D v4l2_subdev_init_finalize(subdev);
> +       if (ret < 0)
> +               goto error_media_entity_cleanup;
> +
>         /* V4L2 Async */
>
>         v4l2_async_subdev_nf_init(notifier, subdev);
> @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_=
mipi_csi2_device *csi2_dev)
>  error_v4l2_notifier_cleanup:
>         v4l2_async_nf_cleanup(notifier);
>
> +       v4l2_subdev_cleanup(subdev);
> +
> +error_media_entity_cleanup:
>         media_entity_cleanup(&subdev->entity);
>
>         return ret;
> @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2=
_device *csi2_dev)
>         v4l2_async_unregister_subdev(subdev);
>         v4l2_async_nf_unregister(notifier);
>         v4l2_async_nf_cleanup(notifier);
> +       v4l2_subdev_cleanup(subdev);
>         media_entity_cleanup(&subdev->entity);
>  }
>
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2=
.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> index 24b15e34b5e8..d72dfbd6a993 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
>         struct media_pad                pads[SUN6I_MIPI_CSI2_PAD_COUNT];
>         struct v4l2_fwnode_endpoint     endpoint;
>         struct v4l2_async_notifier      notifier;
> -       struct v4l2_mbus_framefmt       mbus_format;
> -       struct mutex                    lock; /* Mbus format lock. */
>
>         struct v4l2_subdev              *source_subdev;
>  };
> --
> 2.34.1
>

