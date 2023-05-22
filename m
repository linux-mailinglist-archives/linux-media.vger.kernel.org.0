Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEFEA70B935
	for <lists+linux-media@lfdr.de>; Mon, 22 May 2023 11:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbjEVJjW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 May 2023 05:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbjEVJjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 May 2023 05:39:14 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9557BB;
        Mon, 22 May 2023 02:39:09 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:45930.480737609
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id CDB431027B3;
        Mon, 22 May 2023 17:39:04 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-75648544bd-7vx9t with ESMTP id ff48244c426145599a0b94bdcbcc663f for kernel@xen0n.name;
        Mon, 22 May 2023 17:39:08 CST
X-Transaction-ID: ff48244c426145599a0b94bdcbcc663f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <32ab39b4-da1c-7f87-74b9-ec64ebdb8dfc@189.cn>
Date:   Mon, 22 May 2023 17:39:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To:     WANG Xuerui <kernel@xen0n.name>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Li Yi <liyi@loongson.cn>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Emil Velikov <emil.l.velikov@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Liu Peibao <liupeibao@loongson.cn>, linux-media@vger.kernel.org
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2023/5/21 20:21, WANG Xuerui wrote:
>> +#ifndef __LSDC_REGS_H__
>> +#define __LSDC_REGS_H__
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/types.h>
>> +
>> +/*
>> + * PIXEL PLL Reference clock
>> + */
>> +#define LSDC_PLL_REF_CLK                100000           /* kHz */
>
> Consider naming it like "LSDC_PLL_REF_CLK_KHZ" for it to be 
> self-documenting?
>
Indeed, this is really reasonable.  Can be self-documenting.

thanks.

>> +
>> +/*
>> + * Those PLL registers are relative to LSxxxxx_CFG_REG_BASE. xxxxx = 
>> 7A1000,
>> + * 7A2000, 2K2000, 2K1000 etc.
>> + */
>> +
>> +/* LS7A1000 */
>> +
>> +#define LS7A1000_PIXPLL0_REG            0x04B0
>> +#define LS7A1000_PIXPLL1_REG            0x04C0
>> +
>> +/* The DC, GPU, Graphic Memory Controller share the single gfxpll */
>> +#define LS7A1000_PLL_GFX_REG            0x0490
>> +
>> +#define LS7A1000_CONF_REG_BASE          0x10010000
>> +
>> +/* LS7A2000 */
>> +
>> +#define LS7A2000_PIXPLL0_REG            0x04B0
>> +#define LS7A2000_PIXPLL1_REG            0x04C0
>> +
>> +/* The DC, GPU, Graphic Memory Controller share the single gfxpll */
>> +#define LS7A2000_PLL_GFX_REG            0x0490
>> +
>> +#define LS7A2000_CONF_REG_BASE          0x10010000
>> +
>> +/* For LSDC_CRTCx_CFG_REG */
>> +#define CFG_PIX_FMT_MASK                GENMASK(2, 0)
>> +
>> +enum lsdc_pixel_format {
>> +    LSDC_PF_NONE = 0,
>> +    LSDC_PF_XRGB444 = 1,    /* [12 bits] */
>> +    LSDC_PF_XRGB555 = 2,    /* [15 bits] */
>> +    LSDC_PF_XRGB565 = 3,    /* RGB [16 bits] */
>> +    LSDC_PF_XRGB8888 = 4,   /* XRGB [32 bits] */
>> +};
>> +
>> +/*
>> + * Each crtc has two set fb address registers usable, 
>> FB_REG_IN_USING bit of
>> + * LSDC_CRTCx_CFG_REG indicate which fb address register is in using 
>> by the
>> + * CRTC currently. CFG_PAGE_FLIP is used to trigger the switch, the 
>> switching
>> + * will be finished at the very next vblank. Trigger it again if you 
>> want to
>> + * switch back.
>> + *
>> + * If FB0_ADDR_REG is in using, we write the address to FB0_ADDR_REG,
>> + * if FB1_ADDR_REG is in using, we write the address to FB1_ADDR_REG.
>> + */
>> +#define CFG_PAGE_FLIP                   BIT(7)
>> +#define CFG_OUTPUT_ENABLE               BIT(8)
>> +#define CFG_HW_CLONE                    BIT(9)
>> +/* Indicate witch fb addr reg is in using, currently. read only */
>> +#define FB_REG_IN_USING                 BIT(11)
>> +#define CFG_GAMMA_EN                    BIT(12)
>> +
>> +/* The DC get soft reset if this bit changed from "1" to "0", active 
>> low */
>> +#define CFG_RESET_N                     BIT(20)
>> +/* If this bit is set, it say that the CRTC stop working anymore, 
>> anchored. */
>> +#define CRTC_ANCHORED                   BIT(24)
>> +
>> +/*
>> + * The DMA step of the DC in LS7A2000/LS2K2000 is configurable,
>> + * setting those bits on ls7a1000 platform make no effect.
>> + */
>> +#define CFG_DMA_STEP_MASK              GENMASK(17, 16)
>> +#define CFG_DMA_STEP_SHIFT             16
>> +enum lsdc_dma_steps {
>> +    LSDC_DMA_STEP_256_BYTES = 0,
>> +    LSDC_DMA_STEP_128_BYTES = 1,
>> +    LSDC_DMA_STEP_64_BYTES = 2,
>> +    LSDC_DMA_STEP_32_BYTES = 3,
>> +};
>> +
>> +#define CFG_VALID_BITS_MASK             GENMASK(20, 0)
>> +
>> +/* For LSDC_CRTCx_PANEL_CONF_REG */
>> +#define PHY_CLOCK_POL                   BIT(9)
>> +#define PHY_CLOCK_EN                    BIT(8)
>> +#define PHY_DE_POL                      BIT(1)
>> +#define PHY_DATA_EN                     BIT(0)
>> +
>> +/* For LSDC_CRTCx_HSYNC_REG */
>> +#define HSYNC_INV                       BIT(31)
>> +#define HSYNC_EN                        BIT(30)
>> +#define HSYNC_END_MASK                  GENMASK(28, 16)
>> +#define HSYNC_END_SHIFT                 16
>> +#define HSYNC_START_MASK                GENMASK(12, 0)
>> +#define HSYNC_START_SHIFT               0
>> +
>> +/* For LSDC_CRTCx_VSYNC_REG */
>> +#define VSYNC_INV                       BIT(31)
>> +#define VSYNC_EN                        BIT(30)
>> +#define VSYNC_END_MASK                  GENMASK(27, 16)
>> +#define VSYNC_END_SHIFT                 16
>> +#define VSYNC_START_MASK                GENMASK(11, 0)
>> +#define VSYNC_START_SHIFT               0
>> +
>> +/*********** CRTC0 & DISPLAY PIPE0 ***********/
>> +#define LSDC_CRTC0_CFG_REG              0x1240
>> +#define LSDC_CRTC0_FB0_ADDR_LO_REG      0x1260
>> +#define LSDC_CRTC0_FB0_ADDR_HI_REG      0x15A0
>> +#define LSDC_CRTC0_STRIDE_REG           0x1280
>> +#define LSDC_CRTC0_FB_ORIGIN_REG        0x1300
>> +#define LSDC_CRTC0_PANEL_CONF_REG       0x13C0
>> +#define LSDC_CRTC0_HDISPLAY_REG         0x1400
>> +#define LSDC_CRTC0_HSYNC_REG            0x1420
>> +#define LSDC_CRTC0_VDISPLAY_REG         0x1480
>> +#define LSDC_CRTC0_VSYNC_REG            0x14A0
>> +#define LSDC_CRTC0_GAMMA_INDEX_REG      0x14E0
>> +#define LSDC_CRTC0_GAMMA_DATA_REG       0x1500
>> +#define LSDC_CRTC0_FB1_ADDR_LO_REG      0x1580
>> +#define LSDC_CRTC0_FB1_ADDR_HI_REG      0x15C0
>> +
>> +/*********** CTRC1 & DISPLAY PIPE1 ***********/
>
> "CRTC1"

Indeed, thanks for your sharpen eyes.

I will try to solve all other problems you mentioned at next version.

I don't notice this.

Great thanks.

