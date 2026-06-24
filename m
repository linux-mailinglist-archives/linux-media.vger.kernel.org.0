Return-Path: <linux-media+bounces-65529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iU97O6OtO2rVbAgAu9opvQ
	(envelope-from <linux-media+bounces-65529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:12:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D46BD3CA
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:12:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=anUHdbki;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65529-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65529-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2216301E7FE
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFEC3AFCF4;
	Wed, 24 Jun 2026 10:12:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AFC223708
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 10:12:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295966; cv=none; b=KqKgGB8q1aWf5HvBKT7d2z1zXd1m4GEdgnky2OdMbmhbpPur7petNaNkYLZEMUXBZ2DvG82vehq97S8iqWy6VQXn/MT29j5o7J3KvtTVi85DHCilEuFUGaOj2pqEy6yD1UHuIz/HvHlUJiQ1yHL05vednoosyLqmlDCiZ3mTdHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295966; c=relaxed/simple;
	bh=rTMju9y+vBe+kbCwR8U9jD+aYsjLpIeU0FKl3yEXFYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhcuiTVUeb6+Yte+wQ24UCW/XdcpwFUM4Jmfa+6vnqSc3g9E/xtkLRA14yxyjVN6vA3T8GH2T+DUIi9xGFW8Jmf7m8gKnG5HuS3t8kkFMOEWRSN7daddl4G2RIRIBOMPFCKueKJAgm0r4EkCfY1zEOYoVyK8xwq70IGU+43CR6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anUHdbki; arc=none smtp.client-ip=209.85.167.47
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad68a86487so138538e87.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 03:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782295963; x=1782900763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fA7npl0ddYHCFXjReOHy/T2fA2Kbawx3VrcpEoijXM=;
        b=anUHdbkiDiysPwaaibeG9yv+nw06bneKQ3LaDIKXPKYYOpMgU5yEk9zLR8NObaNOOv
         cDsI871VzCVsCRxFCjlEKAkNolZwJVb95AbN7Gw0dPni+f+rBrQSlGln9kGOuNtWqI0m
         VvOcIeax3942H5RUVDQjhsV6CQOfF4zrgVxt1i88fbjWvTz3hEuG66dSkQ39f5nhVjKE
         d0B6S1I15CSMmVr7+We3Yp4MDyLdbG1Ek17Mfl3TcKumdpQQ+nxkZCzoTt0uzTQv0b4+
         1k8+yrg8nqIsz1MK0IODHkcZpn8Ks5LZsr+xQY18d95qalWGJyvrhCgoAc6xXvArA/uJ
         xbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782295963; x=1782900763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fA7npl0ddYHCFXjReOHy/T2fA2Kbawx3VrcpEoijXM=;
        b=UT766iqPZiTw15+ZyshdKGNSCjZvsf8rWYrvfW7Y1FXFKuiKjuaHK4JpWHvLBhPP6e
         5EKqLm8p5y8dT4IJTCJRW4hpMRYFDaB5jpDOvTVofGNlzWbK4IpnlNpqUc0UqEI2GrEa
         CETgb/vafEtdOXNDR4CRww4EmQUI1Jo0x9ceM/wXQgJ4feg2GPQ/XbbWEr7zu/AwX805
         jiKc++Av6u+ddgCjthA5wJ/syqFMNQlLVm1+wfncGEO15R72kfVetZeXrxUTRnOICVAN
         cL8G01giwZgOCL/KGjlY2NhAhpk/Xl0zF/2pKJV9DXpvNtDcNluvuBFx7BjCgexYkMc0
         uUJw==
X-Gm-Message-State: AOJu0Yy1N4vACio5h0zSFeAyErdyn7JZR0rd/OZJYr+EAQSY03sXnalm
	U0+B0kcnWImIbMIwCiZCAYsaljuWEryfmEKKWx9MpBdpP+nxjTcgVt2Q/skEtKbCbHU=
X-Gm-Gg: AfdE7cm3jHh5/Q02+9lXoLDV7Synh8BdknxtMrrJ7ac1WqNTqtlHychn60NVxJqeSwd
	48CRWFCjtWFGeJtvh3RuUpYZuMVxbN+HyXXtcs/lEOb+PmCfOEVcd5WARRajD2hWahiwnHIMbfw
	/U3uV2p3ziqnCjvDk7lrenJowD3paGYRN8qhGWwwAgUD6BJ6pyWyAU+EaUX/PsN65VbzjZybTGi
	/MehV1bfJtcCiUTc3WLRfH/B9kr3O2vmtQW1+M9vly3wsR5B/5L8NJGTRNY8IsMkDf/REKKDg6P
	rWGItCyld4JEcIslJGniqIWed9gckXDYz6t+mGz2stPXqJ8gwUkjhI/qGMfASFMfqfJgsptPoQg
	a2MOVkdCs4rZInMugM5gzTDeP1AsWnpsFoIjd6B4JtRR7tsCd9MJ5C3OmreojfrOVO4PFS2MU2b
	CsKd7KkRf0mEE7YkRQsycZICsQSJ1zZ8eWt2oESwNFe/ku9o2Qb1y+1uZnuAYx4TkSxCbe2bEb0
	HmImw==
X-Received: by 2002:a05:6512:1294:b0:5a8:6f01:e1a0 with SMTP id 2adb3069b0e04-5ad68a363b9mr1198795e87.3.1782295962527;
        Wed, 24 Jun 2026 03:12:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69550ff7sm1637116e87.20.2026.06.24.03.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 03:12:41 -0700 (PDT)
Message-ID: <e74e992a-9358-40c5-a685-833a8f135dc0@linaro.org>
Date: Wed, 24 Jun 2026 13:12:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh
 <serin.yeh@intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>,
 Damjan Georgievski <gdamjan@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260624033508.27391-1-hpa@redhat.com>
 <20260624033508.27391-4-hpa@redhat.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260624033508.27391-4-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65529-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,siliconsignals.io,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E9D46BD3CA

On 6/24/26 06:35, Kate Hsuan wrote:
> Add a new driver for Sony imx471 camera sensor. It is based on
> Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found
> in the following URL.
> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c
> 
> This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 laptops
> and it is a part of IPU7 solution. The driver was tested on Lenovo X1
> Carbon G14, X9-14 and X9-15 laptops.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Please find a few minor nitpicks below.

> ---
>   MAINTAINERS                |   6 +
>   drivers/media/i2c/Kconfig  |  10 +
>   drivers/media/i2c/Makefile |   1 +
>   drivers/media/i2c/imx471.c | 971 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 988 insertions(+)
>   create mode 100644 drivers/media/i2c/imx471.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b4560681b51..586958b1816d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25219,6 +25219,12 @@ T:	git git://linuxtv.org/media.git
>   F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>   F:	drivers/media/i2c/imx415.c
>   
> +SONY IMX471 SENSOR DRIVER
> +M:	Kate Hsuan <hpa@redhat.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/imx471.c
> +
>   SONY MEMORYSTICK SUBSYSTEM
>   M:	Maxim Levitsky <maximlevitsky@gmail.com>
>   M:	Alex Dubov <oakad@yahoo.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5d173e0ecf42..b7199f9f5a0c 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -287,6 +287,16 @@ config VIDEO_IMX415
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called imx415.
>   
> +config VIDEO_IMX471
> +	tristate "Sony IMX471 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony
> +	  IMX471 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx471.
> +
>   config VIDEO_MAX9271_LIB
>   	tristate
>   
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index e45359efe0e4..acbd321fc12e 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) += imx335.o
>   obj-$(CONFIG_VIDEO_IMX355) += imx355.o
>   obj-$(CONFIG_VIDEO_IMX412) += imx412.o
>   obj-$(CONFIG_VIDEO_IMX415) += imx415.o
> +obj-$(CONFIG_VIDEO_IMX471) += imx471.o
>   obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>   obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>   obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> new file mode 100644
> index 000000000000..1e1bff69ea3d
> --- /dev/null
> +++ b/drivers/media/i2c/imx471.c
> @@ -0,0 +1,971 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * imx471.c - imx471 sensor driver
> + *
> + * Copyright (C) 2025 Intel Corporation
> + * Copyright (C) 2026 Kate Hsuan <hpa@redhat.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/unaligned.h>

No declarations coming from linux/unaligned.h header are used in the driver.

> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>

No declarations coming from media/v4l-event.h header are used in the driver,
likely it's intended to include media/v4l2-subdev.h instead.

> +#include <media/v4l2-event.h>

No declarations coming from media/v4l-event.h header are used in the driver.

> +#include <media/v4l2-fwnode.h>
> +
> +#define IMX471_REG_MODE_SELECT			CCI_REG8(0x0100)
> +#define IMX471_MODE_STANDBY			0x00
> +#define IMX471_MODE_STREAMING			0x01
> +
> +/* Chip ID */
> +#define IMX471_REG_CHIP_ID			CCI_REG16(0x0016)
> +#define IMX471_CHIP_ID				0x0471
> +
> +/* V_TIMING internal */
> +#define IMX471_REG_FLL				CCI_REG16(0x0340)
> +#define IMX471_FLL_MAX				0xffff
> +
> +/* Exposure control */
> +#define IMX471_REG_EXPOSURE			CCI_REG16(0x0202)
> +#define IMX471_EXPOSURE_MIN			1
> +#define IMX471_EXPOSURE_STEP			1
> +#define IMX471_EXPOSURE_DEFAULT			1270
> +
> +/* Default exposure margin */
> +#define IMX471_EXPOSURE_MARGIN			18
> +
> +/* Analog gain control */
> +#define IMX471_REG_ANALOG_GAIN			CCI_REG16(0x0204)
> +#define IMX471_ANA_GAIN_MIN			0
> +#define IMX471_ANA_GAIN_MAX			800
> +#define IMX471_ANA_GAIN_STEP			1
> +#define IMX471_ANA_GAIN_DEFAULT			0
> +
> +/* Digital gain control */
> +#define IMX471_REG_DPGA_USE_GLOBAL_GAIN		CCI_REG16(0x3ff9)
> +#define IMX471_REG_DIG_GAIN_GLOBAL		CCI_REG16(0x020e)
> +#define IMX471_DGTL_GAIN_MIN			256
> +#define IMX471_DGTL_GAIN_MAX			4095
> +#define IMX471_DGTL_GAIN_STEP			1
> +#define IMX471_DGTL_GAIN_DEFAULT		256
> +
> +/* HFLIP and VFLIP control */
> +#define IMX471_REG_ORIENTATION			CCI_REG8(0x0101)
> +#define IMX471_HFLIP_BIT			BIT(0)
> +#define IMX471_VFLIP_BIT			BIT(1)

IMX471_HFLIP_BIT and IMX471_VFLIP_BIT macro do not have any users in the driver.

> +
> +/* Test Pattern Control */
> +#define IMX471_REG_TEST_PATTERN			CCI_REG8(0x0600)
> +#define IMX471_TEST_PATTERN_DISABLED		0
> +#define IMX471_TEST_PATTERN_SOLID_COLOR		1
> +#define IMX471_TEST_PATTERN_COLOR_BARS		2
> +#define IMX471_TEST_PATTERN_GRAY_COLOR_BARS	3
> +#define IMX471_TEST_PATTERN_PN9			4

IMX471_TEST_PATTERN_* macro do not have any users in the driver.

> +
> +/* default link frequency and external clock */
> +#define IMX471_LINK_FREQ_DEFAULT		200000000LL
> +#define IMX471_EXT_CLK				19200000
> +#define IMX471_LINK_FREQ_INDEX			0

Please drop IMX471_LINK_FREQ_INDEX macro along with .link_freq_index from
struct imx471_mode.

-- 
Best wishes,
Vladimir

