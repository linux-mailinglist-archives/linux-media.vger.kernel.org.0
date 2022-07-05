Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5446C56722B
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 17:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbiGEPLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 11:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbiGEPLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 11:11:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA68EF79
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 08:10:02 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dn9so16897289ejc.7
        for <linux-media@vger.kernel.org>; Tue, 05 Jul 2022 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=84ixPMBcqyK4kX5DhNK5Zc0EVU+8fctZFZ9/p9Y8i1g=;
        b=SImKgypfWML+rfPds8OsEkDTRaEzcwEavAM3Z3TL5SYJXgrhfD8RERTk7DTdS/lCaA
         MwNDkVtUBlF9vKwyXQ6kfQUlseQSHHNVZtwiDdMqhEZflTcU3jBYoz6co/UJbOJj1Vi1
         J4JOv9rYeyF07MuhVAhE61UTyYMtzO8qV+pEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=84ixPMBcqyK4kX5DhNK5Zc0EVU+8fctZFZ9/p9Y8i1g=;
        b=RbVLaGYzOGtyBX67C/HcEbIJ5qDGdrf1/Gq/qjfPQpUMUG9/ImgwEIhY0lwnZhKZIG
         MMAJjPOPphezwyXdH8/GfCioML2qV22BV9axbYCr8Aacj+890l2mI7rW0xHud3pVfpRv
         BN7D1dPSckBwjsdKaz6hBKxV8nUIZcC9P/Fv/EZAIM0l08RUZJtYr0ztTN5TslzBr0Nd
         Zm5aTs8UMflasDs7qeEJ579THdNkhdbYcXSFkQkikVLTKFzXPhjdT7JtY2XVYR4NXJPA
         3msFjGm4fO3Ng+Ofo/iOI/qRFnqkP3jLt+frgToDIzXMHDXldJgt9Peod0itHpWy+9k3
         VB6g==
X-Gm-Message-State: AJIora87ATUZg7MJhP+Ns+RAIlkA0Ma+rmaBmV3VZbYXc8ELWME4NTYT
        2+Eco0XNlUlJ2a3KP8YrIrPesQ==
X-Google-Smtp-Source: AGRyM1tTiEzy7vm2hJuHR5SOjLNS/asL9apGFRV9GQFBZN5hpVUwFbUfIJDb/uIZlgoZ4huARrxbEg==
X-Received: by 2002:a17:907:86ab:b0:726:3ebe:8d66 with SMTP id qa43-20020a17090786ab00b007263ebe8d66mr34121175ejc.352.1657033801409;
        Tue, 05 Jul 2022 08:10:01 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p22-20020a170906605600b00722c44f9301sm15846003ejj.224.2022.07.05.08.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 08:10:00 -0700 (PDT)
Date:   Tue, 5 Jul 2022 18:13:05 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsRVAV8a48CwpaSY@p310.k.g>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <Yr38wcjA24QkZSRQ@pendragon.ideasonboard.com>
 <YsQHwUCLlombAj85@p310.k.g>
 <12352558.O9o76ZdvQC@steina-w>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="XT9Xor3Me90eBYhN"
Content-Disposition: inline
In-Reply-To: <12352558.O9o76ZdvQC@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--XT9Xor3Me90eBYhN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22-07-05 16:42:16, Alexander Stein wrote:
> Hi Petko,
> 
> Am Dienstag, 5. Juli 2022, 11:43:29 CEST schrieb Petko Manolov:
> > On 22-06-30 22:42:57, Laurent Pinchart wrote:
> > > On Thu, Jun 30, 2022 at 09:52:05PM +0300, Petko Manolov wrote:
> > > > On 22-06-30 03:50:55, Laurent Pinchart wrote:
> > > > > For an i.MX8MM I'd try running the mainline kernel directly. If that 
> > > > > doesn't work, I would backport the camera drivers from mainline to the 
> > > > > v5.15 NXP kernel. As far as I know, the v5.18 branch isn't an official 
> > > > > BSP release (I'm actually not sure what it's for).
> > > > 
> > > > The 5.15 NXP kernel got released sometime in June, but the CSI capture 
> > > > drivers are pretty much the same as in their older versions.  So sad...
> > > > 
> > > > Nevermind, i'll share any good news here as well as the imx492 driver 
> > > > code as soon i am certain it can successfully stream in at least one 
> > > > mode.
> > > > 
> > > > BTW, the 'fec' section in Variscite's var-som-symphony DT is broken for 
> > > > v5.18 (mainline) kernels. I am not certain whom should i send the patch.  
> > > > Would that be Rob Herring or should i just use 'git blame' to identify 
> > > > the victim? :)>
> > > scripts/get_maintainer.pl is your friend for that.
> > 
> > Done, sent a patch for review to lkml and Rob.
> 
> Do you have a link for the mailing list archive? I failed to find the patch. I 
> just want to check how things are done compared to other sensors.

There you go.

The driver is neither interesting nor complex.  It seems, however, that getting 
this to run on imx8m-mini will require either other tools than plain v4l2-ctl or 
i am missing something here.  

I wonder if i have to play with media-ctl and connect all the dots between the 
Sony sensor, to mipi-csi bridge to the imx7-capture (or whatever the damn name 
is) device.


thanks,
Petko

--XT9Xor3Me90eBYhN
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="imx492.c"

// SPDX-License-Identifier: GPL-2.0-only
/*
 * Sony imx492 Camera Sensor Driver (based on imx412.c source);
 *
 * Copyright (C) 2022 Petko Manolov <petko.manolov@konsulko.com>
 */

#define	DEBUG

#include <asm/unaligned.h>

#include <linux/clk.h>
#include <linux/delay.h>
#include <linux/i2c.h>
#include <linux/module.h>
#include <linux/pm_runtime.h>
#include <linux/regulator/consumer.h>

#include <media/v4l2-ctrls.h>
#include <media/v4l2-fwnode.h>
#include <media/v4l2-subdev.h>

/* Streaming Mode */
#define IMX492_REG_MODE_SELECT	0x3000

/* Chip ID */
#define IMX492_ID		0x13

/* Analog gain control */
#define IMX492_REG_AGAIN	0x300a
#define IMX492_AGAIN_MIN	0
#define IMX492_AGAIN_MAX	978
#define IMX492_AGAIN_STEP	1
#define IMX492_AGAIN_DEFAULT	0

/* Group hold register */
#define IMX492_REG_HOLD		0x302b
#define	IMX492_REG_XMSTA	0x3033
#define	IMX492_REG_SYSCLKEN	0x35e5

/* Input clock rate */
#define IMX492_INCLK_RATE	24000000

/* CSI2 HW configuration */
#define IMX492_LINK_FREQ	456000000
#define IMX492_NUM_DATA_LANES	4

#define IMX492_REG_MIN		0x3000
#define IMX492_REG_MAX		0xffff

/* *** */

#define IMX492_REG_STANDBY	IMX492_REG_MODE_SELECT
#define IMX492_BIT_STANDBY	0x01
#define IMX492_BIT_STBLOGIC	0x02
#define IMX492_BIT_STBDV	0x10

#define IMX492_MODE_STANDBY	(IMX492_BIT_STBDV | IMX492_BIT_STBLOGIC | IMX492_BIT_STANDBY)
#define IMX492_MODE_STREAMING	0x00

#define IMX492_REG_TESTPTRN	0x303A
#define IMX492_BIT_CLKEN	0x01
#define IMX492_BIT_TESTPTRN	0x10
#define IMX492_BITS_TPTRN_ON	(IMX492_BIT_TESTPTRN | IMX492_BIT_CLKEN)

#define IMX492_REG_TESTPATSEL	0x303B
#define IMX492_BIT_TPAT00	0x00
#define IMX492_BIT_TPAT01	0x01
#define IMX492_BIT_TPAT02	0x02
#define IMX492_BIT_TPAT03	0x03
#define IMX492_BIT_TPAT0A	0x0A
#define IMX492_BIT_TPAT0B	0x0B

#define IMX492_EXPOSURE_MIN		8
#define IMX492_EXPOSURE_OFFSET		22
#define IMX492_EXPOSURE_STEP		1
#define IMX492_EXPOSURE_DEFAULT		0x0648

#define	DEFAULT_FPS		6

/**
 * struct imx492_reg - imx492 sensor register
 * @address: Register address
 * @val: Register value
 */
struct imx492_reg {
	u16 address;
	u8 val;
};

/**
 * struct imx492_reg_list - imx492 sensor register list
 * @num_of_regs: Number of registers in the list
 * @regs: Pointer to register list
 */
struct imx492_reg_list {
	u32 num_of_regs;
	const struct imx492_reg *regs;
};

/**
 * struct imx492_mode - imx492 sensor mode structure
 * @width: Frame width
 * @height: Frame height
 * @code: Format code
 * @hblank: Horizontal blanking in lines
 * @vblank: Vertical blanking in lines
 * @vblank_min: Minimum vertical blanking in lines
 * @vblank_max: Maximum vertical blanking in lines
 * @pclk: Sensor pixel clock
 * @link_freq_idx: Link frequency index
 * @reg_list: Register list for sensor mode
 */
struct imx492_mode {
	u32 width;
	u32 height;
	u32 code;
	u32 hblank;
	u32 vblank;
	u32 vblank_min;
	u32 vblank_max;
	u64 pclk;
	u32 link_freq_idx;
	struct imx492_reg_list reg_list;
};

/**
 * struct imx492 - imx492 sensor device structure
 * @dev: Pointer to generic device
 * @client: Pointer to i2c client
 * @sd: V4L2 sub-device
 * @pad: Media pad. Only one pad supported
 * @reset_gpio: Sensor reset gpio
 * @reset_gpio: Sensor power gpio
 * @inclk: Sensor input clock
 * @supplies: Regulator supplies
 * @ctrl_handler: V4L2 control handler
 * @link_freq_ctrl: Pointer to link frequency control
 * @pclk_ctrl: Pointer to pixel clock control
 * @hblank_ctrl: Pointer to horizontal blanking control
 * @vblank_ctrl: Pointer to vertical blanking control
 * @exp_ctrl: Pointer to exposure control
 * @again_ctrl: Pointer to analog gain control
 * @vblank: Vertical blanking in lines
 * @cur_mode: Pointer to current selected sensor mode
 * @mutex: Mutex for serializing sensor controls
 * @streaming: Flag indicating streaming state
 */
struct imx492 {
	struct device *dev;
	struct i2c_client *client;
	struct v4l2_subdev sd;
	struct media_pad pad;
	struct v4l2_captureparm scap;
	struct gpio_desc *reset_gpio;
	struct gpio_desc *power_gpio;
	struct gpio_desc *oscen_gpio;
	struct clk *inclk;
	struct v4l2_ctrl_handler ctrl_handler;
	struct v4l2_ctrl *link_freq_ctrl;
	struct v4l2_ctrl *pclk_ctrl;
	struct v4l2_ctrl *hblank_ctrl;
	struct v4l2_ctrl *vblank_ctrl;
	struct {
		struct v4l2_ctrl *exp_ctrl;
		struct v4l2_ctrl *again_ctrl;
	};
	u32 vblank;
	const struct imx492_mode *cur_mode;
	struct mutex mutex;
	bool streaming;
};

static const s64 link_freq[] = {
	IMX492_LINK_FREQ,
};

/* Sensor mode registers */
static const struct imx492_reg mode_7408x5556_regs[] = {
	{0x3033, 0x30},
	{0x303C, 0x01},
	{0x31e8, 0x20},
	/* PLL settings */
	{0x31e9, 0x01},
	{0x3122, 0x01},
	{0x3129, 0x90},
	{0x312a, 0x01},
	{0x311f, 0x00},
	{0x3123, 0x00},
	{0x3124, 0x00},
	{0x3125, 0x01},
	{0x3127, 0x02},
	{0x312d, 0x02},
	/* standby cancel */
	{0x3000, 0x12},
	/* PLL release */
	{0x310b, 0x00},
	/* Initialize communication */
	{0x3004, 0x1c},
	{0x3005, 0x06},
	{0x3006, 0x00},
	{0x3506, 0x56},
	{0x3007, 0xa7},
	{0x3c08, 0x3f},
	{0x340c, 0x6e},
	{0x350c, 0x56},
	{0x3c0c, 0x1b},
	{0x350e, 0x58},
	{0x371c, 0x02},
	{0x382b, 0x68},
	{0x332f, 0x00},
	{0x372f, 0x3c},
	{0x3730, 0x01},
	{0x3732, 0xb8},
	{0x3234, 0x32},
	{0x3734, 0x4a},
	{0x3736, 0x57},
	{0x3836, 0x34},
	{0x3738, 0x4d},
	{0x353d, 0x10},
	{0x3a43, 0x00},
	{0x3744, 0x0f},
	{0x3146, 0x00},
	{0x3047, 0x02},
	{0x3248, 0xbc},
	{0x3448, 0x7e},
	{0x3549, 0x04},
	{0x334c, 0x01},
	{0x304e, 0x0b},
	{0x304f, 0x2a},
	{0x3250, 0xbc},
	{0x3052, 0xee},
	{0x3352, 0x50},
	{0x3a54, 0x00},
	{0x3a55, 0x1e},
	{0x3356, 0x4f},
	{0x3258, 0xbc},
	{0x335a, 0x79},
	{0x375b, 0x01},
	{0x355d, 0x03},
	{0x335e, 0x56},
	{0x355e, 0x03},
	{0x3260, 0xbc},
	{0x3360, 0x6a},
	{0x3062, 0x25},
	{0x3064, 0x78},
	{0x3065, 0x33},
	{0x3066, 0x64},
	{0x3067, 0x71},
	{0x336a, 0x56},
	{0x366a, 0x04},
	{0x366b, 0x04},
	{0x366c, 0x00},
	{0x366d, 0x00},
	{0x366e, 0x00},
	{0x366f, 0x00},
	{0x3670, 0x00},
	{0x3671, 0x05},
	{0x3274, 0x13},
	{0x3574, 0x56},
	{0x3276, 0x00},
	{0x3676, 0x83},
	{0x3277, 0x00},
	{0x3677, 0x03},
	{0x3678, 0x00},
	{0x3679, 0x04},
	{0x367a, 0x2c},
	{0x367b, 0x05},
	{0x327c, 0x13},
	{0x367d, 0x06},
	{0x327e, 0x00},
	{0x367e, 0xff},
	{0x327f, 0x00},
	{0x357f, 0x0c},
	{0x367f, 0x06},
	{0x3580, 0x0a},
	{0x3680, 0x4b},
	{0x3e80, 0x14},
	{0x3081, 0x00},
	{0x3581, 0x08},
	{0x3e82, 0x30},
	{0x3583, 0x72},
	{0x3284, 0x13},
	{0x3e84, 0x04},
	{0x3e85, 0x01},
	{0x3286, 0x00},
	{0x3e86, 0x10},
	{0x3287, 0x00},
	{0x3587, 0x01},
	{0x3e87, 0x16},
	{0x3088, 0x75},
	{0x3688, 0x05},
	{0x3e88, 0x03},
	{0x3e89, 0xfe},
	{0x308a, 0x09},
	{0x3e8a, 0x01},
	{0x3e8b, 0x06},
	{0x308c, 0x61},
	{0x328c, 0x13},
	{0x328e, 0x00},
	{0x348e, 0x6f},
	{0x3e8e, 0x03},
	{0x328f, 0x00},
	{0x3e8f, 0xfe},
	{0x3690, 0x27},
	{0x3e90, 0x01},
	{0x3e91, 0x06},
	{0x3492, 0x11},
	{0x3682, 0x65},
	{0x3694, 0x4f},
	{0x3e94, 0x33},
	{0x3e95, 0x01},
	{0x3696, 0xa1},
	{0x3e96, 0x19},
	{0x3e98, 0x30},
	{0x3e9a, 0x09},
	{0x3e9c, 0x10},
	{0x3e9d, 0x16},
	{0x3e9e, 0xfe},
	{0x3e9f, 0x03},
	{0x3ea0, 0x06},
	{0x3ea3, 0x01},
	{0x3ea4, 0xfe},
	{0x3ea5, 0x03},
	{0x3ea6, 0x06},
	{0x3ea9, 0x33},
	{0x3eaa, 0x00},
	{0x3eab, 0x08},
	{0x3eac, 0x08},
	{0x3ead, 0x01},
	{0x32ae, 0x00},
	{0x3eae, 0x08},
	{0x32af, 0x00},
	{0x3eaf, 0x08},
	{0x3eb0, 0x00},
	{0x3eb1, 0x10},
	{0x3eb2, 0x10},
	{0x38b3, 0x00},
	{0x3eb3, 0x01},
	{0x3eb4, 0x10},
	{0x3eb5, 0x10},
	{0x3eb6, 0x00},
	{0x3eb7, 0x00},
	{0x3eb8, 0x00},
	{0x3eb9, 0x00},
	{0x3eba, 0x00},
	{0x3ebb, 0x00},
	{0x3ec0, 0x54},
	{0x34c4, 0x5a},
	{0x3ac4, 0x00},
	{0x32ca, 0x5a},
	{0x3ecc, 0x04},
	{0x3ecd, 0x04},
	{0x35d0, 0x5e},
	{0x3ed0, 0xf0},
	{0x3ed1, 0x20},
	{0x3ed2, 0x0b},
	{0x3ed3, 0x04},
	{0x35d4, 0x63},
	{0x3ed5, 0x13},
	{0x33d6, 0x79},
	{0x3ed6, 0x00},
	{0x3ed9, 0x0f},
	{0x3ee4, 0x02},
	{0x30e5, 0x00},
	{0x3ee5, 0x02},
	{0x3ee7, 0x00},
	{0x30ef, 0x01},
	{0x31f5, 0x01},
	{0x3ef6, 0x00},
	{0x3ef8, 0x10},
	{0x3efa, 0x00},
	{0x3efc, 0x10},
	{0x3134, 0xaf},
	{0x3135, 0x00},
	{0x3136, 0xc7},
	{0x3137, 0x00},
	{0x3138, 0x7f},
	{0x3139, 0x00},
	{0x313a, 0x6f},
	{0x313b, 0x00},
	{0x313c, 0x6f},
	{0x313d, 0x00},
	{0x313e, 0xcf},
	{0x313f, 0x01},
	{0x3140, 0x77},
	{0x3141, 0x00},
	{0x3142, 0x5f},
	{0x3143, 0x00},
	{0x300e, 0x0c},
	{0x300f, 0x00},
	{0x302c, 0x0a},
	{0x302d, 0x00},
	{0x3034, 0x01},
	{0x3035, 0x00},
	{0x3036, 0x00},
	{0x3037, 0x00},
	{0x3038, 0x00},
	{0x3039, 0x00},
	{0x3084, 0x00},
	{0x3085, 0x00},
	{0x3086, 0x00},
	{0x3087, 0x00},
	{0x30a9, 0x60},
	{0x30aa, 0x16},
	{0x30ab, 0x00},
	{0x30ac, 0xb2},
	{0x30ad, 0x04},
	{0x30e2, 0x0b},
	{0x312f, 0x20},
	{0x3130, 0x30},
	{0x3131, 0x16},
	{0x3132, 0x10},
	{0x3133, 0x16},
	{0x332c, 0x00},
	{0x332d, 0x00},
	{0x334a, 0x00},
	{0x334b, 0x00},
	{0x35b6, 0x00},
	{0x35b7, 0x00},
	{0x35b8, 0x00},
	{0x35b9, 0x00},
	{0x36bc, 0x00},
	{0x36bd, 0x00},
	{0x3008, 0x00},
	{0x3042, 0x32},
	{0x300a, 0xa5},
	{0x300b, 0x07},
	{0x3012, 0x01},
};

/* Supported sensor mode configurations */
static const struct imx492_mode supported_mode = {
#if 0
	.width = 7408,
	.height = 5556,
#else
	.width = 1920,
	.height = 1080,
#endif
	.hblank = 842,
	.vblank = 1020,
	.vblank_min = 500,
	.vblank_max = 5728,
	.pclk = 480000000,
	.link_freq_idx = 0,
#if 1
	.code = MEDIA_BUS_FMT_SGBRG12_1X12,
#else
	.code = MEDIA_BUS_FMT_YUYV8_2X8,
#endif
	.reg_list = {
		.num_of_regs = ARRAY_SIZE(mode_7408x5556_regs),
		.regs = mode_7408x5556_regs,
	},
};

/**
 * to_imx492() - imx492 V4L2 sub-device to imx492 device.
 * @subdev: pointer to imx492 V4L2 sub-device
 *
 * Return: pointer to imx492 device
 */
static inline struct imx492 *to_imx492(struct v4l2_subdev *subdev)
{
	return container_of(subdev, struct imx492, sd);
}

/**
 * imx492_read_reg() - Read registers.
 * @imx492: pointer to imx492 device
 * @reg: register address
 * @len: length of bytes to read. Max supported bytes is 4
 * @val: pointer to register value to be filled.
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_read_reg(struct imx492 *imx492, u16 reg, u32 len, u32 *val)
{
	struct i2c_client *client = v4l2_get_subdevdata(&imx492->sd);
	struct i2c_msg msgs[2] = {0};
	u8 addr_buf[2] = {0};
	u8 data_buf[4] = {0};
	int ret;

	/* printk("%s: reg %04x, len %d\n", __func__, reg, len); */

	if (WARN_ON(len > 4))
		return -EINVAL;

	put_unaligned_be16(reg, addr_buf);

	/* Write register address */
	msgs[0].addr = client->addr;
	msgs[0].flags = 0;
	msgs[0].len = ARRAY_SIZE(addr_buf);
	msgs[0].buf = addr_buf;

	/* Read data from register */
	msgs[1].addr = client->addr;
	msgs[1].flags = I2C_M_RD;
	msgs[1].len = len;
	msgs[1].buf = &data_buf[4 - len];

	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
	if (ret != ARRAY_SIZE(msgs))
		return -EIO;

	*val = get_unaligned_be32(data_buf);

	return 0;
}

/**
 * imx492_write_reg() - Write register
 * @imx492: pointer to imx492 device
 * @reg: register address
 * @len: length of bytes. Max supported bytes is 4
 * @val: register value
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_write_reg(struct imx492 *imx492, u16 reg, u32 len, u32 val)
{
	struct i2c_client *client = v4l2_get_subdevdata(&imx492->sd);
	u8 buf[6] = {0};

	if (WARN_ON(len > 4))
		return -EINVAL;

	put_unaligned_be16(reg, buf);
	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
	if (i2c_master_send(client, buf, len + 2) != len + 2)
		return -EIO;

	return 0;
}

/**
 * imx492_write_regs() - Write a list of registers
 * @imx492: pointer to imx492 device
 * @regs: list of registers to be written
 * @len: length of registers array
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_write_regs(struct imx492 *imx492,
			     const struct imx492_reg *regs, u32 len)
{
	unsigned int i;
	int ret;

	for (i = 0; i < len; i++) {
		ret = imx492_write_reg(imx492, regs[i].address, 1, regs[i].val);
		if (ret)
			return ret;
	}

	return 0;
}

/**
 * imx492_update_controls() - Update control ranges based on streaming mode
 * @imx492: pointer to imx492 device
 * @mode: pointer to imx492_mode sensor mode
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_update_controls(struct imx492 *imx492,
				  const struct imx492_mode *mode)
{
	int ret;

	ret = __v4l2_ctrl_s_ctrl(imx492->link_freq_ctrl, mode->link_freq_idx);
	if (ret)
		return ret;
#if 0
	ret = __v4l2_ctrl_s_ctrl(imx492->hblank_ctrl, mode->hblank);
	if (ret)
		return ret;
#endif
	return __v4l2_ctrl_modify_range(imx492->vblank_ctrl, mode->vblank_min,
					mode->vblank_max, 1, mode->vblank);
}

/**
 * imx492_update_exp_gain() - Set updated exposure and gain
 * @imx492: pointer to imx492 device
 * @exposure: updated exposure value
 * @gain: updated analog gain value
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_update_exp_gain(struct imx492 *imx492, u32 exposure, u32 gain)
{
	u32 lpfr, shutter;
	int ret;

	lpfr = imx492->vblank + imx492->cur_mode->height;
	shutter = lpfr - exposure;

	dev_dbg(imx492->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u",
		exposure, gain, shutter, lpfr);

	ret = imx492_write_reg(imx492, IMX492_REG_HOLD, 1, 1);
	if (ret)
		return ret;

	ret = imx492_write_reg(imx492, IMX492_REG_AGAIN, 2, gain);

	return ret;
}

/**
 * imx492_set_ctrl() - Set subdevice control
 * @ctrl: pointer to v4l2_ctrl structure
 *
 * Supported controls:
 * - V4L2_CID_VBLANK
 * - cluster controls:
 *   - V4L2_CID_ANALOGUE_GAIN
 *   - V4L2_CID_EXPOSURE
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_set_ctrl(struct v4l2_ctrl *ctrl)
{
	struct imx492 *imx492 =
		container_of(ctrl->handler, struct imx492, ctrl_handler);
	u32 analog_gain;
	u32 exposure;
	int ret;

	printk("%s: fmt ctrl->id %d\n", __func__, ctrl->id);

	switch (ctrl->id) {
	case V4L2_CID_VBLANK:
		imx492->vblank = imx492->vblank_ctrl->val;

		dev_dbg(imx492->dev, "Received vblank %u, new lpfr %u",
			imx492->vblank,
			imx492->vblank + imx492->cur_mode->height);

		ret = __v4l2_ctrl_modify_range(imx492->exp_ctrl,
					       IMX492_EXPOSURE_MIN,
					       imx492->vblank +
					       imx492->cur_mode->height -
					       IMX492_EXPOSURE_OFFSET,
					       1, IMX492_EXPOSURE_DEFAULT);
		break;
	case V4L2_CID_EXPOSURE:
		/* Set controls only if sensor is in power on state */
		if (!pm_runtime_get_if_in_use(imx492->dev))
			return 0;
		exposure = ctrl->val;
		analog_gain = imx492->again_ctrl->val;

		dev_dbg(imx492->dev, "Received exp %u, analog gain %u",
			exposure, analog_gain);

		ret = imx492_update_exp_gain(imx492, exposure, analog_gain);
		pm_runtime_put(imx492->dev);
		break;
	default:
		dev_err(imx492->dev, "Invalid control %d", ctrl->id);
		ret = -EINVAL;
	}

	return ret;
}

/* V4l2 subdevice control ops*/
static const struct v4l2_ctrl_ops imx492_ctrl_ops = {
	.s_ctrl = imx492_set_ctrl,
};

/**
 * imx492_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
 * @sd: pointer to imx492 V4L2 sub-device structure
 * @sd_state: V4L2 sub-device configuration
 * @code: V4L2 sub-device code enumeration need to be filled
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_enum_mbus_code(struct v4l2_subdev *sd,
				 struct v4l2_subdev_state *sd_state,
				 struct v4l2_subdev_mbus_code_enum *code)
{
	printk("%s: index %d, mbus_code %d\n", __func__, code->index, code->code);

	if (code->index > 0) {
		return -EINVAL;
	}

	code->code = supported_mode.code;

	return 0;
}

/**
 * imx492_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
 * @sd: pointer to imx492 V4L2 sub-device structure
 * @sd_state: V4L2 sub-device configuration
 * @fsize: V4L2 sub-device size enumeration need to be filled
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_enum_frame_size(struct v4l2_subdev *sd,
				  struct v4l2_subdev_state *sd_state,
				  struct v4l2_subdev_frame_size_enum *fsize)
{
	if (fsize->index > 0)
		return -EINVAL;

	if (fsize->code != supported_mode.code)
		return -EINVAL;

	printk("%s: index %d, code %d\n", __func__, fsize->index, fsize->code);

	fsize->max_width = supported_mode.width;
	fsize->min_width = fsize->max_width;
	fsize->max_height = supported_mode.height;
	fsize->min_height = fsize->max_height;

	return 0;
}

/**
n * imx492_fill_pad_format() - Fill subdevice pad format
 *                            from selected sensor mode
 * @imx492: pointer to imx492 device
 * @mode: pointer to imx492_mode sensor mode
 * @fmt: V4L2 sub-device format need to be filled
 */
static void imx492_fill_pad_format(struct imx492 *imx492,
				   const struct imx492_mode *mode,
				   struct v4l2_subdev_format *fmt)
{
	fmt->format.width = mode->width;
	fmt->format.height = mode->height;
	fmt->format.code = mode->code;
	fmt->format.field = V4L2_FIELD_NONE;
	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
	fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;
	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
}

/**
 * imx492_get_pad_format() - Get subdevice pad format
 * @sd: pointer to imx492 V4L2 sub-device structure
 * @sd_state: V4L2 sub-device configuration
 * @fmt: V4L2 sub-device format need to be set
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_get_pad_format(struct v4l2_subdev *sd,
				 struct v4l2_subdev_state *sd_state,
				 struct v4l2_subdev_format *fmt)
{
	struct imx492 *imx492 = to_imx492(sd);

	printk("%s: fmt bool %d\n", __func__, fmt->which == V4L2_SUBDEV_FORMAT_TRY);

	mutex_lock(&imx492->mutex);

	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
		struct v4l2_mbus_framefmt *framefmt;

		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
		fmt->format = *framefmt;
	} else {
		imx492_fill_pad_format(imx492, imx492->cur_mode, fmt);
	}

	mutex_unlock(&imx492->mutex);

	return 0;
}

/**
 * imx492_set_pad_format() - Set subdevice pad format
 * @sd: pointer to imx492 V4L2 sub-device structure
 * @sd_state: V4L2 sub-device configuration
 * @fmt: V4L2 sub-device format need to be set
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_set_pad_format(struct v4l2_subdev *sd,
				 struct v4l2_subdev_state *sd_state,
				 struct v4l2_subdev_format *fmt)
{
	struct imx492 *imx492 = to_imx492(sd);
	const struct imx492_mode *mode;
	int ret = 0;

	mutex_lock(&imx492->mutex);

	mode = &supported_mode;
	imx492_fill_pad_format(imx492, mode, fmt);

	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
		struct v4l2_mbus_framefmt *framefmt;

		printk("%s: fmt V4L2_SUBDEV_FORMAT_TRY\n", __func__);
		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
		*framefmt = fmt->format;
	} else {
		printk("%s: fmt update ctrls, ret %d\n", __func__, ret);
		ret = imx492_update_controls(imx492, mode);
		if (!ret)
			imx492->cur_mode = mode;
		printk("%s:2 fmt update ctrls, ret %d\n", __func__, ret);
	}

	mutex_unlock(&imx492->mutex);

	return ret;
}

/**
 * imx492_init_pad_cfg() - Initialize sub-device pad configuration
 * @sd: pointer to imx492 V4L2 sub-device structure
 * @sd_state: V4L2 sub-device configuration
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_init_pad_cfg(struct v4l2_subdev *sd,
			       struct v4l2_subdev_state *sd_state)
{
	struct imx492 *imx492 = to_imx492(sd);
	struct v4l2_subdev_format fmt = { 0 };

	printk("%s: fmt which %d\n", __func__, fmt.which);

	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
	imx492_fill_pad_format(imx492, &supported_mode, &fmt);

	return imx492_set_pad_format(sd, sd_state, &fmt);
}

/**
 * imx492_start_streaming() - Start sensor stream
 * @imx492: pointer to imx492 device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_start_streaming(struct imx492 *imx492)
{
	const struct imx492_reg_list *reg_list;
	int ret;

	/* Write sensor mode registers */
	reg_list = &imx492->cur_mode->reg_list;
	ret = imx492_write_regs(imx492, reg_list->regs,
				reg_list->num_of_regs);
	if (ret) {
		dev_err(imx492->dev, "fail to write initial registers");
		return ret;
	}

	/* Setup handler will write actual exposure and gain */
	ret = __v4l2_ctrl_handler_setup(imx492->sd.ctrl_handler);
	if (ret) {
		dev_err(imx492->dev, "fail to setup handler");
		return ret;
	}

	/* 1st stabilization period */
	usleep_range(10000, 11000);

	imx492_write_reg(imx492, IMX492_REG_MODE_SELECT, 1, 0x02);
	imx492_write_reg(imx492, IMX492_REG_SYSCLKEN, 1, 0x92);
	imx492_write_reg(imx492, IMX492_REG_SYSCLKEN, 1, 0x9a);
	imx492_write_reg(imx492, IMX492_REG_MODE_SELECT, 1, IMX492_MODE_STREAMING);

	/* 2nd stabilization period */
	usleep_range(7000, 8000);

	/* Start streaming */
	ret = imx492_write_reg(imx492, IMX492_REG_XMSTA, 1, 0x20);

	if (ret) {
		dev_err(imx492->dev, "fail to start streaming");
		return ret;
	}

	dev_info(imx492->dev, "IMX492 should be streaming now...\n");

	return 0;
}

/**
 * imx492_stop_streaming() - Stop sensor stream
 * @imx492: pointer to imx492 device
 *
 * Return: 0 if successful, error code otherwise.
 */
static void imx492_stop_streaming(struct imx492 *imx492)
{
	imx492_write_reg(imx492, IMX492_REG_MODE_SELECT, 1, IMX492_MODE_STANDBY);
	imx492_write_reg(imx492, IMX492_REG_XMSTA, 1, 0x10);
	dev_dbg(imx492->dev, "%s()\n", __func__);
}

/**
 * imx492_set_stream() - Enable sensor streaming
 * @sd: pointer to imx492 subdevice
 * @enable: set to enable sensor streaming
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_set_stream(struct v4l2_subdev *sd, int enable)
{
	struct imx492 *imx492 = to_imx492(sd);
	int ret;

	mutex_lock(&imx492->mutex);

	if (imx492->streaming == enable) {
		mutex_unlock(&imx492->mutex);
		return 0;
	}

	if (enable) {
		ret = pm_runtime_resume_and_get(imx492->dev);
		if (ret)
			goto error_unlock;
		ret = imx492_start_streaming(imx492);
		if (ret)
			goto error_power_off;
	} else {
		imx492_stop_streaming(imx492);
		pm_runtime_put(imx492->dev);
	}

	imx492->streaming = enable;

	mutex_unlock(&imx492->mutex);

	return 0;

error_power_off:
	pm_runtime_put(imx492->dev);
error_unlock:
	mutex_unlock(&imx492->mutex);

	return ret;
}

/**
 * imx492_detect() - Detect imx492 sensor
 * @imx492: pointer to imx492 device
 *
 * Return: 0 if successful, -EIO if sensor id does not match
 */
static int imx492_detect(struct imx492 *imx492)
{
	int ret;
	u32 val;

	ret = imx492_read_reg(imx492, IMX492_REG_STANDBY, 1, &val);
	if (ret) {
		return ret;
	}

	if (val != IMX492_ID) {
		dev_err(imx492->dev, "chip id mismatch: %x!=%x", IMX492_ID, val);
		return -ENXIO;
	}

	printk("%s: detected!\n", __func__);

	return 0;
}

/**
 * imx492_parse_hw_config() - Parse HW configuration and check if supported
 * @imx492: pointer to imx492 device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_parse_hw_config(struct imx492 *imx492)
{
	struct fwnode_handle *fwnode = dev_fwnode(imx492->dev);
	struct v4l2_fwnode_endpoint bus_cfg = {
		.bus_type = V4L2_MBUS_CSI2_DPHY
	};
	struct fwnode_handle *ep;
	unsigned long rate;
	unsigned int i;
	int ret;

	if (!fwnode)
		return -ENXIO;

	imx492->power_gpio = devm_gpiod_get(imx492->dev, "power", GPIOD_OUT_HIGH);
	if (IS_ERR(imx492->power_gpio)) {
		dev_err(imx492->dev, "failed to get power gpio %ld",
			PTR_ERR(imx492->power_gpio));
		return PTR_ERR(imx492->power_gpio);
	}

	imx492->oscen_gpio = devm_gpiod_get(imx492->dev, "oscen", GPIOD_OUT_HIGH);
	if (IS_ERR(imx492->oscen_gpio)) {
		dev_err(imx492->dev, "failed to get oscen gpio %ld",
			PTR_ERR(imx492->oscen_gpio));
		return PTR_ERR(imx492->oscen_gpio);
	}

	imx492->reset_gpio = devm_gpiod_get(imx492->dev, "reset", GPIOD_OUT_HIGH);
	if (IS_ERR(imx492->reset_gpio)) {
		dev_err(imx492->dev, "failed to get reset gpio %ld",
			PTR_ERR(imx492->reset_gpio));
		return PTR_ERR(imx492->reset_gpio);
	}

	if (gpiod_direction_output(imx492->power_gpio, 1) ||
	    gpiod_direction_output(imx492->oscen_gpio, 1) ||
	    gpiod_direction_output(imx492->reset_gpio, 0)) {
		dev_err(imx492->dev, "failed to change gpio direction");
		return -EINVAL;
	}

	/* Get sensor input clock */
	imx492->inclk = devm_clk_get(imx492->dev, NULL);
	if (IS_ERR(imx492->inclk)) {
		dev_err(imx492->dev, "could not get inclk");
		return PTR_ERR(imx492->inclk);
	}

	rate = clk_get_rate(imx492->inclk);
	if (rate != IMX492_INCLK_RATE) {
		dev_err(imx492->dev, "inclk frequency mismatch %ld", rate);
		return -EINVAL;
	}

	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
	if (!ep) {
		dev_err(imx492->dev, "next endpoint?");
		return -ENXIO;
	}

	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
	fwnode_handle_put(ep);
	if (ret) {
		dev_err(imx492->dev, "endpoint alloc parse");
		return ret;
	}

	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX492_NUM_DATA_LANES) {
		dev_err(imx492->dev, "number of CSI2 data lanes %d is not supported",
			bus_cfg.bus.mipi_csi2.num_data_lanes);
		ret = -EINVAL;
		goto done_endpoint_free;
	}

	if (!bus_cfg.nr_of_link_frequencies) {
		dev_err(imx492->dev, "no link frequencies defined");
		ret = -EINVAL;
		goto done_endpoint_free;
	}

	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
		dev_dbg(imx492->dev, "link freq %lld", bus_cfg.link_frequencies[i]);
		if (bus_cfg.link_frequencies[i] == IMX492_LINK_FREQ)
			goto done_endpoint_free;
	}

	ret = -EINVAL;

done_endpoint_free:
	v4l2_fwnode_endpoint_free(&bus_cfg);

	return ret;
}

/* V4l2 subdevice ops */
static const struct v4l2_subdev_video_ops imx492_video_ops = {
	.s_stream = imx492_set_stream,
};

static const struct v4l2_subdev_pad_ops imx492_pad_ops = {
	.init_cfg = imx492_init_pad_cfg,
	.enum_mbus_code = imx492_enum_mbus_code,
	.enum_frame_size = imx492_enum_frame_size,
	.get_fmt = imx492_get_pad_format,
	.set_fmt = imx492_set_pad_format,
};

static const struct v4l2_subdev_ops imx492_subdev_ops = {
	.video = &imx492_video_ops,
	.pad = &imx492_pad_ops,
};

/**
 * imx492_power_on() - Sensor power on sequence
 * @dev: pointer to i2c device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_power_on(struct device *dev)
{
	struct v4l2_subdev *sd = dev_get_drvdata(dev);
	struct imx492 *imx492 = to_imx492(sd);

	dev_dbg(imx492->dev, "%s", __func__);

	gpiod_set_value_cansleep(imx492->power_gpio, 1);
	msleep(1);
	gpiod_set_value_cansleep(imx492->reset_gpio, 1);
	msleep(1);
	gpiod_set_value_cansleep(imx492->oscen_gpio, 1);
	msleep(1);

	return 0;
}

/**
 * imx492_power_off() - Sensor power off sequence
 * @dev: pointer to i2c device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_power_off(struct device *dev)
{
	struct v4l2_subdev *sd = dev_get_drvdata(dev);
	struct imx492 *imx492 = to_imx492(sd);

	dev_dbg(imx492->dev, "%s", __func__);

	gpiod_set_value_cansleep(imx492->oscen_gpio, 0);
	gpiod_set_value_cansleep(imx492->reset_gpio, 0);
	gpiod_set_value_cansleep(imx492->power_gpio, 0);

	return 0;
}

/**
 * imx492_init_controls() - Initialize sensor subdevice controls
 * @imx492: pointer to imx492 device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_init_controls(struct imx492 *imx492)
{
	struct v4l2_ctrl_handler *ctrl_hdlr = &imx492->ctrl_handler;
	const struct imx492_mode *mode = imx492->cur_mode;
	u32 lpfr;
	int ret;

	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 6);
	if (ret)
		return ret;

	/* Serialize controls with sensor device */
	ctrl_hdlr->lock = &imx492->mutex;
	/* Initialize exposure and gain */
	lpfr = mode->vblank + mode->height;
	imx492->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
					     &imx492_ctrl_ops,
					     V4L2_CID_EXPOSURE,
					     IMX492_EXPOSURE_MIN,
					     lpfr - IMX492_EXPOSURE_OFFSET,
					     IMX492_EXPOSURE_STEP,
					     IMX492_EXPOSURE_DEFAULT);

	imx492->again_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
					       &imx492_ctrl_ops,
					       V4L2_CID_ANALOGUE_GAIN,
					       IMX492_AGAIN_MIN,
					       IMX492_AGAIN_MAX,
					       IMX492_AGAIN_STEP,
					       IMX492_AGAIN_DEFAULT);

	v4l2_ctrl_cluster(2, &imx492->exp_ctrl);

	imx492->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
						&imx492_ctrl_ops,
						V4L2_CID_VBLANK,
						mode->vblank_min,
						mode->vblank_max,
						1, mode->vblank);
	dev_dbg(imx492->dev, "%x %x %x\n", mode->vblank_min, mode->vblank_max, mode->vblank);
	/* Read only controls */
#if 0
	imx492->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
						&imx492_ctrl_ops,
						V4L2_CID_HBLANK,
						IMX492_REG_MIN,
						IMX492_REG_MAX,
						1, mode->hblank);
	if (imx492->hblank_ctrl)
		imx492->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;

#endif
	imx492->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
					      &imx492_ctrl_ops,
					      V4L2_CID_PIXEL_RATE,
					      mode->pclk, mode->pclk,
					      1, mode->pclk);

	imx492->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
							&imx492_ctrl_ops,
							V4L2_CID_LINK_FREQ,
							ARRAY_SIZE(link_freq) -
							1,
							mode->link_freq_idx,
							link_freq);
	if (imx492->link_freq_ctrl)
		imx492->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;

	if (ctrl_hdlr->error) {
		dev_err(imx492->dev, "control init failed: %d",	ctrl_hdlr->error);
		v4l2_ctrl_handler_free(ctrl_hdlr);
		return ctrl_hdlr->error;
	}

	imx492->sd.ctrl_handler = ctrl_hdlr;

	return 0;
}

/**
 * imx492_probe() - I2C client device binding
 * @client: pointer to i2c client device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_probe(struct i2c_client *client)
{
	struct imx492 *imx492;
	int ret;

	imx492 = devm_kzalloc(&client->dev, sizeof(*imx492), GFP_KERNEL);
	if (!imx492)
		return -ENOMEM;

	imx492->dev = &client->dev;

	/* Initialize subdev */
	v4l2_i2c_subdev_init(&imx492->sd, client, &imx492_subdev_ops);

	ret = imx492_parse_hw_config(imx492);
	if (ret) {
		dev_err(imx492->dev, "HW configuration is not supported");
		return ret;
	}

	mutex_init(&imx492->mutex);

	ret = imx492_power_on(imx492->dev);
	if (ret) {
		dev_err(imx492->dev, "failed to power-on the sensor");
		goto error_mutex_destroy;
	}

	/* Check module identity */
	ret = imx492_detect(imx492);
	if (ret) {
		dev_err(imx492->dev, "failed to find sensor: %d", ret);
		goto error_power_off;
	}

	/* Set default mode to max resolution */
	imx492->cur_mode = &supported_mode;
	imx492->vblank = imx492->cur_mode->vblank;

	ret = imx492_init_controls(imx492);
	if (ret) {
		dev_err(imx492->dev, "failed to init controls: %d", ret);
		goto error_power_off;
	}

	/* Initialize subdev */
	imx492->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
	imx492->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;

	/* Initialize source pad */
	imx492->pad.flags = MEDIA_PAD_FL_SOURCE;

	imx492->scap.capability = V4L2_MODE_HIGHQUALITY | V4L2_CAP_TIMEPERFRAME;
	imx492->scap.capturemode = 0;
	imx492->scap.timeperframe.denominator = DEFAULT_FPS;
	imx492->scap.timeperframe.numerator = 1;

	ret = media_entity_pads_init(&imx492->sd.entity, 1, &imx492->pad);
	if (ret) {
		dev_err(imx492->dev, "failed to init entity pads: %d", ret);
		goto error_handler_free;
	}

	ret = v4l2_async_register_subdev(&imx492->sd);
	if (ret < 0) {
		dev_err(imx492->dev, "failed to register async subdev: %d", ret);
		goto error_media_entity;
	}

	pm_runtime_set_active(imx492->dev);
	pm_runtime_enable(imx492->dev);
	pm_runtime_idle(imx492->dev);

	return 0;

error_media_entity:
	media_entity_cleanup(&imx492->sd.entity);
error_handler_free:
	v4l2_ctrl_handler_free(imx492->sd.ctrl_handler);
error_power_off:
	imx492_power_off(imx492->dev);
error_mutex_destroy:
	mutex_destroy(&imx492->mutex);

	return ret;
}

/**
 * imx492_remove() - I2C client device unbinding
 * @client: pointer to I2C client device
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx492_remove(struct i2c_client *client)
{
	struct v4l2_subdev *sd = i2c_get_clientdata(client);
	struct imx492 *imx492 = to_imx492(sd);

	v4l2_async_unregister_subdev(sd);
	media_entity_cleanup(&sd->entity);
	v4l2_ctrl_handler_free(sd->ctrl_handler);
	pm_runtime_disable(&client->dev);
	if (!pm_runtime_status_suspended(&client->dev))
		imx492_power_off(&client->dev);
	pm_runtime_set_suspended(&client->dev);
	mutex_destroy(&imx492->mutex);

	return 0;
}

static const struct dev_pm_ops imx492_pm_ops = {
	SET_RUNTIME_PM_OPS(imx492_power_off, imx492_power_on, NULL)
};

static const struct of_device_id imx492_of_match[] = {
	{ .compatible = "sony,imx492_mipi" },
	{ }
};

MODULE_DEVICE_TABLE(of, imx492_of_match);

static struct i2c_driver imx492_driver = {
	.probe_new = imx492_probe,
	.remove = imx492_remove,
	.driver = {
		.name = "imx492",
		.pm = &imx492_pm_ops,
		.of_match_table = imx492_of_match,
	},
};

module_i2c_driver(imx492_driver);

MODULE_DESCRIPTION("Sony imx492 sensor driver");
MODULE_AUTHOR("Petko Manolov <petko.manolov@konsulko.com>");
MODULE_LICENSE("GPL");

--XT9Xor3Me90eBYhN--
