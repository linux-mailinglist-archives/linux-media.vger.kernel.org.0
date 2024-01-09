Return-Path: <linux-media+bounces-3416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA90828770
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 14:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EACD1F25547
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D0A38FBB;
	Tue,  9 Jan 2024 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9lCbaAI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E5239843
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55790581457so2826088a12.3
        for <linux-media@vger.kernel.org>; Tue, 09 Jan 2024 05:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704808361; x=1705413161; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BLwdR6GQkprSmg/u6OOBPDfqTXD2S796cp7a6PQJo9c=;
        b=k9lCbaAI486d/KLjYJwFD74VD10VWDW+PPZZG6SpJ3KdWuaQ8eBYGd4H/wQ8ybXtg2
         YIDXlo500s8VsGFLwzJeCV8Yi2LzdYg+5XtkALJZOO/5s2Haa47AMsUyYEr1nJfkRJwi
         GwzaEN7YBmy51FYLjJldm7NCjgIem7Gq0I90BX/5p5J2s0KFqLbxJjS2NNQfQ+GsDg72
         S9SQYcm8YwNKUezniM+C9Omlk7MTLpETihpVztzwCY5D11QeO4dnw34Z+Gc7O8R4lXAI
         LZNZRQ5wyPbO1+xxlrUUXi/Pi/bFQO6TVgf2VCDIaN18OGT+ej1x3p9nTcbgUfJrPSNd
         EmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704808361; x=1705413161;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLwdR6GQkprSmg/u6OOBPDfqTXD2S796cp7a6PQJo9c=;
        b=VroL2l91TNGi1fbb9i8Zwg9y+/PyURPB2orYtMvgVMOBu/bBzHFiKcTAaTWLCxVhoe
         /xy0+BB0Djh9O0KUzTN+pl1+POj95UuxiCIEBk1KfIS3k9MhXuxLtBw3LlyaqT/rPH8I
         eb6mvWplwsvuefB/rVHokRh1x92kf8LjkuXJh+SPq3jOXmdluYqbeSMaEO2Hw1KmrJ7R
         LHVHJ+bwckVgS9qyXtEGfsKkaglXPJJKecgWBg4FjLuhr7t91YcXGMsISD4s6OUMtlpX
         PjevMBjKYm6Lxnr0A4M93LduzwrwEF20B74OuQpXgyQXTcG/78SKfWychPKa6RDCQS3C
         iePg==
X-Gm-Message-State: AOJu0YyM8xvZdAowqflZ4q/Qp89UfXitbP2fIecPCphX/QqsKQv4ukTb
	oJGQgmI/Nl93N8ftArjrqm0=
X-Google-Smtp-Source: AGHT+IGFt2VyUpMGr783iHB30lPVBg1FAE9mJuQNgvFg2wuR1b6I4OU3BHwnBtZ0WPa7DHLem8potA==
X-Received: by 2002:a05:6402:60a:b0:558:2110:5aee with SMTP id n10-20020a056402060a00b0055821105aeemr340950edv.10.1704808360990;
        Tue, 09 Jan 2024 05:52:40 -0800 (PST)
Received: from [192.168.50.250] (c-x59968899.customers.hiper-net.dk. [89.150.136.153])
        by smtp.gmail.com with ESMTPSA id fd18-20020a056402389200b005581573e251sm517281edb.2.2024.01.09.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:52:40 -0800 (PST)
Message-ID: <f54ebeee47094be2c93c23a29c4998056c653f08.camel@gmail.com>
Subject: Re: [PATCH v2 10/15] media: intel/ipu6: add input system driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Tue, 09 Jan 2024 14:52:39 +0100
In-Reply-To: <20231024112924.3934228-11-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-11-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bingbu,

On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Input system driver do basic isys hardware setup and irq handling
> and work with fwnode and v4l2 to register the ISYS v4l2 devices.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Reported-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 1345 ++++++++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys.h |  201 ++++
>  2 files changed, 1546 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
>=20
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci=
/intel/ipu6/ipu6-isys.c

...

> +static void isys_notifier_cleanup(struct ipu6_isys *isys)
> +{
> +	v4l2_async_nf_unregister(&isys->notifier);
> +	v4l2_async_nf_cleanup(&isys->notifier);
> +}
> +
> +static int isys_register_devices(struct ipu6_isys *isys)
> +{
> +	struct device *dev =3D &isys->adev->auxdev.dev;
> +	struct pci_dev *pdev =3D isys->adev->isp->pdev;
> +	int ret;
> +
> +	isys->media_dev.dev =3D dev;
> +	media_device_pci_init(&isys->media_dev,
> +			      pdev, IPU6_MEDIA_DEV_MODEL_NAME);
> +
> +	strscpy(isys->v4l2_dev.name, isys->media_dev.model,
> +		sizeof(isys->v4l2_dev.name));
> +
> +	ret =3D media_device_register(&isys->media_dev);
> +	if (ret < 0)
> +		goto out_media_device_unregister;
> +
> +	isys->v4l2_dev.mdev =3D &isys->media_dev;
> +	isys->v4l2_dev.ctrl_handler =3D NULL;
> +
> +	ret =3D v4l2_device_register(dev->parent, &isys->v4l2_dev);
> +	if (ret < 0)
> +		goto out_media_device_unregister;
> +
> +	ret =3D isys_register_video_devices(isys);
> +	if (ret)
> +		goto out_v4l2_device_unregister;
> +
> +	ret =3D isys_csi2_register_subdevices(isys);
> +	if (ret)
> +		goto out_isys_unregister_video_device;
> +
> +	ret =3D isys_csi2_create_media_links(isys);
> +	if (ret)
> +		goto out_isys_unregister_subdevices;
> +
> +	ret =3D isys_notifier_init(isys);
> +	if (ret)
> +		goto out_isys_unregister_subdevices;
> +
> +	return 0;
> +
> +out_isys_unregister_subdevices:
> +	isys_csi2_unregister_subdevices(isys);
> +
> +out_isys_unregister_video_device:
> +	isys_unregister_video_devices(isys);
> +
> +out_v4l2_device_unregister:
> +	v4l2_device_unregister(&isys->v4l2_dev);
> +
> +out_media_device_unregister:
> +	media_device_unregister(&isys->media_dev);
> +	media_device_cleanup(&isys->media_dev);
> +
> +	dev_err(dev, "failed to register isys devices\n");
> +
> +	return ret;
> +}
> +
> +static void isys_unregister_devices(struct ipu6_isys *isys)
> +{
> +	isys_unregister_video_devices(isys);
> +	isys_csi2_unregister_subdevices(isys);
> +	v4l2_device_unregister(&isys->v4l2_dev);
> +	media_device_unregister(&isys->media_dev);
> +	media_device_cleanup(&isys->media_dev);
> +}

...

> +static void isys_remove(struct auxiliary_device *auxdev)
> +{
> +	struct ipu6_bus_device *adev =3D auxdev_to_adev(auxdev);
> +	struct ipu6_isys *isys =3D dev_get_drvdata(&auxdev->dev);
> +	struct ipu6_device *isp =3D adev->isp;
> +	struct isys_fw_msgs *fwmsg, *safe;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < IPU6_ISYS_MAX_STREAMS; i++)
> +		mutex_destroy(&isys->streams[i].mutex);

In my testing with IPU4, I had to move these mutex_destroy's to the end
of isys_remove. If we're streaming, they are needed, presumably until
isys_unregister_devices is called.

> +
> +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
> +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> +			       fwmsg, fwmsg->dma_addr, 0);
> +
> +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
> +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> +			       fwmsg, fwmsg->dma_addr, 0);
> +
> +	isys_iwake_watermark_cleanup(isys);
> +	isys_notifier_cleanup(isys);
> +	isys_unregister_devices(isys);

Again in IPU4 testing:
I get crashing in `stop_streaming` when unbinding during streaming. If
I move isys_unregister_devices before isys_notifier_cleanup, this no
longer happens.

> +
> +	cpu_latency_qos_remove_request(&isys->pm_qos);
> +
> +	if (!isp->secure_mode) {
> +		ipu6_cpd_free_pkg_dir(adev);
> +		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
> +		release_firmware(adev->fw);
> +	}
> +
> +	mutex_destroy(&isys->stream_mutex);
> +	mutex_destroy(&isys->mutex);
> +}

/Andreas

