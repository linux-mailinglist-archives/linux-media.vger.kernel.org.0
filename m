Return-Path: <linux-media+bounces-43760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7BABB9CC9
	for <lists+linux-media@lfdr.de>; Sun, 05 Oct 2025 21:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F29744E1922
	for <lists+linux-media@lfdr.de>; Sun,  5 Oct 2025 19:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC871E5215;
	Sun,  5 Oct 2025 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iCmTayLk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014121D63C5;
	Sun,  5 Oct 2025 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759694324; cv=none; b=SUVfxz4VfXBzyieyV5GKwkKKhbeSMeUde8jPU1nKKPDu0igHpIqeJuk9tgYRgoIBXWd9bbZ23CzQz3DcTemXIhyeSGJUTRETdrod5njmIvjFBHd2UzMQcZkUs8r04WV6p9qZp/rcL5w4XUZKdWO2ACxKTAbGZjOoFeVi3sJ6pok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759694324; c=relaxed/simple;
	bh=hcHoPuDASvo7L4YoQIIOIVa3he8Xm/yVQ4dMNyufHBc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rnkPBA3fT+RlByJAsC2QgT3VS4WSYijxLgoacRD4zvJ+VtPFklh45Tdkc2Ev1tOU+5rFoVvqCCRLlaDfUl6tIpWFd+vdoHKLG7C9Q4EBwLm5a9/GMyksjE7A7YB/l6p89isV1EWqh40TFA70Enzggepeq7jGbWOBP+R+IHsuFdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iCmTayLk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FAC2C7A;
	Sun,  5 Oct 2025 21:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759694227;
	bh=hcHoPuDASvo7L4YoQIIOIVa3he8Xm/yVQ4dMNyufHBc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iCmTayLk9hIK6HaDN+pHYnMRTzULWpiRwz3JYNchd6BO+xgXcfVn6F0CSlrGEllD9
	 fwh9DuqvY6G8pCw19T95Y1+RcCXtluAHVUayaru6DSDgM3+kiXE5vmSPuta2LiaxSr
	 s6Zng1KSRWC6QEUi+4KWXEhkade0a+mir4xuTmis=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251005180025.69602-1-asmirnou@pinefeat.co.uk>
References: <175967476560.756374.10666787102940352317@ping.linuxembedded.co.uk> <20251005180025.69602-1-asmirnou@pinefeat.co.uk>
Subject: Re: [PATCH v5 2/2] media: i2c: Pinefeat cef168 lens control board driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: asmirnou@pinefeat.co.uk, conor+dt@kernel.org, devicetree@vger.kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Date: Sun, 05 Oct 2025 20:58:36 +0100
Message-ID: <175969431602.1246375.2429212814766056041@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Aliaksandr Smirnou (2025-10-05 19:00:25)
> Hi Kieran,
>=20
> On Sun, 05 Oct 2025 15:32:45 +0100, Kieran Bingham wrote:
> > I'm really looking forward to trying this device out sometime. Very
> > interesting piece of kit - Thank you for working directly to upstream
> > the support! That's really awesome.
>=20
> Thanks! I appreciate that. It's been interesting work, and it's great
> to see the device getting some attention. I'm looking forward to hearing
> your impressions once you get a chance to try it out.
>=20
> > > +  rx_data->focus_distance_min =3D le16_to_cpup((__le16 *)&rx_data->f=
ocus_distance_min);
> > > +  rx_data->focus_distance_max =3D le16_to_cpup((__le16 *)&rx_data->f=
ocus_distance_max);
> >
> > What is the focus distance in this case? Is it a measured distance that
> > could be applied to focus?
>=20
> The focus distance reported by the lens is the distance between the
> camera's sensor and the subject currently in focus, measured in meters.
> It correlates with the focus position - higher positions correspond to
> greater distances - but the relationship is non-linear.

What's measuring this distance ? Something in the lens, rather than the
sensor?

>=20
> Libcamera's autofocus algorithm works in dioptres, which are the inverse
> of distance. In the driver, reading the distance from the lens allows
> the creation of a piecewise linear (PWL) function that maps inverse
> distance to the hardware lens setting.
>=20
> > > +       case CEF168_V4L2_CID_CUSTOM(calibrate):
> > > +               return cef168_i2c_write(dev, INP_CALIBRATE, 0);
> >=20
> > Is there any documentation on how to use this control?
>=20
> The control performs a calibration action operated by the controller
> to determine the total number of focus steps. The action is invoked
> by the calibration utility, which moves the lens, reads the changing
> focus distance, and finally generates a PWL function to be included
> in the Libcamera tuning file.
>=20
> End users are not expected to trigger this control manually through
> the V4L2 API, as it is intended for use by the calibration tool during
> system setup. For this reason, separate user-facing documentation for
> the control has not been added.
>=20
> In other use cases, calibration can be performed simply by toggling
> the AF/MF switch on the lens three times within 15 seconds.
>=20
> > > +       case CEF168_V4L2_CID_CUSTOM(focus_range):
> > > +               ctrl->p_new.p_u32[0] =3D ((u32)data.focus_position_mi=
n << 16) |
> > > +                                      (u32)data.focus_position_max;
> >=20
> > Is this really a custom control ? Is there any way to convey this
> > through the min/max of the FOCUS_ABSOLUTE control ?
>=20
> We aimed to minimize the use of custom controls, but in this case one
> is necessary.
>=20
> When the driver is already loaded and initialized, the focus range of
> the lens may vary depending on the lens state and configuration
> options. Because the control's operational range is defined during
> driver probe, the Linux V4L2 API does not allow the minimum and
> maximum values to be changed while the driver is running.

Have you tried with __v4l2_ctrl_modify_range() ?

We should make sure this also generates an event that libcamera can
subscribe to to make sure it knows there's been an update.


> The maximum focus position is not known until calibration is
> performed, so initially the position is set to zero. The focus range
> may vary slightly between calibration runs, as it is derived from
> counting motor steps, and its precision depends on the lens's focusing
> mechanics.
>=20
> Additionally, some lenses provide a two-position switch that changes
> the minimum focusing distance, significantly reducing the focus range
>  - for example, from 2100 to 800.

I see, so a user interaction can update it too. Does the driver have to
poll to get this update? Or does it just find out on the next read ?

>=20
> > > +       case CEF168_V4L2_CID_CUSTOM(lens_id):
> > > +               ctrl->p_new.p_u8[0] =3D data.lens_id;
> > > +               return 0;
> >=20
> > Is this a specific individual ID value for the connected lens (i.e.
> > every lens has a custom id?) or is it a reference to the lens
> > model/type?
> >=20
> > Is this something we could use in libcamera for instance to select an
> > appropriate tuning file per lens (type) ?
>=20
> It represents the ID of the lens model/type. Correct, it's purpose to
> assist in selecting the appropriate autofocus algorithm settings.

We're also pushing for a core control for this I think. That's something
we 'need' in libcamera globally for all cameras. Unfortunately I can't
point you at an existing control yet ;-(


> For calibrated lenses, the controller stores the focus range in EEPROM,
> allowing lenses to be swapped without repeating calibration. The
> Libcamera tuning file includes an autofocus algorithm section that is
> linked to the lens's focus range, focus distance, and focusing speed.
> Therefore, reading the lens ID when loading the corresponding tuning
> file after a lens swap is both convenient and necessary.
>=20
> It can be read as follows:
>=20
> v4l2-ctl -d /dev/v4l-subdev3 -C lens_id

I'll see if I can find time to order a kit, and get a compatible lens. I
have a Nikon DSLR though so I don't have lenses to match this yet :-(

--
Kieran

