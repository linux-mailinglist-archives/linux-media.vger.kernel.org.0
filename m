Return-Path: <linux-media+bounces-57628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H9FHRuDymkW9gUAu9opvQ
	(envelope-from <linux-media+bounces-57628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:05:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960735C8A1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35CF7300D163
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DB33A3E8F;
	Mon, 30 Mar 2026 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiiIG7nC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F11A3D5239
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879124; cv=pass; b=q3OaGlsp8u51UMtzUnyyiw8sjV1xQUJYoa85Z65hQTHh/3gvnJ+0AqSXpbxV1CbZ7PDtZXWmEjTjNWEKE0nN4PES82/pCJryFq3wIuRNTOH/fjw/eiUiFva7hemFCbU7nwHNENRrVkNYMhICVh4z9sw1Fgzv/SrEwB56cBiI/V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879124; c=relaxed/simple;
	bh=9oX35eGN9F34aceP5tpg/tZ7tYX8RiLGnZrxd4RgJAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZ+UhSe83bPgNBjuaIXHu0jAAaGAk2pglTNX1iiWOy4Fcunz/4xqNzm2ZXa4ZdVd1LOQznlLvjoO3Vf2OJgR99M3LGuMTImps2nAMrhVc1deUBHIibk2Cupqx3mwTiUq1kXsJ/KT018kPeSEELknlakwaYtBDDdqjnREgJ37afw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiiIG7nC; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-487012ce896so27717885e9.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 06:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774879116; cv=none;
        d=google.com; s=arc-20240605;
        b=S4wpWUqEwJQTQuUr1tQMQXCW6Q6Qk7LM2kVoBV793hklCX3UtvkU0bekqYdOStk+/a
         9GSpV5h0CvxcEULy9UzKbNgUF5sk4c4Nx/Ft4WT6ttx4pE6VLkoFoIX/Lox+ftNjiGbi
         KYpAvMDs8fg7KBzpW31hhAPWmpEGBk3vwiKM2dyPXlS0BLqzVakW2C+eE05in+7uxQdW
         GJT0Osn2O7sZM6rr+ME+2lCqDfWgcpFgrm1FvvfysJ4pUvEkMKcsG5B2T6LHni6p0B3y
         S9PtyXeCuvWjCxXIpasRw+deKXjATHnN3tDEjlnoAJRDwPcA1aQIHjO+oFvrhuQP0YOg
         XZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sNUXIrSMtYRUrokf/3Xjtgk09ZQTx2oqQlz31u4CVbg=;
        fh=5SSjTusMzOrONDaI2a39Gv2IFwtrZuj45mddYqgnHgc=;
        b=G8GCXKjPTLq7hwiDzN1NOzttpy9eFbyt1CcbB+1ZE5cMDSoQ7snu3QAGNxr7c7Y6hj
         ouOcs3X/V9duajcmB9o9lb+M4zZoESl/CtkbjRdEhrN42opbF00A2ZzPYQqFxQgaxtd2
         LssAX9Oq2L90EBmx427JyE+5ZbBQKoCHeKgl8TZhivdvyn/9vUdfMEYnw0zJc43u8iDf
         PQUoN/H9a5E5UngtRO6x4vZREpkJ4QQ7hzy/HE9qegUbvt1hRRUTvIRlmk58mOkp9u0M
         VJz+s7jX/isJj+n9H4221a8nA7AfQ4jojETMGbtrXL7LTziiO8VgNQypUKdSQI6bHc+K
         59tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774879116; x=1775483916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNUXIrSMtYRUrokf/3Xjtgk09ZQTx2oqQlz31u4CVbg=;
        b=TiiIG7nCettkeeWx+cC6VqgjNMPixZpJCjRZCEr0qzt6UVMj4qOnogM9iG+Pekf9Ea
         t20YPg79RR6HmknaAalkrLEi1gLzQniytmmQHiqkLIUmvml9z+vXXMWPUut+5bO17onY
         Wf8MZCYWmFzIwIid/4Jvor+ZD/HT5s6xBCRi+od8M4xbwZnC1mlrna28nP/ePpQloAic
         fp2yFb43U/p0F+i/LEgI/NWz8dO1pWpulDfVxewjR9NjomYhob4URPcHHv2t4Jak/Acu
         8AMDbHjKfMgfYY+4dM7rlQeQqiz1W0eqgZdDNef3OnF7IU6/Oktr54pNMPLzUJmmpyjo
         g5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879116; x=1775483916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNUXIrSMtYRUrokf/3Xjtgk09ZQTx2oqQlz31u4CVbg=;
        b=OvPuBCJvfqTGK5ohCcBVKmlpKbwg9QsLc+oi4mR/XQeVx/Mc++Z6CF5T34fHSnjfN0
         YIyhE3dVbXEyASMvsI0hPXU8Y7HJORiugATRScrtdEnwpej222BQ6+v2QlbpPOtKmz7g
         nscgLFiiGzmMkhOQwnU3umf+/feWBiRoZqvAbeNfclQ9gM1LPRV1aVPZsnz2i0kprCTm
         qQT3wKO209KDcQqY9owGsF1E3YmbnLem1uFN/hMT94CrFO7tHMrp+Min+RZ1ItyANSWD
         uiEmCttT5Kn7I8HZQ65i6SfM27NW5De2+VpgyTpNAAZllm3/4KlIU2RZDf3v2yNmOXXk
         S6qw==
X-Gm-Message-State: AOJu0Yxyfx4cKjMkto3kxiI1RH2aaEm9Fz6mbe5xYMbR7aTUi3BvwihT
	2MIJYYu6oQOUUm1rih/121xuHn4aruOe/k/8cNjQDASAjy9USsq3OWAodgvvrhZDTrGHKeTZHcg
	07gpuKD24tD1Xhh5Vn582OnVe0zKwpCA=
X-Gm-Gg: ATEYQzzibCJI6uv7LsBHC+hMTTUtkL6mYrL/lhxsWXE+Du+62PlqO1DaHc/7ApFFCZR
	6nhc75BU8EWnM/lG3yaUFKQAllxqXqI+A+6ykvPTtA7jDaN8ZC5h8EaMFRT5eM13RO7Z2eb3YUx
	Sc+4Ehy/5TpLXxgRSmSkdx4OmThKczg3SrYX67aur6yoYALy0tOG7Ki6ags8Na0EewBNfE6+dLM
	y/JQShHyyYnjLyIL/t5x3ccVfS060o00vGcTc/cgRwSe1O/z9ATlIMFhA0C4Jh/pvnhOX+nG78f
	PXJ5vjp0hh3BHAo98QhBSYw8CDTYuJLzccp1hknMJh2AiP5BP0pRuYqcr1xnKFS3LyP+Cg==
X-Received: by 2002:a05:6000:400c:b0:43c:f583:126a with SMTP id
 ffacd0b85a97d-43cf58312e7mr13901223f8f.14.1774879115314; Mon, 30 Mar 2026
 06:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329195625.2840728-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260329195625.2840728-1-sakari.ailus@linux.intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Mar 2026 14:58:08 +0100
X-Gm-Features: AQROBzA4WsUlMfhxZowkD7PhNN3fhJt7zqqnSYfjJ_ZKu9l3J-09Z-loZCuuWD4
Message-ID: <CA+V-a8vwxjTdCL6xN1_B_MCnujkoPoXxoKxaPWwYRxPGmAR2EQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] media: v4l2-subdev: Introduce v4l2_subdev_get_frame_desc()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57628-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 1960735C8A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you for the patch.

On Sun, Mar 29, 2026 at 8:56=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Introduce v4l2_subdev_get_frame_desc() in order to facilitate implementin=
g
> drivers that need frame descriptors. If the remote sub-device does not
> support frame descriptors, v4l2_subdev_get_frame_desc() creates one (with
> a single entry) opportunistically, thus avoiding the need to add frame
> descriptor support to sensor drivers the device for which only generates =
a
> single stream, or managing the situation on the caller side.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 20 ++++++
>  2 files changed, 116 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-c=
ore/v4l2-subdev.c
> index 04a5cb2ad3e3..6032b7c4b949 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -20,6 +20,7 @@
>  #include <linux/version.h>
>  #include <linux/videodev2.h>
>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -2790,3 +2791,98 @@ void v4l2_subdev_put_privacy_led(struct v4l2_subde=
v *sd)
>  #endif
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_put_privacy_led);
> +
> +static int get_mipi_dt_for_mbus(u32 code)
> +{
> +       switch (code) {
> +       case MEDIA_BUS_FMT_BGR888_1X24:
> +               return MIPI_CSI2_DT_RGB888;
> +       case MEDIA_BUS_FMT_Y8_1X8:
> +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> +               return MIPI_CSI2_DT_RAW8;
> +       case MEDIA_BUS_FMT_Y10_1X10:
> +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +               return MIPI_CSI2_DT_RAW10;
> +       case MEDIA_BUS_FMT_Y12_1X12:
> +       case MEDIA_BUS_FMT_SBGGR12_1X12:
> +       case MEDIA_BUS_FMT_SGBRG12_1X12:
> +       case MEDIA_BUS_FMT_SGRBG12_1X12:
> +       case MEDIA_BUS_FMT_SRGGB12_1X12:
> +               return MIPI_CSI2_DT_RAW12;
> +       case MEDIA_BUS_FMT_Y14_1X14:
> +       case MEDIA_BUS_FMT_SBGGR14_1X14:
> +       case MEDIA_BUS_FMT_SGBRG14_1X14:
> +       case MEDIA_BUS_FMT_SGRBG14_1X14:
> +       case MEDIA_BUS_FMT_SRGGB14_1X14:
> +               return MIPI_CSI2_DT_RAW14;
> +       case MEDIA_BUS_FMT_Y16_1X16:
> +       case MEDIA_BUS_FMT_SBGGR16_1X16:
> +       case MEDIA_BUS_FMT_SGBRG16_1X16:
> +       case MEDIA_BUS_FMT_SGRBG16_1X16:
> +       case MEDIA_BUS_FMT_SRGGB16_1X16:
> +               return MIPI_CSI2_DT_RAW16;
> +       case MEDIA_BUS_FMT_SBGGR20_1X20:
> +       case MEDIA_BUS_FMT_SGBRG20_1X20:
> +       case MEDIA_BUS_FMT_SGRBG20_1X20:
> +       case MEDIA_BUS_FMT_SRGGB20_1X20:
> +               return MIPI_CSI2_DT_RAW20;
Other bus formats are missing.

> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +                              struct v4l2_mbus_frame_desc *desc)
> +{
> +       if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> +               unsigned int type =3D desc->type;
> +               int ret;
> +
> +               ret =3D v4l2_subdev_call(sd, pad, get_frame_desc, pad, de=
sc);
> +
> +               if (desc->type !=3D type)
> +                       return -EINVAL;
> +
> +               return ret;
> +       }
> +
> +       if (desc->type !=3D V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> +           desc->type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +               return -EINVAL;
Maybe we can move this check to the beginning?

> +
> +       struct v4l2_subdev_state *state =3D
Should we define this and fmt at the top of the function?

> +               v4l2_subdev_lock_and_get_active_state(sd);
> +       if (!state)
> +               return -EINVAL;
> +
> +       struct v4l2_mbus_framefmt *fmt =3D
> +               v4l2_subdev_state_get_format(state, pad, 0);
Missing v4l2_subdev_unlock_state().

> +       if (!fmt)
> +               return -EINVAL;
> +
> +       struct v4l2_mbus_frame_desc_entry entry =3D {
> +               .pixelcode =3D fmt->code,
> +       };
> +
> +       if (desc->type =3D=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +               int dt;
> +
> +               dt =3D get_mipi_dt_for_mbus(fmt->code);
> +               if (dt < 0)
> +                       return dt;
> +
> +               entry.bus.csi2.dt =3D dt;
> +       }
> +
> +       desc->entry[0] =3D entry;
> +       desc->num_entries =3D 1;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 97b487b1507a..9b0e091c30c1 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -2100,4 +2100,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *=
sd,
>   */
>  bool v4l2_subdev_is_streaming(struct v4l2_subdev *sd);
>
> +/**
> + * v4l2_subdev_get_frame_desc() - Get a pad's frame descriptor
> + * @sd: The sub-device
> + * @pad: The number of the pad in @sd from which to obtain the frame des=
criptor
> + * @desc: A pointer to a frame descriptor, with its type field set
> + *
> + * Obtain a frame descriptor from a sub-device. If the sub-device suppor=
ts the
> + * get_frame_desc pad operation, its result is returned, just like calli=
ng it
> + * directly using v4l2_subdev_call(). If the sub-device driver does not =
support
> + * it, then one containing a single entry is created using the informati=
on from
> + * the sub-device active state, which this function locks for the durati=
on of
> + * the call to obtain it.
> + *
> + * The caller is required to set @desc->type to the expected bus type.
> + *
> + * Return: %0 on success or negative error code on failure.
stray "%" char.

Rest LGTM. I tested it by adding the missing bits on my side; all seems OK.

Cheers,
Prabhakar
> + */
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +                              struct v4l2_mbus_frame_desc *desc);
> +
>  #endif /* _V4L2_SUBDEV_H */
> --
> 2.47.3
>

