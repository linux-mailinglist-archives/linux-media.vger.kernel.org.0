Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22D131459F7
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 17:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgAVQhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 11:37:36 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:41518 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgAVQhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 11:37:36 -0500
Received: by mail-io1-f68.google.com with SMTP id m25so7241084ioo.8;
        Wed, 22 Jan 2020 08:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P2fslH5TdqRhNs4Fq6iIi+n+KQzA0zbipv/o6VyGMeM=;
        b=TXgyiTXwuSMpbFPp1w8GQuxCIUVIbQHw66+E5NmUPUU/bWwbRNN9oQF1ZWE5u1uJKi
         SDCx79RmF1vcqMm9lINLlmYRmzE9DjchYadEvTunICM2FWRDKvptXd87nFM2iltkRnsp
         KBCnacKxX8SjFrbrPSnHGg0Aa+86r5CTdLir9uBGFk07JO7LeCCYJLfG8y3WhIrx8Fz4
         fPc+KcDbg8Yd3oDqhWcDcu7jwJgDYp5jBvra2++gpmJoI2BVax7a5dTN8QnxLFgE5WDj
         8ofOeSE/kiYIduBY/+t7zumnn2132rEQ63AH/cpkCZfRuRrE9e7Pbovltvu+wHIARB+4
         uJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P2fslH5TdqRhNs4Fq6iIi+n+KQzA0zbipv/o6VyGMeM=;
        b=KSDEqOYH1QhEpsMZgnn6y+8aH8ozMqLBeVKfNAzUZk/u4txwHhDvpiyJhDASRGjAQz
         x5YRMmZ+HxIG7EtwbH2Zsbw6KPWQZ1sc39MqvmufZfpnh1wuTuHbh0bHdNcxpiPBI8Yu
         3Hb9I7lahnTDNuKuschXupjBB+Vz9OQnSlvhp1m16lcb6cSENN5BCNM1WGcLOUszxCrI
         FgXMohQqXzt77nDvjlaqWtxsIciLlQ0kvZIreamtPfXRFbC7amXEPOFF3NovPa1/dsBi
         CUzlQ/57xAogzG7+JwFDAG2SchWDMjCEl14XBXUUHsC1IeC1hQ8fz3E3/mSTXjMsvfD6
         Sn7g==
X-Gm-Message-State: APjAAAVewGVyvOKBodFX2cuBofkRQ7EJ9CefjqgxAUAHcEGY/8LK7gYT
        s70gKPuy+f1bpsMu7aUAKc/lG+DSS22hcXr94kg=
X-Google-Smtp-Source: APXvYqxNv/q5Fo0Q4AU1/g2iavGubSavdYcL6bj66zaQYCorAj5fh0Or4aWufyhOIk+NAMLFT5Z4N9N19EJ2LUI8D5g=
X-Received: by 2002:a6b:39c4:: with SMTP id g187mr552069ioa.271.1579711055285;
 Wed, 22 Jan 2020 08:37:35 -0800 (PST)
MIME-Version: 1.0
References: <20200121200011.32296-1-kdasu.kdev@gmail.com> <20200121200011.32296-3-kdasu.kdev@gmail.com>
 <20200122095020.4b916f34@xps13>
In-Reply-To: <20200122095020.4b916f34@xps13>
From:   Kamal Dasu <kdasu.kdev@gmail.com>
Date:   Wed, 22 Jan 2020 11:37:24 -0500
Message-ID: <CAC=U0a2HHYDuEXLGOxjhYpDwBd-9G62tm7JXLK0BPqEkw1KWCA@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] mtd: rawnand: brcmnand: Add support for flash-edu
 for dma transfers
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     MTD Maling List <linux-mtd@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 22, 2020 at 3:50 AM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Kamal,
>
> I'm fine with the patch, nitpicking below :)
>
> Kamal Dasu <kdasu.kdev@gmail.com> wrote on Tue, 21 Jan 2020 15:00:08
> -0500:
>
> > Legacy mips soc platforms that have controller v5.0 and 6.0 use
> > flash-edu block for dma transfers. This change adds support for
> > nand dma transfers using the EDU block.
> >
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 296 ++++++++++++++++++++++-
> >  1 file changed, 290 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nan=
d/raw/brcmnand/brcmnand.c
> > index 1a66b1cd51c0..61347607f1da 100644
> > --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > @@ -102,6 +102,45 @@ struct brcm_nand_dma_desc {
> >  #define NAND_CTRL_RDY                        (INTFC_CTLR_READY | INTFC=
_FLASH_READY)
> >  #define NAND_POLL_STATUS_TIMEOUT_MS  100
> >
> > +#define EDU_CMD_WRITE          0x00
> > +#define EDU_CMD_READ           0x01
> > +#define EDU_STATUS_ACTIVE      BIT(0)
> > +#define EDU_ERR_STATUS_ERRACK  BIT(0)
> > +#define EDU_DONE_MASK                GENMASK(1, 0)
> > +
> > +#define EDU_CONFIG_MODE_NAND   BIT(0)
> > +#define EDU_CONFIG_SWAP_BYTE   BIT(1)
> > +#ifdef CONFIG_CPU_BIG_ENDIAN
> > +#define EDU_CONFIG_SWAP_CFG     EDU_CONFIG_SWAP_BYTE
> > +#else
> > +#define EDU_CONFIG_SWAP_CFG     0
> > +#endif
> > +
> > +/* edu registers */
> > +enum edu_reg {
> > +     EDU_CONFIG =3D 0,
> > +     EDU_DRAM_ADDR,
> > +     EDU_EXT_ADDR,
> > +     EDU_LENGTH,
> > +     EDU_CMD,
> > +     EDU_STOP,
> > +     EDU_STATUS,
> > +     EDU_DONE,
> > +     EDU_ERR_STATUS,
> > +};
> > +
> > +static const u16  edu_regs[] =3D {
> > +     [EDU_CONFIG] =3D 0x00,
> > +     [EDU_DRAM_ADDR] =3D 0x04,
> > +     [EDU_EXT_ADDR] =3D 0x08,
> > +     [EDU_LENGTH] =3D 0x0c,
> > +     [EDU_CMD] =3D 0x10,
> > +     [EDU_STOP] =3D 0x14,
> > +     [EDU_STATUS] =3D 0x18,
> > +     [EDU_DONE] =3D 0x1c,
> > +     [EDU_ERR_STATUS] =3D 0x20,
> > +};
>
> Why not defining the offsets in the enum directly?
>

EDU is separate block and following the convention used fr the rest of
the driver. Would prefer to keep it this way.

> > +
> >  /* flash_dma registers */
> >  enum flash_dma_reg {
> >       FLASH_DMA_REVISION =3D 0,
> > @@ -167,6 +206,8 @@ enum {
> >       BRCMNAND_HAS_WP                         =3D BIT(3),
> >  };
> >
> > +struct brcmnand_host;
> > +
> >  struct brcmnand_controller {
> >       struct device           *dev;
> >       struct nand_controller  controller;
> > @@ -185,17 +226,32 @@ struct brcmnand_controller {
> >
> >       int                     cmd_pending;
> >       bool                    dma_pending;
> > +     bool                    edu_pending;
> >       struct completion       done;
> >       struct completion       dma_done;
> > +     struct completion       edu_done;
> >
> >       /* List of NAND hosts (one for each chip-select) */
> >       struct list_head host_list;
> >
> > +     /* EDU info, per-transaction */
> > +     const u16               *edu_offsets;
> > +     void __iomem            *edu_base;
> > +     unsigned int            edu_irq;
> > +     int                     edu_count;
> > +     u64                     edu_dram_addr;
> > +     u32                     edu_ext_addr;
> > +     u32                     edu_cmd;
> > +     u32                     edu_config;
> > +
> >       /* flash_dma reg */
> >       const u16               *flash_dma_offsets;
> >       struct brcm_nand_dma_desc *dma_desc;
> >       dma_addr_t              dma_pa;
> >
> > +     int (*dma_trans)(struct brcmnand_host *host, u64 addr, u32 *buf,
> > +                      u32 len, u8 dma_cmd);
> > +
> >       /* in-memory cache of the FLASH_CACHE, used only for some command=
s */
> >       u8                      flash_cache[FC_BYTES];
> >
> > @@ -216,6 +272,7 @@ struct brcmnand_controller {
> >       u32                     nand_cs_nand_xor;
> >       u32                     corr_stat_threshold;
> >       u32                     flash_dma_mode;
> > +     u32                     flash_edu_mode;
> >       bool                    pio_poll_mode;
> >  };
> >
> > @@ -657,6 +714,22 @@ static inline void brcmnand_write_fc(struct brcmna=
nd_controller *ctrl,
> >       __raw_writel(val, ctrl->nand_fc + word * 4);
> >  }
> >
> > +static inline void edu_writel(struct brcmnand_controller *ctrl,
> > +                           enum edu_reg reg, u32 val)
> > +{
> > +     u16 offs =3D ctrl->edu_offsets[reg];
> > +
> > +     brcmnand_writel(val, ctrl->edu_base + offs);
> > +}
> > +
> > +static inline u32 edu_readl(struct brcmnand_controller *ctrl,
> > +                         enum edu_reg reg)
> > +{
> > +     u16 offs =3D ctrl->edu_offsets[reg];
> > +
> > +     return brcmnand_readl(ctrl->edu_base + offs);
> > +}
> > +
> >  static void brcmnand_clear_ecc_addr(struct brcmnand_controller *ctrl)
> >  {
> >
> > @@ -926,6 +999,16 @@ static inline bool has_flash_dma(struct brcmnand_c=
ontroller *ctrl)
> >       return ctrl->flash_dma_base;
> >  }
> >
> > +static inline bool has_edu(struct brcmnand_controller *ctrl)
> > +{
> > +     return ctrl->edu_base;
> > +}
> > +
> > +static inline bool use_dma(struct brcmnand_controller *ctrl)
> > +{
> > +     return has_flash_dma(ctrl) || has_edu(ctrl);
> > +}
> > +
> >  static inline void disable_ctrl_irqs(struct brcmnand_controller *ctrl)
> >  {
> >       if (ctrl->pio_poll_mode)
> > @@ -1299,6 +1382,52 @@ static int write_oob_to_regs(struct brcmnand_con=
troller *ctrl, int i,
> >       return tbytes;
> >  }
> >
> > +static void brcmnand_edu_init(struct brcmnand_controller *ctrl)
> > +{
> > +     /* initialize edu */
> > +     edu_writel(ctrl, EDU_ERR_STATUS, 0);
> > +     edu_readl(ctrl, EDU_ERR_STATUS);
> > +     edu_writel(ctrl, EDU_DONE, 0);
> > +     edu_writel(ctrl, EDU_DONE, 0);
> > +     edu_writel(ctrl, EDU_DONE, 0);
> > +     edu_writel(ctrl, EDU_DONE, 0);
> > +     edu_readl(ctrl, EDU_DONE);
> > +}
> > +
> > +/* edu irq */
> > +static irqreturn_t brcmnand_edu_irq(int irq, void *data)
> > +{
> > +     struct brcmnand_controller *ctrl =3D data;
> > +
> > +     if (ctrl->edu_count) {
> > +             ctrl->edu_count--;
> > +             while (!(edu_readl(ctrl, EDU_DONE) & EDU_DONE_MASK))
> > +                     udelay(1);
> > +             edu_writel(ctrl, EDU_DONE, 0);
> > +             edu_readl(ctrl, EDU_DONE);
> > +     }
> > +
> > +     if (ctrl->edu_count) {
> > +             ctrl->edu_dram_addr +=3D FC_BYTES;
> > +             ctrl->edu_ext_addr +=3D FC_BYTES;
> > +
> > +             edu_writel(ctrl, EDU_DRAM_ADDR, (u32)ctrl->edu_dram_addr)=
;
> > +             edu_readl(ctrl, EDU_DRAM_ADDR);
> > +             edu_writel(ctrl, EDU_EXT_ADDR, ctrl->edu_ext_addr);
> > +             edu_readl(ctrl, EDU_EXT_ADDR);
> > +
> > +             mb(); /* flush previous writes */
> > +             edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
> > +             edu_readl(ctrl, EDU_CMD);
> > +
> > +             return IRQ_HANDLED;
> > +     }
> > +
> > +     complete(&ctrl->edu_done);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> >  static irqreturn_t brcmnand_ctlrdy_irq(int irq, void *data)
> >  {
> >       struct brcmnand_controller *ctrl =3D data;
> > @@ -1307,6 +1436,16 @@ static irqreturn_t brcmnand_ctlrdy_irq(int irq, =
void *data)
> >       if (ctrl->dma_pending)
> >               return IRQ_HANDLED;
> >
> > +     /* check if you need to piggy back on the ctrlrdy irq */
> > +     if (ctrl->edu_pending) {
> > +             if (irq =3D=3D ctrl->irq && ((int)ctrl->edu_irq >=3D 0))
> > +     /* Discard interrupts while using dedicated edu irq */
> > +                     return IRQ_HANDLED;
> > +
> > +     /* no registered edu irq, call handler */
> > +             return brcmnand_edu_irq(irq, data);
> > +     }
> > +
> >       complete(&ctrl->done);
> >       return IRQ_HANDLED;
> >  }
> > @@ -1644,6 +1783,83 @@ static void brcmnand_write_buf(struct nand_chip =
*chip, const uint8_t *buf,
> >       }
> >  }
> >
> > +/**
> > + *  Kick EDU engine
> > + */
> > +static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u3=
2 *buf,
> > +                           u32 len, u8 cmd)
> > +{
> > +     struct brcmnand_controller *ctrl =3D host->ctrl;
> > +     unsigned long timeo =3D msecs_to_jiffies(200);
> > +     int ret =3D 0;
> > +     int dir =3D (cmd =3D=3D CMD_PAGE_READ ? DMA_FROM_DEVICE : DMA_TO_=
DEVICE);
> > +     u8 edu_cmd =3D (cmd =3D=3D CMD_PAGE_READ ? EDU_CMD_READ : EDU_CMD=
_WRITE);
> > +     unsigned int trans =3D len >> FC_SHIFT;
> > +     dma_addr_t pa;
> > +
> > +     pa =3D dma_map_single(ctrl->dev, buf, len, dir);
> > +     if (dma_mapping_error(ctrl->dev, pa)) {
> > +             dev_err(ctrl->dev, "unable to map buffer for EDU DMA\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     ctrl->edu_pending =3D true;
> > +     mb(); /* flush previous writes */
>
> I'd prefer to have the barriers right after the IO access. I don't
> think it changes anything but that would ease understand what writes
> are you concerned about. Also, maybe you can use non _relaxed accessors
> as you usually writel/readl in raw, I don't think you actually need a
> barrier in this case.
>
Agree will remove the barrier.

> > +
> > +     ctrl->edu_dram_addr =3D pa;
> > +     ctrl->edu_ext_addr =3D addr;
> > +     ctrl->edu_cmd =3D edu_cmd;
> > +     ctrl->edu_count =3D trans;
> > +
> > +     edu_writel(ctrl, EDU_DRAM_ADDR, (u32)ctrl->edu_dram_addr);
> > +     edu_readl(ctrl,  EDU_DRAM_ADDR);
> > +     edu_writel(ctrl, EDU_EXT_ADDR, ctrl->edu_ext_addr);
> > +     edu_readl(ctrl, EDU_EXT_ADDR);
> > +     edu_writel(ctrl, EDU_LENGTH, FC_BYTES);
> > +     edu_readl(ctrl, EDU_LENGTH);
> > +
> > +     /* Start edu engine */
> > +     mb(); /* flush previous writes */
> > +     edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
> > +     edu_readl(ctrl, EDU_CMD);
> > +
> > +     if (wait_for_completion_timeout(&ctrl->edu_done, timeo) <=3D 0) {
> > +             dev_err(ctrl->dev,
> > +                     "timeout waiting for EDU; status %#x, error statu=
s %#x\n",
> > +                     edu_readl(ctrl, EDU_STATUS),
> > +                     edu_readl(ctrl, EDU_ERR_STATUS));
> > +     }
> > +
> > +     dma_unmap_single(ctrl->dev, pa, len, dir);
> > +
> > +     /* for program page check NAND status */
> > +     if (((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) &
> > +           INTFC_FLASH_STATUS) & NAND_STATUS_FAIL) &&
> > +         edu_cmd =3D=3D EDU_CMD_WRITE) {
> > +             dev_info(ctrl->dev, "program failed at %llx\n",
> > +                      (unsigned long long)addr);
> > +             ret =3D -EIO;
> > +     }
> > +
> > +     /* Make sure the EDU status is clean */
> > +     if (edu_readl(ctrl, EDU_STATUS) & EDU_STATUS_ACTIVE)
> > +             dev_warn(ctrl->dev, "EDU still active: %#x\n",
> > +                      edu_readl(ctrl, EDU_STATUS));
> > +
> > +     if (unlikely(edu_readl(ctrl, EDU_ERR_STATUS) & EDU_ERR_STATUS_ERR=
ACK)) {
> > +             dev_warn(ctrl->dev, "EDU RBUS error at addr %llx\n",
> > +                      (unsigned long long)addr);
> > +             ret =3D -EIO;
> > +     }
> > +
> > +     ctrl->edu_pending =3D false;
> > +     brcmnand_edu_init(ctrl);
> > +     edu_writel(ctrl, EDU_STOP, 0); /* force stop */
> > +     edu_readl(ctrl, EDU_STOP);
> > +
> > +     return ret;
> > +}
> > +
> >  /**
> >   * Construct a FLASH_DMA descriptor as part of a linked list. You must=
 know the
> >   * following ahead of time:
> > @@ -1850,9 +2066,11 @@ static int brcmnand_read(struct mtd_info *mtd, s=
truct nand_chip *chip,
> >  try_dmaread:
> >       brcmnand_clear_ecc_addr(ctrl);
> >
> > -     if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
> > -             err =3D brcmnand_dma_trans(host, addr, buf, trans * FC_BY=
TES,
> > -                                          CMD_PAGE_READ);
> > +     if (ctrl->dma_trans && !oob && flash_dma_buf_ok(buf)) {
> > +             err =3D ctrl->dma_trans(host, addr, buf,
> > +                                   trans * FC_BYTES,
> > +                                   CMD_PAGE_READ);
> > +
> >               if (err) {
> >                       if (mtd_is_bitflip_or_eccerr(err))
> >                               err_addr =3D addr;
> > @@ -1988,10 +2206,12 @@ static int brcmnand_write(struct mtd_info *mtd,=
 struct nand_chip *chip,
> >       for (i =3D 0; i < ctrl->max_oob; i +=3D 4)
> >               oob_reg_write(ctrl, i, 0xffffffff);
> >
> > -     if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
> > -             if (brcmnand_dma_trans(host, addr, (u32 *)buf,
> > -                                     mtd->writesize, CMD_PROGRAM_PAGE)=
)
> > +     if (use_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
> > +             if (ctrl->dma_trans(host, addr, (u32 *)buf, mtd->writesiz=
e,
> > +                                 CMD_PROGRAM_PAGE))
> > +
> >                       ret =3D -EIO;
> > +
> >               goto out;
> >       }
> >
> > @@ -2494,6 +2714,8 @@ static int brcmnand_suspend(struct device *dev)
> >
> >       if (has_flash_dma(ctrl))
> >               ctrl->flash_dma_mode =3D flash_dma_readl(ctrl, FLASH_DMA_=
MODE);
> > +     else if (has_edu(ctrl))
> > +             ctrl->edu_config =3D edu_readl(ctrl, EDU_CONFIG);
> >
> >       return 0;
> >  }
> > @@ -2508,6 +2730,14 @@ static int brcmnand_resume(struct device *dev)
> >               flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
> >       }
> >
> > +     if (has_edu(ctrl))
> > +             ctrl->edu_config =3D edu_readl(ctrl, EDU_CONFIG);
> > +     else {
> > +             edu_writel(ctrl, EDU_CONFIG, ctrl->edu_config);
> > +             edu_readl(ctrl, EDU_CONFIG);
> > +             brcmnand_edu_init(ctrl);
> > +     }
> > +
> >       brcmnand_write_reg(ctrl, BRCMNAND_CS_SELECT, ctrl->nand_cs_nand_s=
elect);
> >       brcmnand_write_reg(ctrl, BRCMNAND_CS_XOR, ctrl->nand_cs_nand_xor)=
;
> >       brcmnand_write_reg(ctrl, BRCMNAND_CORR_THRESHOLD,
> > @@ -2553,6 +2783,52 @@ MODULE_DEVICE_TABLE(of, brcmnand_of_match);
> >  /*********************************************************************=
**
> >   * Platform driver setup (per controller)
> >   *********************************************************************=
**/
> > +static int brcmnand_edu_setup(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct brcmnand_controller *ctrl =3D dev_get_drvdata(&pdev->dev);
> > +     struct resource *res;
> > +     int ret;
> > +
> > +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash=
-edu");
> > +     if (res) {
> > +             ctrl->edu_base =3D devm_ioremap_resource(dev, res);
> > +             if (IS_ERR(ctrl->edu_base))
> > +                     return PTR_ERR(ctrl->edu_base);
> > +
> > +             ctrl->edu_offsets =3D edu_regs;
> > +
> > +             edu_writel(ctrl, EDU_CONFIG, EDU_CONFIG_MODE_NAND |
> > +                        EDU_CONFIG_SWAP_CFG);
> > +             edu_readl(ctrl, EDU_CONFIG);
> > +
> > +             /* initialize edu */
> > +             brcmnand_edu_init(ctrl);
> > +
> > +             ctrl->edu_irq =3D platform_get_irq_optional(pdev, 1);
> > +             if ((int)ctrl->edu_irq < 0) {
>
> Why not declaring it as an int directly? I think it's preferred.
>

Ok will make this change

> > +                     dev_warn(dev,
> > +                              "FLASH EDU enabled, using ctlrdy irq\n")=
;
> > +             } else {
> > +                     ret =3D devm_request_irq(dev, ctrl->edu_irq,
> > +                                            brcmnand_edu_irq, 0,
> > +                                            "brcmnand-edu", ctrl);
> > +                     if (ret < 0) {
> > +                             dev_err(ctrl->dev, "can't allocate IRQ %d=
: error %d\n",
> > +                                     ctrl->edu_irq, ret);
> > +                             return ret;
> > +                     }
> > +
> > +                     dev_info(dev, "FLASH EDU enabled using irq %u\n",
> > +                              ctrl->edu_irq);
> > +             }
> > +
> > +             /* set the appropriate edu transfer function to call */
> > +             ctrl->dma_trans =3D brcmnand_edu_trans;
> > +     }
> > +
> > +     return 0;
> > +}
> >
> >  int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *=
soc)
> >  {
> > @@ -2578,6 +2854,7 @@ int brcmnand_probe(struct platform_device *pdev, =
struct brcmnand_soc *soc)
> >
> >       init_completion(&ctrl->done);
> >       init_completion(&ctrl->dma_done);
> > +     init_completion(&ctrl->edu_done);
> >       nand_controller_init(&ctrl->controller);
> >       ctrl->controller.ops =3D &brcmnand_controller_ops;
> >       INIT_LIST_HEAD(&ctrl->host_list);
> > @@ -2623,6 +2900,7 @@ int brcmnand_probe(struct platform_device *pdev, =
struct brcmnand_soc *soc)
> >                               ctrl->reg_offsets[BRCMNAND_FC_BASE];
> >       }
> >
> > +     ctrl->dma_trans =3D NULL;
> >       /* FLASH_DMA */
> >       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash=
-dma");
> >       if (res) {
> > @@ -2665,6 +2943,12 @@ int brcmnand_probe(struct platform_device *pdev,=
 struct brcmnand_soc *soc)
> >               }
> >
> >               dev_info(dev, "enabling FLASH_DMA\n");
> > +             /* set the appropriate flash dma transfer function to cal=
l */
> > +             ctrl->dma_trans =3D brcmnand_dma_trans;
> > +     } else  {
> > +             ret =3D brcmnand_edu_setup(pdev);
> > +             if (ret < 0)
> > +                     goto err;
>
> Nitpicking: you could drop the initialization of dma_trans to NULL and
> assign ctrl->dma_trans in both cases of this if/else block (by moving
> it out of the brcmnand_edu_setup()). I think it enhances readability.
>

Will make this change as well.

> >       }
> >
> >       /* Disable automatic device ID config, direct addressing */
>
>
> Thanks,
> Miqu=C3=A8l


Will send a V3 patch with the changes.

Thanks
Kamal
