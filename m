Return-Path: <linux-media+bounces-65175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s73dBKrOM2pfGgYAu9opvQ
	(envelope-from <linux-media+bounces-65175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:55:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A21CB69F884
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:55:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=vituv40R;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65175-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65175-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E455930D72AD
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE1A3EFFA8;
	Thu, 18 Jun 2026 10:51:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7253EFFB7
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:51:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779878; cv=none; b=VlY4dQweGNpTZTmLfZGSpU2yyhJ37+PxPtkWz6a7j2NiRKBgL7dKujbcIVuxZI7dZtfVIsM0+eLdOXNz/qFXyOt0f4A7aAVVyd5tEJZMYTCI6ni4H9u97egm4WgxI6a3RQzFC3BpI6LJJX58VFNFV3u9IKgtsTYlo338BmiQlHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779878; c=relaxed/simple;
	bh=GtAjYXmPGxnwaGEw/Du49sp6idTnlDczLHJXmY2DajA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIoOJPcbdWa2uvbs4M8biOng1rN9AeWaxY4qJLis5ibLW9SaZY7Yv7TfuAli/DKj8NuV/YCtEGKG/InUaU3EQ9y/nODNNgojiwRgbmlNcBheHM2YZ6w32PZBo+LHjRnVSVQ1Diz+3BWvm5ATzyIsPvjVUc3QzA78AUgpk54ye8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vituv40R; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa68e5175dso127979e87.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781779874; x=1782384674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNAKlXEYaxZFctOwMRDsRkHXgZuOff9zmqCb7Yt/btk=;
        b=vituv40RXz2rbZTD8iv7pmkp5cHQK6eDQgh8xgImIKX1xk1emY5fYwzXzevFZerCCl
         s3DLxZuOfALLmqcanI6c/jLpi0w4nkyKfYn9GxhyciodTsiRnpOjrBD9NrPgPN4KOwWi
         Gj3qdm4ZoX5ZhPNSi8PcAF1x1VynNFyC1IXXH5Ql+KeWa4qMBpPg9gt6K5SFSZieEwOd
         V9mYmKOKkE07dsHdqOMPvtqgQ1iN8430L2SPtPCn+iEC/UDG2lN2JBMxK79Dj2COwhOK
         kNYCBYqj4ohSndpji/ztM3gz4f7/WvBTpFCXUWzdBNEokZjFaVgqRoIc0CMyZYvH9Ukv
         hMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779874; x=1782384674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNAKlXEYaxZFctOwMRDsRkHXgZuOff9zmqCb7Yt/btk=;
        b=JR5Oz3BmFPUFZYLJM4xVH2exwBoEBQTjQs9knuwzOJ8HMen3IzrY5opELDAjBSJexi
         upfKAzDil7AQ3bcO2JHQdxKZmM68J6Mb6RSs+engbnyxmXt+icbtjCojvOr7LSCpahVo
         +iAGsfKIZ2Kz+Ahy3iZ8Y/1bnBLAYVNnIIC3ptfeSoPNoDswnqid3IozxiR7PDP8LE+r
         KGGnwIecfeE1y3u2xFFvqhsHlLDMez9M473Wd75ogy0SsBlA0m4imfE7FR/Ydvpda9AY
         BUp1UUfkYl9T/pyTtnpfTbDUxJSF8v64IRyWj6afL1op3KrZJptB+0yEfWWWiovuBeVJ
         VyGQ==
X-Gm-Message-State: AOJu0YyZOfQbmT2tTS7804ozTRrDLYfwIFgCeYYq9RrzXTbjDEfEWkwx
	MzBhQSVktKRkGINeLYqE4RbTlkTklEDivYArkkREAT6hIDUqTIrutTrzH79WljmjCj8=
X-Gm-Gg: AfdE7cl90sebYm3hSDN+DPE/wel4wFYGdTZZCXezpJGQDKFHrEkAwcQI3a/9anujB7U
	cJx6YVmsJ7Uqs8on7R89Se64Djt1Ox9d6qG2byACOrtdwjf+uL7vKbDeLE9hr0iNiWEyY/ZxTkB
	ssni81G+lU8rmz/AHmkYxlib8i0N3wrbcw7edndmf6mnzHWCy0KDahTpkBOVlH6Xz35nnmpE3Os
	KFhQ+ZF2OfUnqiEXw7GrjOdcYXnW2Kt8Q3vGVE3nIBBNSTsSqAa7s/lxcthmP60tFfAMdoUSbhY
	QeZmfgv2Vszs9KYEc/YJiOs6AKPwcvKFQ0hUHCPqPOt2kuZwk1CsmxfS6y4+1I1p0Je/irZTEP2
	RDRAHxnIyK/AApLYmx/6TR7UfKodz+dxGVXybDFIHuKkpQiNMPbBtFijUqx5BL3Rke1ODTNiPJd
	sGka1QwQHbZnBr2nvQ4mn3Lr6nluaZtAeXyb2mwhH9lfjMGeX+ZVI7n4Mb0/ufPdsW0N20m42zX
	BCbYg==
X-Received: by 2002:a2e:bd09:0:b0:396:92eb:36a0 with SMTP id 38308e7fff4ca-399776a5fb2mr5207351fa.0.1781779873612;
        Thu, 18 Jun 2026 03:51:13 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a6c4sm24284941fa.29.2026.06.18.03.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:51:13 -0700 (PDT)
Message-ID: <1a57863c-831a-411c-a0ae-da3d4f1fd6a0@linaro.org>
Date: Thu, 18 Jun 2026 13:50:58 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65175-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A21CB69F884

Hello Wenmeng.

On 6/18/26 13:37, Wenmeng Liu wrote:
> Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
> the 640x480 (VGA) resolution.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   MAINTAINERS                 |   1 +
>   drivers/media/i2c/Kconfig   |  10 +
>   drivers/media/i2c/Makefile  |   1 +
>   drivers/media/i2c/og0va1b.c | 867 ++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 879 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5aa846c8479b20651291d5bd2e316308310f826c..85a06eb9eacc410a565b80d56979eaa565515d0e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19891,6 +19891,7 @@ M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
> +F:	drivers/media/i2c/og0va1b.c
>   
>   OMNIVISION OG0VE1B SENSOR DRIVER
>   M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5d173e0ecf424f2f204f8d426be818e44357f8e4..56680772f5f47b4629c4e17f5a5feba08b1d94fc 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -363,6 +363,16 @@ config VIDEO_OG01A1B
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called og01a1b.
>   
> +config VIDEO_OG0VA1B
> +	tristate "OmniVision OG0VA1B sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the OmniVision
> +	  OG0VA1B camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called og0va1b.
> +
>   config VIDEO_OG0VE1B
>   	tristate "OmniVision OG0VE1B sensor support"
>   	select V4L2_CCI_I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index e45359efe0e41e13e3c0869e5ead7d6cf4aca3a7..c60851c7fe07e3bdc511c5f482525ba7a044f48e 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>   obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>   obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>   obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
> +obj-$(CONFIG_VIDEO_OG0VA1B) += og0va1b.o
>   obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
>   obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>   obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
> diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f0505b7ba7f329ad57ffafa8f90a24204f002d3c
> --- /dev/null
> +++ b/drivers/media/i2c/og0va1b.c
> @@ -0,0 +1,867 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OmniVision OG0VA1B Camera Sensor Driver
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define OG0VA1B_REG_CHIP_ID		CCI_REG16(0x300a)
> +#define OG0VA1B_CHIP_ID			0xC756

This is the same chip id as of the OG0VE1B sensor device.

What's the difference between these two sensors, and do you find it possible
to add support of OG0VA1B sensor/modes into OG0VE1B sensor driver? Or is
it just the same device?

Hardware specifics described in dt changes also does not show a difference
in comparison to ovti,og0ve1b.yaml.

-- 
Best wishes,
Vladimir

