Return-Path: <linux-media+bounces-23607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFAB9F4FAE
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 16:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA766188C75D
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E991F755F;
	Tue, 17 Dec 2024 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XperVmJi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D31F4705
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734450232; cv=none; b=okzhlTmaMn2cD5l3r8fu9Vwy73nyhVXn0oyL1IgnjNVsztTymATDtMYqbxKm3SrSgZrt9lYPcPPLu4zXeLldfcXt3JGJwHb7Y7WnF8tS/S/xfMkzfVab9QvDsTxtgbkq6OcHk3jSTr+kNfmkNf7AuS5Io6zCFpNdaoKyjkXSy34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734450232; c=relaxed/simple;
	bh=Ag+ePC2g7TmSF58ygq1mI75NBNGre8VKrVe7IB/2fgk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P8vVdZHVxCNTV8U1S2gVP0xVpOTKDxACc0jz1KQXCEHnA94QrgFOUwmfBSvX14XRl8Oerh8h3X6MAzdQvF7Z8xeor3gY/xW47sA/j89T0hf/1qVQDRjLs2idCxDmZZemaEZrFPOLXDaL6lWX+LRsErYc6qlwnW/12ioO2B9cOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XperVmJi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B59D3E;
	Tue, 17 Dec 2024 16:43:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734450191;
	bh=Ag+ePC2g7TmSF58ygq1mI75NBNGre8VKrVe7IB/2fgk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XperVmJimauhY1Ef0QS4xuhk2UtW1iGBlvb7hBpZXa2JvF21Phz5W4ppholWLPiOZ
	 qtO+bFatUaFVF46EIOir9mknUC1Aoebx1z7YsMgkMAYO2FLGORC4lwyil3mfrpp774
	 KTsbkGbmDlGwNKXR50S09jvXYc1NSoEWXt1N+2wY=
Message-ID: <0cd5abccbbd307b0346fb4c542dc0a2764665fb7.camel@ideasonboard.com>
Subject: Re: [RFC PATCH 1/1] media: uvcvideo: Add no drop parameter for
 MJPEG_NO_EOF quirk
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Date: Tue, 17 Dec 2024 15:43:45 +0000
In-Reply-To: <CANiDSCuJVn9sSP+OWNp+AVM9NCsYaLC_x2AdtPhwwGsVMVK3Lg@mail.gmail.com>
References: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
	 <20241217112138.1891708-2-isaac.scott@ideasonboard.com>
	 <CANiDSCtkgRJdPQmwPV6GStLMv_xEYC51LDED1St6i9bnmNEPfg@mail.gmail.com>
	 <CANiDSCuJVn9sSP+OWNp+AVM9NCsYaLC_x2AdtPhwwGsVMVK3Lg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

On Tue, 2024-12-17 at 13:08 +0100, Ricardo Ribalda wrote:
> On Tue, 17 Dec 2024 at 12:58, Ricardo Ribalda <ribalda@chromium.org>
> wrote:
> >=20
> > Hi Issac
> >=20
> >=20
> > On Tue, 17 Dec 2024 at 12:22, Isaac Scott
> > <isaac.scott@ideasonboard.com> wrote:
> > >=20
> > > In use cases where a camera needs to use the
> > > UVC_QUIRK_MJPEG_NO_EOF,
> > > erroneous frames that do not conform to MJPEG standards are
> > > correctly
> > > being marked as erroneous. However, when using the camera in a
> > > product,
> > > manufacturers usually want to enable the quirk in order to pass
> > > the
> > > buffers into user space. To do this, they have to enable the
> > > uvc_no_drop
> > > parameter. To avoid the extra steps to configure the kernel in
> > > such a
> > > way, enable the no_drop parameter by default to comply with this
> > > use
> > > case.
> >=20
> > I am not sure what you want to do with this patch.
> >=20
> > Why can't people simply set the quirk with
> >=20
> > modprobe uvcvideo quirks=3D0x20000
>=20
> Sorry, I meant
>=20
> modprobe uvcvideo nodrop=3D1
>=20
> or
>=20
> echo 1 > /sys/module/uvcvideo/parameters/nodrop
>=20

That would also work, absolutely!

If a user has these cameras, they should always add the no_drop to
avoid losing frames that would otherwise be discarded as they are
erroneous.=C2=A0

This quirk will always trigger, and it is likely they would want to
have all the frames sent by the camera, while still marking them as
errors they can handle later in user space if they want to.

>=20
>=20
> --
> Ricardo Ribalda

Best wishes,

Isaac

