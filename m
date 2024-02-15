Return-Path: <linux-media+bounces-5188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AC8855AB0
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 07:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A2D81C2AA3F
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 06:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0630FB67E;
	Thu, 15 Feb 2024 06:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3DbBEmO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1711610E
	for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 06:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707979445; cv=none; b=IyiWqMCMJzBA67B7K7fCjCFOExPy65LQEAJfrD8gXv6YazL0bsMWIXRkjuJlaDLM/oFT2ZZdGUgenpuj+WQ+QeXYU4MVsRUeoeiINTBXfyvx7PAitVrWQDooOIdu41PUxQW2oKUc9G4ztLc7NNnAFuz31dmycvfQtpPj/D8n0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707979445; c=relaxed/simple;
	bh=Bw5c3M8KxpT4pDeae/pCK/QkNxjjMiD4lEtNIMyOwJ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hL0fgtaF7aYIFENSOTUeRLfaVE8s5g9hMtPIF6eINRxSD93NnR4kl/sU9PhJ0PCnz6O4OVe09Cs5B0JSopRWG58gj12sNhfZFZOIqLgOQ1uUdINgaNaLmnnk7Nif4P2W1g6wmCCTPwfqXczYt6Mb5MS/qqVJoUSGjvdc6EwHIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3DbBEmO; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511a45f6a57so644203e87.2
        for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 22:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707979442; x=1708584242; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qRlKBI0PeDkY77BecJ7akLwfrH/H5EonEaCpIOo8ukw=;
        b=d3DbBEmOplSkm5uexHMyKLxZCsCn7I+QdTganB+ReTinAYfyUVwgjZCQ1hLccQ7yVP
         KnvFQkPh904HdlP/juJCfyW7ZYz3Ycmkkkn4PEqkRrrc/6YGMEcTl0QOksFlAGkBc0Cu
         TJjhV5gXKi1nOKr+i4pl1LMHXQfp7tVy4zv8ihC93t859bB6o3agvyzCABmKjaJqL3uz
         e55ZPLYG6swNYscoHlKL1spfL9Y5ljuMJzMQUhZjWEF8b2wh5M28J77HlAIZq+H4xc8s
         RuEkoaZKzChqKZF4T/pdredUGcCKw7Ea/t8QOtvGCDQmkT/kaEx/SsxE1L6u+RPqZN22
         xl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707979442; x=1708584242;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRlKBI0PeDkY77BecJ7akLwfrH/H5EonEaCpIOo8ukw=;
        b=LC7WiL6FBCbpydKKvFAKscOdGQO532rH1QEOw4D6J3goBxBCE2gZyafTQRL6yhnO5n
         P4n+IeEaTQC2yekoCVXW+JzE1zvKv/pAoqY5FW4ShI1I3RWqTXSDcDL22YPGQWFv0W8a
         v+RBKU2i7a+ESwcq3AB18ykTUQjsGgDRkQhBbtukXBw/s/ZTHPKVjVzGJjLdA26aTKZ5
         nL4yJNblbDN1E/HE2bEmddvYsE75zoMZrWptyQnU6YGsu6lFcGE7mU6NjG9EDhv13l72
         fMWnKRCKesdNNxIndUPRwhFgPArkWIh54lZuifpNJy7wrGmalHPvb+vMl5aiWTjyBAv+
         7Ktg==
X-Forwarded-Encrypted: i=1; AJvYcCV/T55K8UzzIsDzbPwsgmyunbz5v0fJjEpCElIy6mBif5Cs+xjhMqSE0if47PIU8DsS/k2Omo+5KwfSFAz/oyIWdvvz00S5UVOjTd8=
X-Gm-Message-State: AOJu0YzCd341MDFHBGHglB6FVnha4HMWyGqnvqDk6sGKmg4U4ER4QBcZ
	Z14Zw1yUxoAZHgLm14SprRo1R3/VXPnYucgXwMlIr7LFIoj3PnDJ
X-Google-Smtp-Source: AGHT+IFBqxgkOy/kk/ILI3kBRPrzuYS/oqyj96LDw0rhNag4UmgmMMccmEb/F4vsaWpXy7DlH8wF2g==
X-Received: by 2002:a05:6512:2e9:b0:511:830d:c0a7 with SMTP id m9-20020a05651202e900b00511830dc0a7mr822650lfq.45.1707979441416;
        Wed, 14 Feb 2024 22:44:01 -0800 (PST)
Received: from [192.168.50.250] (c-x5996889d.customers.hiper-net.dk. [89.150.136.157])
        by smtp.gmail.com with ESMTPSA id ci7-20020a170906c34700b00a3d31602a42sm237717ejb.89.2024.02.14.22.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 22:44:00 -0800 (PST)
Message-ID: <2f407c0a4f1d7deb4c3fa8e5005caa513c688e6d.camel@gmail.com>
Subject: Re: [PATCH v3 10/17] media: intel/ipu6: add input system driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
 laurent.pinchart@ideasonboard.com, andriy.shevchenko@linux.intel.com, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 claus.stovgaard@gmail.com,  tomi.valkeinen@ideasonboard.com,
 tfiga@chromium.org, senozhatsky@chromium.org,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Thu, 15 Feb 2024 07:43:59 +0100
In-Reply-To: <ZcpkBSQ9hz9yB_UY@kekkonen.localdomain>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
	 <20240111065531.2418836-11-bingbu.cao@intel.com>
	 <f3fe18c6857982d8ff862566bc7d6511225d9193.camel@gmail.com>
	 <ZcpkBSQ9hz9yB_UY@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sakari,

On Mon, 2024-02-12 at 18:31 +0000, Sakari Ailus wrote:
> Hi Andreas,
>=20
> On Wed, Feb 07, 2024 at 10:36:15AM +0100, Andreas Helbech Kleist wrote:
> > Hi Bingbu,
> >=20
> > Thank you for the patch series, I haven't had a chance to look at v3 in
> > detail yet, so this is just a small comment from my testing on v2 +
> > IPU4 hacks, which I can see is also here in v3.
> >=20
> >  On Thu, 2024-01-11 at 14:55 +0800, bingbu.cao@intel.com wrote:
> > > From: Bingbu Cao <bingbu.cao@intel.com>
> > >=20
> > > Input system driver do basic isys hardware setup and irq handling
> > > and work with fwnode and v4l2 to register the ISYS v4l2 devices.
> > >=20
> > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/media/pci/intel/ipu6/ipu6-isys.c | 1353 ++++++++++++++++++++=
++
> > >  drivers/media/pci/intel/ipu6/ipu6-isys.h |  207 ++++
> > >  2 files changed, 1560 insertions(+)
> > >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
> > >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
> > >=20
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media=
/pci/intel/ipu6/ipu6-isys.c
> >=20
> > ...
> >=20
> > > +static void isys_unregister_devices(struct ipu6_isys *isys)
> > > +{
> > > +	isys_unregister_video_devices(isys);
> > > +	isys_csi2_unregister_subdevices(isys);
> > > +	v4l2_device_unregister(&isys->v4l2_dev);
> > > +	media_device_unregister(&isys->media_dev);
> > > +	media_device_cleanup(&isys->media_dev);
> > > +}
> >=20
> > ...
> >=20
> > > +static void isys_remove(struct auxiliary_device *auxdev)
> > > +{
> > > +	struct ipu6_bus_device *adev =3D auxdev_to_adev(auxdev);
> > > +	struct ipu6_isys *isys =3D dev_get_drvdata(&auxdev->dev);
> > > +	struct ipu6_device *isp =3D adev->isp;
> > > +	struct isys_fw_msgs *fwmsg, *safe;
> > > +	unsigned int i;
> > > +
> > > +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
> > > +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> > > +			       fwmsg, fwmsg->dma_addr, 0);
> > > +
> > > +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
> > > +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> > > +			       fwmsg, fwmsg->dma_addr, 0);
> >=20
> > I experienced a crash in ipu6_get_fw_msg_buf when unbinding the PCI
> > driver while streaming.
> >=20
> > It happens because the above two lists are still used at this point. I
> > believe it is safe to free the fw msgs after the
> > isys_unregister_devices(isys) call below.
>=20
> Probably yes, indeed.
>=20
> However there's no support for unbinding a driver from a device while
> streaming apart from plain V4L2 drivers. This needs to be addressed but w=
e
> can't address it driver by driver when the framework won't help with that=
,
> it requires a comprehensive approach and support for this in MC and V4L2
> sub-device frameworks.

Thank you for the information. I'll try to lower my expectations ;)

> >=20
> > > +
> > > +	isys_unregister_devices(isys);
> > > +	isys_notifier_cleanup(isys);
> > > +
> > > +	cpu_latency_qos_remove_request(&isys->pm_qos);
> > > +
> > > +	if (!isp->secure_mode) {
> > > +		ipu6_cpd_free_pkg_dir(adev);
> > > +		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
> > > +		release_firmware(adev->fw);
> > > +	}
> > > +
> > > +	for (i =3D 0; i < IPU6_ISYS_MAX_STREAMS; i++)
> > > +		mutex_destroy(&isys->streams[i].mutex);
> > > +
> > > +	isys_iwake_watermark_cleanup(isys);
> > > +	mutex_destroy(&isys->stream_mutex);
> > > +	mutex_destroy(&isys->mutex);
> > > +}
> >=20
> > /Andreas
>=20


