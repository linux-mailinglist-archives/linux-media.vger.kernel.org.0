Return-Path: <linux-media+bounces-62844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aObXJOmIFmrznAcAu9opvQ
	(envelope-from <linux-media+bounces-62844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:02:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE785DFA5F
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FFE230379A2
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 06:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385D92D3EEB;
	Wed, 27 May 2026 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BCT5sw8+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rlNW0z2/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6FA288D0
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 06:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779861724; cv=pass; b=SgEjaiDOcFfs0hQbPi8eJVS9/CNyJ9mjAIuOSXZZ0k4eUZak0gOSdIF3ojmnMd1L1/ia6qR+eTfwP+w1ZdCouLHMItDT0dGh8+ueTPdKdXcxFTRIXXSIq1bMeNVdBfzhuU8aZS1Wpg13I2S8dUKTalskjOCI1utasxYrSVbFuYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779861724; c=relaxed/simple;
	bh=pLtH+0SPTFeLwW6Jrz14ljFDd0jPTY7LXuzbMAJEwkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkwkhR3ogicu7k7G85FjGP//6NDu872PZlQIpbwUCQzII5rnLnIfDkzQU26pJhJqxzwX9CBxB9rYCfyamfceplemyuTSkrbBT2GY60pgEWxIp3JSVkg1ErvpWOb7SGG+K7nwCVu8R78MF/cCbkCb28LFJxZXsr2tF1/Nc1wODQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BCT5sw8+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rlNW0z2/; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779861720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKfRRhprZ+p7rLtPg23XzMWbmiG2Z/euZBiZlkt2zy8=;
	b=BCT5sw8+egMSDOmC31UxVVw1wakTRrd9wuUF/AaLZ9Lou9FMXJJWyqYvtXCjgiRZmVmWDM
	siH1JVZkv10dMjJ2w709iY9+4MIxDqZxL17TLw5FTrL1VVSAbDx1me2oya21kuqW07We2s
	nl7cPVAhvjqsO0QXZpMmRxJim8gsLJ8=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-6I-os9KuNfmWyP1-oQ2nFA-1; Wed, 27 May 2026 02:01:56 -0400
X-MC-Unique: 6I-os9KuNfmWyP1-oQ2nFA-1
X-Mimecast-MFC-AGG-ID: 6I-os9KuNfmWyP1-oQ2nFA_1779861716
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-43a3e6ebe0cso22932416fac.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 23:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779861716; cv=none;
        d=google.com; s=arc-20240605;
        b=Pvy4L72Os0tqUpGLvHwMPOabkshKTzCz4C5/ugGluvbt4VoQyTS1Krkdl94EdGIIz0
         YB+UcmJPa6nMC61OsFeQ7gMVwvMHvJbjxkU2M2Y5BJ95MtCqlA15+A/j6q5GIV1ooHg0
         GafRhHMXQIvIwHFluaOdEtDLGvIv0UOgPXXpAKNFANJxL+rHupf1jANcndOdj2C34LVF
         XsZrJPObkbSOm/s0VJSqUCxUO1L9nL96pZyaLYia8DZV0VS81ie7jv6FFmT7kECBRrSs
         h7dbgB55xoFrP5bDrak4xa59oHUfRRKn0tFf2J/aeRqiFJmDU9zwITcBd9+NlOuZgOU1
         AL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RKfRRhprZ+p7rLtPg23XzMWbmiG2Z/euZBiZlkt2zy8=;
        fh=1I8Cu2Dzp8DFdsK7Wa4nvEv5EJ9zvfOHKxUTWvorgRk=;
        b=b8HnlsOrt9NOUo7eBFc0/VRyDjXTti/xao1SQvpUJUKCQVpPzhJATCXuiWB4TmAyrk
         jH2oHlDpf1N0myhuKKQbovvXdFCiFohXkGsFExiyl/QAL8TuILO25LUjTRTz18MS2ijN
         eFP689/9uAhAsWpDI5SOySFbb9hobhZdtq+0l6llcywZUgPv9iHk3k5J4RVybsqPw9St
         mQB+E301g2qA0rRTKpSYqdyuGNiAQzaCRh1Owvqs2gVuazmB1epG6vS91ckthPu261+Y
         a0xPygkYPtmkgughAJ5Fb2fcU/WArsSAIdgCuQ4nx9DBqSjIZoGCh5NO+o2LYZ4uIyIi
         RMDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779861716; x=1780466516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKfRRhprZ+p7rLtPg23XzMWbmiG2Z/euZBiZlkt2zy8=;
        b=rlNW0z2/Eya7DA1iSLzc9YoC5a3NORQVsW5BKxBp8AoEPZv+RcA9gNyzJSFTdq8yAO
         DAVn6XyzQp0V6Kyu3j/ZZqMvtG0AVY/TPOUEQ1Z6DOTv3/gGM/ytmayw0sucQf9W+Jy/
         ocD2P93Sxc4YyxJjByVtwuE18oPjaFev36btpY+RvQ/6QuTbKHJ/3RWHFwiMj8A/BFvl
         OhWwTSWf/ibvLZcS9y0wecBHv0zbRusah+kt7OLxg+JMSfps7yYq6TsbOj2RTQwJoy/i
         31ENFhRLIYIn/V1hB8eufehx6/uRMix2cGC6wpaRLtgiJF2iur+xf9icJQMHp1emThUE
         WmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861716; x=1780466516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RKfRRhprZ+p7rLtPg23XzMWbmiG2Z/euZBiZlkt2zy8=;
        b=gLF8vPisPfe9zQn4dX0Kkcs3OfvP3DrHzLXnabkprSDxi2EfDWJbwRg24a7bzUeCLf
         Xa5UJVM9jVaZc+XPOfh64r/a04HF8u3YKHaxnrSr4wqa9998tnG0K2Iy55SPaX/YJo98
         vqGt9c9hQpFCaZmOBXvMKNPUcAVTQxmwmAvcJLhruBqi+Xok2jtkn2vmV2Qjx17eomso
         NcC1tBWgCEG8lhpR5cslo4mNX93iDI2GK5H8RG5A603kCBD5wrRV3kQRUdSPrqhq/0iG
         0foO39aKSsB1yDyMmplgf54Cfm70FLX8hprRFZbZ+1BUx3Y5hxkJrD4bfyHvAwA9M2U9
         PMag==
X-Gm-Message-State: AOJu0YwOgZsY2x53dmwPIOzBgiaBVC4LyLDl48MsVNILYrDalXsP8NRk
	FC8wuPSwVMac061nMD8mMBUbdIAff3ooD3vSYW49E8VIRpgUpv/yw9PIp3w76a9F3N0XSky7LSA
	RfpWPg/ka/1AZfztUxucG2a+vVPITOXKbJpHINWiN+c/yO7lVb+S7uo80MQW0ZtqEGrhkeVAGCk
	yKTLSW9DDHAbitmwXJPIC15HEFnikrLbQQDJKp8Ow=
X-Gm-Gg: Acq92OE56jNxVu6vEy8bnxkBg5+qOJrYlA6dcqCpsr2LaJV8kwgrWCAwWrMe3ix7+uG
	FxNdCoZDsYjECvGP4N+qn0trUJHv5VwS8WZXXPkCAA5/3Y3IFc7PJbjlrBA/hOnCh00VNffd0U9
	95p2n76FhCCVRlGB7I8HYDbWpNaTqBhgbCqGQr9EXCkAEym7qmUyDQyJAsdDEf0sRy2a+vERgd5
	fOw
X-Received: by 2002:a05:6870:7123:b0:430:2495:5ec5 with SMTP id 586e51a60fabf-43b5ae22cf7mr12772912fac.32.1779861715493;
        Tue, 26 May 2026 23:01:55 -0700 (PDT)
X-Received: by 2002:a05:6870:7123:b0:430:2495:5ec5 with SMTP id
 586e51a60fabf-43b5ae22cf7mr12772887fac.32.1779861714611; Tue, 26 May 2026
 23:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522031121.11968-1-hpa@redhat.com> <20260522031121.11968-3-hpa@redhat.com>
 <PN3P287MB182919EBD2C36CBBC0A8D8598B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB182919EBD2C36CBBC0A8D8598B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 27 May 2026 14:01:43 +0800
X-Gm-Features: AVHnY4IdUJ3PzS5_vW5Ztzv44FuUJFfzEtCfTdF4fxIjVFJPcOekyxvycCmoG68
Message-ID: <CAEth8oGGOE12iBdQyxtkH_6c0ZCrgwpNi27vuH25VkUb8dvEfg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Serin Yeh <serin.yeh@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-62844-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: DBE785DFA5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tarang,

Thank you for reviewing.

On Fri, May 22, 2026 at 7:13=E2=80=AFPM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Kate,
>
> I noticed a few issues. Please check the comments below.
>
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c
> >
> > This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a p=
art
> > of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 lapto=
ps.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  MAINTAINERS                |    6 +
> >  drivers/media/i2c/Kconfig  |   10 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/imx471.c | 1006 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1023 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx471.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1126fdd639ad..d597337e7c24 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24735,6 +24735,12 @@ T:     git git://linuxtv.org/media.git
> >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> >  F:     drivers/media/i2c/imx415.c
> >
> > +SONY IMX471 SENSOR DRIVER
> > +M:     Kate Hsuan <hpa@redhat.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +F:     drivers/media/i2c/imx471.c
> > +
> >  SONY MEMORYSTICK SUBSYSTEM
> >  M:     Maxim Levitsky <maximlevitsky@gmail.com>
> >  M:     Alex Dubov <oakad@yahoo.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 5eb1e0e0a87a..1c28c498a9f1 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -287,6 +287,16 @@ config VIDEO_IMX415
> >         To compile this driver as a module, choose M here: the
> >         module will be called imx415.
> >
> > +config VIDEO_IMX471
> > +               tristate "Sony IMX471 sensor support"
> > +               select V4L2_CCI_I2C
> > +               help
> > +                 This is a Video4Linux2 sensor driver for the Sony
> > +                 IMX471 camera.
> > +
> > +                 To compile this driver as a module, choose M here: th=
e
> > +                 module will be called imx471.
> > +
>
> The indentation is wrong here. Please fix it.
Okay.



>
> >  config VIDEO_MAX9271_LIB
> >       tristate
> >
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index a3a6396df3c4..0539e9171030 100644
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
> > index 000000000000..f3c7fdce2d50
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -0,0 +1,1006 @@
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
> > +#define IMX471_REG_MODE_SELECT                 CCI_REG8(0x0100)
> > +#define IMX471_MODE_STANDBY                    0x00
> > +#define IMX471_MODE_STREAMING                  0x01
> > +
> > +/* Chip ID */
> > +#define IMX471_REG_CHIP_ID                     CCI_REG16(0x0016)
> > +#define IMX471_CHIP_ID                         0x0471
> > +
> > +/* V_TIMING internal */
> > +#define IMX471_REG_FLL                         CCI_REG16(0x0340)
> > +#define IMX471_FLL_MAX                         0xffff
> > +
> > +/* Exposure control */
> > +#define IMX471_REG_EXPOSURE                    CCI_REG16(0x0202)
> > +#define IMX471_EXPOSURE_MIN                    1
> > +#define IMX471_EXPOSURE_STEP                   1
> > +#define IMX471_EXPOSURE_DEFAULT                        0x04f6
>
> Better to use a decimal value here.
As Sakari mentioned, I'll try to find the max exposure in decimal.
It shoule be 1290.

>
> > +
> > +/*
> > + *  the digital control register for all color control looks like:
> > + *  +-----------------+------------------+
> > + *  |      [7:0]      |       [15:8]     |
> > + *  +-----------------+------------------+
> > + *  |    0x020f      |       0x020e     |
> > + *  --------------------------------------
> > + *  it is used to calculate the digital gain times value(integral + fr=
actional)
> > + *  the [15:8] bits is the fractional part and [7:0] bits is the integ=
ral
> > + *  calculation equation is:
> > + *      gain value (unit: times) =3D REG[15:8] + REG[7:0]/0x100
> > + *  Only value in 0x0100 ~ 0x0FFF range is allowed.
> > + *  Analog gain use 10 bits in the registers and allowed range is 0 ~ =
960
> > + */
> > +/* Analog gain control */
> > +#define IMX471_REG_ANALOG_GAIN                 CCI_REG16(0x0204)
> > +#define IMX471_ANA_GAIN_MIN                    0
> > +#define IMX471_ANA_GAIN_MAX                    960
> > +#define IMX471_ANA_GAIN_STEP                   1
> > +#define IMX471_ANA_GAIN_DEFAULT                        0
> > +
> > +/* Digital gain control */
> > +#define IMX471_REG_DPGA_USE_GLOBAL_GAIN                CCI_REG16(0x3ff=
9)
> > +#define IMX471_REG_DIG_GAIN_GLOBAL             CCI_REG16(0x020e)
> > +#define IMX471_DGTL_GAIN_MIN                   256
> > +#define IMX471_DGTL_GAIN_MAX                   4095
> > +#define IMX471_DGTL_GAIN_STEP                  1
> > +#define IMX471_DGTL_GAIN_DEFAULT               256
> > +
> > +#define IMX471_VALUE_08BIT                     1
>
> Unused macro, please remove it.
ok

>
> > +
> > +/* HFLIP and VFLIP control */
> > +#define IMX471_REG_ORIENTATION                 CCI_REG8(0x0101)
> > +#define IMX471_HFLIP_BIT                       BIT(0)
> > +#define IMX471_VFLIP_BIT                       BIT(1)
> > +
> > +/* Default exposure margin */
> > +#define IMX471_EXPOSURE_MARGIN                 18
>
> Please move this macro to the exposure block above.
ok

>
> > +
> > +/* Horizontal crop window offset */
> > +#define IMX471_REG_H_WIN_OFFSET                        CCI_REG8(0x0409=
)
> > +
> > +/* Vertical crop window offset */
> > +#define IMX471_REG_V_WIN_OFFSET                        CCI_REG8(0x034b=
)
> > +
> > +/* Test Pattern Control */
> > +#define IMX471_REG_TEST_PATTERN                        CCI_REG8(0x0600=
)
> > +#define IMX471_TEST_PATTERN_DISABLED           0
> > +#define IMX471_TEST_PATTERN_SOLID_COLOR                1
> > +#define IMX471_TEST_PATTERN_COLOR_BARS         2
> > +#define IMX471_TEST_PATTERN_GRAY_COLOR_BARS    3
> > +#define IMX471_TEST_PATTERN_PN9                        4
> > +
> > +/* default link frequency and external clock */
> > +#define IMX471_LINK_FREQ_DEFAULT               200000000LL
> > +#define IMX471_EXT_CLK                         19200000
> > +#define IMX471_LINK_FREQ_INDEX                 0
> > +
> > +/* IMX471 native and active pixel array size */
> > +#define IMX471_NATIVE_WIDTH                    4672
> > +#define IMX471_NATIVE_HEIGHT                   3512
> > +#define IMX471_PIXEL_ARRAY_LEFT                        8
> > +#define IMX471_PIXEL_ARRAY_TOP                 8
> > +#define IMX471_PIXEL_ARRAY_WIDTH               4656
> > +#define IMX471_PIXEL_ARRAY_HEIGHT              3496
> > +
> > +#define to_imx471(_sd) container_of_const(_sd, struct imx471, sd)
> > +
> > +static const char * const imx471_supply_name[] =3D {
> > +       "avdd",
> > +};
> > +
> > +#define IMX471_NUM_SUPPLIES                    ARRAY_SIZE(imx471_suppl=
y_name)
> > +
> > +/* Mode : resolution and related config&values */
> > +struct imx471_mode {
> > +       /* Frame width */
> > +       u32 width;
> > +       /* Frame height */
> > +       u32 height;
> > +
> > +       /* V-timing */
> > +       u32 fll_def;
> > +       u32 fll_min;
> > +
> > +       /* H-timing */
> > +       u32 llp;
> > +
> > +       /* index of link frequency */
> > +       u32 link_freq_index;
> > +
> > +       /* Default register values */
> > +       const struct cci_reg_sequence *default_mode_regs;
> > +       const int default_mode_regs_length;
> > +};
> > +
> > +struct imx471 {
> > +       struct v4l2_subdev sd;
> > +       struct media_pad pad;
> > +
> > +       struct v4l2_ctrl_handler ctrl_handler;
> > +       /* V4L2 Controls */
> > +       struct v4l2_ctrl *link_freq;
> > +       struct v4l2_ctrl *pixel_rate;
> > +       struct v4l2_ctrl *vblank;
> > +       struct v4l2_ctrl *hblank;
> > +       struct v4l2_ctrl *vflip;
> > +       struct v4l2_ctrl *hflip;
> > +       struct v4l2_ctrl *exposure;
> > +
> > +       struct gpio_desc *reset_gpio;
> > +       struct regulator_bulk_data supplies[IMX471_NUM_SUPPLIES];
> > +       struct clk *img_clk;
> > +
> > +       struct device *dev;
> > +       struct regmap *regmap;
> > +};
> > +
> > +static const struct cci_reg_sequence imx471_global_regs[] =3D {
> > +       { CCI_REG8(0x0136), 0x13 },
> > +       { CCI_REG8(0x0137), 0x33 },
> > +       { CCI_REG8(0x3c7e), 0x08 },
> > +       { CCI_REG8(0x3c7f), 0x05 },
> > +       { CCI_REG8(0x3e35), 0x00 },
> > +       { CCI_REG8(0x3e36), 0x00 },
> > +       { CCI_REG8(0x3e37), 0x00 },
> > +       { CCI_REG8(0x3f7f), 0x01 },
> > +       { CCI_REG8(0x4431), 0x04 },
> > +       { CCI_REG8(0x531c), 0x01 },
> > +       { CCI_REG8(0x531d), 0x02 },
> > +       { CCI_REG8(0x531e), 0x04 },
> > +       { CCI_REG8(0x5928), 0x00 },
> > +       { CCI_REG8(0x5929), 0x2f },
> > +       { CCI_REG8(0x592a), 0x00 },
> > +       { CCI_REG8(0x592b), 0x85 },
> > +       { CCI_REG8(0x592c), 0x00 },
> > +       { CCI_REG8(0x592d), 0x32 },
> > +       { CCI_REG8(0x592e), 0x00 },
> > +       { CCI_REG8(0x592f), 0x88 },
> > +       { CCI_REG8(0x5930), 0x00 },
> > +       { CCI_REG8(0x5931), 0x3d },
> > +       { CCI_REG8(0x5932), 0x00 },
> > +       { CCI_REG8(0x5933), 0x93 },
> > +       { CCI_REG8(0x5938), 0x00 },
> > +       { CCI_REG8(0x5939), 0x24 },
> > +       { CCI_REG8(0x593a), 0x00 },
> > +       { CCI_REG8(0x593b), 0x7a },
> > +       { CCI_REG8(0x593c), 0x00 },
> > +       { CCI_REG8(0x593d), 0x24 },
> > +       { CCI_REG8(0x593e), 0x00 },
> > +       { CCI_REG8(0x593f), 0x7a },
> > +       { CCI_REG8(0x5940), 0x00 },
> > +       { CCI_REG8(0x5941), 0x2f },
> > +       { CCI_REG8(0x5942), 0x00 },
> > +       { CCI_REG8(0x5943), 0x85 },
> > +       { CCI_REG8(0x5f0e), 0x6e },
> > +       { CCI_REG8(0x5f11), 0xc6 },
> > +       { CCI_REG8(0x5f17), 0x5e },
> > +       { CCI_REG8(0x7990), 0x01 },
> > +       { CCI_REG8(0x7993), 0x5d },
> > +       { CCI_REG8(0x7994), 0x5d },
> > +       { CCI_REG8(0x7995), 0xa1 },
> > +       { CCI_REG8(0x799a), 0x01 },
> > +       { CCI_REG8(0x799d), 0x00 },
> > +       { CCI_REG8(0x8169), 0x01 },
> > +       { CCI_REG8(0x8359), 0x01 },
> > +       { CCI_REG8(0x9302), 0x1e },
> > +       { CCI_REG8(0x9306), 0x1f },
> > +       { CCI_REG8(0x930a), 0x26 },
> > +       { CCI_REG8(0x930e), 0x23 },
> > +       { CCI_REG8(0x9312), 0x23 },
> > +       { CCI_REG8(0x9316), 0x2c },
> > +       { CCI_REG8(0x9317), 0x19 },
> > +       { CCI_REG8(0xb046), 0x01 },
> > +       { CCI_REG8(0xb048), 0x01 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_1928x1088_regs[] =3D {
> > +       { CCI_REG8(0x0101), 0x00 },
> > +       { CCI_REG8(0x0112), 0x0a },
> > +       { CCI_REG8(0x0113), 0x0a },
> > +       { CCI_REG8(0x0114), 0x03 },
> > +       { CCI_REG8(0x0342), 0x0a },
> > +       { CCI_REG8(0x0343), 0x00 },
> > +       { CCI_REG8(0x0340), 0x13 },
> > +       { CCI_REG8(0x0341), 0xb0 },
>
> These are V-timing settings. You can drop them since they are already
> being set from the control handler.
>
> > +       { CCI_REG8(0x0344), 0x00 },
> > +       { CCI_REG8(0x0345), 0x00 },
> > +       { CCI_REG8(0x0346), 0x01 },
> > +       { CCI_REG8(0x0347), 0xbc },
> > +       { CCI_REG8(0x0348), 0x12 },
> > +       { CCI_REG8(0x0349), 0x2f },
> > +       { CCI_REG8(0x034a), 0x0b },
> > +       { CCI_REG8(0x034b), 0xeb },
> > +       { CCI_REG8(0x0381), 0x01 },
> > +       { CCI_REG8(0x0383), 0x01 },
> > +       { CCI_REG8(0x0385), 0x01 },
> > +       { CCI_REG8(0x0387), 0x01 },
> > +       { CCI_REG8(0x0900), 0x01 },
> > +       { CCI_REG8(0x0901), 0x22 },
> > +       { CCI_REG8(0x0902), 0x08 },
> > +       { CCI_REG8(0x3f4c), 0x81 },
> > +       { CCI_REG8(0x3f4d), 0x81 },
> > +       { CCI_REG8(0x0408), 0x00 },
> > +       { CCI_REG8(0x0409), 0xc8 },
> > +       { CCI_REG8(0x040a), 0x00 },
> > +       { CCI_REG8(0x040b), 0x6c },
> > +       { CCI_REG8(0x040c), 0x07 },
> > +       { CCI_REG8(0x040d), 0x88 },
> > +       { CCI_REG8(0x040e), 0x04 },
> > +       { CCI_REG8(0x040f), 0x40 },
> > +       { CCI_REG8(0x034c), 0x07 },
> > +       { CCI_REG8(0x034d), 0x88 },
> > +       { CCI_REG8(0x034e), 0x04 },
> > +       { CCI_REG8(0x034f), 0x40 },
> > +       { CCI_REG8(0x0301), 0x06 },
> > +       { CCI_REG8(0x0303), 0x02 },
> > +       { CCI_REG8(0x0305), 0x02 },
> > +       { CCI_REG8(0x0306), 0x00 },
> > +       { CCI_REG8(0x0307), 0x79 },
> > +       { CCI_REG8(0x030b), 0x01 },
> > +       { CCI_REG8(0x030d), 0x02 },
> > +       { CCI_REG8(0x030e), 0x00 },
> > +       { CCI_REG8(0x030f), 0x53 },
> > +       { CCI_REG8(0x0310), 0x01 },
> > +       { CCI_REG8(0x0202), 0x13 },
> > +       { CCI_REG8(0x0203), 0x9e },
>
> Similarly, these are exposure settings. You can drop.
>
> > +       { CCI_REG8(0x0204), 0x00 },
> > +       { CCI_REG8(0x0205), 0x00 },
>
> These are digital gain settings. You can drop.
>
> > +       { CCI_REG8(0x020e), 0x01 },
> > +       { CCI_REG8(0x020f), 0x00 },
>
> These are analog gain settings. You can drop.
Okay. I'll drop them.

>
> > +       { CCI_REG8(0x3f78), 0x01 },
> > +       { CCI_REG8(0x3f79), 0x31 },
> > +       { CCI_REG8(0x3ffe), 0x00 },
> > +       { CCI_REG8(0x3fff), 0x8a },
> > +       { CCI_REG8(0x5f0a), 0xb6 },
> > +};
> > +
> > +static const char * const imx471_test_pattern_menu[] =3D {
> > +       "Disabled",
> > +       "Solid Colour",
> > +       "Eight Vertical Colour Bars",
> > +       "Colour Bars With Fade to Grey",
> > +       "Pseudorandom Sequence (PN9)",
> > +};
> > +
> > +/*
> > + * When adding more than the one below, make sure the disallowed ones =
will
> > + * actually be disabled in the LINK_FREQ control.
> > + */
> > +static const s64 link_freq_menu_items[] =3D {
> > +       IMX471_LINK_FREQ_DEFAULT,
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
> > +       MEDIA_BUS_FMT_SRGGB10_1X10,
> > +       MEDIA_BUS_FMT_SGRBG10_1X10,
> > +       MEDIA_BUS_FMT_SGBRG10_1X10,
> > +       MEDIA_BUS_FMT_SBGGR10_1X10,
> > +};
> > +
> > +/* Mode configs */
> > +static const struct imx471_mode imx471_modes[] =3D {
> > +       {
> > +               .width =3D 1928,
> > +               .height =3D 1088,
> > +               .fll_def =3D 1308,
> > +               .fll_min =3D 1308,
> > +               .llp =3D 2328,
> > +               .link_freq_index =3D IMX471_LINK_FREQ_INDEX,
> > +               .default_mode_regs =3D mode_1928x1088_regs,
> > +               .default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088=
_regs),
> > +       },
> > +};
> > +
> > +static int imx471_get_regulators(struct device *dev, struct imx471 *se=
nsor)
> > +{
> > +       for (unsigned int  i =3D 0; i < IMX471_NUM_SUPPLIES; i++)
> > +               sensor->supplies[i].supply =3D imx471_supply_name[i];
> > +
> > +       return devm_regulator_bulk_get(dev, IMX471_NUM_SUPPLIES,
> > +                                      sensor->supplies);
> > +}
> > +
> > +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct imx471 *sensor =3D container_of(ctrl->handler,
> > +                                                 struct imx471,
> > +                                                 ctrl_handler);
>
> Use container_of_const.
OK
>
> > +       struct v4l2_subdev_state *state =3D
> > +                       v4l2_subdev_get_locked_active_state(&sensor->sd=
);
> > +       const struct v4l2_mbus_framefmt *format =3D
> > +                       v4l2_subdev_state_get_format(state, 0);
> > +       s64 exposure_max;
> > +       int ret;
>
> ret =3D 0;
See below.
>
> > +
> > +       /* Propagate change of current control to all related controls =
*/
> > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               /* Update max exposure while meeting expected vblanking=
 */
> > +               exposure_max =3D
> > +                       format->height + ctrl->val - IMX471_EXPOSURE_MA=
RGIN;
> > +               __v4l2_ctrl_modify_range(sensor->exposure,
> > +                                        sensor->exposure->minimum,
> > +                                        exposure_max,
> > +                                        sensor->exposure->step,
> > +                                        exposure_max);
>
> This control operation can fail. Please check the return value.
>
> > +       }
> > +
> > +       /* V4L2 controls values will be applied only when power is alre=
ady up */
> > +       if (!pm_runtime_get_if_in_use(sensor->dev))
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN,
> > +                         ctrl->val, &ret);
This will be
ret =3D cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN, ctrl->val, NULL);
>
> You are using ret for the first time here, Please initialize ret with 0 w=
hen
> declaring it.
>
> cci_write() uses the value pointed by &ret to determine whether a previou=
s
> error has already occurred, and an uninitialized ret may contain a garbag=
e
> value, causing the write operation to fail unexpectedly.
I noticed this thank you :)
>
> > +               break;
> > +       case V4L2_CID_DIGITAL_GAIN:
> > +               cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_GLOBAL,
> > +                         ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_EXPOSURE:
> > +               cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> > +                         ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_VBLANK:
> > +               /* Update FLL that meets expected vertical blanking */
> > +               cci_write(sensor->regmap, IMX471_REG_FLL,
> > +                         format->height + ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_TEST_PATTERN:
> > +               cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN,
> > +                         ctrl->val, &ret);
> > +               break;
> > +       case V4L2_CID_HFLIP:
> > +       case V4L2_CID_VFLIP:
> > +               cci_write(sensor->regmap, IMX471_REG_ORIENTATION,
> > +                         sensor->hflip->val | sensor->vflip->val << 1,=
 &ret);
> > +               break;
> > +       default:
> > +               ret =3D -EINVAL;
> > +               dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not ha=
ndled",
> > +                        ctrl->id, ctrl->val);
> > +               break;
> > +       }
> > +
> > +       pm_runtime_put(sensor->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops imx471_ctrl_ops =3D {
> > +       .s_ctrl =3D imx471_set_ctrl,
> > +};
> > +
> > +static u32 imx471_get_format_code(struct imx471 *sensor)
> > +{
> > +       unsigned int i;
> > +
> > +       i =3D (sensor->vflip->val ? 2 : 0) | (sensor->hflip->val ? 1 : =
0);
> > +
> > +       return imx471_hv_flips_bayer_order[i];
> > +}
> > +
> > +static int imx471_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_mbus_code_enum *cod=
e)
> > +{
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +
> > +       if (code->index >=3D (ARRAY_SIZE(imx471_hv_flips_bayer_order) /=
 4))
> > +               return -EINVAL;
> > +
> > +       code->code =3D imx471_get_format_code(sensor);
> > +
> > +       return 0;
> > +}
>
> Please add one extra blank line after this line.
OK

>
> > +static int imx471_enum_frame_size(struct v4l2_subdev *sd,
> > +                                 struct v4l2_subdev_state *sd_state,
> > +                                 struct v4l2_subdev_frame_size_enum *f=
se)
> > +{
> > +       if (fse->index >=3D ARRAY_SIZE(imx471_modes))
> > +               return -EINVAL;
> > +
> > +       fse->min_width =3D imx471_modes[fse->index].width;
> > +       fse->max_width =3D fse->min_width;
> > +       fse->min_height =3D imx471_modes[fse->index].height;
> > +       fse->max_height =3D fse->min_height;
> > +
> > +       return 0;
> > +}
> > +
> > +static void imx471_update_pad_format(struct imx471 *sensor,
> > +                                    const struct imx471_mode *mode,
> > +                                    struct v4l2_subdev_format *fmt)
> > +{
> > +       fmt->format.code =3D imx471_get_format_code(sensor);
> > +       fmt->format.width =3D mode->width;
> > +       fmt->format.height =3D mode->height;
> > +       fmt->format.field =3D V4L2_FIELD_NONE;
> > +}
> > +
> > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_format *fmt)
> > +{
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +       const struct imx471_mode *mode;
> > +       int h_blank;
> > +       u64 pixel_rate;
> > +
> > +       mode =3D v4l2_find_nearest_size(imx471_modes,
> > +                                     ARRAY_SIZE(imx471_modes),
> > +                                     width, height,
> > +                                     fmt->format.width, fmt->format.he=
ight);
> > +
> > +       imx471_update_pad_format(sensor, mode, fmt);
> > +
> > +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->form=
at;
> > +
> > +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +               return 0;
> > +
> > +       if (media_entity_is_streaming(&sensor->sd.entity))
> > +               return -EBUSY;
> > +
> > +       pixel_rate =3D IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> > +       div_u64(pixel_rate, 10);
>
> You need to store the return value, as the above operation does not updat=
e
> pixel_rate.
>
> Please use:
> pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
Got it.

>
> > +       __v4l2_ctrl_modify_range(sensor->pixel_rate,
> > +                                V4L2_CID_PIXEL_RATE,
> > +                                pixel_rate, 1, pixel_rate);
> > +
> > +       __v4l2_ctrl_modify_range(sensor->vblank,
> > +                                mode->fll_min - mode->height,
> > +                                IMX471_FLL_MAX - mode->height,
> > +                                1,
> > +                                mode->fll_def - mode->height);
> > +
> > +       h_blank =3D mode->llp - mode->width;
> > +       /*
> > +        * Currently hblank is not changeable.
> > +        * So FPS control is done only by vblank.
> > +        */
> > +       __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > +                                h_blank, 1, h_blank);
>
> All the above control operations can fail. Please add proper error checks=
 for them.
okay.
>
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx471_get_selection(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_selection *sel)
> > +{
> > +       switch (sel->target) {
> > +       case V4L2_SEL_TGT_CROP:
> > +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel->p=
ad);
> > +               break;
> > +
> > +       case V4L2_SEL_TGT_NATIVE_SIZE:
> > +               sel->r.top =3D 0;
> > +               sel->r.left =3D 0;
> > +               sel->r.width =3D IMX471_NATIVE_WIDTH;
> > +               sel->r.height =3D IMX471_NATIVE_HEIGHT;
> > +               return 0;
> > +
> > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > +               sel->r.top =3D IMX471_PIXEL_ARRAY_TOP;
> > +               sel->r.left =3D IMX471_PIXEL_ARRAY_LEFT;
> > +               sel->r.width =3D IMX471_PIXEL_ARRAY_WIDTH;
> > +               sel->r.height =3D IMX471_PIXEL_ARRAY_HEIGHT;
> > +               return 0;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static int imx471_init_state(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *sd_state)
> > +{
> > +       struct v4l2_subdev_format fmt =3D {
> > +               .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > +               .format =3D {
> > +                       .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > +                       .width =3D imx471_modes[0].width,
> > +                       .height =3D imx471_modes[0].height,
> > +               },
> > +       };
> > +
> > +       imx471_set_pad_format(sd, sd_state, &fmt);
> > +
> > +       return 0;
>
> imx471_set_pad_format() can fail.
>
> Please use:
> return imx471_set_pad_format(sd, sd_state, &fmt);
Okay

>
> > +}
> > +
> > +static int imx471_identify_module(struct imx471 *sensor)
> > +{
> > +       int ret;
> > +       u64 val;
> > +
> > +       ret =3D cci_read(sensor->regmap, IMX471_REG_CHIP_ID, &val, NULL=
);
> > +       if (ret)
> > +               return dev_err_probe(sensor->dev, ret,
> > +                                    "failed to read chip id\n");
> > +
> > +       if (val !=3D IMX471_CHIP_ID)
> > +               return dev_err_probe(sensor->dev, -EIO,
> > +                                    "chip id mismatch: %x!=3D%llx\n",
> > +                                    IMX471_CHIP_ID, val);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx471_power_off(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +
> > +       clk_disable_unprepare(sensor->img_clk);
> > +       gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> > +
> > +       regulator_bulk_disable(IMX471_NUM_SUPPLIES, sensor->supplies);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx471_power_on(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +       int ret;
> > +
> > +       ret =3D regulator_bulk_enable(IMX471_NUM_SUPPLIES, sensor->supp=
lies);
> > +       if (ret < 0) {
> > +               dev_err(dev, "failed to enable regulators: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       ret =3D clk_prepare_enable(sensor->img_clk);
> > +       if (ret < 0) {
> > +               regulator_bulk_disable(IMX471_NUM_SUPPLIES, sensor->sup=
plies);
> > +               dev_err(dev, "failed to enable imaging clock: %d", ret)=
;
> > +               return ret;
> > +       }
> > +
> > +       gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> > +
> > +       usleep_range(10000, 15000);
> > +
> > +       return 0;
> > +}
> > +
> > +/* Start streaming */
> > +static int imx471_enable_stream(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *state,
> > +                               u32 pad, u64 streams_mask)
> > +{
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +       const struct imx471_mode *mode;
> > +       struct v4l2_mbus_framefmt *fmt;
> > +       int ret;
> > +
> > +       ret =3D pm_runtime_resume_and_get(sensor->dev);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       ret =3D imx471_identify_module(sensor);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Global Setting */
> > +       cci_multi_reg_write(sensor->regmap, imx471_global_regs,
> > +                           ARRAY_SIZE(imx471_global_regs), &ret);
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to set global settings");
> > +               goto error_powerdown;
> > +       }
> > +
> > +       state =3D v4l2_subdev_get_locked_active_state(&sensor->sd);
> > +       fmt =3D v4l2_subdev_state_get_format(state, 0);
> > +       mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471=
_modes),
> > +                                     width, height, fmt->width, fmt->h=
eight);
> > +
> > +       /* Apply default values of current mode */
> > +       cci_multi_reg_write(sensor->regmap, mode->default_mode_regs,
> > +                           mode->default_mode_regs_length, &ret);
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to set mode");
> > +               goto error_powerdown;
> > +       }
> > +
> > +       /* set digital gain control to all color mode */
> > +       cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN, 1, &=
ret);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       /* Apply customized values from user */
> > +       ret =3D  __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +                 IMX471_MODE_STREAMING, &ret);
> > +       if (ret)
> > +               goto error_powerdown;
> > +
> > +       __v4l2_ctrl_grab(sensor->vflip, true);
> > +       __v4l2_ctrl_grab(sensor->hflip, true);
> > +
> > +       return ret;
> > +
> > +error_powerdown:
> > +       pm_runtime_put(sensor->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +/* Stop streaming */
> > +static int imx471_disable_stream(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *state,
> > +                                u32 pad, u64 streams_mask)
> > +{
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +       int ret;
> > +
> > +       cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +                 IMX471_MODE_STANDBY, &ret);
>
> If you use ret for the cci_write() error path, it must be initialized.
>
> Here, you can directly get the error by using:
> ret =3D cci_write(sensor->regmap, IMX471_REG_MODE_SELECT, IMX471_MODE_STA=
NDBY, NULL);
I'll correct this.

>
> > +       pm_runtime_put(sensor->dev);
> > +
> > +       if (ret)
> > +               dev_err(sensor->dev,
> > +                       "failed to disable stream with return value: %d=
\n",
> > +                       ret);
> > +       __v4l2_ctrl_grab(sensor->vflip, false);
> > +       __v4l2_ctrl_grab(sensor->hflip, false);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops imx471_subdev_core_ops =3D {
> > +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > +};
>
> Drop this
>
> See: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.me=
rciai@gmail.com/
Okay

>
> > +
> > +static const struct v4l2_subdev_video_ops imx471_video_ops =3D {
> > +       .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops imx471_pad_ops =3D {
> > +       .enum_mbus_code =3D imx471_enum_mbus_code,
> > +       .get_fmt =3D v4l2_subdev_get_fmt,
> > +       .set_fmt =3D imx471_set_pad_format,
> > +       .get_selection =3D imx471_get_selection,
> > +       .enum_frame_size =3D imx471_enum_frame_size,
> > +       .enable_streams =3D imx471_enable_stream,
> > +       .disable_streams =3D imx471_disable_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_ops imx471_subdev_ops =3D {
> > +       .core =3D &imx471_subdev_core_ops,
> > +       .video =3D &imx471_video_ops,
> > +       .pad =3D &imx471_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops imx471_internal_ops =3D {
> > +       .init_state =3D imx471_init_state,
> > +};
> > +
> > +/* Initialize control handlers */
> > +static int imx471_init_controls(struct imx471 *sensor)
> > +{
> > +       const struct imx471_mode *mode =3D &imx471_modes[0];
> > +       struct v4l2_ctrl_handler *ctrl_hdlr;
> > +       struct v4l2_fwnode_device_properties props;
> > +       s64 exposure_max, hblank;
> > +       u64 pixel_rate;
> > +       int ret;
> > +
> > +       ctrl_hdlr =3D &sensor->ctrl_handler;
> > +       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > +       if (ret)
> > +               return ret;
>
> You can skip this error check.
>
> Also, there are 12 controls here, 10 controls + 2 orientation controls.

ok

>
> > +
> > +       ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to parse fwnode: %d", ret)=
;
> > +               return ret;
> > +       }
> > +
> > +       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &p=
rops);
> > +
> > +       sensor->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > +                                                  &imx471_ctrl_ops,
> > +                                                  V4L2_CID_LINK_FREQ,
> > +                                                  ARRAY_SIZE(link_freq=
_menu_items) - 1,
> > +                                                  0,
> > +                                                  link_freq_menu_items=
);
> > +       if (sensor->link_freq)
> > +               sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +       /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample=
 */
> > +       pixel_rate =3D IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> > +       div_u64(pixel_rate, 10);
>
> As I mentioned above, please store the return value of div_u64():
>
> pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
I'll fix them.
>
> > +       /* By default, PIXEL_RATE is read only */
> > +       sensor->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctr=
l_ops,
> > +                                              V4L2_CID_PIXEL_RATE, pix=
el_rate,
> > +                                              pixel_rate, 1, pixel_rat=
e);
> > +
> > +       /* Initial vblank/hblank/exposure parameters based on current m=
ode */
> > +       sensor->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > +                                          &imx471_ctrl_ops,
> > +                                          V4L2_CID_VBLANK,
> > +                                          mode->fll_min - mode->height=
,
> > +                                          IMX471_FLL_MAX - mode->heigh=
t,
> > +                                          1,
> > +                                          mode->fll_def - mode->height=
);
> > +
> > +       hblank =3D mode->llp - mode->width;
> > +       sensor->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_op=
s,
> > +                                          V4L2_CID_HBLANK, hblank, hbl=
ank,
> > +                                          1, hblank);
> > +       if (sensor->hblank)
> > +               sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +       /* fll >=3D exposure time + adjust parameter (default value is =
18) */
> > +       exposure_max =3D mode->fll_def - IMX471_EXPOSURE_MARGIN;
> > +       sensor->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_=
ops,
> > +                                            V4L2_CID_EXPOSURE,
> > +                                            IMX471_EXPOSURE_MIN, expos=
ure_max,
> > +                                            IMX471_EXPOSURE_STEP,
> > +                                            IMX471_EXPOSURE_DEFAULT);
> > +
> > +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGU=
E_GAIN,
> > +                         IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
> > +                         IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT=
);
> > +
> > +       /* Digital gain */
> > +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL=
_GAIN,
> > +                         IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
> > +                         IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAU=
LT);
> > +
> > +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                    V4L2_CID_TEST_PATTERN,
> > +                                    ARRAY_SIZE(imx471_test_pattern_men=
u) - 1,
> > +                                    0, 0, imx471_test_pattern_menu);
> > +
> > +       /* HFLIP & VFLIP */
>
> I can see many comments in your code that are not very important.
> You can remove them if you want, it's up to you.
Sure.

>
> > +       sensor->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops=
,
> > +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +
> > +       sensor->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops=
,
> > +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +       if (ctrl_hdlr->error) {
> > +               dev_err(sensor->dev, "%s control init failed: %d",
> > +                       __func__, ctrl_hdlr->error);
> > +               goto error;
> > +       }
> > +
> > +       sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +       sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +       sensor->sd.ctrl_handler =3D ctrl_hdlr;
> > +
> > +       return 0;
> > +
> > +error:
> > +       v4l2_ctrl_handler_free(ctrl_hdlr);
> > +
> > +       return ctrl_hdlr->error;
> > +}
> > +
> > +static int imx471_check_hwcfg(struct imx471 *sensor)
> > +{
> > +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +       };
> > +       struct fwnode_handle *ep, *fwnode =3D dev_fwnode(sensor->dev);
> > +       struct clk *clk;
> > +       unsigned long link_freq_bitmap;
> > +       int ret;
>
> If you want, you can sort the variable declarations throughout the code, =
where
> appropriate, by length to make them more readable.
okay

>
> > +
> > +       clk =3D devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> > +       if (IS_ERR(clk))
> > +               return dev_err_probe(sensor->dev, PTR_ERR(clk),
> > +                                    "can't get clock frequency\n");
> > +
> > +       if (clk_get_rate(clk) !=3D IMX471_EXT_CLK)
> > +               return dev_err_probe(sensor->dev, -EINVAL,
> > +                                    "external clock %lu is not support=
ed\n",
> > +                                    clk_get_rate(clk));
> > +
> > +       ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +       fwnode_handle_put(ep);
> > +       if (ret)
> > +               return dev_err_probe(sensor->dev, ret,
> > +                                    "parsing endpoint failed");
> > +
> > +       ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freq=
uencies,
> > +                                      bus_cfg.nr_of_link_frequencies,
> > +                                      link_freq_menu_items,
> > +                                      ARRAY_SIZE(link_freq_menu_items)=
,
> > +                                      &link_freq_bitmap);
>
> This can fail silently. Please add an error message before returning the =
failure.
The error messages are in the v4l2_link_freq_to_bitmap() therefore I
don't put additinal error messages for it.

>
> > +
> > +       v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx471_probe(struct i2c_client *client)
> > +{
> > +       struct imx471 *sensor;
> > +       int ret;
> > +
> > +       sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERN=
EL);
> > +       if (!sensor)
> > +               return dev_err_probe(&client->dev, -ENOMEM,
> > +                                    "failed to allocate memory\n");
> > +
> > +       sensor->dev =3D &client->dev;
> > +
> > +       /* Check HW config */
> > +       ret =3D imx471_check_hwcfg(sensor);
> > +       if (ret)
> > +               return dev_err_probe(sensor->dev, ret,
> > +                                    "failed to check hwcfg: %d\n", ret=
);
> > +
> > +       ret =3D imx471_get_regulators(sensor->dev, sensor);
> > +       if (ret)
> > +               return dev_err_probe(sensor->dev, ret,
> > +                                    "failed to get regulators\n");
> > +
> > +       sensor->reset_gpio =3D devm_gpiod_get_optional(sensor->dev, "re=
set",
> > +                                                    GPIOD_OUT_HIGH);
> > +       if (IS_ERR(sensor->reset_gpio))
> > +               return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset=
_gpio),
> > +                                    "failed to get reset gpio\n");
> > +
> > +       sensor->img_clk =3D devm_clk_get_optional(sensor->dev, NULL);
> > +       if (IS_ERR(sensor->img_clk))
> > +               return dev_err_probe(sensor->dev, PTR_ERR(sensor->img_c=
lk),
> > +                                    "failed to get imaging clock\n");
> > +
> > +       /* Initialize subdev */
> > +       v4l2_i2c_subdev_init(&sensor->sd, client, &imx471_subdev_ops);
> > +
> > +       /* Initialize regmap */
> > +       sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(sensor->regmap))
> > +               return PTR_ERR(sensor->regmap);
>
> Please add an error message before returning the failure.

Ok

>
> > +
> > +       ret =3D imx471_power_on(sensor->dev);
> > +       if (ret)
> > +               return dev_err_probe(sensor->dev, ret,
> > +                                    "failed to power on\n");
> > +
> > +       /* Check module identity */
> > +       ret =3D imx471_identify_module(sensor);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to find sensor: %d", ret)=
;
>
> Use dev_err_probe();
>
> Also, add a newline character at the end of the print statement.
ok

>
> > +               goto error_power_off;
> > +       }
> > +
> > +       ret =3D imx471_init_controls(sensor);
> > +       if (ret) {
> > +               dev_err(sensor->dev, "failed to init controls: %d", ret=
);
>
> Same here.
got it.
>
> > +               goto error_power_off;
> > +       }
> > +
> > +       /* Initialize subdev */
> > +       sensor->sd.internal_ops =3D &imx471_internal_ops;
> > +       sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                           V4L2_SUBDEV_FL_HAS_EVENTS;
>
> See: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.me=
rciai@gmail.com/
Ok. Drop V4L2_SUBDEV_FL_HAS_EVENTS.
>
> > +       sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +       /* Initialize source pad */
> > +       sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +       ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->=
pad);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to init entity pads: %d",=
 ret);
>
> Use dev_err_probe.
>
> > +               goto error_v4l2_ctrl_handler_free;
> > +       }
> > +
> > +       sensor->sd.state_lock =3D sensor->ctrl_handler.lock;
> > +       ret =3D v4l2_subdev_init_finalize(&sensor->sd);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev, "failed to init subdev: %d", ret)=
;
>
> Same here.

Ok

>
> > +               goto error_media_entity_pm;
> > +       }
> > +
> > +       pm_runtime_set_active(sensor->dev);
> > +       pm_runtime_enable(sensor->dev);
> > +       pm_runtime_idle(sensor->dev);
> > +
> > +       ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +       if (ret < 0)
> > +               goto error_v4l2_subdev_cleanup;
> > +
> > +       return 0;
> > +
> > +error_v4l2_subdev_cleanup:
> > +       pm_runtime_disable(sensor->dev);
> > +       pm_runtime_set_suspended(sensor->dev);
> > +       v4l2_subdev_cleanup(&sensor->sd);
> > +
> > +error_media_entity_pm:
> > +       media_entity_cleanup(&sensor->sd.entity);
> > +
> > +error_v4l2_ctrl_handler_free:
> > +       v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> > +
> > +error_power_off:
> > +       imx471_power_off(sensor->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static void imx471_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct imx471 *sensor =3D to_imx471(sd);
> > +
> > +       v4l2_async_unregister_subdev(sd);
> > +       v4l2_subdev_cleanup(sd);
> > +       media_entity_cleanup(&sd->entity);
> > +       v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +
> > +       pm_runtime_disable(&client->dev);
> > +
> > +       if (!pm_runtime_status_suspended(sensor->dev)) {
> > +               imx471_power_off(sensor->dev);
> > +               pm_runtime_set_suspended(sensor->dev);
>
> You can use client->dev here and drop the struct imx471 *sensor =3D to_im=
x471(sd); line.
Okay
>
> > +       }
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(imx471_pm_ops, imx471_power_off,
> > +                                imx471_power_on, NULL);
> > +
> > +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused =
=3D {
> > +       { "SONY471A" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
> > +
> > +static struct i2c_driver imx471_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "imx471",
> > +               .acpi_match_table =3D ACPI_PTR(imx471_acpi_ids),
> > +               .pm =3D pm_sleep_ptr(&imx471_pm_ops),
> > +       },
> > +       .probe =3D imx471_probe,
> > +       .remove =3D imx471_remove,
> > +};
> > +module_i2c_driver(imx471_i2c_driver);
> > +
> > +MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");
> > +MODULE_AUTHOR("Serin Yeh <serin.yeh@intel.com>");
> > +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> > +MODULE_DESCRIPTION("Sony imx471 sensor driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.54.0
>
> Best Regards,
> Tarang
>

I'll propose the v4 patch to include the fixes. :)

--=20
BR,
Kate


