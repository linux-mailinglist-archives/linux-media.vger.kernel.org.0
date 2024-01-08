Return-Path: <linux-media+bounces-3302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC2826B8E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 11:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A55A1F22314
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 10:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0972313AE0;
	Mon,  8 Jan 2024 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPsD7Hid"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB44B13FFB
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so1578399e87.0
        for <linux-media@vger.kernel.org>; Mon, 08 Jan 2024 02:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704709638; x=1705314438; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JBLHpGzn0xGezVyVK9ir4hFV0zD+5Na7U0zSXdHUrpo=;
        b=TPsD7HidPNBlmP3KB5i1JZTDzp1o9m3BXPnEqHXAMBw8BoofD3MOYbsmdQzpcpzO6W
         aqNoCdOSIjwnIKU6dWw3guzgLyp+p6p/J+s7+ygQsLo1Zz9dI+94xpgjg0xfXp76Dsib
         ZnvyLbl9hEK0z1FfnLg04gtPtiLjwav/XckW1r8m+9hqvGXrBhTmcyC1wlSfQTQ8v5C+
         wZvga4Fb4EpA2sCqh/hoAvlxTgJiPWdJN645g7MLGjKW4+ZYjftz0v5P4zSwuwMSmDys
         e1GXrV/B1QkW0sJYH8XPpZs7PhbIFOhibEBBt38h3f542pPh8eyYnAmYEgQ+dAQPxlrF
         uVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704709638; x=1705314438;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBLHpGzn0xGezVyVK9ir4hFV0zD+5Na7U0zSXdHUrpo=;
        b=Y6pZCYA5kOUnJiYXxmAVCCnW0RjvnTiJG6m1lVvaBcb5ieDjX6EFhSYLB15DQHrpSC
         2YF3P7COXnvAW08A8Fo5gUogwloNcGyrUvftcb3TaOaAVPTndPjfAWlfoDgk9TVarUvH
         fWDzBrjTTkVj6Org7n1p/T/8QQzl4P1GtFP5ht26XXVgp36kIHOW8AxlmCV3gvw8Xu6z
         0TcP00n+cRAx+aUp7UeNgmRd9QFopifNIhtoj/xRCHe6WT3zof+yOAOrG9Gs1Zc0j0nz
         UNz5RKCOpjb5D+twHnGM0GaRmhfJyYSckonQAbe0V6WX2Z9nnIUx41LVOM2WA6kAVvPe
         +Gsg==
X-Gm-Message-State: AOJu0YwgE7kt/q4k+AZhEpEZOgZG4JxWb+af1ni1+5EKSDbf2KRpXch7
	gKhj8YbwPbo7FlMYvvhL0FQ=
X-Google-Smtp-Source: AGHT+IHnbSYCxzGlAaLxJPz5fKL182Ryqc3HlowIz5kNn2PJAZLI6+P8C4qObz0nH3F0W2LVfiKiYA==
X-Received: by 2002:ac2:4250:0:b0:50e:4bea:b0c with SMTP id m16-20020ac24250000000b0050e4bea0b0cmr1254169lfl.54.1704709637422;
        Mon, 08 Jan 2024 02:27:17 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id c7-20020a0564021f8700b0055473af90a6sm4177961edc.0.2024.01.08.02.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 02:27:16 -0800 (PST)
Message-ID: <837f65a2c1eabb0ea439a59936f46adf0191297b.camel@gmail.com>
Subject: Re: [PATCH v2 03/15] media: intel/ipu6: add IPU6 buttress interface
 driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com, 
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  tian.shu.qiu@intel.com,
 hongju.wang@intel.com
Date: Mon, 08 Jan 2024 11:27:15 +0100
In-Reply-To: <c74838b5-14a3-d96d-f50e-c897b15d05c8@linux.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-4-bingbu.cao@intel.com>
	 <25b34fe6327dbb59ee485a8b5d411b73ffd29392.camel@gmail.com>
	 <a6d1ed67-1d2c-3700-fe74-5697d4217bea@linux.intel.com>
	 <c74838b5-14a3-d96d-f50e-c897b15d05c8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Bingbu,

On Wed, 2024-01-03 at 21:18 +0800, Bingbu Cao wrote:
> Andreas,
>=20
> On 1/3/24 9:11 PM, Bingbu Cao wrote:
> > Andreas,
> >=20
> > On 1/3/24 5:22 PM, Andreas Helbech Kleist wrote:
> > > Hi Bingbu,
> > >=20
> > > On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> > > > From: Bingbu Cao <bingbu.cao@intel.com>
> > > >=20
> > > > The IPU6 buttress is the interface between IPU device (input system
> > > > and processing system) with rest of the SoC. It contains overall IP=
U
> > > > hardware control registers, these control registers are used as the
> > > > interfaces with the Intel Converged Security Engine and Punit to do
> > > > firmware authentication and power management.
> > > >=20
> > > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > > ---
> > >=20
> > > ...
> > >=20
> > > > +static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *=
adev)
> > > > +{
> > > > +	irqreturn_t ret =3D IRQ_WAKE_THREAD;
> > > > +
> > > > +	if (!adev || !adev->auxdrv || !adev->auxdrv_data)
> > > > +		return IRQ_NONE;
> > > > +
> > > > +	if (adev->auxdrv_data->isr)
> > > > +		ret =3D adev->auxdrv_data->isr(adev);
> > > > +
> > > > +	if (ret =3D=3D IRQ_WAKE_THREAD && !adev->auxdrv_data->isr_threade=
d)
> > > > +		ret =3D IRQ_NONE;
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
> > > > +{
> > > > +	struct ipu6_device *isp =3D isp_ptr;
> > > > +	struct ipu6_bus_device *adev[] =3D { isp->isys, isp->psys };
> > > > +	struct ipu6_buttress *b =3D &isp->buttress;
> > > > +	u32 reg_irq_sts =3D BUTTRESS_REG_ISR_STATUS;
> > > > +	irqreturn_t ret =3D IRQ_NONE;
> > > > +	u32 disable_irqs =3D 0;
> > > > +	u32 irq_status;
> > > > +	u32 i, count =3D 0;
> > > > +
> > > > +	pm_runtime_get_noresume(&isp->pdev->dev);
> > > > +
> > > > +	irq_status =3D readl(isp->base + reg_irq_sts);
> > > > +	if (!irq_status) {
> > > > +		pm_runtime_put_noidle(&isp->pdev->dev);
> > > > +		return IRQ_NONE;
> > > > +	}
> > > > +
> > > > +	do {
> > > > +		writel(irq_status, isp->base + BUTTRESS_REG_ISR_CLEAR);
> > > > +
> > > > +		for (i =3D 0; i < ARRAY_SIZE(ipu6_adev_irq_mask); i++) {
> > > > +			irqreturn_t r =3D ipu6_buttress_call_isr(adev[i]);
> > > > +
> > > > +			if (!(irq_status & ipu6_adev_irq_mask[i]))
> > > > +				continue;
> > > > +
> > > > +			if (r =3D=3D IRQ_WAKE_THREAD) {
> > > > +				ret =3D IRQ_WAKE_THREAD;
> > > > +				disable_irqs |=3D ipu6_adev_irq_mask[i];
> > > > +			} else if (ret =3D=3D IRQ_NONE && r =3D=3D IRQ_HANDLED) {
> > > > +				ret =3D IRQ_HANDLED;
> > > > +			}
> > > > +		}
> > >=20
> > > It seems wrong to call the ISR for a adev[i] before checking the
> > > corresponding IRQ mask. If the mask is not set, the ISR is still
> > > called, but the result is thrown away.
> > >=20
> > > I started investigating this because I'm seeing "general protection
> > > fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b" in this
> > > function when unbinding the IPU4 driver.
> > >=20
> > > How do you ensure that the ISR is not called on a ipu6-bus device tha=
t
> > > has been deleted? Specifically in ipu6_pci_remove, ipu6_bus_del_devic=
es
> > > is called before ipu6_buttress_exit (which disables buttress IRQs).
> > > Perhaps the above for loop should really be a "for each ipu6-bus
> > > device" loop?
> >=20
> > You are right, the buttress_exit() should be called before
> > ipu6_bus_del_devices().
> >=20
> > Even with this, driver cannot guarantee that hardware irq was actually
> > disabled on IPU4. In some error cases, HW could report unmasked errors =
on
> > IPU4 (no such case on IPU6), if I remember correctly.

Thanks for the info, that's good to know.

> > Have you check whether devm_free_irq() in ipu6_pci_remove() can help yo=
u?

It looks like it might help.

> BTW, could you share the irq_status in your case?

Sorry, I don't have a log of it. And it seems to be a bit heisenbug-
like - it doesn't always happen when I add logging :/

/Andreas

