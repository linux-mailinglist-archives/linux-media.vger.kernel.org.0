Return-Path: <linux-media+bounces-32588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF4AB8574
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7EA1BC203B
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 12:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4B2298C28;
	Thu, 15 May 2025 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbBH3cAA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060AD1FF7CD
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310383; cv=none; b=auyYaj6EUXGxkDb9BvHjTJTJdPLmnTqBseS99fd5CSY+K6u6UjxSibYr1n5LrICYAP/hcMmklI0Y3XKQxjDmUXhsJzPBbc67mjAMLpCKa1aaEBgumAMN+16V6WQ3RBYrlrkaH3SPvjgrqgJNhFMsWe1ST1LOtgw5W5TJ1XdaezE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310383; c=relaxed/simple;
	bh=E+4io3Dm7mk/sUDySmKC/XBf3oXX1h4vvkQdRsmgdUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9MIlpGw4l2ziQbE2Rl7z64B5ttzOWwiJo53BlEzhaK2REPNtIzjyQioGlCM9KzqDRXefo9HEdE9Yj01wjbQty69Sjy/EdR5jjPHYHHF9YflhxUcJz+ISov/Dkdzf0o9prEgGTkX6EV6ssostMlXL2WFXyzgcYqTghUC+ph9rBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbBH3cAA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0b933f214so527218f8f.0
        for <linux-media@vger.kernel.org>; Thu, 15 May 2025 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747310380; x=1747915180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFMRiVw99uNMxBjyrVaf0muNo/1atczDlUnuln7VmxQ=;
        b=IbBH3cAAQNaioBSO1w2bamFOqw0hxxerF7dXdngOesy5nhW27b8wNJBSGquQx2YL0/
         FUCKvmH/Pykytd4JYRQxdDt++TG128xchWAvhNOKEroukksq17vDuNV0lj6vwWED8zxy
         R+17RfApRVtqQhWJ8qqfnMHCDPO+W235mW8dVnmnie0E6B/Bx77tKqvefJIvNRRL9T9c
         WJUr5wKiv+v0Eu+iRATGXr3AnvnypZ3jrU0TqeiGg/i1WCEaLbKxDJb9QxppA7itVHv2
         Y9BjUpV4om3/mlDp7s7kSgzINsVtSAyxKtr4sIntXiEupTxt/hDp+KJ7cjQRH8urTzkw
         iwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747310380; x=1747915180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFMRiVw99uNMxBjyrVaf0muNo/1atczDlUnuln7VmxQ=;
        b=hmK+IHxdsuCK4I2wAst0cs9Tif0xVnYoEa4nZeC4IuQqHEmS6LMp28cROqsWVdeZhs
         8sVbp+P3P27e6QoynID4V+3nMtspSAM22MH34XOzyLy+740ufUzzxajWqafqEOmpomJT
         l4A4jb3s626oDCwzjLXhIljQOF7Rxm7py6HYiDL6/kx3eYsE+DyvyuwkUhECSjjvasiU
         TXI18T90TBSplTcyrgttpxiH+IdxRwLy8KVOlZxu+Zkp5iv0ly/qJqP3nubH/RxDhSUb
         1RcseRWl8N63FRPJlwXghQq+JXjIO6wFI99bZvettT0mM8Tjs8eDpCxRFrywxS6auBjG
         qGLw==
X-Forwarded-Encrypted: i=1; AJvYcCW09bcbeB+4hbeYR5Y9VKg5Nj9OphDO0iMjRVqD0JfGVaH6EUetQ0i2xty9wWdiSMtyxnp3DiGvi0EX0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQV+E/U69UmpJFXYZNfJclumpu+GsOtpX2MOa/QMNgW4DnMEw
	eMPt74ihS6Tup2oAS3KrZ7wFhivuWk4+1+Z1fJtDYBHvG92QUATroBvYjlrZcUuW8Za9vwRiA3H
	+enILGOiJYn+/pLDp3dwtQrIpMZAzgeoJgE8=
X-Gm-Gg: ASbGncs9WQqQbEWgcPQFdlrjJysTPo4ISUtB+G9mc/rLj52+UCkppjgmti/Ma+yG/dI
	JD5o/14oxIy89jXdB5+NiM1F0BvQJldLb5fJUl4lhgzI+FLYm409xAQytNephNkUDkLmujjNtWa
	zQAXoH3cWAfiZHupOi/erL3w+5GQ2BgyU=
X-Google-Smtp-Source: AGHT+IE5637BQllVIWOG+HAplZlj+vMKo4F6Gu+X96B5pV3NpCo1wwO3VH4iQZJtRrC7mEBvpnZxCcLw/wYF1p6TVuc=
X-Received: by 2002:a5d:5984:0:b0:3a0:b977:26ba with SMTP id
 ffacd0b85a97d-3a34969421bmr5675883f8f.12.1747310379902; Thu, 15 May 2025
 04:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com> <aB4OfjTGktdu7Yos@tom-desktop>
 <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6> <3eb69cea-b511-412e-a126-ce246c2491df@bp.renesas.com>
In-Reply-To: <3eb69cea-b511-412e-a126-ce246c2491df@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 May 2025 12:59:13 +0100
X-Gm-Features: AX0GCFu5bSv4R_E8Ju9E3UAWDKE54kNGu68iWWm7yYPa4LAp29AcnC11taJ7sjI
Message-ID: <CA+V-a8v4rw9dD04obCT+gs1Npas3nopeC+xjU0bcBYCNwrqzhA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
	hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

On Fri, May 9, 2025 at 4:41=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Hi Jacopo,
> Thanks for your comment.
>
> On 09/05/25 16:50, Jacopo Mondi wrote:
> > Hi Tommaso
> >
> > On Fri, May 09, 2025 at 04:17:34PM +0200, Tommaso Merciai wrote:
> >> Hi Daniel,
> >> Thanks for your patch.
> >>
> >> On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
> >>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >>>
> >>> The rzg2l_csi2_calc_mbps() function currently tries to calculate the
> >>> link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
> >>> of the remote subdevice. Switch the function to v4l2_get_link_freq()
> >>> which correctly targets V4L2_CID_LINK_FREQ before falling back on
> >>> V4L2_CID_PIXEL_RATE if the former is unavailable.
> >>>
> >>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> >>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >>> ---
> >>> Changes in v4:
> >>>
> >>>     - Used separate s64 variable as return value for v4l2_get_link_fr=
eq()
> >>>       and as the mbps variable for do_div() to avoid compilation warn=
ings.
> >>>
> >>> Changes in v3:
> >>>
> >>>     - Fixed mbps sign
> >>>
> >>> Changes in v2:
> >>>
> >>>     - None
> >>>
> >>>   .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++-------=
---
> >>>   1 file changed, 12 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/=
drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> >>> index 9243306e2aa9..8870c2cb8104 100644
> >>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> >>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> >>> @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_cs=
i2 *csi2)
> >>>     const struct rzg2l_csi2_format *format;
> >>>     const struct v4l2_mbus_framefmt *fmt;
> >>>     struct v4l2_subdev_state *state;
> >>> -   struct v4l2_ctrl *ctrl;
> >>>     u64 mbps;
> >>> -
> >>> -   /* Read the pixel rate control from remote. */
> >>> -   ctrl =3D v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE=
);
> >>> -   if (!ctrl) {
> >>> -           dev_err(csi2->dev, "no pixel rate control in subdev %s\n"=
,
> >>> -                   source->name);
> >>> -           return -EINVAL;
> >>> -   }
> >>> +   s64 ret;
> >>>
> >>>     state =3D v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
> >>>     fmt =3D v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
> >>>     format =3D rzg2l_csi2_code_to_fmt(fmt->code);
> >>>     v4l2_subdev_unlock_state(state);
> >>>
> >>> -   /*
> >>> -    * Calculate hsfreq in Mbps
> >>> -    * hsfreq =3D (pixel_rate * bits_per_sample) / number_of_lanes
> >>> -    */
> >>> -   mbps =3D v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> >>> -   do_div(mbps, csi2->lanes * 1000000);
> >>> +   /* Read the link frequency from remote subdevice. */
> >>> +   ret =3D v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> >>> +                            csi2->lanes);

div needs to be updated in v4l2_get_link_freq() as below so that when
subdev has only V4L2_CID_PIXEL_RATE we get the correct value.

        ret =3D v4l2_get_link_freq(source->ctrl_handler, format->bpp,
-                                csi2->lanes);
+                                csi2->lanes * 2);

> >>> +   if (ret < 0) {
> >>> +           dev_err(csi2->dev, "can't retrieve link freq from subdev =
%s\n",
> >>> +                   source->name);
> >>> +           return -EINVAL;
> >>> +   }
> >>> +
> >>> +   mbps =3D ret;
> >>> +   do_div(mbps, 1000000);
> >>>
> >>>     return mbps;
> >>>   }
> >>
> >> I tested this series with an imx219 image sensor connected to the CSI-=
2
> >> RX IP of RZ/G3E:
> >>
> >> Some notes:
> >>
> >>   - pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample
> >>   - hsfreq =3D (pixel_rate * bits_per_sample) / number_of_lanes
> >>
> >> Then hsfreq should be:
> >
> > The old code seems to call 'hsfreq' the per-lane bandwidth
> >
> > -      * hsfreq =3D (pixel_rate * bits_per_sample) / number_of_lanes
> >
> > And not the per-lane frequency as the variable name and the commit mess=
age
> > suggest
> >
> >>
> >>   - hsfreq =3D link_freq * 2
> >
> > if that's the intention, due to CSI-2 DDR, then you're correct I
> > think ?
> >
> > Seeing that also Laurent has reviewed it, and Prabhakar tested it, I wo=
nder
> > if we all have missed that the original code didn't have a / 2
I agree the orignal code missed a / 2. I think we need a fixup patch
(so that this can be backported) and then this change to use
v4l2_get_link_freq().

> >
> > Dan, did you ever notice issues during your testing ?
> >
> > Also, with the introduction of 15f0035bfd0a ("media: v4l: Support
> > passing media pad argument to v4l2_get_link_freq()") it's probably now
> > better to pass the source's pad to v4l2_get_link_freq() ?
> >
> >>
> >> Please correct me if I'm wrong.
> >>
> >>
> >> After applying this series. I'm getting the following issue testing th=
e
> >> imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.
> >
> > Does the error go away if you multiply the link_freq by 2 ?
>
> Yes the error goes away on my side using:
>
> mbps =3D ret * 2;
>
I tested the above with an OV5645 sensor and see no issues.

Cheers,
Prabhakar

