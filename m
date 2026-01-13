Return-Path: <linux-media+bounces-50593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FCD1AB02
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DF933023579
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65DB38F242;
	Tue, 13 Jan 2026 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hTm0evM5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F9328B6A
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326182; cv=none; b=SJSWwXja782+CBh9bUBYAtR7MsNWeElLTwu6ASqMyP6dZmbeIzSSmQqAOLVTb3tvODCnhpsSr+74rW6jmjEnHROp5wiuQIGo46UnqfSFvMG3lkQeZ9ewqrUccUQnsrA9WFtSoIockQHaDY6ZrpmaMxSfxftkd719VlJwxKrL2io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326182; c=relaxed/simple;
	bh=wFV93meXFrcLbuXHNLmfKXvFczDRPZgMrWOYRpkc0C0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OaHU3w0NcB9ZG7zzs+4QVAfipUvW0sgYXcNsbiwTal61wJzYRT5wEr2MLzSyazmeQqmsGZIJnVyFu2x6Y24CbQSxetZvV33hLL6kIjw7zyFtPW8utECJ8VO7UDFVXZJjb6JftwIIZ9CH+RHQ0FTFStNR1e3BBoVskPGr7eEF7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hTm0evM5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF346316;
	Tue, 13 Jan 2026 18:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768326152;
	bh=wFV93meXFrcLbuXHNLmfKXvFczDRPZgMrWOYRpkc0C0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hTm0evM5NXFlhnKK0YGe+knYI3LzpybbZlr/N3nTkfxN07YpJVk/Y2a+JTdAqnOGQ
	 aFPvEwbyhMSgwkKTvA6g2u7I1vt6C/lSsBFYvngFSzT7uj68jTkTJMg/AUqRPFZAII
	 ANfOmbaO8X925jp3gjrAwgGcDboGA61k3HvHlLIY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176832506332.2379386.7591736247076651406@freya>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com> <20260113-b4-vchiq-isp-v1-1-ea0b300bffc8@ideasonboard.com> <176832303070.1230693.13311579665048872008@ping.linuxembedded.co.uk> <176832506332.2379386.7591736247076651406@freya>
Subject: Re: [PATCH 01/10] platform/raspberrypi: vchiq-mmal: Move headers to include/linux
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Tue, 13 Jan 2026 17:42:55 +0000
Message-ID: <176832617565.1693075.11795770819049418637@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Jai Luthra (2026-01-13 17:24:23)
> Hi Kieran,
>=20
> Quoting Kieran Bingham (2026-01-13 22:20:30)
> > Quoting Jai Luthra (2026-01-13 09:05:21)
> > > Now that VCHIQ interface is destaged, different drivers (like ISP or
> > > codec) no longer live under the same tree as VCHIQ MMAL, but in their
> > > relevant trees like media or audio.
> > >=20
> > > Enable access to VCHIQ headers for such drivers by moving these heade=
rs
> > > under include/linux/raspberrypi with other VCHIQ related headers.
> > >=20
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  MAINTAINERS                                                      | 1=
 +
> > >  drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9=
 ++++-----
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-common.h       |=
 2 ++
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-encodings.h    |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-common.h   |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-format.h   |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-port.h     |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg.h          |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-parameters.h   |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-vchiq.h        |=
 0
> > >  10 files changed, 7 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 816cceb5dc2d066665501aa8bbc04a2edd751087..16002c21fe06913ed57f4=
95265b0b1ad14772c55 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4927,6 +4927,7 @@ F:        Documentation/devicetree/bindings/pci=
/brcm,stb-pcie.yaml
> > >  F:     drivers/pci/controller/pcie-brcmstb.c
> > >  F:     drivers/platform/raspberrypi/vchiq-*
> > >  F:     drivers/staging/vc04_services
> > > +F:     include/linux/raspberrypi/mmal*
> > >  F:     include/linux/raspberrypi/vchiq*
> > >  N:     bcm2711
> > >  N:     bcm2712
> > > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/d=
rivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > > index a228098d8cc0af5d5900b92b2847a1626a6d599c..3ead81dd2d0f48be7a5dd=
87256c38d6ba0dbcd0e 100644
> > > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > > +++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > > @@ -22,17 +22,16 @@
> > >  #include <linux/mm.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/completion.h>
> > > +#include <linux/raspberrypi/mmal-common.h>
> > > +#include <linux/raspberrypi/mmal-parameters.h>
> > > +#include <linux/raspberrypi/mmal-vchiq.h>
> > > +#include <linux/raspberrypi/mmal-msg.h>
> > >  #include <linux/raspberrypi/vchiq.h>
> > >  #include <linux/raspberrypi/vchiq_arm.h>
> > >  #include <linux/raspberrypi/vc_sm_knl.h>
> > >  #include <linux/vmalloc.h>
> > >  #include <media/videobuf2-vmalloc.h>
> > > =20
> > > -#include "mmal-common.h"
> > > -#include "mmal-parameters.h"
> > > -#include "mmal-vchiq.h"
> > > -#include "mmal-msg.h"
> > > -
>=20
> The mmal-common.h header got moved above videobuf2-vmalloc.h here ....
>=20
> > >  /*
> > >   * maximum number of components supported.
> > >   * This matches the maximum permitted by default on the VPU
> > > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/=
include/linux/raspberrypi/mmal-common.h
> > > similarity index 97%
> > > rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> > > rename to include/linux/raspberrypi/mmal-common.h
> > > index 6c5092a68b99594a0234f56b48b785fbc611bf5a..e7f065c539bcae7480a8d=
c2000d2a1e4cec7883c 100644
> > > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> > > +++ b/include/linux/raspberrypi/mmal-common.h
> > > @@ -16,6 +16,8 @@
> > >  #ifndef MMAL_COMMON_H
> > >  #define MMAL_COMMON_H
> > > =20
> > > +#include <media/videobuf2-v4l2.h>
> > > +
> >=20
> > Is this spurious? I could understand the changes up in mmal-vchiq.c
> > above but I don't see how this relates to the move?
> >=20
>=20
> .... which exposed the fact that mmal-common.h references to `struct
> vb2_v4l2_buffer` without including the relevant header, so clangd
> complained and populated it for me, and I forgot to mention it in the
> commit message.
>=20
> Sorry for the confusion. Not a spurious change. Is this fine as a note in
> the commit message, or should I fix the header as a separate commit in v2?

Either is fine I think ;-) It just stood out otherwise!

With either approach:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> >=20
> > >  #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << =
24))
> > >  #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
> > > =20
>=20
> [...]
>=20
> Thanks,
> Jai

