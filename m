Return-Path: <linux-media+bounces-45047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC239BF1E52
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 16:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 506E318A7C6E
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 14:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3135A22A7E0;
	Mon, 20 Oct 2025 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="s2HNL6C0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25250227E95
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971357; cv=none; b=cQuZLa1nExhuYV7iL2us0ixmm9ptLcJbZVx8+n4xAooIJgx0lHDks1jCdTDXYpq9z2RDePICcIfuAKJ/Cw3HDDa4JPQLizsAr3xKaCYpdSXSaNc62PIskt/t/YQ1DmvwcPuH61skxBHNiMu2/YesD/yO+6Veuav3Qp0bQ9ZJZl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971357; c=relaxed/simple;
	bh=gg0F6uv1jeMF1qGBpzoPJcGtYmwODKN40aKnEkcpuzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QecKTRnMVyxJp9VKghxpQRBvDdOyF2Ia7Qfj5SM30lUQ3dg0zu7hB7R33D0ZUc8PXicl87SaBt2xV0TQPd/aC7bFZU5PDbuEmf2yuwZ0tRnqWkCSQNcTySe0D3Wf+zTUVrRBih3H9TG1SOmjAsp7wK33Tbm8OY2Le4MuTVqo48Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=s2HNL6C0; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87c1f3f4373so88707916d6.2
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1760971354; x=1761576154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kc7bkmSvhcp803J5T0JiNLXVvrL8DfJHEYv7Isk6irg=;
        b=s2HNL6C0+gyXz6Op1KQ2DomkxRg7aeDeI0rRe0gvROij+EfzTuHENHwCJXjUiTQCKu
         AEJ6SBW7p2aKa2aTMex/J8xe9cBUyv6XI/nAZm1orbBB6KCXpMFZhSWpoVp+SXG0iZua
         GtxSYOwHkStiXArkrlf/OEq4BBd2HGRt4I4ha+PRn2Ky1oG+yqHL/Y31r8+J0A/5TsPy
         0pFCWQlZ6WElSfh5/gm16kYy+o31XJwFLImZ6vCIIxEUVDcbDTSSARbbFFg4ITUIe4EB
         33gWeYa7Uo2N+DtYJl0U3dRg2E2mObNHcHASed5bo+6XiXf39klgxs6Xa+I9n0OZHxDA
         ZiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971354; x=1761576154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc7bkmSvhcp803J5T0JiNLXVvrL8DfJHEYv7Isk6irg=;
        b=nJUV+qzU4z1P+4GWvkQ/ZxYbyhtjMZ5Ue2SWLoXhidKRFOkNUYoKUOD7MHFFEBDRdD
         alrm7LekpvNvS/BG9u35yhSZyHO7lrsRkHliMfsVaHE57zvEO8gO2v7hoRPFUyhdWMT/
         PkwbKHWMg++DKgpxgpveIfyE43JhFogruss0dgpl9i8d30yrd+7oKx1o9sTR6QOTQlfT
         ZkK6r7PDW2P7L4/NX7OFr5Wf5JNbOMeJeRbUokfMFLZPB3RFpb3r7RQoKillrvfNczww
         kJxSIHTQWssX/dRScf3pkWbSK8urCqsOfonoSiSrgBeSdawcF4JB/sxcFYTUzZabRn+q
         pK1g==
X-Forwarded-Encrypted: i=1; AJvYcCUGhCHl7T5/VlECAHr2Uc4MFlx4zYFxuXA6jwd0FVQHDst5F4M5LH8mVxhv6wyMGijWCzOXREPdwhxf4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeCERP6I36IwtUCIEE7e8Va+p68NziSrkan9aDDCFeVJYBxnND
	dqY3U67Dr/vSuTPZn8ObtD8m3dh1DtN4VmBeXykhkzcj17dgnHkCPFpWsnhA+2w32aHszi+Or2a
	rhyJLPMQjp3FnrxD884rc2gHM9Ti1IPMn4NfAA8jPCw==
X-Gm-Gg: ASbGncszIuJyzE6nP7kvhGw77z0KgYwNFxNo1w0uo5V+5dO1Az+C2GAzs6IZZGyTHQh
	0YxVRnmFPWHB0+5qOyHZpj87q0Cr5RfPScmuJG8sS/Fd9pRBu3wWoE9v3+uhAkj/3/hvLP33lnN
	0mZOQ9EQ4tf6rN/WHyT/cudgvHYHLykf25bzzkOTxG7i2XGt1RLW2hTXifyHC12K+nfUexcZEWg
	x2d7TcWVxJdn2jEAMgeBxwzCVemDHazmTH6SNdIhFHph3vzaO/MmDx5bvmtT0j+ObigzIsKyFVp
	STrQjc15RvKdBecdzu3r9sFS7fn0svGo17um0TJ2yUbdYhtPAKMMvNQ45rn2JMehWBH3tXqr1H+
	b/raothmuXrmd
X-Google-Smtp-Source: AGHT+IGXRDsjL1B/LvjtexZI5O1GDVXxNLCQ6ZStx0O5Geb772/yObnoN+agtuagMjxZOAP3qNLnixwX1jF0bkryJDc=
X-Received: by 2002:a05:622a:f:b0:4e8:9a7d:90f8 with SMTP id
 d75a77b69052e-4e89d335eeemr173875711cf.47.1760971353743; Mon, 20 Oct 2025
 07:42:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-44-sakari.ailus@linux.intel.com> <176009169065.211618.2319574445990293219@localhost>
In-Reply-To: <176009169065.211618.2319574445990293219@localhost>
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 20 Oct 2025 15:42:22 +0100
X-Gm-Features: AS18NWDRnRIxesa1LJ3KMoPEhfbvIj7oocstMRl7AWBDSvlVp6gZF061_cDg3qQ
Message-ID: <CAHW6GY+JA_9DZub88RJq4UDC9KgzkQsFO=MtDFBySxhTySXVYQ@mail.gmail.com>
Subject: Re: [PATCH v11 43/66] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari, Stefan and everyone!

On Fri, 10 Oct 2025 at 11:21, Stefan Klug <stefan.klug@ideasonboard.com> wrote:
>
> Hi Sakari,
>
> Quoting Sakari Ailus (2025-08-25 11:50:44)
> > Add V4L2_CID_BINNING control for configuring binning and enumerating a
> > camera sensor's binning capabilities. The control combines horizontal and
> > vertical binning into a single control as the two are generally related.
> >
> > New drivers should use this control to configure binning.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           | 12 ++++++++
> >  .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
> >  include/uapi/linux/v4l2-controls.h            |  1 +
> >  4 files changed, 44 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 39f3f91c6733..ef1f51862980 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> >
> > +Binning
> > +-------
> > +
> > +Binning has traditionally been configured using :ref:`the compose selection
> > +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> > +<v4l2-cid-camera-sensor-binning>` is also available for binning configuration and
> > +users should use it when it's available. Drivers supporting the control shall
> > +also support the compose rectangle, albeit the rectangle may be read-only when
> > +the control is present.
> > +
> > +Binning isn't affected by flipping.
> > +
> >  .. _media_using_camera_sensor_drivers_embedded_data:
> >
> >  Embedded data
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > index cdc515c60468..18b484ff5d75 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > @@ -672,3 +672,32 @@ enum v4l2_scene_mode -
> >
> >      As modes differ for each sensor, menu items are not standardized by this
> >      control and are left to the programmer.
> > +
> > +.. _v4l2-cid-camera-sensor-binning:
> > +
> > +``V4L2_CID_BINNING_FACTORS (integer menu)``
> > +
> > +    Horizontal and vertical binning factors. Binning combines several
> > +    horizontal, vertical or both pixel values into a single pixel. It is a way
> > +    to scale an image. Binning typically produces fairly good quality output.
> > +
> > +    Determines both horizontal and vertical binning factors for a camera
> > +    sensor. The values are encoded in the following way:
> > +
> > +.. flat-table::
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +
> > +    * - Bits
> > +      - Synopsis
> > +    * - 48--63
> > +      - Horizontal binning numerator.
> > +    * - 32--47
> > +      - Horizontal binning denominator.
> > +    * - 16--31
> > +      - Vertical binning numerator.
> > +    * - 0--15
> > +      - Vertical binning denominator.
>
> I know I'm late to the game, but I'd like to mention it anyways. I

Even later to the party, for which my apologies!

> expect there will be usecases where we'd like to distinguish between
> different binning strategies (e.g. summing to increase SNR and
> weighting). But I believe it will be difficult to actually standardize
> on specific binning strategies as these are very sensor specific. On the
> other hand the available strategies will be tied to the binning modes.
> What about sparing some bits to encode the binning strategy in a sensor
> specific manner?

I'd like to second the notion that we should give summing/averaging
some thought. We (Raspberry Pi in this context!) already have user
space code that tries to guess this information from only obliquely
related information from the driver. It would clearly be nice to know
this unambiguously across all sensors.

The case in point is the IMX708 (as found in the Raspberry Pi Camera
Module 3). Here there are two versions of the "2x2 binning mode".

There is the "summation" mode, in which pixels have 4x the level of
the full resolution mode, as I think you would expect. This means you
have to use 1/4 the combined exposure * gain value in the full
resolution mode to get an equivalently bright image.

Then there's the "averaging" mode. In this mode we get 2x the level of
the full resolution mode. You might infer that one of the dimensions
(either horizontal or vertical) always sums, and on the other you have
a choice - though the datasheet doesn't explicitly confirm that
anywhere so far as I can see.

A different but related observation is that I have a feeling I've come
across sensors that may do both averaging and summation in a single
dimension. So you'd get 1/4 the output width (or height), but 2x the
pixel level because one factor of two sums, and the other averages.
Perhaps someone else can confirm whether I'm just imagining that...?

>
> I don't think we'll ever need more than 1 byte per
> numerator/denominator. We could even spend 12 bits per value, and would
> still have 16 bits left for additional information.
>
> What do you think?

Likewise, interested to hear other people's thoughts.

Best regards

David

>
> Best regards,
> Stefan
>
> > +
> > +For instance, a value of ``0x0001000300020003`` indicates binning by 3
> > +(horizontally) * 3/2 (vertically).
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index a7ea380de5ee..5e1c28850e87 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1087,6 +1087,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >         case V4L2_CID_CAMERA_ORIENTATION:       return "Camera Orientation";
> >         case V4L2_CID_CAMERA_SENSOR_ROTATION:   return "Camera Sensor Rotation";
> >         case V4L2_CID_HDR_SENSOR_MODE:          return "HDR Sensor Mode";
> > +       case V4L2_CID_BINNING_FACTORS:          return "Binning Factors";
> >
> >         /* FM Radio Modulator controls */
> >         /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1427,6 +1428,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >         case V4L2_CID_HDR_SENSOR_MODE:
> >                 *type = V4L2_CTRL_TYPE_MENU;
> >                 break;
> > +       case V4L2_CID_BINNING_FACTORS:
> >         case V4L2_CID_LINK_FREQ:
> >                 *type = V4L2_CTRL_TYPE_INTEGER_MENU;
> >                 break;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index e25c9d669687..90f47f4780e5 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1101,6 +1101,7 @@ enum v4l2_auto_focus_range {
> >  #define V4L2_CID_CAMERA_SENSOR_ROTATION                (V4L2_CID_CAMERA_CLASS_BASE+35)
> >
> >  #define V4L2_CID_HDR_SENSOR_MODE               (V4L2_CID_CAMERA_CLASS_BASE+36)
> > +#define V4L2_CID_BINNING_FACTORS               (V4L2_CID_CAMERA_CLASS_BASE+37)
> >
> >  /* FM Modulator class control IDs */
> >
> > --
> > 2.47.2
> >
> >
>

