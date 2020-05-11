Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5878C1CE1F1
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 19:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730933AbgEKRo0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 May 2020 13:44:26 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:36801 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728711AbgEKRo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 13:44:26 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E52B1200006;
        Mon, 11 May 2020 17:44:21 +0000 (UTC)
Date:   Mon, 11 May 2020 19:44:20 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/3] nand: brcmnand: support v2.1-v2.2 controllers
Message-ID: <20200511194420.00af6b1f@xps13>
In-Reply-To: <20200510151406.2527856-3-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
        <20200510151406.2527856-3-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Álvaro,

Álvaro Fernández Rojas <noltari@gmail.com> wrote on Sun, 10 May 2020
17:14:06 +0200:

> Tested on Netgear DGND3700v2 (BCM6362 with v2.2 controller).

I'd propose to do this in two steps:

First rename what needs to be rename to be more accurate without adding
anything specific to this version of the IP, then, in another patch,
just add the necessary bits.

> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 76 +++++++++++++++++++++---
>  1 file changed, 67 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 72b268d8e3a4..718c601d0e59 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -338,6 +338,36 @@ enum brcmnand_reg {
>  	BRCMNAND_FC_BASE,
>  };
>  
> +/* BRCMNAND v2.1-v2.2 */
> +static const u16 brcmnand_regs_v21[] = {
> +	[BRCMNAND_CMD_START]		=  0x04,
> +	[BRCMNAND_CMD_EXT_ADDRESS]	=  0x08,
> +	[BRCMNAND_CMD_ADDRESS]		=  0x0c,
> +	[BRCMNAND_INTFC_STATUS]		=  0x5c,
> +	[BRCMNAND_CS_SELECT]		=  0x14,
> +	[BRCMNAND_CS_XOR]		=  0x18,
> +	[BRCMNAND_LL_OP]		=     0,
> +	[BRCMNAND_CS0_BASE]		=  0x40,
> +	[BRCMNAND_CS1_BASE]		=     0,
> +	[BRCMNAND_CORR_THRESHOLD]	=     0,
> +	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
> +	[BRCMNAND_UNCORR_COUNT]		=     0,
> +	[BRCMNAND_CORR_COUNT]		=     0,
> +	[BRCMNAND_CORR_EXT_ADDR]	=  0x60,
> +	[BRCMNAND_CORR_ADDR]		=  0x64,
> +	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x68,
> +	[BRCMNAND_UNCORR_ADDR]		=  0x6c,
> +	[BRCMNAND_SEMAPHORE]		=  0x50,
> +	[BRCMNAND_ID]			=  0x54,
> +	[BRCMNAND_ID_EXT]		=     0,
> +	[BRCMNAND_LL_RDATA]		=     0,
> +	[BRCMNAND_OOB_READ_BASE]	=  0x20,
> +	[BRCMNAND_OOB_READ_10_BASE]	=     0,
> +	[BRCMNAND_OOB_WRITE_BASE]	=  0x30,
> +	[BRCMNAND_OOB_WRITE_10_BASE]	=     0,
> +	[BRCMNAND_FC_BASE]		= 0x200,
> +};
> +
>  /* BRCMNAND v3.3-v4.0 */
>  static const u16 brcmnand_regs_v33[] = {
>  	[BRCMNAND_CMD_START]		=  0x04,
> @@ -571,12 +601,16 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
>  {
>  	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
>  	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
> -	static const unsigned int page_sizes[] = { 512, 2048, 4096, 8192, 0 };
> +	static const unsigned int block_sizes_v2_2[] = { 16, 128, 8, 512, 256, 0 };
> +	static const unsigned int block_sizes[] = { 16, 128, 8, 512, 0 };
> +	static const unsigned int page_sizes_v3_4[] = { 512, 2048, 4096, 8192, 0 };
> +	static const unsigned int page_sizes_v2_2[] = { 512, 2048, 4096, 0 };
> +	static const unsigned int page_sizes[] = { 512, 2048, 0 };

Can you name a version everywhere?

>  
>  	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
>  
> -	/* Only support v4.0+? */
> -	if (ctrl->nand_version < 0x0400) {
> +	/* Only support v2.1+ */
> +	if (ctrl->nand_version < 0x0201) {
>  		dev_err(ctrl->dev, "version %#x not supported\n",
>  			ctrl->nand_version);
>  		return -ENODEV;
> @@ -593,6 +627,8 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
>  		ctrl->reg_offsets = brcmnand_regs_v50;
>  	else if (ctrl->nand_version >= 0x0303)
>  		ctrl->reg_offsets = brcmnand_regs_v33;
> +	else if (ctrl->nand_version >= 0x0201)
> +		ctrl->reg_offsets = brcmnand_regs_v21;
>  
>  	/* Chip-select stride */
>  	if (ctrl->nand_version >= 0x0701)
> @@ -618,14 +654,27 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
>  		ctrl->max_page_size = 16 * 1024;
>  		ctrl->max_block_size = 2 * 1024 * 1024;
>  	} else {
> -		ctrl->page_sizes = page_sizes;
> +		if (ctrl->nand_version >= 0x0304)
> +			ctrl->page_sizes = page_sizes_v3_4;
> +		else if (ctrl->nand_version >= 0x0202)
> +			ctrl->page_sizes = page_sizes_v2_2;
> +		else
> +			ctrl->page_sizes = page_sizes;
> +
>  		if (ctrl->nand_version >= 0x0600)
>  			ctrl->block_sizes = block_sizes_v6;
> -		else
> +		else if (ctrl->nand_version >= 0x0400)
>  			ctrl->block_sizes = block_sizes_v4;
> +		else if (ctrl->nand_version >= 0x0202)
> +			ctrl->block_sizes = block_sizes_v2_2;
> +		else
> +			ctrl->block_sizes = block_sizes;
>  
>  		if (ctrl->nand_version < 0x0400) {
> -			ctrl->max_page_size = 4096;
> +			if (ctrl->nand_version < 0x0202)
> +				ctrl->max_page_size = 2048;
> +			else
> +				ctrl->max_page_size = 4096;
>  			ctrl->max_block_size = 512 * 1024;
>  		}
>  	}
> @@ -811,6 +860,9 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
>  	enum brcmnand_reg reg = BRCMNAND_CORR_THRESHOLD;
>  	int cs = host->cs;
>  
> +	if (!ctrl->reg_offsets[reg])
> +		return;
> +
>  	if (ctrl->nand_version == 0x0702)
>  		bits = 7;
>  	else if (ctrl->nand_version >= 0x0600)
> @@ -869,8 +921,10 @@ static inline u32 brcmnand_spare_area_mask(struct brcmnand_controller *ctrl)
>  		return GENMASK(7, 0);
>  	else if (ctrl->nand_version >= 0x0600)
>  		return GENMASK(6, 0);
> -	else
> +	else if (ctrl->nand_version >= 0x0303)
>  		return GENMASK(5, 0);
> +	else
> +		return GENMASK(4, 0);
>  }
>  
>  #define NAND_ACC_CONTROL_ECC_SHIFT	16
> @@ -2390,9 +2444,11 @@ static int brcmnand_set_cfg(struct brcmnand_host *host,
>  
>  	tmp = nand_readreg(ctrl, acc_control_offs);
>  	tmp &= ~brcmnand_ecc_level_mask(ctrl);
> -	tmp |= cfg->ecc_level << NAND_ACC_CONTROL_ECC_SHIFT;
>  	tmp &= ~brcmnand_spare_area_mask(ctrl);
> -	tmp |= cfg->spare_area_size;
> +	if (ctrl->nand_version >= 0x0302) {
> +		tmp |= cfg->ecc_level << NAND_ACC_CONTROL_ECC_SHIFT;
> +		tmp |= cfg->spare_area_size;
> +	}
>  	nand_writereg(ctrl, acc_control_offs, tmp);
>  
>  	brcmnand_set_sector_size_1k(host, cfg->sector_size_1k);
> @@ -2766,6 +2822,8 @@ const struct dev_pm_ops brcmnand_pm_ops = {
>  EXPORT_SYMBOL_GPL(brcmnand_pm_ops);
>  
>  static const struct of_device_id brcmnand_of_match[] = {
> +	{ .compatible = "brcm,brcmnand-v2.1" },
> +	{ .compatible = "brcm,brcmnand-v2.2" },
>  	{ .compatible = "brcm,brcmnand-v4.0" },
>  	{ .compatible = "brcm,brcmnand-v5.0" },
>  	{ .compatible = "brcm,brcmnand-v6.0" },

You should also document these new bindings in a separate patch
(before this one).

Thanks,
Miquèl
