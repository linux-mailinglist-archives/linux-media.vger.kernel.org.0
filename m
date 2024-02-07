Return-Path: <linux-media+bounces-4789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 332A284C7A4
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD2DA1F2A3B3
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC192555B;
	Wed,  7 Feb 2024 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZXTgUeV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D0D2C6B5
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707298580; cv=none; b=UXsYLiLuJuaN8dYXDEWTiomdgEkxMFDjj6GfBJnQ1riWdgNPAK82C5yVjsRUCxPL8XFUOXjMShqCFg3253ZVeWk5PClM/N/mz0mrEmDpCW0A/FB6mSl/P66r5atsRNo6vuEluH6fO8WfVtWpGypkV+xOZJVyWKztdlQ+4FT7mjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707298580; c=relaxed/simple;
	bh=twnrwsvtl41sM/hN5AD0mat9SXYxMrdvkA8BYSeCgUs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fT3EuDqbk6uuSgPXs945lFbE7sImSyR4KiqRlBrrl32xGFWsara6udtYAqW/al9TsQ8HFsUFR2A3douymS7uQUyZKB7jbQEkG4A6CUwajrx62jMI896kVq6JpEzDKivSKls7t9jDHIQjJd9kppGtDqyVQMzT8Rs4V3LexRHR/qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZXTgUeV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a36126ee41eso54436866b.2
        for <linux-media@vger.kernel.org>; Wed, 07 Feb 2024 01:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707298577; x=1707903377; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I69AXfDu8JHBJv3Ewq03JkOBRw7iCOArsMqUOKIeY7E=;
        b=DZXTgUeVVupKDVOl91YYslWS/s3S2V9e1EdMlkew72zfZ0p6BbcaogVvrdq5UD3RhD
         +7n5FOCxx4TbqkY3nI7AUMtR57k6U0bFywgBayKJxxxhhjNSYpg6bmoRw1xmT/Undf1W
         7FvLwB8Lzbh8sVZL03RAuFUZfT3kNlAj96mYCvFM++ZthnAu6P28R0GeJ/4YISyUaWYo
         5Cb3KAxHWTy6GTB0DhY2gGbExNpa1H9naK7CKB6a5NsRsZo4FmKS+kTi2JDuSFHhYvAh
         qA7P8NGzec+hCz6jLQE6NYBAqJYedXdYe03RIstovlPUsQwdl5rxnEOXxKI3CBpaaNk4
         t4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707298577; x=1707903377;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I69AXfDu8JHBJv3Ewq03JkOBRw7iCOArsMqUOKIeY7E=;
        b=n5VKKi99eVAA9fzi8dmRhSsCdyzkPpUrwo4LMs6/yFTA26PijLzrBH0+CIC8jS+vRh
         sZnehr6YHmdO0bM1t3MM2LuZjzw7r1q0igYtGvFJprTgbBAHftOPnty6MhyINO86+moL
         Tj20cqHMujf7vTt1VUzWc9RALFSO6EkZdB6s5ZYHRgyAtqHSV4ztGqGje182ShdzvIUI
         HUugroup3rNZat9tPuEyTTSekkeq6ejBmi5hvHhdRzTIpxWlqLnuOfzo1HceTvy+Spdj
         jUIhU4Dn98KRpRSvtgi9iG8BGElUiktEEvtDcWL1NZfDKBOyb5XNcuhXjgNIKO+HgTZF
         ObbQ==
X-Gm-Message-State: AOJu0Yw6n08/yNp+NyC6JkLbqbuRZE4LSEia3KI8Aiu4AIvqMKj251yd
	+uzPOarUmNUzq0nD248ov+FHv2q5as3Yv5KnJO8See66A2Nc6b81
X-Google-Smtp-Source: AGHT+IE5J8N25I9Zk2f/SeNAvekp7xIfC5kN2SPnE94DFuY8nYfpcPe/LVUVvBJHiXbK1Y0mZ7xDog==
X-Received: by 2002:a17:907:7784:b0:a37:31c2:773a with SMTP id ky4-20020a170907778400b00a3731c2773amr3139044ejc.0.1707298576992;
        Wed, 07 Feb 2024 01:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUn6sfgDGpNjaph8FgZPlxnwvYUAD94//xiMlgxJ7G0nhrn+V6abZEH3NY4MitQZ9Hs/aZkQz8RS28zBH3vPJiJrggUa2aF8aXFQs2alrTMfdFXODhqnUja6Mb3RTgebc1P0iaf19aOzXPTBNlWr3Vjwr1lTG2FZ7D611/z6tFbeum/EGq0425YR0xyylERqSGkZhl6pQBj4zcPLKUjGGIwfK1cmetjLuXpxUZ2d3/DuAwQUX3NPtfedyZ3zEvH+K6UtNAX8XvSLWZGOfME721K3y3kGbTiH8P3n9gcX36vyptAo3GDq/Fj7LXlE2Iqola1dimqdjIHaM1CTaIH1B0CWbU9XyN+6uhLHiqCgG2sE/7G/NI0D24YCNpn98T5p5KatN3W2vEvrdW1BYCDcOj8CLA8Mwj4I/cZGk10sOfUUOBLXbHmjqC3h4OuNa3xijnxJ8XMPspC3cC8TSufKczVbgD3nnY2hqSgP9rnHO2iFYLkluBjahzdXw==
Received: from [192.168.50.250] (c-x5996889d.customers.hiper-net.dk. [89.150.136.157])
        by smtp.gmail.com with ESMTPSA id vk4-20020a170907cbc400b00a360239f006sm549744ejc.37.2024.02.07.01.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 01:36:16 -0800 (PST)
Message-ID: <f3fe18c6857982d8ff862566bc7d6511225d9193.camel@gmail.com>
Subject: Re: [PATCH v3 10/17] media: intel/ipu6: add input system driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com, 
 tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
 senozhatsky@chromium.org,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Wed, 07 Feb 2024 10:36:15 +0100
In-Reply-To: <20240111065531.2418836-11-bingbu.cao@intel.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
	 <20240111065531.2418836-11-bingbu.cao@intel.com>
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

Thank you for the patch series, I haven't had a chance to look at v3 in
detail yet, so this is just a small comment from my testing on v2 +
IPU4 hacks, which I can see is also here in v3.

 On Thu, 2024-01-11 at 14:55 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Input system driver do basic isys hardware setup and irq handling
> and work with fwnode and v4l2 to register the ISYS v4l2 devices.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 1353 ++++++++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys.h |  207 ++++
>  2 files changed, 1560 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
>=20
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci=
/intel/ipu6/ipu6-isys.c

...

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
> +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
> +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> +			       fwmsg, fwmsg->dma_addr, 0);
> +
> +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
> +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> +			       fwmsg, fwmsg->dma_addr, 0);

I experienced a crash in ipu6_get_fw_msg_buf when unbinding the PCI
driver while streaming.

It happens because the above two lists are still used at this point. I
believe it is safe to free the fw msgs after the
isys_unregister_devices(isys) call below.

> +
> +	isys_unregister_devices(isys);
> +	isys_notifier_cleanup(isys);
> +
> +	cpu_latency_qos_remove_request(&isys->pm_qos);
> +
> +	if (!isp->secure_mode) {
> +		ipu6_cpd_free_pkg_dir(adev);
> +		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
> +		release_firmware(adev->fw);
> +	}
> +
> +	for (i =3D 0; i < IPU6_ISYS_MAX_STREAMS; i++)
> +		mutex_destroy(&isys->streams[i].mutex);
> +
> +	isys_iwake_watermark_cleanup(isys);
> +	mutex_destroy(&isys->stream_mutex);
> +	mutex_destroy(&isys->mutex);
> +}

/Andreas

