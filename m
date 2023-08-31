Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76E6278EE81
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 15:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbjHaNZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 09:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjHaNZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 09:25:37 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F280A1A2;
        Thu, 31 Aug 2023 06:25:29 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37VDP0cG110211;
        Thu, 31 Aug 2023 08:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1693488300;
        bh=xyJLiK11ir4IKeuB2r4XEFDZnTo8OyfwOf5xRZZsvwU=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=U3TyjoPPXuhW/FXYpWd28b9bWOhXWpDtiRQOSVUL9rZMn0+wa6dvBYWXSwhMBID3g
         9DpVYsLqqNiGQiW4PD9ZYYmsr1detwM5akZ6dFjsPxhsYMXtrFAtliI/cdD8y/qPBX
         bp6zeyqU2uT6DyCeGcIweDsjzVlAwUFUtkdJL3oY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37VDP0tv067693
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Aug 2023 08:25:00 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 08:24:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 08:24:59 -0500
Received: from [172.24.227.6] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37VDOq5N072002;
        Thu, 31 Aug 2023 08:24:53 -0500
Message-ID: <def8f7d9-02d4-6715-e8b8-4c0780853b8c@ti.com>
Date:   Thu, 31 Aug 2023 18:54:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/4] media: imagination: Add E5010 JPEG Encoder driver
Content-Language: en-US
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        <mchehab@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <laurent.pinchart@ideasonboard.com>, <eugen.hristev@collabora.com>,
        <ezequiel@vanguardiasur.com.ar>, <u.kleine-koenig@pengutronix.de>,
        <sakari.ailus@linux.intel.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>
References: <20230816152210.4080779-1-devarsht@ti.com>
 <20230816152210.4080779-3-devarsht@ti.com>
 <307911e9-7e0e-4a10-aeb1-6c72896c1454@collabora.com>
From:   Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <307911e9-7e0e-4a10-aeb1-6c72896c1454@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej,

Thanks for the review.

On 22/08/23 15:57, Andrzej Pietrasiewicz wrote:
> Hi Devarsh,
> 
> W dniu 16.08.2023 o 17:22, Devarsh Thakkar pisze:
>> This adds support for stateful V4L2 M2M based driver
>> for Imagination E5010 JPEG Encoder [1] which supports baseline
>> encoding with two different quantization tables and compression
>> ratio as demanded.
>>
>> Support for both contiguous and non-contiguous YUV420 and YUV422
>> semiplanar formats is added along with alignment restrictions
>> as required by the hardware.
>>
>> System and runtime PM hooks are added in the driver along with v4l2
>> crop and selection API support.
>>
>> Minimum resolution supported is 64x64 and
>> Maximum resolution supported is 8192x8192.
>>
>> All v4l2-compliance tests are passing [2] :
>> v4l2-compliance -s -f -a  -d /dev/video0 -e /dev/video1
>>
>> Total for e5010 device /dev/video0: 70, Succeeded: 70, Failed: 0,
>> Warnings: 0
>> NOTE: video1 here is VIVID test pattern generator
>>
>> Also tests [3] were run manually to verify below driver features:
>>   - Runtime Power Management
>>   - Multi-instance JPEG Encoding
>>   - DMABUF import, export support
>>   - NV12, NV21, NV16, NV61 video format support
>>   - Compression quality S_CTRL
>>
>> Existing V4L2 M2M based JPEG drivers namely s5p-jpeg,
>> imx-jpeg and rcar_jpu were referred while making this.
>>
>> TODO:
>> Add MMU and memory tiling support
>>
>> [1]:  AM62A TRM (Section 7.6 is for JPEG Encoder)
>> Link: https://www.ti.com/lit/pdf/spruj16
>>
>> [2]: v4l2-compliance test :
>> Link: https://gist.github.com/devarsht/17348fc509fe375a630a798196edbb73
>>
>> [3]: E5010 JPEG Encoder Manual tests :
>>
>> Performance:
>> Link: https://gist.github.com/devarsht/ef5aba211aae45166681b8b4418d4e65
>>
>> Functionality:
>> Link: https://gist.github.com/devarsht/bfef1e3ead8e858b09cbf418aea753e8
>>
>> Compression Quality:
>> Link: https://gist.github.com/devarsht/345df9bf7157b4ca094293760e257451
>>
>> Multi Instance:
>> Link: https://gist.github.com/devarsht/4b4d734eeb9e0e616837c0836ddbc769
>>
>> Co-developed-by: David Huang <d-huang@ti.com>
>> Signed-off-by: David Huang <d-huang@ti.com>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V2:
>> No change
>>
>> V3:
>> - Correct license headers
>> - Use more generic name core instead of jasper for base registers
>> - Add Comment for forward declarations
>> - Simplify quantization table calculations
>> - Use v4l2_apply_frmsize_constraints for updating framesize and remove
>> unrequired functions
>> - Place TODO at top of file and in commit message too
>> - Use dev_err_probe helper in probe function
>> - Fix return value checking for failure scenarios in probe function
>> - Use v4l2_err/info/warn helpers instead of dev_err/info/warn helpers
>> - Fix unexpected indentation
>> - Correct commit message
>> - Remove dependency on ARCH_K3 as driver is not specific to that
>>
>>   MAINTAINERS                                   |    2 +
>>   drivers/media/platform/Kconfig                |    1 +
>>   drivers/media/platform/Makefile               |    1 +
>>   drivers/media/platform/imagination/Kconfig    |   12 +
>>   drivers/media/platform/imagination/Makefile   |    3 +
>>   .../platform/imagination/e5010-core-regs.h    |  585 ++++++
>>   .../platform/imagination/e5010-jpeg-enc-hw.c  |  320 ++++
>>   .../platform/imagination/e5010-jpeg-enc-hw.h  |   42 +
>>   .../platform/imagination/e5010-jpeg-enc.c     | 1678 +++++++++++++++++
>>   .../platform/imagination/e5010-jpeg-enc.h     |  169 ++
>>   .../platform/imagination/e5010-mmu-regs.h     |  311 +++
>>   11 files changed, 3124 insertions(+)
>>   create mode 100644 drivers/media/platform/imagination/Kconfig
>>   create mode 100644 drivers/media/platform/imagination/Makefile
>>   create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
>>   create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
>>   create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
>>   create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
>>   create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
>>   create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9425ecf45df6..725a280a521b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -10208,8 +10208,10 @@ F:    drivers/auxdisplay/img-ascii-lcd.c
>>     IMGTEC JPEG ENCODER DRIVER
>>   M:    Devarsh Thakkar <devarsht@ti.com>
>> +L:    linux-media@vger.kernel.org
>>   S:    Supported
>>   F:    Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
>> +F:    drivers/media/platform/imagination/e5010*
>>     IMGTEC IR DECODER DRIVER
>>   S:    Orphan
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index ee579916f874..72b4bedd47fb 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -69,6 +69,7 @@ source "drivers/media/platform/aspeed/Kconfig"
>>   source "drivers/media/platform/atmel/Kconfig"
>>   source "drivers/media/platform/cadence/Kconfig"
>>   source "drivers/media/platform/chips-media/Kconfig"
>> +source "drivers/media/platform/imagination/Kconfig"
>>   source "drivers/media/platform/intel/Kconfig"
>>   source "drivers/media/platform/marvell/Kconfig"
>>   source "drivers/media/platform/mediatek/Kconfig"
>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>> index 5453bb868e67..96db57cc9412 100644
>> --- a/drivers/media/platform/Makefile
>> +++ b/drivers/media/platform/Makefile
>> @@ -12,6 +12,7 @@ obj-y += aspeed/
>>   obj-y += atmel/
>>   obj-y += cadence/
>>   obj-y += chips-media/
>> +obj-y += imagination/
>>   obj-y += intel/
>>   obj-y += marvell/
>>   obj-y += mediatek/
>> diff --git a/drivers/media/platform/imagination/Kconfig
>> b/drivers/media/platform/imagination/Kconfig
>> new file mode 100644
>> index 000000000000..d8d79266ad5d
>> --- /dev/null
>> +++ b/drivers/media/platform/imagination/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +config VIDEO_E5010_JPEG_ENC
>> +    tristate "Imagination E5010 JPEG Encoder Driver"
>> +    depends on VIDEO_DEV
>> +    select VIDEOBUF2_DMA_CONTIG
>> +    select VIDEOBUF2_VMALLOC
>> +    select V4L2_MEM2MEM_DEV
>> +    help
>> +      This is a video4linux2 M2M driver for Imagination E5010 JPEG encoder,
>> +      which supports JPEG and MJPEG baseline encoding of YUV422 and YUV420
>> +      semiplanar video formats, with resolution ranging from 64x64 to 8K x 8K
>> +      pixels. The module will be named as e5010_jpeg_enc.
>> diff --git a/drivers/media/platform/imagination/Makefile
>> b/drivers/media/platform/imagination/Makefile
>> new file mode 100644
>> index 000000000000..d45b85b88575
>> --- /dev/null
>> +++ b/drivers/media/platform/imagination/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +e5010_jpeg_enc-objs := e5010-jpeg-enc-hw.o e5010-jpeg-enc.o
>> +obj-$(CONFIG_VIDEO_E5010_JPEG_ENC) += e5010_jpeg_enc.o
>> diff --git a/drivers/media/platform/imagination/e5010-core-regs.h
>> b/drivers/media/platform/imagination/e5010-core-regs.h
>> new file mode 100644
>> index 000000000000..aaec498fe83f
>> --- /dev/null
>> +++ b/drivers/media/platform/imagination/e5010-core-regs.h
>> @@ -0,0 +1,585 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Imagination E5010 JPEG Encoder driver.
>> + *
>> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
>> + *
>> + * Author: David Huang <d-huang@ti.com>
>> + * Author: Devarsh Thakkar <devarsht@ti.com>
>> + */
>> +
>> +#ifndef _E5010_CORE_REGS_H
>> +#define _E5010_CORE_REGS_H
>> +
>> +#define JASPER_CORE_ID_OFFSET                (0x0000)
>> +#define JASPER_CORE_ID_CR_GROUP_ID_MASK            (0xFF000000)
>> +#define JASPER_CORE_ID_CR_GROUP_ID_SHIFT        (24)
>> +#define JASPER_CORE_ID_CR_CORE_ID_MASK            (0x00FF0000)
>> +#define JASPER_CORE_ID_CR_CORE_ID_SHIFT            (16)
>> +#define JASPER_CORE_ID_CR_UNIQUE_NUM_MASK        (0x0000FFF8)
>> +#define JASPER_CORE_ID_CR_UNIQUE_NUM_SHIFT        (3)
>> +#define JASPER_CORE_ID_CR_PELS_PER_CYCLE_MASK        (0x00000007)
>> +#define JASPER_CORE_ID_CR_PELS_PER_CYCLE_SHIFT        (0)
>> +
>> +#define JASPER_CORE_REV_OFFSET                (0x0004)
>> +#define JASPER_CORE_REV_CR_JASPER_DESIGNER_MASK        (0xFF000000)
>> +#define JASPER_CORE_REV_CR_JASPER_DESIGNER_SHIFT    (24)
>> +#define JASPER_CORE_REV_CR_JASPER_MAJOR_REV_MASK    (0x00FF0000)
>> +#define JASPER_CORE_REV_CR_JASPER_MAJOR_REV_SHIFT    (16)
>> +#define JASPER_CORE_REV_CR_JASPER_MINOR_REV_MASK    (0x0000FF00)
>> +#define JASPER_CORE_REV_CR_JASPER_MINOR_REV_SHIFT    (8)
>> +#define JASPER_CORE_REV_CR_JASPER_MAINT_REV_MASK    (0x000000FF)
>> +#define JASPER_CORE_REV_CR_JASPER_MAINT_REV_SHIFT    (0)
>> +
>> +#define JASPER_INTERRUPT_MASK_OFFSET                    (0x0008)
>> +#define JASPER_INTERRUPT_MASK_CR_OUTPUT_ADDRESS_ERROR_ENABLE_MASK   
>> (0x00000002)
>> +#define JASPER_INTERRUPT_MASK_CR_OUTPUT_ADDRESS_ERROR_ENABLE_SHIFT    (1)
>> +#define JASPER_INTERRUPT_MASK_CR_PICTURE_DONE_ENABLE_MASK        (0x00000001)
>> +#define JASPER_INTERRUPT_MASK_CR_PICTURE_DONE_ENABLE_SHIFT        (0)
>> +
>> +#define JASPER_INTERRUPT_STATUS_OFFSET                    (0x000C)
>> +#define JASPER_INTERRUPT_STATUS_CR_OUTPUT_ADDRESS_ERROR_IRQ_MASK   
>> (0x00000002)
>> +#define JASPER_INTERRUPT_STATUS_CR_OUTPUT_ADDRESS_ERROR_IRQ_SHIFT    (1)
>> +#define JASPER_INTERRUPT_STATUS_CR_PICTURE_DONE_IRQ_MASK        (0x00000001)
>> +#define JASPER_INTERRUPT_STATUS_CR_PICTURE_DONE_IRQ_SHIFT        (0)
>> +
>> +#define JASPER_INTERRUPT_CLEAR_OFFSET                    (0x0010)
>> +#define JASPER_INTERRUPT_CLEAR_CR_OUTPUT_ERROR_CLEAR_MASK        (0x00000002)
>> +#define JASPER_INTERRUPT_CLEAR_CR_OUTPUT_ERROR_CLEAR_SHIFT        (1)
>> +#define JASPER_INTERRUPT_CLEAR_CR_PICTURE_DONE_CLEAR_MASK        (0x00000001)
>> +#define JASPER_INTERRUPT_CLEAR_CR_PICTURE_DONE_CLEAR_SHIFT        (0)
>> +
>> +#define JASPER_CLK_CONTROL_OFFSET                (0x0014)
>> +#define JASPER_CLK_CONTROL_CR_JASPER_AUTO_CLKG_ENABLE_MASK    (0x00000002)
>> +#define JASPER_CLK_CONTROL_CR_JASPER_AUTO_CLKG_ENABLE_SHIFT    (1)
>> +#define JASPER_CLK_CONTROL_CR_JASPER_MAN_CLKG_ENABLE_MASK    (0x00000001)
>> +#define JASPER_CLK_CONTROL_CR_JASPER_MAN_CLKG_ENABLE_SHIFT    (0)
>> +
>> +#define JASPER_CLK_STATUS_OFFSET            (0x0018)
>> +#define JASPER_CLK_STATUS_CR_JASPER_CLKG_STATUS_MASK    (0x00000001)
>> +#define JASPER_CLK_STATUS_CR_JASPER_CLKG_STATUS_SHIFT    (0)
>> +
>> +#define JASPER_RESET_OFFSET            (0x001C)
>> +#define JASPER_RESET_CR_SYS_RESET_MASK        (0x00000002)
>> +#define JASPER_RESET_CR_SYS_RESET_SHIFT        (1)
>> +#define JASPER_RESET_CR_CORE_RESET_MASK        (0x00000001)
>> +#define JASPER_RESET_CR_CORE_RESET_SHIFT    (0)
>> +
>> +#define JASPER_CORE_CTRL_OFFSET                (0x0020)
>> +#define JASPER_CORE_CTRL_CR_JASPER_ENCODE_START_MASK    (0x00000001)
>> +#define JASPER_CORE_CTRL_CR_JASPER_ENCODE_START_SHIFT    (0)
>> +
>> +#define JASPER_STATUS_OFFSET                (0x0024)
>> +#define JASPER_STATUS_CR_FLUSH_MODE_MASK        (0x00000002)
>> +#define JASPER_STATUS_CR_FLUSH_MODE_SHIFT        (1)
>> +#define JASPER_STATUS_CR_JASPER_BUSY_MASK        (0x00000001)
>> +#define JASPER_STATUS_CR_JASPER_BUSY_SHIFT        (0)
>> +
>> +#define JASPER_CRC_CLEAR_OFFSET                    (0x0028)
>> +#define JASPER_CRC_CLEAR_CR_FRONT_END_CRC_CLEAR_MASK        (0x00000001)
>> +#define JASPER_CRC_CLEAR_CR_FRONT_END_CRC_CLEAR_SHIFT        (0)
>> +#define JASPER_CRC_CLEAR_CR_DCT_CRC_CLEAR_MASK            (0x00000002)
>> +#define JASPER_CRC_CLEAR_CR_DCT_CRC_CLEAR_SHIFT            (1)
>> +#define JASPER_CRC_CLEAR_CR_ZZ_CRC_CLEAR_MASK            (0x00000004)
>> +#define JASPER_CRC_CLEAR_CR_ZZ_CRC_CLEAR_SHIFT            (2)
>> +#define JASPER_CRC_CLEAR_CR_QUANT_CRC_CLEAR_MASK        (0x00000008)
>> +#define JASPER_CRC_CLEAR_CR_QUANT_CRC_CLEAR_SHIFT        (3)
>> +#define JASPER_CRC_CLEAR_CR_ENTROPY_ENCODER_CRC_CLEAR_MASK    (0x00000010)
>> +#define JASPER_CRC_CLEAR_CR_ENTROPY_ENCODER_CRC_CLEAR_SHIFT    (4)
>> +#define JASPER_CRC_CLEAR_CR_PACKING_BUFFER_CRC_CLEAR_MASK    (0x00000020)
>> +#define JASPER_CRC_CLEAR_CR_PACKING_BUFFER_CRC_CLEAR_SHIFT    (5)
>> +
>> +#define JASPER_INPUT_CTRL0_OFFSET            (0x002C)
>> +#define JASPER_INPUT_CTRL0_CR_INPUT_CHROMA_ORDER_MASK    (0x01000000)
>> +#define JASPER_INPUT_CTRL0_CR_INPUT_CHROMA_ORDER_SHIFT    (24)
>> +#define JASPER_INPUT_CTRL0_CR_INPUT_SUBSAMPLING_MASK    (0x00030000)
>> +#define JASPER_INPUT_CTRL0_CR_INPUT_SUBSAMPLING_SHIFT    (16)
>> +#define JASPER_INPUT_CTRL0_CR_INPUT_SOURCE_MASK        (0x00000004)
>> +#define JASPER_INPUT_CTRL0_CR_INPUT_SOURCE_SHIFT    (2)
>> +
>> +#define JASPER_INPUT_CTRL1_OFFSET            (0x0030)
>> +#define JASPER_INPUT_CTRL1_CR_INPUT_LUMA_STRIDE_MASK    (0x1FC00000)
>> +#define JASPER_INPUT_CTRL1_CR_INPUT_LUMA_STRIDE_SHIFT    (22)
>> +#define JASPER_INPUT_CTRL1_CR_INPUT_CHROMA_STRIDE_MASK    (0x00001FC0)
>> +#define JASPER_INPUT_CTRL1_CR_INPUT_CHROMA_STRIDE_SHIFT    (6)
>> +
>> +#define JASPER_MMU_CTRL_OFFSET                (0x0034)
>> +#define JASPER_MMU_CTRL_CR_JASPER_TILING_SCHEME_MASK    (0x00000002)
>> +#define JASPER_MMU_CTRL_CR_JASPER_TILING_SCHEME_SHIFT    (1)
>> +#define JASPER_MMU_CTRL_CR_JASPER_TILING_ENABLE_MASK    (0x00000001)
>> +#define JASPER_MMU_CTRL_CR_JASPER_TILING_ENABLE_SHIFT    (0)
>> +
>> +#define JASPER_IMAGE_SIZE_OFFSET                (0x0038)
>> +#define JASPER_IMAGE_SIZE_CR_IMAGE_VERTICAL_SIZE_MASK        (0x1FFF0000)
>> +#define JASPER_IMAGE_SIZE_CR_IMAGE_VERTICAL_SIZE_SHIFT        (16)
>> +#define JASPER_IMAGE_SIZE_CR_IMAGE_HORIZONTAL_SIZE_MASK        (0x00001FFF)
>> +#define JASPER_IMAGE_SIZE_CR_IMAGE_HORIZONTAL_SIZE_SHIFT    (0)
>> +
>> +#define INPUT_LUMA_BASE_OFFSET                (0x003C)
>> +#define INPUT_LUMA_BASE_CR_INPUT_LUMA_BASE_MASK        (0xFFFFFFC0)
>> +#define INPUT_LUMA_BASE_CR_INPUT_LUMA_BASE_SHIFT    (6)
>> +
>> +#define INPUT_CHROMA_BASE_OFFSET            (0x0040)
>> +#define INPUT_CHROMA_BASE_CR_INPUT_CHROMA_BASE_MASK    (0xFFFFFFC0)
>> +#define INPUT_CHROMA_BASE_CR_INPUT_CHROMA_BASE_SHIFT    (6)
>> +
>> +#define JASPER_OUTPUT_BASE_OFFSET        (0x0044)
>> +#define JASPER_OUTPUT_BASE_CR_OUTPUT_BASE_MASK    (0xFFFFFFFF)
>> +#define JASPER_OUTPUT_BASE_CR_OUTPUT_BASE_SHIFT    (0)
>> +
>> +#define JASPER_OUTPUT_SIZE_OFFSET            (0x0048)
>> +#define JASPER_OUTPUT_SIZE_CR_OUTPUT_SIZE_MASK        (0xFFFFFFFF)
>> +#define JASPER_OUTPUT_SIZE_CR_OUTPUT_SIZE_SHIFT        (0)
>> +#define JASPER_OUTPUT_MAX_SIZE_OFFSET            (0x004C)
>> +#define JASPER_OUTPUT_MAX_SIZE_CR_OUTPUT_MAX_SIZE_MASK    (0xFFFFFFFF)
>> +#define JASPER_OUTPUT_MAX_SIZE_CR_OUTPUT_MAX_SIZE_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE0_OFFSET                    (0x0050)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE0_CR_LUMA_QUANTIZATION_TABLE_03_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE0_CR_LUMA_QUANTIZATION_TABLE_03_SHIFT    (24)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE0_CR_LUMA_QUANTIZATION_TABLE_02_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE0_CR_LUMA_QUANTIZATION_TABLE_02_SHIFT    (16)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE0_CR_LUMA_QUANTIZATION_TABLE_01_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE0_CR_LUMA_QUANTIZATION_TABLE_01_SHIFT    (8)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE0_CR_LUMA_QUANTIZATION_TABLE_00_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE0_CR_LUMA_QUANTIZATION_TABLE_00_SHIFT    (0)
>> +#define JASPER_LUMA_QUANTIZATION_TABLE1_OFFSET                    (0x0054)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE1_CR_LUMA_QUANTIZATION_TABLE_07_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE1_CR_LUMA_QUANTIZATION_TABLE_07_SHIFT    (24)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE1_CR_LUMA_QUANTIZATION_TABLE_06_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE1_CR_LUMA_QUANTIZATION_TABLE_06_SHIFT    (16)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE1_CR_LUMA_QUANTIZATION_TABLE_05_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE1_CR_LUMA_QUANTIZATION_TABLE_05_SHIFT    (8)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE1_CR_LUMA_QUANTIZATION_TABLE_04_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE1_CR_LUMA_QUANTIZATION_TABLE_04_SHIFT    (0)
>> +#define JASPER_LUMA_QUANTIZATION_TABLE2_OFFSET                    (0x0058)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE2_CR_LUMA_QUANTIZATION_TABLE_13_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE2_CR_LUMA_QUANTIZATION_TABLE_13_SHIFT    (24)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE2_CR_LUMA_QUANTIZATION_TABLE_12_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE2_CR_LUMA_QUANTIZATION_TABLE_12_SHIFT    (16)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE2_CR_LUMA_QUANTIZATION_TABLE_11_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE2_CR_LUMA_QUANTIZATION_TABLE_11_SHIFT    (8)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE2_CR_LUMA_QUANTIZATION_TABLE_10_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE2_CR_LUMA_QUANTIZATION_TABLE_10_SHIFT    (0)
>> +#define JASPER_LUMA_QUANTIZATION_TABLE3_OFFSET                    (0x005C)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE3_CR_LUMA_QUANTIZATION_TABLE_17_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE3_CR_LUMA_QUANTIZATION_TABLE_17_SHIFT    (24)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE3_CR_LUMA_QUANTIZATION_TABLE_16_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE3_CR_LUMA_QUANTIZATION_TABLE_16_SHIFT    (16)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE3_CR_LUMA_QUANTIZATION_TABLE_15_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE3_CR_LUMA_QUANTIZATION_TABLE_15_SHIFT    (8)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE3_CR_LUMA_QUANTIZATION_TABLE_14_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE3_CR_LUMA_QUANTIZATION_TABLE_14_SHIFT    (0)
>> +#define JASPER_LUMA_QUANTIZATION_TABLE4_OFFSET                    (0x0060)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE4_CR_LUMA_QUANTIZATION_TABLE_21_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE4_CR_LUMA_QUANTIZATION_TABLE_21_SHIFT    (8)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE4_CR_LUMA_QUANTIZATION_TABLE_20_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE4_CR_LUMA_QUANTIZATION_TABLE_20_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE5_OFFSET                    (0x0064)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE5_CR_LUMA_QUANTIZATION_TABLE_27_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE5_CR_LUMA_QUANTIZATION_TABLE_27_SHIFT    (24)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE5_CR_LUMA_QUANTIZATION_TABLE_26_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE5_CR_LUMA_QUANTIZATION_TABLE_26_SHIFT    (16)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE5_CR_LUMA_QUANTIZATION_TABLE_25_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE5_CR_LUMA_QUANTIZATION_TABLE_25_SHIFT    (8)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE5_CR_LUMA_QUANTIZATION_TABLE_24_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE5_CR_LUMA_QUANTIZATION_TABLE_24_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE6_OFFSET                    (0x0068)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE6_CR_LUMA_QUANTIZATION_TABLE_33_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE6_CR_LUMA_QUANTIZATION_TABLE_33_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE6_CR_LUMA_QUANTIZATION_TABLE_32_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE6_CR_LUMA_QUANTIZATION_TABLE_32_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE6_CR_LUMA_QUANTIZATION_TABLE_31_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE6_CR_LUMA_QUANTIZATION_TABLE_31_SHIFT    (8)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE6_CR_LUMA_QUANTIZATION_TABLE_30_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE6_CR_LUMA_QUANTIZATION_TABLE_30_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE7_OFFSET                    (0x006C)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE7_CR_LUMA_QUANTIZATION_TABLE_37_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE7_CR_LUMA_QUANTIZATION_TABLE_37_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE7_CR_LUMA_QUANTIZATION_TABLE_36_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE7_CR_LUMA_QUANTIZATION_TABLE_36_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE7_CR_LUMA_QUANTIZATION_TABLE_35_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE7_CR_LUMA_QUANTIZATION_TABLE_35_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE7_CR_LUMA_QUANTIZATION_TABLE_34_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE7_CR_LUMA_QUANTIZATION_TABLE_34_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE8_OFFSET                    (0x0070)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE8_CR_LUMA_QUANTIZATION_TABLE_43_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE8_CR_LUMA_QUANTIZATION_TABLE_43_SHIFT    (24)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE8_CR_LUMA_QUANTIZATION_TABLE_42_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE8_CR_LUMA_QUANTIZATION_TABLE_42_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE8_CR_LUMA_QUANTIZATION_TABLE_41_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE8_CR_LUMA_QUANTIZATION_TABLE_41_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE8_CR_LUMA_QUANTIZATION_TABLE_40_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE8_CR_LUMA_QUANTIZATION_TABLE_40_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE9_OFFSET                    (0x0074)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE9_CR_LUMA_QUANTIZATION_TABLE_47_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE9_CR_LUMA_QUANTIZATION_TABLE_47_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE9_CR_LUMA_QUANTIZATION_TABLE_46_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE9_CR_LUMA_QUANTIZATION_TABLE_46_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE9_CR_LUMA_QUANTIZATION_TABLE_45_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE9_CR_LUMA_QUANTIZATION_TABLE_45_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE9_CR_LUMA_QUANTIZATION_TABLE_44_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE9_CR_LUMA_QUANTIZATION_TABLE_44_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE10_OFFSET                    (0x0078)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE10_CR_LUMA_QUANTIZATION_TABLE_53_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE10_CR_LUMA_QUANTIZATION_TABLE_53_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE10_CR_LUMA_QUANTIZATION_TABLE_52_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE10_CR_LUMA_QUANTIZATION_TABLE_52_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE10_CR_LUMA_QUANTIZATION_TABLE_51_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE10_CR_LUMA_QUANTIZATION_TABLE_51_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE10_CR_LUMA_QUANTIZATION_TABLE_50_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE10_CR_LUMA_QUANTIZATION_TABLE_50_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE11_OFFSET                    (0x007C)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE11_CR_LUMA_QUANTIZATION_TABLE_57_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE11_CR_LUMA_QUANTIZATION_TABLE_57_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE11_CR_LUMA_QUANTIZATION_TABLE_56_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE11_CR_LUMA_QUANTIZATION_TABLE_56_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE11_CR_LUMA_QUANTIZATION_TABLE_55_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE11_CR_LUMA_QUANTIZATION_TABLE_55_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE11_CR_LUMA_QUANTIZATION_TABLE_54_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE11_CR_LUMA_QUANTIZATION_TABLE_54_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE12_OFFSET                    (0x0080)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE12_CR_LUMA_QUANTIZATION_TABLE_63_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE12_CR_LUMA_QUANTIZATION_TABLE_63_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE12_CR_LUMA_QUANTIZATION_TABLE_62_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE12_CR_LUMA_QUANTIZATION_TABLE_62_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE12_CR_LUMA_QUANTIZATION_TABLE_61_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE12_CR_LUMA_QUANTIZATION_TABLE_61_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE12_CR_LUMA_QUANTIZATION_TABLE_60_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE12_CR_LUMA_QUANTIZATION_TABLE_60_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE13_OFFSET                    (0x0084)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE13_CR_LUMA_QUANTIZATION_TABLE_67_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE13_CR_LUMA_QUANTIZATION_TABLE_67_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE13_CR_LUMA_QUANTIZATION_TABLE_66_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE13_CR_LUMA_QUANTIZATION_TABLE_66_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE13_CR_LUMA_QUANTIZATION_TABLE_65_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE13_CR_LUMA_QUANTIZATION_TABLE_65_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE13_CR_LUMA_QUANTIZATION_TABLE_64_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE13_CR_LUMA_QUANTIZATION_TABLE_64_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE14_OFFSET                    (0x0088)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE14_CR_LUMA_QUANTIZATION_TABLE_73_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE14_CR_LUMA_QUANTIZATION_TABLE_73_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE14_CR_LUMA_QUANTIZATION_TABLE_72_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE14_CR_LUMA_QUANTIZATION_TABLE_72_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE14_CR_LUMA_QUANTIZATION_TABLE_71_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE14_CR_LUMA_QUANTIZATION_TABLE_71_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE14_CR_LUMA_QUANTIZATION_TABLE_70_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE14_CR_LUMA_QUANTIZATION_TABLE_70_SHIFT    (0)
>> +
>> +#define JASPER_LUMA_QUANTIZATION_TABLE15_OFFSET                    (0x008C)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE15_CR_LUMA_QUANTIZATION_TABLE_77_MASK   
>> (0xFF000000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE15_CR_LUMA_QUANTIZATION_TABLE_77_SHIFT    (24)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE15_CR_LUMA_QUANTIZATION_TABLE_76_MASK   
>> (0x00FF0000)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE15_CR_LUMA_QUANTIZATION_TABLE_76_SHIFT    (16)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE15_CR_LUMA_QUANTIZATION_TABLE_75_MASK   
>> (0x0000FF00)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE15_CR_LUMA_QUANTIZATION_TABLE_75_SHIFT    (8)
>> +
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE15_CR_LUMA_QUANTIZATION_TABLE_74_MASK   
>> (0x000000FF)
>> +#define
>> JASPER_LUMA_QUANTIZATION_TABLE15_CR_LUMA_QUANTIZATION_TABLE_74_SHIFT    (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE0_OFFSET                (0x0090)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE0_CR_CHROMA_QUANTIZATION_TABLE_03_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE0_CR_CHROMA_QUANTIZATION_TABLE_03_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE0_CR_CHROMA_QUANTIZATION_TABLE_02_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE0_CR_CHROMA_QUANTIZATION_TABLE_02_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE0_CR_CHROMA_QUANTIZATION_TABLE_01_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE0_CR_CHROMA_QUANTIZATION_TABLE_01_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE0_CR_CHROMA_QUANTIZATION_TABLE_00_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE0_CR_CHROMA_QUANTIZATION_TABLE_00_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE1_OFFSET                    (0x0094)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE1_CR_CHROMA_QUANTIZATION_TABLE_07_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE1_CR_CHROMA_QUANTIZATION_TABLE_07_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE1_CR_CHROMA_QUANTIZATION_TABLE_06_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE1_CR_CHROMA_QUANTIZATION_TABLE_06_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE1_CR_CHROMA_QUANTIZATION_TABLE_05_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE1_CR_CHROMA_QUANTIZATION_TABLE_05_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE1_CR_CHROMA_QUANTIZATION_TABLE_04_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE1_CR_CHROMA_QUANTIZATION_TABLE_04_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE2_OFFSET                    (0x0098)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE2_CR_CHROMA_QUANTIZATION_TABLE_13_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE2_CR_CHROMA_QUANTIZATION_TABLE_13_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE2_CR_CHROMA_QUANTIZATION_TABLE_12_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE2_CR_CHROMA_QUANTIZATION_TABLE_12_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE2_CR_CHROMA_QUANTIZATION_TABLE_11_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE2_CR_CHROMA_QUANTIZATION_TABLE_11_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE2_CR_CHROMA_QUANTIZATION_TABLE_10_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE2_CR_CHROMA_QUANTIZATION_TABLE_10_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE3_OFFSET                    (0x009C)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE3_CR_CHROMA_QUANTIZATION_TABLE_17_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE3_CR_CHROMA_QUANTIZATION_TABLE_17_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE3_CR_CHROMA_QUANTIZATION_TABLE_16_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE3_CR_CHROMA_QUANTIZATION_TABLE_16_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE3_CR_CHROMA_QUANTIZATION_TABLE_15_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE3_CR_CHROMA_QUANTIZATION_TABLE_15_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE3_CR_CHROMA_QUANTIZATION_TABLE_14_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE3_CR_CHROMA_QUANTIZATION_TABLE_14_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE4_OFFSET                    (0x00A0)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE4_CR_CHROMA_QUANTIZATION_TABLE_23_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE4_CR_CHROMA_QUANTIZATION_TABLE_23_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE4_CR_CHROMA_QUANTIZATION_TABLE_22_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE4_CR_CHROMA_QUANTIZATION_TABLE_22_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE4_CR_CHROMA_QUANTIZATION_TABLE_21_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE4_CR_CHROMA_QUANTIZATION_TABLE_21_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE4_CR_CHROMA_QUANTIZATION_TABLE_20_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE4_CR_CHROMA_QUANTIZATION_TABLE_20_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE5_OFFSET                    (0x00A4)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE5_CR_CHROMA_QUANTIZATION_TABLE_27_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE5_CR_CHROMA_QUANTIZATION_TABLE_27_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE5_CR_CHROMA_QUANTIZATION_TABLE_26_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE5_CR_CHROMA_QUANTIZATION_TABLE_26_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE5_CR_CHROMA_QUANTIZATION_TABLE_25_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE5_CR_CHROMA_QUANTIZATION_TABLE_25_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE5_CR_CHROMA_QUANTIZATION_TABLE_24_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE5_CR_CHROMA_QUANTIZATION_TABLE_24_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE6_OFFSET                    (0x00A8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE6_CR_CHROMA_QUANTIZATION_TABLE_33_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE6_CR_CHROMA_QUANTIZATION_TABLE_33_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE6_CR_CHROMA_QUANTIZATION_TABLE_32_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE6_CR_CHROMA_QUANTIZATION_TABLE_32_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE6_CR_CHROMA_QUANTIZATION_TABLE_31_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE6_CR_CHROMA_QUANTIZATION_TABLE_31_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE6_CR_CHROMA_QUANTIZATION_TABLE_30_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE6_CR_CHROMA_QUANTIZATION_TABLE_30_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE7_OFFSET                    (0x00AC)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE7_CR_CHROMA_QUANTIZATION_TABLE_37_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE7_CR_CHROMA_QUANTIZATION_TABLE_37_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE7_CR_CHROMA_QUANTIZATION_TABLE_36_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE7_CR_CHROMA_QUANTIZATION_TABLE_36_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE7_CR_CHROMA_QUANTIZATION_TABLE_35_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE7_CR_CHROMA_QUANTIZATION_TABLE_35_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE7_CR_CHROMA_QUANTIZATION_TABLE_34_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE7_CR_CHROMA_QUANTIZATION_TABLE_34_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE8_OFFSET                    (0x00B0)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE8_CR_CHROMA_QUANTIZATION_TABLE_43_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE8_CR_CHROMA_QUANTIZATION_TABLE_43_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE8_CR_CHROMA_QUANTIZATION_TABLE_42_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE8_CR_CHROMA_QUANTIZATION_TABLE_42_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE8_CR_CHROMA_QUANTIZATION_TABLE_41_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE8_CR_CHROMA_QUANTIZATION_TABLE_41_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE8_CR_CHROMA_QUANTIZATION_TABLE_40_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE8_CR_CHROMA_QUANTIZATION_TABLE_40_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE9_OFFSET                    (0x00B4)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE9_CR_CHROMA_QUANTIZATION_TABLE_47_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE9_CR_CHROMA_QUANTIZATION_TABLE_47_SHIFT        (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE9_CR_CHROMA_QUANTIZATION_TABLE_46_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE9_CR_CHROMA_QUANTIZATION_TABLE_46_SHIFT        (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE9_CR_CHROMA_QUANTIZATION_TABLE_45_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE9_CR_CHROMA_QUANTIZATION_TABLE_45_SHIFT        (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE9_CR_CHROMA_QUANTIZATION_TABLE_44_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE9_CR_CHROMA_QUANTIZATION_TABLE_44_SHIFT        (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE10_OFFSET                    (0x00B8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE10_CR_CHROMA_QUANTIZATION_TABLE_53_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE10_CR_CHROMA_QUANTIZATION_TABLE_53_SHIFT   
>> (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE10_CR_CHROMA_QUANTIZATION_TABLE_52_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE10_CR_CHROMA_QUANTIZATION_TABLE_52_SHIFT   
>> (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE10_CR_CHROMA_QUANTIZATION_TABLE_51_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE10_CR_CHROMA_QUANTIZATION_TABLE_51_SHIFT    (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE10_CR_CHROMA_QUANTIZATION_TABLE_50_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE10_CR_CHROMA_QUANTIZATION_TABLE_50_SHIFT    (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE11_OFFSET                    (0x00BC)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE11_CR_CHROMA_QUANTIZATION_TABLE_57_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE11_CR_CHROMA_QUANTIZATION_TABLE_57_SHIFT   
>> (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE11_CR_CHROMA_QUANTIZATION_TABLE_56_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE11_CR_CHROMA_QUANTIZATION_TABLE_56_SHIFT   
>> (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE11_CR_CHROMA_QUANTIZATION_TABLE_55_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE11_CR_CHROMA_QUANTIZATION_TABLE_55_SHIFT    (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE11_CR_CHROMA_QUANTIZATION_TABLE_54_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE11_CR_CHROMA_QUANTIZATION_TABLE_54_SHIFT    (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE12_OFFSET                    (0x00C0)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE12_CR_CHROMA_QUANTIZATION_TABLE_63_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE12_CR_CHROMA_QUANTIZATION_TABLE_63_SHIFT   
>> (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE12_CR_CHROMA_QUANTIZATION_TABLE_62_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE12_CR_CHROMA_QUANTIZATION_TABLE_62_SHIFT   
>> (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE12_CR_CHROMA_QUANTIZATION_TABLE_61_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE12_CR_CHROMA_QUANTIZATION_TABLE_61_SHIFT    (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE12_CR_CHROMA_QUANTIZATION_TABLE_60_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE12_CR_CHROMA_QUANTIZATION_TABLE_60_SHIFT    (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE13_OFFSET                    (0x00C4)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE13_CR_CHROMA_QUANTIZATION_TABLE_67_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE13_CR_CHROMA_QUANTIZATION_TABLE_67_SHIFT   
>> (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE13_CR_CHROMA_QUANTIZATION_TABLE_66_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE13_CR_CHROMA_QUANTIZATION_TABLE_66_SHIFT   
>> (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE13_CR_CHROMA_QUANTIZATION_TABLE_65_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE13_CR_CHROMA_QUANTIZATION_TABLE_65_SHIFT    (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE13_CR_CHROMA_QUANTIZATION_TABLE_64_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE13_CR_CHROMA_QUANTIZATION_TABLE_64_SHIFT    (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE14_OFFSET                    (0x00C8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE14_CR_CHROMA_QUANTIZATION_TABLE_73_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE14_CR_CHROMA_QUANTIZATION_TABLE_73_SHIFT   
>> (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE14_CR_CHROMA_QUANTIZATION_TABLE_72_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE14_CR_CHROMA_QUANTIZATION_TABLE_72_SHIFT   
>> (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE14_CR_CHROMA_QUANTIZATION_TABLE_71_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE14_CR_CHROMA_QUANTIZATION_TABLE_71_SHIFT    (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE14_CR_CHROMA_QUANTIZATION_TABLE_70_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE14_CR_CHROMA_QUANTIZATION_TABLE_70_SHIFT    (0)
>> +
>> +#define JASPER_CHROMA_QUANTIZATION_TABLE15_OFFSET                    (0x00CC)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE15_CR_CHROMA_QUANTIZATION_TABLE_77_MASK        (0xFF000000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE15_CR_CHROMA_QUANTIZATION_TABLE_77_SHIFT   
>> (24)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE15_CR_CHROMA_QUANTIZATION_TABLE_76_MASK        (0x00FF0000)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE15_CR_CHROMA_QUANTIZATION_TABLE_76_SHIFT   
>> (16)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE15_CR_CHROMA_QUANTIZATION_TABLE_75_MASK        (0x0000FF00)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE15_CR_CHROMA_QUANTIZATION_TABLE_75_SHIFT    (8)
>> +
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE15_CR_CHROMA_QUANTIZATION_TABLE_74_MASK        (0x000000FF)
>> +#define
>> JASPER_CHROMA_QUANTIZATION_TABLE15_CR_CHROMA_QUANTIZATION_TABLE_74_SHIFT    (0)
>> +
>> +#define JASPER_CRC_CTRL_OFFSET                (0x00D0)
>> +#define JASPER_CRC_CTRL_JASPER_CRC_ENABLE_MASK        (0x00000001)
>> +#define JASPER_CRC_CTRL_JASPER_CRC_ENABLE_SHIFT        (0)
>> +
>> +#define JASPER_FRONT_END_CRC_OFFSET                (0x00D4)
>> +#define JASPER_FRONT_END_CRC_CR_JASPER_FRONT_END_CRC_OUT_MASK    (0xFFFFFFFF)
>> +#define JASPER_FRONT_END_CRC_CR_JASPER_FRONT_END_CRC_OUT_SHIFT    (0)
>> +
>> +#define JASPER_DCT_CRC_OFFSET                (0x00D8)
>> +#define JASPER_DCT_CRC_CR_JASPER_DCT_CRC_OUT_MASK    (0xFFFFFFFF)
>> +#define JASPER_DCT_CRC_CR_JASPER_DCT_CRC_OUT_SHIFT    (0)
>> +
>> +#define JASPER_ZZ_CRC_OFFSET                (0x00DC)
>> +#define JASPER_ZZ_CRC_CR_JASPER_ZZ_CRC_OUT_MASK        (0xFFFFFFFF)
>> +#define JASPER_ZZ_CRC_CR_JASPER_ZZ_CRC_OUT_SHIFT    (0)
>> +
>> +#define JASPER_QUANT_CRC_OFFSET                (0x00E0)
>> +#define JASPER_QUANT_CRC_CR_JASPER_QUANT_CRC_OUT_MASK    (0xFFFFFFFF)
>> +#define JASPER_QUANT_CRC_CR_JASPER_QUANT_CRC_OUT_SHIFT    (0)
>> +
>> +#define JASPER_ENTROPY_ENCODER_CRC_OFFSET                (0x00E4)
>> +#define JASPER_ENTROPY_ENCODER_CRC_CR_JASPER_ENTROPY_CRC_OUT_MASK   
>> (0xFFFFFFFF)
>> +#define JASPER_ENTROPY_ENCODER_CRC_CR_JASPER_ENTROPY_CRC_OUT_SHIFT    (0)
>> +
>> +#define JASPER_PACKING_BUFFER_DATA_CRC_OFFSET                        (0x00E8)
>> +#define
>> JASPER_PACKING_BUFFER_DATA_CRC_CR_JASPER_PACKING_DATA_CRC_OUT_MASK       
>> (0xFFFFFFFF)
>> +#define
>> JASPER_PACKING_BUFFER_DATA_CRC_CR_JASPER_PACKING_DATA_CRC_OUT_SHIFT        (0)
>> +
>> +#define JASPER_PACKING_BUFFER_ADDR_CRC_OFFSET                        (0x00EC)
>> +#define
>> JASPER_PACKING_BUFFER_ADDR_CRC_CR_JASPER_PACKING_ADDR_OUT_CRC_MASK       
>> (0xFFFFFFFF)
>> +#define
>> JASPER_PACKING_BUFFER_ADDR_CRC_CR_JASPER_PACKING_ADDR_OUT_CRC_SHIFT        (0)
>> +
>> +#define JASPER_CORE_BYTE_SIZE    (0x00F0)
>> +
>> +#endif
>> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
>> b/drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
>> new file mode 100644
>> index 000000000000..237339789407
>> --- /dev/null
>> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
>> @@ -0,0 +1,320 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Imagination E5010 JPEG Encoder driver.
>> + *
>> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
>> + *
>> + * Author: David Huang <d-huang@ti.com>
>> + * Author: Devarsh Thakkar <devarsht@ti.com>
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/dev_printk.h>
>> +#include "e5010-jpeg-enc-hw.h"
>> +
>> +static void write_reg_field(void __iomem *base, unsigned int offset, u32 mask,
>> +                unsigned int shift, u32 value)
>> +{
>> +    u32 reg;
>> +
>> +    value <<= shift;
>> +    if (mask != 0xffffffff) {
>> +        reg = readl(base + offset);
>> +        value = (value & mask) | (reg & ~mask);
>> +    }
>> +    writel(value, (base + offset));
>> +}
>> +
>> +static int write_reg_field_not_busy(void __iomem *jasper_base, void __iomem
>> *wr_base,
>> +                    unsigned int offset, u32 mask, unsigned int shift,
>> +                    u32 value)
>> +{
>> +    int ret;
>> +    u32 val;
>> +
>> +    ret = readl_poll_timeout_atomic(jasper_base + JASPER_STATUS_OFFSET, val,
>> +                    (val & JASPER_STATUS_CR_JASPER_BUSY_MASK) == 0,
>> +                    2000, 50000);
>> +    if (ret)
>> +        return ret;
>> +
>> +    write_reg_field(wr_base, offset, mask, shift, value);
>> +
>> +    return 0;
>> +}
>> +
>> +void e5010_reset(struct device *dev, void __iomem *core_base, void __iomem
>> *mmu_base)
>> +{
>> +    int ret = 0;
>> +    u32 val;
>> +
>> +    write_reg_field(core_base, JASPER_RESET_OFFSET,
>> +            JASPER_RESET_CR_CORE_RESET_MASK,
>> +            JASPER_RESET_CR_CORE_RESET_SHIFT, 1);
>> +
>> +    write_reg_field(mmu_base, MMU_MMU_CONTROL1_OFFSET,
>> +            MMU_MMU_CONTROL1_MMU_SOFT_RESET_MASK,
>> +            MMU_MMU_CONTROL1_MMU_SOFT_RESET_SHIFT, 1);
>> +
>> +    ret = readl_poll_timeout_atomic(mmu_base + MMU_MMU_CONTROL1_OFFSET, val,
>> +                    (val & MMU_MMU_CONTROL1_MMU_SOFT_RESET_MASK) == 0,
>> +                    2000, 50000);
>> +    if (ret)
>> +        dev_warn(dev, "MMU soft reset timed out, forcing system soft
>> reset\n");
>> +
>> +    write_reg_field(core_base, JASPER_RESET_OFFSET,
>> +            JASPER_RESET_CR_SYS_RESET_MASK,
>> +            JASPER_RESET_CR_SYS_RESET_SHIFT, 1);
>> +}
>> +
>> +void e5010_hw_bypass_mmu(void __iomem *mmu_base, u32 enable)
>> +{
>> +    /* Bypass MMU */
>> +    write_reg_field(mmu_base,
>> +            MMU_MMU_ADDRESS_CONTROL_OFFSET,
>> +            MMU_MMU_ADDRESS_CONTROL_MMU_BYPASS_MASK,
>> +            MMU_MMU_ADDRESS_CONTROL_MMU_BYPASS_SHIFT,
>> +            enable);
>> +}
>> +
>> +int e5010_hw_enable_output_address_error_irq(void __iomem *core_base, u32
>> enable)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_INTERRUPT_MASK_OFFSET,
>> +                      
>> JASPER_INTERRUPT_MASK_CR_OUTPUT_ADDRESS_ERROR_ENABLE_MASK,
>> +                      
>> JASPER_INTERRUPT_MASK_CR_OUTPUT_ADDRESS_ERROR_ENABLE_SHIFT,
>> +                       enable);
>> +    return ret;
>> +}
>> +
>> +bool e5010_hw_pic_done_irq(void __iomem *core_base)
>> +{
>> +    u32 reg;
>> +    bool pic_done;
>> +
>> +    reg = readl(core_base + JASPER_INTERRUPT_STATUS_OFFSET);
>> +    pic_done = (reg & JASPER_INTERRUPT_STATUS_CR_PICTURE_DONE_IRQ_MASK) ?
>> true : false;
>> +
>> +    return pic_done;
>> +}
>> +
>> +bool e5010_hw_output_address_irq(void __iomem *core_base)
>> +{
>> +    u32 reg;
>> +    bool output_address_error;
>> +
>> +    reg = readl(core_base + JASPER_INTERRUPT_STATUS_OFFSET);
>> +    output_address_error = (reg &
>> JASPER_INTERRUPT_STATUS_CR_OUTPUT_ADDRESS_ERROR_IRQ_MASK) ?
>> +                true : false;
>> +
>> +    return output_address_error;
>> +}
>> +
>> +int e5010_hw_enable_picture_done_irq(void __iomem *core_base, u32 enable)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_INTERRUPT_MASK_OFFSET,
>> +                       JASPER_INTERRUPT_MASK_CR_PICTURE_DONE_ENABLE_MASK,
>> +                       JASPER_INTERRUPT_MASK_CR_PICTURE_DONE_ENABLE_SHIFT,
>> +                       enable);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_enable_auto_clock_gating(void __iomem *core_base, u32 enable)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_CLK_CONTROL_OFFSET,
>> +                       JASPER_CLK_CONTROL_CR_JASPER_AUTO_CLKG_ENABLE_MASK,
>> +                       JASPER_CLK_CONTROL_CR_JASPER_AUTO_CLKG_ENABLE_SHIFT,
>> +                       enable);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_enable_manual_clock_gating(void __iomem *core_base, u32 enable)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_CLK_CONTROL_OFFSET,
>> +                       JASPER_CLK_CONTROL_CR_JASPER_MAN_CLKG_ENABLE_MASK,
>> +                       JASPER_CLK_CONTROL_CR_JASPER_MAN_CLKG_ENABLE_SHIFT, 0);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_enable_crc_check(void __iomem *core_base, u32 enable)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_CRC_CTRL_OFFSET,
>> +                       JASPER_CRC_CTRL_JASPER_CRC_ENABLE_MASK,
>> +                       JASPER_CRC_CTRL_JASPER_CRC_ENABLE_SHIFT, enable);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_input_source_to_memory(void __iomem *core_base, u32 set)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_INPUT_CTRL0_OFFSET,
>> +                       JASPER_INPUT_CTRL0_CR_INPUT_SOURCE_MASK,
>> +                       JASPER_INPUT_CTRL0_CR_INPUT_SOURCE_SHIFT, set);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_input_luma_addr(void __iomem *core_base, u32 val)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       INPUT_LUMA_BASE_OFFSET,
>> +                       INPUT_LUMA_BASE_CR_INPUT_LUMA_BASE_MASK, 0, val);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_input_chroma_addr(void __iomem *core_base, u32 val)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       INPUT_CHROMA_BASE_OFFSET,
>> +                       INPUT_CHROMA_BASE_CR_INPUT_CHROMA_BASE_MASK, 0, val);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_output_base_addr(void __iomem *core_base, u32 val)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_OUTPUT_BASE_OFFSET,
>> +                       JASPER_OUTPUT_BASE_CR_OUTPUT_BASE_MASK,
>> +                       JASPER_OUTPUT_BASE_CR_OUTPUT_BASE_SHIFT, val);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_horizontal_size(void __iomem *core_base, u32 val)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_IMAGE_SIZE_OFFSET,
>> +                       JASPER_IMAGE_SIZE_CR_IMAGE_HORIZONTAL_SIZE_MASK,
>> +                       JASPER_IMAGE_SIZE_CR_IMAGE_HORIZONTAL_SIZE_SHIFT,
>> +                       val);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_vertical_size(void __iomem *core_base, u32 val)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_IMAGE_SIZE_OFFSET,
>> +                       JASPER_IMAGE_SIZE_CR_IMAGE_VERTICAL_SIZE_MASK,
>> +                       JASPER_IMAGE_SIZE_CR_IMAGE_VERTICAL_SIZE_SHIFT,
>> +                       val);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_luma_stride(void __iomem *core_base, u32 bytesperline)
>> +{
>> +    int ret;
>> +    u32 val = bytesperline / 64;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_INPUT_CTRL1_OFFSET,
>> +                       JASPER_INPUT_CTRL1_CR_INPUT_LUMA_STRIDE_MASK,
>> +                       JASPER_INPUT_CTRL1_CR_INPUT_LUMA_STRIDE_SHIFT,
>> +                       val);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_chroma_stride(void __iomem *core_base, u32 bytesperline)
>> +{
>> +    int ret;
>> +    u32 val = bytesperline / 64;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_INPUT_CTRL1_OFFSET,
>> +                       JASPER_INPUT_CTRL1_CR_INPUT_CHROMA_STRIDE_MASK,
>> +                       JASPER_INPUT_CTRL1_CR_INPUT_CHROMA_STRIDE_SHIFT,
>> +                       val);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_input_subsampling(void __iomem *core_base, u32 val)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_INPUT_CTRL0_OFFSET,
>> +                       JASPER_INPUT_CTRL0_CR_INPUT_SUBSAMPLING_MASK,
>> +                       JASPER_INPUT_CTRL0_CR_INPUT_SUBSAMPLING_SHIFT,
>> +                       val);
>> +    return ret;
>> +}
>> +
>> +int e5010_hw_set_chroma_order(void __iomem *core_base, u32 val)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base,
>> +                       JASPER_INPUT_CTRL0_OFFSET,
>> +                       JASPER_INPUT_CTRL0_CR_INPUT_CHROMA_ORDER_MASK,
>> +                       JASPER_INPUT_CTRL0_CR_INPUT_CHROMA_ORDER_SHIFT,
>> +                       val);
>> +    return ret;
>> +}
>> +
>> +void e5010_hw_set_output_max_size(void __iomem *core_base, u32 val)
>> +{
>> +    write_reg_field(core_base, JASPER_OUTPUT_MAX_SIZE_OFFSET,
>> +            JASPER_OUTPUT_MAX_SIZE_CR_OUTPUT_MAX_SIZE_MASK,
>> +            JASPER_OUTPUT_MAX_SIZE_CR_OUTPUT_MAX_SIZE_SHIFT,
>> +            val);
>> +}
>> +
>> +int e5010_hw_set_qpvalue(void __iomem *core_base, u32 offset, u32 val)
>> +{
>> +    int ret;
>> +
>> +    ret = write_reg_field_not_busy(core_base, core_base, offset,
>> 0xffffffff, 0, val);
>> +    return ret;
>> +}
>> +
>> +void e5010_hw_clear_output_error(void __iomem *core_base, u32 clear)
>> +{
>> +    /* Make sure interrupts are clear */
>> +    write_reg_field(core_base, JASPER_INTERRUPT_CLEAR_OFFSET,
>> +            JASPER_INTERRUPT_CLEAR_CR_OUTPUT_ERROR_CLEAR_MASK,
>> +            JASPER_INTERRUPT_CLEAR_CR_OUTPUT_ERROR_CLEAR_SHIFT, clear);
>> +}
>> +
>> +void e5010_hw_clear_picture_done(void __iomem *core_base, u32 clear)
>> +{
>> +    write_reg_field(core_base,
>> +            JASPER_INTERRUPT_CLEAR_OFFSET,
>> +            JASPER_INTERRUPT_CLEAR_CR_PICTURE_DONE_CLEAR_MASK,
>> +            JASPER_INTERRUPT_CLEAR_CR_PICTURE_DONE_CLEAR_SHIFT, clear);
>> +}
>> +
>> +int e5010_hw_get_output_size(void __iomem *core_base)
>> +{
>> +    return readl(core_base + JASPER_OUTPUT_SIZE_OFFSET);
>> +}
>> +
>> +void e5010_hw_encode_start(void __iomem *core_base, u32 start)
>> +{
>> +    write_reg_field(core_base, JASPER_CORE_CTRL_OFFSET,
>> +            JASPER_CORE_CTRL_CR_JASPER_ENCODE_START_MASK,
>> +            JASPER_CORE_CTRL_CR_JASPER_ENCODE_START_SHIFT, start);
>> +}
>> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
>> b/drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
>> new file mode 100644
>> index 000000000000..781d353c3226
>> --- /dev/null
>> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
>> @@ -0,0 +1,42 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Imagination E5010 JPEG Encoder driver.
>> + *
>> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
>> + *
>> + * Author: David Huang <d-huang@ti.com>
>> + * Author: Devarsh Thakkar <devarsht@ti.com>
>> + */
>> +
>> +#ifndef _E5010_JPEG_ENC_HW_H
>> +#define _E5010_JPEG_ENC_HW_H
>> +
>> +#include "e5010-core-regs.h"
>> +#include "e5010-mmu-regs.h"
>> +
>> +int e5010_hw_enable_output_address_error_irq(void __iomem *core_offset, u32
>> enable);
>> +int e5010_hw_enable_picture_done_irq(void __iomem *core_offset, u32 enable);
>> +int e5010_hw_enable_auto_clock_gating(void __iomem *core_offset, u32 enable);
>> +int e5010_hw_enable_manual_clock_gating(void __iomem *core_offset, u32
>> enable);
>> +int e5010_hw_enable_crc_check(void __iomem *core_offset, u32 enable);
>> +int e5010_hw_set_input_source_to_memory(void __iomem *core_offset, u32 set);
>> +int e5010_hw_set_input_luma_addr(void __iomem *core_offset, u32 val);
>> +int e5010_hw_set_input_chroma_addr(void __iomem *core_offset, u32 val);
>> +int e5010_hw_set_output_base_addr(void __iomem *core_offset, u32 val);
>> +int e5010_hw_get_output_size(void __iomem *core_offset);
>> +int e5010_hw_set_horizontal_size(void __iomem *core_offset, u32 val);
>> +int e5010_hw_set_vertical_size(void __iomem *core_offset, u32 val);
>> +int e5010_hw_set_luma_stride(void __iomem *core_offset, u32 bytesperline);
>> +int e5010_hw_set_chroma_stride(void __iomem *core_offset, u32 bytesperline);
>> +int e5010_hw_set_input_subsampling(void __iomem *core_offset, u32 val);
>> +int e5010_hw_set_chroma_order(void __iomem *core_offset, u32 val);
>> +int e5010_hw_set_qpvalue(void __iomem *core_offset, u32 offset, u32 value);
>> +void e5010_reset(struct device *dev, void __iomem *core_offset, void
>> __iomem *mmu_offset);
>> +void e5010_hw_set_output_max_size(void __iomem *core_offset, u32 val);
>> +void e5010_hw_clear_picture_done(void __iomem *core_offset, u32 clear);
>> +void e5010_hw_encode_start(void __iomem *core_offset, u32 start);
>> +void e5010_hw_clear_output_error(void __iomem *core_offset, u32 clear);
>> +void e5010_hw_bypass_mmu(void __iomem *mmu_base, u32 enable);
>> +bool e5010_hw_pic_done_irq(void __iomem *core_base);
>> +bool e5010_hw_output_address_irq(void __iomem *core_base);
>> +#endif
>> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c
>> b/drivers/media/platform/imagination/e5010-jpeg-enc.c
>> new file mode 100644
>> index 000000000000..bf40ba9014e1
>> --- /dev/null
>> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
>> @@ -0,0 +1,1678 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Imagination E5010 JPEG Encoder driver.
>> + *
>> + * TODO: Add MMU and memory tiling support
>> + *
>> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
>> + *
>> + * Author: David Huang <d-huang@ti.com>
>> + * Author: Devarsh Thakkar <devarsht@ti.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/ioctl.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/clk.h>
>> +#include <media/v4l2-common.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/videobuf2-v4l2.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +#include "e5010-jpeg-enc.h"
>> +#include "e5010-jpeg-enc-hw.h"
>> +
>> +/* forward declarations */
>> +static const struct of_device_id e5010_of_match[];
>> +
>> +static const struct v4l2_file_operations e5010_fops;
>> +
>> +static const struct v4l2_ioctl_ops e5010_ioctl_ops;
>> +
>> +static const struct vb2_ops e5010_video_ops;
>> +
>> +static const struct v4l2_m2m_ops e5010_m2m_ops;
>> +
>> +static struct e5010_fmt e5010_formats[] = {
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_NV12,
>> +        .num_planes = 1,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +        .subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>> +        .chroma_order = CHROMA_ORDER_CB_CR,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 64,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_NV12M,
>> +        .num_planes = 2,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +        .subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>> +        .chroma_order = CHROMA_ORDER_CB_CR,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 64,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_NV21,
>> +        .num_planes = 1,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +        .subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>> +        .chroma_order = CHROMA_ORDER_CR_CB,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 64,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_NV21M,
>> +        .num_planes = 2,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +        .subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>> +        .chroma_order = CHROMA_ORDER_CR_CB,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 64,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_NV16,
>> +        .num_planes = 1,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +        .subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>> +        .chroma_order = CHROMA_ORDER_CB_CR,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 64,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_NV16M,
>> +        .num_planes = 2,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +        .subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>> +        .chroma_order = CHROMA_ORDER_CB_CR,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 64,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_NV61,
>> +        .num_planes = 1,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +        .subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>> +        .chroma_order = CHROMA_ORDER_CR_CB,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 64,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_NV61M,
>> +        .num_planes = 2,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +        .subsampling = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>> +        .chroma_order = CHROMA_ORDER_CR_CB,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 64,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_JPEG,
>> +        .num_planes = 1,
>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>> +        .subsampling = 0,
>> +        .chroma_order = 0,
>> +        .frmsize = { MIN_DIMENSION, MAX_DIMENSION, 16,
>> +                 MIN_DIMENSION, MAX_DIMENSION, 8 },
>> +    },
>> +};
>> +
>> +/* Luma and chroma qp table to acheive 50% compression quality
>> + * This is as per example in Annex K.1 of IS0/IEC 10918-1:1994(E)
>> + */
>> +static const u8 luma[64] = {
>> +    16, 11, 10, 16, 24, 40, 51, 61,
>> +    12, 12, 14, 19, 26, 58, 60, 55,
>> +    14, 13, 16, 24, 40, 57, 69, 56,
>> +    14, 17, 22, 29, 51, 87, 80, 62,
>> +    18, 22, 37, 56, 68, 109, 103, 77,
>> +    24, 35, 55, 64, 81, 104, 113, 92,
>> +    49, 64, 78, 87, 103, 121, 120, 101,
>> +    72, 92, 95, 98, 112, 100, 103, 99
>> +};
>> +
>> +static const u8 chroma[64] = {
>> +    17, 18, 24, 47, 99, 99, 99, 99,
>> +    18, 21, 26, 66, 99, 99, 99, 99,
>> +    24, 26, 56, 99, 99, 99, 99, 99,
>> +    47, 66, 99, 99, 99, 99, 99, 99,
>> +    99, 99, 99, 99, 99, 99, 99, 99,
>> +    99, 99, 99, 99, 99, 99, 99, 99,
>> +    99, 99, 99, 99, 99, 99, 99, 99,
>> +    99, 99, 99, 99, 99, 99, 99, 99
>> +};
>> +
>> +/* Zigzag scan pattern */
>> +static const u8 zigzag[64] = {
>> +    0,   1,  8, 16,  9,  2,  3, 10,
>> +    17, 24, 32, 25, 18, 11,  4,  5,
>> +    12, 19, 26, 33, 40, 48, 41, 34,
>> +    27, 20, 13,  6,  7, 14, 21, 28,
>> +    35, 42, 49, 56, 57, 50, 43, 36,
>> +    29, 22, 15, 23, 30, 37, 44, 51,
>> +    58, 59, 52, 45, 38, 31, 39, 46,
>> +    53, 60, 61, 54, 47, 55, 62, 63
>> +};
> 
> These 3 are duplicates of those in
> drivers/media/platform/verisilicon/hantro_jpeg.c
> 
> We should eventually do something about it.
> 

Agreed will move them to include/media/jpeg.h

>> +
>> +/*
>> + * Contains the data that needs to be sent in the marker segment of an
>> interchange format JPEG
>> + * stream or an abbreviated format table specification data stream.
>> + * Specifies the huffman table used for encoding the luminance DC
>> coefficient differences.
>> + * The table represents Table K.3 of IS0/IEC 10918-1:1994(E)
>> + */
>> +static const u8 marker_luma_dc[] = {
>> +    0x00, 0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
>> +    0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
>> +};
>> +
>> +/*
>> + * Contains the data that needs to be sent in the marker segment of an
>> interchange format JPEG
>> + * stream or an abbreviated format table specification data stream.
>> + * Specifies the huffman table used for encoding the luminance AC
>> coefficients.
>> + * The table represents Table K.5 of IS0/IEC 10918-1:1994(E)
>> + */
>> +static const u8 marker_luma_ac[] = {
>> +    0x10, 0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
>> +    0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7D,
>> +    0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12, 0x21, 0x31, 0x41, 0x06,
>> 0x13, 0x51, 0x61,
>> +    0x07, 0x22, 0x71, 0x14, 0x32, 0x81, 0x91, 0xA1, 0x08, 0x23, 0x42, 0xB1,
>> 0xC1, 0x15, 0x52,
>> +    0xD1, 0xF0, 0x24, 0x33, 0x62, 0x72, 0x82, 0x09, 0x0A, 0x16, 0x17, 0x18,
>> 0x19, 0x1A, 0x25,
>> +    0x26, 0x27, 0x28, 0x29, 0x2A, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A,
>> 0x43, 0x44, 0x45,
>> +    0x46, 0x47, 0x48, 0x49, 0x4A, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59,
>> 0x5A, 0x63, 0x64,
>> +    0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78,
>> 0x79, 0x7A, 0x83,
>> +    0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93, 0x94, 0x95, 0x96,
>> 0x97, 0x98, 0x99,
>> +    0x9A, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9, 0xAA, 0xB2, 0xB3,
>> 0xB4, 0xB5, 0xB6,
>> +    0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9,
>> 0xCA, 0xD2, 0xD3,
>> +    0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9, 0xDA, 0xE1, 0xE2, 0xE3, 0xE4, 0xE5,
>> 0xE6, 0xE7, 0xE8,
>> +    0xE9, 0xEA, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA
>> +};
>> +
>> +/*
>> + * Contains the data that needs to be sent in the marker segment of an
>> interchange format JPEG
>> + * stream or an abbreviated format table specification data stream.
>> + * Specifies the huffman table used for encoding the chrominance DC
>> coefficient differences.
>> + * The table represents Table K.4 of IS0/IEC 10918-1:1994(E)
>> + */
>> +static const u8 marker_chroma_dc[] = {
>> +    0x01, 0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
>> +    0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
>> +};
>> +
>> +/*
>> + * Contains the data that needs to be sent in the marker segment of an
>> interchange format JPEG
>> + * stream or an abbreviated format table specification data stream.
>> + * Specifies the huffman table used for encoding the chrominance AC
>> coefficients.
>> + * The table represents Table K.6 of IS0/IEC 10918-1:1994(E)
>> + */
>> +static const u8 marker_chroma_ac[] = {
>> +    0x11, 0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04,
>> +    0x07, 0x05, 0x04, 0x04, 0x00, 0x01, 0x02, 0x77,
>> +    0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21, 0x31, 0x06, 0x12, 0x41,
>> 0x51, 0x07, 0x61,
>> +    0x71, 0x13, 0x22, 0x32, 0x81, 0x08, 0x14, 0x42, 0x91, 0xA1, 0xB1, 0xC1,
>> 0x09, 0x23, 0x33,
>> +    0x52, 0xF0, 0x15, 0x62, 0x72, 0xD1, 0x0A, 0x16, 0x24, 0x34, 0xE1, 0x25,
>> 0xF1, 0x17, 0x18,
>> +    0x19, 0x1A, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x35, 0x36, 0x37, 0x38, 0x39,
>> 0x3A, 0x43, 0x44,
>> +    0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
>> 0x59, 0x5A, 0x63,
>> +    0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x73, 0x74, 0x75, 0x76, 0x77,
>> 0x78, 0x79, 0x7A,
>> +    0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93, 0x94,
>> 0x95, 0x96, 0x97,
>> +    0x98, 0x99, 0x9A, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9, 0xAA,
>> 0xB2, 0xB3, 0xB4,
>> +    0xB5, 0xB6, 0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7,
>> 0xC8, 0xC9, 0xCA,
>> +    0xD2, 0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9, 0xDA, 0xE2, 0xE3, 0xE4,
>> 0xE5, 0xE6, 0xE7,
>> +    0xE8, 0xE9, 0xEA, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA
>> +};
>> +
> 
> These 4 are suspiciously similar, too, to those find in the verisilicon driver.
> 
> It seems some jpeg helpers library is in order.
> 

Yes I think it should be possible to have a jpeg helpers library or a common
file for preparing jpeg headers and I am open to look into it but would prefer
to track that as a separate patch and not in this series as I want to spend
some time to design it properly.

For now,  I was thinking if I can move all these byte arrays too to
include/media/jpeg.h and update it in V4 and then as a separate patch series
introduce the jpeg encoder helper module which export API to prepare JPEG helpers.

Kindly let me know your opinion.

Regards
Devarsh

>> +static unsigned int debug;
>> +module_param(debug, uint, 0644);
>> +MODULE_PARM_DESC(debug, "debug level");
>> +
>> +#define dprintk(dev, lvl, fmt, arg...) \
>> +    v4l2_dbg(lvl, debug, &(dev)->v4l2_dev, "%s: " fmt, __func__, ## arg)
>> +
>> +static const struct v4l2_event e5010_eos_event = {
>> +    .type = V4L2_EVENT_EOS
>> +};
>> +
>> +static const char *type_name(enum v4l2_buf_type type)
>> +{
>> +    switch (type) {
>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +        return "Output";
>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        return "Capture";
>> +    default:
>> +        return "Invalid";
>> +    }
>> +}
>> +
>> +static struct e5010_q_data *get_queue(struct e5010_context *ctx, enum
>> v4l2_buf_type type)
>> +{
>> +    switch (type) {
>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +        return &ctx->out_queue;
>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        return &ctx->cap_queue;
>> +    default:
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +    return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static void calculate_qp_tables(struct e5010_context *ctx)
>> +{
>> +    long long luminosity, contrast;
>> +    int quality, i;
>> +
>> +    quality = 50 - ctx->quality;
>> +
>> +    luminosity = LUMINOSITY * quality / 50;
>> +    contrast = CONTRAST * quality / 50;
>> +
>> +    if (quality > 0) {
>> +        luminosity *= INCREASE;
>> +        contrast *= INCREASE;
>> +    }
>> +
>> +    for (i = 0; i < 64; i++) {
> 
> Is 64 maybe an ARRAY_SIZE() of something relevant?
> 

It's the size of both chroma and luma qp_tables, maybe I can have a macro
QP_TABLE_SIZE instead of using magic numbers.

>> +        long long delta = chroma[i] * contrast + luminosity;
>> +        int val = (int)(chroma[i] + delta);
>> +
>> +        clamp(val, 1, 255);
>> +        ctx->chroma_qp[i] = quality == -50 ? 1 : val;
>> +
>> +        delta = luma[i] * contrast + luminosity;
>> +        val = (int)(luma[i] + delta);
>> +        clamp(val, 1, 255);
>> +        ctx->luma_qp[i] = quality == -50 ? 1 : val;
>> +    }
>> +
>> +    ctx->update_qp = true;
>> +}
>> +
>> +static int update_qp_tables(struct e5010_context *ctx)
>> +{
>> +    struct e5010_dev *e5010 = ctx->e5010;
>> +    int i, ret = 0;
>> +    u32 lvalue, cvalue;
>> +
>> +    lvalue = 0;
>> +    cvalue = 0;
>> +
>> +    for (i = 0; i < QP_TABLE_SIZE; i++) {
>> +        lvalue |= ctx->luma_qp[i] << (8 * (i % 4));
>> +        cvalue |= ctx->chroma_qp[i] << (8 * (i % 4));
>> +        if (i % 4 == 3) {
>> +            ret |= e5010_hw_set_qpvalue(e5010->core_base,
>> +                            JASPER_LUMA_QUANTIZATION_TABLE0_OFFSET
>> +                            + QP_TABLE_FIELD_OFFSET * ((i - 3) / 4),
>> +                            lvalue);
>> +            ret |= e5010_hw_set_qpvalue(e5010->core_base,
>> +                            JASPER_CHROMA_QUANTIZATION_TABLE0_OFFSET
>> +                            + QP_TABLE_FIELD_OFFSET * ((i - 3) / 4),
>> +                            cvalue);
>> +            lvalue = 0;
>> +            cvalue = 0;
>> +        }
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int e5010_set_input_subsampling(void __iomem *core_base, int
>> subsampling)
>> +{
>> +    switch (subsampling) {
>> +    case V4L2_JPEG_CHROMA_SUBSAMPLING_420:
>> +        return e5010_hw_set_input_subsampling(core_base, SUBSAMPLING_420);
>> +    case V4L2_JPEG_CHROMA_SUBSAMPLING_422:
>> +        return e5010_hw_set_input_subsampling(core_base, SUBSAMPLING_422);
>> +    default:
>> +        return -EINVAL;
>> +    };
>> +}
>> +
>> +static int e5010_querycap(struct file *file, void *priv, struct
>> v4l2_capability *cap)
>> +{
>> +    strscpy(cap->driver, E5010_MODULE_NAME, sizeof(cap->driver));
>> +    strscpy(cap->card, E5010_MODULE_NAME, sizeof(cap->card));
>> +    snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>> E5010_MODULE_NAME);
>> +    cap->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>> +    cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>> +
>> +    return 0;
>> +}
>> +
>> +static struct e5010_fmt *find_format(struct v4l2_format *f)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(e5010_formats); ++i) {
>> +        if (e5010_formats[i].fourcc == f->fmt.pix_mp.pixelformat &&
>> +            e5010_formats[i].type == f->type)
>> +            return &e5010_formats[i];
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static int e5010_enum_fmt(struct file *file, void *priv, struct
>> v4l2_fmtdesc *f)
>> +{
>> +    int i, index = 0;
>> +    struct e5010_fmt *fmt = NULL;
>> +    struct e5010_context *ctx = file->private_data;
>> +
>> +    if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
>> +        v4l2_err(&ctx->e5010->v4l2_dev, "ENUMFMT with Invalid type: %d\n",
>> f->type);
>> +        return -EINVAL;
>> +    }
>> +
>> +    for (i = 0; i < ARRAY_SIZE(e5010_formats); ++i) {
>> +        if (e5010_formats[i].type == f->type) {
>> +            if (index == f->index) {
>> +                fmt = &e5010_formats[i];
>> +                break;
>> +            }
>> +            index++;
>> +        }
>> +    }
>> +
>> +    if (!fmt)
>> +        return -EINVAL;
>> +
>> +    f->pixelformat = fmt->fourcc;
>> +    return 0;
>> +}
>> +
>> +static int e5010_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>> +{
>> +    struct e5010_context *ctx = file->private_data;
>> +    struct e5010_q_data *queue;
>> +    int i;
>> +    struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +    struct v4l2_plane_pix_format *plane_fmt = pix_mp->plane_fmt;
>> +
>> +    if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
>> +        v4l2_err(&ctx->e5010->v4l2_dev, "G_FMT with Invalid type: %d\n",
>> f->type);
>> +        return -EINVAL;
>> +    }
>> +
>> +    queue = get_queue(ctx, f->type);
>> +    if (IS_ERR(queue))
>> +        return PTR_ERR(queue);
>> +
>> +    pix_mp->flags = 0;
>> +    pix_mp->field = V4L2_FIELD_NONE;
>> +    pix_mp->pixelformat = queue->fmt->fourcc;
>> +    pix_mp->width = queue->width_adjusted;
>> +    pix_mp->height = queue->height_adjusted;
>> +    pix_mp->num_planes = queue->fmt->num_planes;
>> +
>> +    if (V4L2_TYPE_IS_OUTPUT(f->type)) {
>> +        if (!pix_mp->colorspace)
>> +            pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
>> +
>> +        for (i = 0; i < queue->fmt->num_planes; i++) {
>> +            plane_fmt[i].sizeimage = queue->sizeimage[i];
>> +            plane_fmt[i].bytesperline = queue->bytesperline[i];
>> +        }
>> +
>> +    } else {
>> +        pix_mp->colorspace = V4L2_COLORSPACE_JPEG;
>> +        plane_fmt[0].bytesperline = 0;
>> +        plane_fmt[0].sizeimage = queue->sizeimage[0];
>> +    }
>> +    pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +    pix_mp->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +    pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_jpeg_try_fmt(struct v4l2_format *f, struct e5010_context
>> *ctx)
>> +{
>> +    struct e5010_fmt *fmt;
>> +    struct e5010_q_data *queue;
>> +    int i;
>> +    struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +    struct v4l2_plane_pix_format *plane_fmt = pix_mp->plane_fmt;
>> +
>> +    if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
>> +        v4l2_err(&ctx->e5010->v4l2_dev, "G_FMT with Invalid type: %d\n",
>> f->type);
>> +        return -EINVAL;
>> +    }
>> +
>> +    fmt = find_format(f);
>> +    if (!fmt) {
>> +        if (V4L2_TYPE_IS_OUTPUT(f->type))
>> +            pix_mp->pixelformat = V4L2_PIX_FMT_NV12;
>> +        else
>> +            pix_mp->pixelformat = V4L2_PIX_FMT_JPEG;
>> +        fmt = find_format(f);
>> +        if (!fmt)
>> +            return -EINVAL;
>> +    }
>> +
>> +    queue = get_queue(ctx, f->type);
>> +    if (IS_ERR(queue))
>> +        return PTR_ERR(queue);
>> +
>> +    queue->fmt = fmt;
>> +    queue->width = pix_mp->width;
>> +    queue->height = pix_mp->height;
>> +
>> +    if (V4L2_TYPE_IS_OUTPUT(f->type)) {
>> +        if (!pix_mp->colorspace)
>> +            pix_mp->colorspace = V4L2_COLORSPACE_JPEG;
>> +        if (!pix_mp->ycbcr_enc)
>> +            pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +        if (!pix_mp->quantization)
>> +            pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
>> +        if (!pix_mp->xfer_func)
>> +            pix_mp->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +
>> +        v4l2_apply_frmsize_constraints(&pix_mp->width,
>> +                           &pix_mp->height,
>> +                           &fmt->frmsize);
>> +
>> +        v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
>> +                    pix_mp->width, pix_mp->height);
>> +
>> +        for (i = 0; i < fmt->num_planes; i++) {
>> +            queue->bytesperline[i] = plane_fmt[i].bytesperline;
>> +            queue->sizeimage[i] = plane_fmt[i].sizeimage;
>> +        }
>> +    } else {
>> +        pix_mp->colorspace = V4L2_COLORSPACE_JPEG;
>> +        pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +        pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
>> +        pix_mp->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +        memset(plane_fmt[0].reserved, 0, sizeof(plane_fmt[0].reserved));
>> +        v4l2_apply_frmsize_constraints(&pix_mp->width,
>> +                           &pix_mp->height,
>> +                           &fmt->frmsize);
>> +        queue->sizeimage[0] = pix_mp->width * pix_mp->height *
>> JPEG_MAX_BYTES_PER_PIXEL;
>> +        queue->sizeimage[0] += HEADER_SIZE;
>> +        queue->sizeimage[1] = 0;
>> +        queue->bytesperline[0] = 0;
>> +        queue->bytesperline[1] = 0;
>> +        plane_fmt[0].sizeimage = queue->sizeimage[0];
>> +        plane_fmt[0].bytesperline = 0;
>> +    }
>> +    pix_mp->flags = 0;
>> +    pix_mp->field = V4L2_FIELD_NONE;
>> +    pix_mp->pixelformat = fmt->fourcc;
>> +    queue->width_adjusted = pix_mp->width;
>> +    queue->height_adjusted = pix_mp->height;
>> +    pix_mp->num_planes = fmt->num_planes;
>> +    memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
>> +
>> +    dprintk(ctx->e5010, 2,
>> +        "ctx: 0x%p: format type %s:, wxh: %dx%d (plane0 : %d bytes, plane1
>> : %d bytes),fmt: %c%c%c%c\n",
>> +        ctx, type_name(f->type), queue->width_adjusted,
>> queue->height_adjusted,
>> +        queue->sizeimage[0], queue->sizeimage[1],
>> +        (queue->fmt->fourcc & 0xff),
>> +        (queue->fmt->fourcc >>  8) & 0xff,
>> +        (queue->fmt->fourcc >> 16) & 0xff,
>> +        (queue->fmt->fourcc >> 24) & 0xff);
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>> +{
>> +    struct e5010_context *ctx = file->private_data;
>> +
>> +    return e5010_jpeg_try_fmt(f, ctx);
>> +}
>> +
>> +static int e5010_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
>> +{
>> +    struct e5010_context *ctx = file->private_data;
>> +    struct vb2_queue *vq;
>> +
>> +    vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>> +    if (!vq)
>> +        return -EINVAL;
>> +
>> +    if (vb2_is_busy(vq)) {
>> +        v4l2_err(&ctx->e5010->v4l2_dev, "queue busy\n");
>> +        return -EBUSY;
>> +    }
>> +
>> +    return e5010_jpeg_try_fmt(f, ctx);
>> +}
>> +
>> +static int e5010_enum_framesizes(struct file *file, void *priv, struct
>> v4l2_frmsizeenum *fsize)
>> +{
>> +    struct v4l2_format f;
>> +    struct e5010_fmt *fmt;
>> +
>> +    if (fsize->index != 0)
>> +        return -EINVAL;
>> +
>> +    f.fmt.pix_mp.pixelformat = fsize->pixel_format;
>> +    if (f.fmt.pix_mp.pixelformat ==  V4L2_PIX_FMT_JPEG)
>> +        f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +    else
>> +        f.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +
>> +    fmt = find_format(&f);
>> +    if (!fmt)
>> +        return -EINVAL;
>> +
>> +    fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>> +    fsize->stepwise = fmt->frmsize;
>> +    fsize->reserved[0] = 0;
>> +    fsize->reserved[1] = 0;
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_g_selection(struct file *file, void *fh, struct
>> v4l2_selection *s)
>> +{
>> +    struct e5010_context *ctx = file->private_data;
>> +    struct e5010_q_data *queue;
>> +
>> +    if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +        return -EINVAL;
>> +
>> +    queue = get_queue(ctx, s->type);
>> +    if (IS_ERR(queue))
>> +        return PTR_ERR(queue);
>> +
>> +    switch (s->target) {
>> +    case V4L2_SEL_TGT_CROP_DEFAULT:
>> +    case V4L2_SEL_TGT_CROP_BOUNDS:
>> +        s->r.left = 0;
>> +        s->r.top = 0;
>> +        s->r.width = queue->width;
>> +        s->r.height = queue->height;
>> +        break;
>> +    case V4L2_SEL_TGT_CROP:
>> +        s->r = queue->crop;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_s_selection(struct file *file, void *fh, struct
>> v4l2_selection *s)
>> +{
>> +    struct e5010_context *ctx = file->private_data;
>> +    struct e5010_q_data *queue;
>> +
>> +    if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +        return -EINVAL;
>> +
>> +    queue = get_queue(ctx, s->type);
>> +    if (IS_ERR(queue))
>> +        return PTR_ERR(queue);
>> +
>> +    queue->crop.left = 0;
>> +    queue->crop.top = 0;
>> +    queue->crop.width = s->r.width;
>> +    queue->crop.height = s->r.height;
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_subscribe_event(struct v4l2_fh *fh, const struct
>> v4l2_event_subscription *sub)
>> +{
>> +    switch (sub->type) {
>> +    case V4L2_EVENT_EOS:
>> +        return v4l2_event_subscribe(fh, sub, 0, NULL);
>> +    case V4L2_EVENT_CTRL:
>> +        return v4l2_ctrl_subscribe_event(fh, sub);
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int queue_init(void *priv, struct vb2_queue *src_vq, struct
>> vb2_queue *dst_vq)
>> +{
>> +    struct e5010_context *ctx = priv;
>> +    struct e5010_dev *e5010 = ctx->e5010;
>> +    int ret = 0;
>> +
>> +    /* src_vq */
>> +    memset(src_vq, 0, sizeof(*src_vq));
>> +    src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +    src_vq->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>> +    src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +    src_vq->drv_priv = ctx;
>> +    src_vq->buf_struct_size = sizeof(struct e5010_buffer);
>> +    src_vq->ops = &e5010_video_ops;
>> +    src_vq->mem_ops = &vb2_dma_contig_memops;
>> +    src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +    src_vq->lock = &e5010->mutex;
>> +    src_vq->dev = e5010->v4l2_dev.dev;
>> +
>> +    ret = vb2_queue_init(src_vq);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* dst_vq */
>> +    memset(dst_vq, 0, sizeof(*dst_vq));
>> +    dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +    src_vq->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>> +    dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +    dst_vq->drv_priv = ctx;
>> +    dst_vq->buf_struct_size = sizeof(struct e5010_buffer);
>> +    dst_vq->ops = &e5010_video_ops;
>> +    dst_vq->mem_ops = &vb2_dma_contig_memops;
>> +    dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +    dst_vq->lock = &e5010->mutex;
>> +    dst_vq->dev = e5010->v4l2_dev.dev;
>> +
>> +    ret = vb2_queue_init(dst_vq);
>> +    if (ret) {
>> +        vb2_queue_release(src_vq);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +    struct e5010_context *ctx =
>> +        container_of(ctrl->handler, struct e5010_context, ctrl_handler);
>> +
>> +    switch (ctrl->id) {
>> +    case V4L2_CID_JPEG_COMPRESSION_QUALITY:
>> +        ctx->quality = ctrl->val;
>> +        calculate_qp_tables(ctx);
>> +        break;
>> +    default:
>> +        v4l2_err(&ctx->e5010->v4l2_dev, "Invalid control, id = %d, val =
>> %d\n",
>> +             ctrl->id, ctrl->val);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops e5010_ctrl_ops = {
>> +    .s_ctrl = e5010_s_ctrl,
>> +};
>> +
>> +static void e5010_encode_ctrls(struct e5010_context *ctx)
>> +{
>> +    v4l2_ctrl_new_std(&ctx->ctrl_handler, &e5010_ctrl_ops,
>> +              V4L2_CID_JPEG_COMPRESSION_QUALITY, 1, 100, 1, 75);
>> +}
>> +
>> +static int e5010_ctrls_setup(struct e5010_context *ctx)
>> +{
>> +    int err;
>> +
>> +    v4l2_ctrl_handler_init(&ctx->ctrl_handler, 1);
>> +
>> +    e5010_encode_ctrls(ctx);
>> +
>> +    if (ctx->ctrl_handler.error) {
>> +        err = ctx->ctrl_handler.error;
>> +        v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +
>> +        return err;
>> +    }
>> +
>> +    err = v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
>> +    if (err)
>> +        v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +
>> +    return err;
>> +}
>> +
>> +static void e5010_jpeg_set_default_params(struct e5010_context *ctx)
>> +{
>> +    struct e5010_q_data *queue;
>> +    struct v4l2_format f;
>> +    struct e5010_fmt *fmt;
>> +    struct v4l2_pix_format_mplane *pix_mp = &f.fmt.pix_mp;
>> +    struct v4l2_plane_pix_format *plane_fmt = pix_mp->plane_fmt;
>> +    int i = 0;
>> +
>> +    f.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +    f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
>> +    fmt = find_format(&f);
>> +    queue = &ctx->out_queue;
>> +    queue->fmt = fmt;
>> +    queue->width = DEFAULT_WIDTH;
>> +    queue->height = DEFAULT_HEIGHT;
>> +    v4l2_apply_frmsize_constraints(&pix_mp->width,
>> +                       &pix_mp->height,
>> +                       &fmt->frmsize);
>> +    v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
>> +                pix_mp->width, pix_mp->height);
>> +    for (i = 0; i < fmt->num_planes; i++) {
>> +        queue->bytesperline[i] = plane_fmt[i].bytesperline;
>> +        queue->sizeimage[i] = plane_fmt[i].sizeimage;
>> +    }
>> +    queue->width_adjusted = pix_mp->width;
>> +    queue->height_adjusted = pix_mp->height;
>> +    queue->format_set = false;
>> +    queue->streaming = false;
>> +
>> +    f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +    f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_JPEG;
>> +    fmt = find_format(&f);
>> +    queue = &ctx->cap_queue;
>> +    queue->fmt = fmt;
>> +    queue->width = DEFAULT_WIDTH;
>> +    queue->height = DEFAULT_HEIGHT;
>> +    v4l2_apply_frmsize_constraints(&pix_mp->width,
>> +                       &pix_mp->height,
>> +                       &fmt->frmsize);
>> +    queue->sizeimage[0] = pix_mp->width * pix_mp->height *
>> JPEG_MAX_BYTES_PER_PIXEL;
>> +    queue->sizeimage[0] += HEADER_SIZE;
>> +    queue->sizeimage[1] = 0;
>> +    queue->bytesperline[0] = 0;
>> +    queue->bytesperline[1] = 0;
>> +    queue->format_set = false;
>> +    queue->streaming = false;
>> +    queue->width_adjusted = pix_mp->width;
>> +    queue->height_adjusted = pix_mp->height;
>> +}
>> +
>> +static int e5010_open(struct file *file)
>> +{
>> +    struct e5010_dev *e5010 = video_drvdata(file);
>> +    struct video_device *vdev = video_devdata(file);
>> +    struct e5010_context *ctx;
>> +    int ret = 0;
>> +
>> +    ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +    if (!ctx)
>> +        return -ENOMEM;
>> +
>> +    if (mutex_lock_interruptible(&e5010->mutex)) {
>> +        ret = -ERESTARTSYS;
>> +        goto free;
>> +    }
>> +
>> +    v4l2_fh_init(&ctx->fh, vdev);
>> +    file->private_data = ctx;
>> +    v4l2_fh_add(&ctx->fh);
>> +
>> +    ctx->e5010 = e5010;
>> +    ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(e5010->m2m_dev, ctx, queue_init);
>> +    if (IS_ERR(ctx->fh.m2m_ctx)) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to init m2m ctx\n");
>> +        ret = PTR_ERR(ctx->fh.m2m_ctx);
>> +        goto exit;
>> +    }
>> +
>> +    ret = e5010_ctrls_setup(ctx);
>> +    if (ret) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to setup e5010 jpeg controls\n");
>> +        goto err_ctrls_setup;
>> +    }
>> +    ctx->fh.ctrl_handler = &ctx->ctrl_handler;
>> +
>> +    e5010_jpeg_set_default_params(ctx);
>> +
>> +    dprintk(e5010, 1, "Created instance: 0x%p, m2m_ctx: 0x%p\n", ctx,
>> ctx->fh.m2m_ctx);
>> +
>> +    mutex_unlock(&e5010->mutex);
>> +    return 0;
>> +
>> +err_ctrls_setup:
>> +    v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>> +exit:
>> +    v4l2_fh_del(&ctx->fh);
>> +    v4l2_fh_exit(&ctx->fh);
>> +    mutex_unlock(&e5010->mutex);
>> +free:
>> +    kfree(ctx);
>> +    return ret;
>> +}
>> +
>> +static int e5010_release(struct file *file)
>> +{
>> +    struct e5010_dev *e5010 = video_drvdata(file);
>> +    struct e5010_context *ctx = file->private_data;
>> +
>> +    dprintk(e5010, 1, "Releasing instance: 0x%p, m2m_ctx: 0x%p\n", ctx,
>> ctx->fh.m2m_ctx);
>> +    mutex_lock(&e5010->mutex);
>> +    v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +    v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>> +    v4l2_fh_del(&ctx->fh);
>> +    v4l2_fh_exit(&ctx->fh);
>> +    kfree(ctx);
>> +    mutex_unlock(&e5010->mutex);
>> +
>> +    return 0;
>> +}
>> +
>> +static struct video_device e5010_videodev = {
>> +    .name = E5010_MODULE_NAME,
>> +    .fops = &e5010_fops,
>> +    .ioctl_ops = &e5010_ioctl_ops,
>> +    .minor = -1,
>> +    .release = video_device_release_empty,
>> +    .vfl_dir = VFL_DIR_M2M,
>> +    .device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
>> +};
>> +
>> +static void header_write(struct e5010_context *ctx, u8 *addr, unsigned int
>> *offset,
>> +             unsigned int no_bytes, unsigned long bits)
>> +{
>> +    u8 *w_addr = addr + *offset;
>> +    int i;
>> +
>> +    if ((*offset + no_bytes) > HEADER_SIZE) {
>> +        v4l2_warn(&ctx->e5010->v4l2_dev, "%s: %s: %d: Problem writing
>> header. %d > HEADER_SIZE %d\n",
>> +              __FILE__, __func__, __LINE__, *offset + no_bytes, HEADER_SIZE);
>> +        return;
>> +    }
>> +
>> +    for (i = no_bytes - 1; i >= 0; i--)
>> +        *(w_addr++) = ((u8 *)&bits)[i];
>> +
>> +    *offset += no_bytes;
>> +}
>> +
>> +static void encode_marker_segment(struct e5010_context *ctx, void *addr,
>> unsigned int *offset)
>> +{
>> +    u8 *buffer = (u8 *)addr;
>> +    int i;
>> +
>> +    header_write(ctx, buffer, offset, 2, START_OF_IMAGE);
>> +    header_write(ctx, buffer, offset, 2, DQT_MARKER);
> 
> These markers have already been defined somewhere else (i.e. not in this
> driver). Why not factor that out and reuse?
> 

Agreed, I am thinking to put them in include/media/jpeg.h

> Regards,
> 
> Andrzej
> 
>> +    header_write(ctx, buffer, offset, 3, LQPQ << 4);
>> +    for (i = 0; i < PELS_IN_BLOCK; i++)
>> +        header_write(ctx, buffer, offset, 1, ctx->luma_qp[zigzag[i]]);
>> +
>> +    header_write(ctx, buffer, offset, 2, DQT_MARKER);
>> +    header_write(ctx, buffer, offset, 3, (LQPQ << 4) | 1);
>> +    for (i = 0; i < PELS_IN_BLOCK; i++)
>> +        header_write(ctx, buffer, offset, 1, ctx->chroma_qp[zigzag[i]]);
>> +
>> +    /* Huffman tables */
>> +    header_write(ctx, buffer, offset, 2, DHT_MARKER);
>> +    header_write(ctx, buffer, offset, 2, LH_DC);
>> +    for (i = 0 ; i < (LH_DC - 2); i++)
>> +        header_write(ctx, buffer, offset, 1, marker_luma_dc[i]);
>> +
>> +    header_write(ctx, buffer, offset, 2, DHT_MARKER);
>> +    header_write(ctx, buffer, offset, 2, LH_AC);
>> +    for (i = 0 ; i < (LH_AC - 2); i++)
>> +        header_write(ctx, buffer, offset, 1, marker_luma_ac[i]);
>> +
>> +    header_write(ctx, buffer, offset, 2, DHT_MARKER);
>> +    header_write(ctx, buffer, offset, 2, LH_DC);
>> +    for (i = 0 ; i < (LH_DC - 2); i++)
>> +        header_write(ctx, buffer, offset, 1, marker_chroma_dc[i]);
>> +
>> +    header_write(ctx, buffer, offset, 2, DHT_MARKER);
>> +    header_write(ctx, buffer, offset, 2, LH_AC);
>> +    for (i = 0 ; i < (LH_AC - 2); i++)
>> +        header_write(ctx, buffer, offset, 1, marker_chroma_ac[i]);
>> +}
>> +
>> +static void encode_frame_header(struct e5010_context *ctx, void *addr,
>> unsigned int *offset)
>> +{
>> +    u8 *buffer = (u8 *)addr;
>> +
>> +    header_write(ctx, buffer, offset, 2, SOF_BASELINE_DCT);
>> +    header_write(ctx, buffer, offset, 2, 8 + (3 * UC_NUM_COMP));
>> +    header_write(ctx, buffer, offset, 1, PRECISION);
>> +    header_write(ctx, buffer, offset, 2, ctx->out_queue.height);
>> +    header_write(ctx, buffer, offset, 2, ctx->out_queue.width);
>> +    header_write(ctx, buffer, offset, 1, UC_NUM_COMP);
>> +
>> +    /* Luma details */
>> +    header_write(ctx, buffer, offset, 1, 1);
>> +    if (ctx->out_queue.fmt->subsampling == V4L2_JPEG_CHROMA_SUBSAMPLING_422)
>> +        header_write(ctx, buffer, offset, 1,
>> +                 HORZ_SAMPLING_FACTOR | (VERT_SAMPLING_FACTOR_422));
>> +    else
>> +        header_write(ctx, buffer, offset, 1,
>> +                 HORZ_SAMPLING_FACTOR | (VERT_SAMPLING_FACTOR_420));
>> +    header_write(ctx, buffer, offset, 1, 0);
>> +    /* Chroma details */
>> +    header_write(ctx, buffer, offset, 1, 2);
>> +    header_write(ctx, buffer, offset, 1, (HORZ_SAMPLING_FACTOR >> 1) | 1);
>> +    header_write(ctx, buffer, offset, 1, 1);
>> +    header_write(ctx, buffer, offset, 1, 3);
>> +    header_write(ctx, buffer, offset, 1, (HORZ_SAMPLING_FACTOR >> 1) | 1);
>> +    header_write(ctx, buffer, offset, 1, 1);
>> +
>> +    header_write(ctx, buffer, offset, 1, 0xFF);
>> +}
>> +
>> +static void jpg_encode_sos_header(struct e5010_context *ctx, void *addr,
>> unsigned int *offset)
>> +{
>> +    u8 *buffer = (u8 *)addr;
>> +    int i;
>> +
>> +    header_write(ctx, buffer, offset, 2, START_OF_SCAN);
>> +    header_write(ctx, buffer, offset, 2, 6 + (COMPONENTS_IN_SCAN << 1));
>> +    header_write(ctx, buffer, offset, 1, COMPONENTS_IN_SCAN);
>> +
>> +    for (i = 0; i < COMPONENTS_IN_SCAN; i++) {
>> +        header_write(ctx, buffer, offset, 1, i + 1);
>> +        if (i == 0)
>> +            header_write(ctx, buffer, offset, 1, 0);
>> +        else
>> +            header_write(ctx, buffer, offset, 1, 17);
>> +    }
>> +
>> +    header_write(ctx, buffer, offset, 1, 0);
>> +    header_write(ctx, buffer, offset, 1, 63);
>> +    header_write(ctx, buffer, offset, 1, 0);
>> +}
>> +
>> +static void write_header(struct e5010_context *ctx, void *addr)
>> +{
>> +    unsigned int offset = 0;
>> +
>> +    encode_marker_segment(ctx, addr, &offset);
>> +    encode_frame_header(ctx, addr, &offset);
>> +    jpg_encode_sos_header(ctx, addr, &offset);
>> +}
>> +
>> +static irqreturn_t e5010_irq(int irq, void *data)
>> +{
>> +    struct e5010_dev *e5010 = data;
>> +    struct e5010_context *ctx;
>> +    int output_size;
>> +    struct vb2_v4l2_buffer *src_buf, *dst_buf;
>> +    bool pic_done, out_addr_err;
>> +
>> +    spin_lock(&e5010->hw_lock);
>> +    pic_done = e5010_hw_pic_done_irq(e5010->core_base);
>> +    out_addr_err = e5010_hw_output_address_irq(e5010->core_base);
>> +
>> +    if (!pic_done && !out_addr_err) {
>> +        spin_unlock(&e5010->hw_lock);
>> +        return IRQ_NONE;
>> +    }
>> +
>> +    ctx = v4l2_m2m_get_curr_priv(e5010->m2m_dev);
>> +    if (WARN_ON(!ctx))
>> +        goto job_unlock;
>> +
>> +    dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>> +    src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>> +    if (!dst_buf || !src_buf) {
>> +        v4l2_err(&e5010->v4l2_dev, "ctx: 0x%p No source or destination
>> buffer\n", ctx);
>> +        goto job_unlock;
>> +    }
>> +
>> +    if (out_addr_err) {
>> +        e5010_hw_clear_output_error(e5010->core_base, 1);
>> +        v4l2_warn(&e5010->v4l2_dev,
>> +              "ctx: 0x%p Output bitstream size exceeded max size\n", ctx);
>> +        v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>> +        vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
>> dst_buf->planes[0].length);
>> +        v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>> +        if (v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx, src_buf)) {
>> +            dst_buf->flags |= V4L2_BUF_FLAG_LAST;
>> +            v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
>> +            v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>> +            dprintk(e5010, 2, "ctx: 0x%p Sending EOS\n", ctx);
>> +        }
>> +    }
>> +
>> +    if (pic_done) {
>> +        e5010_hw_clear_picture_done(e5010->core_base, 1);
>> +        dprintk(e5010, 3, "ctx: 0x%p Got output bitstream of size %d bytes\n",
>> +            ctx, readl(e5010->core_base + JASPER_OUTPUT_SIZE_OFFSET));
>> +
>> +        if (v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx, src_buf)) {
>> +            dst_buf->flags |= V4L2_BUF_FLAG_LAST;
>> +            v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
>> +            v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>> +            dprintk(e5010, 2, "ctx: 0x%p Sending EOS\n", ctx);
>> +        }
>> +        v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
>> +        output_size = e5010_hw_get_output_size(e5010->core_base);
>> +        vb2_set_plane_payload(&dst_buf->vb2_buf, 0, output_size +
>> HEADER_SIZE);
>> +        v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
>> +        dprintk(e5010, 3,
>> +            "ctx: 0x%p frame done for dst_buf->sequence: %d
>> src_buf->sequence: %d\n",
>> +            ctx, dst_buf->sequence, src_buf->sequence);
>> +    }
>> +
>> +    v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>> +    dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
>> +
>> +job_unlock:
>> +    spin_unlock(&e5010->hw_lock);
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static int e5010_init_device(struct e5010_dev *e5010)
>> +{
>> +    int ret = 0;
>> +
>> +    /*TODO: Set MMU in bypass mode until support for the same is added in
>> driver*/
>> +    e5010_hw_bypass_mmu(e5010->mmu_base, 1);
>> +
>> +    if (e5010_hw_enable_auto_clock_gating(e5010->core_base, 1))
>> +        v4l2_warn(&e5010->v4l2_dev, "failed to enable auto clock gating\n");
>> +
>> +    if (e5010_hw_enable_manual_clock_gating(e5010->core_base, 0))
>> +        v4l2_warn(&e5010->v4l2_dev, "failed to disable manual clock
>> gating\n");
>> +
>> +    if (e5010_hw_enable_crc_check(e5010->core_base, 0))
>> +        v4l2_warn(&e5010->v4l2_dev, "failed to disable CRC check\n");
>> +
>> +    if (e5010_hw_enable_output_address_error_irq(e5010->core_base, 1))
>> +        v4l2_err(&e5010->v4l2_dev, "failed to enable Output Address Error
>> interrupts\n");
>> +
>> +    ret = e5010_hw_set_input_source_to_memory(e5010->core_base, 1);
>> +    if (ret) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set input source to memory\n");
>> +        return ret;
>> +    }
>> +
>> +    ret = e5010_hw_enable_picture_done_irq(e5010->core_base, 1);
>> +    if (ret)
>> +        v4l2_err(&e5010->v4l2_dev, "failed to enable Picture Done
>> interrupts\n");
>> +
>> +    return ret;
>> +}
>> +
>> +static int e5010_probe(struct platform_device *pdev)
>> +{
>> +    struct e5010_dev *e5010;
>> +    int irq, ret = 0;
>> +
>> +    ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
>> +    if (ret)
>> +        return dev_err_probe(e5010->dev, ret, "32-bit consistent DMA enable
>> failed\n");
>> +
>> +    e5010 = devm_kzalloc(&pdev->dev, sizeof(*e5010), GFP_KERNEL);
>> +    if (!e5010)
>> +        return -ENOMEM;
>> +
>> +    platform_set_drvdata(pdev, e5010);
>> +
>> +    e5010->dev = &pdev->dev;
>> +
>> +    mutex_init(&e5010->mutex);
>> +    spin_lock_init(&e5010->hw_lock);
>> +
>> +    e5010->vdev = &e5010_videodev;
>> +    e5010->vdev->v4l2_dev = &e5010->v4l2_dev;
>> +    e5010->vdev->lock = &e5010->mutex;
>> +    e5010->vdev->queue = NULL;
>> +    e5010->vdev->prio = NULL;
>> +    e5010->vdev->dev_parent = NULL;
>> +    e5010->vdev->minor = -1;
>> +
>> +    ret = v4l2_device_register(&pdev->dev, &e5010->v4l2_dev);
>> +    if (ret)
>> +        return dev_err_probe(e5010->dev, ret, "failed to register v4l2
>> device\n");
>> +
>> +    e5010->m2m_dev = v4l2_m2m_init(&e5010_m2m_ops);
>> +    if (IS_ERR(e5010->m2m_dev)) {
>> +        ret = PTR_ERR(e5010->m2m_dev);
>> +        e5010->m2m_dev = NULL;
>> +        dev_err_probe(e5010->dev, ret, "failed to init mem2mem device\n");
>> +        goto fail_after_v4l2_register;
>> +    }
>> +
>> +    video_set_drvdata(e5010->vdev, e5010);
>> +
>> +    ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
>> +    if (ret) {
>> +        dev_err_probe(e5010->dev, ret, "failed to register video device\n");
>> +        goto fail_after_v4l2_register;
>> +    }
>> +
>> +    v4l2_info(&e5010->v4l2_dev, "Device registered as /dev/video%d\n",
>> +          e5010->vdev->num);
>> +
>> +    e5010->core_base = devm_platform_ioremap_resource_byname(pdev, "core");
>> +    if (IS_ERR(e5010->core_base)) {
>> +        ret = PTR_ERR(e5010->core_base);
>> +        dev_err_probe(e5010->dev, ret, "Missing 'core' resources area\n");
>> +        goto fail_after_video_register_device;
>> +    }
>> +
>> +    e5010->mmu_base = devm_platform_ioremap_resource_byname(pdev, "mmu");
>> +    if (IS_ERR(e5010->mmu_base)) {
>> +        ret = PTR_ERR(e5010->mmu_base);
>> +        dev_err_probe(e5010->dev, ret, "Missing 'mmu' resources area\n");
>> +        goto fail_after_video_register_device;
>> +    }
>> +
>> +    e5010->last_context_run = NULL;
>> +
>> +    irq = platform_get_irq(pdev, 0);
>> +    ret = devm_request_irq(e5010->dev, irq, e5010_irq, 0,
>> +                   E5010_MODULE_NAME, e5010);
>> +    if (ret) {
>> +        dev_err_probe(e5010->dev, ret, "failed to register IRQ %d\n", irq);
>> +        goto fail_after_video_register_device;
>> +    }
>> +
>> +    e5010->clk = devm_clk_get(&pdev->dev, "core_clk");
>> +    if (IS_ERR(e5010->clk)) {
>> +        ret = PTR_ERR(e5010->clk);
>> +        dev_err_probe(e5010->dev, ret, "failed to get clock\n");
>> +        goto fail_after_video_register_device;
>> +    }
>> +
>> +    pm_runtime_enable(e5010->dev);
>> +
>> +    return 0;
>> +
>> +fail_after_video_register_device:
>> +    v4l2_m2m_release(e5010->m2m_dev);
>> +fail_after_v4l2_register:
>> +    v4l2_device_unregister(&e5010->v4l2_dev);
>> +    return ret;
>> +}
>> +
>> +static int e5010_remove(struct platform_device *pdev)
>> +{
>> +    struct e5010_dev *e5010 = platform_get_drvdata(pdev);
>> +
>> +    pm_runtime_disable(e5010->dev);
>> +    video_unregister_device(e5010->vdev);
>> +    v4l2_m2m_release(e5010->m2m_dev);
>> +    v4l2_device_unregister(&e5010->v4l2_dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>> unsigned int *nplanes,
>> +                 unsigned int sizes[], struct device *alloc_devs[])
>> +{
>> +    struct e5010_context *ctx = vb2_get_drv_priv(vq);
>> +    struct e5010_q_data *queue;
>> +    int i;
>> +
>> +    if (!V4L2_TYPE_IS_MULTIPLANAR(vq->type)) {
>> +        v4l2_err(&ctx->e5010->v4l2_dev, "queue setup with Invalid type:
>> %d\n", vq->type);
>> +        return -EINVAL;
>> +    }
>> +
>> +    queue = get_queue(ctx, vq->type);
>> +    if (IS_ERR(queue))
>> +        return PTR_ERR(queue);
>> +
>> +    if (*nplanes) {
>> +        if (*nplanes != queue->fmt->num_planes)
>> +            return -EINVAL;
>> +        for (i = 0; i < *nplanes; i++) {
>> +            if (sizes[i] < queue->sizeimage[i])
>> +                return -EINVAL;
>> +        }
>> +        return 0;
>> +    }
>> +
>> +    *nbuffers = max_t(unsigned int, *nbuffers, 1);
>> +    *nplanes = queue->fmt->num_planes;
>> +    for (i = 0; i < *nplanes; i++)
>> +        sizes[i] = queue->sizeimage[i];
>> +
>> +    dprintk(ctx->e5010, 2,
>> +        "ctx: 0x%p, type %s, buffer(s): %d, planes %d, plane1: bytes %d
>> plane2: %d bytes\n",
>> +        ctx, type_name(vq->type), *nbuffers, *nplanes, sizes[0], sizes[1]);
>> +
>> +    return 0;
>> +}
>> +
>> +static void e5010_buf_finish(struct vb2_buffer *vb)
>> +{
>> +    struct e5010_context *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +    void *d_addr;
>> +
>> +    if (vb->state != VB2_BUF_STATE_DONE ||
>> V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
>> +        return;
>> +
>> +    d_addr = vb2_plane_vaddr(vb, 0);
>> +    write_header(ctx, d_addr);
>> +}
>> +
>> +static int e5010_buf_out_validate(struct vb2_buffer *vb)
>> +{
>> +    struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +    struct e5010_context *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +
>> +    if (vbuf->field != V4L2_FIELD_NONE)
>> +        dprintk(ctx->e5010, 1, "ctx: 0x%p, field isn't supported\n", ctx);
>> +
>> +    vbuf->field = V4L2_FIELD_NONE;
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_buf_prepare(struct vb2_buffer *vb)
>> +{
>> +    struct e5010_context *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +    struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +    struct e5010_q_data *queue;
>> +    int i;
>> +
>> +    vbuf->field = V4L2_FIELD_NONE;
>> +
>> +    queue = get_queue(ctx, vb->vb2_queue->type);
>> +    if (IS_ERR(queue))
>> +        return PTR_ERR(queue);
>> +
>> +    for (i = 0; i < queue->fmt->num_planes; i++) {
>> +        if (vb2_plane_size(vb, i) < (unsigned long)queue->sizeimage[i]) {
>> +            v4l2_err(&ctx->e5010->v4l2_dev, "plane %d too small (%lu <
>> %lu)", i,
>> +                 vb2_plane_size(vb, i), (unsigned long)queue->sizeimage[i]);
>> +
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>> +    if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
>> +        vb2_set_plane_payload(vb, 0, 0);
>> +        vb2_set_plane_payload(vb, 1, 0);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void e5010_buf_queue(struct vb2_buffer *vb)
>> +{
>> +    struct e5010_context *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +    struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +
>> +    if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
>> +        vb2_is_streaming(vb->vb2_queue) &&
>> +        v4l2_m2m_dst_buf_is_last(ctx->fh.m2m_ctx)) {
>> +        struct e5010_q_data *queue = get_queue(ctx,
>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +
>> +        if (IS_ERR(queue))
>> +            return;
>> +
>> +        vbuf->sequence = queue->sequence++;
>> +        v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vbuf);
>> +        v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>> +        return;
>> +    }
>> +
>> +    v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
>> +}
>> +
>> +static int e5010_encoder_cmd(struct file *file, void *priv,
>> +                 struct v4l2_encoder_cmd *cmd)
>> +{
>> +    struct e5010_context *ctx = file->private_data;
>> +    int ret;
>> +    struct vb2_queue *cap_vq;
>> +
>> +    cap_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +
>> +    ret = v4l2_m2m_ioctl_try_encoder_cmd(file, &ctx->fh, cmd);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)) ||
>> +        !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)))
>> +        return 0;
>> +
>> +    ret = v4l2_m2m_ioctl_encoder_cmd(file, &ctx->fh, cmd);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (cmd->cmd == V4L2_ENC_CMD_STOP &&
>> +        v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
>> +        v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>> +
>> +    if (cmd->cmd == V4L2_ENC_CMD_START &&
>> +        v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
>> +        vb2_clear_last_buffer_dequeued(cap_vq);
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +    struct e5010_context *ctx = vb2_get_drv_priv(q);
>> +    int ret;
>> +
>> +    struct e5010_q_data *queue = get_queue(ctx, q->type);
>> +
>> +    if (IS_ERR(queue))
>> +        return PTR_ERR(queue);
>> +    queue->streaming = true;
>> +    v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
>> +    queue->sequence = 0;
>> +
>> +    ret = pm_runtime_resume_and_get(ctx->e5010->dev);
>> +    if (ret < 0) {
>> +        v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
>> +        return ret;
>> +    }
>> +
>> +    ret = e5010_init_device(ctx->e5010);
>> +    if (ret)
>> +        v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
>> +
>> +    return ret;
>> +}
>> +
>> +static void e5010_stop_streaming(struct vb2_queue *q)
>> +{
>> +    struct e5010_context *ctx = vb2_get_drv_priv(q);
>> +    struct vb2_v4l2_buffer *vbuf;
>> +    struct e5010_q_data *queue;
>> +
>> +    queue = get_queue(ctx, q->type);
>> +    if (IS_ERR(queue))
>> +        return;
>> +
>> +    queue->streaming = false;
>> +
>> +    if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>> +        while ((vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx))) {
>> +            dprintk(ctx->e5010, 2, "ctx: 0x%p, buf type %s | index %d\n",
>> +                ctx, type_name(vbuf->vb2_buf.type), vbuf->vb2_buf.index);
>> +            v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>> +        }
>> +    } else {
>> +        while ((vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
>> +            dprintk(ctx->e5010, 2, "ctx: 0x%p, buf type %s | index %d\n",
>> +                ctx, type_name(vbuf->vb2_buf.type), vbuf->vb2_buf.index);
>> +            vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
>> +            v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>> +        }
>> +    }
>> +
>> +    if (V4L2_TYPE_IS_OUTPUT(q->type))
>> +        v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, q);
>> +
>> +    if (V4L2_TYPE_IS_OUTPUT(q->type) &&
>> +        v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
>> +        v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>> +    }
>> +
>> +    pm_runtime_put_sync(ctx->e5010->dev);
>> +}
>> +
>> +static void e5010_device_run(void *priv)
>> +{
>> +    struct e5010_context *ctx = priv;
>> +    struct e5010_dev *e5010 = ctx->e5010;
>> +    struct vb2_v4l2_buffer *s_vb, *d_vb;
>> +    u32 reg = 0;
>> +    int ret = 0;
>> +    unsigned long flags;
>> +    int num_planes = ctx->out_queue.fmt->num_planes;
>> +
>> +    spin_lock_irqsave(&e5010->hw_lock, flags);
>> +    s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>> +    WARN_ON(!s_vb);
>> +    d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>> +    WARN_ON(!d_vb);
>> +    if (!s_vb || !d_vb)
>> +        goto no_ready_buf_err;
>> +
>> +    s_vb->sequence = ctx->out_queue.sequence++;
>> +    d_vb->sequence = ctx->cap_queue.sequence++;
>> +
>> +    v4l2_m2m_buf_copy_metadata(s_vb, d_vb, false);
>> +
>> +    if (ctx != e5010->last_context_run || ctx->update_qp) {
>> +        dprintk(e5010, 1, "ctx updated: 0x%p -> 0x%p, updating qp tables\n",
>> +            e5010->last_context_run, ctx);
>> +        ret = update_qp_tables(ctx);
>> +    }
>> +
>> +    if (ret) {
>> +        ctx->update_qp = true;
>> +        v4l2_err(&e5010->v4l2_dev, "failed to update QP tables\n");
>> +        goto device_busy_err;
>> +    } else {
>> +        e5010->last_context_run = ctx;
>> +        ctx->update_qp = false;
>> +    }
>> +
>> +    /* Set I/O Buffer addresses */
>> +    reg = (u32)vb2_dma_contig_plane_dma_addr(&s_vb->vb2_buf, 0);
>> +    ret = e5010_hw_set_input_luma_addr(e5010->core_base, reg);
>> +    if (ret || !reg) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set input luma address\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    if (num_planes == 1)
>> +        reg += (ctx->out_queue.bytesperline[0]) * (ctx->out_queue.height);
>> +    else
>> +        reg = (u32)vb2_dma_contig_plane_dma_addr(&s_vb->vb2_buf, 1);
>> +
>> +    dprintk(e5010, 3,
>> +        "ctx: 0x%p, luma_addr: 0x%x, chroma_addr: 0x%x, out_addr: 0x%x\n",
>> +        ctx, (u32)vb2_dma_contig_plane_dma_addr(&s_vb->vb2_buf, 0), reg,
>> +        (u32)vb2_dma_contig_plane_dma_addr(&d_vb->vb2_buf, 0));
>> +
>> +    dprintk(e5010, 3,
>> +        "ctx: 0x%p, buf indices: src_index: %d, dst_index: %d\n",
>> +        ctx, s_vb->vb2_buf.index, d_vb->vb2_buf.index);
>> +
>> +    ret = e5010_hw_set_input_chroma_addr(e5010->core_base, reg);
>> +    if (ret || !reg) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set input chroma address\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    reg = (u32)vb2_dma_contig_plane_dma_addr(&d_vb->vb2_buf, 0);
>> +    reg += HEADER_SIZE;
>> +    ret = e5010_hw_set_output_base_addr(e5010->core_base, reg);
>> +    if (ret || !reg) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set output size\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    /* Set input settings */
>> +    ret = e5010_hw_set_horizontal_size(e5010->core_base,
>> ctx->out_queue.width - 1);
>> +    if (ret) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set input width\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    ret = e5010_hw_set_vertical_size(e5010->core_base,
>> ctx->out_queue.height - 1);
>> +    if (ret) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set input width\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    ret = e5010_hw_set_luma_stride(e5010->core_base,
>> ctx->out_queue.bytesperline[0]);
>> +    if (ret) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set luma stride\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    ret = e5010_hw_set_chroma_stride(e5010->core_base,
>> ctx->out_queue.bytesperline[0]);
>> +    if (ret) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set chroma stride\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    ret = e5010_set_input_subsampling(e5010->core_base,
>> ctx->out_queue.fmt->subsampling);
>> +    if (ret) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set input subsampling\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    ret = e5010_hw_set_chroma_order(e5010->core_base,
>> ctx->out_queue.fmt->chroma_order);
>> +    if (ret) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to set chroma order\n");
>> +        goto device_busy_err;
>> +    }
>> +
>> +    e5010_hw_set_output_max_size(e5010->core_base, d_vb->planes[0].length);
>> +    e5010_hw_encode_start(e5010->core_base, 1);
>> +
>> +    spin_unlock_irqrestore(&e5010->hw_lock, flags);
>> +
>> +    return;
>> +
>> +device_busy_err:
>> +    e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
>> +
>> +no_ready_buf_err:
>> +    if (s_vb) {
>> +        v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
>> +        v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
>> +    }
>> +
>> +    if (d_vb) {
>> +        v4l2_m2m_dst_buf_remove_by_buf(ctx->fh.m2m_ctx, d_vb);
>> +        /* Payload set to 1 since 0 payload can trigger EOS */
>> +        vb2_set_plane_payload(&d_vb->vb2_buf, 0, 1);
>> +        v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
>> +    }
>> +    v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>> +    spin_unlock_irqrestore(&e5010->hw_lock, flags);
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int e5010_runtime_resume(struct device *dev)
>> +{
>> +    struct e5010_dev *e5010 = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    ret = clk_prepare_enable(e5010->clk);
>> +    if (ret < 0) {
>> +        v4l2_err(&e5010->v4l2_dev, "failed to enable clock\n");
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int e5010_runtime_suspend(struct device *dev)
>> +{
>> +    struct e5010_dev *e5010 = dev_get_drvdata(dev);
>> +
>> +    clk_disable_unprepare(e5010->clk);
>> +
>> +    return 0;
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int e5010_suspend(struct device *dev)
>> +{
>> +    struct e5010_dev *e5010 = dev_get_drvdata(dev);
>> +
>> +    v4l2_m2m_suspend(e5010->m2m_dev);
>> +
>> +    return pm_runtime_force_suspend(dev);
>> +}
>> +
>> +static int e5010_resume(struct device *dev)
>> +{
>> +    struct e5010_dev *e5010 = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    ret = pm_runtime_force_resume(dev);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    v4l2_m2m_resume(e5010->m2m_dev);
>> +
>> +    return ret;
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops    e5010_pm_ops = {
>> +    SET_RUNTIME_PM_OPS(e5010_runtime_suspend,
>> +               e5010_runtime_resume, NULL)
>> +    SET_SYSTEM_SLEEP_PM_OPS(e5010_suspend, e5010_resume)
>> +};
>> +
>> +static const struct v4l2_ioctl_ops e5010_ioctl_ops = {
>> +    .vidioc_querycap = e5010_querycap,
>> +
>> +    .vidioc_enum_fmt_vid_cap = e5010_enum_fmt,
>> +    .vidioc_g_fmt_vid_cap_mplane = e5010_g_fmt,
>> +    .vidioc_try_fmt_vid_cap_mplane = e5010_try_fmt,
>> +    .vidioc_s_fmt_vid_cap_mplane = e5010_s_fmt,
>> +
>> +    .vidioc_enum_fmt_vid_out = e5010_enum_fmt,
>> +    .vidioc_g_fmt_vid_out_mplane = e5010_g_fmt,
>> +    .vidioc_try_fmt_vid_out_mplane = e5010_try_fmt,
>> +    .vidioc_s_fmt_vid_out_mplane = e5010_s_fmt,
>> +
>> +    .vidioc_g_selection = e5010_g_selection,
>> +    .vidioc_s_selection = e5010_s_selection,
>> +
>> +    .vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
>> +    .vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
>> +    .vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
>> +    .vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
>> +    .vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
>> +    .vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
>> +    .vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
>> +
>> +    .vidioc_streamon = v4l2_m2m_ioctl_streamon,
>> +    .vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
>> +    .vidioc_log_status = v4l2_ctrl_log_status,
>> +
>> +    .vidioc_subscribe_event = e5010_subscribe_event,
>> +    .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +    .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
>> +    .vidioc_encoder_cmd = e5010_encoder_cmd,
>> +
>> +    .vidioc_enum_framesizes = e5010_enum_framesizes,
>> +};
>> +
>> +static const struct vb2_ops e5010_video_ops = {
>> +    .queue_setup = e5010_queue_setup,
>> +    .buf_queue = e5010_buf_queue,
>> +    .buf_finish = e5010_buf_finish,
>> +    .buf_prepare = e5010_buf_prepare,
>> +    .buf_out_validate = e5010_buf_out_validate,
>> +    .wait_prepare = vb2_ops_wait_prepare,
>> +    .wait_finish = vb2_ops_wait_finish,
>> +    .start_streaming = e5010_start_streaming,
>> +    .stop_streaming = e5010_stop_streaming,
>> +};
>> +
>> +static const struct v4l2_file_operations e5010_fops = {
>> +    .owner = THIS_MODULE,
>> +    .open = e5010_open,
>> +    .release = e5010_release,
>> +    .poll = v4l2_m2m_fop_poll,
>> +    .unlocked_ioctl = video_ioctl2,
>> +    .mmap = v4l2_m2m_fop_mmap,
>> +};
>> +
>> +static const struct v4l2_m2m_ops e5010_m2m_ops = {
>> +    .device_run = e5010_device_run,
>> +};
>> +
>> +static const struct of_device_id e5010_of_match[] = {
>> +    {.compatible = "img,e5010-jpeg-enc"},   { /* end */},
>> +};
>> +MODULE_DEVICE_TABLE(of, e5010_of_match);
>> +
>> +static struct platform_driver e5010_driver = {
>> +    .probe = e5010_probe,
>> +    .remove = e5010_remove,
>> +    .driver = {
>> +        .name = E5010_MODULE_NAME,
>> +        .of_match_table = e5010_of_match,
>> +        .pm = &e5010_pm_ops,
>> +    },
>> +};
>> +module_platform_driver(e5010_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Imagination E5010 JPEG encoder driver");
>> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h
>> b/drivers/media/platform/imagination/e5010-jpeg-enc.h
>> new file mode 100644
>> index 000000000000..3a47b0327101
>> --- /dev/null
>> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
>> @@ -0,0 +1,169 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Imagination E5010 JPEG Encoder driver.
>> + *
>> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
>> + *
>> + * Author: David Huang <d-huang@ti.com>
>> + * Author: Devarsh Thakkar <devarsht@ti.com>
>> + */
>> +
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fh.h>
>> +
>> +#ifndef _E5010_JPEG_ENC_H
>> +#define _E5010_JPEG_ENC_H
>> +
>> +#define MAX_PLANES            2
>> +#define HEADER_SIZE            0x025E
>> +#define MIN_DIMENSION            64
>> +#define MAX_DIMENSION            8192
>> +#define DEFAULT_WIDTH            640
>> +#define DEFAULT_HEIGHT            480
>> +#define E5010_MODULE_NAME        "e5010"
>> +#define JPEG_MAX_BYTES_PER_PIXEL    2
>> +
>> +/* JPEG marker definitions */
>> +#define START_OF_IMAGE            0xFFD8
>> +#define SOF_BASELINE_DCT        0xFFC0
>> +#define END_OF_IMAGE            0xFFD9
>> +#define START_OF_SCAN            0xFFDA
>> +
>> +/* Definitions for the huffman table specification in the Marker segment */
>> +#define DHT_MARKER            0xFFC4
>> +#define LH_DC                0x001F
>> +#define LH_AC                0x00B5
>> +
>> +/* Definitions for the quantization table specification in the Marker
>> segment */
>> +#define DQT_MARKER            0xFFDB
>> +#define ACMAX                0x03FF
>> +#define DCMAX                0x07FF
>> +
>> +/* Length and precision of the quantization table parameters */
>> +#define LQPQ                0x00430
>> +#define QMAX                255
>> +
>> +/* Misc JPEG header definitions */
>> +#define UC_NUM_COMP            3
>> +#define PRECISION            8
>> +#define HORZ_SAMPLING_FACTOR        (2 << 4)
>> +#define VERT_SAMPLING_FACTOR_422    1
>> +#define VERT_SAMPLING_FACTOR_420    2
>> +#define COMPONENTS_IN_SCAN        3
>> +#define PELS_IN_BLOCK            64
>> +
>> +/* Used for Qp table generation */
>> +#define LUMINOSITY            10
>> +#define CONTRAST            1
>> +#define INCREASE            2
>> +#define QP_TABLE_SIZE            (8 * 8)
>> +#define QP_TABLE_FIELD_OFFSET        0x04
>> +
>> +/*
>> + * vb2 queue structure
>> + * contains queue data information
>> + *
>> + * @fmt: format info
>> + * @width: frame width
>> + * @height: frame height
>> + * @bytesperline: bytes per line in memory
>> + * @size_image: image size in memory
>> + */
>> +struct e5010_q_data {
>> +    struct e5010_fmt    *fmt;
>> +    u32            width;
>> +    u32            height;
>> +    u32            width_adjusted;
>> +    u32            height_adjusted;
>> +    u32            sizeimage[MAX_PLANES];
>> +    u32            bytesperline[MAX_PLANES];
>> +    bool            format_set;
>> +    bool            streaming;
>> +    u32            sequence;
>> +    struct v4l2_rect    crop;
>> +};
>> +
>> +/*
>> + * Driver device structure
>> + * Holds all memory handles and global parameters
>> + * Shared by all instances
>> + */
>> +struct e5010_dev {
>> +    struct device *dev;
>> +    struct v4l2_device    v4l2_dev;
>> +    struct v4l2_m2m_dev    *m2m_dev;
>> +    struct video_device    *vdev;
>> +    void __iomem        *core_base;
>> +    void __iomem        *mmu_base;
>> +    struct clk        *clk;
>> +    struct e5010_context    *last_context_run;
>> +    /* Protect access to device data */
>> +    struct mutex        mutex;
>> +    /* Protect access to hardware*/
>> +    spinlock_t        hw_lock;
>> +};
>> +
>> +/*
>> + * Driver context structure
>> + * One of these exists for every m2m context
>> + * Holds context specific data
>> + */
>> +struct e5010_context {
>> +    struct v4l2_fh            fh;
>> +    struct e5010_dev        *e5010;
>> +    struct e5010_q_data        out_queue;
>> +    struct e5010_q_data        cap_queue;
>> +    int                quality;
>> +    bool                update_qp;
>> +    struct v4l2_ctrl_handler    ctrl_handler;
>> +    u8                luma_qp[QP_TABLE_SIZE];
>> +    u8                chroma_qp[QP_TABLE_SIZE];
>> +};
>> +
>> +/*
>> + * Buffer structure
>> + * Contains info for all buffers
>> + */
>> +struct e5010_buffer {
>> +    struct v4l2_m2m_buffer buffer;
>> +};
>> +
>> +enum {
>> +    CHROMA_ORDER_CB_CR = 0, //UV ordering
>> +    CHROMA_ORDER_CR_CB = 1, //VU ordering
>> +};
>> +
>> +enum {
>> +    SUBSAMPLING_420 = 1,
>> +    SUBSAMPLING_422 = 2,
>> +};
>> +
>> +/*
>> + * e5010 format structure
>> + * contains format information
>> + */
>> +struct e5010_fmt {
>> +    u32                    fourcc;
>> +    unsigned int                num_planes;
>> +    unsigned int                type;
>> +    u32                    subsampling;
>> +    u32                    chroma_order;
>> +    const struct v4l2_frmsize_stepwise    frmsize;
>> +};
>> +
>> +/*
>> + * struct e5010_ctrl - contains info for each supported v4l2 control
>> + */
>> +struct e5010_ctrl {
>> +    unsigned int        cid;
>> +    enum v4l2_ctrl_type    type;
>> +    unsigned char        name[32];
>> +    int            minimum;
>> +    int            maximum;
>> +    int            step;
>> +    int            default_value;
>> +    unsigned char        compound;
>> +};
>> +
>> +#endif
>> diff --git a/drivers/media/platform/imagination/e5010-mmu-regs.h
>> b/drivers/media/platform/imagination/e5010-mmu-regs.h
>> new file mode 100644
>> index 000000000000..bfba06956cf2
>> --- /dev/null
>> +++ b/drivers/media/platform/imagination/e5010-mmu-regs.h
>> @@ -0,0 +1,311 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Imagination E5010 JPEG Encoder driver.
>> + *
>> + * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
>> + *
>> + * Author: David Huang <d-huang@ti.com>
>> + * Author: Devarsh Thakkar <devarsht@ti.com>
>> + */
>> +
>> +#ifndef _E5010_MMU_REGS_H
>> +#define _E5010_MMU_REGS_H
>> +
>> +#define MMU_MMU_DIR_BASE_ADDR_OFFSET                    (0x0020)
>> +#define MMU_MMU_DIR_BASE_ADDR_STRIDE                    (4)
>> +#define MMU_MMU_DIR_BASE_ADDR_NO_ENTRIES                (4)
>> +
>> +#define MMU_MMU_DIR_BASE_ADDR_MMU_DIR_BASE_ADDR_MASK            (0xFFFFFFFF)
>> +#define MMU_MMU_DIR_BASE_ADDR_MMU_DIR_BASE_ADDR_SHIFT            (0)
>> +
>> +#define MMU_MMU_TILE_CFG_OFFSET                        (0x0040)
>> +#define MMU_MMU_TILE_CFG_STRIDE                        (4)
>> +#define MMU_MMU_TILE_CFG_NO_ENTRIES                    (4)
>> +
>> +#define MMU_MMU_TILE_CFG_TILE_128INTERLEAVE_MASK            (0x00000010)
>> +#define MMU_MMU_TILE_CFG_TILE_128INTERLEAVE_SHIFT            (4)
>> +
>> +#define MMU_MMU_TILE_CFG_TILE_ENABLE_MASK                (0x00000008)
>> +#define MMU_MMU_TILE_CFG_TILE_ENABLE_SHIFT                (3)
>> +
>> +#define MMU_MMU_TILE_CFG_TILE_STRIDE_MASK                (0x00000007)
>> +#define MMU_MMU_TILE_CFG_TILE_STRIDE_SHIFT                (0)
>> +
>> +#define MMU_MMU_TILE_MIN_ADDR_OFFSET                    (0x0050)
>> +#define MMU_MMU_TILE_MIN_ADDR_STRIDE                    (4)
>> +#define MMU_MMU_TILE_MIN_ADDR_NO_ENTRIES                (4)
>> +
>> +#define MMU_MMU_TILE_MIN_ADDR_TILE_MIN_ADDR_MASK            (0xFFFFFFFF)
>> +#define MMU_MMU_TILE_MIN_ADDR_TILE_MIN_ADDR_SHIFT            (0)
>> +
>> +#define MMU_MMU_TILE_MAX_ADDR_OFFSET                    (0x0060)
>> +#define MMU_MMU_TILE_MAX_ADDR_STRIDE                    (4)
>> +#define MMU_MMU_TILE_MAX_ADDR_NO_ENTRIES                (4)
>> +
>> +#define MMU_MMU_TILE_MAX_ADDR_TILE_MAX_ADDR_MASK            (0xFFFFFFFF)
>> +#define MMU_MMU_TILE_MAX_ADDR_TILE_MAX_ADDR_SHIFT            (0)
>> +
>> +#define MMU_MMU_CONTROL0_OFFSET                        (0x0000)
>> +
>> +#define MMU_MMU_CONTROL0_MMU_TILING_SCHEME_MASK                (0x00000001)
>> +#define MMU_MMU_CONTROL0_MMU_TILING_SCHEME_SHIFT            (0)
>> +
>> +#define MMU_MMU_CONTROL0_MMU_CACHE_POLICY_MASK                (0x00000100)
>> +#define MMU_MMU_CONTROL0_MMU_CACHE_POLICY_SHIFT                (8)
>> +
>> +#define MMU_MMU_CONTROL0_FORCE_CACHE_POLICY_BYPASS_MASK           
>> (0x00000200)
>> +#define MMU_MMU_CONTROL0_FORCE_CACHE_POLICY_BYPASS_SHIFT        (9)
>> +
>> +#define MMU_MMU_CONTROL0_STALL_ON_PROTOCOL_FAULT_MASK            (0x00001000)
>> +#define MMU_MMU_CONTROL0_STALL_ON_PROTOCOL_FAULT_SHIFT            (12)
>> +
>> +#define MMU_MMU_CONTROL1_OFFSET                        (0x0008)
>> +
>> +#define MMU_MMU_CONTROL1_MMU_FLUSH_MASK                    (0x00000008)
>> +#define MMU_MMU_CONTROL1_MMU_FLUSH_SHIFT                (3)
>> +#define MMU_MMU_CONTROL1_MMU_FLUSH_NO_REPS                (4)
>> +#define MMU_MMU_CONTROL1_MMU_FLUSH_SIZE                    (1)
>> +
>> +#define MMU_MMU_CONTROL1_MMU_INVALDC_MASK                (0x00000800)
>> +#define MMU_MMU_CONTROL1_MMU_INVALDC_SHIFT                (11)
>> +#define MMU_MMU_CONTROL1_MMU_INVALDC_NO_REPS                (4)
>> +#define MMU_MMU_CONTROL1_MMU_INVALDC_SIZE                (1)
>> +
>> +#define MMU_MMU_CONTROL1_MMU_FAULT_CLEAR_MASK                (0x00010000)
>> +#define MMU_MMU_CONTROL1_MMU_FAULT_CLEAR_SHIFT                (16)
>> +
>> +#define MMU_MMU_CONTROL1_PROTOCOL_FAULT_CLEAR_MASK            (0x00100000)
>> +#define MMU_MMU_CONTROL1_PROTOCOL_FAULT_CLEAR_SHIFT            (20)
>> +
>> +#define MMU_MMU_CONTROL1_MMU_PAUSE_SET_MASK                (0x01000000)
>> +#define MMU_MMU_CONTROL1_MMU_PAUSE_SET_SHIFT                (24)
>> +
>> +#define MMU_MMU_CONTROL1_MMU_PAUSE_CLEAR_MASK                (0x02000000)
>> +#define MMU_MMU_CONTROL1_MMU_PAUSE_CLEAR_SHIFT                (25)
>> +
>> +#define MMU_MMU_CONTROL1_MMU_SOFT_RESET_MASK                (0x10000000)
>> +#define MMU_MMU_CONTROL1_MMU_SOFT_RESET_SHIFT                (28)
>> +
>> +#define MMU_MMU_BANK_INDEX_OFFSET                    (0x0010)
>> +
>> +#define MMU_MMU_BANK_INDEX_MMU_BANK_INDEX_MASK                (0xC0000000)
>> +#define MMU_MMU_BANK_INDEX_MMU_BANK_INDEX_SHIFT                (30)
>> +#define MMU_MMU_BANK_INDEX_MMU_BANK_INDEX_NO_REPS            (16)
>> +#define MMU_MMU_BANK_INDEX_MMU_BANK_INDEX_SIZE                (2)
>> +
>> +#define MMU_REQUEST_PRIORITY_ENABLE_OFFSET                (0x0018)
>> +
>> +#define MMU_REQUEST_PRIORITY_ENABLE_CMD_PRIORITY_ENABLE_MASK       
>> (0x00008000)
>> +#define MMU_REQUEST_PRIORITY_ENABLE_CMD_PRIORITY_ENABLE_SHIFT        (15)
>> +#define MMU_REQUEST_PRIORITY_ENABLE_CMD_PRIORITY_ENABLE_NO_REPS        (16)
>> +#define MMU_REQUEST_PRIORITY_ENABLE_CMD_PRIORITY_ENABLE_SIZE        (1)
>> +
>> +#define MMU_REQUEST_PRIORITY_ENABLE_CMD_MMU_PRIORITY_ENABLE_MASK   
>> (0x00010000)
>> +#define MMU_REQUEST_PRIORITY_ENABLE_CMD_MMU_PRIORITY_ENABLE_SHIFT    (16)
>> +
>> +#define MMU_REQUEST_LIMITED_THROUGHPUT_OFFSET                (0x001C)
>> +
>> +#define MMU_REQUEST_LIMITED_THROUGHPUT_LIMITED_WORDS_MASK        (0x000003FF)
>> +#define MMU_REQUEST_LIMITED_THROUGHPUT_LIMITED_WORDS_SHIFT        (0)
>> +
>> +#define MMU_REQUEST_LIMITED_THROUGHPUT_REQUEST_GAP_MASK           
>> (0x0FFF0000)
>> +#define MMU_REQUEST_LIMITED_THROUGHPUT_REQUEST_GAP_SHIFT        (16)
>> +
>> +#define MMU_MMU_ADDRESS_CONTROL_OFFSET                    (0x0070)
>> +#define MMU_MMU_ADDRESS_CONTROL_TRUSTED                    (IMG_TRUE)
>> +
>> +#define MMU_MMU_ADDRESS_CONTROL_MMU_BYPASS_MASK                (0x00000001)
>> +#define MMU_MMU_ADDRESS_CONTROL_MMU_BYPASS_SHIFT            (0)
>> +
>> +#define MMU_MMU_ADDRESS_CONTROL_MMU_ENABLE_EXT_ADDRESSING_MASK       
>> (0x00000010)
>> +#define MMU_MMU_ADDRESS_CONTROL_MMU_ENABLE_EXT_ADDRESSING_SHIFT        (4)
>> +
>> +#define MMU_MMU_ADDRESS_CONTROL_UPPER_ADDRESS_FIXED_MASK        (0x00FF0000)
>> +#define MMU_MMU_ADDRESS_CONTROL_UPPER_ADDRESS_FIXED_SHIFT        (16)
>> +
>> +#define MMU_MMU_CONFIG0_OFFSET                        (0x0080)
>> +
>> +#define MMU_MMU_CONFIG0_NUM_REQUESTORS_MASK                (0x0000000F)
>> +#define MMU_MMU_CONFIG0_NUM_REQUESTORS_SHIFT                (0)
>> +
>> +#define MMU_MMU_CONFIG0_EXTENDED_ADDR_RANGE_MASK            (0x000000F0)
>> +#define MMU_MMU_CONFIG0_EXTENDED_ADDR_RANGE_SHIFT            (4)
>> +
>> +#define MMU_MMU_CONFIG0_GROUP_OVERRIDE_SIZE_MASK            (0x00000700)
>> +#define MMU_MMU_CONFIG0_GROUP_OVERRIDE_SIZE_SHIFT            (8)
>> +
>> +#define MMU_MMU_CONFIG0_ADDR_COHERENCY_SUPPORTED_MASK            (0x00001000)
>> +#define MMU_MMU_CONFIG0_ADDR_COHERENCY_SUPPORTED_SHIFT            (12)
>> +
>> +#define MMU_MMU_CONFIG0_MMU_SUPPORTED_MASK                (0x00002000)
>> +#define MMU_MMU_CONFIG0_MMU_SUPPORTED_SHIFT                (13)
>> +
>> +#define MMU_MMU_CONFIG0_TILE_ADDR_GRANULARITY_MASK            (0x001F0000)
>> +#define MMU_MMU_CONFIG0_TILE_ADDR_GRANULARITY_SHIFT            (16)
>> +
>> +#define MMU_MMU_CONFIG0_NO_READ_REORDER_MASK                (0x00200000)
>> +#define MMU_MMU_CONFIG0_NO_READ_REORDER_SHIFT                (21)
>> +
>> +#define MMU_MMU_CONFIG0_TAGS_SUPPORTED_MASK                (0xFFC00000)
>> +#define MMU_MMU_CONFIG0_TAGS_SUPPORTED_SHIFT                (22)
>> +
>> +#define MMU_MMU_CONFIG1_OFFSET                        (0x0084)
>> +
>> +#define MMU_MMU_CONFIG1_PAGE_SIZE_MASK                    (0x0000000F)
>> +#define MMU_MMU_CONFIG1_PAGE_SIZE_SHIFT                    (0)
>> +
>> +#define MMU_MMU_CONFIG1_PAGE_CACHE_ENTRIES_MASK                (0x0000FF00)
>> +#define MMU_MMU_CONFIG1_PAGE_CACHE_ENTRIES_SHIFT            (8)
>> +
>> +#define MMU_MMU_CONFIG1_DIR_CACHE_ENTRIES_MASK                (0x001F0000)
>> +#define MMU_MMU_CONFIG1_DIR_CACHE_ENTRIES_SHIFT                (16)
>> +
>> +#define MMU_MMU_CONFIG1_BANDWIDTH_COUNT_SUPPORTED_MASK            (0x01000000)
>> +#define MMU_MMU_CONFIG1_BANDWIDTH_COUNT_SUPPORTED_SHIFT            (24)
>> +
>> +#define MMU_MMU_CONFIG1_STALL_COUNT_SUPPORTED_MASK            (0x02000000)
>> +#define MMU_MMU_CONFIG1_STALL_COUNT_SUPPORTED_SHIFT            (25)
>> +
>> +#define MMU_MMU_CONFIG1_LATENCY_COUNT_SUPPORTED_MASK            (0x04000000)
>> +#define MMU_MMU_CONFIG1_LATENCY_COUNT_SUPPORTED_SHIFT            (26)
>> +
>> +#define MMU_MMU_STATUS0_OFFSET                        (0x0088)
>> +
>> +#define MMU_MMU_STATUS0_MMU_PF_N_RW_MASK                (0x00000001)
>> +#define MMU_MMU_STATUS0_MMU_PF_N_RW_SHIFT                (0)
>> +
>> +#define MMU_MMU_STATUS0_MMU_FAULT_ADDR_MASK                (0xFFFFF000)
>> +#define MMU_MMU_STATUS0_MMU_FAULT_ADDR_SHIFT                (12)
>> +
>> +#define MMU_MMU_STATUS1_OFFSET                        (0x008C)
>> +
>> +#define MMU_MMU_STATUS1_MMU_FAULT_REQ_STAT_MASK                (0x0000FFFF)
>> +#define MMU_MMU_STATUS1_MMU_FAULT_REQ_STAT_SHIFT            (0)
>> +
>> +#define MMU_MMU_STATUS1_MMU_FAULT_REQ_ID_MASK                (0x000F0000)
>> +#define MMU_MMU_STATUS1_MMU_FAULT_REQ_ID_SHIFT                (16)
>> +
>> +#define MMU_MMU_STATUS1_MMU_FAULT_INDEX_MASK                (0x03000000)
>> +#define MMU_MMU_STATUS1_MMU_FAULT_INDEX_SHIFT                (24)
>> +
>> +#define MMU_MMU_STATUS1_MMU_FAULT_RNW_MASK                (0x10000000)
>> +#define MMU_MMU_STATUS1_MMU_FAULT_RNW_SHIFT                (28)
>> +
>> +#define MMU_MMU_MEM_REQ_OFFSET                        (0x0090)
>> +
>> +#define MMU_MMU_MEM_REQ_TAG_OUTSTANDING_MASK                (0x000003FF)
>> +#define MMU_MMU_MEM_REQ_TAG_OUTSTANDING_SHIFT                (0)
>> +
>> +#define MMU_MMU_MEM_REQ_EXT_WRRESP_FAULT_MASK                (0x00001000)
>> +#define MMU_MMU_MEM_REQ_EXT_WRRESP_FAULT_SHIFT                (12)
>> +
>> +#define MMU_MMU_MEM_REQ_EXT_RDRESP_FAULT_MASK                (0x00002000)
>> +#define MMU_MMU_MEM_REQ_EXT_RDRESP_FAULT_SHIFT                (13)
>> +
>> +#define MMU_MMU_MEM_REQ_EXT_READ_BURST_FAULT_MASK            (0x00004000)
>> +#define MMU_MMU_MEM_REQ_EXT_READ_BURST_FAULT_SHIFT            (14)
>> +
>> +#define MMU_MMU_MEM_REQ_INT_PROTOCOL_FAULT_MASK                (0x80000000)
>> +#define MMU_MMU_MEM_REQ_INT_PROTOCOL_FAULT_SHIFT            (31)
>> +#define MMU_MMU_MEM_REQ_INT_PROTOCOL_FAULT_NO_REPS            (16)
>> +#define MMU_MMU_MEM_REQ_INT_PROTOCOL_FAULT_SIZE                (1)
>> +
>> +#define MMU_MMU_FAULT_SELECT_OFFSET                    (0x00A0)
>> +
>> +#define MMU_MMU_FAULT_SELECT_MMU_FAULT_SELECT_MASK            (0x0000000F)
>> +#define MMU_MMU_FAULT_SELECT_MMU_FAULT_SELECT_SHIFT            (0)
>> +
>> +#define MMU_PROTOCOL_FAULT_OFFSET                    (0x00A8)
>> +
>> +#define MMU_PROTOCOL_FAULT_FAULT_PAGE_BREAK_MASK            (0x00000001)
>> +#define MMU_PROTOCOL_FAULT_FAULT_PAGE_BREAK_SHIFT            (0)
>> +
>> +#define MMU_PROTOCOL_FAULT_FAULT_WRITE_MASK                (0x00000010)
>> +#define MMU_PROTOCOL_FAULT_FAULT_WRITE_SHIFT                (4)
>> +
>> +#define MMU_PROTOCOL_FAULT_FAULT_READ_MASK                (0x00000020)
>> +#define MMU_PROTOCOL_FAULT_FAULT_READ_SHIFT                (5)
>> +
>> +#define MMU_TOTAL_READ_REQ_OFFSET                    (0x0100)
>> +
>> +#define MMU_TOTAL_READ_REQ_TOTAL_READ_REQ_MASK                (0xFFFFFFFF)
>> +#define MMU_TOTAL_READ_REQ_TOTAL_READ_REQ_SHIFT                (0)
>> +
>> +#define MMU_TOTAL_WRITE_REQ_OFFSET                    (0x0104)
>> +
>> +#define MMU_TOTAL_WRITE_REQ_TOTAL_WRITE_REQ_MASK            (0xFFFFFFFF)
>> +#define MMU_TOTAL_WRITE_REQ_TOTAL_WRITE_REQ_SHIFT            (0)
>> +
>> +#define MMU_READS_LESS_64_REQ_OFFSET                    (0x0108)
>> +
>> +#define MMU_READS_LESS_64_REQ_READS_LESS_64_REQ_MASK            (0xFFFFFFFF)
>> +#define MMU_READS_LESS_64_REQ_READS_LESS_64_REQ_SHIFT            (0)
>> +
>> +#define MMU_WRITES_LESS_64_REQ_OFFSET                    (0x010C)
>> +
>> +#define MMU_WRITES_LESS_64_REQ_WRITES_LESS_64_REQ_MASK            (0xFFFFFFFF)
>> +#define MMU_WRITES_LESS_64_REQ_WRITES_LESS_64_REQ_SHIFT            (0)
>> +
>> +#define MMU_EXT_CMD_STALL_OFFSET                    (0x0120)
>> +
>> +#define MMU_EXT_CMD_STALL_EXT_CMD_STALL_MASK                (0xFFFFFFFF)
>> +#define MMU_EXT_CMD_STALL_EXT_CMD_STALL_SHIFT                (0)
>> +
>> +#define MMU_WRITE_REQ_STALL_OFFSET                    (0x0124)
>> +
>> +#define MMU_WRITE_REQ_STALL_WRITE_REQ_STALL_MASK            (0xFFFFFFFF)
>> +#define MMU_WRITE_REQ_STALL_WRITE_REQ_STALL_SHIFT            (0)
>> +
>> +#define MMU_MMU_MISS_STALL_OFFSET                    (0x0128)
>> +
>> +#define MMU_MMU_MISS_STALL_MMU_MISS_STALL_MASK                (0xFFFFFFFF)
>> +#define MMU_MMU_MISS_STALL_MMU_MISS_STALL_SHIFT                (0)
>> +
>> +#define MMU_ADDRESS_STALL_OFFSET                    (0x012C)
>> +
>> +#define MMU_ADDRESS_STALL_ADDRESS_STALL_MASK                (0xFFFFFFFF)
>> +#define MMU_ADDRESS_STALL_ADDRESS_STALL_SHIFT                (0)
>> +
>> +#define MMU_TAG_STALL_OFFSET                        (0x0130)
>> +
>> +#define MMU_TAG_STALL_TAG_STALL_MASK                    (0xFFFFFFFF)
>> +#define MMU_TAG_STALL_TAG_STALL_SHIFT                    (0)
>> +
>> +#define MMU_PEAK_READ_OUTSTANDING_OFFSET                (0x0140)
>> +
>> +#define MMU_PEAK_READ_OUTSTANDING_PEAK_TAG_OUTSTANDING_MASK       
>> (0x000003FF)
>> +#define MMU_PEAK_READ_OUTSTANDING_PEAK_TAG_OUTSTANDING_SHIFT        (0)
>> +
>> +#define MMU_PEAK_READ_OUTSTANDING_PEAK_READ_LATENCY_MASK        (0xFFFF0000)
>> +#define MMU_PEAK_READ_OUTSTANDING_PEAK_READ_LATENCY_SHIFT        (16)
>> +
>> +#define MMU_AVERAGE_READ_LATENCY_OFFSET                    (0x0144)
>> +
>> +#define MMU_AVERAGE_READ_LATENCY_AVERAGE_READ_LATENCY_MASK        (0xFFFFFFFF)
>> +#define MMU_AVERAGE_READ_LATENCY_AVERAGE_READ_LATENCY_SHIFT        (0)
>> +
>> +#define MMU_STATISTICS_CONTROL_OFFSET                    (0x0160)
>> +
>> +#define MMU_STATISTICS_CONTROL_BANDWIDTH_STATS_INIT_MASK        (0x00000001)
>> +#define MMU_STATISTICS_CONTROL_BANDWIDTH_STATS_INIT_SHIFT        (0)
>> +
>> +#define MMU_STATISTICS_CONTROL_STALL_STATS_INIT_MASK            (0x00000002)
>> +#define MMU_STATISTICS_CONTROL_STALL_STATS_INIT_SHIFT            (1)
>> +
>> +#define MMU_STATISTICS_CONTROL_LATENCY_STATS_INIT_MASK            (0x00000004)
>> +#define MMU_STATISTICS_CONTROL_LATENCY_STATS_INIT_SHIFT            (2)
>> +
>> +#define MMU_MMU_VERSION_OFFSET                        (0x01D0)
>> +
>> +#define MMU_MMU_VERSION_MMU_MAJOR_REV_MASK                (0x00FF0000)
>> +#define MMU_MMU_VERSION_MMU_MAJOR_REV_SHIFT                (16)
>> +
>> +#define MMU_MMU_VERSION_MMU_MINOR_REV_MASK                (0x0000FF00)
>> +#define MMU_MMU_VERSION_MMU_MINOR_REV_SHIFT                (8)
>> +
>> +#define MMU_MMU_VERSION_MMU_MAINT_REV_MASK                (0x000000FF)
>> +#define MMU_MMU_VERSION_MMU_MAINT_REV_SHIFT                (0)
>> +
>> +#define MMU_BYTE_SIZE                            (0x01D4)
>> +
>> +#endif
> 
