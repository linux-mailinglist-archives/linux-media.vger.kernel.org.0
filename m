Return-Path: <linux-media+bounces-21543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A769D154C
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 17:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE898B2912F
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 16:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1C11BD007;
	Mon, 18 Nov 2024 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RireEOgb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83402199EBB;
	Mon, 18 Nov 2024 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731946601; cv=none; b=K0oe3Q4yve2Fbej1b4WFLYQnqx181CAQzcMNnMym3/LM1DaGDpCFuJrYIBCWMBmLBD9EIUrpty2fayb6fsEHXMqWpiU+RrkntmqokrFeUC6yaFl3521R6KUXfdrIxzuX68qrNUr/3DTv9TNqfTTao87lZsdoJrsXgRznab9gOXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731946601; c=relaxed/simple;
	bh=I2z5foPBl/UuGPdBgcbdnOMGEorTScQwtrx+l5doXog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUEyLUXvUWLpo+PFdkZWrcaWXBhgKSg84m0GrzSSnr3+bcYi06XqB+FBKuzZHe7zM/8cvpmTT1e1jdLmxpGBcaC/UTiZ+XIu7idRrxisdF+RtEJGzVlT8wLQmRR1xlZYmeaWjx7OtIHLkOynEfYGwbLg/UKVZJFe1V3wInAKT8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RireEOgb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9D5C4CEDD;
	Mon, 18 Nov 2024 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731946601;
	bh=I2z5foPBl/UuGPdBgcbdnOMGEorTScQwtrx+l5doXog=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RireEOgbsSKFD8g7Jz1lDXplSvcQmgfUFggnN64swhzykIa7gb/AkGdA2iD4lBEC0
	 dnBKyBYUgk4IV7SWFvVuaPxIG8uaMG8tCfmBKYftoI9J5rBF7TjwZkn8Tz7g5DVJEW
	 FLwU6+p7Br71oJJLz7szSHQVcKYf/776fD+Kwal7Bd5BndiX0gQSnX4GMLaQMAMuhl
	 HCx84M3ucCC98cWYkenvsM8SCCK+TMiqD6owcToNtm2KezG7MgkHAoCMCiK0NUUGl7
	 qsuZMhC17P2EVSithXB5jNqbLe8FBZoo4hjRb/Nru5h0j+wM8hBLYgLNMg3A3DzBW2
	 Ey8TQWB2p7qeQ==
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-514bb6953f4so81200e0c.2;
        Mon, 18 Nov 2024 08:16:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0qkkkH5Mdb0RqNHMboQgFRuIxV7nk9Z2l3xuef8mQOkWaGNQDrOgds+KWNqHokH/r7+xXsMvgZfs1x5g=@vger.kernel.org, AJvYcCX1YEdgqrBLlLGUew0olVWl4bSlg9qbC9/MPHmbCZLUwv8PI1LZQyap/8zurthnA54xmKd/G07/3Wbvxfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwevGeFyXTnBntRBR2UIx/gd/z23zeqhXbzV3Oh+kC3HmEphsDm
	CPJCYceTv+peUcnVsObv9Wzd1QofrVjhpvcTiaXJuVQtzSIMnBVYgkYAYGRfu/tRYJ18ucoK9S6
	bNPSLimk8wwcJ0s66B1/7iuO8ph8=
X-Google-Smtp-Source: AGHT+IGjGyQYZwS1o9rlyXcvmgyCE3cSV3FYD2Clv1A7WL8SaGcJFxp+zmjH2AHAzwPpwzRsziXb6Ea8Dl0YYWRqRP4=
X-Received: by 2002:a05:6122:896:b0:509:e80:3ed2 with SMTP id
 71dfb90a1353d-5147866a43bmr9866521e0c.7.1731946600020; Mon, 18 Nov 2024
 08:16:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org> <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
 <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com> <8151585c-cb4c-424d-a81c-939ee30d8e9d@redhat.com>
In-Reply-To: <8151585c-cb4c-424d-a81c-939ee30d8e9d@redhat.com>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Mon, 18 Nov 2024 17:16:22 +0100
X-Gmail-Original-Message-ID: <CAPybu_14EcOZw6C65ZWVGoa5bcZe1XCZbMghNzUG+wFF7affdg@mail.gmail.com>
Message-ID: <CAPybu_14EcOZw6C65ZWVGoa5bcZe1XCZbMghNzUG+wFF7affdg@mail.gmail.com>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Gergo Koteles <soyer@irl.hu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Nov 18, 2024 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Ricardo,
>
> On 14-Nov-24 9:03 PM, Ricardo Ribalda wrote:
> > Hi Gergo
> >
> > Sorry, I forgot to reply to your comment in v14.
> >
> > On Thu, 14 Nov 2024 at 20:53, Gergo Koteles <soyer@irl.hu> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
> >>>
> >>> +     },
> >>> +     {
> >>> +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUT=
O,
> >>> +             .entity         =3D UVC_GUID_UVC_CAMERA,
> >>> +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> >>> +             .size           =3D 16,
> >>> +             .offset         =3D 64,
> >>> +             .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> >>> +             .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> >>> +             .name           =3D "Region Of Interest Auto Controls",
> >>> +     },
> >>>  };
> >>>
> >>
> >> Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for this?
> >
> > If I create 8 Booleans, they will always be shown in the device. And
> > the user will not have a way to know which values are available and
> > which are not.
> >
> > We will also fail the v4l2-compliance test, because there will be up
> > to 7 boolean controls that will not be able to be set to 1, eventhough
> > they are writable.
>
> So why can't these other controls be set to 1? Because only one
> of the options in the bitmask can be selected at a time ?
>
> If only 1 bit in the UVC_CTRL_DATA_TYPE_BITMASK for this can be one
> at the time, then this should be mapped to a V4L2_CTRL_TYPE_MENU
> just like how that is done for V4L2_CID_EXPOSURE_AUTO already.
>
> Actually looking at existing comments about UVC_CTRL_DATA_TYPE_BITMASK
> in the driver there is this comment on top of uvc_mapping_get_menu_value(=
)
>
>  * For controls of type UVC_CTRL_DATA_TYPE_BITMASK, the UVC control value=
 is
>  * expressed as a bitmask and is thus guaranteed to have a single bit set=
.
>
> Assuming this "guaranteed to have a single bit set" comment is valid for
> the V4L2_CID_UVC_REGION_OF_INTEREST_AUTO part of UVC_CT_REGION_OF_INTERES=
T_CONTROL
> too then I think we should simply map this to a menu similar to how
> this is done for V4L2_CID_EXPOSURE_AUTO.
>
> Note V4L2_CID_EXPOSURE_AUTO is the only existing user of UVC_CTRL_DATA_TY=
PE_BITMASK
> at the moment.
>
> Mapping this to a menu should nicely address Gergo's concerns here.

The UVC standard is not very clear re bmAutoControls. It says:
"""
The bmAutoControls bitmask determines which, if any, on board features
should track to the region of interest. To detect if a device supports
a particular Auto Control, use GET_MAX which returns a mask indicating
all supported Auto Controls.
GET_CUR returns the current Region of Interest (RoI) being employed by
the device. This RoI should be the same as specified in most recent
SET_CUR except in the case where the =E2=80=98Auto Detect and Track=E2=80=
=99 and/or
=E2=80=98Image Stabilization=E2=80=99 bit have been set.
"""

Which makes me believe that you can set another Auto value + one of
these ones. So I do not think that we can assume "guaranteed to have a
single bit set".

The behaviour will vary module to module. So I'd rather take a
conservative approach here and let the hardware clamp the value and
not us.

>
> Regards,
>
> Hans
>

