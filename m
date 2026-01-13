Return-Path: <linux-media+bounces-50592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B8AD1A988
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EED0300994D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A494350286;
	Tue, 13 Jan 2026 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U8ri9ys2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1637332B98F
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325072; cv=none; b=Xlls2CRB75/6V4dCYRniGUxE3GafRloH6h75450p5xfy3P7UYXNpTidkC9Gt1DaLYUDIiAvw/2dQyIY44eFCBgpVUdW4pZ4X8r6q80clPhteEvrhJEW4Bj0BxkHseRB1iukdWp0XuggAI51DHbD0eWV7/AASENqfEbxRSfhpA5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325072; c=relaxed/simple;
	bh=At5JYclpzHFMzQAzjMtF/k7TSbTFw4qxyRTnOnvX2Wo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=I1Lf2MZNtmHzOu3Inu5+cSUBfxwXMYAK/c4pYZZlFfeRq/p8nCp5+fOVlKF7mkPxec4jh09x79yS4WN3f8miAsGsUc8Gqzk9kR8YqJYyKGXL77jxOgJrUJyeoCOWwz4PhY8FohYCDz6BdgNUSUpeCa+/g329Zj6ebG4r7i75yU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U8ri9ys2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 118CE73B;
	Tue, 13 Jan 2026 18:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768325042;
	bh=At5JYclpzHFMzQAzjMtF/k7TSbTFw4qxyRTnOnvX2Wo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U8ri9ys2500jTH+BICIgLn+05HCRE8jlav65N9w1Km7hLLz/V78t6FmK2SvhStGSr
	 WsWu6h+jV4vSgf7Bk+VS1ik84aEjITrtfyEyifs1vN/yJP7RQ5KNsp9g0M6EPoFZwr
	 tUFrmKQ6SrsR+pyJr+sKaeJo/NDORrf2ULMsNqSk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176832303070.1230693.13311579665048872008@ping.linuxembedded.co.uk>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com> <20260113-b4-vchiq-isp-v1-1-ea0b300bffc8@ideasonboard.com> <176832303070.1230693.13311579665048872008@ping.linuxembedded.co.uk>
Subject: Re: [PATCH 01/10] platform/raspberrypi: vchiq-mmal: Move headers to include/linux
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Tue, 13 Jan 2026 22:54:23 +0530
Message-ID: <176832506332.2379386.7591736247076651406@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Kieran,

Quoting Kieran Bingham (2026-01-13 22:20:30)
> Quoting Jai Luthra (2026-01-13 09:05:21)
> > Now that VCHIQ interface is destaged, different drivers (like ISP or
> > codec) no longer live under the same tree as VCHIQ MMAL, but in their
> > relevant trees like media or audio.
> >=20
> > Enable access to VCHIQ headers for such drivers by moving these headers
> > under include/linux/raspberrypi with other VCHIQ related headers.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  MAINTAINERS                                                      | 1 +
> >  drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9 +=
+++-----
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-common.h       | 2=
 ++
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-encodings.h    | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-common.h   | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-format.h   | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-port.h     | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg.h          | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-parameters.h   | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-vchiq.h        | 0
> >  10 files changed, 7 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 816cceb5dc2d066665501aa8bbc04a2edd751087..16002c21fe06913ed57f495=
265b0b1ad14772c55 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4927,6 +4927,7 @@ F:        Documentation/devicetree/bindings/pci/b=
rcm,stb-pcie.yaml
> >  F:     drivers/pci/controller/pcie-brcmstb.c
> >  F:     drivers/platform/raspberrypi/vchiq-*
> >  F:     drivers/staging/vc04_services
> > +F:     include/linux/raspberrypi/mmal*
> >  F:     include/linux/raspberrypi/vchiq*
> >  N:     bcm2711
> >  N:     bcm2712
> > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/dri=
vers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > index a228098d8cc0af5d5900b92b2847a1626a6d599c..3ead81dd2d0f48be7a5dd87=
256c38d6ba0dbcd0e 100644
> > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > +++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > @@ -22,17 +22,16 @@
> >  #include <linux/mm.h>
> >  #include <linux/slab.h>
> >  #include <linux/completion.h>
> > +#include <linux/raspberrypi/mmal-common.h>
> > +#include <linux/raspberrypi/mmal-parameters.h>
> > +#include <linux/raspberrypi/mmal-vchiq.h>
> > +#include <linux/raspberrypi/mmal-msg.h>
> >  #include <linux/raspberrypi/vchiq.h>
> >  #include <linux/raspberrypi/vchiq_arm.h>
> >  #include <linux/raspberrypi/vc_sm_knl.h>
> >  #include <linux/vmalloc.h>
> >  #include <media/videobuf2-vmalloc.h>
> > =20
> > -#include "mmal-common.h"
> > -#include "mmal-parameters.h"
> > -#include "mmal-vchiq.h"
> > -#include "mmal-msg.h"
> > -

The mmal-common.h header got moved above videobuf2-vmalloc.h here ....

> >  /*
> >   * maximum number of components supported.
> >   * This matches the maximum permitted by default on the VPU
> > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/in=
clude/linux/raspberrypi/mmal-common.h
> > similarity index 97%
> > rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> > rename to include/linux/raspberrypi/mmal-common.h
> > index 6c5092a68b99594a0234f56b48b785fbc611bf5a..e7f065c539bcae7480a8dc2=
000d2a1e4cec7883c 100644
> > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> > +++ b/include/linux/raspberrypi/mmal-common.h
> > @@ -16,6 +16,8 @@
> >  #ifndef MMAL_COMMON_H
> >  #define MMAL_COMMON_H
> > =20
> > +#include <media/videobuf2-v4l2.h>
> > +
>=20
> Is this spurious? I could understand the changes up in mmal-vchiq.c
> above but I don't see how this relates to the move?
>=20

.... which exposed the fact that mmal-common.h references to `struct
vb2_v4l2_buffer` without including the relevant header, so clangd
complained and populated it for me, and I forgot to mention it in the
commit message.

Sorry for the confusion. Not a spurious change. Is this fine as a note in
the commit message, or should I fix the header as a separate commit in v2?

>=20
> >  #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24=
))
> >  #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
> > =20

[...]

Thanks,
Jai

