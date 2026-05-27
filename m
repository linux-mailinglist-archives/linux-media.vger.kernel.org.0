Return-Path: <linux-media+bounces-62845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF57ANyLFmpknQcAu9opvQ
	(envelope-from <linux-media+bounces-62845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:14:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A615DFACE
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 735E0303894D
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 06:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F10F30E85D;
	Wed, 27 May 2026 06:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5C8g0Pz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g247E1eu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8F92F6560
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 06:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862483; cv=pass; b=jJ5U2bq9lW3K2TnnWpm6CFIjNYzMiGCJ+rumLGbLn4nwb0ZG/VJC7Xl0SZ1F2rQDy6gPbv2luapE7gvds+yfdoXtloxPeotJxuK8KcF6wUqFygkxvCYh3aByUywQBplwzQoLrFGwM+p8Fk72zECa1jiuAk2HQ0QapTbQEv+13ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862483; c=relaxed/simple;
	bh=Ae0NGQLwFxUtOKIKYcFVSmRvRh1eSZmpokWdajwqlhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ay9EIxLbVVi52/c/nvElrucUYjiNfBStO/ETXm/4fe2/hF77DDJOtb10E6SjOOX72fgusI/ESqOXzlfi30XmDrcngXShj77uF1SP79RDzd0gY1HbI3lMwexFAfKZAXXSUNUMXdw5vKmrBMIVC2Qhl8NYGNol9iCp2VPEFPYzNVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5C8g0Pz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g247E1eu; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779862480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRPZhlA35e/fsO6/QAduSKigYcZ2ZY93BnWDZpRJJPo=;
	b=e5C8g0Pzf/NjPnjfBcHrDAKG+BMxS8cgYN6rSh7htqUvvVm8qyrlIY3Ali05oHK+bu5qMT
	h3KlA3zpdCW2hoe5p57yOc+T+Zqkk5mMmH65e1E98LxUh3gB2xWa5ycsOECrIr85BiFMG1
	S/TvhtrwPU2sAZdrytr+5T3qnght4Pg=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-kLM-i8FaMbS-9_AHo5uGbA-1; Wed, 27 May 2026 02:14:38 -0400
X-MC-Unique: kLM-i8FaMbS-9_AHo5uGbA-1
X-Mimecast-MFC-AGG-ID: kLM-i8FaMbS-9_AHo5uGbA_1779862477
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d932fb253so4696530eaf.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 23:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779862477; cv=none;
        d=google.com; s=arc-20240605;
        b=AYZ+BWC7gWJxrncxlA3lJlo+t6uIlJOtNb1CWunmdvKh0IHE5YH3g0LWk4yod2UTY2
         X68UC9+P/qkwIUZh2UTOMs8pQvFl9eqAwWChh0+YNAUtRGmTV/rfxvoehXv6UHfWTRK8
         zkhsY8TaAxX9CEUNDizThlqhfENuctW5B3HdyyEyfuvPIVn/dGf8qUGQ7d32s2fCQtuA
         Alvo+Q7ISV6RBKcjfdPGjll0/PXxlp3Bi8m5mtuOFSsjOh4q8z4ABgzwBKxez8IdF1QU
         vq8y017YC44nEpUhGR5g/n07ZlXPhh1jcjLjzATCuRhz+IQG05ywTSPA2VmnqniCHREL
         HwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zRPZhlA35e/fsO6/QAduSKigYcZ2ZY93BnWDZpRJJPo=;
        fh=qPEPYxxbZR2hb9XB3NjTCmnQPEVlOCpJF7B57T2LxRc=;
        b=J854AByj6mxYLEe54QP0YOVM335OPbfKik2PQQNtwdEB9gFB4+VazvYY1XhObl+nRB
         OYe+MFwWANIYpKolZqvrlRL9/7XTCUpsLf3x417k7iUmtku9g2CQ2vxQLY4QI9ZWuW8E
         yj8o82f3bEcyH43nnm6XSkQrGPEzY2gQ9cG9SAbuz+8qD2RnbHzBrBVVzWyMKB/6FAXU
         70GW9gW8LULCrDwbCYD9LJTuYy5UKaJyMPSd1RG679vYAEOTuLn/+P9LPjg0SayB8vYe
         9VQIH9MIjxPQujuuusPIkPg4LgEDcSnoPoIYGxlZcJHC32w1nz6eRlMESBRuR9kVSkqU
         semg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779862477; x=1780467277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRPZhlA35e/fsO6/QAduSKigYcZ2ZY93BnWDZpRJJPo=;
        b=g247E1eup1fNF2BLXJTR2XNfgjrnBSj2i4UQtPxO3yumu/UFwfRT8eVXsKdh+PM9rF
         5O2/d1Yx3vkHL12WPZ0UgVQSpbnWTI7leTaIU/u6C4HpCLo9QB1Q2lTYUcmXUAl4BDYD
         7kzGFYPiLah//vVZo98UvSpw4Aq7MC1vj79cZ8OHjJD8pnx8kk/1TIniTNSsKnuqEZpP
         yzWTWXuXRHcfSvNeFpQ2LkYG5op1I6IDDgG+MATmpwZWL7x2/zIHEi6W2XodK8QWhX/E
         qlbCwgM4C4XcNGb7ueNzzlEgDjNx5DfPKrf0h7oKHjzNW3Prwogv9GpLT5Ejyc3Vu4iz
         TATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779862477; x=1780467277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zRPZhlA35e/fsO6/QAduSKigYcZ2ZY93BnWDZpRJJPo=;
        b=r4/Enm0SCCuMm6vrOzoNJv0zaLqMsFTmd1F93+OWTViMDAAULF48Y8fEPStaoaxeBU
         ImUNbUg4OeGSHeuFNwY3sbg+EjQ+Q8sl273rbF8rA0sy5YocoWulwooKKOqvIK0fQZr1
         1WK9+I3JbScg0LWWdeuQHmbBQtFOGXZw7Dx+zrTbOnOie/Yl+YNO7ns5vsiTm/ZN0RAt
         b10yOEBXjBWwjIOo+rXLu1/HRDhDXOlaEUlfMRR8+gmMEQtEUoroBIlvVf49jqeoYdp6
         MJuVFKX2INgErKAaLhUGBRyVVlcS1tNr4BnxsoyV8vhLfhilfXixZQxHITn/pKUIG+gg
         hXzg==
X-Forwarded-Encrypted: i=1; AFNElJ8ubGgulCwkrYslwNfmZl24ttUVE1y5AfBZBL5zp/7DC9TTtoozX+hTEricQAZy5wl8lcyw+QufM38EpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcEqj8yXvGcSarb5lJMs/JrKOs5Uk0fQfbhIby75eAFz8N8aG0
	Gqv0DPWBP/1onOoXuGF/P4236D1X0YAyVSYbyXCHmRgnNsDBvv9xG1euM3U+3oBA/lydzNKfNvq
	QdA0JxNndtJ7ZfnXO/8UaM57g3cBdZ3noB+d3Didco72Iz99X2a+UHWmYgCHjPLKrX4m2Z//JV6
	byNz4yeyMIWIWmASUrwth90n8qriipDpR9xZw8k6Q=
X-Gm-Gg: Acq92OG6GufZkW/6ko/QxurJYpH0ug/zW5oZ2bwi48G8XGIB6kqgS44T09XCeEJ/atd
	3xO8pCTr5UJxxgnJslVKqh/T9toKroGfnSLEasRR88gz1ahIYGm5gU/boQmnggSXnLVSMs6hTce
	J3/env+fDk7ZnL2ogjUidnFy/FRLIf4jtrlgBjdwg3HxFYwYXYh/12A2rAChUpkgnW97W410J52
	GiG
X-Received: by 2002:a4a:ec4c:0:b0:69d:521d:a4f1 with SMTP id 006d021491bc7-69d7ece7201mr11918899eaf.55.1779862477231;
        Tue, 26 May 2026 23:14:37 -0700 (PDT)
X-Received: by 2002:a4a:ec4c:0:b0:69d:521d:a4f1 with SMTP id
 006d021491bc7-69d7ece7201mr11918882eaf.55.1779862476609; Tue, 26 May 2026
 23:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522031121.11968-1-hpa@redhat.com> <20260522031121.11968-3-hpa@redhat.com>
 <ahDdMZjID07dRDhZ@kekkonen.localdomain>
In-Reply-To: <ahDdMZjID07dRDhZ@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 27 May 2026 14:14:24 +0800
X-Gm-Features: AVHnY4Jr39UCnSVrkejcJmaSSTCvj0YyqvB3q_OhugIoUhdti8ntIlFbhOuVp7A
Message-ID: <CAEth8oGWfYpC2umZ49g5qEp_QoZXNKNJ6vMu2EtmnOy6BxZGBg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, tarang.raval@siliconsignals.io
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-62845-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 66A615DFACE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you for reviewing.

On Sat, May 23, 2026 at 6:55=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> Thanks for the update.
>
> On Fri, May 22, 2026 at 11:11:20AM +0800, Kate Hsuan wrote:
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c
> >
> > This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a p=
art
>
> s/laptop\K/s/
>
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
> > @@ -24735,6 +24735,12 @@ T:   git git://linuxtv.org/media.git
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
>
> ...
>
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > new file mode 100644
> > index 000000000000..f3c7fdce2d50
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx471.c
>
> ...
>
> > +
> > +#define IMX471_NUM_SUPPLIES                  ARRAY_SIZE(imx471_supply_=
name)
>
> Please just use ARRAY_SIZE() where you need it.
>
> > +
> > +/* Mode : resolution and related config&values */
> > +struct imx471_mode {
> > +     /* Frame width */
> > +     u32 width;
> > +     /* Frame height */
> > +     u32 height;
> > +
> > +     /* V-timing */
> > +     u32 fll_def;
> > +     u32 fll_min;
> > +
> > +     /* H-timing */
> > +     u32 llp;
> > +
> > +     /* index of link frequency */
> > +     u32 link_freq_index;
> > +
> > +     /* Default register values */
> > +     const struct cci_reg_sequence *default_mode_regs;
> > +     const int default_mode_regs_length;
>
> unsigned int?
>
> const-ness here doesn't really matter as the entire struct is const.

unsigned int and drop const :)
>
> > +};
> > +
> > +struct imx471 {
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +     /* V4L2 Controls */
> > +     struct v4l2_ctrl *link_freq;
> > +     struct v4l2_ctrl *pixel_rate;
> > +     struct v4l2_ctrl *vblank;
> > +     struct v4l2_ctrl *hblank;
> > +     struct v4l2_ctrl *vflip;
> > +     struct v4l2_ctrl *hflip;
> > +     struct v4l2_ctrl *exposure;
>
> Do you need all these? At least link_freq remains effectively unused.
I'll tweak these ctrl based on
https://libcamera.org/sensor_driver_requirements.html.


>
> > +
> > +     struct gpio_desc *reset_gpio;
> > +     struct regulator_bulk_data supplies[IMX471_NUM_SUPPLIES];
> > +     struct clk *img_clk;
> > +
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +};
> > +
> > +static const struct cci_reg_sequence imx471_global_regs[] =3D {
> > +     { CCI_REG8(0x0136), 0x13 },
> > +     { CCI_REG8(0x0137), 0x33 },
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
> > +     { CCI_REG8(0x0101), 0x00 },
> > +     { CCI_REG8(0x0112), 0x0a },
> > +     { CCI_REG8(0x0113), 0x0a },
> > +     { CCI_REG8(0x0114), 0x03 },
> > +     { CCI_REG8(0x0342), 0x0a },
> > +     { CCI_REG8(0x0343), 0x00 },
> > +     { CCI_REG8(0x0340), 0x13 },
> > +     { CCI_REG8(0x0341), 0xb0 },
> > +     { CCI_REG8(0x0344), 0x00 },
> > +     { CCI_REG8(0x0345), 0x00 },
> > +     { CCI_REG8(0x0346), 0x01 },
> > +     { CCI_REG8(0x0347), 0xbc },
> > +     { CCI_REG8(0x0348), 0x12 },
> > +     { CCI_REG8(0x0349), 0x2f },
> > +     { CCI_REG8(0x034a), 0x0b },
> > +     { CCI_REG8(0x034b), 0xeb },
> > +     { CCI_REG8(0x0381), 0x01 },
> > +     { CCI_REG8(0x0383), 0x01 },
> > +     { CCI_REG8(0x0385), 0x01 },
> > +     { CCI_REG8(0x0387), 0x01 },
> > +     { CCI_REG8(0x0900), 0x01 },
> > +     { CCI_REG8(0x0901), 0x22 },
> > +     { CCI_REG8(0x0902), 0x08 },
> > +     { CCI_REG8(0x3f4c), 0x81 },
> > +     { CCI_REG8(0x3f4d), 0x81 },
> > +     { CCI_REG8(0x0408), 0x00 },
> > +     { CCI_REG8(0x0409), 0xc8 },
> > +     { CCI_REG8(0x040a), 0x00 },
> > +     { CCI_REG8(0x040b), 0x6c },
> > +     { CCI_REG8(0x040c), 0x07 },
> > +     { CCI_REG8(0x040d), 0x88 },
> > +     { CCI_REG8(0x040e), 0x04 },
> > +     { CCI_REG8(0x040f), 0x40 },
> > +     { CCI_REG8(0x034c), 0x07 },
> > +     { CCI_REG8(0x034d), 0x88 },
> > +     { CCI_REG8(0x034e), 0x04 },
> > +     { CCI_REG8(0x034f), 0x40 },
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
> > +     { CCI_REG8(0x0202), 0x13 },
> > +     { CCI_REG8(0x0203), 0x9e },
> > +     { CCI_REG8(0x0204), 0x00 },
> > +     { CCI_REG8(0x0205), 0x00 },
> > +     { CCI_REG8(0x020e), 0x01 },
> > +     { CCI_REG8(0x020f), 0x00 },
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
> > +/*
> > + * When adding more than the one below, make sure the disallowed ones =
will
> > + * actually be disabled in the LINK_FREQ control.
> > + */
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
> > +/* Mode configs */
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
> > +     for (unsigned int  i =3D 0; i < IMX471_NUM_SUPPLIES; i++)
>
> s/ \K //
ops

>
> > +             sensor->supplies[i].supply =3D imx471_supply_name[i];
> > +
> > +     return devm_regulator_bulk_get(dev, IMX471_NUM_SUPPLIES,
> > +                                    sensor->supplies);
> > +}
>
> ...
>
> > +/* Start streaming */
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
>
> Just return the error code here -- pm_runtime_resume_and_get() won't
> increment the usage count unless it succeeds.
okay.


>
> > +             goto error_powerdown;
> > +
> > +     ret =3D imx471_identify_module(sensor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Global Setting */
> > +     cci_multi_reg_write(sensor->regmap, imx471_global_regs,
> > +                         ARRAY_SIZE(imx471_global_regs), &ret);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to set global settings");
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
> > +     /* Apply default values of current mode */
> > +     cci_multi_reg_write(sensor->regmap, mode->default_mode_regs,
> > +                         mode->default_mode_regs_length, &ret);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to set mode");
> > +             goto error_powerdown;
> > +     }
> > +
> > +     /* set digital gain control to all color mode */
> > +     cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN, 1, &re=
t);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     /* Apply customized values from user */
> > +     ret =3D  __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +               IMX471_MODE_STREAMING, &ret);
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
> > +/* Stop streaming */
> > +static int imx471_disable_stream(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state,
> > +                              u32 pad, u64 streams_mask)
> > +{
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +     int ret;
> > +
> > +     cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +               IMX471_MODE_STANDBY, &ret);
> > +     pm_runtime_put(sensor->dev);
> > +
> > +     if (ret)
> > +             dev_err(sensor->dev,
> > +                     "failed to disable stream with return value: %d\n=
",
> > +                     ret);
> > +     __v4l2_ctrl_grab(sensor->vflip, false);
> > +     __v4l2_ctrl_grab(sensor->hflip, false);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops imx471_subdev_core_ops =3D {
> > +     .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > +     .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > +};
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
> > +     .core =3D &imx471_subdev_core_ops,
> > +     .video =3D &imx471_video_ops,
> > +     .pad =3D &imx471_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops imx471_internal_ops =3D {
> > +     .init_state =3D imx471_init_state,
> > +};
> > +
> > +/* Initialize control handlers */
> > +static int imx471_init_controls(struct imx471 *sensor)
> > +{
> > +     const struct imx471_mode *mode =3D &imx471_modes[0];
> > +     struct v4l2_ctrl_handler *ctrl_hdlr;
> > +     struct v4l2_fwnode_device_properties props;
> > +     s64 exposure_max, hblank;
> > +     u64 pixel_rate;
> > +     int ret;
> > +
> > +     ctrl_hdlr =3D &sensor->ctrl_handler;
> > +     ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > +     if (ret)
> > +             return ret;
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
> > +     sensor->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > +                                                &imx471_ctrl_ops,
> > +                                                V4L2_CID_LINK_FREQ,
> > +                                                ARRAY_SIZE(link_freq_m=
enu_items) - 1,
> > +                                                0,
> > +                                                link_freq_menu_items);
> > +     if (sensor->link_freq)
> > +             sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample *=
/
> > +     pixel_rate =3D IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> > +     div_u64(pixel_rate, 10);
> > +     /* By default, PIXEL_RATE is read only */
> > +     sensor->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_=
ops,
> > +                                            V4L2_CID_PIXEL_RATE, pixel=
_rate,
> > +                                            pixel_rate, 1, pixel_rate)=
;
> > +
> > +     /* Initial vblank/hblank/exposure parameters based on current mod=
e */
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
> > +     if (sensor->hblank)
> > +             sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
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
> > +     /* Digital gain */
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
> > +     /* HFLIP & VFLIP */
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
> > +     sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +     sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>
> Either set all flags where controls are created or here. I think I'd move
> them here.

Sound good. I'll move the flag settings to here.
>
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
> > +     struct clk *clk;
> > +     unsigned long link_freq_bitmap;
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
> > +     /* Check HW config */
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
> > +     /* Initialize subdev */
> > +     v4l2_i2c_subdev_init(&sensor->sd, client, &imx471_subdev_ops);
> > +
> > +     /* Initialize regmap */
> > +     sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(sensor->regmap))
> > +             return PTR_ERR(sensor->regmap);
> > +
> > +     ret =3D imx471_power_on(sensor->dev);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to power on\n");
> > +
> > +     /* Check module identity */
> > +     ret =3D imx471_identify_module(sensor);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to find sensor: %d", ret);
> > +             goto error_power_off;
> > +     }
> > +
> > +     ret =3D imx471_init_controls(sensor);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to init controls: %d", ret);
> > +             goto error_power_off;
> > +     }
> > +
> > +     /* Initialize subdev */
> > +     sensor->sd.internal_ops =3D &imx471_internal_ops;
> > +     sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                         V4L2_SUBDEV_FL_HAS_EVENTS;
> > +     sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     /* Initialize source pad */
> > +     sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to init entity pads: %d", r=
et);
> > +             goto error_v4l2_ctrl_handler_free;
> > +     }
> > +
> > +     sensor->sd.state_lock =3D sensor->ctrl_handler.lock;
> > +     ret =3D v4l2_subdev_init_finalize(&sensor->sd);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to init subdev: %d", ret);
> > +             goto error_media_entity_pm;
> > +     }
> > +
> > +     pm_runtime_set_active(sensor->dev);
> > +     pm_runtime_enable(sensor->dev);
> > +     pm_runtime_idle(sensor->dev);
>
> Move the pm_runtime_idle() call after v4l2_async_register_subdev_sensor()=
.
> Otherwise Runtime PM may power off the sensor on error and the driver sti=
ll
> calls imx471_power_off().
Ok. got it.
>
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret < 0)
> > +             goto error_v4l2_subdev_cleanup;
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
> > +     struct imx471 *sensor =3D to_imx471(sd);
> > +
> > +     v4l2_async_unregister_subdev(sd);
> > +     v4l2_subdev_cleanup(sd);
> > +     media_entity_cleanup(&sd->entity);
> > +     v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +
> > +     pm_runtime_disable(&client->dev);
> > +
> > +     if (!pm_runtime_status_suspended(sensor->dev)) {
> > +             imx471_power_off(sensor->dev);
> > +             pm_runtime_set_suspended(sensor->dev);
> > +     }
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(imx471_pm_ops, imx471_power_off,
> > +                              imx471_power_on, NULL);
> > +
> > +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused =
=3D {
> > +     { "SONY471A" },
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


