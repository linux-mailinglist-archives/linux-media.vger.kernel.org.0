Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEAB340D2B1
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 06:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234176AbhIPEwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 00:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhIPEwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 00:52:24 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D971C061764
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 21:51:03 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id v5so11768064edc.2
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 21:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a+aGKkNiQIC8sXO/cigHYtB9uZgtl+OrxhubMnGTZsA=;
        b=tYLZfVmck7e975KyqECCECl6YNDs2QcZ/fwtRet0adiXxQd4o21UPcBS3t/tPEw2Y+
         xeCcyVQ2vaeQvOl4LPaprYfxD7V9oSd/1WPH4AQ3lSNgCIxIpXWC4yNprQ0zoLti+YLh
         Vc5u3yn7VnffS0FtyXFX58vCAvwSoZYB9H3CNylrLH3t3lNQpkFpF2TdNF230R65wv+6
         Ra4kPIt6sHWHZQME088YbWfIgQiDIYHerLp8McLogqLyJ/TBOaTGaIem8iPk8dmxbKR0
         sQ3XIiixg3Jjk2iG6V016QXb3reWMcPJiuTUCF68cJpHh7BRUvwLQpkSI+Wjeb/LVQE8
         GTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a+aGKkNiQIC8sXO/cigHYtB9uZgtl+OrxhubMnGTZsA=;
        b=jn/mxqJWTcLaTHnXE7RP2vDrjil5Rf+qQSDr5SOSPpyVjTWPoThqFJxc3sG18Zbnb7
         jkg/346N2337F33hQOh2ZQuvuC9g4asFAowehgqDWdQf34QMSuv5Dk9r/Vw3Mh6SCAAV
         AVt8bn88collzvKh9SjJeBwkIf7u6G0WlFbCzT054POH4rFMhYQ4FV2y8DYO6bpAWbGZ
         WIMfTu6mscu6voKcj89T+h/niULOWPzYofRA327HNPS2R/hOW4lFGG95BR41WP8Ck1WU
         uMmsvkrdVXvyWX3NA2Ad74KZJZBwQtIR4txu4kImojrf9HEnvD5KSLChWl53YvXtNEUC
         Ba2A==
X-Gm-Message-State: AOAM5339MaMrPp8FZ40Qc2ofj0SDN+ojolwvr138Zuqf4GR6DRMaJt34
        gk6UBQ2tbmsgRuX0E05jBePXKl/+MH7+DilbmNDhAg==
X-Google-Smtp-Source: ABdhPJy5FdGI6h+R15hNeodz/xcP68KYhWZ8yR64Umwy16314YnrtIE5LB14A0E40U/TeiGMcqZxJTDOpXkfX8C8EXk=
X-Received: by 2002:a17:906:d057:: with SMTP id bo23mr4232683ejb.208.1631767861367;
 Wed, 15 Sep 2021 21:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210915162324.25513-1-dafna.hirschfeld@collabora.com> <20210915162324.25513-4-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210915162324.25513-4-dafna.hirschfeld@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 16 Sep 2021 01:50:48 -0300
Message-ID: <CAAEAJfCJJworozpewu2gMTAuQ_6nejXtFEmWfvtV0dm80vV2nw@mail.gmail.com>
Subject: Re: [PATCH 3/6] staging: media: wave5: Add the v4l2 layer
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dafna, Nas and Robert:

I am quite happy to see a Chips and Media driver.

However, given it was announced that BeagleV=E2=84=A2-Starlight prototype
is not going to production [1], I'm curious about the plan for the driver.
Is there an expectation to support silicon in the medium term (2021/2022)?

For instance, are you aware of any an effort to fix the cache coherency
issues on the Starlight SoC?

In general, the driver is a good start, but it looks like it needs a
big broom and a ton of cleanup work. See below for some comments,
but keep in mind I may have missed more things.

[1] https://beaglev.org/blog/2021-07-30-the-future-of-beaglev-community

On Wed, 15 Sept 2021 at 13:24, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Add the decoder and encoder implementing the v4l2
> API. This patch also adds the Makefile and the VIDEO_WAVE_VPU config
>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/Kconfig              |    2 +
>  drivers/staging/media/Makefile             |    1 +
>  drivers/staging/media/wave5/Kconfig        |   10 +
>  drivers/staging/media/wave5/Makefile       |   10 +
>  drivers/staging/media/wave5/v4l2/vpu.c     |  386 +++++
>  drivers/staging/media/wave5/v4l2/vpu.h     |   76 +
>  drivers/staging/media/wave5/v4l2/vpu_dec.c | 1393 +++++++++++++++++
>  drivers/staging/media/wave5/v4l2/vpu_dec.h |   20 +
>  drivers/staging/media/wave5/v4l2/vpu_enc.c | 1580 ++++++++++++++++++++
>  drivers/staging/media/wave5/v4l2/vpu_enc.h |   18 +
>  10 files changed, 3496 insertions(+)
>  create mode 100644 drivers/staging/media/wave5/Kconfig
>  create mode 100644 drivers/staging/media/wave5/Makefile
>  create mode 100644 drivers/staging/media/wave5/v4l2/vpu.c
>  create mode 100644 drivers/staging/media/wave5/v4l2/vpu.h
>  create mode 100644 drivers/staging/media/wave5/v4l2/vpu_dec.c
>  create mode 100644 drivers/staging/media/wave5/v4l2/vpu_dec.h
>  create mode 100644 drivers/staging/media/wave5/v4l2/vpu_enc.c
>  create mode 100644 drivers/staging/media/wave5/v4l2/vpu_enc.h
>
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfi=
g
> index e3aaae920847..25564dc46ca7 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -44,4 +44,6 @@ source "drivers/staging/media/ipu3/Kconfig"
>
>  source "drivers/staging/media/av7110/Kconfig"
>
> +source "drivers/staging/media/wave5/Kconfig"
> +
>  endif
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makef=
ile
> index 5b5afc5b03a0..4cc61f24f5fa 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -11,3 +11,4 @@ obj-$(CONFIG_VIDEO_HANTRO)    +=3D hantro/
>  obj-$(CONFIG_VIDEO_IPU3_IMGU)  +=3D ipu3/
>  obj-$(CONFIG_VIDEO_ZORAN)      +=3D zoran/
>  obj-$(CONFIG_DVB_AV7110)       +=3D av7110/
> +obj-$(CONFIG_VIDEO_WAVE_VPU)   +=3D wave5/
> diff --git a/drivers/staging/media/wave5/Kconfig b/drivers/staging/media/=
wave5/Kconfig
> new file mode 100644
> index 000000000000..ac37fc33fd08
> --- /dev/null
> +++ b/drivers/staging/media/wave5/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config VIDEO_WAVE_VPU
> +        tristate "Chips&Media Wave Codec Driver"
> +        depends on VIDEO_DEV && VIDEO_V4L2 && OF

The driver has some ifdef CONFIG_OF. Either drop this or drop the ifdefs.

> +        select VIDEOBUF2_DMA_CONTIG
> +        select VIDEOBUF2_VMALLOC
> +        select V4L2_MEM2MEM_DEV
> +        select GENERIC_ALLOCATOR

I can't see why this is GENERIC_ALLOCATOR is here. Where is the API used?

> +        help
> +          Chips&Media codec driver
> diff --git a/drivers/staging/media/wave5/Makefile b/drivers/staging/media=
/wave5/Makefile
> new file mode 100644
> index 000000000000..89d113a56bd5
> --- /dev/null
> +++ b/drivers/staging/media/wave5/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_VIDEO_WAVE_VPU) +=3D wave5.o
> +wave5-objs +=3D          vpuapi/wave/wave5.o \
> +               vpuapi/vpuapi.o \
> +               vdi/vdi.o \
> +               v4l2/vpu_dec.o \
> +               v4l2/vpu.o \
> +               v4l2/vpu_enc.o
> +

It seems like an overkill to have a directory hierarchy for just these
few files. How about you collapse them under a single wave5 directory?

It will be easier to read and maintain.

> diff --git a/drivers/staging/media/wave5/v4l2/vpu.c b/drivers/staging/med=
ia/wave5/v4l2/vpu.c
> new file mode 100644
> index 000000000000..e17d31d565ff
> --- /dev/null
> +++ b/drivers/staging/media/wave5/v4l2/vpu.c
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Wave5 series multi-standard codec IP - platform driver
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/firmware.h>
> +#include <linux/interrupt.h>
> +#include "vpu.h"
> +#include "vpu_dec.h"
> +#include "vpu_enc.h"
> +#include "../vpuapi/wave/wave5_regdefine.h"
> +#include "../vpuapi/vpuconfig.h"
> +#include "../vpuapi/wave/wave5.h"
> +
> +#define VPU_PLATFORM_DEVICE_NAME    "vdec"
> +#define VPU_CLK_NAME                "vcodec"
> +

IIUC, given there's only just one clock, it's better
to avoid requiring a name. Maybe you can double check that
with some device tree experts.

> +/* if the platform driver knows this driver */
> +/* the definition of VPU_REG_BASE_ADDR and VPU_REG_SIZE are not meaningf=
ul */
> +#define VPU_REG_BASE_ADDR    0x75000000
> +#define VPU_REG_SIZE         0x4000
> +

REG_ macros unused.

> +struct wave5_match_data {
> +       bool decoder;
> +       bool encoder;

Nitpick, maybe a bit mask for functions?

> +       const char *fw_name;
> +};
> +
> +const struct wave5_match_data default_match_data =3D {
> +       .decoder =3D true,
> +       .encoder =3D true,
> +       .fw_name =3D "chagall.bin",
> +};
> +
> +unsigned int vpu_debug =3D 1;
> +module_param(vpu_debug, uint, 0644);
> +

I would rename this to just "debug".

> +int vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout)
> +{
> +       int ret;
> +
> +       ret =3D wait_for_completion_timeout(&inst->dev->irq_done,
> +                                         msecs_to_jiffies(timeout));
> +       if (!ret)
> +               return -ETIMEDOUT;
> +
> +       reinit_completion(&inst->dev->irq_done);
> +
> +       return 0;
> +}
> +
> +static irqreturn_t vpu_irq(int irq, void *dev_id)
> +{
> +       struct vpu_device   *dev =3D (struct vpu_device *)dev_id;
> +       unsigned int irq_status;
> +
> +       if (vdi_read_register(dev, W5_VPU_VPU_INT_STS)) {
> +               irq_status =3D vdi_read_register(dev, W5_VPU_VINT_REASON)=
;
> +               vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_statu=
s);
> +               vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
> +
> +               kfifo_in(&dev->irq_status, &irq_status, sizeof(int));
> +
> +               return IRQ_WAKE_THREAD;
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t vpu_irq_thread(int irq, void *dev_id)
> +{
> +       struct vpu_device   *dev =3D (struct vpu_device *)dev_id;
> +       struct vpu_instance *inst;
> +       unsigned int irq_status, val;
> +       int ret;
> +
> +       while (kfifo_len(&dev->irq_status)) {
> +               inst =3D v4l2_m2m_get_curr_priv(dev->v4l2_m2m_dev);
> +               if (inst) {
> +                       inst->ops->finish_process(inst);
> +               } else {
> +                       ret =3D kfifo_out(&dev->irq_status, &irq_status, =
sizeof(int));
> +                       if (!ret)
> +                               break;
> +                       DPRINTK(dev, 1, "irq_status: 0x%x\n", irq_status)=
;

If you explore other drivers you will see that it's preferred to use
dprintk instead of DPRINTK. Or just use dev_dbg which is probably better?

Also, the driver only seems to use debug level "1", so you can drop
the parameter.

Again, I believe dev_dbg may be more flexible and powerful.

> +                       val =3D vdi_read_register(dev, W5_VPU_VINT_REASON=
_USR);
> +                       val &=3D ~irq_status;
> +                       vdi_write_register(dev, W5_VPU_VINT_REASON_USR, v=
al);
> +                       complete(&dev->irq_done);
> +               }
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void vpu_device_run(void *priv)
> +{
> +       struct vpu_instance *inst =3D priv;
> +
> +       DPRINTK(inst->dev, 1, "inst type=3D%d state=3D%d\n",
> +               inst->type, inst->state);
> +
> +       inst->ops->start_process(inst);
> +}
> +
> +static int vpu_job_ready(void *priv)
> +{
> +       struct vpu_instance *inst =3D priv;
> +
> +       DPRINTK(inst->dev, 1, "inst type=3D%d state=3D%d\n",
> +               inst->type, inst->state);
> +
> +       if (inst->state =3D=3D VPU_INST_STATE_STOP)
> +               return 0;
> +
> +       return 1;
> +}
> +
> +static void vpu_job_abort(void *priv)
> +{
> +       struct vpu_instance *inst =3D priv;
> +
> +       DPRINTK(inst->dev, 1, "inst type=3D%d state=3D%d\n",
> +               inst->type, inst->state);
> +
> +       inst->ops->stop_process(inst);
> +}
> +
> +static const struct v4l2_m2m_ops vpu_m2m_ops =3D {
> +       .device_run =3D vpu_device_run,
> +       .job_ready  =3D vpu_job_ready,
> +       .job_abort  =3D vpu_job_abort,
> +};
> +
> +static int vpu_load_firmware(struct device *dev, const char *fw_name)
> +{
> +       const struct firmware *fw;
> +       enum ret_code ret =3D RETCODE_SUCCESS;
> +       u32 version;
> +       u32 revision;
> +       u32 product_id;
> +
> +       if (request_firmware(&fw, fw_name, dev)) {
> +               pr_err("request_firmware fail\n");
> +               return -1;
> +       }
> +
> +       ret =3D vpu_init_with_bitcode(dev, (unsigned short *)fw->data, fw=
->size / 2);
> +       if (ret !=3D RETCODE_SUCCESS) {

Get rid of enum ret_code and instead use 0 or errno.

> +               pr_err("vpu_init_with_bitcode fail\n");
> +               return -1;

Have you noticed this -1 is returned to the caller of vpu_probe?
Just propagate the errno (after getting rid of enum ret_code).
Same may apply to the rest of the driver.

> +       }
> +       release_firmware(fw);
> +
> +       ret =3D vpu_get_version_info(dev, &version, &revision, &product_i=
d);
> +       if (ret !=3D RETCODE_SUCCESS) {
> +               pr_err("vpu_get_version_info fail\n");
> +               return -1;
> +       }
> +
> +       pr_err("enum product_id : %08x\n", product_id);
> +       pr_err("fw_version : %08x(r%d)\n", version, revision);
> +

Avoid pr_{} and instead go with dev_{} / v4l2_{}.
Same may apply to the rest of the driver.

> +       return 0;
> +}
> +
> +static int vpu_probe(struct platform_device *pdev)
> +{
> +       int err =3D 0;
> +       struct vpu_device *dev;
> +       struct resource *res =3D NULL;
> +       const struct wave5_match_data *match_data;
> +
> +       match_data =3D device_get_match_data(&pdev->dev);
> +       if (!match_data)
> +               match_data =3D &default_match_data;
> +
> +       /* physical addresses limited to 32 bits */
> +       dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> +       dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(&pdev->dev, "unable to get mem resource\n");
> +               return -EINVAL;
> +       }
> +       dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +       if (!dev)
> +               return -ENOMEM;
> +
> +       dev->vdb_register.daddr =3D res->start;
> +       dev->vdb_register.size  =3D resource_size(res);
> +       dev->vdb_register.vaddr =3D devm_ioremap(&pdev->dev, dev->vdb_reg=
ister.daddr, dev->vdb_register.size);
> +       ida_init(&dev->inst_ida);
> +
> +       dev_dbg(&pdev->dev, "REGISTER BASE daddr=3D%pad vaddr=3D%p size=
=3D%zu\n",
> +               &dev->vdb_register.daddr, dev->vdb_register.vaddr, dev->v=
db_register.size);
> +

This dev_dbg makes little sense.

> +       mutex_init(&dev->dev_lock);
> +       mutex_init(&dev->hw_lock);
> +       init_completion(&dev->irq_done);
> +       dev_set_drvdata(&pdev->dev, dev);
> +       dev->dev =3D &pdev->dev;
> +       dev->product_code =3D vdi_read_register(dev, VPU_PRODUCT_CODE_REG=
ISTER);
> +       err =3D vdi_init(&pdev->dev);
> +       if (err < 0) {
> +               dev_err(&pdev->dev, "failed to init vdi: %d\n", err);
> +               return err;
> +       }
> +       dev->product =3D wave_vpu_get_product_id(dev);
> +
> +       err =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +       if (err) {
> +               dev_err(&pdev->dev, "v4l2_device_register fail: %d\n", er=
r);
> +               goto err_v4l2_dev_reg;
> +       }
> +
> +       dev->v4l2_m2m_dev =3D v4l2_m2m_init(&vpu_m2m_ops);
> +       if (IS_ERR(dev->v4l2_m2m_dev)) {
> +               dev_err(&pdev->dev, "v4l2_m2m_init fail: %ld\n", PTR_ERR(=
dev->v4l2_m2m_dev));
> +               err =3D PTR_ERR(dev->v4l2_m2m_dev);
> +               goto err_m2m_init;
> +       }
> +
> +       if (match_data->decoder) {
> +               err =3D vpu_dec_register_device(dev);
> +               if (err) {
> +                       dev_err(&pdev->dev, "vpu_dec_register_device fail=
: %d\n", err);
> +                       goto err_dec_reg;
> +               }
> +       }
> +       if (match_data->encoder) {
> +               err =3D vpu_enc_register_device(dev);
> +               if (err) {
> +                       dev_err(&pdev->dev, "vpu_enc_register_device fail=
: %d\n", err);
> +                       goto err_enc_reg;
> +               }
> +       }
> +
> +       dev->clk =3D devm_clk_get(&pdev->dev, VPU_CLK_NAME);
> +       if (IS_ERR(dev->clk)) {
> +               dev_warn(&pdev->dev, "unable to get clock: %ld\n", PTR_ER=
R(dev->clk));
> +               /* continue wihtout clock, assume externally managed */
> +               dev->clk =3D NULL;
> +       }
> +
> +       err =3D clk_prepare_enable(dev->clk);

Are you sure you actually need to enable the clock in probe()?

> +       if (err) {
> +               dev_err(&pdev->dev, "failed to enable clock: %d\n", err);
> +               goto err_clk_prep_en;
> +       }
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +       if (!res) {
> +               dev_err(&pdev->dev, "failed to get irq resource\n");
> +               err =3D -ENXIO;
> +               goto err_get_irq;
> +       }
> +       dev->irq =3D res->start;
> +
> +       if (kfifo_alloc(&dev->irq_status, 16 * sizeof(int), GFP_KERNEL)) =
{
> +               dev_err(&pdev->dev, "failed to allocate fifo\n");
> +               goto err_kfifo_alloc;
> +       }
> +
> +       err =3D devm_request_threaded_irq(&pdev->dev, dev->irq, vpu_irq, =
vpu_irq_thread, 0, "vpu_irq", dev);
> +       if (err) {
> +               dev_err(&pdev->dev, "fail to register interrupt handler: =
%d\n", err);
> +               goto err_request_irq;
> +       }
> +
> +       err =3D vpu_load_firmware(&pdev->dev, match_data->fw_name);
> +       if (err) {
> +               dev_err(&pdev->dev, "failed to vpu_load_firmware: %d\n", =
err);
> +               goto err_load_fw;
> +       }
> +
> +       return 0;
> +
> +err_load_fw:
> +err_request_irq:
> +       kfifo_free(&dev->irq_status);
> +err_kfifo_alloc:
> +err_get_irq:
> +       clk_disable_unprepare(dev->clk);
> +err_clk_prep_en:
> +       if (match_data->encoder)
> +               vpu_enc_unregister_device(dev);
> +err_enc_reg:
> +       if (match_data->decoder)
> +               vpu_dec_unregister_device(dev);
> +err_dec_reg:
> +       v4l2_m2m_release(dev->v4l2_m2m_dev);
> +err_m2m_init:
> +       v4l2_device_unregister(&dev->v4l2_dev);
> +err_v4l2_dev_reg:
> +       vdi_release(&pdev->dev);
> +
> +       return err;
> +}
> +
> +static int vpu_remove(struct platform_device *pdev)
> +{
> +       struct vpu_device *dev =3D dev_get_drvdata(&pdev->dev);
> +
> +       clk_disable_unprepare(dev->clk);
> +       vpu_enc_unregister_device(dev);
> +       vpu_dec_unregister_device(dev);
> +       v4l2_m2m_release(dev->v4l2_m2m_dev);
> +       v4l2_device_unregister(&dev->v4l2_dev);
> +       kfifo_free(&dev->irq_status);
> +       vdi_release(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +const struct wave5_match_data wave511_data =3D {
> +       .decoder =3D true,
> +       .encoder =3D false,
> +       .fw_name =3D "wave511_dec_fw.bin",
> +};
> +
> +const struct wave5_match_data wave521_data =3D {
> +       .decoder =3D false,
> +       .encoder =3D true,
> +       .fw_name =3D "wave521_enc_fw.bin",
> +};
> +
> +const struct wave5_match_data wave521c_data =3D {
> +       .decoder =3D true,
> +       .encoder =3D true,
> +       .fw_name =3D "wave521c_codec_fw.bin",
> +};

Can you move default_match_data here?

> +
> +// TODO: move this file to wave5 layer and convert runtime paramer filli=
ng to
> +// predefined structure used as data here.
> +static const struct of_device_id wave5_dt_ids[] =3D {
> +       { .compatible =3D "cnm,cm511-vpu", .data =3D &wave511_data },
> +       { .compatible =3D "cnm,cm517-vpu", .data =3D &default_match_data =
},
> +       { .compatible =3D "cnm,cm521-vpu", .data =3D &wave521_data },
> +       { .compatible =3D "cnm,cm521c-vpu", .data =3D &wave521c_data },
> +       { .compatible =3D "cnm,cm521c-dual-vpu", .data =3D &wave521c_data=
 },
> +       { .compatible =3D "cnm,cm521e1-vpu", .data =3D &default_match_dat=
a },
> +       { .compatible =3D "cnm,cm537-vpu", .data =3D &default_match_data =
},
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, wave5_dt_ids);
> +#endif
> +
> +static struct platform_driver vpu_driver =3D {
> +       .driver =3D {
> +               .name =3D VPU_PLATFORM_DEVICE_NAME,
> +               .of_match_table =3D of_match_ptr(wave5_dt_ids),
> +               },
> +       .probe =3D vpu_probe,
> +       .remove =3D vpu_remove,
> +       //.suspend =3D vpu_suspend,
> +       //.resume =3D vpu_resume,
> +};
> +
> +static int __init vpu_init(void)

So through all these files, I'd like to see a wave5_ prefix
for all the functions. This is important even for static functions.

I'm aware it may seem not strongly enforced, but you can
imagine how hard it would be for any code navigation tool to work
if every driver would have functions named as vpu_probe, vpu_init,
set_default_format, just to name a few.

> +{
> +       int ret;
> +
> +       ret =3D platform_driver_register(&vpu_driver);
> +
> +       return ret;
> +}
> +
> +static void __exit vpu_exit(void)
> +{
> +       platform_driver_unregister(&vpu_driver);
> +}
> +
> +MODULE_DESCRIPTION("chips&media VPU V4L2 driver");
> +MODULE_LICENSE("GPL");

This file says GPL-2 or BSD-3-Clause in the header. Is it OK to have "GPL" =
here?

> +
> +module_init(vpu_init);
> +module_exit(vpu_exit);

Use module_platform_driver.

> +
> diff --git a/drivers/staging/media/wave5/v4l2/vpu.h b/drivers/staging/med=
ia/wave5/v4l2/vpu.h
> new file mode 100644
> index 000000000000..402873eb0d2d
> --- /dev/null
> +++ b/drivers/staging/media/wave5/v4l2/vpu.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Wave5 series multi-standard codec IP - basic types
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +#ifndef __VPU_DRV_H__
> +#define __VPU_DRV_H__
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-vmalloc.h>
> +#include "../vpuapi/vpuconfig.h"
> +#include "../vpuapi/vpuapi.h"
> +
> +#define DPRINTK(dev, level, fmt, args...) \
> +       v4l2_dbg(level, vpu_debug, &(dev)->v4l2_dev, "[%s]" fmt, __func__=
, ##args)
> +
> +#define VPU_BUF_SYNC_TO_DEVICE 0
> +#define VPU_BUF_SYNC_FROM_DEVICE 1
> +struct vpu_platform_data {
> +       struct vb2_mem_ops *mem_ops;
> +       int (*pre_fw_init)(struct device *dev, void __iomem *base);
> +       uint32_t (*read_register)(struct device *dev, void __iomem *base,=
 uint32_t reg);
> +       void (*write_register)(struct device *dev, void __iomem *base, ui=
nt32_t reg, uint32_t data);
> +       int (*buffer_sync)(struct device *dev, void __iomem *base, struct=
 vpu_buf *vb, size_t offset, uint32_t len, int dir);
> +       int (*buffer_alloc)(struct device *dev, struct vpu_buf *vb);
> +       void (*buffer_free)(struct device *dev, struct vpu_buf *vb);
> +       int (*reset)(struct device *dev, void __iomem *base);
> +       uint32_t (*get_hwoption)(struct device *dev);
> +};
> +
> +struct vpu_buffer {
> +       struct v4l2_m2m_buffer v4l2_m2m_buf;
> +       bool                   consumed;
> +};
> +
> +enum vpu_format_type {
> +       VPU_FMT_TYPE_CODEC =3D 0,
> +       VPU_FMT_TYPE_RAW   =3D 1
> +};
> +
> +struct vpu_format {
> +       unsigned int v4l2_pix_fmt;
> +       unsigned int num_planes;
> +       unsigned int max_width;
> +       unsigned int min_width;
> +       unsigned int max_height;
> +       unsigned int min_height;
> +};
> +
> +extern unsigned int vpu_debug;
> +
> +static inline struct vpu_instance *to_vpu_inst(struct v4l2_fh *vfh)
> +{
> +       return container_of(vfh, struct vpu_instance, v4l2_fh);
> +}
> +
> +static inline struct vpu_instance *ctrl_to_vpu_inst(struct v4l2_ctrl *vc=
trl)
> +{
> +       return container_of(vctrl->handler, struct vpu_instance, v4l2_ctr=
l_hdl);
> +}
> +
> +static inline struct vpu_buffer *to_vpu_buf(struct vb2_v4l2_buffer *vbuf=
)
> +{
> +       return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
> +}
> +
> +int vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
> +
> +#endif
> +
> diff --git a/drivers/staging/media/wave5/v4l2/vpu_dec.c b/drivers/staging=
/media/wave5/v4l2/vpu_dec.c
> new file mode 100644
> index 000000000000..6cc00becb291
> --- /dev/null
> +++ b/drivers/staging/media/wave5/v4l2/vpu_dec.c
> @@ -0,0 +1,1393 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Wave5 series multi-standard codec IP - decoder interface
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +#include "vpu_dec.h"
> +
> +static const struct vpu_format vpu_dec_fmt_list[2][6] =3D {
> +       [VPU_FMT_TYPE_CODEC] =3D {
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_HEVC,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_H264,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 32,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 32,
> +               },
> +       },
> +       [VPU_FMT_TYPE_RAW] =3D {
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12,
> +                       .num_planes   =3D 1,


You shouldn't need num_planes here, you normally can
get all that stuff using the v4l2_fill_pixfmt_ helpers.


> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420M,
> +                       .num_planes   =3D 3,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12M,
> +                       .num_planes   =3D 2,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
> +                       .num_planes   =3D 2,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +       }
> +};
> +
> +static enum wave_std to_vpu_codstd(unsigned int v4l2_pix_fmt)
> +{
> +       switch (v4l2_pix_fmt) {
> +       case V4L2_PIX_FMT_H264:
> +               return W_AVC_DEC;
> +       case V4L2_PIX_FMT_HEVC:
> +               return W_HEVC_DEC;
> +       default:
> +               return STD_UNKNOWN;
> +       }
> +}
> +
> +static const struct vpu_format *find_vpu_format(unsigned int v4l2_pix_fm=
t, enum vpu_format_type type)
> +{
> +       unsigned int index;
> +
> +       for (index =3D 0; index < ARRAY_SIZE(vpu_dec_fmt_list[type]); ind=
ex++) {
> +               if (vpu_dec_fmt_list[type][index].v4l2_pix_fmt =3D=3D v4l=
2_pix_fmt)
> +                       return &vpu_dec_fmt_list[type][index];
> +       }
> +
> +       return NULL;
> +}
> +
> +static const struct vpu_format *find_vpu_format_by_index(unsigned int in=
dex, enum vpu_format_type type)
> +{
> +       if (index >=3D ARRAY_SIZE(vpu_dec_fmt_list[type]))
> +               return NULL;
> +
> +       if (vpu_dec_fmt_list[type][index].v4l2_pix_fmt =3D=3D 0)
> +               return NULL;
> +
> +       return &vpu_dec_fmt_list[type][index];
> +}
> +
> +static void handle_bitstream_buffer(struct vpu_instance *inst)
> +{
> +       struct v4l2_m2m_buffer *v4l2_m2m_buf =3D NULL;
> +
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&inst->bitstream_lock, flags);
> +
> +       v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
> +               enum ret_code                 ret_code =3D RETCODE_SUCCES=
S;
> +               struct vb2_v4l2_buffer *vbuf    =3D &v4l2_m2m_buf->vb;
> +               struct vpu_buffer      *vpu_buf =3D to_vpu_buf(vbuf);
> +               u32                  src_size =3D vb2_get_plane_payload(&=
vbuf->vb2_buf, 0);
> +               void                   *src_buf  =3D vb2_plane_vaddr(&vbu=
f->vb2_buf, 0);
> +               dma_addr_t         bs_rd_ptr =3D 0;
> +               dma_addr_t         bs_wr_ptr =3D 0;
> +               u32                  bs_remain_size =3D 0;
> +               size_t offset;

Fix indentation.

> +
> +               if (vpu_buf->consumed) {
> +                       DPRINTK(inst->dev, 1, "already consumed buffer\n"=
);
> +                       continue;
> +               }
> +
> +               vpu_dec_get_bitstream_buffer(inst, &bs_rd_ptr, &bs_wr_ptr=
, &bs_remain_size);
> +
> +               if (bs_remain_size < src_size) {
> +                       DPRINTK(inst->dev, 1, "fill next time : remained =
size < source size.\n");
> +                       continue;
> +               }
> +
> +               offset =3D bs_wr_ptr - inst->bitstream_vbuf.daddr;
> +               if (bs_wr_ptr + src_size > inst->bitstream_vbuf.daddr + i=
nst->bitstream_vbuf.size) {
> +                       int temp_size;
> +
> +                       temp_size =3D inst->bitstream_vbuf.daddr + inst->=
bitstream_vbuf.size - bs_wr_ptr;
> +                       vdi_write_memory(inst->dev, &inst->bitstream_vbuf=
, offset, src_buf,
> +                                        temp_size, VDI_128BIT_LITTLE_END=
IAN);
> +                       vdi_write_memory(inst->dev, &inst->bitstream_vbuf=
, 0,
> +                                        src_buf + temp_size, src_size - =
temp_size, VDI_128BIT_LITTLE_ENDIAN);
> +               } else {
> +                       vdi_write_memory(inst->dev, &inst->bitstream_vbuf=
, offset, src_buf,
> +                                        src_size, VDI_128BIT_LITTLE_ENDI=
AN);
> +               }
> +
> +               ret_code =3D vpu_dec_update_bitstream_buffer(inst, src_si=
ze);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       DPRINTK(inst->dev, 1, "failed to call vpu_dec_upd=
ate_bitstream_buffer() : %d\n", ret_code);
> +                       continue;
> +               }
> +
> +               vpu_buf->consumed =3D TRUE;
> +
> +               if (inst->state =3D=3D VPU_INST_STATE_WAIT_BUF)
> +                       inst->state =3D VPU_INST_STATE_PIC_RUN;
> +       }
> +
> +       spin_unlock_irqrestore(&inst->bitstream_lock, flags);
> +}
> +
> +static void handle_src_buffer(struct vpu_instance *inst)
> +{
> +       struct vb2_v4l2_buffer *src_buf;
> +
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&inst->bitstream_lock, flags);
> +
> +       src_buf =3D v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
> +       if (src_buf) {
> +               struct vpu_buffer *vpu_buf =3D to_vpu_buf(src_buf);
> +
> +               if (vpu_buf->consumed) {
> +                       u32 remain_num =3D 0;
> +
> +                       DPRINTK(inst->dev, 1, "already consumed buffer\n"=
);
> +                       remain_num =3D v4l2_m2m_num_src_bufs_ready(inst->=
v4l2_fh.m2m_ctx);
> +                       DPRINTK(inst->dev, 1, "remain buffer : %d\n", rem=
ain_num);
> +                       if (remain_num > 1) {
> +                               src_buf =3D v4l2_m2m_src_buf_remove(inst-=
>v4l2_fh.m2m_ctx);
> +                               inst->timestamp =3D src_buf->vb2_buf.time=
stamp;
> +                               v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_=
DONE);
> +                       }
> +               }
> +       }
> +       spin_unlock_irqrestore(&inst->bitstream_lock, flags);
> +}
> +
> +static void update_resolution_info(struct v4l2_pix_format_mplane *pix_mp=
, unsigned int width, unsigned int height)
> +{
> +       switch (pix_mp->pixelformat) {
> +       case V4L2_PIX_FMT_YUV420:
> +       case V4L2_PIX_FMT_NV12:
> +       case V4L2_PIX_FMT_NV21:
> +               pix_mp->width  =3D round_up(width, 32);
> +               pix_mp->height =3D height;
> +               pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32)=
;
> +               pix_mp->plane_fmt[0].sizeimage    =3D width * height * 3 =
/ 2;
> +               memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->=
plane_fmt[0].reserved));
> +               break;
> +       case V4L2_PIX_FMT_YUV420M:
> +               pix_mp->width  =3D round_up(width, 32);
> +               pix_mp->height =3D height;
> +               pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32)=
;
> +               pix_mp->plane_fmt[0].sizeimage    =3D width * height;
> +               memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->=
plane_fmt[0].reserved));
> +               pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32)=
 / 2;
> +               pix_mp->plane_fmt[1].sizeimage    =3D width * height / 4;
> +               memset(&pix_mp->plane_fmt[1].reserved, 0, sizeof(pix_mp->=
plane_fmt[1].reserved));
> +               pix_mp->plane_fmt[2].bytesperline =3D round_up(width, 32)=
 / 2;
> +               pix_mp->plane_fmt[2].sizeimage    =3D width * height / 4;
> +               memset(&pix_mp->plane_fmt[2].reserved, 0, sizeof(pix_mp->=
plane_fmt[2].reserved));
> +               break;
> +       case V4L2_PIX_FMT_NV12M:
> +       case V4L2_PIX_FMT_NV21M:
> +               pix_mp->width  =3D round_up(width, 32);

Yet more indentation issues.

> +               pix_mp->height =3D height;
> +               pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32)=
;
> +               pix_mp->plane_fmt[0].sizeimage    =3D width * height;
> +               memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->=
plane_fmt[0].reserved));
> +               pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32)=
;
> +               pix_mp->plane_fmt[1].sizeimage    =3D width * height / 2;
> +               memset(&pix_mp->plane_fmt[1].reserved, 0, sizeof(pix_mp->=
plane_fmt[1].reserved));
> +               break;
> +       default:
> +               pix_mp->width  =3D width;
> +               pix_mp->height =3D height;
> +               pix_mp->plane_fmt[0].bytesperline =3D 0;
> +               pix_mp->plane_fmt[0].sizeimage    =3D width * height / 2;
> +               memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->=
plane_fmt[0].reserved));
> +               break;
> +       }
> +}
> +
> +static void vpu_dec_start_decode(struct vpu_instance *inst)
> +{
> +       struct dec_param pic_param;
> +       struct queue_status_info q_status;
> +       u32 remain_cmd_q, max_cmd_q =3D 0;
> +
> +       memset(&pic_param, 0, sizeof(struct dec_param));
> +
> +       vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> +       DPRINTK(inst->dev, 1, "min_src_buf_cnt : %d | default : %d | qcou=
nt : %d | report_q : %d\n",
> +               inst->min_src_frame_buf_count, COMMAND_QUEUE_DEPTH, q_sta=
tus.instance_queue_count,
> +               q_status.report_queue_count);
> +
> +       max_cmd_q    =3D (inst->min_src_frame_buf_count < COMMAND_QUEUE_D=
EPTH) ?

Indentation issues all over the place :-) Please fix.

> +               inst->min_src_frame_buf_count : COMMAND_QUEUE_DEPTH;
> +       remain_cmd_q =3D max_cmd_q - q_status.instance_queue_count;
> +
> +       while (remain_cmd_q) {
> +               enum ret_code ret_code;
> +
> +               ret_code =3D vpu_dec_start_one_frame(inst, &pic_param);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       if (ret_code !=3D RETCODE_QUEUEING_FAILURE) {
> +                               struct vb2_v4l2_buffer *src_buf =3D
> +                                       v4l2_m2m_src_buf_remove(inst->v4l=
2_fh.m2m_ctx);
> +
> +                               inst->state =3D VPU_INST_STATE_STOP;
> +                               v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_=
ERROR);
> +                               break;
> +                       }
> +               } else {
> +                       DPRINTK(inst->dev, 1, "vpu_dec_start_one_frame su=
ccess %d\n", ret_code);
> +               }
> +
> +               remain_cmd_q--;
> +       }
> +}
> +
> +static void vpu_dec_stop_decode(struct vpu_instance *inst)
> +{
> +       u32 i;
> +       unsigned long flags;
> +
> +       inst->state =3D VPU_INST_STATE_STOP;
> +
> +       spin_lock_irqsave(&inst->bitstream_lock, flags);
> +       vpu_dec_update_bitstream_buffer(inst, 0);
> +       spin_unlock_irqrestore(&inst->bitstream_lock, flags);
> +
> +       for (i =3D 0; i < inst->min_dst_frame_buf_count; i++) {
> +               vpu_dec_clr_disp_flag(inst, i);
> +               DPRINTK(inst->dev, 1, "clear display flag : %d\n", i);
> +       }
> +}
> +
> +static void vpu_dec_finish_decode(struct vpu_instance *inst)
> +{
> +       struct dec_output_info dec_output_info;
> +       enum ret_code ret_code;
> +       int irq_status;
> +
> +       if (kfifo_out(&inst->dev->irq_status, &irq_status, sizeof(int)))
> +               vpu_clear_interrupt_ex(inst, irq_status);
> +
> +       if (irq_status & (1 << INT_WAVE5_BSBUF_EMPTY)) {
> +               DPRINTK(inst->dev, 1, "bitstream EMPTY!!!!\n");
> +               inst->state =3D VPU_INST_STATE_WAIT_BUF;
> +               handle_src_buffer(inst);
> +               handle_bitstream_buffer(inst);
> +       }
> +
> +       if (irq_status & (1 << INT_WAVE5_DEC_PIC)) {
> +               ret_code =3D vpu_dec_get_output_info(inst, &dec_output_in=
fo);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst=
->v4l2_fh.m2m_ctx);
> +               } else {
> +                       if (inst->state =3D=3D VPU_INST_STATE_STOP) {
> +                               struct queue_status_info q_status;
> +
> +                               if (dec_output_info.index_frame_display >=
=3D 0)
> +                                       vpu_dec_clr_disp_flag(inst, dec_o=
utput_info.index_frame_display);
> +
> +                               vpu_dec_give_command(inst, DEC_GET_QUEUE_=
STATUS, &q_status);
> +
> +                               if (q_status.report_queue_count + q_statu=
s.instance_queue_count =3D=3D 0)
> +                                       v4l2_m2m_job_finish(inst->dev->v4=
l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
> +                       } else if (dec_output_info.index_frame_decoded =
=3D=3D DECODED_IDX_FLAG_NO_FB &&
> +                                       dec_output_info.index_frame_displ=
ay =3D=3D DISPLAY_IDX_FLAG_NO_FB) {
> +                               DPRINTK(inst->dev, 1, "no more frame buff=
er\n");
> +                               inst->state =3D VPU_INST_STATE_WAIT_BUF;
> +                       } else {
> +                               handle_src_buffer(inst);
> +
> +                               if (dec_output_info.index_frame_display >=
=3D 0) {
> +                                       struct vb2_v4l2_buffer *dst_buf =
=3D
> +                                               v4l2_m2m_dst_buf_remove_b=
y_idx(inst->v4l2_fh.m2m_ctx,
> +                                                                        =
      dec_output_info.index_frame_display);
> +                                       int stride =3D dec_output_info.di=
sp_frame.stride;
> +                                       int height =3D dec_output_info.di=
sp_pic_height;
> +
> +                                       if (inst->dst_fmt.num_planes =3D=
=3D 1) {
> +                                               vb2_set_plane_payload(&ds=
t_buf->vb2_buf, 0,
> +                                                                     (st=
ride * height * 3 / 2));
> +                                       } else if (inst->dst_fmt.num_plan=
es =3D=3D 2) {
> +                                               vb2_set_plane_payload(&ds=
t_buf->vb2_buf, 0,
> +                                                                     (st=
ride * height));
> +                                               vb2_set_plane_payload(&ds=
t_buf->vb2_buf, 1,
> +                                                                     ((s=
tride / 2) * height));
> +                                       } else if (inst->dst_fmt.num_plan=
es =3D=3D 3) {
> +                                               vb2_set_plane_payload(&ds=
t_buf->vb2_buf, 0,
> +                                                                     (st=
ride * height));
> +                                               vb2_set_plane_payload(&ds=
t_buf->vb2_buf, 1,
> +                                                                     ((s=
tride / 2) * (height / 2)));
> +                                               vb2_set_plane_payload(&ds=
t_buf->vb2_buf, 2,
> +                                                                     ((s=
tride / 2) * (height / 2)));
> +                                       }
> +
> +                                       dst_buf->vb2_buf.timestamp =3D in=
st->timestamp;
> +                                       dst_buf->field =3D V4L2_FIELD_NON=
E;
> +                                       v4l2_m2m_buf_done(dst_buf, VB2_BU=
F_STATE_DONE);
> +                               } else if (dec_output_info.index_frame_di=
splay =3D=3D DISPLAY_IDX_FLAG_SEQ_END) {
> +                                       static const struct v4l2_event vp=
u_event_eos =3D {
> +                                               .type =3D V4L2_EVENT_EOS
> +                                       };
> +
> +                                       DPRINTK(inst->dev, 1, "stream end=
\n");
> +                                       inst->state =3D VPU_INST_STATE_ST=
OP;
> +                                       v4l2_event_queue_fh(&inst->v4l2_f=
h, &vpu_event_eos);
> +                               }
> +
> +                               if (!kfifo_len(&inst->dev->irq_status))
> +                                       v4l2_m2m_job_finish(inst->dev->v4=
l2_m2m_dev,
> +                                                           inst->v4l2_fh=
.m2m_ctx);
> +                       }
> +               }
> +       }
> +}
> +
> +static int vpu_dec_querycap(struct file *file, void *fh, struct v4l2_cap=
ability *cap)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       strscpy(cap->driver,   VPU_DEC_DRV_NAME,            sizeof(cap->d=
river));
> +       strscpy(cap->card,     VPU_DEC_DRV_NAME,            sizeof(cap->c=
ard));
> +       strscpy(cap->bus_info, "platform:" VPU_DEC_DRV_NAME, sizeof(cap->=
bus_info));
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_enum_framesizes(struct file *file, void *fh, struct v=
4l2_frmsizeenum *fsize)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       if (fsize->index)
> +               return -EINVAL;
> +
> +       vpu_fmt =3D find_vpu_format(fsize->pixel_format, VPU_FMT_TYPE_COD=
EC);
> +       if (!vpu_fmt) {
> +               vpu_fmt =3D find_vpu_format(fsize->pixel_format, VPU_FMT_=
TYPE_RAW);
> +               if (!vpu_fmt)
> +                       return -EINVAL;
> +       }
> +
> +       fsize->type                 =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +       fsize->stepwise.min_width   =3D vpu_fmt->min_width;
> +       fsize->stepwise.max_width   =3D vpu_fmt->max_width;
> +       fsize->stepwise.step_width  =3D 1;
> +       fsize->stepwise.min_height  =3D vpu_fmt->min_height;
> +       fsize->stepwise.max_height  =3D vpu_fmt->max_height;
> +       fsize->stepwise.step_height =3D 1;
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_enum_fmt_cap(struct file *file, void *fh, struct v4l2=
_fmtdesc *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "index : %d\n", f->index);
> +
> +       vpu_fmt =3D find_vpu_format_by_index(f->index, VPU_FMT_TYPE_RAW);
> +       if (!vpu_fmt)
> +               return -EINVAL;
> +
> +       f->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +       f->flags       =3D 0;
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_=
format *f)
> +{
> +       struct vpu_instance     *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "4cc %d width %d height %d num_planes %d co=
lorspace %d field : %d\n",
> +               f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pi=
x_mp.height,
> +               f->fmt.pix_mp.num_planes, f->fmt.pix_mp.colorspace, f->fm=
t.pix_mp.field);
> +
> +       if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +               return -EINVAL;
> +
> +       vpu_fmt =3D find_vpu_format(f->fmt.pix_mp.pixelformat, VPU_FMT_TY=
PE_RAW);
> +       if (!vpu_fmt) {
> +               f->fmt.pix_mp.pixelformat =3D inst->dst_fmt.pixelformat;
> +               f->fmt.pix_mp.num_planes  =3D inst->dst_fmt.num_planes;
> +               update_resolution_info(&f->fmt.pix_mp, inst->dst_fmt.widt=
h, inst->dst_fmt.height);
> +       } else {
> +               f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +               f->fmt.pix_mp.num_planes  =3D vpu_fmt->num_planes;
> +               update_resolution_info(&f->fmt.pix_mp, clamp(f->fmt.pix_m=
p.width,
> +                                                            vpu_fmt->min=
_width, vpu_fmt->max_width),
> +                               clamp(f->fmt.pix_mp.height, vpu_fmt->min_=
height,
> +                                     vpu_fmt->max_height));
> +       }
> +
> +       f->fmt.pix_mp.flags        =3D 0;
> +       f->fmt.pix_mp.field        =3D V4L2_FIELD_NONE;
> +       f->fmt.pix_mp.colorspace   =3D inst->colorspace;
> +       f->fmt.pix_mp.ycbcr_enc    =3D inst->ycbcr_enc;
> +       f->fmt.pix_mp.hsv_enc      =3D inst->hsv_enc;
> +       f->fmt.pix_mp.quantization =3D inst->quantization;
> +       f->fmt.pix_mp.xfer_func    =3D inst->xfer_func;
> +       memset(&f->fmt.pix_mp.reserved, 0, sizeof(f->fmt.pix_mp.reserved)=
);
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_fo=
rmat *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int i, ret;
> +
> +       DPRINTK(inst->dev, 1, "4cc %d width %d height %d num_planes %d co=
lorspace %d field %d\n",
> +               f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pi=
x_mp.height,
> +               f->fmt.pix_mp.num_planes, f->fmt.pix_mp.colorspace, f->fm=
t.pix_mp.field);
> +
> +       ret =3D vpu_dec_try_fmt_cap(file, fh, f);
> +       if (ret)
> +               return ret;
> +
> +       inst->dst_fmt.width        =3D f->fmt.pix_mp.width;
> +       inst->dst_fmt.height       =3D f->fmt.pix_mp.height;
> +       inst->dst_fmt.pixelformat  =3D f->fmt.pix_mp.pixelformat;
> +       inst->dst_fmt.field        =3D f->fmt.pix_mp.field;
> +       inst->dst_fmt.flags        =3D f->fmt.pix_mp.flags;
> +       inst->dst_fmt.num_planes   =3D f->fmt.pix_mp.num_planes;
> +       for (i =3D 0; i < inst->dst_fmt.num_planes; i++) {
> +               inst->dst_fmt.plane_fmt[i].bytesperline =3D f->fmt.pix_mp=
.plane_fmt[i].bytesperline;
> +               inst->dst_fmt.plane_fmt[i].sizeimage    =3D f->fmt.pix_mp=
.plane_fmt[i].sizeimage;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_fo=
rmat *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int i;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       f->fmt.pix_mp.width        =3D inst->dst_fmt.width;
> +       f->fmt.pix_mp.height       =3D inst->dst_fmt.height;
> +       f->fmt.pix_mp.pixelformat  =3D inst->dst_fmt.pixelformat;
> +       f->fmt.pix_mp.field        =3D inst->dst_fmt.field;
> +       f->fmt.pix_mp.flags        =3D inst->dst_fmt.flags;
> +       f->fmt.pix_mp.num_planes   =3D inst->dst_fmt.num_planes;
> +       for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
> +               f->fmt.pix_mp.plane_fmt[i].bytesperline =3D inst->dst_fmt=
.plane_fmt[i].bytesperline;
> +               f->fmt.pix_mp.plane_fmt[i].sizeimage    =3D inst->dst_fmt=
.plane_fmt[i].sizeimage;
> +       }
> +
> +       f->fmt.pix_mp.colorspace   =3D inst->colorspace;
> +       f->fmt.pix_mp.ycbcr_enc    =3D inst->ycbcr_enc;
> +       f->fmt.pix_mp.hsv_enc      =3D inst->hsv_enc;
> +       f->fmt.pix_mp.quantization =3D inst->quantization;
> +       f->fmt.pix_mp.xfer_func    =3D inst->xfer_func;
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2=
_fmtdesc *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "index : %d\n", f->index);
> +
> +       vpu_fmt =3D find_vpu_format_by_index(f->index, VPU_FMT_TYPE_CODEC=
);
> +       if (!vpu_fmt)
> +               return -EINVAL;
> +
> +       f->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +       f->flags       =3D 0;
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_=
format *f)
> +{
> +       struct vpu_instance     *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "4cc %d width %d height %d num_planes %d co=
lorspace %d field %d\n",
> +               f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pi=
x_mp.height,
> +               f->fmt.pix_mp.num_planes, f->fmt.pix_mp.colorspace, f->fm=
t.pix_mp.field);
> +
> +       if (f->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               return -EINVAL;
> +
> +       vpu_fmt =3D find_vpu_format(f->fmt.pix_mp.pixelformat, VPU_FMT_TY=
PE_CODEC);
> +       if (!vpu_fmt) {
> +               f->fmt.pix_mp.pixelformat =3D inst->src_fmt.pixelformat;
> +               f->fmt.pix_mp.num_planes  =3D inst->src_fmt.num_planes;
> +               update_resolution_info(&f->fmt.pix_mp, inst->src_fmt.widt=
h, inst->src_fmt.height);
> +       } else {
> +               f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +               f->fmt.pix_mp.num_planes  =3D vpu_fmt->num_planes;
> +               update_resolution_info(&f->fmt.pix_mp, clamp(f->fmt.pix_m=
p.width,
> +                                                            vpu_fmt->min=
_width, vpu_fmt->max_width),
> +                               clamp(f->fmt.pix_mp.height, vpu_fmt->min_=
height,
> +                                     vpu_fmt->max_height));
> +       }
> +
> +       f->fmt.pix_mp.flags =3D 0;
> +       f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> +       memset(&f->fmt.pix_mp.reserved, 0, sizeof(f->fmt.pix_mp.reserved)=
);
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_fo=
rmat *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int i, ret;
> +
> +       DPRINTK(inst->dev, 1, "pixelformat %d width %d height %d num_plan=
es %d  field : %d\n",
> +               f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pi=
x_mp.height,
> +               f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
> +
> +       ret =3D vpu_dec_try_fmt_out(file, fh, f);
> +       if (ret)
> +               return ret;
> +
> +       inst->src_fmt.width        =3D f->fmt.pix_mp.width;
> +       inst->src_fmt.height       =3D f->fmt.pix_mp.height;
> +       inst->src_fmt.pixelformat  =3D f->fmt.pix_mp.pixelformat;
> +       inst->src_fmt.field        =3D f->fmt.pix_mp.field;
> +       inst->src_fmt.flags        =3D f->fmt.pix_mp.flags;
> +       inst->src_fmt.num_planes   =3D f->fmt.pix_mp.num_planes;
> +       for (i =3D 0; i < inst->src_fmt.num_planes; i++) {
> +               inst->src_fmt.plane_fmt[i].bytesperline =3D f->fmt.pix_mp=
.plane_fmt[i].bytesperline;
> +               inst->src_fmt.plane_fmt[i].sizeimage    =3D f->fmt.pix_mp=
.plane_fmt[i].sizeimage;
> +       }
> +
> +       inst->colorspace   =3D f->fmt.pix_mp.colorspace;
> +       inst->ycbcr_enc    =3D f->fmt.pix_mp.ycbcr_enc;
> +       inst->hsv_enc      =3D f->fmt.pix_mp.hsv_enc;
> +       inst->quantization =3D f->fmt.pix_mp.quantization;
> +       inst->xfer_func    =3D f->fmt.pix_mp.xfer_func;
> +
> +       update_resolution_info(&inst->dst_fmt, f->fmt.pix_mp.width, f->fm=
t.pix_mp.height);
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_g_fmt_out(struct file *file, void *fh, struct v4l2_fo=
rmat *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int i;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       f->fmt.pix_mp.width        =3D inst->src_fmt.width;
> +       f->fmt.pix_mp.height       =3D inst->src_fmt.height;
> +       f->fmt.pix_mp.pixelformat  =3D inst->src_fmt.pixelformat;
> +       f->fmt.pix_mp.field        =3D inst->src_fmt.field;
> +       f->fmt.pix_mp.flags        =3D inst->src_fmt.flags;
> +       f->fmt.pix_mp.num_planes   =3D inst->src_fmt.num_planes;
> +       for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
> +               f->fmt.pix_mp.plane_fmt[i].bytesperline =3D inst->src_fmt=
.plane_fmt[i].bytesperline;
> +               f->fmt.pix_mp.plane_fmt[i].sizeimage    =3D inst->src_fmt=
.plane_fmt[i].sizeimage;
> +       }
> +
> +       f->fmt.pix_mp.colorspace   =3D inst->colorspace;
> +       f->fmt.pix_mp.ycbcr_enc    =3D inst->ycbcr_enc;
> +       f->fmt.pix_mp.hsv_enc      =3D inst->hsv_enc;
> +       f->fmt.pix_mp.quantization =3D inst->quantization;
> +       f->fmt.pix_mp.xfer_func    =3D inst->xfer_func;
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_=
selection *s)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "type : %d | target : %d\n", s->type, s->ta=
rget);
> +
> +       if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> +               switch (s->target) {
> +               case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +               case V4L2_SEL_TGT_COMPOSE_PADDED:
> +                       s->r.left   =3D 0;
> +                       s->r.top    =3D 0;
> +                       s->r.width  =3D inst->dst_fmt.width;
> +                       s->r.height =3D inst->dst_fmt.height;
> +                       break;
> +               case V4L2_SEL_TGT_COMPOSE:
> +               case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +                       s->r.left   =3D 0;
> +                       s->r.top    =3D 0;
> +                       s->r.width  =3D inst->src_fmt.width;
> +                       s->r.height =3D inst->src_fmt.height;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_s_selection(struct file *file, void *fh, struct v4l2_=
selection *s)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "type : %d | target : %d\n", s->type, s->ta=
rget);
> +
> +       if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> +               switch (s->target) {
> +               case V4L2_SEL_TGT_COMPOSE:
> +                       DPRINTK(inst->dev, 1, "V4L2_SEL_TGT_COMPOSE width=
 : %d | height : %d\n",
> +                               s->r.width, s->r.height);
> +                       inst->dst_fmt.width  =3D s->r.width;
> +                       inst->dst_fmt.height =3D s->r.height;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_try_decoder_cmd(struct file *file, void *fh, struct v=
4l2_decoder_cmd *dc)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "decoder command : %d\n", dc->cmd);
> +
> +       if (dc->cmd !=3D V4L2_DEC_CMD_STOP && dc->cmd !=3D V4L2_DEC_CMD_S=
TART)
> +               return -EINVAL;
> +
> +       dc->flags =3D 0;
> +
> +       if (dc->cmd =3D=3D V4L2_DEC_CMD_STOP) {
> +               dc->stop.pts =3D 0;
> +       } else if (dc->cmd =3D=3D V4L2_DEC_CMD_START) {
> +               dc->start.speed =3D 0;
> +               dc->start.format =3D V4L2_DEC_START_FMT_NONE;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_=
decoder_cmd *dc)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int ret;
> +
> +       DPRINTK(inst->dev, 1, "decoder command : %d\n", dc->cmd);
> +
> +       ret =3D vpu_dec_try_decoder_cmd(file, fh, dc);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!vb2_is_streaming(v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2=
_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) ||
> +           !vb2_is_streaming(v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2=
_BUF_TYPE_VIDEO_OUTPUT_MPLANE)))
> +               return 0;
> +
> +       switch (dc->cmd) {
> +       case V4L2_DEC_CMD_STOP:
> +               vpu_dec_stop_decode(inst);
> +               break;
> +       case V4L2_DEC_CMD_START:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_subscribe_event(struct v4l2_fh *fh, const struct v4l2=
_event_subscription *sub)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "type : %d | id : %d | flags : %d\n", sub->=
type, sub->id, sub->flags);
> +
> +       switch (sub->type) {
> +       case V4L2_EVENT_EOS:
> +               return v4l2_event_subscribe(fh, sub, 0, NULL);
> +       case V4L2_EVENT_SOURCE_CHANGE:
> +               return v4l2_src_change_event_subscribe(fh, sub);
> +       case V4L2_EVENT_CTRL:
> +               return v4l2_ctrl_subscribe_event(fh, sub);
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static const struct v4l2_ioctl_ops vpu_dec_ioctl_ops =3D {
> +       .vidioc_querycap                =3D vpu_dec_querycap,
> +       .vidioc_enum_framesizes         =3D vpu_dec_enum_framesizes,
> +
> +       .vidioc_enum_fmt_vid_cap        =3D vpu_dec_enum_fmt_cap,
> +       .vidioc_s_fmt_vid_cap_mplane    =3D vpu_dec_s_fmt_cap,
> +       .vidioc_g_fmt_vid_cap_mplane    =3D vpu_dec_g_fmt_cap,
> +       .vidioc_try_fmt_vid_cap_mplane  =3D vpu_dec_try_fmt_cap,
> +
> +       .vidioc_enum_fmt_vid_out        =3D vpu_dec_enum_fmt_out,
> +       .vidioc_s_fmt_vid_out_mplane    =3D vpu_dec_s_fmt_out,
> +       .vidioc_g_fmt_vid_out_mplane    =3D vpu_dec_g_fmt_out,
> +       .vidioc_try_fmt_vid_out_mplane  =3D vpu_dec_try_fmt_out,
> +
> +       .vidioc_g_selection             =3D vpu_dec_g_selection,
> +       .vidioc_s_selection             =3D vpu_dec_s_selection,
> +
> +       .vidioc_reqbufs                 =3D v4l2_m2m_ioctl_reqbufs,
> +       .vidioc_querybuf                =3D v4l2_m2m_ioctl_querybuf,
> +       .vidioc_create_bufs             =3D v4l2_m2m_ioctl_create_bufs,
> +       .vidioc_prepare_buf             =3D v4l2_m2m_ioctl_prepare_buf,
> +       .vidioc_qbuf                    =3D v4l2_m2m_ioctl_qbuf,
> +       .vidioc_expbuf                  =3D v4l2_m2m_ioctl_expbuf,
> +       .vidioc_dqbuf                   =3D v4l2_m2m_ioctl_dqbuf,
> +       .vidioc_streamon                =3D v4l2_m2m_ioctl_streamon,
> +       .vidioc_streamoff               =3D v4l2_m2m_ioctl_streamoff,
> +
> +       .vidioc_try_decoder_cmd         =3D vpu_dec_try_decoder_cmd,
> +       .vidioc_decoder_cmd             =3D vpu_dec_decoder_cmd,
> +
> +       .vidioc_subscribe_event         =3D vpu_dec_subscribe_event,
> +       .vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
> +};
> +
> +static int vpu_dec_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct vpu_instance *inst =3D ctrl_to_vpu_inst(ctrl);
> +
> +       DPRINTK(inst->dev, 1, "name : %s\n", ctrl->name);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> +               if (inst->state !=3D VPU_INST_STATE_NONE && inst->state !=
=3D VPU_INST_STATE_OPEN)
> +                       ctrl->val =3D inst->min_dst_frame_buf_count;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       DPRINTK(inst->dev, 1, "value : %d\n", ctrl->val);
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct vpu_instance *inst =3D ctrl_to_vpu_inst(ctrl);
> +
> +       DPRINTK(inst->dev, 1, "name : %s | value : %d\n", ctrl->name, ctr=
l->val);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_VPU_THUMBNAIL_MODE:
> +               inst->thumbnail_mode =3D ctrl->val;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops vpu_dec_ctrl_ops =3D {
> +       .g_volatile_ctrl =3D vpu_dec_g_volatile_ctrl,
> +       .s_ctrl          =3D vpu_dec_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config vpu_thumbnail_mode =3D {
> +       .ops   =3D &vpu_dec_ctrl_ops,
> +       .id    =3D V4L2_CID_VPU_THUMBNAIL_MODE,
> +       .name  =3D "thumbnail mode",
> +       .type  =3D V4L2_CTRL_TYPE_BOOLEAN,
> +       .def   =3D 0,
> +       .min   =3D 0,
> +       .max   =3D 1,
> +       .step  =3D 1,
> +       .flags =3D V4L2_CTRL_FLAG_WRITE_ONLY,
> +};
> +
> +static void set_default_dec_openparam(struct dec_open_param *open_param)
> +{
> +       open_param->bitstream_mode  =3D BS_MODE_INTERRUPT;
> +       open_param->stream_endian   =3D VPU_STREAM_ENDIAN;
> +       open_param->frame_endian    =3D VPU_FRAME_ENDIAN;
> +       open_param->cbcr_interleave =3D FALSE;
> +       open_param->nv21           =3D FALSE;
> +}
> +
> +static int vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_bu=
ffers,
> +                              unsigned int *num_planes, unsigned int siz=
es[],
> +                              struct device *alloc_devs[])
> +{
> +       struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +       struct v4l2_pix_format_mplane inst_format =3D
> +               (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst=
->src_fmt : inst->dst_fmt;
> +       unsigned int i;
> +
> +       DPRINTK(inst->dev, 1, "num_buffers : %d | num_planes : %d | type =
: %d\n", *num_buffers,
> +               *num_planes, q->type);
> +
> +       if (*num_planes) {
> +               if (inst_format.num_planes !=3D *num_planes)
> +                       return -EINVAL;
> +
> +               for (i =3D 0; i < *num_planes; i++) {
> +                       if (sizes[i] < inst_format.plane_fmt[i].sizeimage=
)
> +                               return -EINVAL;
> +               }
> +       } else {
> +               *num_planes =3D inst_format.num_planes;
> +
> +               if (*num_planes =3D=3D 1) {
> +                       sizes[0] =3D inst_format.width * inst_format.heig=
ht * 3 / 2;
> +                       if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPL=
ANE)
> +                               sizes[0] =3D inst_format.plane_fmt[0].siz=
eimage;
> +                       DPRINTK(inst->dev, 1, "size[0] : %d\n", sizes[0])=
;
> +               } else if (*num_planes =3D=3D 2) {
> +                       sizes[0] =3D inst_format.width * inst_format.heig=
ht;
> +                       sizes[1] =3D inst_format.width * inst_format.heig=
ht / 2;
> +                       DPRINTK(inst->dev, 1, "size[0] : %d | size[1] : %=
d\n", sizes[0], sizes[1]);
> +               } else if (*num_planes =3D=3D 3) {
> +                       sizes[0] =3D inst_format.width * inst_format.heig=
ht;
> +                       sizes[1] =3D inst_format.width * inst_format.heig=
ht / 4;
> +                       sizes[2] =3D inst_format.width * inst_format.heig=
ht / 4;
> +                       DPRINTK(inst->dev, 1, "size[0] : %d | size[1] : %=
d | size[2] : %d\n",
> +                               sizes[0], sizes[1], sizes[2]);
> +               }
> +       }
> +
> +       if (inst->state =3D=3D VPU_INST_STATE_NONE && q->type =3D=3D V4L2=
_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +               enum ret_code ret_code;
> +               struct dec_open_param open_param;
> +
> +               memset(&open_param, 0, sizeof(struct dec_open_param));
> +               set_default_dec_openparam(&open_param);
> +
> +               inst->bitstream_vbuf.size =3D ALIGN(inst->src_fmt.plane_f=
mt[0].sizeimage, 1024) * 4;
> +               if (vdi_allocate_dma_memory(inst->dev, &inst->bitstream_v=
buf) < 0)
> +                       DPRINTK(inst->dev, 1, "alloc bitstream fail: %zu\=
n", inst->bitstream_vbuf.size);
> +
> +               inst->std =3D to_vpu_codstd(inst->src_fmt.pixelformat);
> +               if (inst->std =3D=3D STD_UNKNOWN) {
> +                       dev_warn(inst->dev->dev, "unsupported pixelformat=
: %.4s\n",
> +                                (char *)&inst->src_fmt.pixelformat);
> +                       return -EINVAL;
> +               }
> +               open_param.bitstream_buffer     =3D inst->bitstream_vbuf.=
daddr;
> +               open_param.bitstream_buffer_size =3D inst->bitstream_vbuf=
.size;
> +
> +               ret_code =3D vpu_dec_open_api(inst, &open_param);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       DPRINTK(inst->dev, 1, "failed to call vpu_dec_ope=
n_api() : %d\n", ret_code);
> +                       return -EINVAL;
> +               }
> +
> +               inst->state =3D VPU_INST_STATE_OPEN;
> +
> +               //vpu_dec_give_command(inst, ENABLE_LOGGING, 0);
> +
> +               if (inst->thumbnail_mode)
> +                       vpu_dec_give_command(inst, ENABLE_DEC_THUMBNAIL_M=
ODE, 0);
> +
> +               inst->min_src_frame_buf_count =3D *num_buffers;
> +       }
> +
> +       if (inst->state !=3D VPU_INST_STATE_NONE && inst->state !=3D VPU_=
INST_STATE_OPEN && q->type =3D=3D
> +                       V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +               *num_buffers =3D inst->min_dst_frame_buf_count;
> +
> +               if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ) {
> +                       s32 non_linear_num =3D inst->min_dst_frame_buf_co=
unt;
> +                       s32 fb_stride, fb_height;
> +                       s32 luma_size, chroma_size;
> +
> +                       for (i =3D 0; i < non_linear_num; i++) {
> +                               fb_stride   =3D inst->dst_fmt.width;
> +                               fb_height   =3D ALIGN(inst->dst_fmt.heigh=
t, 32);
> +                               luma_size   =3D fb_stride * fb_height;
> +                               chroma_size =3D ALIGN(fb_stride / 2, 16) =
* fb_height;
> +
> +                               inst->frame_vbuf[i].size =3D luma_size + =
chroma_size;
> +                               if (vdi_allocate_dma_memory(inst->dev, &i=
nst->frame_vbuf[i]) < 0)
> +                                       DPRINTK(inst->dev, 1, "failed to =
alloc FBC buffer : %zu\n",
> +                                               inst->frame_vbuf[i].size)=
;
> +
> +                               inst->frame_buf[i].buf_y    =3D inst->fra=
me_vbuf[i].daddr;
> +                               inst->frame_buf[i].buf_cb   =3D inst->fra=
me_vbuf[i].daddr + luma_size;
> +                               inst->frame_buf[i].buf_cr   =3D (dma_addr=
_t)-1;
> +                               inst->frame_buf[i].size    =3D inst->fram=
e_vbuf[i].size;
> +                               inst->frame_buf[i].width   =3D inst->src_=
fmt.width;
> +                               inst->frame_buf[i].stride  =3D fb_stride;
> +                               inst->frame_buf[i].map_type =3D COMPRESSE=
D_FRAME_MAP;
> +                               inst->frame_buf[i].update_fb_info =3D TRU=
E;
> +                       }
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_buf_init(struct vb2_buffer *vb)
> +{
> +       struct vpu_instance    *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +       DPRINTK(inst->dev, 1, "type : %4d  index %4d size[0] %4ld size[1]=
 %4ld size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +       return 0;
> +}
> +
> +static int vpu_dec_buf_prepare(struct vb2_buffer *vb)
> +{
> +       struct vpu_instance    *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf     =3D to_vb2_v4l2_buffer(vb);
> +
> +       DPRINTK(inst->dev, 1, "type : %4d index %4d size[0] %4ld size[1] =
%4ld size[2] %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +
> +       return 0;
> +}
> +
> +static void vpu_dec_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *vbuf    =3D to_vb2_v4l2_buffer(vb);
> +       struct vpu_instance    *inst    =3D vb2_get_drv_priv(vb->vb2_queu=
e);
> +       struct vpu_buffer      *vpu_buf =3D to_vpu_buf(vbuf);
> +
> +       DPRINTK(inst->dev, 1, "type %4d index %4d size[0] %4ld size[1] : =
%4ld | size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +
> +       v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
> +
> +       if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +               vpu_buf->consumed =3D FALSE;
> +               handle_bitstream_buffer(inst);
> +               vbuf->sequence =3D inst->queued_src_buf_num++;
> +       }
> +
> +       if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +               if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ) {
> +                       dma_addr_t buf_addr_y =3D 0, buf_addr_cb =3D 0, b=
uf_addr_cr =3D 0;
> +                       s32 buf_size     =3D 0;
> +                       s32 non_linear_num =3D inst->min_dst_frame_buf_co=
unt;
> +                       s32 fb_stride     =3D inst->dst_fmt.width;
> +                       s32 luma_size     =3D fb_stride * inst->dst_fmt.h=
eight;
> +                       s32 chroma_size   =3D (fb_stride / 2) * (inst->ds=
t_fmt.height / 2);
> +
> +                       if (inst->dst_fmt.num_planes =3D=3D 1) {
> +                               buf_size    =3D vb2_plane_size(&vbuf->vb2=
_buf, 0);
> +                               buf_addr_y  =3D vb2_dma_contig_plane_dma_=
addr(&vbuf->vb2_buf, 0);
> +                               buf_addr_cb =3D buf_addr_y + luma_size;
> +                               buf_addr_cr =3D buf_addr_cb + chroma_size=
;
> +                       } else if (inst->dst_fmt.num_planes =3D=3D 2) {
> +                               buf_size    =3D vb2_plane_size(&vbuf->vb2=
_buf, 0) +
> +                                       vb2_plane_size(&vbuf->vb2_buf, 1)=
;
> +                               buf_addr_y  =3D vb2_dma_contig_plane_dma_=
addr(&vbuf->vb2_buf, 0);
> +                               buf_addr_cb =3D vb2_dma_contig_plane_dma_=
addr(&vbuf->vb2_buf, 1);
> +                               buf_addr_cr =3D buf_addr_cb + chroma_size=
;
> +                       } else if (inst->dst_fmt.num_planes =3D=3D 3) {
> +                               buf_size    =3D vb2_plane_size(&vbuf->vb2=
_buf, 0) +
> +                                       vb2_plane_size(&vbuf->vb2_buf, 1)=
 +
> +                                       vb2_plane_size(&vbuf->vb2_buf, 2)=
;
> +                               buf_addr_y  =3D vb2_dma_contig_plane_dma_=
addr(&vbuf->vb2_buf, 0);
> +                               buf_addr_cb =3D vb2_dma_contig_plane_dma_=
addr(&vbuf->vb2_buf, 1);
> +                               buf_addr_cr =3D vb2_dma_contig_plane_dma_=
addr(&vbuf->vb2_buf, 2);
> +                       }
> +                       inst->frame_buf[vb->index + non_linear_num].buf_y=
    =3D buf_addr_y;
> +                       inst->frame_buf[vb->index + non_linear_num].buf_c=
b   =3D buf_addr_cb;
> +                       inst->frame_buf[vb->index + non_linear_num].buf_c=
r   =3D buf_addr_cr;
> +                       inst->frame_buf[vb->index + non_linear_num].size =
   =3D buf_size;
> +                       inst->frame_buf[vb->index + non_linear_num].width=
   =3D inst->src_fmt.width;
> +                       inst->frame_buf[vb->index + non_linear_num].strid=
e  =3D fb_stride;
> +                       inst->frame_buf[vb->index + non_linear_num].map_t=
ype =3D LINEAR_FRAME_MAP;
> +                       inst->frame_buf[vb->index + non_linear_num].updat=
e_fb_info =3D TRUE;
> +               }
> +
> +               if (inst->state =3D=3D VPU_INST_STATE_PIC_RUN || inst->st=
ate =3D=3D VPU_INST_STATE_STOP ||
> +                   inst->state =3D=3D VPU_INST_STATE_WAIT_BUF) {
> +                       vpu_dec_clr_disp_flag(inst, vb->index);
> +                       if (inst->state =3D=3D VPU_INST_STATE_WAIT_BUF)
> +                               inst->state =3D VPU_INST_STATE_PIC_RUN;
> +               }
> +               vbuf->sequence =3D inst->queued_dst_buf_num++;
> +       }
> +}
> +
> +static void vpu_dec_buf_finish(struct vb2_buffer *vb)
> +{
> +       struct vpu_instance    *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +       DPRINTK(inst->dev, 1, "type %4d index : %4d size[0] %4ld size[1] =
%4ld | size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +}
> +
> +static void vpu_dec_buf_cleanup(struct vb2_buffer *vb)
> +{
> +       struct vpu_instance    *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +       DPRINTK(inst->dev, 1, "type %4d index %4d size[0] %4ld size[1] : =
%4ld | size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +}
> +
> +static int vpu_dec_start_streaming(struct vb2_queue *q, unsigned int cou=
nt)
> +{
> +       struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +
> +       DPRINTK(inst->dev, 1, "type : %d\n", q->type);
> +
> +       if (inst->state =3D=3D VPU_INST_STATE_OPEN) {
> +               struct dec_initial_info initial_info;
> +               enum ret_code        ret_code;
> +
> +               ret_code =3D vpu_dec_issue_seq_init(inst);
> +               if (ret_code !=3D RETCODE_SUCCESS)
> +                       DPRINTK(inst->dev, 1, "failed vpu_dec_issue_seq_i=
nit() : %d\n", ret_code);
> +
> +               if (vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
> +                       DPRINTK(inst->dev, 1, "failed to call vpu_wait_in=
terrupt()\n");
> +
> +               ret_code =3D vpu_dec_complete_seq_init(inst, &initial_inf=
o);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       DPRINTK(inst->dev, 1, "vpu_dec_complete_seq_init:=
 %d, reason : %d\n",
> +                               ret_code, initial_info.seq_init_err_reaso=
n);
> +               } else {
> +                       static const struct v4l2_event vpu_event_src_ch =
=3D {
> +                               .type =3D V4L2_EVENT_SOURCE_CHANGE,
> +                               .u.src_change.changes =3D V4L2_EVENT_SRC_=
CH_RESOLUTION,
> +                       };
> +
> +                       DPRINTK(inst->dev, 1, "width %d height %d profile=
 %d | minbuffer : %d\n",
> +                               initial_info.pic_width, initial_info.pic_=
height,
> +                               initial_info.profile, initial_info.min_fr=
ame_buffer_count);
> +
> +                       inst->state =3D VPU_INST_STATE_INIT_SEQ;
> +                       inst->min_dst_frame_buf_count =3D initial_info.mi=
n_frame_buffer_count + 1;
> +
> +                       if (initial_info.pic_width  !=3D inst->src_fmt.wi=
dth ||
> +                           initial_info.pic_height !=3D inst->src_fmt.he=
ight) {
> +                               update_resolution_info(&inst->src_fmt, in=
itial_info.pic_width,
> +                                                      initial_info.pic_h=
eight);
> +                               update_resolution_info(&inst->dst_fmt, in=
itial_info.pic_width,
> +                                                      initial_info.pic_h=
eight);
> +                       }
> +
> +                       v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_sr=
c_ch);
> +               }
> +       }
> +
> +       if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ && q->type =3D=3D =
V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +               enum ret_code ret_code;
> +               s32 non_linear_num =3D inst->min_dst_frame_buf_count;
> +               s32 linear_num    =3D inst->min_dst_frame_buf_count;
> +               s32 fb_stride     =3D inst->dst_fmt.width;
> +
> +               DPRINTK(inst->dev, 1, "fb_stride %d | inst->dst_fmt.heigh=
t %d\n", fb_stride, inst->dst_fmt.height);
> +               ret_code =3D vpu_dec_register_frame_buffer_ex(inst, non_l=
inear_num, linear_num,
> +                                                           fb_stride, in=
st->dst_fmt.height, COMPRESSED_FRAME_MAP);
> +               if (ret_code !=3D RETCODE_SUCCESS)
> +                       DPRINTK(inst->dev, 1, "fail vpu_dec_register_fram=
e_buffer_ex %d", ret_code);
> +
> +               inst->state =3D VPU_INST_STATE_PIC_RUN;
> +       }
> +
> +       return 0;
> +}
> +
> +static void vpu_dec_stop_streaming(struct vb2_queue *q)
> +{
> +       struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +       struct vb2_v4l2_buffer *buf;
> +
> +       DPRINTK(inst->dev, 1, "type : %d\n", q->type);
> +
> +       if (vb2_is_streaming(v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2_=
BUF_TYPE_VIDEO_CAPTURE_MPLANE)) &&
> +           vb2_is_streaming(v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2_=
BUF_TYPE_VIDEO_OUTPUT_MPLANE)))
> +               inst->state =3D VPU_INST_STATE_STOP;
> +
> +       if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +               while ((buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m=
_ctx))) {
> +                       DPRINTK(inst->dev, 1, "buf type : %4d | index : %=
4d\n", buf->vb2_buf.type,
> +                               buf->vb2_buf.index);
> +                       v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
> +               }
> +       } else {
> +               while ((buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m=
_ctx))) {
> +                       u32 plane =3D 0;
> +
> +                       DPRINTK(inst->dev, 1, "buf type : %4d | index : %=
4d\n", buf->vb2_buf.type,
> +                               buf->vb2_buf.index);
> +
> +                       for (plane =3D 0; plane < inst->dst_fmt.num_plane=
s; plane++)
> +                               vb2_set_plane_payload(&buf->vb2_buf, plan=
e, 0);
> +
> +                       v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
> +               }
> +       }
> +}
> +
> +static const struct vb2_ops vpu_dec_vb2_ops =3D {
> +       .queue_setup     =3D vpu_dec_queue_setup,
> +       .wait_prepare    =3D vb2_ops_wait_prepare,
> +       .wait_finish     =3D vb2_ops_wait_finish,
> +       .buf_init        =3D vpu_dec_buf_init,
> +       .buf_prepare     =3D vpu_dec_buf_prepare,
> +       .buf_queue       =3D vpu_dec_buf_queue,
> +       .buf_finish      =3D vpu_dec_buf_finish,
> +       .buf_cleanup     =3D vpu_dec_buf_cleanup,
> +       .start_streaming =3D vpu_dec_start_streaming,
> +       .stop_streaming  =3D vpu_dec_stop_streaming,
> +};
> +
> +static void set_default_format(struct v4l2_pix_format_mplane *src_fmt,
> +                              struct v4l2_pix_format_mplane *dst_fmt)
> +{
> +       src_fmt->pixelformat  =3D vpu_dec_fmt_list[VPU_FMT_TYPE_CODEC][0]=
.v4l2_pix_fmt;
> +       src_fmt->field        =3D V4L2_FIELD_NONE;
> +       src_fmt->flags        =3D 0;
> +       src_fmt->num_planes   =3D vpu_dec_fmt_list[VPU_FMT_TYPE_CODEC][0]=
.num_planes;
> +       update_resolution_info(src_fmt, 720, 480);
> +
> +       dst_fmt->pixelformat  =3D vpu_dec_fmt_list[VPU_FMT_TYPE_RAW][0].v=
4l2_pix_fmt;
> +       dst_fmt->field        =3D V4L2_FIELD_NONE;
> +       dst_fmt->flags        =3D 0;
> +       dst_fmt->num_planes   =3D vpu_dec_fmt_list[VPU_FMT_TYPE_RAW][0].n=
um_planes;
> +       update_resolution_info(dst_fmt, 736, 480);
> +}
> +
> +static int vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq, stru=
ct vb2_queue *dst_vq)
> +{
> +       struct vpu_instance *inst =3D priv;
> +       struct vpu_platform_data *pdata =3D dev_get_platdata(inst->dev->v=
4l2_dev.dev);
> +       int ret;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +       src_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       if (pdata && pdata->mem_ops)
> +               src_vq->mem_ops =3D pdata->mem_ops;
> +       else
> +               src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +       src_vq->ops =3D &vpu_dec_vb2_ops;
> +       src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       src_vq->buf_struct_size =3D sizeof(struct vpu_buffer);
> +       src_vq->allow_zero_bytesused =3D 1;
> +       src_vq->min_buffers_needed =3D 0;
> +       src_vq->drv_priv =3D inst;
> +       src_vq->lock =3D &inst->dev->dev_lock;
> +       src_vq->dev =3D inst->dev->v4l2_dev.dev;
> +       ret =3D vb2_queue_init(src_vq);
> +       if (ret)
> +               return ret;
> +
> +       dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +       dst_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       if (pdata && pdata->mem_ops)
> +               dst_vq->mem_ops =3D pdata->mem_ops;
> +       else
> +               dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> +       dst_vq->ops =3D &vpu_dec_vb2_ops;
> +       dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       dst_vq->buf_struct_size =3D sizeof(struct vpu_buffer);
> +       dst_vq->allow_zero_bytesused =3D 1;
> +       dst_vq->min_buffers_needed =3D 0;
> +       dst_vq->drv_priv =3D inst;
> +       dst_vq->lock =3D &inst->dev->dev_lock;
> +       dst_vq->dev =3D inst->dev->v4l2_dev.dev;
> +       ret =3D vb2_queue_init(dst_vq);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static const struct vpu_instance_ops vpu_dec_inst_ops =3D {
> +       .start_process  =3D vpu_dec_start_decode,
> +       .stop_process   =3D vpu_dec_stop_decode,
> +       .finish_process =3D vpu_dec_finish_decode,
> +};
> +
> +static int vpu_dec_open(struct file *filp)
> +{
> +       struct video_device *vdev =3D video_devdata(filp);
> +       struct vpu_device   *dev  =3D video_drvdata(filp);
> +       struct vpu_instance *inst =3D NULL;
> +       struct v4l2_ctrl    *ctrl;
> +
> +       inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> +       if (!inst)
> +               return -ENOMEM;
> +
> +       inst->dev  =3D dev;
> +       inst->type =3D VPU_INST_TYPE_DEC;
> +       inst->ops  =3D &vpu_dec_inst_ops;
> +
> +       spin_lock_init(&inst->bitstream_lock);
> +
> +       v4l2_fh_init(&inst->v4l2_fh, vdev);
> +       filp->private_data =3D &inst->v4l2_fh;
> +       v4l2_fh_add(&inst->v4l2_fh);
> +
> +       inst->v4l2_fh.m2m_ctx =3D v4l2_m2m_ctx_init(dev->v4l2_m2m_dev, in=
st, vpu_dec_queue_init);
> +       if (IS_ERR(inst->v4l2_fh.m2m_ctx))
> +               return -ENODEV;
> +
> +       v4l2_ctrl_handler_init(&inst->v4l2_ctrl_hdl, 10);
> +       v4l2_ctrl_new_custom(&inst->v4l2_ctrl_hdl, &vpu_thumbnail_mode, N=
ULL);
> +       ctrl =3D v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_dec_ctrl_op=
s,
> +                                V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32,=
 1, 1);
> +       if (ctrl)
> +               ctrl->flags |=3D V4L2_CTRL_FLAG_VOLATILE;
> +
> +       if (inst->v4l2_ctrl_hdl.error)
> +               return -ENODEV;
> +
> +       inst->v4l2_fh.ctrl_handler =3D &inst->v4l2_ctrl_hdl;
> +       v4l2_ctrl_handler_setup(&inst->v4l2_ctrl_hdl);
> +
> +       set_default_format(&inst->src_fmt, &inst->dst_fmt);
> +       inst->colorspace   =3D V4L2_COLORSPACE_REC709;
> +       inst->ycbcr_enc    =3D V4L2_YCBCR_ENC_DEFAULT;
> +       inst->hsv_enc      =3D 0;
> +       inst->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +       inst->xfer_func    =3D V4L2_XFER_FUNC_DEFAULT;
> +
> +       return 0;
> +}
> +
> +static int vpu_dec_release(struct file *filp)
> +{
> +       int i;
> +       struct vpu_instance *inst =3D to_vpu_inst(filp->private_data);
> +       unsigned int loop_count =3D 0;
> +
> +       v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> +       if (inst->state !=3D VPU_INST_STATE_NONE) {
> +               while (vpu_dec_close(inst) =3D=3D RETCODE_VPU_STILL_RUNNI=
NG) {
> +                       if (vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0=
) {
> +                               DPRINTK(inst->dev, 1, "failed to call vpu=
_wait_interrupt()\n");
> +                               if (loop_count < 10) {
> +                                       loop_count++;
> +                                       continue;
> +                               } else {
> +                                       DPRINTK(inst->dev, 1, "failed to =
call vpu_dec_close()\n");
> +                                       break;
> +                               }
> +                       } else {
> +                               break;
> +                       }
> +               }
> +       }
> +       for (i =3D 0; i < inst->min_dst_frame_buf_count; i++) {
> +               if (inst->frame_vbuf[i].size !=3D 0)
> +                       vdi_free_dma_memory(inst->dev, &inst->frame_vbuf[=
i]);
> +       }
> +       if (inst->bitstream_vbuf.size !=3D 0)
> +               vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
> +       v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
> +       v4l2_fh_del(&inst->v4l2_fh);
> +       v4l2_fh_exit(&inst->v4l2_fh);
> +       kfree(inst);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_file_operations vpu_dec_fops =3D {
> +       .owner          =3D THIS_MODULE,
> +       .open           =3D vpu_dec_open,
> +       .release        =3D vpu_dec_release,
> +       .unlocked_ioctl =3D video_ioctl2,
> +       .poll           =3D v4l2_m2m_fop_poll,
> +       .mmap           =3D v4l2_m2m_fop_mmap,
> +};
> +
> +int vpu_dec_register_device(struct vpu_device *dev)
> +{
> +       struct video_device *vdev_dec;
> +
> +       vdev_dec =3D devm_kzalloc(dev->v4l2_dev.dev, sizeof(*vdev_dec), G=
FP_KERNEL);
> +       if (!vdev_dec)
> +               return -ENOMEM;
> +
> +       dev->video_dev_dec =3D vdev_dec;
> +
> +       strscpy(vdev_dec->name, VPU_DEC_DEV_NAME, sizeof(vdev_dec->name))=
;
> +       vdev_dec->fops        =3D &vpu_dec_fops;
> +       vdev_dec->ioctl_ops   =3D &vpu_dec_ioctl_ops;
> +       vdev_dec->release     =3D video_device_release_empty;
> +       vdev_dec->v4l2_dev    =3D &dev->v4l2_dev;
> +       vdev_dec->vfl_dir     =3D VFL_DIR_M2M;
> +       vdev_dec->device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_ST=
REAMING;
> +       vdev_dec->lock        =3D &dev->dev_lock;
> +
> +       if (video_register_device(vdev_dec, VFL_TYPE_VIDEO, -1))
> +               return -1;
> +
> +       video_set_drvdata(vdev_dec, dev);
> +
> +       return 0;
> +}
> +
> +void vpu_dec_unregister_device(struct vpu_device *dev)
> +{
> +       video_unregister_device(dev->video_dev_dec);
> +}
> +
> diff --git a/drivers/staging/media/wave5/v4l2/vpu_dec.h b/drivers/staging=
/media/wave5/v4l2/vpu_dec.h
> new file mode 100644
> index 000000000000..92744858ef64
> --- /dev/null
> +++ b/drivers/staging/media/wave5/v4l2/vpu_dec.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Wave5 series multi-standard codec IP - decoder interface
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +#ifndef __VPU_DEC_DRV_H__
> +#define __VPU_DEC_DRV_H__
> +
> +#include "vpu.h"
> +
> +#define VPU_DEC_DEV_NAME "C&M VPU decoder"
> +#define VPU_DEC_DRV_NAME "vpu-dec"
> +
> +#define V4L2_CID_VPU_THUMBNAIL_MODE (V4L2_CID_USER_BASE + 0x1001)
> +
> +int  vpu_dec_register_device(struct vpu_device *dev);
> +void vpu_dec_unregister_device(struct vpu_device *dev);
> +#endif
> +
> diff --git a/drivers/staging/media/wave5/v4l2/vpu_enc.c b/drivers/staging=
/media/wave5/v4l2/vpu_enc.c
> new file mode 100644
> index 000000000000..e528b540ed2e
> --- /dev/null
> +++ b/drivers/staging/media/wave5/v4l2/vpu_enc.c
> @@ -0,0 +1,1580 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Wave5 series multi-standard codec IP - encoder interface
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +#include "vpu_enc.h"
> +
> +static const struct vpu_format vpu_enc_fmt_list[2][6] =3D {
> +       [VPU_FMT_TYPE_CODEC] =3D {
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_HEVC,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_H264,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 32,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 32,
> +               },
> +       },
> +       [VPU_FMT_TYPE_RAW] =3D {
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21,
> +                       .num_planes   =3D 1,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420M,
> +                       .num_planes   =3D 3,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12M,
> +                       .num_planes   =3D 2,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +               {
> +                       .v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
> +                       .num_planes   =3D 2,
> +                       .max_width    =3D 8192,
> +                       .min_width    =3D 8,
> +                       .max_height   =3D 8192,
> +                       .min_height   =3D 8,
> +               },
> +       }
> +};
> +
> +static enum cod_std to_vpu_codstd(unsigned int v4l2_pix_fmt)
> +{
> +       switch (v4l2_pix_fmt) {
> +       case V4L2_PIX_FMT_H264:
> +               return W_AVC_ENC;
> +       case V4L2_PIX_FMT_HEVC:
> +               return W_HEVC_ENC;
> +       default:
> +               return STD_UNKNOWN;
> +       }
> +}
> +
> +static const struct vpu_format *find_vpu_format(unsigned int v4l2_pix_fm=
t, enum vpu_format_type type)
> +{
> +       unsigned int index;
> +
> +       for (index =3D 0; index < ARRAY_SIZE(vpu_enc_fmt_list[type]); ind=
ex++) {
> +               if (vpu_enc_fmt_list[type][index].v4l2_pix_fmt =3D=3D v4l=
2_pix_fmt)
> +                       return &vpu_enc_fmt_list[type][index];
> +       }
> +
> +       return NULL;
> +}
> +
> +static const struct vpu_format *find_vpu_format_by_index(unsigned int in=
dex, enum vpu_format_type type)
> +{
> +       if (index >=3D ARRAY_SIZE(vpu_enc_fmt_list[type]))
> +               return NULL;
> +
> +       if (vpu_enc_fmt_list[type][index].v4l2_pix_fmt =3D=3D 0)
> +               return NULL;
> +
> +       return &vpu_enc_fmt_list[type][index];
> +}
> +
> +static struct vb2_v4l2_buffer *get_valid_src_buf(struct vpu_instance *in=
st)
> +{
> +       struct vb2_v4l2_buffer *vb2_v4l2_buf =3D NULL;
> +       struct v4l2_m2m_buffer *v4l2_m2m_buf =3D NULL;
> +       struct vpu_buffer      *vpu_buf      =3D NULL;
> +       bool   no_src_buf                    =3D TRUE;
> +
> +       v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
> +               vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
> +               vpu_buf      =3D to_vpu_buf(vb2_v4l2_buf);
> +
> +               if (!vpu_buf->consumed) {
> +                       DPRINTK(inst->dev, 1, "no consumed src idx : %d\n=
",
> +                               vb2_v4l2_buf->vb2_buf.index);
> +                       no_src_buf =3D FALSE;
> +                       break;
> +               }
> +       }
> +
> +       if (no_src_buf)
> +               vb2_v4l2_buf =3D NULL;
> +
> +       return vb2_v4l2_buf;
> +}
> +
> +static struct vb2_v4l2_buffer *get_valid_dst_buf(struct vpu_instance *in=
st)
> +{
> +       struct vb2_v4l2_buffer *vb2_v4l2_buf =3D NULL;
> +       struct v4l2_m2m_buffer *v4l2_m2m_buf =3D NULL;
> +       struct vpu_buffer      *vpu_buf      =3D NULL;
> +       bool   no_dst_buf                    =3D TRUE;
> +
> +       v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
> +               vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
> +               vpu_buf      =3D to_vpu_buf(vb2_v4l2_buf);
> +
> +               if (!vpu_buf->consumed) {
> +                       DPRINTK(inst->dev, 1, "no consumed dst idx : %d\n=
",
> +                               vb2_v4l2_buf->vb2_buf.index);
> +                       no_dst_buf =3D FALSE;
> +                       break;
> +               }
> +       }
> +
> +       if (no_dst_buf)
> +               vb2_v4l2_buf =3D NULL;
> +
> +       return vb2_v4l2_buf;
> +}
> +
> +static void update_resolution_info(struct v4l2_pix_format_mplane *pix_mp=
, unsigned int width,
> +                                  unsigned int height)
> +{
> +       switch (pix_mp->pixelformat) {
> +       case V4L2_PIX_FMT_YUV420:
> +       case V4L2_PIX_FMT_NV12:
> +       case V4L2_PIX_FMT_NV21:
> +               pix_mp->width  =3D round_up(width, 32);
> +               pix_mp->height =3D height;
> +               pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32)=
;
> +               pix_mp->plane_fmt[0].sizeimage    =3D round_up(width, 32)=
 * height * 3 / 2;
> +               memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->=
plane_fmt[0].reserved));
> +               break;
> +       case V4L2_PIX_FMT_YUV420M:
> +               pix_mp->width  =3D round_up(width, 32);
> +               pix_mp->height =3D height;
> +               pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32)=
;
> +               pix_mp->plane_fmt[0].sizeimage    =3D round_up(width, 32)=
 * height;
> +               memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->=
plane_fmt[0].reserved));
> +               pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32)=
 / 2;
> +               pix_mp->plane_fmt[1].sizeimage    =3D round_up(width, 32)=
 * height / 4;
> +               memset(&pix_mp->plane_fmt[1].reserved, 0, sizeof(pix_mp->=
plane_fmt[1].reserved));
> +               pix_mp->plane_fmt[2].bytesperline =3D round_up(width, 32)=
 / 2;
> +               pix_mp->plane_fmt[2].sizeimage    =3D round_up(width, 32)=
 * height / 4;
> +               memset(&pix_mp->plane_fmt[2].reserved, 0, sizeof(pix_mp->=
plane_fmt[2].reserved));
> +               break;
> +       case V4L2_PIX_FMT_NV12M:
> +       case V4L2_PIX_FMT_NV21M:
> +               pix_mp->width  =3D round_up(width, 32);
> +               pix_mp->height =3D height;
> +               pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32)=
;
> +               pix_mp->plane_fmt[0].sizeimage    =3D round_up(width, 32)=
 * height;
> +               memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->=
plane_fmt[0].reserved));
> +               pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32)=
;
> +               pix_mp->plane_fmt[1].sizeimage    =3D round_up(width, 32)=
 * height / 2;
> +               memset(&pix_mp->plane_fmt[1].reserved, 0, sizeof(pix_mp->=
plane_fmt[1].reserved));
> +               break;
> +       default:
> +               pix_mp->width  =3D round_up(width, 32);
> +               pix_mp->height =3D height;
> +               pix_mp->plane_fmt[0].bytesperline =3D 0;
> +               pix_mp->plane_fmt[0].sizeimage    =3D round_up(width, 32)=
 * height;
> +               memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->=
plane_fmt[0].reserved));
> +               break;
> +       }
> +}
> +
> +static void vpu_enc_start_encode(struct vpu_instance *inst)
> +{
> +       enum ret_code ret_code;
> +       struct queue_status_info q_status;
> +       u32 remain_cmd_q, max_cmd_q =3D 0;
> +
> +       vpu_enc_give_command(inst, ENC_GET_QUEUE_STATUS, &q_status);
> +       DPRINTK(inst->dev, 1, "min_src_buf_cnt : %d | default : %d | qcou=
nt : %d | report_q : %d\n",
> +               inst->min_src_frame_buf_count, COMMAND_QUEUE_DEPTH, q_sta=
tus.instance_queue_count,
> +               q_status.report_queue_count);
> +
> +       max_cmd_q    =3D (inst->min_src_frame_buf_count < COMMAND_QUEUE_D=
EPTH) ?
> +               inst->min_src_frame_buf_count : COMMAND_QUEUE_DEPTH;
> +       remain_cmd_q =3D max_cmd_q - q_status.instance_queue_count;
> +
> +       while (remain_cmd_q) {
> +               struct vb2_v4l2_buffer *src_buf;
> +               struct vb2_v4l2_buffer *dst_buf;
> +               struct vpu_buffer      *src_vbuf;
> +               struct vpu_buffer      *dst_vbuf;
> +               struct frame_buffer frame_buf;
> +               struct enc_param    pic_param;
> +               s32 luma_size   =3D (inst->dst_fmt.width * inst->dst_fmt.=
height);
> +               s32 chroma_size =3D ((inst->dst_fmt.width / 2) * (inst->d=
st_fmt.height / 2));
> +
> +               memset(&pic_param, 0, sizeof(struct enc_param));
> +
> +               src_buf =3D get_valid_src_buf(inst);
> +               dst_buf =3D get_valid_dst_buf(inst);
> +
> +               if (!src_buf || !dst_buf) {
> +                       DPRINTK(inst->dev, 1, "no valid src/dst buf\n");
> +                       break;
> +               }
> +
> +               src_vbuf =3D to_vpu_buf(src_buf);
> +               dst_vbuf =3D to_vpu_buf(dst_buf);
> +
> +               if (inst->src_fmt.num_planes =3D=3D 1) {
> +                       frame_buf.buf_y  =3D vb2_dma_contig_plane_dma_add=
r(&src_buf->vb2_buf, 0);
> +                       frame_buf.buf_cb =3D frame_buf.buf_y + luma_size;
> +                       frame_buf.buf_cr =3D frame_buf.buf_cb + chroma_si=
ze;
> +               } else if (inst->src_fmt.num_planes =3D=3D 2) {
> +                       frame_buf.buf_y  =3D vb2_dma_contig_plane_dma_add=
r(&src_buf->vb2_buf, 0);
> +                       frame_buf.buf_cb =3D vb2_dma_contig_plane_dma_add=
r(&src_buf->vb2_buf, 1);
> +                       frame_buf.buf_cr =3D frame_buf.buf_cb + chroma_si=
ze;
> +               } else if (inst->src_fmt.num_planes =3D=3D 3) {
> +                       frame_buf.buf_y  =3D vb2_dma_contig_plane_dma_add=
r(&src_buf->vb2_buf, 0);
> +                       frame_buf.buf_cb =3D vb2_dma_contig_plane_dma_add=
r(&src_buf->vb2_buf, 1);
> +                       frame_buf.buf_cr =3D vb2_dma_contig_plane_dma_add=
r(&src_buf->vb2_buf, 2);
> +               }
> +               frame_buf.stride         =3D inst->dst_fmt.width;
> +               frame_buf.cbcr_interleave =3D 0;
> +
> +               DPRINTK(inst->dev, 1, "encoding src sequence : %d | dst s=
equence : %d\n",
> +                       src_buf->sequence, dst_buf->sequence);
> +
> +               pic_param.src_idx      =3D src_buf->vb2_buf.index;
> +               pic_param.source_frame =3D &frame_buf;
> +               pic_param.pic_stream_buffer_addr =3D vb2_dma_contig_plane=
_dma_addr(&dst_buf->vb2_buf, 0);
> +               pic_param.pic_stream_buffer_size =3D vb2_plane_size(&dst_=
buf->vb2_buf, 0);
> +               pic_param.code_option.implicit_header_encode =3D 1;
> +
> +               ret_code =3D vpu_enc_start_one_frame(inst, &pic_param);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       if (ret_code !=3D RETCODE_QUEUEING_FAILURE) {
> +                               src_buf =3D v4l2_m2m_src_buf_remove(inst-=
>v4l2_fh.m2m_ctx);
> +                               dst_buf =3D v4l2_m2m_dst_buf_remove(inst-=
>v4l2_fh.m2m_ctx);
> +                               DPRINTK(inst->dev, 1, "fail to call vpu_e=
nc_start_one_frame() %d\n",
> +                                       ret_code);
> +                               inst->state =3D VPU_INST_STATE_STOP;
> +                               v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_=
ERROR);
> +                               v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_=
ERROR);
> +                       }
> +               } else {
> +                       DPRINTK(inst->dev, 1, "success to call vpu_enc_st=
art_one_frame() %d\n",
> +                               ret_code);
> +                       src_vbuf->consumed =3D TRUE;
> +                       dst_vbuf->consumed =3D TRUE;
> +               }
> +
> +               remain_cmd_q--;
> +       }
> +}
> +
> +static void vpu_enc_stop_encode(struct vpu_instance *inst)
> +{
> +       struct queue_status_info q_status;
> +
> +       inst->state =3D VPU_INST_STATE_STOP;
> +
> +       vpu_enc_give_command(inst, ENC_GET_QUEUE_STATUS, &q_status);
> +
> +       if (q_status.report_queue_count + q_status.instance_queue_count =
=3D=3D 0)
> +               v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst->v4l2_f=
h.m2m_ctx);
> +}
> +
> +static void vpu_enc_finish_encode(struct vpu_instance *inst)
> +{
> +       enum ret_code ret_code;
> +       struct enc_output_info enc_output_info;
> +       int irq_status;
> +
> +       if (kfifo_out(&inst->dev->irq_status, &irq_status, sizeof(int)))
> +               vpu_clear_interrupt_ex(inst, irq_status);
> +
> +       ret_code =3D vpu_enc_get_output_info(inst, &enc_output_info);
> +       if (ret_code !=3D RETCODE_SUCCESS) {
> +               DPRINTK(inst->dev, 1, "vpu_enc_get_output_info fail %d | =
reason: %d | info : %d\n",
> +                       ret_code, enc_output_info.error_reason, enc_outpu=
t_info.warn_info);
> +       } else {
> +               struct vb2_v4l2_buffer *dst_buf =3D NULL;
> +               struct v4l2_m2m_buffer *v4l2_m2m_buf =3D NULL;
> +
> +               v4l2_m2m_buf =3D NULL;
> +               v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m=
_buf) {
> +                       dst_buf =3D &v4l2_m2m_buf->vb;
> +                       if (enc_output_info.bitstream_buffer =3D=3D vb2_d=
ma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0))
> +                               break;
> +               }
> +
> +               if (enc_output_info.enc_src_idx >=3D 0) {
> +                       struct vb2_v4l2_buffer *src_buf =3D
> +                               v4l2_m2m_src_buf_remove_by_idx(inst->v4l2=
_fh.m2m_ctx,
> +                                                              enc_output=
_info.enc_src_idx);
> +
> +                       inst->timestamp =3D src_buf->vb2_buf.timestamp;
> +                       v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> +               }
> +
> +               if (enc_output_info.recon_frame_index =3D=3D RECON_IDX_FL=
AG_ENC_END) {
> +                       static const struct v4l2_event vpu_event_eos =3D =
{
> +                               .type =3D V4L2_EVENT_EOS
> +                       };
> +
> +                       dst_buf->flags |=3D V4L2_BUF_FLAG_LAST;
> +                       vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
> +
> +                       inst->state =3D VPU_INST_STATE_STOP;
> +                       v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_eo=
s);
> +               } else {
> +                       vb2_set_plane_payload(&dst_buf->vb2_buf, 0, enc_o=
utput_info.bitstream_size);
> +
> +                       dst_buf->vb2_buf.timestamp =3D inst->timestamp;
> +                       dst_buf->field =3D V4L2_FIELD_NONE;
> +                       if (enc_output_info.pic_type =3D=3D PIC_TYPE_I) {
> +                               if (enc_output_info.enc_vcl_nut =3D=3D 19=
 || enc_output_info.enc_vcl_nut =3D=3D 20)
> +                                       dst_buf->flags |=3D V4L2_BUF_FLAG=
_KEYFRAME;
> +                               else
> +                                       dst_buf->flags |=3D V4L2_BUF_FLAG=
_PFRAME;
> +                       } else if (enc_output_info.pic_type =3D=3D PIC_TY=
PE_P) {
> +                               dst_buf->flags |=3D V4L2_BUF_FLAG_PFRAME;
> +                       } else if (enc_output_info.pic_type =3D=3D PIC_TY=
PE_B) {
> +                               dst_buf->flags |=3D V4L2_BUF_FLAG_BFRAME;
> +                       }
> +               }
> +
> +               v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst=
_buf);
> +               v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> +       }
> +
> +       if (inst->state =3D=3D VPU_INST_STATE_STOP) {
> +               struct queue_status_info q_status;
> +
> +               vpu_enc_give_command(inst, ENC_GET_QUEUE_STATUS, &q_statu=
s);
> +               DPRINTK(inst->dev, 1, "default : %d | qcount : %d | repor=
t_q : %d\n",
> +                       COMMAND_QUEUE_DEPTH, q_status.instance_queue_coun=
t,
> +                               q_status.report_queue_count);
> +
> +               if (q_status.report_queue_count + q_status.instance_queue=
_count =3D=3D 0)
> +                       v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst=
->v4l2_fh.m2m_ctx);
> +       } else {
> +               v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst->v4l2_f=
h.m2m_ctx);
> +       }
> +}
> +
> +static int vpu_enc_querycap(struct file *file, void *fh, struct v4l2_cap=
ability *cap)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       strscpy(cap->driver,   VPU_ENC_DRV_NAME,            sizeof(cap->d=
river));
> +       strscpy(cap->card,     VPU_ENC_DRV_NAME,            sizeof(cap->c=
ard));
> +       strscpy(cap->bus_info, "platform:" VPU_ENC_DRV_NAME, sizeof(cap->=
bus_info));
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_enum_framesizes(struct file *file, void *fh, struct v=
4l2_frmsizeenum *fsize)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       if (fsize->index)
> +               return -EINVAL;
> +
> +       vpu_fmt =3D find_vpu_format(fsize->pixel_format, VPU_FMT_TYPE_COD=
EC);
> +       if (!vpu_fmt) {
> +               vpu_fmt =3D find_vpu_format(fsize->pixel_format, VPU_FMT_=
TYPE_RAW);
> +               if (!vpu_fmt)
> +                       return -EINVAL;
> +       }
> +
> +       fsize->type                 =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +       fsize->stepwise.min_width   =3D vpu_fmt->min_width;
> +       fsize->stepwise.max_width   =3D vpu_fmt->max_width;
> +       fsize->stepwise.step_width  =3D 1;
> +       fsize->stepwise.min_height  =3D vpu_fmt->min_height;
> +       fsize->stepwise.max_height  =3D vpu_fmt->max_height;
> +       fsize->stepwise.step_height =3D 1;
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2=
_fmtdesc *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "index : %d\n", f->index);
> +
> +       vpu_fmt =3D find_vpu_format_by_index(f->index, VPU_FMT_TYPE_CODEC=
);
> +       if (!vpu_fmt)
> +               return -EINVAL;
> +
> +       f->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +       f->flags       =3D 0;
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_=
format *f)
> +{
> +       struct vpu_instance     *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "fourcc: %d width %d height %d num_planes %=
d field : %d\n",
> +               f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pi=
x_mp.height,
> +               f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
> +
> +       if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +               return -EINVAL;
> +
> +       vpu_fmt =3D find_vpu_format(f->fmt.pix_mp.pixelformat, VPU_FMT_TY=
PE_CODEC);
> +       if (!vpu_fmt) {
> +               f->fmt.pix_mp.pixelformat =3D inst->dst_fmt.pixelformat;
> +               f->fmt.pix_mp.num_planes  =3D inst->dst_fmt.num_planes;
> +               update_resolution_info(&f->fmt.pix_mp, inst->dst_fmt.widt=
h, inst->dst_fmt.height);
> +       } else {
> +               f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +               f->fmt.pix_mp.num_planes  =3D vpu_fmt->num_planes;
> +               update_resolution_info(&f->fmt.pix_mp, clamp(f->fmt.pix_m=
p.width,
> +                                                            vpu_fmt->min=
_width, vpu_fmt->max_width),
> +                               clamp(f->fmt.pix_mp.height, vpu_fmt->min_=
height,
> +                                     vpu_fmt->max_height));
> +       }
> +
> +       f->fmt.pix_mp.flags        =3D 0;
> +       f->fmt.pix_mp.field        =3D V4L2_FIELD_NONE;
> +       f->fmt.pix_mp.colorspace   =3D inst->colorspace;
> +       f->fmt.pix_mp.ycbcr_enc    =3D inst->ycbcr_enc;
> +       f->fmt.pix_mp.hsv_enc      =3D inst->hsv_enc;
> +       f->fmt.pix_mp.quantization =3D inst->quantization;
> +       f->fmt.pix_mp.xfer_func    =3D inst->xfer_func;
> +       memset(&f->fmt.pix_mp.reserved, 0, sizeof(f->fmt.pix_mp.reserved)=
);
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_fo=
rmat *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int i, ret;
> +
> +       DPRINTK(inst->dev, 1, "4cc %d width %d height %d num_planes %d fi=
eld %d\n",
> +               f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pi=
x_mp.height,
> +               f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
> +
> +       ret =3D vpu_enc_try_fmt_cap(file, fh, f);
> +       if (ret)
> +               return ret;
> +
> +       inst->dst_fmt.width        =3D f->fmt.pix_mp.width;
> +       inst->dst_fmt.height       =3D f->fmt.pix_mp.height;
> +       inst->dst_fmt.pixelformat  =3D f->fmt.pix_mp.pixelformat;
> +       inst->dst_fmt.field        =3D f->fmt.pix_mp.field;
> +       inst->dst_fmt.flags        =3D f->fmt.pix_mp.flags;
> +       inst->dst_fmt.num_planes   =3D f->fmt.pix_mp.num_planes;
> +       for (i =3D 0; i < inst->dst_fmt.num_planes; i++) {
> +               inst->dst_fmt.plane_fmt[i].bytesperline =3D f->fmt.pix_mp=
.plane_fmt[i].bytesperline;
> +               inst->dst_fmt.plane_fmt[i].sizeimage    =3D f->fmt.pix_mp=
.plane_fmt[i].sizeimage;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_fo=
rmat *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int i;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       f->fmt.pix_mp.width        =3D inst->dst_fmt.width;
> +       f->fmt.pix_mp.height       =3D inst->dst_fmt.height;
> +       f->fmt.pix_mp.pixelformat  =3D inst->dst_fmt.pixelformat;
> +       f->fmt.pix_mp.field        =3D inst->dst_fmt.field;
> +       f->fmt.pix_mp.flags        =3D inst->dst_fmt.flags;
> +       f->fmt.pix_mp.num_planes   =3D inst->dst_fmt.num_planes;
> +       for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
> +               f->fmt.pix_mp.plane_fmt[i].bytesperline =3D inst->dst_fmt=
.plane_fmt[i].bytesperline;
> +               f->fmt.pix_mp.plane_fmt[i].sizeimage    =3D inst->dst_fmt=
.plane_fmt[i].sizeimage;
> +       }
> +
> +       f->fmt.pix_mp.colorspace   =3D inst->colorspace;
> +       f->fmt.pix_mp.ycbcr_enc    =3D inst->ycbcr_enc;
> +       f->fmt.pix_mp.hsv_enc      =3D inst->hsv_enc;
> +       f->fmt.pix_mp.quantization =3D inst->quantization;
> +       f->fmt.pix_mp.xfer_func    =3D inst->xfer_func;
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2=
_fmtdesc *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "index : %d\n", f->index);
> +
> +       vpu_fmt =3D find_vpu_format_by_index(f->index, VPU_FMT_TYPE_RAW);
> +       if (!vpu_fmt)
> +               return -EINVAL;
> +
> +       f->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +       f->flags       =3D 0;
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_=
format *f)
> +{
> +       struct vpu_instance     *inst =3D to_vpu_inst(fh);
> +       const struct vpu_format *vpu_fmt;
> +
> +       DPRINTK(inst->dev, 1, "4cc %d width %d height %d num_planes %d  f=
ield %d\n",
> +               f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pi=
x_mp.height,
> +               f->fmt.pix_mp.num_planes,  f->fmt.pix_mp.field);
> +
> +       if (f->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               return -EINVAL;
> +
> +       vpu_fmt =3D find_vpu_format(f->fmt.pix_mp.pixelformat, VPU_FMT_TY=
PE_RAW);
> +       if (!vpu_fmt) {
> +               f->fmt.pix_mp.pixelformat =3D inst->src_fmt.pixelformat;
> +               f->fmt.pix_mp.num_planes  =3D inst->src_fmt.num_planes;
> +               update_resolution_info(&f->fmt.pix_mp, inst->src_fmt.widt=
h, inst->src_fmt.height);
> +       } else {
> +               f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +               f->fmt.pix_mp.num_planes  =3D vpu_fmt->num_planes;
> +               update_resolution_info(&f->fmt.pix_mp, clamp(f->fmt.pix_m=
p.width,
> +                                                            vpu_fmt->min=
_width, vpu_fmt->max_width),
> +                               clamp(f->fmt.pix_mp.height, vpu_fmt->min_=
height,
> +                                     vpu_fmt->max_height));
> +       }
> +
> +       f->fmt.pix_mp.flags =3D 0;
> +       f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> +       memset(&f->fmt.pix_mp.reserved, 0, sizeof(f->fmt.pix_mp.reserved)=
);
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_fo=
rmat *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int i, ret;
> +
> +       DPRINTK(inst->dev, 1, "4cc %d width %d height %d num_planes %d fi=
eld : %d\n",
> +               f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pi=
x_mp.height,
> +               f->fmt.pix_mp.num_planes,  f->fmt.pix_mp.field);
> +
> +       ret =3D vpu_enc_try_fmt_out(file, fh, f);
> +       if (ret)
> +               return ret;
> +
> +       inst->src_fmt.width        =3D f->fmt.pix_mp.width;
> +       inst->src_fmt.height       =3D f->fmt.pix_mp.height;
> +       inst->src_fmt.pixelformat  =3D f->fmt.pix_mp.pixelformat;
> +       inst->src_fmt.field        =3D f->fmt.pix_mp.field;
> +       inst->src_fmt.flags        =3D f->fmt.pix_mp.flags;
> +       inst->src_fmt.num_planes   =3D f->fmt.pix_mp.num_planes;
> +       for (i =3D 0; i < inst->src_fmt.num_planes; i++) {
> +               inst->src_fmt.plane_fmt[i].bytesperline =3D f->fmt.pix_mp=
.plane_fmt[i].bytesperline;
> +               inst->src_fmt.plane_fmt[i].sizeimage    =3D f->fmt.pix_mp=
.plane_fmt[i].sizeimage;
> +       }
> +
> +       inst->colorspace   =3D f->fmt.pix_mp.colorspace;
> +       inst->ycbcr_enc    =3D f->fmt.pix_mp.ycbcr_enc;
> +       inst->hsv_enc      =3D f->fmt.pix_mp.hsv_enc;
> +       inst->quantization =3D f->fmt.pix_mp.quantization;
> +       inst->xfer_func    =3D f->fmt.pix_mp.xfer_func;
> +
> +       update_resolution_info(&inst->dst_fmt, f->fmt.pix_mp.width, f->fm=
t.pix_mp.height);
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_g_fmt_out(struct file *file, void *fh, struct v4l2_fo=
rmat *f)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int i;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       f->fmt.pix_mp.width        =3D inst->src_fmt.width;
> +       f->fmt.pix_mp.height       =3D inst->src_fmt.height;
> +       f->fmt.pix_mp.pixelformat  =3D inst->src_fmt.pixelformat;
> +       f->fmt.pix_mp.field        =3D inst->src_fmt.field;
> +       f->fmt.pix_mp.flags        =3D inst->src_fmt.flags;
> +       f->fmt.pix_mp.num_planes   =3D inst->src_fmt.num_planes;
> +       for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
> +               f->fmt.pix_mp.plane_fmt[i].bytesperline =3D inst->src_fmt=
.plane_fmt[i].bytesperline;
> +               f->fmt.pix_mp.plane_fmt[i].sizeimage    =3D inst->src_fmt=
.plane_fmt[i].sizeimage;
> +       }
> +
> +       f->fmt.pix_mp.colorspace   =3D inst->colorspace;
> +       f->fmt.pix_mp.ycbcr_enc    =3D inst->ycbcr_enc;
> +       f->fmt.pix_mp.hsv_enc      =3D inst->hsv_enc;
> +       f->fmt.pix_mp.quantization =3D inst->quantization;
> +       f->fmt.pix_mp.xfer_func    =3D inst->xfer_func;
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_=
selection *s)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "type : %d | target : %d\n", s->type, s->ta=
rget);
> +
> +       if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> +               switch (s->target) {
> +               case V4L2_SEL_TGT_CROP_DEFAULT:
> +               case V4L2_SEL_TGT_CROP_BOUNDS:
> +                       s->r.left   =3D 0;
> +                       s->r.top    =3D 0;
> +                       s->r.width  =3D inst->src_fmt.width;
> +                       s->r.height =3D inst->src_fmt.height;
> +                       break;
> +               case V4L2_SEL_TGT_CROP:
> +                       s->r.left   =3D 0;
> +                       s->r.top    =3D 0;
> +                       s->r.width  =3D inst->dst_fmt.width;
> +                       s->r.height =3D inst->dst_fmt.height;
> +                       DPRINTK(inst->dev, 1, "V4L2_SEL_TGT_CROP width : =
%d | height : %d\n",
> +                               s->r.width, s->r.height);
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_=
selection *s)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "type : %d | target : %d\n", s->type, s->ta=
rget);
> +
> +       if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> +               switch (s->target) {
> +               case V4L2_SEL_TGT_CROP:
> +                       DPRINTK(inst->dev, 1, "V4L2_SEL_TGT_CROP width : =
%d | height : %d\n",
> +                               s->r.width, s->r.height);
> +                       inst->dst_fmt.width  =3D s->r.width;
> +                       inst->dst_fmt.height =3D s->r.height;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_try_encoder_cmd(struct file *file, void *fh, struct v=
4l2_encoder_cmd *ec)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       if (ec->cmd !=3D V4L2_ENC_CMD_STOP && ec->cmd !=3D V4L2_ENC_CMD_S=
TART)
> +               return -EINVAL;
> +
> +       ec->flags =3D 0;
> +       return 0;
> +}
> +
> +static int vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_=
encoder_cmd *ec)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +       int ret;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       ret =3D vpu_enc_try_encoder_cmd(file, fh, ec);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!vb2_is_streaming(v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2=
_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) ||
> +           !vb2_is_streaming(v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2=
_BUF_TYPE_VIDEO_OUTPUT_MPLANE)))
> +               return 0;
> +
> +       switch (ec->cmd) {
> +       case V4L2_ENC_CMD_STOP:
> +               vpu_enc_stop_encode(inst);
> +               break;
> +       case V4L2_ENC_CMD_START:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_subscribe_event(struct v4l2_fh *fh, const struct v4l2=
_event_subscription *sub)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "type : %d | id : %d | flags : %d\n", sub->=
type, sub->id, sub->flags);
> +
> +       switch (sub->type) {
> +       case V4L2_EVENT_EOS:
> +               return v4l2_event_subscribe(fh, sub, 0, NULL);
> +       case V4L2_EVENT_CTRL:
> +               return v4l2_ctrl_subscribe_event(fh, sub);
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_strea=
mparm *a)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "type : %d\n", a->type);
> +
> +       if (a->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT && a->type !=3D V4L2_=
BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               return -EINVAL;
> +
> +       a->parm.output.capability               =3D V4L2_CAP_TIMEPERFRAME=
;
> +       a->parm.output.timeperframe.numerator   =3D 1;
> +       a->parm.output.timeperframe.denominator =3D inst->frame_rate;
> +
> +       DPRINTK(inst->dev, 1, "numerator : %d | denominator : %d\n",
> +               a->parm.output.timeperframe.numerator,
> +                       a->parm.output.timeperframe.denominator);
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_s_parm(struct file *file, void *fh, struct v4l2_strea=
mparm *a)
> +{
> +       struct vpu_instance *inst =3D to_vpu_inst(fh);
> +
> +       DPRINTK(inst->dev, 1, "type : %d\n", a->type);
> +
> +       if (a->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT && a->type !=3D V4L2_=
BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               return -EINVAL;
> +
> +       a->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
> +       if (a->parm.output.timeperframe.denominator !=3D 0 && a->parm.out=
put.timeperframe.numerator !=3D 0) {
> +               inst->frame_rate =3D a->parm.output.timeperframe.denomina=
tor / a->parm.output.timeperframe.numerator;
> +       } else {
> +               a->parm.output.timeperframe.numerator   =3D 1;
> +               a->parm.output.timeperframe.denominator =3D inst->frame_r=
ate;
> +       }
> +
> +       DPRINTK(inst->dev, 1, "numerator : %d | denominator : %d\n",
> +               a->parm.output.timeperframe.numerator,
> +                       a->parm.output.timeperframe.denominator);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops vpu_enc_ioctl_ops =3D {
> +       .vidioc_querycap                =3D vpu_enc_querycap,
> +       .vidioc_enum_framesizes         =3D vpu_enc_enum_framesizes,
> +
> +       .vidioc_enum_fmt_vid_cap        =3D vpu_enc_enum_fmt_cap,
> +       .vidioc_s_fmt_vid_cap_mplane    =3D vpu_enc_s_fmt_cap,
> +       .vidioc_g_fmt_vid_cap_mplane    =3D vpu_enc_g_fmt_cap,
> +       .vidioc_try_fmt_vid_cap_mplane  =3D vpu_enc_try_fmt_cap,
> +
> +       .vidioc_enum_fmt_vid_out        =3D vpu_enc_enum_fmt_out,
> +       .vidioc_s_fmt_vid_out_mplane    =3D vpu_enc_s_fmt_out,
> +       .vidioc_g_fmt_vid_out_mplane    =3D vpu_enc_g_fmt_out,
> +       .vidioc_try_fmt_vid_out_mplane  =3D vpu_enc_try_fmt_out,
> +
> +       .vidioc_g_selection             =3D vpu_enc_g_selection,
> +       .vidioc_s_selection             =3D vpu_enc_s_selection,
> +
> +       .vidioc_g_parm                  =3D vpu_enc_g_parm,
> +       .vidioc_s_parm                  =3D vpu_enc_s_parm,
> +
> +       .vidioc_reqbufs                 =3D v4l2_m2m_ioctl_reqbufs,
> +       .vidioc_querybuf                =3D v4l2_m2m_ioctl_querybuf,
> +       .vidioc_create_bufs             =3D v4l2_m2m_ioctl_create_bufs,
> +       .vidioc_prepare_buf             =3D v4l2_m2m_ioctl_prepare_buf,
> +       .vidioc_qbuf                    =3D v4l2_m2m_ioctl_qbuf,
> +       .vidioc_expbuf                  =3D v4l2_m2m_ioctl_expbuf,
> +       .vidioc_dqbuf                   =3D v4l2_m2m_ioctl_dqbuf,
> +       .vidioc_streamon                =3D v4l2_m2m_ioctl_streamon,
> +       .vidioc_streamoff               =3D v4l2_m2m_ioctl_streamoff,
> +
> +       .vidioc_try_encoder_cmd         =3D vpu_enc_try_encoder_cmd,
> +       .vidioc_encoder_cmd             =3D vpu_enc_encoder_cmd,
> +
> +       .vidioc_subscribe_event         =3D vpu_enc_subscribe_event,
> +       .vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
> +};
> +
> +static int vpu_enc_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct vpu_instance *inst =3D ctrl_to_vpu_inst(ctrl);
> +
> +       DPRINTK(inst->dev, 1, "name : %s\n", ctrl->name);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> +               if (inst->state !=3D VPU_INST_STATE_NONE && inst->state !=
=3D VPU_INST_STATE_OPEN)
> +                       ctrl->val =3D inst->min_src_frame_buf_count;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       DPRINTK(inst->dev, 1, "value : %d\n", ctrl->val);
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct vpu_instance *inst =3D ctrl_to_vpu_inst(ctrl);
> +
> +       DPRINTK(inst->dev, 1, "name : %s | value : %d\n", ctrl->name, ctr=
l->val);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_HFLIP:
> +               inst->mirror_direction |=3D (ctrl->val << 1);
> +               break;
> +       case V4L2_CID_VFLIP:
> +               inst->mirror_direction |=3D ctrl->val;
> +               break;
> +       case V4L2_CID_ROTATE:
> +               inst->rot_angle =3D ctrl->val;
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_VBV_SIZE:
> +               inst->vbv_buf_size =3D ctrl->val;
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
> +               switch (ctrl->val) {
> +               case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
> +                       inst->profile   =3D HEVC_PROFILE_MAIN;
> +                       inst->bit_depth =3D 8;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
> +                       inst->profile   =3D HEVC_PROFILE_STILLPICTURE;
> +                       inst->bit_depth =3D 8;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
> +                       inst->profile   =3D HEVC_PROFILE_MAIN10;
> +                       inst->bit_depth =3D 10;
> +                       break;
> +               default:
> +                       inst->profile   =3D 0;
> +                       inst->bit_depth =3D 0;
> +                       break;
> +               }
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
> +               switch (ctrl->val) {
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
> +                       inst->level =3D 10 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
> +                       inst->level =3D 20 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
> +                       inst->level =3D 21 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
> +                       inst->level =3D 30 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
> +                       inst->level =3D 31 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
> +                       inst->level =3D 40 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
> +                       inst->level =3D 41 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
> +                       inst->level =3D 50 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
> +                       inst->level =3D 51 * 3;
> +                       break;
> +               case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2:
> +                       inst->level =3D 52 * 3;
> +                       break;
> +               default:
> +                       inst->level =3D 0;
> +                       break;
> +               }
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
> +               inst->min_qp_i =3D ctrl->val;
> +               inst->min_qp_p =3D ctrl->val;
> +               inst->min_qp_b =3D ctrl->val;
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
> +               inst->max_qp_i =3D ctrl->val;
> +               inst->max_qp_p =3D ctrl->val;
> +               inst->max_qp_b =3D ctrl->val;
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> +               switch (ctrl->val) {
> +               case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
> +               case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
> +                       inst->profile   =3D H264_PROFILE_BP;
> +                       inst->bit_depth =3D 8;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
> +                       inst->profile   =3D H264_PROFILE_MP;
> +                       inst->bit_depth =3D 8;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
> +                       inst->profile   =3D H264_PROFILE_EXTENDED;
> +                       inst->bit_depth =3D 8;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
> +                       inst->profile   =3D H264_PROFILE_HP;
> +                       inst->bit_depth =3D 8;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10:
> +                       inst->profile   =3D H264_PROFILE_HIGH10;
> +                       inst->bit_depth =3D 10;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422:
> +                       inst->profile   =3D H264_PROFILE_HIGH422;
> +                       inst->bit_depth =3D 10;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE:
> +                       inst->profile   =3D H264_PROFILE_HIGH444;
> +                       inst->bit_depth =3D 10;
> +                       break;
> +               default:
> +                       inst->profile   =3D 0;
> +                       inst->bit_depth =3D 0;
> +                       break;
> +               }
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> +               switch (ctrl->val) {
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
> +                       inst->level =3D 10;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
> +                       inst->level =3D 9;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
> +                       inst->level =3D 11;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
> +                       inst->level =3D 12;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
> +                       inst->level =3D 13;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
> +                       inst->level =3D 20;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
> +                       inst->level =3D 21;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
> +                       inst->level =3D 22;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
> +                       inst->level =3D 30;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
> +                       inst->level =3D 31;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
> +                       inst->level =3D 32;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
> +                       inst->level =3D 40;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
> +                       inst->level =3D 41;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
> +                       inst->level =3D 42;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
> +                       inst->level =3D 50;
> +                       break;
> +               case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
> +                       inst->level =3D 51;
> +                       break;
> +               default:
> +                       inst->level =3D 0;
> +                       break;
> +               }
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
> +               inst->min_qp_i =3D ctrl->val;
> +               inst->min_qp_p =3D ctrl->val;
> +               inst->min_qp_b =3D ctrl->val;
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
> +               inst->max_qp_i =3D ctrl->val;
> +               inst->max_qp_p =3D ctrl->val;
> +               inst->max_qp_b =3D ctrl->val;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops vpu_enc_ctrl_ops =3D {
> +       .g_volatile_ctrl =3D vpu_enc_g_volatile_ctrl,
> +       .s_ctrl          =3D vpu_enc_s_ctrl,
> +};
> +
> +static void set_default_enc_openparam(struct enc_open_param *open_param)
> +{
> +       unsigned int i;
> +
> +       open_param->stream_endian  =3D VPU_STREAM_ENDIAN;
> +       open_param->source_endian  =3D VPU_SOURCE_ENDIAN;
> +       open_param->line_buf_int_en  =3D TRUE;
> +
> +       open_param->wave_param.gop_preset_idx               =3D PRESET_ID=
X_IPP_SINGLE;
> +       open_param->wave_param.decoding_refresh_type        =3D 1;
> +       open_param->wave_param.intra_qp                    =3D 30;
> +       open_param->wave_param.tmvp_enable                 =3D 1;
> +       open_param->wave_param.max_num_merge                =3D 2;
> +       open_param->wave_param.lf_cross_slice_boundary_enable =3D 1;
> +       open_param->wave_param.skip_intra_trans             =3D 1;
> +       open_param->wave_param.sao_enable                  =3D 1;
> +       open_param->wave_param.transform8x8_enable         =3D 1;
> +       open_param->wave_param.intra_nx_n_enable             =3D 1;
> +       for (i =3D 0; i < MAX_GOP_NUM; i++)
> +               open_param->wave_param.fixed_bit_ratio[i]   =3D 1;
> +       open_param->wave_param.cu_level_rc_enable            =3D 1;
> +       open_param->wave_param.hvs_qp_enable                =3D 1;
> +       open_param->wave_param.hvs_qp_scale                 =3D 2;
> +       open_param->wave_param.hvs_max_delta_qp              =3D 10;
> +       open_param->wave_param.gop_param.custom_gop_size     =3D 1;
> +       open_param->wave_param.initial_rc_qp                =3D -1;
> +       open_param->wave_param.nr_intra_weight_y             =3D 7;
> +       open_param->wave_param.nr_intra_weight_cb            =3D 7;
> +       open_param->wave_param.nr_intra_weight_cr            =3D 7;
> +       open_param->wave_param.nr_inter_weight_y             =3D 4;
> +       open_param->wave_param.nr_inter_weight_cb            =3D 4;
> +       open_param->wave_param.nr_inter_weight_cr            =3D 4;
> +       open_param->wave_param.strong_intra_smooth_enable    =3D 1;
> +       open_param->wave_param.bg_thr_diff                  =3D 8;
> +       open_param->wave_param.bg_thr_mean_diff              =3D 1;
> +       open_param->wave_param.bg_lambda_qp                 =3D 32;
> +       open_param->wave_param.bg_delta_qp                  =3D 3;
> +       open_param->wave_param.rdo_skip                    =3D 1;
> +       open_param->wave_param.intra_mb_refresh_arg          =3D 1;
> +       open_param->wave_param.entropy_coding_mode          =3D 1;
> +       open_param->wave_param.rc_weight_param              =3D 16;
> +       open_param->wave_param.rc_weight_buf                =3D 128;
> +       open_param->wave_param.lambda_scaling_enable        =3D 1;
> +}
> +
> +static int vpu_enc_queue_setup(struct vb2_queue *q, unsigned int *num_bu=
ffers,
> +                              unsigned int *num_planes, unsigned int siz=
es[], struct device *alloc_devs[])
> +{
> +       struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +       struct v4l2_pix_format_mplane inst_format =3D
> +               (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst=
->src_fmt : inst->dst_fmt;
> +       unsigned int i;
> +
> +       DPRINTK(inst->dev, 1, "num_buffers : %d | num_planes : %d | type =
: %d\n", *num_buffers,
> +               *num_planes, q->type);
> +
> +       if (*num_planes) {
> +               if (inst_format.num_planes !=3D *num_planes)
> +                       return -EINVAL;
> +
> +               for (i =3D 0; i < *num_planes; i++) {
> +                       if (sizes[i] < inst_format.plane_fmt[i].sizeimage=
)
> +                               return -EINVAL;
> +               }
> +       } else {
> +               *num_planes =3D inst_format.num_planes;
> +               for (i =3D 0; i < *num_planes; i++) {
> +                       sizes[i] =3D inst_format.plane_fmt[i].sizeimage;
> +                       DPRINTK(inst->dev, 1, "size[%d] : %d\n", i, sizes=
[i]);
> +               }
> +       }
> +
> +       DPRINTK(inst->dev, 1, "size : %d\n", sizes[0]);
> +
> +       if (inst->state =3D=3D VPU_INST_STATE_NONE && q->type =3D=3D V4L2=
_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +               enum ret_code ret_code;
> +               s32 non_linear_num  =3D 0;
> +               s32 fb_stride =3D 0;
> +               s32 fb_height =3D 0;
> +               struct enc_open_param open_param;
> +               struct enc_initial_info initial_info;
> +
> +               memset(&open_param, 0, sizeof(struct enc_open_param));
> +               set_default_enc_openparam(&open_param);
> +
> +               inst->std =3D to_vpu_codstd(inst->dst_fmt.pixelformat);
> +               if (inst->std =3D=3D STD_UNKNOWN) {
> +                       dev_warn(inst->dev->dev, "unsupported pixelformat=
: %.4s\n",
> +                                (char *)&inst->dst_fmt.pixelformat);
> +                       return -EINVAL;
> +               }
> +               open_param.pic_width                               =3D in=
st->dst_fmt.width;
> +               open_param.pic_height                              =3D in=
st->dst_fmt.height;
> +               open_param.frame_rate_info                          =3D i=
nst->frame_rate;
> +               open_param.vbv_buffer_size                          =3D i=
nst->vbv_buf_size;
> +               open_param.wave_param.profile          =3D inst->profile;
> +               open_param.wave_param.level            =3D inst->level;
> +               open_param.wave_param.internal_bit_depth =3D inst->bit_de=
pth;
> +               open_param.wave_param.min_qp_i           =3D inst->min_qp=
_i;
> +               open_param.wave_param.max_qp_i           =3D inst->max_qp=
_i;
> +               open_param.wave_param.min_qp_p           =3D inst->min_qp=
_p;
> +               open_param.wave_param.max_qp_p           =3D inst->max_qp=
_p;
> +               open_param.wave_param.min_qp_b           =3D inst->min_qp=
_b;
> +               open_param.wave_param.max_qp_b           =3D inst->max_qp=
_b;
> +
> +               ret_code =3D vpu_enc_open_api(inst, &open_param);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       DPRINTK(inst->dev, 1, "failed to call vpu_enc_ope=
n_api() : %d\n", ret_code);
> +                       return -EINVAL;
> +               }
> +
> +               inst->state =3D VPU_INST_STATE_OPEN;
> +
> +               //vpu_enc_give_command(inst, ENABLE_LOGGING, 0);
> +
> +               if (inst->mirror_direction !=3D 0) {
> +                       vpu_enc_give_command(inst, ENABLE_MIRRORING, 0);
> +                       vpu_enc_give_command(inst, SET_MIRROR_DIRECTION, =
&inst->mirror_direction);
> +               }
> +               if (inst->rot_angle !=3D 0) {
> +                       vpu_enc_give_command(inst, ENABLE_ROTATION, 0);
> +                       vpu_enc_give_command(inst, SET_ROTATION_ANGLE, &i=
nst->rot_angle);
> +               }
> +
> +               ret_code =3D vpu_enc_issue_seq_init(inst);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       DPRINTK(inst->dev, 1, "failed to call vpu_enc_iss=
ue_seq_init() : %d\n",
> +                               ret_code);
> +                       return -EINVAL;
> +               }
> +
> +               if (vpu_wait_interrupt(inst, VPU_ENC_TIMEOUT) < 0) {
> +                       DPRINTK(inst->dev, 1, "failed to call vpu_wait_in=
terrupt()\n");
> +                       return -EINVAL;
> +               }
> +
> +               ret_code =3D vpu_enc_complete_seq_init(inst, &initial_inf=
o);
> +               if (ret_code !=3D RETCODE_SUCCESS)
> +                       return -EINVAL;
> +
> +               DPRINTK(inst->dev, 1, "min_frame_buffer : %d | min_source=
_buffer : %d\n",
> +                       initial_info.min_frame_buffer_count, initial_info=
.min_src_frame_count);
> +               inst->state =3D VPU_INST_STATE_INIT_SEQ;
> +               inst->min_src_frame_buf_count =3D initial_info.min_src_fr=
ame_count + COMMAND_QUEUE_DEPTH;
> +               inst->min_dst_frame_buf_count =3D initial_info.min_frame_=
buffer_count;
> +               *num_buffers =3D inst->min_src_frame_buf_count;
> +               DPRINTK(inst->dev, 1, "source buffer num : %d", *num_buff=
ers);
> +
> +               non_linear_num =3D inst->min_dst_frame_buf_count;
> +
> +               fb_stride =3D inst->dst_fmt.width;
> +               fb_height =3D inst->dst_fmt.height;
> +
> +               for (i =3D 0; i < non_linear_num; i++) {
> +                       s32 luma_size   =3D fb_stride * fb_height;
> +                       s32 chroma_size =3D ALIGN(fb_stride / 2, 16) * fb=
_height;
> +
> +                       inst->frame_vbuf[i].size =3D luma_size + chroma_s=
ize;
> +                       if (vdi_allocate_dma_memory(inst->dev, &inst->fra=
me_vbuf[i]) < 0)
> +                               DPRINTK(inst->dev, 1, "failed to allocate=
 FBC buffer : %zu\n",
> +                                       inst->frame_vbuf[i].size);
> +
> +                       inst->frame_buf[i].buf_y  =3D inst->frame_vbuf[i]=
.daddr;
> +                       inst->frame_buf[i].buf_cb =3D (dma_addr_t)-1;
> +                       inst->frame_buf[i].buf_cr =3D (dma_addr_t)-1;
> +                       inst->frame_buf[i].update_fb_info =3D TRUE;
> +                       inst->frame_buf[i].size =3D inst->frame_vbuf[i].s=
ize;
> +               }
> +
> +               ret_code =3D vpu_enc_register_frame_buffer(inst, non_line=
ar_num, fb_stride, fb_height,
> +                                                        COMPRESSED_FRAME=
_MAP);
> +               if (ret_code !=3D RETCODE_SUCCESS) {
> +                       DPRINTK(inst->dev, 1, "failed to call vpu_enc_reg=
ister_frame_buffer() : %d\n",
> +                               ret_code);
> +                       return -EINVAL;
> +               }
> +
> +               inst->state =3D VPU_INST_STATE_PIC_RUN;
> +       }
> +
> +       if (inst->state !=3D VPU_INST_STATE_NONE && inst->state !=3D VPU_=
INST_STATE_OPEN &&
> +           q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +               *num_buffers =3D inst->min_src_frame_buf_count;
> +               DPRINTK(inst->dev, 1, "source buffer num : %d", *num_buff=
ers);
> +       }
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_buf_init(struct vb2_buffer *vb)
> +{
> +       struct vpu_instance    *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +       DPRINTK(inst->dev, 1, "type %4d index %4d size[0] %4ld size[1] %4=
ld size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_buf_prepare(struct vb2_buffer *vb)
> +{
> +       struct vpu_instance    *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +       DPRINTK(inst->dev, 1, "type %4d  index %4d size[0] %4ld size[1] %=
4ld | size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +
> +       return 0;
> +}
> +
> +static void vpu_enc_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *vbuf    =3D to_vb2_v4l2_buffer(vb);
> +       struct vpu_instance    *inst    =3D vb2_get_drv_priv(vb->vb2_queu=
e);
> +       struct vpu_buffer      *vpu_buf =3D to_vpu_buf(vbuf);
> +
> +       DPRINTK(inst->dev, 1, "type %4d index %4d size[0] %4ld size[1] : =
%4ld | size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +
> +       if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               vbuf->sequence =3D inst->queued_src_buf_num++;
> +       else
> +               vbuf->sequence =3D inst->queued_dst_buf_num++;
> +
> +       vpu_buf->consumed =3D FALSE;
> +       v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
> +}
> +
> +static void vpu_enc_buf_finish(struct vb2_buffer *vb)
> +{
> +       struct vpu_instance    *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf     =3D to_vb2_v4l2_buffer(vb);
> +
> +       DPRINTK(inst->dev, 1, "type %4d index %4d size[0] %4ld size[1] : =
%4ld | size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +}
> +
> +static void vpu_enc_buf_cleanup(struct vb2_buffer *vb)
> +{
> +       struct vpu_instance    *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +       DPRINTK(inst->dev, 1, "type %4d index %4d size[0] %4ld size[1] : =
%4ld | size[2] : %4ld\n",
> +               vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +               vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->=
vb2_buf, 2));
> +}
> +
> +static int vpu_enc_start_streaming(struct vb2_queue *q, unsigned int cou=
nt)
> +{
> +       struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +
> +       DPRINTK(inst->dev, 1, "type : %d\n", q->type);
> +       return 0;
> +}
> +
> +static void vpu_enc_stop_streaming(struct vb2_queue *q)
> +{
> +       struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +       struct vb2_v4l2_buffer *buf;
> +
> +       DPRINTK(inst->dev, 1, "type : %d\n", q->type);
> +
> +       if (vb2_is_streaming(v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2_=
BUF_TYPE_VIDEO_CAPTURE_MPLANE)) &&
> +           vb2_is_streaming(v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2_=
BUF_TYPE_VIDEO_OUTPUT_MPLANE)))
> +               inst->state =3D VPU_INST_STATE_STOP;
> +
> +       if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +               while ((buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m=
_ctx))) {
> +                       DPRINTK(inst->dev, 1, "buf type : %4d | index : %=
4d\n",
> +                               buf->vb2_buf.type, buf->vb2_buf.index);
> +                       v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
> +               }
> +       } else {
> +               while ((buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m=
_ctx))) {
> +                       DPRINTK(inst->dev, 1, "buf type : %4d | index : %=
4d\n",
> +                               buf->vb2_buf.type, buf->vb2_buf.index);
> +                       vb2_set_plane_payload(&buf->vb2_buf, 0, 0);
> +                       v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
> +               }
> +       }
> +}
> +
> +static const struct vb2_ops vpu_enc_vb2_ops =3D {
> +       .queue_setup     =3D vpu_enc_queue_setup,
> +       .wait_prepare    =3D vb2_ops_wait_prepare,
> +       .wait_finish     =3D vb2_ops_wait_finish,
> +       .buf_init        =3D vpu_enc_buf_init,
> +       .buf_prepare     =3D vpu_enc_buf_prepare,
> +       .buf_queue       =3D vpu_enc_buf_queue,
> +       .buf_finish      =3D vpu_enc_buf_finish,
> +       .buf_cleanup     =3D vpu_enc_buf_cleanup,
> +       .start_streaming =3D vpu_enc_start_streaming,
> +       .stop_streaming  =3D vpu_enc_stop_streaming,
> +};
> +
> +static void set_default_format(struct v4l2_pix_format_mplane *src_fmt,
> +                              struct v4l2_pix_format_mplane *dst_fmt)
> +{
> +       src_fmt->pixelformat  =3D vpu_enc_fmt_list[VPU_FMT_TYPE_RAW][0].v=
4l2_pix_fmt;
> +       src_fmt->field        =3D V4L2_FIELD_NONE;
> +       src_fmt->flags        =3D 0;
> +       src_fmt->num_planes   =3D vpu_enc_fmt_list[VPU_FMT_TYPE_RAW][0].n=
um_planes;
> +       update_resolution_info(src_fmt, 416, 240);
> +
> +       dst_fmt->pixelformat  =3D vpu_enc_fmt_list[VPU_FMT_TYPE_CODEC][0]=
.v4l2_pix_fmt;
> +       dst_fmt->field        =3D V4L2_FIELD_NONE;
> +       dst_fmt->flags        =3D 0;
> +       dst_fmt->num_planes   =3D vpu_enc_fmt_list[VPU_FMT_TYPE_CODEC][0]=
.num_planes;
> +       update_resolution_info(dst_fmt, 416, 240);
> +}
> +
> +static int vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, stru=
ct vb2_queue *dst_vq)
> +{
> +       struct vpu_instance *inst =3D priv;
> +       struct vpu_platform_data *pdata =3D dev_get_platdata(inst->dev->v=
4l2_dev.dev);
> +       int ret;
> +
> +       DPRINTK(inst->dev, 1, "\n");
> +
> +       src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +       src_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       if (pdata && pdata->mem_ops)
> +               src_vq->mem_ops =3D pdata->mem_ops;
> +       else
> +               src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +       src_vq->ops =3D &vpu_enc_vb2_ops;
> +       src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       src_vq->buf_struct_size =3D sizeof(struct vpu_buffer);
> +       src_vq->allow_zero_bytesused =3D 1;
> +       src_vq->min_buffers_needed =3D 0;
> +       src_vq->drv_priv =3D inst;
> +       src_vq->lock =3D &inst->dev->dev_lock;
> +       src_vq->dev =3D inst->dev->v4l2_dev.dev;
> +       ret =3D vb2_queue_init(src_vq);
> +       if (ret)
> +               return ret;
> +
> +       dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +       dst_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       if (pdata && pdata->mem_ops)
> +               dst_vq->mem_ops =3D pdata->mem_ops;
> +       else
> +               dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> +       dst_vq->ops =3D &vpu_enc_vb2_ops;
> +       dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       dst_vq->buf_struct_size =3D sizeof(struct vpu_buffer);
> +       dst_vq->allow_zero_bytesused =3D 1;
> +       dst_vq->min_buffers_needed =3D 0;
> +       dst_vq->drv_priv =3D inst;
> +       dst_vq->lock =3D &inst->dev->dev_lock;
> +       dst_vq->dev =3D inst->dev->v4l2_dev.dev;
> +       ret =3D vb2_queue_init(dst_vq);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static const struct vpu_instance_ops vpu_enc_inst_ops =3D {
> +       .start_process  =3D vpu_enc_start_encode,
> +       .stop_process   =3D vpu_enc_stop_encode,
> +       .finish_process =3D vpu_enc_finish_encode,
> +};
> +
> +static int vpu_enc_open(struct file *filp)
> +{
> +       struct video_device *vdev =3D video_devdata(filp);
> +       struct vpu_device   *dev  =3D video_drvdata(filp);
> +       struct vpu_instance *inst =3D NULL;
> +       struct v4l2_ctrl    *ctrl;
> +
> +       inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> +       if (!inst)
> +               return -ENOMEM;
> +
> +       inst->dev  =3D dev;
> +       inst->type =3D VPU_INST_TYPE_ENC;
> +       inst->ops  =3D &vpu_enc_inst_ops;
> +
> +       v4l2_fh_init(&inst->v4l2_fh, vdev);
> +       filp->private_data =3D &inst->v4l2_fh;
> +       v4l2_fh_add(&inst->v4l2_fh);
> +
> +       inst->v4l2_fh.m2m_ctx =3D v4l2_m2m_ctx_init(dev->v4l2_m2m_dev, in=
st, vpu_enc_queue_init);
> +       if (IS_ERR(inst->v4l2_fh.m2m_ctx))
> +               return -ENODEV;
> +
> +       v4l2_ctrl_handler_init(&inst->v4l2_ctrl_hdl, 30);
> +       v4l2_ctrl_new_std_menu(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops,
> +                              V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +                              V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10, 0,
> +                               V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
> +       v4l2_ctrl_new_std_menu(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops,
> +                              V4L2_CID_MPEG_VIDEO_HEVC_LEVEL, V4L2_MPEG_=
VIDEO_HEVC_LEVEL_5_1, 0,
> +                               V4L2_MPEG_VIDEO_HEVC_LEVEL_1);
> +       v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops, V4L2_C=
ID_MPEG_VIDEO_HEVC_MIN_QP,
> +                         0, 63, 1, 8);
> +       v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops, V4L2_C=
ID_MPEG_VIDEO_HEVC_MAX_QP,
> +                         0, 63, 1, 51);
> +       v4l2_ctrl_new_std_menu(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops,
> +                              V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +                              V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PRED=
ICTIVE, 0,
> +                               V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
> +       v4l2_ctrl_new_std_menu(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops,
> +                              V4L2_CID_MPEG_VIDEO_H264_LEVEL, V4L2_MPEG_=
VIDEO_H264_LEVEL_5_1, 0,
> +                               V4L2_MPEG_VIDEO_H264_LEVEL_1_0);
> +       v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops, V4L2_C=
ID_MPEG_VIDEO_H264_MIN_QP,
> +                         0, 63, 1, 8);
> +       v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops, V4L2_C=
ID_MPEG_VIDEO_H264_MAX_QP,
> +                         0, 63, 1, 51);
> +       v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops, V4L2_C=
ID_HFLIP,  0,   1,  1, 0);
> +       v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops, V4L2_C=
ID_VFLIP,  0,   1,  1, 0);
> +       v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops, V4L2_C=
ID_ROTATE, 0, 270, 90, 0);
> +       v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_ops, V4L2_C=
ID_MPEG_VIDEO_VBV_SIZE, 10,
> +                         3000, 1, 3000);
> +       ctrl =3D v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &vpu_enc_ctrl_op=
s,
> +                                V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, =
1, 1);
> +       if (ctrl)
> +               ctrl->flags |=3D V4L2_CTRL_FLAG_VOLATILE;
> +
> +       if (inst->v4l2_ctrl_hdl.error)
> +               return -ENODEV;
> +
> +       inst->v4l2_fh.ctrl_handler =3D &inst->v4l2_ctrl_hdl;
> +       v4l2_ctrl_handler_setup(&inst->v4l2_ctrl_hdl);
> +
> +       set_default_format(&inst->src_fmt, &inst->dst_fmt);
> +       inst->colorspace   =3D V4L2_COLORSPACE_REC709;
> +       inst->ycbcr_enc    =3D V4L2_YCBCR_ENC_DEFAULT;
> +       inst->hsv_enc      =3D 0;
> +       inst->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +       inst->xfer_func    =3D V4L2_XFER_FUNC_DEFAULT;
> +       inst->frame_rate   =3D 30;
> +
> +       return 0;
> +}
> +
> +static int vpu_enc_release(struct file *filp)
> +{
> +       int i;
> +       struct vpu_instance *inst =3D to_vpu_inst(filp->private_data);
> +       unsigned int loop_count =3D 0;
> +
> +       v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> +       if (inst->state !=3D VPU_INST_STATE_NONE) {
> +               while (vpu_enc_close(inst) =3D=3D RETCODE_VPU_STILL_RUNNI=
NG) {
> +                       if (vpu_wait_interrupt(inst, VPU_ENC_TIMEOUT) < 0=
) {
> +                               DPRINTK(inst->dev, 1, "failed to call vpu=
_wait_interrupt()\n");
> +                               if (loop_count < 10) {
> +                                       loop_count++;
> +                                       continue;
> +                               } else {
> +                                       DPRINTK(inst->dev, 1, "failed to =
call vpu_enc_close()\n");
> +                                       break;
> +                               }
> +                       }
> +               }
> +       }
> +       for (i =3D 0; i < inst->min_dst_frame_buf_count; i++) {
> +               if (inst->frame_vbuf[i].size !=3D 0)
> +                       vdi_free_dma_memory(inst->dev, &inst->frame_vbuf[=
i]);
> +       }
> +       v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
> +       v4l2_fh_del(&inst->v4l2_fh);
> +       v4l2_fh_exit(&inst->v4l2_fh);
> +       kfree(inst);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_file_operations vpu_enc_fops =3D {
> +       .owner          =3D THIS_MODULE,
> +       .open           =3D vpu_enc_open,
> +       .release        =3D vpu_enc_release,
> +       .unlocked_ioctl =3D video_ioctl2,
> +       .poll           =3D v4l2_m2m_fop_poll,
> +       .mmap           =3D v4l2_m2m_fop_mmap,
> +};
> +
> +int vpu_enc_register_device(struct vpu_device *dev)
> +{
> +       struct video_device *vdev_enc;
> +
> +       vdev_enc =3D devm_kzalloc(dev->v4l2_dev.dev, sizeof(*vdev_enc), G=
FP_KERNEL);
> +       if (!vdev_enc)
> +               return -ENOMEM;
> +
> +       dev->video_dev_enc =3D vdev_enc;
> +
> +       strscpy(vdev_enc->name, VPU_ENC_DEV_NAME, sizeof(vdev_enc->name))=
;
> +       vdev_enc->fops        =3D &vpu_enc_fops;
> +       vdev_enc->ioctl_ops   =3D &vpu_enc_ioctl_ops;
> +       vdev_enc->release     =3D video_device_release_empty;
> +       vdev_enc->v4l2_dev    =3D &dev->v4l2_dev;
> +       vdev_enc->vfl_dir     =3D VFL_DIR_M2M;
> +       vdev_enc->device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_ST=
REAMING;
> +       vdev_enc->lock        =3D &dev->dev_lock;
> +
> +       if (video_register_device(vdev_enc, VFL_TYPE_VIDEO, -1))
> +               return -1;

Make sure you replace all of these with proper errnos.

> +
> +       video_set_drvdata(vdev_enc, dev);
> +
> +       return 0;
> +}
> +
> +void vpu_enc_unregister_device(struct vpu_device *dev)
> +{
> +       video_unregister_device(dev->video_dev_enc);
> +}
> +
> diff --git a/drivers/staging/media/wave5/v4l2/vpu_enc.h b/drivers/staging=
/media/wave5/v4l2/vpu_enc.h
> new file mode 100644
> index 000000000000..17397d66ba06
> --- /dev/null
> +++ b/drivers/staging/media/wave5/v4l2/vpu_enc.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Wave5 series multi-standard codec IP - encoder interface
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +#ifndef __VPU_ENC_DRV_H__
> +#define __VPU_ENC_DRV_H__
> +
> +#include "vpu.h"
> +
> +#define VPU_ENC_DEV_NAME "C&M VPU encoder"
> +#define VPU_ENC_DRV_NAME "vpu-enc"
> +
> +int  vpu_enc_register_device(struct vpu_device *dev);
> +void vpu_enc_unregister_device(struct vpu_device *dev);
> +#endif
> +
> --
> 2.17.1
>

Regards,
Ezequiel
