Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064B1544CFA
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 15:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbiFINFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 09:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbiFINFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 09:05:31 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A153FD3
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 06:05:28 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id o7so14060454eja.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 06:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0xmtTB3Tk2Bk4YqQ/MN9u8D/3tmRveKPJzgE4IfTLNA=;
        b=b2gK+sr4q7ZccIAI0RKizsB1xb/hHom0H44pDH1waTsWwOzQX1vaNYD90YrpBsqNC7
         yk55kQHHskHtUlhqqxWn6Ir2W8aYGKn2ePCNbv2zFQbcoHtY+bGWZdYTfDSKxpw6/7rJ
         Rhz3Efjtd6MHSWgv+qYGYcgrJnyPfyB/7TK7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0xmtTB3Tk2Bk4YqQ/MN9u8D/3tmRveKPJzgE4IfTLNA=;
        b=Xgw1mP8xKoTYQ3dtA4rKJ6v1b+GfmbAyDEBBFdAAbpVjriL88FrZQv6eE3mTYZB6Ov
         xWVXv0njACrtk5/+VaH6QiBMIyDXDLpaE9L3rokcAb0/w7Y+08PIg5TzE1hidd84QqjP
         YVXbS6tK0mTeHv9i+VBXhc9GgTTqAJdUmwdVcidgtLxNp0k6YN2aBN+erTmX/NoJDfzH
         1pu5d4COX1ezICnn/SjTNs+O/MZIQ1NGqQNrqoO31MZkF/eAE2SDEseoecP/nncK/Ig8
         iPB2YxpfhWL/+6je9pKK8Gq+fkeQLI2j+1AHC2c+sZIa2gaNCIiOk9KwW5SPE42+1YxF
         FiQw==
X-Gm-Message-State: AOAM531SGhPybqm8AQ4bkbdqRcNKLq5AtpOHhZ2CpzCWQHjGV7obuPA4
        mTfY8ubg4pwYniaRW4GiOp3Gf46UGRR8FA==
X-Google-Smtp-Source: ABdhPJwImZvgOL1yq/WBLJaYOEIoUOn8BWJ9LMD1NhpASEXFFtYwxu3+PWHSHBUK3h1zu+M+DqZkRg==
X-Received: by 2002:a17:907:6e90:b0:711:cb3c:8c1a with SMTP id sh16-20020a1709076e9000b00711cb3c8c1amr21046921ejc.516.1654779926689;
        Thu, 09 Jun 2022 06:05:26 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p19-20020a056402155300b0042617ba638esm14544808edx.24.2022.06.09.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 06:05:26 -0700 (PDT)
Date:   Thu, 9 Jun 2022 16:07:44 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: imx492 camera driver on imx8mm
Message-ID: <YqHwoDJDY7nO2xVI@p310.k.g>
References: <Yp5lIHTt/NhgHNGm@carbon.lan>
 <165474603930.316514.12230941117228914111@Monstersaurus>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5S0rxRVwceSLnhgP"
Content-Disposition: inline
In-Reply-To: <165474603930.316514.12230941117228914111@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--5S0rxRVwceSLnhgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22-06-09 04:40:39, Kieran Bingham wrote:
> Quoting Petko Manolov (2022-06-06 21:35:44)
> >         Hi guys,
> > 
> > I am developing Sony imx492 driver on an imx8mm-based board.  I am obviously
> > missing something important because trying to stream from the sensor (by using
> > v4l2-ctl) i get: "VIDIOC_REQBUFS returned -1 (Invalid argument)". This doesn't
> 
> '-1' is -EPERM. Invalid argument would be -22?
> 
> If you look at vb2_core_reqbufs(), it can return -EINVAL if the planes are not 
> set correctly.

I've found it (the bug) thanks to you mentioning 'planes'.  I was calling 
__v4l2_ctrl_s_ctrl() for controls that have not been initialized...

> > look too bad until one look at dmesg, which goes like:
> > 
> > [   66.589320] link-frequencies 0 value 600000000
> > [   66.589331] imx492 1-0010: imx492_power_on
> > [   66.625823] imx492_detect: detected!
> > [   66.625853] mxc_mipi-csi 32e30000.mipi_csi: Registered sensor subdevice: imx492 1-0010
> > [   66.668356] imx492_set_ctrl: fmt ctrl->id 9963793
> > [  192.742375] mx6s-csi 32e20000.csi1_bridge: csi v4l2 busfreq high request.
> > [  192.742387] imx492_s_power(1):
> > [  192.742428] mx6s-csi 32e20000.csi1_bridge: VIDIOC_G_SELECTION not implemented
> > [  192.742570] mx6s-csi 32e20000.csi1_bridge: VIDIOC_G_SELECTION not implemented
> > [  192.742618] mx6s-csi 32e20000.csi1_bridge: count=3, size=0
> 
> Is this driver (mx6s-csi) in an upstream kernel?

Unfortunatelly - no.  This is v5.4 kernel from Variscite BSP, which in turn is 
based on NXP's BSP.

> > [  192.742620] size=0
> > 
> > and then (just the short version):
> > 
> > [  192.742714] CPU: 2 PID: 506 Comm: v4l2-ctl Not tainted 5.4.127 #23
> > [  192.742716] Hardware name: Variscite VAR-SOM-MX8M-MINI on Symphony-Board 1.4a and above (DT)
> 
> Is this using mainline drivers? Are there BSP patches? Have you tested on a 
> mainline kernel (5.18, linux-media master branch?)

That isn't so easy to do because i have to redesign the entire board's DT, which 
i don't have enough time for.

> > [  192.742719] pstate: 80000005 (Nzcv daif -PAN -UAO)
> > [  192.742723] pc : vb2_core_reqbufs+0x134/0x400
> 
> Have you deciphered which line this is yet on your build?
> 
> > [  192.742726] lr : vb2_core_reqbufs+0xfc/0x400
> > 
> > register dump not very important, and then the call trace:
> 
> Was this a panic? or output from a WARN_ON?

It was zero pointer dereference.

> > [  192.742778] Call trace:
> > [  192.742782]  vb2_core_reqbufs+0x134/0x400
> > [  192.742787]  vb2_reqbufs+0x78/0x84
> > [  192.742791]  mx6s_vidioc_reqbufs+0x3c/0x70
> > [  192.742795]  v4l_reqbufs+0x48/0x60
> > [  192.742798]  __video_do_ioctl+0x180/0x3e0
> > [  192.742801]  video_usercopy+0x134/0x500
> > [  192.742805]  video_ioctl2+0x14/0x20
> > [  192.742807]  v4l2_ioctl+0x3c/0x60
> > [  192.742813]  do_vfs_ioctl+0x860/0xaf0
> > [  192.742816]  ksys_ioctl+0x44/0x8c
> > [  192.742819]  __arm64_sys_ioctl+0x1c/0xc0
> > [  192.742825]  el0_svc_common.constprop.0+0x68/0x160
> > [  192.742828]  el0_svc_handler+0x20/0x80
> > [  192.742831]  el0_svc+0x8/0x204
> > [  192.742834] ---[ end trace 25eae7f9180cbb88 ]---
> > 
> > 
> > Have i not enabled something important for imx8's IPU or is it something on my
> > driver's side?
> 
> What does your driver do ? I'm not sure how to answer that without seeing the 
> driver.

It's far from ready, but i'm attaching it here just the same.


cheers,
Petko

--5S0rxRVwceSLnhgP
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="imx492.c"

// SPDX-License-Identifier: GPL-2.0-only
/*
 * Sony imx492 Camera Sensor Driver (based on imx412.c source);
 *
 * Copyright (C) 2022 Integrated Computer Solutions, Inc.
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

/* Input clock rate */
#define IMX492_INCLK_RATE	24000000

/* CSI2 HW configuration */
#define IMX492_LINK_FREQ	600000000
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
	{0x300e, 0x01},	/* SVR lo */
	{0x300f, 0x00},	/* SVR hi */
#if 0
	{0x302c, 0xFF},	/* SHR lo */
	{0x302d, 0xFF},	/* SHR hi */
#endif
	{0x3034, 0x01},
	{0x3035, 0x00},
	{0x3036, 0x00},
	{0x3037, 0x00},
	{0x3038, 0x00},
	{0x3039, 0x00},
	{IMX492_REG_TESTPTRN, IMX492_BITS_TPTRN_ON},
	{IMX492_REG_TESTPATSEL, IMX492_BIT_TPAT0A},
	{0x3084, 0x00},
	{0x3085, 0x00},
	{0x3086, 0x00},
	{0x3087, 0x00},
	{0x30a9, 0x70},	/* VMAX lo */
	{0x30aa, 0x17},	/* VMAX mi */
	{0x30ab, 0x00},	/* VMAX hi */
	{0x30ac, 0xe8},	/* HMAX lo */
	{0x30ad, 0x03},	/* HMAX hi */
	{0x30e2, 0x00},
	{0x312f, 0x20},
	{0x3130, 0x30},
	{0x3131, 0x16},
	{0x3132, 0x10},
	{0x3133, 0x16},
#if 0	/* PSSLVS */
	{0x332c, 0xFF},
	{0x332d, 0xFF},
	{0x334a, 0xFF},
	{0x334b, 0xFF},
	{0x35b6, 0xFF},
	{0x35b7, 0xFF},
	{0x35b8, 0xFF},
	{0x35b9, 0xFF},
	{0x36bc, 0xFF},
	{0x36bd, 0xFF},
#endif
};

/* Supported sensor mode configurations */
static const struct imx492_mode supported_mode = {
	.width = 7408,
	.height = 5556,
	.hblank = 842,
	.vblank = 1020,
	.vblank_min = 500,
	.vblank_max = 5728,
	.pclk = 480000000,
	.link_freq_idx = 0,
#if 1
	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
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
	return __v4l2_ctrl_modify_range(imx492->vblank_ctrl, mode->vblank_min,
					mode->vblank_max, 1, mode->vblank);
#else
	return ret;
#endif
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
#if 0
		if (!pm_runtime_get_if_in_use(imx492->dev))
			return 0;
#endif
		exposure = ctrl->val;
		analog_gain = imx492->again_ctrl->val;

		dev_dbg(imx492->dev, "Received exp %u, analog gain %u",
			exposure, analog_gain);

		ret = imx492_update_exp_gain(imx492, exposure, analog_gain);
#if 0
		pm_runtime_put(imx492->dev);
#endif
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
				 struct v4l2_subdev_pad_config *cfg,
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
				  struct v4l2_subdev_pad_config *cfg,
				  struct v4l2_subdev_frame_size_enum *fsize)
{
	printk("%s: index %d, code %d\n", __func__, fsize->index, fsize->code);

	if (fsize->index > 0)
		return -EINVAL;

	if (fsize->code != supported_mode.code)
		return -EINVAL;

	fsize->min_width = supported_mode.width;
	fsize->max_width = fsize->min_width;
	fsize->min_height = supported_mode.height;
	fsize->max_height = fsize->min_height;

	return 0;
}

/**
 * imx492_fill_pad_format() - Fill subdevice pad format
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
				 struct v4l2_subdev_pad_config *cfg,
				 struct v4l2_subdev_format *fmt)
{
	struct imx492 *imx492 = to_imx492(sd);

	printk("%s: fmt bool %d\n", __func__, fmt->which == V4L2_SUBDEV_FORMAT_TRY);

	mutex_lock(&imx492->mutex);

	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
		struct v4l2_mbus_framefmt *framefmt;

		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
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
				 struct v4l2_subdev_pad_config *cfg,
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

		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
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
			       struct v4l2_subdev_pad_config *cfg)
{
	struct imx492 *imx492 = to_imx492(sd);
	struct v4l2_subdev_format fmt = { 0 };

	printk("%s: fmt which %d\n", __func__, fmt.which);

	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
	imx492_fill_pad_format(imx492, &supported_mode, &fmt);

	return imx492_set_pad_format(sd, cfg, &fmt);
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
	ret =  __v4l2_ctrl_handler_setup(imx492->sd.ctrl_handler);
	if (ret) {
		dev_err(imx492->dev, "fail to setup handler");
		return ret;
	}

	/* Delay is required before streaming*/
	usleep_range(7400, 8000);

	/* Start streaming */
	ret = imx492_write_reg(imx492, IMX492_REG_MODE_SELECT,
			       1, IMX492_MODE_STREAMING);
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
static int imx492_stop_streaming(struct imx492 *imx492)
{
	return imx492_write_reg(imx492, IMX492_REG_MODE_SELECT,
				1, IMX492_MODE_STANDBY);
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
#if 0
		ret = pm_runtime_resume_and_get(imx492->dev);
		if (ret)
			goto error_unlock;
#endif
		ret = imx492_start_streaming(imx492);
		if (ret)
			goto error_power_off;
	} else {
		imx492_stop_streaming(imx492);
#if 0
		pm_runtime_put(imx492->dev);
#endif
	}

	imx492->streaming = enable;

	mutex_unlock(&imx492->mutex);

	return 0;

error_power_off:
#if 0
	pm_runtime_put(imx492->dev);
error_unlock:
#endif
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
		dev_err(imx492->dev, "inclk frequency mismatch");
		return -EINVAL;
	}

	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
	if (!ep)
		return -ENXIO;

	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
	fwnode_handle_put(ep);
	if (ret)
		return ret;

	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX492_NUM_DATA_LANES) {
		dev_err(imx492->dev,
			"number of CSI2 data lanes %d is not supported",
			bus_cfg.bus.mipi_csi2.num_data_lanes);
		ret = -EINVAL;
		goto done_endpoint_free;
	}

	if (!bus_cfg.nr_of_link_frequencies) {
		dev_err(imx492->dev, "no link frequencies defined");
		ret = -EINVAL;
		goto done_endpoint_free;
	}

	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
		if (bus_cfg.link_frequencies[i] == IMX492_LINK_FREQ)
			goto done_endpoint_free;

	ret = -EINVAL;

done_endpoint_free:
	v4l2_fwnode_endpoint_free(&bus_cfg);

	return ret;
}

static int imx492_g_parm(struct v4l2_subdev *sd, struct v4l2_streamparm *a)
{
	struct imx492 *imx492 = to_imx492(sd);
	struct v4l2_captureparm *cp = &a->parm.capture;
	int ret;

	printk("%s: type %d\n", __func__, a->type);

	switch (a->type) {
	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
		memset(a, 0, sizeof(*a));
		a->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		cp->capability = imx492->scap.capability;
		cp->capturemode = imx492->scap.capturemode;
		cp->timeperframe = imx492->scap.timeperframe;
		printk("%s: capture! %d\n", __func__, a->type);
		ret = 0;
		break;
	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
	case V4L2_BUF_TYPE_VBI_CAPTURE:
	case V4L2_BUF_TYPE_VBI_OUTPUT:
	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
		printk("%s: unsupported type %d\n", __func__, a->type);
		ret = -EINVAL;
		break;
	default:
		 printk("%s: unsupported type %d\n", __func__, a->type);
		ret = -EINVAL;
		break;
	}

	return ret;
}

static int imx492_s_parm(struct v4l2_subdev *sd, struct v4l2_streamparm *a)
{
	printk("%s: type %d\n", __func__, a->type);

	return 0;
}

static int imx492_s_power(struct v4l2_subdev *sd, int on)
{
        printk("%s(%d):\n", __func__, on);

        return 0;
}

static const struct v4l2_subdev_core_ops imx492_core_ops = {
	.s_power = imx492_s_power,
};

/* V4l2 subdevice ops */
static const struct v4l2_subdev_video_ops imx492_video_ops = {
	.g_parm = imx492_g_parm,
	.s_parm = imx492_s_parm,
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
	.core = &imx492_core_ops,
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
	int ret;

	dev_dbg(imx492->dev, "%s", __func__);

	gpiod_set_value_cansleep(imx492->power_gpio, 1);
	msleep(1);
	gpiod_set_value_cansleep(imx492->reset_gpio, 1);
	msleep(1);
	gpiod_set_value_cansleep(imx492->oscen_gpio, 1);
	msleep(1);

	ret = clk_prepare_enable(imx492->inclk);
	if (ret) {
		dev_err(imx492->dev, "fail to enable inclk");
		goto error_reset;
	}

	usleep_range(1000, 1200);

	return 0;

error_reset:
	gpiod_set_value_cansleep(imx492->reset_gpio, 0);

	return ret;
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

	clk_disable_unprepare(imx492->inclk);

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
#if 0	/* FIXME: getting out of range */
	imx492->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
						&imx492_ctrl_ops,
						V4L2_CID_VBLANK,
						mode->vblank_min,
						mode->vblank_max,
						1, mode->vblank);
	dev_dbg(imx492->dev, "%x %x %x\n", mode->vblank_min, mode->vblank_max, mode->vblank);
	/* Read only controls */
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
#if 0
	pm_runtime_set_active(imx492->dev);
	pm_runtime_enable(imx492->dev);
	pm_runtime_idle(imx492->dev);
#endif
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
#if 0
	pm_runtime_disable(&client->dev);
	if (!pm_runtime_status_suspended(&client->dev))
		imx492_power_off(&client->dev);
	pm_runtime_set_suspended(&client->dev);
#else
	imx492_power_off(&client->dev);
#endif
	mutex_destroy(&imx492->mutex);

	return 0;
}
#if 0
static const struct dev_pm_ops imx492_pm_ops = {
	SET_RUNTIME_PM_OPS(imx492_power_off, imx492_power_on, NULL)
};
#endif
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
#if 0
		.pm = &imx492_pm_ops,
#endif
		.of_match_table = imx492_of_match,
	},
};

module_i2c_driver(imx492_driver);

MODULE_DESCRIPTION("Sony imx492 sensor driver");
MODULE_AUTHOR("Petko Manolov <petko.manolov@konsulko.com>");
MODULE_LICENSE("GPL");

--5S0rxRVwceSLnhgP--
