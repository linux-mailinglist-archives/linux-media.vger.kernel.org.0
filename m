Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AA01CD661
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 12:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgEKKUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 06:20:36 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:37225 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727093AbgEKKUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 06:20:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Y5XyjA9BJhEkrY5Y0jG36T; Mon, 11 May 2020 12:20:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589192432; bh=v30NtQeC3gcqtHWLR4991ZFdZBLF0lN/Kr3HY4BLSBM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ixjdwi4vvoUnq6c9t9ekk+1Yb9LC1cc83KBF4VN/A6ZiggC55CMPHDNVaDPyPhVXN
         JOiDS9s4EK8Jlvudao3wwN9ItlcFJcHrVbwF7HX8e1ccO0l9/zSses+CNrQI3BuEap
         tpv5uZ2OG1ms/i5oMJ44I9j4wVfExxQqQrMMS5TxRKQGRJUowkqUoa5eN/P5RD2rOi
         UWeD5mC8t2ZZH2fa60uz8Prvl9QKCbW6JOI8roxkEbL3ZM8VrnfwJmbsdMjW7HGdEa
         jUwfPTRLTMz1xwbvfM6w5OQAfc3hZezBrVGwUFjT7E85QweAxCj47qMClPARWC6pAU
         HIqBNkHkXroaQ==
Subject: Re: [PATCH v8 4/4] media: i2c: Add RDACM20 driver
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh@kernel.org>
References: <20200417103424.5875-1-kieran.bingham+renesas@ideasonboard.com>
 <20200417103424.5875-5-kieran.bingham+renesas@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9542009f-7290-eec4-3190-9fc8dad6f214@xs4all.nl>
Date:   Mon, 11 May 2020 12:20:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200417103424.5875-5-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJEY/valHly88FpnjoxOAXAEx4SvJ8hiONrbmS6097U1wDlDWti5PkSctG0PxjuILKrfyat1/KEOHklkxtfynxOQTVAgF3+kCjeYyI5gPEWaD/KKABZY
 F9tJB7c6iwzIACKI5JgaeWl/fcOyOa7FhKcL++ZATjbLTQPQoznEXrS3lpTGmxMrUTZSPJuzzMJ5L+OmYlYVWQcOllVusIWU+PDUIhMrVSXkJtojB1aAatIX
 2cTq12lyF56EAKbpxQROGFU/2Ts30t2V1qkxuCJuufHCZi+I2R4Cy8R6bpvZeBVWZnwnVRh6y0k29WcEkos31aaFzpavhR/bRjhZVFj5d7f8E4Sib0c8tQDp
 0bwiStvj7UxrKLjmz3DnWAPGkHkg6pWLxZ6yyb6DGjktqfSECqpc612W4v8arqicCkpgVWROH4mose9I6XHer8EhbO1a0W5cRSbdpKKB3/Vx88NIHa412RE6
 3BycoYIVPz73E7OVefgDWa7vqRyBTJCcRvpPSkM8ehjBIkibhymcscLYH0M2Tx5mpaVkSp9fgPJ4jsK/xibBLXiz6mPPfEWY/2ZqUa2+i93O4DuVLDQHrr0+
 GuC7SKjvf5QfGoZsJPfY1Kd+DigRcAFW4Zr4fYamfnfhwFrGE8YwhPpBjROn74AfazT12tEwEg6ERd/3PanjL0IDhdqqK5Wr6YH/EG3u552tTZoj6GOEy7+C
 Z38Qd5AKsRKopC//UrQ1RSo9BM7+WWFuACxeroHKzsGOouBac91Ci6gdVSobbE7yNhCptK4AT63oBZNUYeCKWMB5C1GBaiiRMMhVAK7N4MevjHbTtke57aYG
 W07bZD8ifZVAydfo8aCnwpGh9Jd68W6QiYX9+CLHPf3oEaAsKttno71H3e+Gj2OHpr71GatvFToxT3c6fffmS23/vx7N/SntnjP+/oB7YykV6ffkUYfUn1RE
 bx1wpBXBR/Uq6HTIjGlqVeKrd7I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/04/2020 12:34, Kieran Bingham wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> The RDACM20 is a GMSL camera supporting 1280x800 resolution images
> developed by IMI based on an Omnivision 10635 sensor and a Maxim MAX9271
> GMSL serializer.
> 
> The GMSL link carries power, control (I2C) and video data over a
> single coax cable.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---

<snip>

> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> new file mode 100644
> index 000000000000..37786998878b
> --- /dev/null
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -0,0 +1,668 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * IMI RDACM20 GMSL Camera Driver
> + *
> + * Copyright (C) 2017-2020 Jacopo Mondi
> + * Copyright (C) 2017-2020 Kieran Bingham
> + * Copyright (C) 2017-2019 Laurent Pinchart
> + * Copyright (C) 2017-2019 Niklas Söderlund
> + * Copyright (C) 2016 Renesas Electronics Corporation
> + * Copyright (C) 2015 Cogent Embedded, Inc.
> + */
> +
> +/*
> + * The camera is made of an Omnivision OV10635 sensor connected to a Maxim
> + * MAX9271 GMSL serializer.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/fwnode.h>
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "max9271.h"
> +
> +#define OV10635_I2C_ADDRESS		0x30
> +
> +#define OV10635_SOFTWARE_RESET		0x0103
> +#define OV10635_PID			0x300a
> +#define OV10635_VER			0x300b
> +#define OV10635_SC_CMMN_SCCB_ID		0x300c
> +#define OV10635_SC_CMMN_SCCB_ID_SELECT	BIT(0)
> +#define OV10635_VERSION			0xa635
> +
> +#define OV10635_WIDTH			1280
> +#define OV10635_HEIGHT			800
> +#define OV10635_FORMAT			MEDIA_BUS_FMT_UYVY8_2X8

This OV10635_FORMAT define was very confusing when I reviewed this code.

Please just use MEDIA_BUS_FMT_UYVY8_2X8 directly instead of introducing
an alias. While reviewing I thought for a moment that OV10635_FORMAT was
somehow a new mediabus format that was added elsewhere. I had to dig into
the code to figure out that it really was an alias.

Regards,

	Hans

