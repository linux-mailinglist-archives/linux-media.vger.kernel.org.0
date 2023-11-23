Return-Path: <linux-media+bounces-875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE1F7F5AE7
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 10:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A16F281756
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 09:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4FF208A3;
	Thu, 23 Nov 2023 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VitCJH1q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5807189
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 01:17:20 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a002562bd8bso131731366b.0
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 01:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700731039; x=1701335839; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QUi6EEbbB/WIRbAW/KJEnKkzZk8ufxY+gZeolZyfw90=;
        b=VitCJH1qp4l9lCp+amqBlGUR69E0xi7pDnHR1XkSen+z/GAHvvcRK74ABiBQjofvC0
         uPpDhuzKFJtcDdOLCFEQXN7xcmucYlZu0RDbwA2GruzpUqloLcrsDWJsZj4EA/zb7DbN
         rW8qFAZv7wUIXfpfvTrfSTn1KvCi52/k7N2+oNXrMkzToDKZ2uoxJ4S2k7X1yrBycHZL
         LIRUlktXEU4gVsbNOpJ2zBj/w3hgok8nDdQzbvwAnFJecJGuABKz6lCU00K+39VZq0jG
         BRlAOznxgNPfojwANav5pPSyyFG8J43u5zzwiiNchnPp/Zg+6UlCcbpd/8FS9TtuGVmO
         dFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700731039; x=1701335839;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUi6EEbbB/WIRbAW/KJEnKkzZk8ufxY+gZeolZyfw90=;
        b=nxwot4Q4DxnTHsR6iQU9zk1iZi8DOdDfWU+0KPMA+nITtY5R2Y0yk1fm7aX4j0t0vi
         UITO3ZpqZZWrPZjAOLOBlQ891P7um7tW4muxj9ZCq9RVt64cIyaLmJM1v6i/x3H/Vkb+
         Bnxjx4OaLv7MrI3ehdUtq6fNAVKTO0nadWqFnqidYZ3Yvt0Q/4P8wPqQTUpkNBLzGUas
         8L5JJ+2RU+701cSjr3ma3G1jDn/HY2RBjqrGYNOyI14sMze1OAZythDm4MBqMd7svszL
         3EWFKNB8YO8IoayVbV6MiPB9Tu2TEfZ/X1AAy/KLMhcquFCy1O2XRq/RfKulSMj94aEj
         6WgA==
X-Gm-Message-State: AOJu0YzLxafWb4p/trKSNcjXs/Vi00OuRqqmNSCLs4k95zlAZRK+VgCJ
	4/mcEqSq2twVdRKPvPBZo98VuZv3OSwxmA==
X-Google-Smtp-Source: AGHT+IGezrLuUK/NYN3Bz7EPeMPS9TOKQu2stLPQksp2gRQmSv/QufiBxFB7r8VbnoKDfdXgG/MPJQ==
X-Received: by 2002:a17:906:5da:b0:9fe:cfc:b60c with SMTP id t26-20020a17090605da00b009fe0cfcb60cmr1621681ejt.28.1700731038865;
        Thu, 23 Nov 2023 01:17:18 -0800 (PST)
Received: from [192.168.50.250] (c-x599688ac.customers.hiper-net.dk. [89.150.136.172])
        by smtp.gmail.com with ESMTPSA id a4-20020a170906468400b009dd678d7d3fsm523283ejr.211.2023.11.23.01.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:17:18 -0800 (PST)
Message-ID: <5d6dd0643db42ba818383f3d27c99859a5d270ff.camel@gmail.com>
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Thu, 23 Nov 2023 10:17:17 +0100
In-Reply-To: <20231024112924.3934228-2-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-2-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Intel Image Processing Unit 6th Gen includes input and processing
> systems
> but the hardware presents itself as a single PCI device in system.
>=20
> IPU6 PCI device driver basically does PCI configurations and load
> the firmware binary, initialises IPU virtual bus, and sets up
> platform
> specific variants to support multiple IPU6 devices in single device
> driver.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Suggested-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
> ---
> =C2=A0.../media/pci/intel/ipu6/ipu6-platform-regs.h | 179 ++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu6.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 952
> ++++++++++++++++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu6.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 352 +++++++
> =C2=A03 files changed, 1483 insertions(+)
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.=
h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
...
> +static void ipu6_internal_pdata_init(struct ipu6_device *isp)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 hw_ver =3D isp->hw_ver;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isys_ipdata.num_parallel_strea=
ms =3D IPU6_ISYS_NUM_STREAMS;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isys_ipdata.sram_gran_shift =
=3D IPU6_SRAM_GRANULARITY_SHIFT;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isys_ipdata.sram_gran_size =3D=
 IPU6_SRAM_GRANULARITY_SIZE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isys_ipdata.max_sram_size =3D =
IPU6_MAX_SRAM_SIZE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isys_ipdata.sensor_type_start =
=3D
> IPU6_FW_ISYS_SENSOR_TYPE_START;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isys_ipdata.sensor_type_end =
=3D IPU6_FW_ISYS_SENSOR_TYPE_END;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isys_ipdata.max_streams =3D IP=
U6_ISYS_NUM_STREAMS;

num_parallel_streams and max_streams are set to the same value here and
to another (but also equal) value for ipu6se.

num_parallel_streams is then passed through ipu6_fw_isys_init to
ipu6_isys_fwcom_cfg_init to then be clamp'ed to 1..max_streams. It
seems like they are the same, and thus a lot of code could be removed.

/Andreas

