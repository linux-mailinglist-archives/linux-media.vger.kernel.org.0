Return-Path: <linux-media+bounces-65605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RuJEFYS+PGrjrAgAu9opvQ
	(envelope-from <linux-media+bounces-65605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:37:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBC66C2CE9
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:37:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=JI8Y7KT+;
	dkim=pass header.d=redhat.com header.s=google header.b=NWsmXkhn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65605-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65605-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07B363025494
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 05:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A8C2EC0A4;
	Thu, 25 Jun 2026 05:37:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DB19ADA4
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 05:36:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782365820; cv=pass; b=BfvZ6UcgiHbseB+t+hhTmEsVfr5UFuowPRCZjAerixV7gS8MxWagBr1TP2Mg2yvZUXbRuTvLenFCKH5zW14DM5mlBuBIvk2bFryDdYQDV3I23othcW9bcAaweLkizsmpvMZVPjoxGiTrFblYFVwfFGauP6DiYkCzHUdfPSMat6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782365820; c=relaxed/simple;
	bh=pDPLgrcu3Tl3D89tNxcP2xZefRiIVYhfzuxpQ27o434=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMUURrieRLF+Cm2/9IM4ACZTJZO1oCrp9nx2pcuM+yCM8tcZ3VXpa40+Bo1a20kSdiDFG5/5sRxpuxSg07x13ioS+zI30f+gOKokgvVQmUlHagLQeAflxCw4Jm3Vn4o/jXr/ULOcj75ji90/sS6M+xZq1pindTOqS5q4mJZrxvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JI8Y7KT+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NWsmXkhn; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782365816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kt5WwNy1VOYbQcp8vHFvNX0LBfHICQ9TFvh64zz3fVw=;
	b=JI8Y7KT+Yakv/uQTv21r7WXmA98e710yzrt+oXIu5r1wYTeeBcXBO25LVCybojsmgt5P3K
	RNw60L84WkJSAG/sGZLSmAke6GB/vuVmkvDS8VTxFW/dTCiKHS3ojC3c4yE1iacIvev3DU
	yofnn6vWxxnW4loL64gOTTyg3Yr+a5k=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-4AkrT4n1MHajUiPJwf3jjg-1; Thu, 25 Jun 2026 01:36:54 -0400
X-MC-Unique: 4AkrT4n1MHajUiPJwf3jjg-1
X-Mimecast-MFC-AGG-ID: 4AkrT4n1MHajUiPJwf3jjg_1782365814
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6d78299e9so2540474a34.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 22:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782365814; cv=none;
        d=google.com; s=arc-20260327;
        b=iltUCEJ2MtP93Kt3Ax3YIWZxQjpMvHfRszE3h+ZKETyjdkmLtkEtNx/DQSRdn6C87j
         +nk+t5LuO/Ed8XehPGOoNQCp/LP48jOAcVIqCVbLqShRe8gwHotmNDaZy4UQVNQ4RpvB
         dW9jRKLkT700OkEqwwayLGxwH5n234VqW+QICUo2SopnZVvSQJWDtEfI7DJKEi3YFTxl
         dGCY6TYuEcs/IjeUR3lCd9BjjTyZS19jG4nCOl9otQ6fYKbdLZLNuudqgZir1FFjHrNG
         3ygop+uh5HfvoZEAwPUaHYtrKH4qm4Xy7uXVyd0A0+ICkyCC7JjxYRgKEwqwqFhQvEpG
         Trqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kt5WwNy1VOYbQcp8vHFvNX0LBfHICQ9TFvh64zz3fVw=;
        fh=EK4Wt9PGqCNSA+IjzE6G1QcSbd06vQzuhEwH1+TARSU=;
        b=CIGySyu7UB9mcZdhSXL367w0i7iL2Xtjh0GCxvbdZHaEf8Oor/+gjj2IiJIEA4CuMG
         Pk2OUsRiwXuYtA7sOVkItjvBr6ymlUSGni3VxTnsw+zINP7mw07w2yJnZ7VU37j7hlaa
         oZiQl8ASZK1URo0CEGdMQ6m0SbkuOCOd3IHiE8RuD6IuDuG06ZSR9c/kkQXDGanMMr7K
         sR1tu+shEdGRRSYfAnV64uax/Hq72D6itqsy25mbZ+Ee1JGG9i8Vb9xjhcRLoes4wQEZ
         fzx5+gglXT1bCU7aGc9R9je9KiQgjStx2OKD+qhFCXv+hXw+iT7z7i0W2iTQ8APX7/7m
         BXIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782365814; x=1782970614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt5WwNy1VOYbQcp8vHFvNX0LBfHICQ9TFvh64zz3fVw=;
        b=NWsmXkhnIPl4RFeIslwutMYf/slU4umMzl2ZmMlGZRWAHc2p14Bkk8nsSrFaWjO543
         u+3KDyH2rup/DbA8cKnm8+r+PbXzV0/QdoIFqiHRv21jt5Gevh6ZldIUIvGjVDOatWy/
         bUSgjWl11XvB5m1quzGPbNh34pBHoPLcnxQB7qRVVfQuRL9mxBshxt14FSSXh2ATx3+F
         DuckyG/PwVOxCfpGjSzSVBngdW5xVaSBIhLmLEdnJapNWMYvKZNhUKF+212+SGjSc9lc
         INTK0bl1BIj/U76BIWLTdNT/NKUQ/Fuu04wXgBAopAXRkoJcGULqlE/t3VKz6NP7Hv7B
         MD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782365814; x=1782970614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kt5WwNy1VOYbQcp8vHFvNX0LBfHICQ9TFvh64zz3fVw=;
        b=SiNVPBV4p6vOncUDsP5AM1SlmJFK+nQTbgQYV2oTLW5DqJ1lrGPD82/7Jo9BhasAuA
         5MPtFYJC8nFN++HiZ56f/pyt+1zRW8CpRq7Tis8eP5zrMGZ0uzjoNd3lpcWG0c5qnCVE
         8LjA1LVlGudLUnJr6afPCzum7O76e3e/eEjzc4q9Nyt/Bdo0XWtYt6BPiaAGJ/zCExxl
         bZdEgAhFbmBw6+aDKxJk+0WbNLzVV7bS49XaJEKAdHeqtLSZKDTZg+M1Z60jTjS+oQTR
         8l4cvhTtaMUrC5Qv79wpowsesxJerokabZXDL39KYXpNFBXZi3F7M+tCyjRE1JEMUbjG
         4ecQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ihr0G6uSNZLuFImhAyt90smh5WX+tO43GjP4Hmn27tiNnpeXFMB4hMgOuE60w9c4WI6u812RoeQyF/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgjwFKk1tYkVIDz0/3uKS1LC7m5/InAmF/Whx7pWlcCcsv7frN
	PQJICiCtG+XSO0WyxhHv/WGPIKG+xL9JI1YncYkT0F/45LT8eMsIbO7ruWLictY415RqswEVX5l
	a0x5fIaH+Fgj7sJw0Yx+e1K/QemKvVmSbP6GbhWOaLbQAeDX83pVR6L+kffwjJ2eJIPdkUagPZi
	rGA0PDuFqvZSn5ViDh32QOIdxZ5daMqWnXqGbhg28=
X-Gm-Gg: AfdE7cmWJwMa9ozkV56hP/nLzXh9p11sCtpF1wS5mYJzTs659caTuM9HFDVrxBTQmfL
	j4iLuD/U8Zi4IrwwE5wTSsXsSt3iDJT/zQPMM/qA/YjQ6opWQpeMD4iykMOet+Bl/oqsZGEgDBG
	lnX71MEDw8F7O2xt5kTXHqiE9f8pZWj2yP5krlELnDncikVP+4pC0lpAQ4Qp+vDeio8ek=
X-Received: by 2002:a05:6830:d1c:b0:7e7:1ad:3bcc with SMTP id 46e09a7af769-7e99c24ef08mr1326637a34.16.1782365813818;
        Wed, 24 Jun 2026 22:36:53 -0700 (PDT)
X-Received: by 2002:a05:6830:d1c:b0:7e7:1ad:3bcc with SMTP id
 46e09a7af769-7e99c24ef08mr1326614a34.16.1782365813333; Wed, 24 Jun 2026
 22:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624033508.27391-1-hpa@redhat.com> <20260624033508.27391-4-hpa@redhat.com>
 <e74e992a-9358-40c5-a685-833a8f135dc0@linaro.org>
In-Reply-To: <e74e992a-9358-40c5-a685-833a8f135dc0@linaro.org>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 25 Jun 2026 01:36:41 -0400
X-Gm-Features: AVVi8CcMJhA3jGypsk1cHvD-17wj2Bbx2dHVUyeU3jlAH1mM_Tg9bo18bC4XSxY
Message-ID: <CAEth8oHme_wp6YBkghug8bfLjcNzK6zfmdSVYq3DOpnZdi1zbA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Serin Yeh <serin.yeh@intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Damjan Georgievski <gdamjan@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,siliconsignals.io,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65605-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BBC66C2CE9

Hi Vladimir,

Thank you for reviewing.

On Wed, Jun 24, 2026 at 6:12=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 6/24/26 06:35, Kate Hsuan wrote:
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
>
> Please find a few minor nitpicks below.
>
> > ---
> >   MAINTAINERS                |   6 +
> >   drivers/media/i2c/Kconfig  |  10 +
> >   drivers/media/i2c/Makefile |   1 +
> >   drivers/media/i2c/imx471.c | 971 ++++++++++++++++++++++++++++++++++++=
+
> >   4 files changed, 988 insertions(+)
> >   create mode 100644 drivers/media/i2c/imx471.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6b4560681b51..586958b1816d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25219,6 +25219,12 @@ T:   git git://linuxtv.org/media.git
> >   F:  Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> >   F:  drivers/media/i2c/imx415.c
> >
> > +SONY IMX471 SENSOR DRIVER
> > +M:   Kate Hsuan <hpa@redhat.com>
> > +L:   linux-media@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/media/i2c/imx471.c
> > +
> >   SONY MEMORYSTICK SUBSYSTEM
> >   M:  Maxim Levitsky <maximlevitsky@gmail.com>
> >   M:  Alex Dubov <oakad@yahoo.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 5d173e0ecf42..b7199f9f5a0c 100644
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
> >   config VIDEO_MAX9271_LIB
> >       tristate
> >
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index e45359efe0e4..acbd321fc12e 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
> >   obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
> >   obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
> >   obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> > +obj-$(CONFIG_VIDEO_IMX471) +=3D imx471.o
> >   obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
> >   obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
> >   obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > new file mode 100644
> > index 000000000000..1e1bff69ea3d
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -0,0 +1,971 @@
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
>
> No declarations coming from linux/unaligned.h header are used in the driv=
er.
>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
>
> No declarations coming from media/v4l-event.h header are used in the driv=
er,
> likely it's intended to include media/v4l2-subdev.h instead.
>
> > +#include <media/v4l2-event.h>
>
> No declarations coming from media/v4l-event.h header are used in the driv=
er.

I'll drop them.

>
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
>
> IMX471_HFLIP_BIT and IMX471_VFLIP_BIT macro do not have any users in the =
driver.
I'll drop them.

>
> > +
> > +/* Test Pattern Control */
> > +#define IMX471_REG_TEST_PATTERN                      CCI_REG8(0x0600)
> > +#define IMX471_TEST_PATTERN_DISABLED         0
> > +#define IMX471_TEST_PATTERN_SOLID_COLOR              1
> > +#define IMX471_TEST_PATTERN_COLOR_BARS               2
> > +#define IMX471_TEST_PATTERN_GRAY_COLOR_BARS  3
> > +#define IMX471_TEST_PATTERN_PN9                      4
>
> IMX471_TEST_PATTERN_* macro do not have any users in the driver.
I'll drop them.

>
> > +
> > +/* default link frequency and external clock */
> > +#define IMX471_LINK_FREQ_DEFAULT             200000000LL
> > +#define IMX471_EXT_CLK                               19200000
> > +#define IMX471_LINK_FREQ_INDEX                       0
>
> Please drop IMX471_LINK_FREQ_INDEX macro along with .link_freq_index from
> struct imx471_mode.
Okay

>
> --
> Best wishes,
> Vladimir
>


--=20
BR,
Kate


