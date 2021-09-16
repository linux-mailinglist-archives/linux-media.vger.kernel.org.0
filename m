Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECC640D2C4
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 07:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234310AbhIPFHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 01:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbhIPFHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 01:07:07 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B72C061764
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 22:05:47 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c22so11941355edn.12
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 22:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VoD2qmZ/fNfRcJwUxEEWLDk1W6vmafuG6EyLNrB0mys=;
        b=OZaUsGLTB/RTKAzXhD27i0Fd54yLeeIRZnRevNzY+eEHFgk4D8QyhStdeSCtO+JuLs
         RaWp89Zmi/j2igdV8HTjYq4yozfaA1MCAwEZaGF7xWPvim2myrkcdkz/zNDifQcUnHgi
         KS8urK6SXaIpIDiCFVBWpnEvTq1nRUrYRSksmXD765vQwY3SaLwKbHusORaz5i6gGeoq
         bLukNcnrnzXC5Bp1Qp3+JMytMD7Sk7c8Zip+PGM/cEXSRiya2RmdTzVojYuuhrUjWWq/
         wd+EtJ/vMvX92lF5rbWfL9gtcgHfcN8VHvY+/fhIqZBSAORfO/YmMg6+P+6FLanTmSml
         mPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VoD2qmZ/fNfRcJwUxEEWLDk1W6vmafuG6EyLNrB0mys=;
        b=b6iBut2W4yb1IussdRPiem3ghnKE6ed9ucGUae595aI3+2DRLvC2OZc/ofl3O0O37N
         l+om1Opl8axhGNagO7TR2uVqMkP67dPFrdvzMx08uzxBAsrsnNzYiWBtMk+XYruFMb7F
         3r+WgrzqcOKIgv3bj1WYePCAJPBq6IdzsLxXdAlo0Y2smgpIuWA9WCflx9plPsFM9/+G
         IGHXbNWTcG6fvf3iJdk+HR/NCnrmAIJACDuZNDSPQ+ajywYbwwlJkpKupa6dZlWOLY+8
         7C19wjQBaashF7Zf9+Ib+hZk5YtMz+x29mDX4zw8r0OGtIpXNho3HGUOTOvnRScYmxkU
         TIJA==
X-Gm-Message-State: AOAM533vKZ1qz8h9i9rw9rxb3iVfMbytb+REuj6HPiXZrjc4fY2vaas8
        Z+Jtlnx6hbg/R5cPXc3yr6kfTBJD7UVrsZqI7HxUyw==
X-Google-Smtp-Source: ABdhPJwuRmqYFEi6jJ8o/kU5gLq/s+iJai9rvo3BPXeQRXe5qy83zmClrUa+H1bn6gLTuHFDfwaFttPK4MlahlnnqvA=
X-Received: by 2002:a17:906:e20e:: with SMTP id gf14mr4203948ejb.244.1631768745206;
 Wed, 15 Sep 2021 22:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210915162324.25513-1-dafna.hirschfeld@collabora.com> <20210915162324.25513-3-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210915162324.25513-3-dafna.hirschfeld@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 16 Sep 2021 02:05:33 -0300
Message-ID: <CAAEAJfA5p_W8VKa=varFYqg+0pQhdk_125F7cdy9LrrbQ2QKpw@mail.gmail.com>
Subject: Re: [PATCH 2/6] staging: media: wave5: Add the vdi layer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, 15 Sept 2021 at 13:24, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Add the vdi directory of the wave5 codec driver.
> The vdi.h header defines common helper functions
> such as writing/reading register and handling endianness.
>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/wave5/vdi/vdi.c | 325 ++++++++++++++++++++++++++
>  drivers/staging/media/wave5/vdi/vdi.h |  79 +++++++
>  2 files changed, 404 insertions(+)
>  create mode 100644 drivers/staging/media/wave5/vdi/vdi.c
>  create mode 100644 drivers/staging/media/wave5/vdi/vdi.h
>
> diff --git a/drivers/staging/media/wave5/vdi/vdi.c b/drivers/staging/media/wave5/vdi/vdi.c
> new file mode 100644
> index 000000000000..95bc120407a4
> --- /dev/null
> +++ b/drivers/staging/media/wave5/vdi/vdi.c
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Wave5 series multi-standard codec IP - low level access functions
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +#include <linux/bug.h>
> +#include "vdi.h"
> +#include "../v4l2/vpu.h"
> +#include "../vpuapi/wave/wave5_regdefine.h"
> +#include <linux/delay.h>
> +#define VDI_SRAM_BASE_ADDR                  0x00
> +
> +#define VDI_SYSTEM_ENDIAN                VDI_LITTLE_ENDIAN
> +#define VDI_128BIT_BUS_SYSTEM_ENDIAN     VDI_128BIT_LITTLE_ENDIAN
> +
> +static int vdi_allocate_common_memory(struct device *dev)

I would get rid of this entirely and just use the DMA API allocators.

> +{
> +       int ret;
> +       struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +       if (!vpu_dev->common_mem.vaddr) {
> +               vpu_dev->common_mem.size = SIZE_COMMON;
> +               ret = vdi_allocate_dma_memory(vpu_dev, &vpu_dev->common_mem);
> +               if (ret) {
> +                       dev_err(dev, "unable to allocate common buffer\n");
> +                       return ret;
> +               }
> +       }
> +
> +       dev_dbg(dev, "common_mem: daddr=%pad size=%zu vaddr=0x%p\n",
> +               &vpu_dev->common_mem.daddr, vpu_dev->common_mem.size,
> +                       vpu_dev->common_mem.vaddr);
> +
> +       return 0;
> +}
> +
> +int vdi_init(struct device *dev)

As mentioned on patch 3/6, please prefix functions, e.g. "wave5_vdi_init".

> +{
> +       struct vpu_platform_data *pdata = dev_get_platdata(dev);
> +       struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +       int i;
> +
> +       if (vdi_allocate_common_memory(dev) < 0) {
> +               pr_err("[VDI] fail to get vpu common buffer from driver\n");

As mentioned on patch 3/6, please clean the pr_{} with dev_{},
if possible.

If you need to use pr_{} for some reason, you can use pr_fmt
instead of having that "[VDI]". This stuff is even nicely
documented Documentation/core-api/printk-basics.rst :-)

> +               goto ERR_VDI_INIT;
> +       }
> +
> +       if (pdata && pdata->reset)
> +               pdata->reset(dev, vpu_dev->vdb_register.vaddr);
> +
> +       if (pdata && pdata->pre_fw_init) {
> +               if (pdata->pre_fw_init(dev, vpu_dev->vdb_register.vaddr))
> +                       goto ERR_VDI_INIT;
> +       }
> +
> +       if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +               // if BIT processor is not running.
> +               if (vdi_read_register(vpu_dev, W5_VCPU_CUR_PC) == 0) {
> +                       for (i = 0; i < 64; i++)
> +                               vdi_write_register(vpu_dev, (i * 4) + 0x100, 0x0);
> +               }
> +       } else {
> +               WARN_ONCE(1, "unsupported product code 0x%x\n", vpu_dev->product_code);
> +       }
> +
> +       pr_info("[VDI] success to init driver\n");
> +
> +       return 0;
> +
> +ERR_VDI_INIT:
> +

Avoid caps.

> +       vdi_release(dev);
> +       return -1;
> +}
> +EXPORT_SYMBOL(vdi_init);
> +

Exported to whom?

> +int vdi_release(struct device *dev)
> +{
> +       struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +       memset(&vpu_dev->vdb_register, 0x00, sizeof(vpu_dev->vdb_register));
> +       vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(vdi_release);
> +
> +void vdi_write_register(struct vpu_device *vpu_dev, unsigned int addr, unsigned int data)
> +{
> +       struct vpu_platform_data *pdata;
> +
> +       pdata = dev_get_platdata(vpu_dev->dev);
> +       if (pdata && pdata->write_register)
> +               return pdata->write_register(vpu_dev->dev, vpu_dev->vdb_register.vaddr, addr, data);
> +
> +       writel(data, vpu_dev->vdb_register.vaddr + addr);
> +}
> +
> +unsigned int vdi_read_register(struct vpu_device *vpu_dev, unsigned int addr)
> +{
> +       struct vpu_platform_data *pdata;
> +
> +       pdata = dev_get_platdata(vpu_dev->dev);
> +       if (pdata && pdata->read_register)
> +               return pdata->read_register(vpu_dev->dev, vpu_dev->vdb_register.vaddr, addr);
> +
> +       return readl(vpu_dev->vdb_register.vaddr + addr);
> +}
> +EXPORT_SYMBOL(vdi_read_register);
> +
> +int vdi_buffer_sync(struct device *dev, struct vpu_buf *vb, int dir)
> +{
> +       struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +       struct vpu_platform_data *pdata;
> +
> +       if (!vb || !vb->vaddr) {
> +               pr_err("%s(): unable to clear unmapped buffer\n", __func__);
> +               return -EINVAL;
> +       }
> +
> +       pdata = dev_get_platdata(dev);
> +       if (pdata && pdata->buffer_sync)
> +               return pdata->buffer_sync(dev, vpu_dev->vdb_register.vaddr, vb, 0, vb->size, dir);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(vdi_buffer_sync);
> +
> +int vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
> +{
> +       struct vpu_platform_data *pdata;
> +
> +       if (!vb || !vb->vaddr) {
> +               pr_err("%s(): unable to clear unmapped buffer\n", __func__);
> +               return -EINVAL;
> +       }
> +
> +       memset(vb->vaddr, 0, vb->size);
> +       pdata = dev_get_platdata(vpu_dev->dev);
> +       if (pdata && pdata->buffer_sync)
> +               pdata->buffer_sync(vpu_dev->dev, vpu_dev->vdb_register.vaddr, vb, 0, vb->size, VPU_BUF_SYNC_TO_DEVICE);
> +
> +       return vb->size;
> +}
> +
> +static int swap_endian(struct vpu_device *vpu_dev, unsigned char *data, int len, int endian);
> +
> +int vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb, size_t offset, unsigned char *data, int len, int endian)
> +{
> +       struct vpu_platform_data *pdata;
> +
> +       if (!vb || !vb->vaddr) {
> +               pr_err("%s(): unable to write to unmapped buffer\n", __func__);
> +               return -EINVAL;
> +       }
> +
> +       if ((offset + len) > vb->size) {
> +               pr_err("%s(): buffer too small\n", __func__);
> +               return -ENOSPC;
> +       }
> +
> +       swap_endian(vpu_dev, data, len, endian);
> +       memcpy(vb->vaddr + offset, data, len);
> +       pdata = dev_get_platdata(vpu_dev->dev);
> +       if (pdata && pdata->buffer_sync)
> +               pdata->buffer_sync(vpu_dev->dev, vpu_dev->vdb_register.vaddr, vb, offset, len, VPU_BUF_SYNC_TO_DEVICE);
> +
> +       return len;
> +}
> +
> +int vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
> +{
> +       void *vaddr;
> +       dma_addr_t daddr;
> +       struct vpu_platform_data *pdata;
> +
> +       if (!vb->size) {
> +               dev_err(vpu_dev->dev, "%s(): requested size==0\n", __func__);
> +               return -EINVAL;
> +       }
> +
> +       pdata = dev_get_platdata(vpu_dev->dev);
> +       if (pdata && pdata->buffer_alloc)
> +               return pdata->buffer_alloc(vpu_dev->dev, vb);

I don't see buffer_alloc implemented, but like I said, better to just
ditch this ad-hoc allocator and do follow kernel-style, like all drivers.

> +
> +       vaddr = dma_alloc_coherent(vpu_dev->dev, vb->size, &daddr, GFP_KERNEL);
> +       if (!vaddr)
> +               return -ENOMEM;
> +       vb->vaddr = vaddr;
> +       vb->daddr = daddr;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(vdi_allocate_dma_memory);
> +
> +void vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
> +{
> +       struct vpu_platform_data *pdata;
> +
> +       if (vb->size == 0)
> +               return;
> +
> +       pdata = dev_get_platdata(vpu_dev->dev);
> +       if (pdata && pdata->buffer_free)
> +               return pdata->buffer_free(vpu_dev->dev, vb);
> +
> +       if (!vb->vaddr)
> +               dev_err(vpu_dev->dev, "%s(): requested free of unmapped buffer\n", __func__);
> +       else
> +               dma_free_coherent(vpu_dev->dev, vb->size, vb->vaddr, vb->daddr);
> +
> +       memset(vb, 0, sizeof(*vb));
> +}
> +EXPORT_SYMBOL(vdi_free_dma_memory);
> +
> +int vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian)
> +{
> +       if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +               switch (endian) {
> +               case VDI_LITTLE_ENDIAN:
> +                       endian = 0x00;
> +                       break;
> +               case VDI_BIG_ENDIAN:
> +                       endian = 0x0f;
> +                       break;
> +               case VDI_32BIT_LITTLE_ENDIAN:
> +                       endian = 0x04;
> +                       break;
> +               case VDI_32BIT_BIG_ENDIAN:
> +                       endian = 0x03;
> +                       break;
> +               }
> +       }
> +
> +       return (endian & 0x0f);
> +}
> +
> +void byte_swap(unsigned char *data, int len)
> +{
> +       u8 temp;
> +       s32 i;
> +
> +       for (i = 0; i < len; i += 2) {
> +               temp      = data[i];
> +               data[i]   = data[i + 1];
> +               data[i + 1] = temp;
> +       }
> +}
> +
> +void word_swap(unsigned char *data, int len)

Perhaps there's some library function for all these?

> +{
> +       u16  temp;
> +       u16 *ptr = (uint16_t *)data;
> +       s32   i, size = len / (int)sizeof(uint16_t);
> +
> +       for (i = 0; i < size; i += 2) {
> +               temp     = ptr[i];
> +               ptr[i]   = ptr[i + 1];
> +               ptr[i + 1] = temp;
> +       }
> +}
> +
> +void dword_swap(unsigned char *data, int len)
> +{
> +       u32  temp;
> +       u32 *ptr = (uint32_t *)data;
> +       s32   i, size = len / (int)sizeof(uint32_t);
> +
> +       for (i = 0; i < size; i += 2) {
> +               temp     = ptr[i];
> +               ptr[i]   = ptr[i + 1];
> +               ptr[i + 1] = temp;
> +       }
> +}
> +
> +void lword_swap(unsigned char *data, int len)
> +{
> +       u64  temp;
> +       u64 *ptr = (uint64_t *)data;
> +       s32   i, size = len / (int)sizeof(uint64_t);
> +
> +       for (i = 0; i < size; i += 2) {
> +               temp     = ptr[i];
> +               ptr[i]   = ptr[i + 1];
> +               ptr[i + 1] = temp;
> +       }
> +}
> +
> +static int swap_endian(struct vpu_device *vpu_dev, unsigned char *data, int len, int endian)
> +{
> +       int         changes;
> +       int         sys_endian;
> +       bool        byte_change, word_change, dword_change, lword_change;
> +
> +       if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +               sys_endian = VDI_128BIT_BUS_SYSTEM_ENDIAN;
> +       } else {
> +               pr_err("unknown product id : %08x\n", vpu_dev->product_code);
> +               return -1;
> +       }
> +
> +       endian     = vdi_convert_endian(vpu_dev, endian);
> +       sys_endian = vdi_convert_endian(vpu_dev, sys_endian);
> +       if (endian == sys_endian)
> +               return 0;
> +
> +       changes     = endian ^ sys_endian;
> +       byte_change  = changes & 0x01;
> +       word_change  = ((changes & 0x02) == 0x02);
> +       dword_change = ((changes & 0x04) == 0x04);
> +       lword_change = ((changes & 0x08) == 0x08);
> +
> +       if (byte_change)
> +               byte_swap(data, len);
> +       if (word_change)
> +               word_swap(data, len);
> +       if (dword_change)
> +               dword_swap(data, len);
> +       if (lword_change)
> +               lword_swap(data, len);
> +
> +       return 1;
> +}
> +
> diff --git a/drivers/staging/media/wave5/vdi/vdi.h b/drivers/staging/media/wave5/vdi/vdi.h
> new file mode 100644
> index 000000000000..31fcea026755
> --- /dev/null
> +++ b/drivers/staging/media/wave5/vdi/vdi.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Wave5 series multi-standard codec IP - low level access functions
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +
> +#ifndef _VDI_H_
> +#define _VDI_H_
> +
> +#include "../vpuapi/vpuconfig.h"
> +#include <linux/string.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +
> +/************************************************************************/
> +/* COMMON REGISTERS                                                     */
> +/************************************************************************/
> +#define VPU_PRODUCT_CODE_REGISTER                 0x1044
> +
> +/* system register write */
> +#define vpu_write_reg(VPU_INST, ADDR, DATA) vdi_write_register(VPU_INST, ADDR, DATA)
> +// system register read
> +#define vpu_read_reg(CORE, ADDR) vdi_read_register(CORE, ADDR)
> +// system memory write
> +#define vpu_write_mem(CORE, VB, OFFSET, DATA, LEN, ENDIAN)    \
> +       vdi_write_memory(CORE, VB, OFFSET, DATA, LEN, ENDIAN)
> +
> +struct vpu_buf {
> +       size_t size;
> +       dma_addr_t daddr;
> +       void __iomem *vaddr;
> +};
> +
> +enum endian_mode {
> +       VDI_LITTLE_ENDIAN = 0,      /* 64bit LE */
> +       VDI_BIG_ENDIAN,             /* 64bit BE */
> +       VDI_32BIT_LITTLE_ENDIAN,
> +       VDI_32BIT_BIG_ENDIAN,
> +       /* WAVE PRODUCTS */
> +       VDI_128BIT_LITTLE_ENDIAN    = 16,
> +       VDI_128BIT_LE_BYTE_SWAP,
> +       VDI_128BIT_LE_WORD_SWAP,
> +       VDI_128BIT_LE_WORD_BYTE_SWAP,
> +       VDI_128BIT_LE_DWORD_SWAP,
> +       VDI_128BIT_LE_DWORD_BYTE_SWAP,
> +       VDI_128BIT_LE_DWORD_WORD_SWAP,
> +       VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
> +       VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
> +       VDI_128BIT_BE_DWORD_WORD_SWAP,
> +       VDI_128BIT_BE_DWORD_BYTE_SWAP,
> +       VDI_128BIT_BE_DWORD_SWAP,
> +       VDI_128BIT_BE_WORD_BYTE_SWAP,
> +       VDI_128BIT_BE_WORD_SWAP,
> +       VDI_128BIT_BE_BYTE_SWAP,
> +       VDI_128BIT_BIG_ENDIAN        = 31,
> +       VDI_ENDIAN_MAX
> +};
> +
> +#define VDI_128BIT_ENDIAN_MASK 0xf
> +
> +int vdi_init(struct device *dev);
> +int vdi_release(struct device *dev);   //this function may be called only at system off.
> +
> +/**
> + * @brief       make clock stable before changing clock frequency
> + * @detail      before inoking vdi_set_clock_freg caller MUST invoke vdi_ready_change_clock
> + *             function.
> + *              after changing clock frequency caller also invoke vdi_done_change_clock() function.
> + * @return  0   failure
> + *          1   success
> + */
> +int vdi_ready_change_clock(unsigned long core_idx);
> +int vdi_set_change_clock(unsigned long core_idx, unsigned long clock_mask);
> +int vdi_done_change_clock(unsigned long core_idx);
> +int vdi_buffer_sync(struct device *dev, struct vpu_buf *vb, int dir);
> +
> +#endif //#ifndef _VDI_H_
> +
> --
> 2.17.1
>

Regards,
Ezequiel
