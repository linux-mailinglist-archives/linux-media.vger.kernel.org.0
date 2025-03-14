Return-Path: <linux-media+bounces-28262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36EA61991
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 19:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 452C31754C9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 18:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8691F3BAE;
	Fri, 14 Mar 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GBSQLeMQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC72E3389
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741977367; cv=none; b=MeaM3V0Qg1/WI41FgGIYsw6woCKA9Cb/GzOz9YG0/LF27N67ULdAvY9DWN9Fx5WuC5xGw3XPSr2p7RghFs4qMU+A5uMTR9rF3z361yV6rhAEcmguIgcn626P2AA2L2vKO0Zcii4uSeS/Vt0iuqh45bZRxm4X3U83XTbAJeSBYbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741977367; c=relaxed/simple;
	bh=FkjYpZ8AMpNWOgP0sppWUw152NNm+86oQYuxbQ2qjqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMw2zZKa+W1WCBPwGriiq0yzEn7kn2YPHdhIpniaP/nJ/RfQhFRu3e9CYCvysnoa+jhoiav1+wxPZkTDK+V0ewx6skCJFywzo7kvlWNexZHIKjcCir7G0zNidQ1HHwmEDcfCX+1MI1au1KqsnrT7V2D3iutO6hcHUViExlh/sCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GBSQLeMQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741977363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oydeksvfwTAbWdnmEmANv4n9IpSha1AOTMmb7U17B9o=;
	b=GBSQLeMQiuvZkBFHrAb7M9vTQMefrfxsx9zmfRf2wVJnntIM+SSSC5eUF2QiQCMy/nlkae
	lQVEyBnKwgZsMoyjEIMFrAlvvpC9d6DJga/ZlhOZG5Zfs/shoCnG3rWZHoWAoUaNvJHt0+
	W8s0nY3gY8mcI26JHJ3DxzG0JTD6n6k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-hJ0mxzYXO8WaoVU9zHRJPA-1; Fri, 14 Mar 2025 14:36:01 -0400
X-MC-Unique: hJ0mxzYXO8WaoVU9zHRJPA-1
X-Mimecast-MFC-AGG-ID: hJ0mxzYXO8WaoVU9zHRJPA_1741977361
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac25852291cso226077766b.2
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 11:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741977360; x=1742582160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oydeksvfwTAbWdnmEmANv4n9IpSha1AOTMmb7U17B9o=;
        b=PJVmb+SBcBaSGhOE+HZoswIObM0SPjcuBz5AMLeGRsA6+SzfleQ/Bm+GIgg5Cqd1jP
         d7Wvj+kHxeNthrsnkD1otqnQqOn5jKkI4X5b0DeMuLvREB2X6O1dV6ELpqRCTKWLWhvM
         mzHvx15HSJgUnP0AJPqnifXHfEjVnmzrxq1U1xwPW/tTkHywxs11+wYrKfw5JcRtGwAQ
         CC+4Npxl+742+ke0+6npislz34KD4koctpZbA7+dWWWNMsmX3y+llFoq/v5Fukvq5ApS
         K+tJlg3ggvNbMD/Skl149cHVpPQOAQfplaiF0LCu5p5/fmMqj+CrDcGN6Q5HjpyvTxJn
         cUXg==
X-Forwarded-Encrypted: i=1; AJvYcCXOtcRsRRNUoZZeUSce00SnurWuo4Pj02XHn28i3I5PDkRS1YwaoqNNw4PKNNSqVBAw9YGT9pQIOzL8Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSskDUrnjmSiQV0mQRrtXiGHE/I2IlSjPs+qmMhtU7fR6g1OIO
	AkLhs2VJT0qxBbP580I+d1fMCAf6Z9gcC4qMD5Md6qAeIunWyd3iSQI5fEI4haOro2EBVKByoaY
	BxaPu2IBybQ9Jwbq3A8/tklNKnk+lR4SAyJvEeeyj3+quXSGXQPUcXa0m69D0
X-Gm-Gg: ASbGnctMQL3glxiHZkchSpN0wWaB0W1E+yzXgeVxddQ5BZeWyXKx5Xy74C4d3DCxT8f
	4onWX0nmsDPZ0h32MZKIlrKvAh18IzqeyRjath2w61pv3a0d0ECtfkm6PVNYZRVis++QmlTJG6t
	9j5veut8eg4ckVadS0gnycsAmZdw2LLT5tCtwCJxG8UvzCH7gE8M66gzkMMZlQh3qsBHrvqp8ze
	68Y39SJZ4welEX2qzDsECc5u5mosq/Mq+9/AojvbKh1wAw/axbQiGgtVmiSqk5B5Y7hvFW9rLhW
	IRT01L4pQz0pIqE6x2C/5c/6FepqIIi8twoW6k5jI4CxvLImYYzRqF4S+SbutOLbypbMSArkfiH
	UDK1otWjz7si39/xDDdk24iJjG/w6FT3qh8/g1Rf4lpzTIvich6OH7u2F6QnSxtNsgg==
X-Received: by 2002:a17:906:c10d:b0:ac2:9210:d96e with SMTP id a640c23a62f3a-ac3304412b9mr381494666b.43.1741977360278;
        Fri, 14 Mar 2025 11:36:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvu4CwwFbPS8zjO+dMLRC40KRc4wWNI8lXQgRzRq/0MYygI3U00kLQn5jlJ75wrfsP9FQQA==
X-Received: by 2002:a17:906:c10d:b0:ac2:9210:d96e with SMTP id a640c23a62f3a-ac3304412b9mr381490966b.43.1741977359642;
        Fri, 14 Mar 2025 11:35:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9dc8bsm259483266b.175.2025.03.14.11.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 11:35:59 -0700 (PDT)
Message-ID: <8cbaad74-19dd-40c0-af0c-b4a4f9a41c85@redhat.com>
Date: Fri, 14 Mar 2025 19:35:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/1] media: i2c: Add Omnivision OV02C10 sensor driver
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Ingvar Hagelund <ingvar@redpill-linpro.com>,
 Joachim Reichel <joachim.reichel@posteo.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hao Yao <hao.yao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250314101125.9853-2-hdegoede@redhat.com>
 <Z9QlNEP8aL1XdlAv@kekkonen.localdomain>
 <CAGadeg1evCB9+uyvAmkrGC6rnNo2yP4HKOji1U+ied6HrUQTgA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGadeg1evCB9+uyvAmkrGC6rnNo2yP4HKOji1U+ied6HrUQTgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Heimir,

On 14-Mar-25 7:27 PM, Heimir Thor Sverrisson wrote:
> Hi Hans,
> the v9 patch does not work on XPS 9440!\

Ok, lets try to pinpoint which of the patches in the broken
out v8 series breaks things then. Code-wise v9 is just all
of v8 in a single patch.

> The first two v8 patches work, but I've not got further in isolating the issue.

Do you mean that once you apply "[PATCH v8 03/14] media: ov02c10:
Fix hts for 2 lane mode" things break; or did you simply not get
around to test things 1 by 1 yet ?

Regards,

Hans




> On Fri, Mar 14, 2025 at 6:46 AM Sakari Ailus <sakari.ailus@linux.intel.com <mailto:sakari.ailus@linux.intel.com>> wrote:
> 
>     Hi Hans,
> 
>     Thanks for the update.
> 
>     On Fri, Mar 14, 2025 at 11:11:25AM +0100, Hans de Goede wrote:
>     > From: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com <mailto:heimir.sverrisson@gmail.com>>
>     >
>     > Add a new driver for the Omnivision OV02C10 camera sensor. This is based
>     > on the out of tree driver by Hao Yao <hao.yao@intel.com <mailto:hao.yao@intel.com>> from:
>     > https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c <https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c>
>     >
>     > This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
>     > driver and the libcamera software ISP code.
>     >
>     > Tested-by: Ingvar Hagelund <ingvar@redpill-linpro.com <mailto:ingvar@redpill-linpro.com>>
>     > Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com <mailto:heimir.sverrisson@gmail.com>>
>     > Co-developed-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>     > Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>     > ---
>     > Changes in v8 (Hans de Goede):
>     > - Many changes, so many that this has been posted as an incremental
>     >   series on top of v7. See individual commits for change details:
>     >   https://lore.kernel.org/linux-media/20250313184314.91410-1-hdegoede@redhat.com/ <https://lore.kernel.org/linux-media/20250313184314.91410-1-hdegoede@redhat.com/>
>     >
>     > Changes in v9 (Hans de Goede):
>     > - Squashed everything back into a single patch again
>     > - Dropped Heimir's and Stanislaw's Tested-by tags since much
>     >   has changed since v7
>     > ---
>     >  drivers/media/i2c/Kconfig   |   10 +
>     >  drivers/media/i2c/Makefile  |    1 +
>     >  drivers/media/i2c/ov02c10.c | 1012 +++++++++++++++++++++++++++++++++++
>     >  3 files changed, 1023 insertions(+)
>     >  create mode 100644 drivers/media/i2c/ov02c10.c
>     >
>     > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>     > index bb9ab2330d24..99a72b8ee45c 100644
>     > --- a/drivers/media/i2c/Kconfig
>     > +++ b/drivers/media/i2c/Kconfig
>     > @@ -365,6 +365,16 @@ config VIDEO_OV02A10
>     >         To compile this driver as a module, choose M here: the
>     >         module will be called ov02a10.
>     > 
>     > +config VIDEO_OV02C10
>     > +     tristate "OmniVision OV02C10 sensor support"
>     > +     select V4L2_CCI_I2C
>     > +     help
>     > +       This is a Video4Linux2 sensor driver for the OmniVision
>     > +       OV02C10 camera.
>     > +
>     > +       To compile this driver as a module, choose M here: the
>     > +       module will be called ov02c10.
>     > +
>     >  config VIDEO_OV08D10
>     >          tristate "OmniVision OV08D10 sensor support"
>     >          help
>     > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>     > index a17151bb3d49..191c1f7c3f50 100644
>     > --- a/drivers/media/i2c/Makefile
>     > +++ b/drivers/media/i2c/Makefile
>     > @@ -85,6 +85,7 @@ obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>     >  obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>     >  obj-$(CONFIG_VIDEO_OV01A1S) += ov01a1s.o
>     >  obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>     > +obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
>     >  obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>     >  obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
>     >  obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
>     > diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
>     > new file mode 100644
>     > index 000000000000..5626aa2fe62c
>     > --- /dev/null
>     > +++ b/drivers/media/i2c/ov02c10.c
>     > @@ -0,0 +1,1012 @@
>     > +// SPDX-License-Identifier: GPL-2.0
>     > +// Copyright (c) 2022 Intel Corporation.
>     > +
>     > +#include <linux/acpi.h>
>     > +#include <linux/clk.h>
>     > +#include <linux/delay.h>
>     > +#include <linux/gpio/consumer.h>
>     > +#include <linux/i2c.h>
>     > +#include <linux/module.h>
>     > +#include <linux/pm_runtime.h>
>     > +#include <linux/regmap.h>
>     > +#include <linux/version.h>
>     > +#include <media/v4l2-cci.h>
>     > +#include <media/v4l2-ctrls.h>
>     > +#include <media/v4l2-device.h>
>     > +#include <media/v4l2-fwnode.h>
>     > +
>     > +#define OV02C10_LINK_FREQ_400MHZ     400000000ULL
>     > +#define OV02C10_MCLK                 19200000
>     > +#define OV02C10_RGB_DEPTH            10
>     > +
>     > +#define OV02C10_REG_CHIP_ID          CCI_REG16(0x300a)
>     > +#define OV02C10_CHIP_ID                      0x5602
>     > +
>     > +#define OV02C10_REG_STREAM_CONTROL   CCI_REG8(0x0100)
>     > +
>     > +#define OV02C10_REG_HTS                      CCI_REG16(0x380c)
>     > +
>     > +/* vertical-timings from sensor */
>     > +#define OV02C10_REG_VTS                      CCI_REG16(0x380e)
>     > +#define OV02C10_VTS_MAX                      0xffff
>     > +
>     > +/* Exposure controls from sensor */
>     > +#define OV02C10_REG_EXPOSURE         CCI_REG16(0x3501)
>     > +#define OV02C10_EXPOSURE_MIN         4
>     > +#define OV02C10_EXPOSURE_MAX_MARGIN  8
>     > +#define OV02C10_EXPOSURE_STEP                1
>     > +
>     > +/* Analog gain controls from sensor */
>     > +#define OV02C10_REG_ANALOG_GAIN              CCI_REG16(0x3508)
>     > +#define OV02C10_ANAL_GAIN_MIN                0x10
>     > +#define OV02C10_ANAL_GAIN_MAX                0xf8
>     > +#define OV02C10_ANAL_GAIN_STEP               1
>     > +#define OV02C10_ANAL_GAIN_DEFAULT    0x10
>     > +
>     > +/* Digital gain controls from sensor */
>     > +#define OV02C10_REG_DIGITAL_GAIN     CCI_REG24(0x350a)
>     > +#define OV02C10_DGTL_GAIN_MIN                0x0400
>     > +#define OV02C10_DGTL_GAIN_MAX                0x3fff
>     > +#define OV02C10_DGTL_GAIN_STEP               1
>     > +#define OV02C10_DGTL_GAIN_DEFAULT    0x0400
>     > +
>     > +/* Rotate */
>     > +#define OV02C10_ROTATE_CONTROL               CCI_REG8(0x3820)
>     > +#define OV02C10_ISP_X_WIN_CONTROL    CCI_REG16(0x3810)
>     > +#define OV02C10_ISP_Y_WIN_CONTROL    CCI_REG16(0x3812)
>     > +#define OV02C10_CONFIG_ROTATE                0x18
>     > +
>     > +/* Test Pattern Control */
>     > +#define OV02C10_REG_TEST_PATTERN             CCI_REG8(0x4503)
>     > +#define OV02C10_TEST_PATTERN_ENABLE          BIT(7)
>     > +
>     > +struct ov02c10_mode {
>     > +     /* Frame width in pixels */
>     > +     u32 width;
>     > +
>     > +     /* Frame height in pixels */
>     > +     u32 height;
>     > +
>     > +     /* Horizontal timining size */
>     > +     u32 hts;
>     > +
>     > +     /* Min vertical timining size */
>     > +     u32 vts_min;
>     > +
>     > +     /* Sensor register settings for this resolution */
>     > +     const struct reg_sequence *reg_sequence;
>     > +     const int sequence_length;
>     > +     /* Sensor register settings for 1 or 2 lane config */
>     > +     const struct reg_sequence *lane_settings[2];
>     > +     const int lane_settings_length[2];
>     > +};
>     > +
>     > +static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
> 
>     Could you use struct cci_reg_sequence for this?
> 
>     > +     {0x0301, 0x08},
> 
>     { CCI_REG8(0x0301), 0x08 },
> 
>     etc.
> 
>     That would also enable using human-readable names in this list.
> 
>     > +     {0x0303, 0x06},
>     > +     {0x0304, 0x01},
>     > +     {0x0305, 0xe0},
>     > +     {0x0313, 0x40},
>     > +     {0x031c, 0x4f},
>     > +     {0x3020, 0x97},
>     > +     {0x3022, 0x01},
>     > +     {0x3026, 0xb4},
>     > +     {0x303b, 0x00},
>     > +     {0x303c, 0x4f},
>     > +     {0x303d, 0xe6},
>     > +     {0x303e, 0x00},
>     > +     {0x303f, 0x03},
>     > +     {0x3021, 0x23},
>     > +     {0x3501, 0x04},
>     > +     {0x3502, 0x6c},
>     > +     {0x3504, 0x0c},
>     > +     {0x3507, 0x00},
>     > +     {0x3508, 0x08},
>     > +     {0x3509, 0x00},
>     > +     {0x350a, 0x01},
>     > +     {0x350b, 0x00},
>     > +     {0x350c, 0x41},
>     > +     {0x3600, 0x84},
>     > +     {0x3603, 0x08},
>     > +     {0x3610, 0x57},
>     > +     {0x3611, 0x1b},
>     > +     {0x3613, 0x78},
>     > +     {0x3623, 0x00},
>     > +     {0x3632, 0xa0},
>     > +     {0x3642, 0xe8},
>     > +     {0x364c, 0x70},
>     > +     {0x365f, 0x0f},
>     > +     {0x3708, 0x30},
>     > +     {0x3714, 0x24},
>     > +     {0x3725, 0x02},
>     > +     {0x3737, 0x08},
>     > +     {0x3739, 0x28},
>     > +     {0x3749, 0x32},
>     > +     {0x374a, 0x32},
>     > +     {0x374b, 0x32},
>     > +     {0x374c, 0x32},
>     > +     {0x374d, 0x81},
>     > +     {0x374e, 0x81},
>     > +     {0x374f, 0x81},
>     > +     {0x3752, 0x36},
>     > +     {0x3753, 0x36},
>     > +     {0x3754, 0x36},
>     > +     {0x3761, 0x00},
>     > +     {0x376c, 0x81},
>     > +     {0x3774, 0x18},
>     > +     {0x3776, 0x08},
>     > +     {0x377c, 0x81},
>     > +     {0x377d, 0x81},
>     > +     {0x377e, 0x81},
>     > +     {0x37a0, 0x44},
>     > +     {0x37a6, 0x44},
>     > +     {0x37aa, 0x0d},
>     > +     {0x37ae, 0x00},
>     > +     {0x37cb, 0x03},
>     > +     {0x37cc, 0x01},
>     > +     {0x37d8, 0x02},
>     > +     {0x37d9, 0x10},
>     > +     {0x37e1, 0x10},
>     > +     {0x37e2, 0x18},
>     > +     {0x37e3, 0x08},
>     > +     {0x37e4, 0x08},
>     > +     {0x37e5, 0x02},
>     > +     {0x37e6, 0x08},
>     > +
>     > +     /* 1928x1092 */
>     > +     {0x3800, 0x00},
>     > +     {0x3801, 0x00},
>     > +     {0x3802, 0x00},
>     > +     {0x3803, 0x00},
>     > +     {0x3804, 0x07},
>     > +     {0x3805, 0x8f},
>     > +     {0x3806, 0x04},
>     > +     {0x3807, 0x47},
>     > +     {0x3808, 0x07},
>     > +     {0x3809, 0x88},
>     > +     {0x380a, 0x04},
>     > +     {0x380b, 0x44},
>     > +     {0x3810, 0x00},
>     > +     {0x3811, 0x02},
>     > +     {0x3812, 0x00},
>     > +     {0x3813, 0x02},
>     > +     {0x3814, 0x01},
>     > +     {0x3815, 0x01},
>     > +     {0x3816, 0x01},
>     > +     {0x3817, 0x01},
>     > +
>     > +     {0x3820, 0xb0},
>     > +     {0x3821, 0x00},
>     > +     {0x3822, 0x80},
>     > +     {0x3823, 0x08},
>     > +     {0x3824, 0x00},
>     > +     {0x3825, 0x20},
>     > +     {0x3826, 0x00},
>     > +     {0x3827, 0x08},
>     > +     {0x382a, 0x00},
>     > +     {0x382b, 0x08},
>     > +     {0x382d, 0x00},
>     > +     {0x382e, 0x00},
>     > +     {0x382f, 0x23},
>     > +     {0x3834, 0x00},
>     > +     {0x3839, 0x00},
>     > +     {0x383a, 0xd1},
>     > +     {0x383e, 0x03},
>     > +     {0x393d, 0x29},
>     > +     {0x393f, 0x6e},
>     > +     {0x394b, 0x06},
>     > +     {0x394c, 0x06},
>     > +     {0x394d, 0x08},
>     > +     {0x394f, 0x01},
>     > +     {0x3950, 0x01},
>     > +     {0x3951, 0x01},
>     > +     {0x3952, 0x01},
>     > +     {0x3953, 0x01},
>     > +     {0x3954, 0x01},
>     > +     {0x3955, 0x01},
>     > +     {0x3956, 0x01},
>     > +     {0x3957, 0x0e},
>     > +     {0x3958, 0x08},
>     > +     {0x3959, 0x08},
>     > +     {0x395a, 0x08},
>     > +     {0x395b, 0x13},
>     > +     {0x395c, 0x09},
>     > +     {0x395d, 0x05},
>     > +     {0x395e, 0x02},
>     > +     {0x395f, 0x00},
>     > +     {0x395f, 0x00},
>     > +     {0x3960, 0x00},
>     > +     {0x3961, 0x00},
>     > +     {0x3962, 0x00},
>     > +     {0x3963, 0x00},
>     > +     {0x3964, 0x00},
>     > +     {0x3965, 0x00},
>     > +     {0x3966, 0x00},
>     > +     {0x3967, 0x00},
>     > +     {0x3968, 0x01},
>     > +     {0x3969, 0x01},
>     > +     {0x396a, 0x01},
>     > +     {0x396b, 0x01},
>     > +     {0x396c, 0x10},
>     > +     {0x396d, 0xf0},
>     > +     {0x396e, 0x11},
>     > +     {0x396f, 0x00},
>     > +     {0x3970, 0x37},
>     > +     {0x3971, 0x37},
>     > +     {0x3972, 0x37},
>     > +     {0x3973, 0x37},
>     > +     {0x3974, 0x00},
>     > +     {0x3975, 0x3c},
>     > +     {0x3976, 0x3c},
>     > +     {0x3977, 0x3c},
>     > +     {0x3978, 0x3c},
>     > +     {0x3c00, 0x0f},
>     > +     {0x3c20, 0x01},
>     > +     {0x3c21, 0x08},
>     > +     {0x3f00, 0x8b},
>     > +     {0x3f02, 0x0f},
>     > +     {0x4000, 0xc3},
>     > +     {0x4001, 0xe0},
>     > +     {0x4002, 0x00},
>     > +     {0x4003, 0x40},
>     > +     {0x4008, 0x04},
>     > +     {0x4009, 0x23},
>     > +     {0x400a, 0x04},
>     > +     {0x400b, 0x01},
>     > +     {0x4077, 0x06},
>     > +     {0x4078, 0x00},
>     > +     {0x4079, 0x1a},
>     > +     {0x407a, 0x7f},
>     > +     {0x407b, 0x01},
>     > +     {0x4080, 0x03},
>     > +     {0x4081, 0x84},
>     > +     {0x4308, 0x03},
>     > +     {0x4309, 0xff},
>     > +     {0x430d, 0x00},
>     > +     {0x4806, 0x00},
>     > +     {0x4813, 0x00},
>     > +     {0x4837, 0x10},
>     > +     {0x4857, 0x05},
>     > +     {0x4500, 0x07},
>     > +     {0x4501, 0x00},
>     > +     {0x4503, 0x00},
>     > +     {0x450a, 0x04},
>     > +     {0x450e, 0x00},
>     > +     {0x450f, 0x00},
>     > +     {0x4900, 0x00},
>     > +     {0x4901, 0x00},
>     > +     {0x4902, 0x01},
>     > +     {0x5001, 0x50},
>     > +     {0x5006, 0x00},
>     > +     {0x5080, 0x40},
>     > +     {0x5181, 0x2b},
>     > +     {0x5202, 0xa3},
>     > +     {0x5206, 0x01},
>     > +     {0x5207, 0x00},
>     > +     {0x520a, 0x01},
>     > +     {0x520b, 0x00},
>     > +     {0x365d, 0x00},
>     > +     {0x4815, 0x40},
>     > +     {0x4816, 0x12},
>     > +     {0x4f00, 0x01},
>     > +};
>     > +
>     > +static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
>     > +     {0x301b, 0xd2},
>     > +     {0x3027, 0xe1},
>     > +     {0x380c, 0x08},
>     > +     {0x380d, 0xe8},
>     > +     {0x380e, 0x04},
>     > +     {0x380f, 0x8c},
>     > +     {0x394e, 0x0b},
>     > +     {0x4800, 0x24},
>     > +     {0x5000, 0xf5},
>     > +     /* plls */
>     > +     {0x0303, 0x05},
>     > +     {0x0305, 0x90},
>     > +     {0x0316, 0x90},
>     > +     {0x3016, 0x12},
>     > +};
>     > +
>     > +static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
>     > +     {0x301b, 0xf0},
>     > +     {0x3027, 0xf1},
>     > +     {0x380c, 0x04},
>     > +     {0x380d, 0x74},
>     > +     {0x380e, 0x09},
>     > +     {0x380f, 0x18},
>     > +     {0x394e, 0x0a},
>     > +     {0x4041, 0x20},
>     > +     {0x4884, 0x04},
>     > +     {0x4800, 0x64},
>     > +     {0x4d00, 0x03},
>     > +     {0x4d01, 0xd8},
>     > +     {0x4d02, 0xba},
>     > +     {0x4d03, 0xa0},
>     > +     {0x4d04, 0xb7},
>     > +     {0x4d05, 0x34},
>     > +     {0x4d0d, 0x00},
>     > +     {0x5000, 0xfd},
>     > +     {0x481f, 0x30},
> 
>     It's surprising to have more registers when the number of lanes is 2. I
>     guess for 1 lane case it's using defaults?
> 
>     > +     /* plls */
>     > +     {0x0303, 0x05},
>     > +     {0x0305, 0x90},
>     > +     {0x0316, 0x90},
>     > +     {0x3016, 0x32},
>     > +};
>     > +
>     > +static const char * const ov02c10_test_pattern_menu[] = {
>     > +     "Disabled",
>     > +     "Color Bar",
>     > +     "Top-Bottom Darker Color Bar",
>     > +     "Right-Left Darker Color Bar",
>     > +     "Color Bar type 4",
>     > +};
>     > +
>     > +static const s64 link_freq_menu_items[] = {
>     > +     OV02C10_LINK_FREQ_400MHZ,
>     > +};
>     > +
>     > +static const struct ov02c10_mode supported_modes[] = {
>     > +     {
>     > +             .width = 1928,
>     > +             .height = 1092,
>     > +             .hts = 2280,
>     > +             .vts_min = 1164,
>     > +             .reg_sequence = sensor_1928x1092_30fps_setting,
>     > +             .sequence_length = ARRAY_SIZE(sensor_1928x1092_30fps_setting),
>     > +             .lane_settings = {
>     > +                     sensor_1928x1092_30fps_1lane_setting,
>     > +                     sensor_1928x1092_30fps_2lane_setting
>     > +             },
>     > +             .lane_settings_length = {
>     > +                     ARRAY_SIZE(sensor_1928x1092_30fps_1lane_setting),
>     > +                     ARRAY_SIZE(sensor_1928x1092_30fps_2lane_setting),
>     > +             },
>     > +     },
>     > +};
>     > +
>     > +struct ov02c10 {
>     > +     struct v4l2_subdev sd;
>     > +     struct media_pad pad;
>     > +     struct v4l2_ctrl_handler ctrl_handler;
>     > +     struct regmap *regmap;
>     > +
>     > +     /* V4L2 Controls */
>     > +     struct v4l2_ctrl *link_freq;
>     > +     struct v4l2_ctrl *pixel_rate;
>     > +     struct v4l2_ctrl *vblank;
>     > +     struct v4l2_ctrl *hblank;
>     > +     struct v4l2_ctrl *exposure;
>     > +
>     > +     struct clk *img_clk;
>     > +     struct regulator *avdd;
>     > +     struct gpio_desc *reset;
>     > +
>     > +     /* Current mode */
>     > +     const struct ov02c10_mode *cur_mode;
>     > +
>     > +     /* MIPI lane info */
>     > +     u32 link_freq_index;
>     > +     u8 mipi_lanes;
>     > +};
>     > +
>     > +static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
>     > +{
>     > +     return container_of(subdev, struct ov02c10, sd);
>     > +}
>     > +
>     > +static int ov02c10_test_pattern(struct ov02c10 *ov02c10, int pattern)
>     > +{
>     > +     int ret = 0;
>     > +
>     > +     if (!pattern)
>     > +             return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>     > +                                    BIT(7), 0, NULL);
>     > +
>     > +     cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>     > +                     0x03, pattern - 1, &ret);
>     > +     cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>     > +                     BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
> 
>     I'd do here:
> 
>             return cci_update_bits(...);
> 
>     > +     return ret;
>     > +}
>     > +
>     > +static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
>     > +{
>     > +     struct ov02c10 *ov02c10 = container_of(ctrl->handler,
>     > +                                          struct ov02c10, ctrl_handler);
>     > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
>     > +     s64 exposure_max;
>     > +     int ret = 0;
>     > +
>     > +     /* Propagate change of current control to all related controls */
>     > +     if (ctrl->id == V4L2_CID_VBLANK) {
>     > +             /* Update max exposure while meeting expected vblanking */
>     > +             exposure_max = ov02c10->cur_mode->height + ctrl->val -
>     > +                            OV02C10_EXPOSURE_MAX_MARGIN;
>     > +             __v4l2_ctrl_modify_range(ov02c10->exposure,
>     > +                                      ov02c10->exposure->minimum,
>     > +                                      exposure_max, ov02c10->exposure->step,
>     > +                                      exposure_max);
>     > +     }
>     > +
>     > +     /* V4L2 controls values will be applied only when power is already up */
>     > +     if (!pm_runtime_get_if_in_use(&client->dev))
>     > +             return 0;
>     > +
>     > +     switch (ctrl->id) {
>     > +     case V4L2_CID_ANALOGUE_GAIN:
>     > +             cci_write(ov02c10->regmap, OV02C10_REG_ANALOG_GAIN,
>     > +                       ctrl->val << 4, &ret);
>     > +             break;
>     > +
>     > +     case V4L2_CID_DIGITAL_GAIN:
>     > +             cci_write(ov02c10->regmap, OV02C10_REG_DIGITAL_GAIN,
>     > +                       ctrl->val << 6, &ret);
>     > +             break;
>     > +
>     > +     case V4L2_CID_EXPOSURE:
>     > +             cci_write(ov02c10->regmap, OV02C10_REG_EXPOSURE,
>     > +                       ctrl->val, &ret);
>     > +             break;
>     > +
>     > +     case V4L2_CID_VBLANK:
>     > +             cci_write(ov02c10->regmap, OV02C10_REG_VTS,
>     > +                       ov02c10->cur_mode->height + ctrl->val, &ret);
>     > +             break;
>     > +
>     > +     case V4L2_CID_TEST_PATTERN:
>     > +             ret = ov02c10_test_pattern(ov02c10, ctrl->val);
>     > +             break;
>     > +
>     > +     default:
>     > +             ret = -EINVAL;
>     > +             break;
>     > +     }
>     > +
>     > +     pm_runtime_put(&client->dev);
>     > +
>     > +     return ret;
>     > +}
>     > +
>     > +static const struct v4l2_ctrl_ops ov02c10_ctrl_ops = {
>     > +     .s_ctrl = ov02c10_set_ctrl,
>     > +};
>     > +
>     > +static int ov02c10_init_controls(struct ov02c10 *ov02c10)
>     > +{
>     > +     struct v4l2_ctrl_handler *ctrl_hdlr;
>     > +     const struct ov02c10_mode *cur_mode;
>     > +     s64 exposure_max, h_blank, pixel_rate;
>     > +     u32 vblank_min, vblank_max, vblank_default, vts_def;
>     > +     int ret = 0;
>     > +
>     > +     ctrl_hdlr = &ov02c10->ctrl_handler;
>     > +     ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>     > +     if (ret)
>     > +             return ret;
> 
>     v4l2_ctrl_handler_init() sets the handler's error state so you can omit
>     this check.
> 
>     > +
>     > +     cur_mode = ov02c10->cur_mode;
>     > +
>     > +     ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
>     > +                                                 &ov02c10_ctrl_ops,
>     > +                                                 V4L2_CID_LINK_FREQ,
>     > +                                                 ov02c10->link_freq_index, 0,
>     > +                                                 link_freq_menu_items);
>     > +     if (ov02c10->link_freq)
>     > +             ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>     > +
>     > +     /* MIPI lanes are DDR -> use link-freq * 2 */
>     > +     pixel_rate = link_freq_menu_items[ov02c10->link_freq_index] * 2 *
>     > +                  ov02c10->mipi_lanes / OV02C10_RGB_DEPTH;
>     > +
>     > +     ov02c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>     > +                                             V4L2_CID_PIXEL_RATE, 0,
>     > +                                             pixel_rate, 1, pixel_rate);
>     > +
>     > +     /*
>     > +      * For default multiple min by number of lanes to keep the default
>     > +      * FPS the same indepenedent of the lane count.
>     > +      */
>     > +     vts_def = cur_mode->vts_min * ov02c10->mipi_lanes;
>     > +
>     > +     vblank_min = cur_mode->vts_min - cur_mode->height;
>     > +     vblank_max = OV02C10_VTS_MAX - cur_mode->height;
>     > +     vblank_default = vts_def - cur_mode->height;
>     > +     ov02c10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>     > +                                         V4L2_CID_VBLANK, vblank_min,
>     > +                                         vblank_max, 1, vblank_default);
>     > +
>     > +     h_blank = cur_mode->hts - cur_mode->width;
>     > +     ov02c10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>     > +                                         V4L2_CID_HBLANK, h_blank, h_blank,
>     > +                                         1, h_blank);
>     > +     if (ov02c10->hblank)
>     > +             ov02c10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>     > +
>     > +     v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>     > +                       OV02C10_ANAL_GAIN_MIN, OV02C10_ANAL_GAIN_MAX,
>     > +                       OV02C10_ANAL_GAIN_STEP, OV02C10_ANAL_GAIN_DEFAULT);
>     > +     v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>     > +                       OV02C10_DGTL_GAIN_MIN, OV02C10_DGTL_GAIN_MAX,
>     > +                       OV02C10_DGTL_GAIN_STEP, OV02C10_DGTL_GAIN_DEFAULT);
>     > +     exposure_max = vts_def - OV02C10_EXPOSURE_MAX_MARGIN;
>     > +     ov02c10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>     > +                                           V4L2_CID_EXPOSURE,
>     > +                                           OV02C10_EXPOSURE_MIN,
>     > +                                           exposure_max,
>     > +                                           OV02C10_EXPOSURE_STEP,
>     > +                                           exposure_max);
>     > +     v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
>     > +                                  V4L2_CID_TEST_PATTERN,
>     > +                                  ARRAY_SIZE(ov02c10_test_pattern_menu) - 1,
>     > +                                  0, 0, ov02c10_test_pattern_menu);
>     > +     if (ctrl_hdlr->error)
>     > +             return ctrl_hdlr->error;
>     > +
>     > +     ov02c10->sd.ctrl_handler = ctrl_hdlr;
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +static void ov02c10_update_pad_format(const struct ov02c10_mode *mode,
>     > +                                   struct v4l2_mbus_framefmt *fmt)
>     > +{
>     > +     fmt->width = mode->width;
>     > +     fmt->height = mode->height;
>     > +     fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>     > +     fmt->field = V4L2_FIELD_NONE;
>     > +}
>     > +
>     > +static int ov02c10_start_streaming(struct ov02c10 *ov02c10)
>     > +{
>     > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
>     > +     const struct reg_sequence *reg_sequence;
>     > +     int sequence_length;
>     > +     int ret = 0;
>     > +
>     > +     reg_sequence = ov02c10->cur_mode->reg_sequence;
>     > +     sequence_length = ov02c10->cur_mode->sequence_length;
>     > +     ret = regmap_multi_reg_write(ov02c10->regmap,
>     > +                                  reg_sequence, sequence_length);
>     > +     if (ret) {
>     > +             dev_err(&client->dev, "failed to set mode\n");
>     > +             return ret;
>     > +     }
>     > +
>     > +     reg_sequence = ov02c10->cur_mode->lane_settings[ov02c10->mipi_lanes - 1];
>     > +     sequence_length = ov02c10->cur_mode->lane_settings_length[ov02c10->mipi_lanes - 1];
>     > +     ret = regmap_multi_reg_write(ov02c10->regmap,
>     > +                                  reg_sequence, sequence_length);
>     > +     if (ret) {
>     > +             dev_err(&client->dev, "failed to write lane settings\n");
>     > +             return ret;
>     > +     }
>     > +
>     > +     ret = __v4l2_ctrl_handler_setup(ov02c10->sd.ctrl_handler);
>     > +     if (ret)
>     > +             return ret;
>     > +
>     > +     return cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
>     > +}
>     > +
>     > +static void ov02c10_stop_streaming(struct ov02c10 *ov02c10)
>     > +{
>     > +     cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
>     > +}
>     > +
>     > +static int ov02c10_enable_streams(struct v4l2_subdev *sd,
>     > +                               struct v4l2_subdev_state *state,
>     > +                               u32 pad, u64 streams_mask)
>     > +{
>     > +     struct i2c_client *client = v4l2_get_subdevdata(sd);
>     > +     struct ov02c10 *ov02c10 = to_ov02c10(sd);
>     > +     int ret;
>     > +
>     > +     ret = pm_runtime_resume_and_get(&client->dev);
>     > +     if (ret)
>     > +             return ret;
>     > +
>     > +     ret = ov02c10_start_streaming(ov02c10);
> 
>     I'd move the code from ov02c10_start_streaming() here. Up to you.
> 
>     > +     if (ret)
>     > +             pm_runtime_put(&client->dev);
>     > +
>     > +     return ret;
>     > +}
>     > +
>     > +static int ov02c10_disable_streams(struct v4l2_subdev *sd,
>     > +                                struct v4l2_subdev_state *state,
>     > +                                u32 pad, u64 streams_mask)
>     > +{
>     > +     struct i2c_client *client = v4l2_get_subdevdata(sd);
>     > +     struct ov02c10 *ov02c10 = to_ov02c10(sd);
>     > +
>     > +     ov02c10_stop_streaming(ov02c10);
> 
>     I'd just do the register write here.
> 
>     > +     pm_runtime_put(&client->dev);
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +/* This function tries to get power control resources */
>     > +static int ov02c10_get_pm_resources(struct device *dev)
>     > +{
>     > +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>     > +     struct ov02c10 *ov02c10 = to_ov02c10(sd);
>     > +
>     > +     ov02c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>     > +     if (IS_ERR(ov02c10->reset))
>     > +             return dev_err_probe(dev, PTR_ERR(ov02c10->reset),
>     > +                                  "failed to get reset gpio\n");
>     > +     if (ov02c10->reset)
>     > +             fsleep(1000);
> 
>     Is there a need to sleep here?
> 
>     > +
>     > +     ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
>     > +     if (IS_ERR(ov02c10->img_clk))
>     > +             return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
>     > +                                  "failed to get imaging clock\n");
>     > +
>     > +     ov02c10->avdd = devm_regulator_get(dev, "avdd");
>     > +     if (IS_ERR(ov02c10->avdd))
>     > +             return dev_err_probe(dev, PTR_ERR(ov02c10->avdd),
>     > +                                  "failed to get avdd regulator\n");
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +static int ov02c10_power_off(struct device *dev)
>     > +{
>     > +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>     > +     struct ov02c10 *ov02c10 = to_ov02c10(sd);
>     > +     int ret = 0;
>     > +
>     > +     gpiod_set_value_cansleep(ov02c10->reset, 1);
>     > +
>     > +     if (ov02c10->avdd)
>     > +             ret = regulator_disable(ov02c10->avdd);
>     > +
>     > +     clk_disable_unprepare(ov02c10->img_clk);
>     > +
>     > +     return ret;
> 
>     I'd return 0 always but complain if disabling the regulator fails.
> 
>     > +}
>     > +
>     > +static int ov02c10_power_on(struct device *dev)
>     > +{
>     > +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>     > +     struct ov02c10 *ov02c10 = to_ov02c10(sd);
>     > +     int ret;
>     > +
>     > +     ret = clk_prepare_enable(ov02c10->img_clk);
>     > +     if (ret < 0) {
>     > +             dev_err(dev, "failed to enable imaging clock: %d", ret);
>     > +             return ret;
>     > +     }
>     > +
>     > +     if (ov02c10->avdd) {
>     > +             ret = regulator_enable(ov02c10->avdd);
>     > +             if (ret < 0) {
>     > +                     dev_err(dev, "failed to enable avdd: %d", ret);
>     > +                     clk_disable_unprepare(ov02c10->img_clk);
>     > +                     return ret;
>     > +             }
>     > +     }
>     > +
>     > +     gpiod_set_value_cansleep(ov02c10->reset, 0);
>     > +     usleep_range(1500, 1800);
> 
>     Accoding to the datasheet the minimum time from lifting reset is 5 ms +
>     8192 xclk cycles before the first SCCB transaction may proceed.
> 
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +static int ov02c10_set_format(struct v4l2_subdev *sd,
>     > +                           struct v4l2_subdev_state *sd_state,
>     > +                           struct v4l2_subdev_format *fmt)
>     > +{
>     > +     struct ov02c10 *ov02c10 = to_ov02c10(sd);
>     > +     const struct ov02c10_mode *mode;
>     > +     s32 vblank_def, h_blank;
>     > +
>     > +     mode = v4l2_find_nearest_size(supported_modes,
>     > +                                   ARRAY_SIZE(supported_modes), width,
>     > +                                   height, fmt->format.width,
>     > +                                   fmt->format.height);
>     > +
>     > +     ov02c10_update_pad_format(mode, &fmt->format);
>     > +     *v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
>     > +
>     > +     if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
>     > +             return 0;
>     > +
>     > +     ov02c10->cur_mode = mode;
> 
>     You don't really need cur_mode, do you? The driver supports a single mode
>     and selecting the mode would ideally be based on sub-device state so I
>     think it'd be better to just remove cur_mode.
> 
>     > +
>     > +     /* Update limits and set FPS to default */
>     > +     vblank_def = mode->vts_min * ov02c10->mipi_lanes - mode->height;
>     > +     __v4l2_ctrl_modify_range(ov02c10->vblank, mode->vts_min - mode->height,
>     > +                              OV02C10_VTS_MAX - mode->height, 1, vblank_def);
>     > +     __v4l2_ctrl_s_ctrl(ov02c10->vblank, vblank_def);
>     > +     h_blank = mode->hts - mode->width;
>     > +     __v4l2_ctrl_modify_range(ov02c10->hblank, h_blank, h_blank, 1, h_blank);
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +static int ov02c10_enum_mbus_code(struct v4l2_subdev *sd,
>     > +                               struct v4l2_subdev_state *sd_state,
>     > +                               struct v4l2_subdev_mbus_code_enum *code)
>     > +{
>     > +     if (code->index > 0)
>     > +             return -EINVAL;
>     > +
>     > +     code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +static int ov02c10_enum_frame_size(struct v4l2_subdev *sd,
>     > +                                struct v4l2_subdev_state *sd_state,
>     > +                                struct v4l2_subdev_frame_size_enum *fse)
>     > +{
>     > +     if (fse->index >= ARRAY_SIZE(supported_modes))
>     > +             return -EINVAL;
>     > +
>     > +     if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
>     > +             return -EINVAL;
>     > +
>     > +     fse->min_width = supported_modes[fse->index].width;
>     > +     fse->max_width = fse->min_width;
>     > +     fse->min_height = supported_modes[fse->index].height;
>     > +     fse->max_height = fse->min_height;
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +static int ov02c10_init_state(struct v4l2_subdev *sd,
>     > +                           struct v4l2_subdev_state *sd_state)
>     > +{
>     > +     ov02c10_update_pad_format(&supported_modes[0],
>     > +                               v4l2_subdev_state_get_format(sd_state, 0));
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +static const struct v4l2_subdev_video_ops ov02c10_video_ops = {
>     > +     .s_stream = v4l2_subdev_s_stream_helper,
>     > +};
>     > +
>     > +static const struct v4l2_subdev_pad_ops ov02c10_pad_ops = {
>     > +     .set_fmt = ov02c10_set_format,
>     > +     .get_fmt = v4l2_subdev_get_fmt,
>     > +     .enum_mbus_code = ov02c10_enum_mbus_code,
>     > +     .enum_frame_size = ov02c10_enum_frame_size,
>     > +     .enable_streams = ov02c10_enable_streams,
>     > +     .disable_streams = ov02c10_disable_streams,
>     > +};
>     > +
>     > +static const struct v4l2_subdev_ops ov02c10_subdev_ops = {
>     > +     .video = &ov02c10_video_ops,
>     > +     .pad = &ov02c10_pad_ops,
>     > +};
>     > +
>     > +static const struct media_entity_operations ov02c10_subdev_entity_ops = {
>     > +     .link_validate = v4l2_subdev_link_validate,
>     > +};
>     > +
>     > +static const struct v4l2_subdev_internal_ops ov02c10_internal_ops = {
>     > +     .init_state = ov02c10_init_state,
>     > +};
>     > +
>     > +static int ov02c10_identify_module(struct ov02c10 *ov02c10)
>     > +{
>     > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
>     > +     u64 chip_id;
>     > +     int ret;
>     > +
>     > +     ret = cci_read(ov02c10->regmap, OV02C10_REG_CHIP_ID, &chip_id, NULL);
>     > +     if (ret)
>     > +             return ret;
>     > +
>     > +     if (chip_id != OV02C10_CHIP_ID) {
>     > +             dev_err(&client->dev, "chip id mismatch: %x!=%llx",
>     > +                     OV02C10_CHIP_ID, chip_id);
>     > +             return -ENXIO;
>     > +     }
>     > +
>     > +     return 0;
>     > +}
>     > +
>     > +static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
>     > +{
>     > +     struct v4l2_fwnode_endpoint bus_cfg = {
>     > +             .bus_type = V4L2_MBUS_CSI2_DPHY
>     > +     };
>     > +     struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
>     > +     unsigned long link_freq_bitmap;
>     > +     u32 mclk;
>     > +     int ret;
>     > +
>     > +     /*
>     > +      * Sometimes the fwnode graph is initialized by the bridge driver,
>     > +      * wait for this.
>     > +      */
>     > +     ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
>     > +     if (!ep)
>     > +             return dev_err_probe(dev, -EPROBE_DEFER,
>     > +                                  "waiting for fwnode graph endpoint\n");
>     > +
>     > +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> 
>     The driver accesses a clock besides this, too. The frequency should be
>     obtained from the clock if one exists. Meanwhile Mehdi has been working on
>     <URL:https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/T/#u <https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/T/#u>>.
> 
>     > +     if (ret) {
>     > +             fwnode_handle_put(ep);
>     > +             return dev_err_probe(dev, ret,
>     > +                                  "reading clock-frequency property\n");
>     > +     }
>     > +
>     > +     if (mclk != OV02C10_MCLK) {
>     > +             fwnode_handle_put(ep);
>     > +             return dev_err_probe(dev, -EINVAL,
>     > +                                  "external clock %u is not supported\n",
>     > +                                  mclk);
>     > +     }
>     > +
>     > +     ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>     > +     fwnode_handle_put(ep);
>     > +     if (ret)
>     > +             return dev_err_probe(dev, ret, "parsing endpoint failed\n");
>     > +
>     > +     ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
>     > +                                    bus_cfg.nr_of_link_frequencies,
>     > +                                    link_freq_menu_items,
>     > +                                    ARRAY_SIZE(link_freq_menu_items),
>     > +                                    &link_freq_bitmap);
>     > +     if (ret)
>     > +             goto check_hwcfg_error;
>     > +
>     > +     /* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
>     > +     ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
>     > +
>     > +     if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
>     > +         bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
>     > +             ret = dev_err_probe(dev, -EINVAL,
>     > +                                 "number of CSI2 data lanes %u is not supported\n",
>     > +                                 bus_cfg.bus.mipi_csi2.num_data_lanes);
>     > +             goto check_hwcfg_error;
>     > +     }
>     > +
>     > +     ov02c10->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
>     > +
>     > +check_hwcfg_error:
>     > +     v4l2_fwnode_endpoint_free(&bus_cfg);
>     > +     return ret;
>     > +}
>     > +
>     > +static void ov02c10_remove(struct i2c_client *client)
>     > +{
>     > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
>     > +
>     > +     v4l2_async_unregister_subdev(sd);
>     > +     v4l2_subdev_cleanup(sd);
>     > +     media_entity_cleanup(&sd->entity);
>     > +     v4l2_ctrl_handler_free(sd->ctrl_handler);
>     > +     pm_runtime_disable(&client->dev);
>     > +     if (!pm_runtime_status_suspended(&client->dev)) {
>     > +             ov02c10_power_off(&client->dev);
>     > +             pm_runtime_set_suspended(&client->dev);
>     > +     }
>     > +}
>     > +
>     > +static int ov02c10_probe(struct i2c_client *client)
>     > +{
>     > +     struct ov02c10 *ov02c10;
>     > +     int ret = 0;
> 
>     The initialisation is redundant.
> 
>     > +
>     > +     ov02c10 = devm_kzalloc(&client->dev, sizeof(*ov02c10), GFP_KERNEL);
>     > +     if (!ov02c10)
>     > +             return -ENOMEM;
>     > +
>     > +     v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
>     > +
>     > +     /* Check HW config */
>     > +     ret = ov02c10_check_hwcfg(&client->dev, ov02c10);
>     > +     if (ret)
>     > +             return ret;
>     > +
>     > +     ret = ov02c10_get_pm_resources(&client->dev);
>     > +     if (ret)
>     > +             return ret;
>     > +
>     > +     ov02c10->regmap = devm_cci_regmap_init_i2c(client, 16);
>     > +     if (IS_ERR(ov02c10->regmap))
>     > +             return PTR_ERR(ov02c10->regmap);
>     > +
>     > +     ret = ov02c10_power_on(&client->dev);
>     > +     if (ret) {
>     > +             dev_err_probe(&client->dev, ret, "failed to power on\n");
>     > +             return ret;
>     > +     }
>     > +
>     > +     ret = ov02c10_identify_module(ov02c10);
>     > +     if (ret) {
>     > +             dev_err(&client->dev, "failed to find sensor: %d", ret);
>     > +             goto probe_error_power_off;
>     > +     }
>     > +
>     > +     ov02c10->cur_mode = &supported_modes[0];
>     > +
>     > +     ret = ov02c10_init_controls(ov02c10);
>     > +     if (ret) {
>     > +             dev_err(&client->dev, "failed to init controls: %d", ret);
>     > +             goto probe_error_v4l2_ctrl_handler_free;
>     > +     }
>     > +
>     > +     ov02c10->sd.internal_ops = &ov02c10_internal_ops;
>     > +     ov02c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>     > +     ov02c10->sd.entity.ops = &ov02c10_subdev_entity_ops;
>     > +     ov02c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>     > +     ov02c10->pad.flags = MEDIA_PAD_FL_SOURCE;
>     > +     ret = media_entity_pads_init(&ov02c10->sd.entity, 1, &ov02c10->pad);
>     > +     if (ret) {
>     > +             dev_err(&client->dev, "failed to init entity pads: %d", ret);
>     > +             goto probe_error_v4l2_ctrl_handler_free;
>     > +     }
>     > +
>     > +     ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock;
>     > +     ret = v4l2_subdev_init_finalize(&ov02c10->sd);
>     > +     if (ret < 0) {
>     > +             dev_err(&client->dev, "failed to init subdev: %d", ret);
>     > +             goto probe_error_media_entity_cleanup;
>     > +     }
>     > +
>     > +     pm_runtime_set_active(&client->dev);
>     > +     pm_runtime_enable(&client->dev);
>     > +
>     > +     ret = v4l2_async_register_subdev_sensor(&ov02c10->sd);
>     > +     if (ret < 0) {
>     > +             dev_err(&client->dev, "failed to register V4L2 subdev: %d",
>     > +                     ret);
>     > +             goto probe_error_v4l2_subdev_cleanup;
>     > +     }
>     > +
>     > +     pm_runtime_idle(&client->dev);
>     > +     return 0;
>     > +
>     > +probe_error_v4l2_subdev_cleanup:
>     > +     pm_runtime_disable(&client->dev);
>     > +     pm_runtime_set_suspended(&client->dev);
>     > +     v4l2_subdev_cleanup(&ov02c10->sd);
>     > +
>     > +probe_error_media_entity_cleanup:
>     > +     media_entity_cleanup(&ov02c10->sd.entity);
>     > +
>     > +probe_error_v4l2_ctrl_handler_free:
>     > +     v4l2_ctrl_handler_free(ov02c10->sd.ctrl_handler);
>     > +
>     > +probe_error_power_off:
>     > +     ov02c10_power_off(&client->dev);
>     > +
>     > +     return ret;
>     > +}
>     > +
>     > +static DEFINE_RUNTIME_DEV_PM_OPS(ov02c10_pm_ops, ov02c10_power_off,
>     > +                              ov02c10_power_on, NULL);
>     > +
>     > +#ifdef CONFIG_ACPI
>     > +static const struct acpi_device_id ov02c10_acpi_ids[] = {
>     > +     {"OVTI02C1"},
> 
>     Spaces inside braces, please.
> 
>     > +     {}
>     > +};
>     > +
>     > +MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
>     > +#endif
>     > +
>     > +static struct i2c_driver ov02c10_i2c_driver = {
>     > +     .driver = {
>     > +             .name = "ov02c10",
>     > +             .pm = pm_sleep_ptr(&ov02c10_pm_ops),
>     > +             .acpi_match_table = ACPI_PTR(ov02c10_acpi_ids),
>     > +     },
>     > +     .probe = ov02c10_probe,
>     > +     .remove = ov02c10_remove,
>     > +};
>     > +
>     > +module_i2c_driver(ov02c10_i2c_driver);
>     > +
>     > +MODULE_AUTHOR("Hao Yao <hao.yao@intel.com <mailto:hao.yao@intel.com>>");
> 
>     Shouldn't this include you / Heimir as well?
> 
>     > +MODULE_DESCRIPTION("OmniVision OV02C10 sensor driver");
>     > +MODULE_LICENSE("GPL");
> 
>     -- 
>     Kind regards,
> 
>     Sakari Ailus
> 


