Return-Path: <linux-media+bounces-22641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 369DA9E3FA4
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 17:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E75B12821C9
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C255720CCEC;
	Wed,  4 Dec 2024 16:28:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D1C20CCCE
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329685; cv=none; b=Ma0Uf6aMk2X9jbenHAox1YyDB92JeWMet78ERCcm/lBsOe8Gmo5PzjeZ/sDNkWn4PU3NGlZGrhYsNeJvuoY2VDj6pfWUPYhivuIT5Jv3hxqPVUQmdtlztUKT3Pak5POCQUgof9VA+U6kWcA26rOrTSpm7YObtW4UvBp4VRowCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329685; c=relaxed/simple;
	bh=Yt9IaLYz4/bmVWxN7qQE0eyezZ/u8j672XnnMGH+62Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScPCVbEpUabZOx9RKZ/BtWiq6eX6if/IHWhsrMLXXjSWLFJdjuXlh1FBLYbAnCQ1fp8WsFTbXn/dHFD4ep1qh++dwHFJg27lrVIphThCqKDs9dGGh3xsIhWVuKk8dF28UGs5Om64trH5KZTE1XCKjeP13C7E2Cstn8ZgSUgggfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1tIsE3-0000WH-UI; Wed, 04 Dec 2024 17:27:43 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1tIsDz-001g8w-1j;
	Wed, 04 Dec 2024 17:27:40 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1tIsE0-00EabL-0d;
	Wed, 04 Dec 2024 17:27:40 +0100
Date: Wed, 4 Dec 2024 17:27:40 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: allegro-dvt: Moving the current driver to
 subdirectory
Message-ID: <Z1CC_PQF8hCzmPoQ@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
 <Z02SLI05JhNDtXFn@pengutronix.de>
 <abshbp4blqxasxvf4ibumtfqcr7hytehmhzs2yag3nfpbcl47x@ndjg7al4iysk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abshbp4blqxasxvf4ibumtfqcr7hytehmhzs2yag3nfpbcl47x@ndjg7al4iysk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Yassine,

On Wed, 04 Dec 2024 14:44:31 +0000, Yassine Ouaissa wrote:
> On 02.12.2024 11:55, Michael Tretter wrote:
> > On Mon, 02 Dec 2024 11:26:38 +0100, Yassine Ouaissa wrote:
> > What kind of conflicts do you encounter or expect? It's kind of
> > surprising that your driver would conflict with anything in the existing
> > driver.
> 
> The current "NOT allegro" driver support only the ZynqMP (ex : ZCU106/ZCU104 ).
> And the upcoming driver, has support for many platforms.

What are the supported platforms of the new driver? Does your driver
support ZynqMP, too?

If there are enough similarities between the encoders, I'd happily
replace parts of the current driver with functionality of the upcoming
driver or reuse the infrastructure of the new driver.

> 
> > I'd like to see how you plan to integrate your driver, what it looks
> > like and what conflicts with the existing driver actually occur. Without
> > that information I don't see the point in moving the driver to a
> > sub-directory.
> 
> The upcoming driver is not using the parsing, conversion inside of the
> driver. Actually the new Gen of ALLEGRO IP does that.

Sorry, I don't understand what you mean by parsing and conversion. Do
you mean the mailbox messages or the NAL units?

Can you point me to some repository with your upcoming driver? I'd
really like to know what's coming up to have an informed discussion how
to structure the directory.

Michael

> > > 
> > > Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> > > ---
> > >  MAINTAINERS                                               | 2 +-
> > >  drivers/media/platform/allegro-dvt/Kconfig                | 4 ++--
> > >  drivers/media/platform/allegro-dvt/Makefile               | 8 ++------
> > >  drivers/media/platform/allegro-dvt/zynqmp/Makefile        | 6 ++++++
> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c    | 0
> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h    | 0
> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c    | 0
> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h    | 0
> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c    | 0
> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h    | 0
> > >  .../{allegro-core.c => zynqmp/zynqmp-allegro-core.c}      | 2 +-
> > >  .../{allegro-mail.c => zynqmp/zynqmp-allegro-mail.c}      | 2 +-
> > >  .../{allegro-mail.h => zynqmp/zynqmp-allegro-mail.h}      | 0
> > >  13 files changed, 13 insertions(+), 11 deletions(-)
> > >  create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)
> > >  rename drivers/media/platform/allegro-dvt/{allegro-core.c => zynqmp/zynqmp-allegro-core.c} (99%)
> > >  rename drivers/media/platform/allegro-dvt/{allegro-mail.c => zynqmp/zynqmp-allegro-mail.c} (99%)
> > >  rename drivers/media/platform/allegro-dvt/{allegro-mail.h => zynqmp/zynqmp-allegro-mail.h} (100%)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 7292e4a1ddb8..d79efe6f8992 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -795,7 +795,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> > > -F:	drivers/media/platform/allegro-dvt/
> > > +F:	drivers/media/platform/allegro-dvt/zynqmp
> > > 
> > >  ALLIED VISION ALVIUM CAMERA DRIVER
> > >  M:	Tommaso Merciai <tomm.merciai@gmail.com>
> > > diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
> > > index 2182e1277568..9bc7e99788b8 100644
> > > --- a/drivers/media/platform/allegro-dvt/Kconfig
> > > +++ b/drivers/media/platform/allegro-dvt/Kconfig
> > > @@ -2,8 +2,8 @@
> > > 
> > >  comment "Allegro DVT media platform drivers"
> > > 
> > > -config VIDEO_ALLEGRO_DVT
> > > -	tristate "Allegro DVT Video IP Core"
> > > +config VIDEO_ZYNQMP_ALLEGRO_DVT
> > > +	tristate "Allegro DVT Video IP Core for ZynqMP"
> > >  	depends on V4L_MEM2MEM_DRIVERS
> > >  	depends on VIDEO_DEV
> > >  	depends on ARCH_ZYNQMP || COMPILE_TEST
> > > diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
> > > index 66108a303774..04727c5f7ef4 100644
> > > --- a/drivers/media/platform/allegro-dvt/Makefile
> > > +++ b/drivers/media/platform/allegro-dvt/Makefile
> > > @@ -1,6 +1,2 @@
> > > -# SPDX-License-Identifier: GPL-2.0
> > > -
> > > -allegro-objs := allegro-core.o allegro-mail.o
> > > -allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
> > > -
> > > -obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +obj-y += zynqmp/
> > > diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
> > > new file mode 100644
> > > index 000000000000..a8ddb9cf93a8
> > > --- /dev/null
> > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
> > > @@ -0,0 +1,6 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +zynqmp-allegro-objs := zynqmp-allegro-core.o zynqmp-allegro-mail.o
> > > +zynqmp-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
> > > +
> > > +obj-$(CONFIG_VIDEO_ZYNQMP_ALLEGRO_DVT) += zynqmp-allegro.o
> > > diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
> > > similarity index 100%
> > > rename from drivers/media/platform/allegro-dvt/nal-h264.c
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
> > > diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
> > > similarity index 100%
> > > rename from drivers/media/platform/allegro-dvt/nal-h264.h
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
> > > diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
> > > similarity index 100%
> > > rename from drivers/media/platform/allegro-dvt/nal-hevc.c
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
> > > diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
> > > similarity index 100%
> > > rename from drivers/media/platform/allegro-dvt/nal-hevc.h
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
> > > diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
> > > similarity index 100%
> > > rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
> > > diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
> > > similarity index 100%
> > > rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
> > > diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> > > similarity index 99%
> > > rename from drivers/media/platform/allegro-dvt/allegro-core.c
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> > > index e491399afcc9..8895d7755987 100644
> > > --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> > > @@ -31,7 +31,7 @@
> > >  #include <media/videobuf2-dma-contig.h>
> > >  #include <media/videobuf2-v4l2.h>
> > > 
> > > -#include "allegro-mail.h"
> > > +#include "zynqmp-allegro-mail.h"
> > >  #include "nal-h264.h"
> > >  #include "nal-hevc.h"
> > > 
> > > diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> > > similarity index 99%
> > > rename from drivers/media/platform/allegro-dvt/allegro-mail.c
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> > > index aadc947a77ae..88a98f9e5d00 100644
> > > --- a/drivers/media/platform/allegro-dvt/allegro-mail.c
> > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> > > @@ -12,7 +12,7 @@
> > >  #include <linux/string.h>
> > >  #include <linux/videodev2.h>
> > > 
> > > -#include "allegro-mail.h"
> > > +#include "zynqmp-allegro-mail.h"
> > > 
> > >  const char *msg_type_name(enum mcu_msg_type type)
> > >  {
> > > diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
> > > similarity index 100%
> > > rename from drivers/media/platform/allegro-dvt/allegro-mail.h
> > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
> > > --
> > > 2.30.2
> > > 
> > > 

