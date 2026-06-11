Return-Path: <linux-media+bounces-64540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ADPACVcKmpxoAMAu9opvQ
	(envelope-from <linux-media+bounces-64540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:56:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE466F31B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:56:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=XePHH9oC;
	dkim=pass header.d=redhat.com header.s=google header.b=Iu6yZraq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64540-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64540-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 032C3300B1D7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C5E3911A9;
	Thu, 11 Jun 2026 06:56:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2CE390981
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 06:56:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160983; cv=pass; b=IaUg24eM+Wh2oPeUfC5klPpt5nPi0viDb/AVJa8wvRsSwWt8NxFnFpbtKtKhRs4NxOWOwFDWNsDu1fTGP+s+xOHifsGG6SfKgJD9Y0pwsA1Gm2ypEAF4XFJDGu1sFfccI2Vzup0CEjxXjzt388hXIfTSRtIaU3dPHYjlLyiJLxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160983; c=relaxed/simple;
	bh=6+M4pQVuq+hJMinN2c52dVbvP6ojYtfLw9QuFMXQOTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBmYlONF74hyMCQGJKvWE4Mu7TcgkIJeaPArMlNIoAw353sw1cOuO0tmuUvQYSbs0bVKO5KFfd8rDYb4sEgY8LzeZ6zwOtKF+oIEDD0M9tgRnOh+KenObLrDiA1Z86hhY38GK4Y3J9OKX4MDQGPi5U4fHkVLJIbMnDVovnXMTHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XePHH9oC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iu6yZraq; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781160976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR2um5pr8u/uAJ2yI8KgHrB8OLT+pU8f7cPxo9L4xVE=;
	b=XePHH9oCQBdHhId/E+0YrizvhVbEF3pC8QxBMhOrH05V7fLMOkVQolZtFWeUGm9Zn5kugF
	PFjHOvrQSjMMt29kBFMi3dzRgyqqZ0UBP6Iq3ExdjUViSb+8fBY/UJ6KsvwJMJdTvLt86s
	SaaOYjtsVVYcExhkhf0PJRrNFhqeWUg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-Ps34enliOCGS_qI0QayttQ-1; Thu, 11 Jun 2026 02:56:14 -0400
X-MC-Unique: Ps34enliOCGS_qI0QayttQ-1
X-Mimecast-MFC-AGG-ID: Ps34enliOCGS_qI0QayttQ_1781160974
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6b73b3920so10070959a34.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 23:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781160974; cv=none;
        d=google.com; s=arc-20240605;
        b=Vi8+cPvUd4tEs4HPtOyQp/7dQbn+ZGG+gbFmugHBY4hwAmESiths+8v9yWa0u05wQn
         SVgyuteiVIOsEBPUNhHx06nMvLQjXukmvjllJBhK1KTCqsujSLTZiWWDgSEsVTvH2Yib
         K/xixsEOwfZIFz28tXzqIBeHQzjV+/8iNasyUOf6obJhFyfthR/6/b8Rvt4qwWxaH/ak
         lBkb0Uic1vYiqBbDnZp4R922dSzH4JI4kw+oyeSq5an41VnUj0SXGRKxybwx/zEIhDHX
         mgeLtGHb1MTVFKQMclFPqsbjWj1NlkrDnyrNBiOo3l44OHo82p/ges7JB+ENUBtRAzEp
         0cjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QR2um5pr8u/uAJ2yI8KgHrB8OLT+pU8f7cPxo9L4xVE=;
        fh=82Sd1brUAJek6srhpDwjotses1t9hK9HWNmVnRaAyH4=;
        b=IvkfrwN8dnj4lBNA1Du2p6yVhSp9QG6xhF1bU05svvFUiiWt6G/prI1X8FoBO1LzO8
         G3F1vyIYFW+9DAlmMJ1P151jvYBcpINRMh0ipHvWhwMr9f7R/hX53gMuHjPuIbHLIM8y
         xECxKe18ELyIo3cwej7N+BDZJk1IjZv1SWUINNg82e46NfJd9JSG99aJsUoIK+ay0QFh
         EJehXM7RE2flZ49TH5VNV+1fdfq9zw/BtZSKwxbuuwYPTx1EJ7E07FZ4PNGCWFehqB4X
         idaMJ2Sh3Zyie4+OM/nczdxj7TEgCvjKl7gyTDPtJ6qhUF8VzKieFuTL+ZB39sDXVlOm
         JJRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781160974; x=1781765774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR2um5pr8u/uAJ2yI8KgHrB8OLT+pU8f7cPxo9L4xVE=;
        b=Iu6yZraq/YUkRsQCHRh5djLVNnH1tLGO5HbIN69VvOFeuC6HxhOCmGs+TVelUvq0Dh
         M3mG36qWVZQaPzYvaTffJ8KXqYMicx78Eyg3leGGHaSaS2A8J9w8xrQDiQCqqHgm90eg
         BQLIaiyW0DzjpPS24cAhxZWIwqaf1Gt23bkg0ZiptE+d1olqQsG9/N0GIIm5BV12MP25
         GLRhVUXMKoSGpwUQ+K85C00DCR47shnN6q92W3RUvx9aGmXKmqIVJ7tAvuaKtlO8mZoP
         jaKy8ES+WCT1+yi3Sp73ERajMyY2dvezcDz+fcihXFRZZzVgFwjeu1Vdk6K7/dA7J2vT
         p+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781160974; x=1781765774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QR2um5pr8u/uAJ2yI8KgHrB8OLT+pU8f7cPxo9L4xVE=;
        b=PoxsqeI2Kn9gNsJDQmKTKVjjZTUTwl1Lci9lxYPzxY9RZMMqiMgq5VAoarWAtgbVrB
         wUGmKoD2ezYXKC8fMX070WATiWuOy9+ez/MsC7Ijz0r3IbLTsuCGhqipXl3Vpnk4hBLG
         PSK4IT8hF483pbDg4MaOE4m6pP7dT4s91S7jZjEp2DUXMlRyAUCd16PfTD/B+MKwey24
         AWffLeFUwhH8JIQSexZXUxAtkjm0qtU/dqXYKh1R76y/nqehNz98s/dgKbCHIm3SXLb2
         zaJ90ukc3Z7v+yKg72rZEenGWKVDKNCWSdFBy1tCES7f5LNVyH985k0jLxmm2O8JgHHf
         Cmyg==
X-Forwarded-Encrypted: i=1; AFNElJ84otjjVg+eUe1Cf1ek2gS9UKH9JOipKMqt+fd4AUNaqkpsXIhLL32Y1ZmGo7BHPRRwzxGwqCuA6MJFJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwFKnrdJxxlRNFmum/eXlyq8sJbnSNcLFn+jMfdgM8U5ZbAOh
	JbtGSn1DWa29NsqF2VHw4HtZVfakpDWFVNV8iVgPVNfi/LOSPyBSJ6/+PXE2B+zgfreUSJ9t1vL
	tQvJ+uIrxNpdcWp0aOL/sH/fDCMdCfyrzb1FsiWcr4Slma/8LiS9eq5Y0V1cywEMv0zJxLRKsdE
	uo8LB9K/hvIXmFJ6z7ZIEqVvevxD07g2UxT318LDA=
X-Gm-Gg: Acq92OHSxvtj3XuAlkHwf/cbIsr6fz0gkQLPNHyFxHW5OT7wra8aX9UaXtbihQhxNGw
	IXilMMaBq/h6ywoCQZhGijbFe51/2xgJqUIwAKpod0uQkY3+qm3IgCqEAxbR7RDBA/BKLzCYOLS
	7OV0R7dez7k05aXNRDGJrU8E1KtfotSh4x1JGK2PfbHjwqz6SJjNgglF92d2vqsARvydFC5hn+z
	YGijWI9aMrXpCyi
X-Received: by 2002:a05:6830:67d8:b0:7e6:c819:22e9 with SMTP id 46e09a7af769-7e773552049mr1022828a34.17.1781160973458;
        Wed, 10 Jun 2026 23:56:13 -0700 (PDT)
X-Received: by 2002:a05:6830:67d8:b0:7e6:c819:22e9 with SMTP id
 46e09a7af769-7e773552049mr1022810a34.17.1781160972855; Wed, 10 Jun 2026
 23:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609124926.1038981-1-hpa@redhat.com> <20260609124926.1038981-4-hpa@redhat.com>
 <aing9VOtGqv90DGS@kekkonen.localdomain>
In-Reply-To: <aing9VOtGqv90DGS@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 11 Jun 2026 14:56:00 +0800
X-Gm-Features: AVVi8Cdp6Niv56K4ZHPJAE42Griw8YLtWAU8nTp3GH4ASonqjMmnGBvsuksFiZk
Message-ID: <CAEth8oFQKT3oX2u3LV45dPG9cgUQO4036pk6T=z3SjPbO9fnHw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, Damjan Georgievski <gdamjan@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,intel.com,siliconsignals.io,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64540-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,intel.com:email,checkpactch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81BE466F31B

Hi Sakari,

Thank you for reviewing.

On Thu, Jun 11, 2026 at 6:11=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> Thanks for the update. I think we're nearly there.
>
> Please also run
>
>         $ ./scripts/checkpatch.pl --strict --max-line-length=3D80

sorry
My bad. I ran checkpactch.pl without max-line-length parameter. :(

>
> on this.
>
> Also see my commens below...
>
> On Tue, Jun 09, 2026 at 08:49:26PM +0800, Kate Hsuan wrote:
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c
> >
> > This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 lapto=
ps
> > and it is a part of IPU7 solution. The driver was tested on Lenovo X1
> > Carbon G14, X9-14 and X9-15 laptops.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  MAINTAINERS                |   6 +
> >  drivers/media/i2c/Kconfig  |  10 +
> >  drivers/media/i2c/Makefile |   1 +
> >  drivers/media/i2c/imx471.c | 949 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 966 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx471.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9ec290e38b44..f4bb6b528fa1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24963,6 +24963,12 @@ T:   git git://linuxtv.org/media.git
> >  F:   Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> >  F:   drivers/media/i2c/imx415.c
> >
> > +SONY IMX471 SENSOR DRIVER
> > +M:   Kate Hsuan <hpa@redhat.com>
> > +L:   linux-media@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/media/i2c/imx471.c
> > +
> >  SONY MEMORYSTICK SUBSYSTEM
> >  M:   Maxim Levitsky <maximlevitsky@gmail.com>
> >  M:   Alex Dubov <oakad@yahoo.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 8f2ba4121586..e1143579ae3d 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -287,6 +287,16 @@ config VIDEO_IMX415
> >         To compile this driver as a module, choose M here: the
> >         module will be called imx415.
> >
> > +config VIDEO_IMX471
> > +     tristate "Sony IMX471 sensor support"
> > +     select V4L2_CCI_I2C
> > +     help
> > +       This is a Video4Linux2 sensor driver for the Sony
> > +       IMX471 camera.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called imx471.
> > +
> >  config VIDEO_MAX9271_LIB
> >       tristate
> >
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 90b276a7417a..f5c9fa93dc47 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
> >  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
> >  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
> >  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> > +obj-$(CONFIG_VIDEO_IMX471) +=3D imx471.o
> >  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
> >  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
> >  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > new file mode 100644
> > index 000000000000..4d570cf7a91d
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -0,0 +1,949 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * imx471.c - imx471 sensor driver
> > + *
> > + * Copyright (C) 2025 Intel Corporation
> > + * Copyright (C) 2026 Kate Hsuan <hpa@redhat.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/unaligned.h>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +
> > +#define IMX471_REG_MODE_SELECT                       CCI_REG8(0x0100)
> > +#define IMX471_MODE_STANDBY                  0x00
> > +#define IMX471_MODE_STREAMING                        0x01
> > +
> > +/* Chip ID */
> > +#define IMX471_REG_CHIP_ID                   CCI_REG16(0x0016)
> > +#define IMX471_CHIP_ID                               0x0471
> > +
> > +/* V_TIMING internal */
> > +#define IMX471_REG_FLL                               CCI_REG16(0x0340)
> > +#define IMX471_FLL_MAX                               0xffff
> > +
> > +/* Exposure control */
> > +#define IMX471_REG_EXPOSURE                  CCI_REG16(0x0202)
> > +#define IMX471_EXPOSURE_MIN                  1
> > +#define IMX471_EXPOSURE_STEP                 1
> > +#define IMX471_EXPOSURE_DEFAULT                      1270
> > +
> > +/* Default exposure margin */
> > +#define IMX471_EXPOSURE_MARGIN                       18
> > +
> > +/* Analog gain control */
> > +#define IMX471_REG_ANALOG_GAIN                       CCI_REG16(0x0204)
> > +#define IMX471_ANA_GAIN_MIN                  0
> > +#define IMX471_ANA_GAIN_MAX                  800
> > +#define IMX471_ANA_GAIN_STEP                 1
> > +#define IMX471_ANA_GAIN_DEFAULT                      0
> > +
> > +/* Digital gain control */
> > +#define IMX471_REG_DPGA_USE_GLOBAL_GAIN              CCI_REG16(0x3ff9)
> > +#define IMX471_REG_DIG_GAIN_GLOBAL           CCI_REG16(0x020e)
> > +#define IMX471_DGTL_GAIN_MIN                 256
> > +#define IMX471_DGTL_GAIN_MAX                 4095
> > +#define IMX471_DGTL_GAIN_STEP                        1
> > +#define IMX471_DGTL_GAIN_DEFAULT             256
> > +
> > +/* HFLIP and VFLIP control */
> > +#define IMX471_REG_ORIENTATION                       CCI_REG8(0x0101)
> > +#define IMX471_HFLIP_BIT                     BIT(0)
> > +#define IMX471_VFLIP_BIT                     BIT(1)
> > +
> > +/* Test Pattern Control */
> > +#define IMX471_REG_TEST_PATTERN                      CCI_REG8(0x0600)
> > +#define IMX471_TEST_PATTERN_DISABLED         0
> > +#define IMX471_TEST_PATTERN_SOLID_COLOR              1
> > +#define IMX471_TEST_PATTERN_COLOR_BARS               2
> > +#define IMX471_TEST_PATTERN_GRAY_COLOR_BARS  3
> > +#define IMX471_TEST_PATTERN_PN9                      4
> > +
> > +/* default link frequency and external clock */
> > +#define IMX471_LINK_FREQ_DEFAULT             200000000LL
> > +#define IMX471_EXT_CLK                               19200000
> > +#define IMX471_LINK_FREQ_INDEX                       0
> > +
> > +/* IMX471 native and active pixel array size */
> > +#define IMX471_NATIVE_WIDTH                  4672
> > +#define IMX471_NATIVE_HEIGHT                 3512
> > +#define IMX471_PIXEL_ARRAY_LEFT                      8
> > +#define IMX471_PIXEL_ARRAY_TOP                       8
> > +#define IMX471_PIXEL_ARRAY_WIDTH             4656
> > +#define IMX471_PIXEL_ARRAY_HEIGHT            3496
> > +
> > +#define IMX471_REG_EXCK_FREQ                 CCI_REG16(0x0136)
> > +#define IMX471_EXCK_FREQ(n)                  ((n) * 256)     /* n in M=
Hz */
> > +
> > +#define IMX471_REG_CSI_DATA_FORMAT           CCI_REG16(0x0112)
> > +#define IMX471_CSI_DATA_FORMAT_RAW10         0x0a0a
> > +
> > +#define IMX471_REG_CSI_LANE_MODE             CCI_REG8(0x0114)
> > +#define IMX471_CSI_2_LANE_MODE                       1
> > +#define IMX471_CSI_4_LANE_MODE                       3
> > +
> > +#define IMX471_REG_X_ADD_STA                 CCI_REG16(0x0344)
> > +#define IMX471_REG_Y_ADD_STA                 CCI_REG16(0x0346)
> > +#define IMX471_REG_X_ADD_END                 CCI_REG16(0x0348)
> > +#define IMX471_REG_Y_ADD_END                 CCI_REG16(0x034a)
> > +#define IMX471_REG_X_OUTPUT_SIZE             CCI_REG16(0x034c)
> > +#define IMX471_REG_Y_OUTPUT_SIZE             CCI_REG16(0x034e)
> > +#define IMX471_REG_X_EVEN_INC                        CCI_REG8(0x0381)
> > +#define IMX471_REG_X_ODD_INC                 CCI_REG8(0x0383)
> > +#define IMX471_REG_Y_EVEN_INC                        CCI_REG8(0x0385)
> > +#define IMX471_REG_Y_ODD_INC                 CCI_REG8(0x0387)
> > +
> > +#define IMX471_REG_DIG_CROP_X_OFFSET         CCI_REG16(0x0408)
> > +#define IMX471_REG_DIG_CROP_Y_OFFSET         CCI_REG16(0x040a)
> > +#define IMX471_REG_DIG_CROP_WIDTH            CCI_REG16(0x040c)
> > +#define IMX471_REG_DIG_CROP_HEIGHT           CCI_REG16(0x040e)
> > +
> > +#define to_imx471(_sd) container_of_const(_sd, struct imx471, sd)
> > +
> > +static const char * const imx471_supply_name[] =3D {
> > +     "avdd",
> > +};
> > +
> > +struct imx471_mode {
> > +     u32 width;
> > +     u32 height;
> > +
> > +     /* V-timing */
> > +     u32 fll_def;
> > +     u32 fll_min;
> > +
> > +     /* H-timing */
> > +     u32 llp;
> > +
> > +     u32 link_freq_index;
> > +
> > +     const struct cci_reg_sequence *default_mode_regs;
> > +     unsigned int default_mode_regs_length;
> > +};
> > +
> > +struct imx471 {
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +     struct v4l2_ctrl *pixel_rate;
> > +     struct v4l2_ctrl *vblank;
> > +     struct v4l2_ctrl *hblank;
> > +     struct v4l2_ctrl *vflip;
> > +     struct v4l2_ctrl *hflip;
> > +     struct v4l2_ctrl *exposure;
> > +
> > +     struct gpio_desc *reset_gpio;
> > +     struct regulator_bulk_data supplies[ARRAY_SIZE(imx471_supply_name=
)];
> > +     struct clk *img_clk;
> > +
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +};
> > +
> > +static const struct cci_reg_sequence imx471_global_regs[] =3D {
> > +     { IMX471_REG_EXCK_FREQ, IMX471_EXCK_FREQ(19.2) },
> > +     { CCI_REG8(0x3c7e), 0x08 },
> > +     { CCI_REG8(0x3c7f), 0x05 },
> > +     { CCI_REG8(0x3e35), 0x00 },
> > +     { CCI_REG8(0x3e36), 0x00 },
> > +     { CCI_REG8(0x3e37), 0x00 },
> > +     { CCI_REG8(0x3f7f), 0x01 },
> > +     { CCI_REG8(0x4431), 0x04 },
> > +     { CCI_REG8(0x531c), 0x01 },
> > +     { CCI_REG8(0x531d), 0x02 },
> > +     { CCI_REG8(0x531e), 0x04 },
> > +     { CCI_REG8(0x5928), 0x00 },
> > +     { CCI_REG8(0x5929), 0x2f },
> > +     { CCI_REG8(0x592a), 0x00 },
> > +     { CCI_REG8(0x592b), 0x85 },
> > +     { CCI_REG8(0x592c), 0x00 },
> > +     { CCI_REG8(0x592d), 0x32 },
> > +     { CCI_REG8(0x592e), 0x00 },
> > +     { CCI_REG8(0x592f), 0x88 },
> > +     { CCI_REG8(0x5930), 0x00 },
> > +     { CCI_REG8(0x5931), 0x3d },
> > +     { CCI_REG8(0x5932), 0x00 },
> > +     { CCI_REG8(0x5933), 0x93 },
> > +     { CCI_REG8(0x5938), 0x00 },
> > +     { CCI_REG8(0x5939), 0x24 },
> > +     { CCI_REG8(0x593a), 0x00 },
> > +     { CCI_REG8(0x593b), 0x7a },
> > +     { CCI_REG8(0x593c), 0x00 },
> > +     { CCI_REG8(0x593d), 0x24 },
> > +     { CCI_REG8(0x593e), 0x00 },
> > +     { CCI_REG8(0x593f), 0x7a },
> > +     { CCI_REG8(0x5940), 0x00 },
> > +     { CCI_REG8(0x5941), 0x2f },
> > +     { CCI_REG8(0x5942), 0x00 },
> > +     { CCI_REG8(0x5943), 0x85 },
> > +     { CCI_REG8(0x5f0e), 0x6e },
> > +     { CCI_REG8(0x5f11), 0xc6 },
> > +     { CCI_REG8(0x5f17), 0x5e },
> > +     { CCI_REG8(0x7990), 0x01 },
> > +     { CCI_REG8(0x7993), 0x5d },
> > +     { CCI_REG8(0x7994), 0x5d },
> > +     { CCI_REG8(0x7995), 0xa1 },
> > +     { CCI_REG8(0x799a), 0x01 },
> > +     { CCI_REG8(0x799d), 0x00 },
> > +     { CCI_REG8(0x8169), 0x01 },
> > +     { CCI_REG8(0x8359), 0x01 },
> > +     { CCI_REG8(0x9302), 0x1e },
> > +     { CCI_REG8(0x9306), 0x1f },
> > +     { CCI_REG8(0x930a), 0x26 },
> > +     { CCI_REG8(0x930e), 0x23 },
> > +     { CCI_REG8(0x9312), 0x23 },
> > +     { CCI_REG8(0x9316), 0x2c },
> > +     { CCI_REG8(0x9317), 0x19 },
> > +     { CCI_REG8(0xb046), 0x01 },
> > +     { CCI_REG8(0xb048), 0x01 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_1928x1088_regs[] =3D {
> > +     { IMX471_REG_X_ADD_STA, 8 },
> > +     { IMX471_REG_Y_ADD_STA, 408 },
> > +     { IMX471_REG_X_ADD_END, 4647 },
> > +     { IMX471_REG_Y_ADD_END, 3051 },
> > +     { IMX471_REG_X_EVEN_INC, 1 },
> > +     { IMX471_REG_X_ODD_INC, 1 },
> > +     { IMX471_REG_Y_EVEN_INC, 1 },
> > +     { IMX471_REG_Y_ODD_INC, 1 },
> > +     { CCI_REG8(0x0900), 0x01 },
> > +     { CCI_REG8(0x0901), 0x22 },
> > +     { CCI_REG8(0x0902), 0x08 },
>
> I believe these registers have names, too.
They may be for image binning. I'll test and name the register.

>
> > +     { IMX471_REG_DIG_CROP_X_OFFSET, 208 },
> > +     { IMX471_REG_DIG_CROP_Y_OFFSET, 108 },
> > +     { IMX471_REG_DIG_CROP_WIDTH, 1928 },
> > +     { IMX471_REG_DIG_CROP_HEIGHT, 1088 },
> > +     { IMX471_REG_X_OUTPUT_SIZE, 1928 },
> > +     { IMX471_REG_Y_OUTPUT_SIZE, 1088 },
> > +     { CCI_REG8(0x0301), 0x06 },
> > +     { CCI_REG8(0x0303), 0x02 },
> > +     { CCI_REG8(0x0305), 0x02 },
> > +     { CCI_REG8(0x0306), 0x00 },
> > +     { CCI_REG8(0x0307), 0x79 },
> > +     { CCI_REG8(0x030b), 0x01 },
> > +     { CCI_REG8(0x030d), 0x02 },
> > +     { CCI_REG8(0x030e), 0x00 },
> > +     { CCI_REG8(0x030f), 0x53 },
> > +     { CCI_REG8(0x0310), 0x01 },
>
> Ditto.
>
> > +     { IMX471_REG_EXPOSURE, IMX471_EXPOSURE_DEFAULT },
> > +     { CCI_REG8(0x3f4c), 0x81 },
> > +     { CCI_REG8(0x3f4d), 0x81 },
> > +     { CCI_REG8(0x3f78), 0x01 },
> > +     { CCI_REG8(0x3f79), 0x31 },
> > +     { CCI_REG8(0x3ffe), 0x00 },
> > +     { CCI_REG8(0x3fff), 0x8a },
> > +     { CCI_REG8(0x5f0a), 0xb6 },
> > +};
> > +
> > +static const char * const imx471_test_pattern_menu[] =3D {
> > +     "Disabled",
> > +     "Solid Colour",
> > +     "Eight Vertical Colour Bars",
> > +     "Colour Bars With Fade to Grey",
> > +     "Pseudorandom Sequence (PN9)",
> > +};
> > +
> > +static const s64 link_freq_menu_items[] =3D {
> > +     IMX471_LINK_FREQ_DEFAULT,
> > +};
> > +
> > +/*
> > + * The Bayer formats for the flipping.
> > + * - no flip
> > + * - h flip
> > + * - v flip
> > + * - h and v flips
> > + */
> > +static const u32 imx471_hv_flips_bayer_order[] =3D {
> > +     MEDIA_BUS_FMT_SRGGB10_1X10,
> > +     MEDIA_BUS_FMT_SGRBG10_1X10,
> > +     MEDIA_BUS_FMT_SGBRG10_1X10,
> > +     MEDIA_BUS_FMT_SBGGR10_1X10,
> > +};
> > +
> > +static const struct imx471_mode imx471_modes[] =3D {
> > +     {
> > +             .width =3D 1928,
> > +             .height =3D 1088,
> > +             .fll_def =3D 1308,
> > +             .fll_min =3D 1308,
> > +             .llp =3D 2328,
> > +             .link_freq_index =3D IMX471_LINK_FREQ_INDEX,
> > +             .default_mode_regs =3D mode_1928x1088_regs,
> > +             .default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088_r=
egs),
> > +     },
> > +};
> > +
> > +static int imx471_get_regulators(struct device *dev, struct imx471 *se=
nsor)
> > +{
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(imx471_supply_name); i+=
+)
> > +             sensor->supplies[i].supply =3D imx471_supply_name[i];
> > +
> > +     return devm_regulator_bulk_get(dev, ARRAY_SIZE(imx471_supply_name=
),
> > +                                    sensor->supplies);
> > +}
> > +
> > +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct imx471 *sensor =3D container_of_const(ctrl->handler,
> > +                                                struct imx471,
> > +                                                ctrl_handler);
> > +     struct v4l2_subdev_state *state =3D
> > +                     v4l2_subdev_get_locked_active_state(&sensor->sd);
> > +     const struct v4l2_mbus_framefmt *format =3D
> > +                     v4l2_subdev_state_get_format(state, 0);
> > +     s64 exposure_max;
> > +     int ret;
> > +
> > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
>
> You can declare exposure_max here.
Ok

>
> > +             exposure_max =3D
> > +                     format->height + ctrl->val - IMX471_EXPOSURE_MARG=
IN;
> > +             ret =3D __v4l2_ctrl_modify_range(sensor->exposure,
> > +                                            sensor->exposure->minimum,
> > +                                            exposure_max,
> > +                                            sensor->exposure->step,
> > +                                            exposure_max);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     /* V4L2 controls values will be applied only when power is alread=
y up */
> > +     if (!pm_runtime_get_if_in_use(sensor->dev))
> > +             return 0;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             ret =3D cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN,
> > +                             ctrl->val, NULL);
> > +             break;
> > +     case V4L2_CID_DIGITAL_GAIN:
> > +             ret =3D cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_GLO=
BAL,
> > +                             ctrl->val, NULL);
> > +             break;
> > +     case V4L2_CID_EXPOSURE:
> > +             ret =3D cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> > +                             ctrl->val, &ret);
> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             /* Update FLL that meets expected vertical blanking */
> > +             ret =3D cci_write(sensor->regmap, IMX471_REG_FLL,
> > +                             format->height + ctrl->val, &ret);
> > +             break;
> > +     case V4L2_CID_TEST_PATTERN:
> > +             ret =3D cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN=
,
> > +                             ctrl->val, NULL);
> > +             break;
> > +     case V4L2_CID_HFLIP:
> > +     case V4L2_CID_VFLIP:
> > +             ret =3D cci_write(sensor->regmap, IMX471_REG_ORIENTATION,
> > +                             sensor->hflip->val | sensor->vflip->val <=
< 1, NULL);
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +             dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not hand=
led",
> > +                      ctrl->id, ctrl->val);
> > +             break;
> > +     }
> > +
> > +     pm_runtime_put(sensor->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops imx471_ctrl_ops =3D {
> > +     .s_ctrl =3D imx471_set_ctrl,
> > +};
> > +
> > +static u32 imx471_get_format_code(struct imx471 *sensor)
> > +{
> > +     unsigned int i;
> > +
> > +     i =3D (sensor->vflip->val ? 2 : 0) | (sensor->hflip->val ? 1 : 0)=
;
> > +
> > +     return imx471_hv_flips_bayer_order[i];
> > +}
> > +
> > +static int imx471_enum_mbus_code(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +
> > +     if (code->index >=3D (ARRAY_SIZE(imx471_hv_flips_bayer_order) / 4=
))
> > +             return -EINVAL;
> > +
> > +     code->code =3D imx471_get_format_code(sensor);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_enum_frame_size(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_frame_size_enum *fse=
)
> > +{
> > +     if (fse->index >=3D ARRAY_SIZE(imx471_modes))
> > +             return -EINVAL;
> > +
> > +     fse->min_width =3D imx471_modes[fse->index].width;
> > +     fse->max_width =3D fse->min_width;
> > +     fse->min_height =3D imx471_modes[fse->index].height;
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
> > +
> > +static void imx471_update_pad_format(struct imx471 *sensor,
> > +                                  const struct imx471_mode *mode,
> > +                                  struct v4l2_subdev_format *fmt)
> > +{
> > +     fmt->format.code =3D imx471_get_format_code(sensor);
> > +     fmt->format.width =3D mode->width;
> > +     fmt->format.height =3D mode->height;
> > +     fmt->format.field =3D V4L2_FIELD_NONE;
> > +}
> > +
> > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_format *fmt)
> > +{
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +     const struct imx471_mode *mode;
> > +     u64 pixel_rate;
> > +     int h_blank;
> > +     int ret;
> > +
> > +     mode =3D v4l2_find_nearest_size(imx471_modes,
> > +                                   ARRAY_SIZE(imx471_modes),
> > +                                   width, height,
> > +                                   fmt->format.width, fmt->format.heig=
ht);
>
> Fits on fewer lines.
OK

>
> > +
> > +     imx471_update_pad_format(sensor, mode, fmt);
> > +
> > +     *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;
> > +
> > +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return 0;
> > +
> > +     if (media_entity_is_streaming(&sensor->sd.entity))
> > +             return -EBUSY;
> > +
> > +     pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->pixel_rate,
> > +                                    V4L2_CID_PIXEL_RATE,
> > +                                    pixel_rate, 1, pixel_rate);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D __v4l2_ctrl_modify_range(sensor->vblank,
> > +                                    mode->fll_min - mode->height,
> > +                                    IMX471_FLL_MAX - mode->height,
> > +                                    1,
> > +                                    mode->fll_def - mode->height);
> > +     if (ret)
> > +             return ret;
> > +
> > +     h_blank =3D mode->llp - mode->width;
> > +     /*
> > +      * Currently hblank is not changeable.
> > +      * So FPS control is done only by vblank.
> > +      */
> > +     return __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > +                                     h_blank, 1, h_blank);
> > +}
> > +
> > +static int imx471_get_selection(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_selection *sel)
> > +{
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +             sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel->pad=
);
> > +             break;
> > +
> > +     case V4L2_SEL_TGT_NATIVE_SIZE:
> > +             sel->r.top =3D 0;
> > +             sel->r.left =3D 0;
> > +             sel->r.width =3D IMX471_NATIVE_WIDTH;
> > +             sel->r.height =3D IMX471_NATIVE_HEIGHT;
> > +             return 0;
> > +
> > +     case V4L2_SEL_TGT_CROP_DEFAULT:
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
> > +             sel->r.top =3D IMX471_PIXEL_ARRAY_TOP;
> > +             sel->r.left =3D IMX471_PIXEL_ARRAY_LEFT;
> > +             sel->r.width =3D IMX471_PIXEL_ARRAY_WIDTH;
> > +             sel->r.height =3D IMX471_PIXEL_ARRAY_HEIGHT;
> > +             return 0;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int imx471_init_state(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *sd_state)
> > +{
> > +     struct v4l2_subdev_format fmt =3D {
> > +             .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > +             .format =3D {
> > +                     .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > +                     .width =3D imx471_modes[0].width,
> > +                     .height =3D imx471_modes[0].height,
> > +             },
> > +     };
> > +
> > +     return imx471_set_pad_format(sd, sd_state, &fmt);
> > +}
> > +
> > +static int imx471_identify_module(struct imx471 *sensor)
> > +{
> > +     int ret;
> > +     u64 val;
> > +
> > +     ret =3D cci_read(sensor->regmap, IMX471_REG_CHIP_ID, &val, NULL);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to read chip id\n");
> > +
> > +     if (val !=3D IMX471_CHIP_ID)
> > +             return dev_err_probe(sensor->dev, -EIO,
> > +                                  "chip id mismatch: %x!=3D%llx\n",
> > +                                  IMX471_CHIP_ID, val);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +
> > +     clk_disable_unprepare(sensor->img_clk);
> > +     gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> > +
> > +     regulator_bulk_disable(ARRAY_SIZE(imx471_supply_name), sensor->su=
pplies);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_power_on(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +     int ret;
> > +
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(imx471_supply_name), sen=
sor->supplies);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to enable regulators: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(sensor->img_clk);
> > +     if (ret < 0) {
> > +             regulator_bulk_disable(ARRAY_SIZE(imx471_supply_name), se=
nsor->supplies);
> > +             dev_err(dev, "failed to enable imaging clock: %d", ret);
> > +             return ret;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> > +
> > +     usleep_range(10000, 15000);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_enable_stream(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *state,
> > +                             u32 pad, u64 streams_mask)
> > +{
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +     const struct imx471_mode *mode;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_resume_and_get(sensor->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D imx471_identify_module(sensor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D cci_multi_reg_write(sensor->regmap, imx471_global_regs,
> > +                               ARRAY_SIZE(imx471_global_regs), NULL);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to set global settings: %d",=
 ret);
> > +             goto error_powerdown;
> > +     }
> > +
> > +     state =3D v4l2_subdev_get_locked_active_state(&sensor->sd);
> > +     fmt =3D v4l2_subdev_state_get_format(state, 0);
> > +     mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_m=
odes),
> > +                                   width, height, fmt->width, fmt->hei=
ght);
> > +
> > +     ret =3D cci_multi_reg_write(sensor->regmap, mode->default_mode_re=
gs,
> > +                               mode->default_mode_regs_length, NULL);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to set mode: %d", ret);
> > +             goto error_powerdown;
> > +     }
> > +
> > +     ret =3D cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN=
, 1, NULL);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     ret =3D cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +                     IMX471_MODE_STREAMING, NULL);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     __v4l2_ctrl_grab(sensor->vflip, true);
> > +     __v4l2_ctrl_grab(sensor->hflip, true);
> > +
> > +     return ret;
> > +
> > +error_powerdown:
> > +     pm_runtime_put(sensor->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx471_disable_stream(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state,
> > +                              u32 pad, u64 streams_mask)
> > +{
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +     int ret;
> > +
> > +     ret =3D cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +                     IMX471_MODE_STANDBY, NULL);
> > +     pm_runtime_put(sensor->dev);
> > +
> > +     if (ret)
> > +             dev_err(sensor->dev,
> > +                     "failed to disable stream with return value: %d\n=
",
> > +                     ret);
> > +
> > +     __v4l2_ctrl_grab(sensor->vflip, false);
> > +     __v4l2_ctrl_grab(sensor->hflip, false);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops imx471_video_ops =3D {
> > +     .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops imx471_pad_ops =3D {
> > +     .enum_mbus_code =3D imx471_enum_mbus_code,
> > +     .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .set_fmt =3D imx471_set_pad_format,
> > +     .get_selection =3D imx471_get_selection,
> > +     .enum_frame_size =3D imx471_enum_frame_size,
> > +     .enable_streams =3D imx471_enable_stream,
> > +     .disable_streams =3D imx471_disable_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_ops imx471_subdev_ops =3D {
> > +     .video =3D &imx471_video_ops,
> > +     .pad =3D &imx471_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops imx471_internal_ops =3D {
> > +     .init_state =3D imx471_init_state,
> > +};
> > +
> > +static int imx471_init_controls(struct imx471 *sensor)
> > +{
> > +     const struct imx471_mode *mode =3D &imx471_modes[0];
> > +     struct v4l2_fwnode_device_properties props;
> > +     struct v4l2_ctrl_handler *ctrl_hdlr;
> > +     struct v4l2_ctrl *link_freq;
> > +     s64 exposure_max, hblank;
> > +     u64 pixel_rate;
> > +     int ret;
> > +
> > +     ctrl_hdlr =3D &sensor->ctrl_handler;
>
> You can initialise this in declaration.
>
> > +     v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>
> Initialising the handler allocates memory so pelase move under
> v4l2_fwnode_device_parse() below.

OK. I'll rework these lines.

>
> > +
> > +     ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to parse fwnode: %d", ret);
> > +             return ret;
> > +     }
> > +
> > +     v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &pro=
ps);
> > +
> > +     link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > +                                        &imx471_ctrl_ops,
> > +                                        V4L2_CID_LINK_FREQ,
> > +                                        ARRAY_SIZE(link_freq_menu_item=
s) - 1,
> > +                                        0,
> > +                                        link_freq_menu_items);
> > +
> > +     /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample *=
/
> > +     pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> > +
> > +     sensor->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_=
ops,
> > +                                            V4L2_CID_PIXEL_RATE, pixel=
_rate,
> > +                                            pixel_rate, 1, pixel_rate)=
;
> > +
> > +     sensor->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > +                                        &imx471_ctrl_ops,
> > +                                        V4L2_CID_VBLANK,
> > +                                        mode->fll_min - mode->height,
> > +                                        IMX471_FLL_MAX - mode->height,
> > +                                        1,
> > +                                        mode->fll_def - mode->height);
> > +
> > +     hblank =3D mode->llp - mode->width;
> > +     sensor->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                        V4L2_CID_HBLANK, hblank, hblan=
k,
> > +                                        1, hblank);
> > +
> > +     /* fll >=3D exposure time + adjust parameter (default value is 18=
) */
> > +     exposure_max =3D mode->fll_def - IMX471_EXPOSURE_MARGIN;
> > +     sensor->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_op=
s,
> > +                                          V4L2_CID_EXPOSURE,
> > +                                          IMX471_EXPOSURE_MIN, exposur=
e_max,
> > +                                          IMX471_EXPOSURE_STEP,
> > +                                          IMX471_EXPOSURE_DEFAULT);
> > +
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGUE_=
GAIN,
> > +                       IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
> > +                       IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT);
> > +
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL_G=
AIN,
> > +                       IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
> > +                       IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAULT=
);
> > +
> > +     v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                  V4L2_CID_TEST_PATTERN,
> > +                                  ARRAY_SIZE(imx471_test_pattern_menu)=
 - 1,
> > +                                  0, 0, imx471_test_pattern_menu);
> > +
> > +     sensor->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                       V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +
> > +     sensor->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                       V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +     if (ctrl_hdlr->error) {
> > +             dev_err(sensor->dev, "%s control init failed: %d",
> > +                     __func__, ctrl_hdlr->error);
> > +             goto error;
> > +     }
> > +
> > +     link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +     sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +     sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +     sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +     sensor->sd.ctrl_handler =3D ctrl_hdlr;
> > +
> > +     return 0;
> > +
> > +error:
> > +     v4l2_ctrl_handler_free(ctrl_hdlr);
> > +
> > +     return ctrl_hdlr->error;
> > +}
> > +
> > +static int imx471_check_hwcfg(struct imx471 *sensor)
> > +{
> > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +     };
> > +     struct fwnode_handle *ep, *fwnode =3D dev_fwnode(sensor->dev);
> > +     unsigned long link_freq_bitmap;
> > +     struct clk *clk;
> > +     int ret;
> > +
> > +     clk =3D devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return dev_err_probe(sensor->dev, PTR_ERR(clk),
> > +                                  "can't get clock frequency\n");
> > +
> > +     if (clk_get_rate(clk) !=3D IMX471_EXT_CLK)
> > +             return dev_err_probe(sensor->dev, -EINVAL,
> > +                                  "external clock %lu is not supported=
\n",
> > +                                  clk_get_rate(clk));
> > +
> > +     ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > +     ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +     fwnode_handle_put(ep);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "parsing endpoint failed");
> > +
> > +     ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freque=
ncies,
> > +                                    bus_cfg.nr_of_link_frequencies,
> > +                                    link_freq_menu_items,
> > +                                    ARRAY_SIZE(link_freq_menu_items),
> > +                                    &link_freq_bitmap);
> > +
> > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx471_probe(struct i2c_client *client)
> > +{
> > +     struct imx471 *sensor;
> > +     int ret;
> > +
> > +     sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL=
);
> > +     if (!sensor)
> > +             return dev_err_probe(&client->dev, -ENOMEM,
> > +                                  "failed to allocate memory\n");
> > +
> > +     sensor->dev =3D &client->dev;
> > +
> > +     ret =3D imx471_check_hwcfg(sensor);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to check hwcfg: %d\n", ret);
> > +
> > +     ret =3D imx471_get_regulators(sensor->dev, sensor);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to get regulators\n");
> > +
> > +     sensor->reset_gpio =3D devm_gpiod_get_optional(sensor->dev, "rese=
t",
> > +                                                  GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->reset_gpio))
> > +             return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset_g=
pio),
> > +                                  "failed to get reset gpio\n");
> > +
> > +     sensor->img_clk =3D devm_clk_get_optional(sensor->dev, NULL);
> > +     if (IS_ERR(sensor->img_clk))
> > +             return dev_err_probe(sensor->dev, PTR_ERR(sensor->img_clk=
),
> > +                                  "failed to get imaging clock\n");
> > +
> > +     v4l2_i2c_subdev_init(&sensor->sd, client, &imx471_subdev_ops);
> > +
> > +     sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(sensor->regmap))
> > +             return dev_err_probe(sensor->dev, PTR_ERR(sensor->regmap)=
,
> > +                                  "failed to initialize CCI\n");
> > +
> > +     ret =3D imx471_power_on(sensor->dev);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to power on\n");
> > +
> > +     ret =3D imx471_identify_module(sensor);
> > +     if (ret) {
> > +             dev_err_probe(sensor->dev, ret, "failed to find sensor: %=
d", ret);
> > +             goto error_power_off;
> > +     }
> > +
> > +     ret =3D imx471_init_controls(sensor);
> > +     if (ret) {
> > +             dev_err_probe(sensor->dev, ret, "failed to init controls:=
 %d", ret);
> > +             goto error_power_off;
> > +     }
> > +
> > +     sensor->sd.internal_ops =3D &imx471_internal_ops;
> > +     sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
> > +     if (ret) {
> > +             dev_err_probe(sensor->dev, ret, "failed to init entity pa=
ds: %d", ret);
> > +             goto error_v4l2_ctrl_handler_free;
> > +     }
> > +
> > +     sensor->sd.state_lock =3D sensor->ctrl_handler.lock;
> > +     ret =3D v4l2_subdev_init_finalize(&sensor->sd);
> > +     if (ret < 0) {
> > +             dev_err_probe(sensor->dev, ret, "failed to init subdev: %=
d", ret);
> > +             goto error_media_entity_pm;
> > +     }
> > +
> > +     pm_runtime_set_active(sensor->dev);
> > +     pm_runtime_enable(sensor->dev);
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret < 0)
> > +             goto error_v4l2_subdev_cleanup;
> > +
> > +     pm_runtime_idle(sensor->dev);
> > +
> > +     return 0;
> > +
> > +error_v4l2_subdev_cleanup:
> > +     pm_runtime_disable(sensor->dev);
> > +     pm_runtime_set_suspended(sensor->dev);
> > +     v4l2_subdev_cleanup(&sensor->sd);
> > +
> > +error_media_entity_pm:
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +
> > +error_v4l2_ctrl_handler_free:
> > +     v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> > +
> > +error_power_off:
> > +     imx471_power_off(sensor->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static void imx471_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +
> > +     v4l2_async_unregister_subdev(sd);
> > +     v4l2_subdev_cleanup(sd);
> > +     media_entity_cleanup(&sd->entity);
> > +     v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +
> > +     pm_runtime_disable(&client->dev);
> > +
> > +     if (!pm_runtime_status_suspended(&client->dev)) {
> > +             imx471_power_off(&client->dev);
> > +             pm_runtime_set_suspended(&client->dev);
> > +     }
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(imx471_pm_ops, imx471_power_off,
> > +                              imx471_power_on, NULL);
> > +
> > +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused =
=3D {
> > +     { "SONY471A" },
> > +     { "TBE20A0" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
> > +
> > +static struct i2c_driver imx471_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "imx471",
> > +             .acpi_match_table =3D ACPI_PTR(imx471_acpi_ids),
> > +             .pm =3D pm_sleep_ptr(&imx471_pm_ops),
> > +     },
> > +     .probe =3D imx471_probe,
> > +     .remove =3D imx471_remove,
> > +};
> > +module_i2c_driver(imx471_i2c_driver);
> > +
> > +MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");
> > +MODULE_AUTHOR("Serin Yeh <serin.yeh@intel.com>");
> > +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> > +MODULE_DESCRIPTION("Sony imx471 sensor driver");
> > +MODULE_LICENSE("GPL");
>
> --
> Kind regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


