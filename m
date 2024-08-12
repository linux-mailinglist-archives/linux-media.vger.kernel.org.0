Return-Path: <linux-media+bounces-16124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74E94E965
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 11:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68A1285040
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F9316D31C;
	Mon, 12 Aug 2024 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUifByFR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7751514C1;
	Mon, 12 Aug 2024 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723453862; cv=none; b=H4ElSzTtdv7PG5Rm3Ivsnlh3z74+NqlO8EqJGfUDLknF1VKR2NVCVagrabmB7lQeqClc3oAl+antwipP3QdIVmUIIYoIR2u7HSW4qGDDJ+bO18g2i216BV6HLCqTgNEvm7RLGYIwYLElb8xQCov8GAKp5OPvee6I6g8nHqcgbf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723453862; c=relaxed/simple;
	bh=6w24byYPTuPCQaD6i32KojgBe6g8yOmIfU/mQCcqd2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKRLx64Cg9NT0m5KqG+zrtazxD74PQrQ5NbDKRjzLC2FvfsrMT6PIiQX++4KH8RbCRHOrfCT6hDg5nn+f85tsskNPdIqFLsVvL3oAL6yKbuyt7xAR6q3+qayV44gR0WRPaqdemA9Go4CM+k5ARK28V6sZ0QTO9ru0gnovzUdge4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUifByFR; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-710dc3015bfso1643739b3a.0;
        Mon, 12 Aug 2024 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723453859; x=1724058659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbLZ5dCoPsdwTyeNVCcvlmPovT34F55bkVY8uQUTF1s=;
        b=bUifByFRbe42QxbQ8P23eELlpzLLOrP2zBej0UulABbSS/4YJ4tciR3XdlsnjUN7fO
         JeF8IeVSFxxBnSfnv2lZ4ZdLSNn1Vpz4ZPZvpEfOPS36M+cKR3Jsil7eMu7b30pR7sPO
         ayl84eCEPxdfHOKznVmkNAhwCEooWM2BWVdRbe4IqLttObr5vfUSzOO+dCMsprHksoPG
         Y5xU6VLnvG6nHlSbS/uuUAkmDo7xt8s3ApgEQVoFdp4QDcuzmV7LTmAA8AJtkFIWCX7n
         1l5hmiWrsmAhrtFJK710prR1FRgrC9sxnvxN38fCP0SVawjRmWrWFRf+BBXYojyOjI+Q
         pyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723453859; x=1724058659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbLZ5dCoPsdwTyeNVCcvlmPovT34F55bkVY8uQUTF1s=;
        b=aPjVAf4t4k3EzCLisYed/qjoSDxEnCp02dG/WgvpH1tPqCs+7qzIrz5PSm2Ry7/fvU
         Zs/9yTjQclplC6/9muEv4EFpOlVpGlI25wdST2wgatLceHsjr/x3ueoNg/IhD/2U4FGu
         dvNQL8steB1NFYalXZNl6Lhq6ACIePhQMipplNomDtDJz+Fq/esyLscdWiOmawbIievK
         Z8dW1AQYR1JOkST+FUynwGHNDjXMMTZDsMUbLw0WQrUKlnnlAqjn0yrKHeiItNvIjK7l
         BbacmjGXJ4Qc76z2ijDFMMl1mT3j/ChuldwZ6QSBpfSNT6FFz3A3GNBSFXmvX9Q7NRE7
         /kWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqtPh5letVxqUKBAXGsrw7OOmRhykRdfo9XSEnKoPK092/mygkd5Pwf2mh8WpvJEwloPvCLR5P2GCEKCsfXBGmyUaqGUqzhXVHSHvjCs/9olA08czAIQiYnmbaPCMCBPHzb9mWLWhPRPvRKKwkOQtO7KX01HBPkyfYyWeePEwlQB+YxpDv
X-Gm-Message-State: AOJu0YxJRwM0rXQCTyFop38qTRVdl4tV6eDMfPYx11AjD/PQbiuEGrx7
	XjYCsYdHeNn8cPj7VmhLOMJq5F/vPO4WupOIE4FbvP2hALp2xM1v
X-Google-Smtp-Source: AGHT+IHv7g+NvMmJJN0BOqzszF+plno4uqLKCvFaGXnUA7yNAW3H05K1hZN0Vzr67OhI0CnnYzZOBw==
X-Received: by 2002:a05:6a00:114a:b0:70e:98e2:c76e with SMTP id d2e1a72fcca58-710dcd368bbmr12969264b3a.6.1723453859105;
        Mon, 12 Aug 2024 02:10:59 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5ac416bsm3566679b3a.219.2024.08.12.02.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:10:58 -0700 (PDT)
Message-ID: <3b7b629e-0085-4821-932c-e89faad15c1a@gmail.com>
Date: Mon, 12 Aug 2024 17:10:56 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton
 MA35 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
 <20240812030045.20831-3-hpchen0nvt@gmail.com>
 <06d627d5-947c-4da4-826a-76033386b575@kernel.org>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <06d627d5-947c-4da4-826a-76033386b575@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,

Thank you for your reply.



On 2024/8/12 下午 02:30, Krzysztof Kozlowski wrote:
> On 12/08/2024 05:00, Hui-Ping Chen wrote:
>> Nuvoton MA35 SoCs NAND Flash Interface Controller
>> supports 2KB, 4KB and 8KB page size, and up to 8-bit,
>> 12-bit, and 24-bit hardware ECC calculation circuit
>> to protect data communication.
>>
>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
>> ---
>>   drivers/mtd/nand/raw/Kconfig               |    8 +
>>   drivers/mtd/nand/raw/Makefile              |    1 +
>>   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c | 1109 ++++++++++++++++++++
>>   3 files changed, 1118 insertions(+)
>>   create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
>>
>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>> index 614257308516..932bf2215470 100644
>> --- a/drivers/mtd/nand/raw/Kconfig
>> +++ b/drivers/mtd/nand/raw/Kconfig
>> @@ -448,6 +448,14 @@ config MTD_NAND_RENESAS
>>   	  Enables support for the NAND controller found on Renesas R-Car
>>   	  Gen3 and RZ/N1 SoC families.
>>   
>> +config MTD_NAND_NVT_MA35
>> +	tristate "Nuvoton MA35 SoC NAND controller"
>> +	depends on ARCH_MA35 || COMPILE_TEST
>> +	depends on OF
>> +	help
>> +	  Enables support for the NAND controller found on
>> +	  the Nuvoton MA35 series SoCs.
>> +
>>   comment "Misc"
>>   
>>   config MTD_SM_COMMON
>> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
>> index 25120a4afada..cdfdfee3f5f3 100644
>> --- a/drivers/mtd/nand/raw/Makefile
>> +++ b/drivers/mtd/nand/raw/Makefile
>> @@ -57,6 +57,7 @@ obj-$(CONFIG_MTD_NAND_INTEL_LGM)	+= intel-nand-controller.o
>>   obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+= rockchip-nand-controller.o
>>   obj-$(CONFIG_MTD_NAND_PL35X)		+= pl35x-nand-controller.o
>>   obj-$(CONFIG_MTD_NAND_RENESAS)		+= renesas-nand-controller.o
>> +obj-$(CONFIG_MTD_NAND_NVT_MA35)	+= nuvoton_ma35d1_nand.o
>>   
>>   nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
>>   nand-objs += nand_onfi.o
>> diff --git a/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c b/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
>> new file mode 100644
>> index 000000000000..7445eb489c38
>> --- /dev/null
>> +++ b/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
>> @@ -0,0 +1,1109 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2024 Nuvoton Technology Corp.
>> + */
>> +#include <linux/slab.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/delay.h>
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/of.h>
>> +
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/mtd/rawnand.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/dmaengine.h>
>> +
>> +/* NFI DMA Registers */
>> +#define MA35_NFI_REG_BUFFER0		(0x000)
>> +#define MA35_NFI_REG_DMACTL		(0x400)
>> +#define   DMA_EN				BIT(0)
>> +#define   DMA_RST				BIT(1)
>> +#define   DMA_BUSY				BIT(9)
>> +
>> +#define MA35_NFI_REG_DMASA		(0x408)
>> +#define MA35_NFI_REG_DMABCNT		(0x40C)
>> +#define MA35_NFI_REG_DMAINTEN		(0x410)
>> +#define MA35_NFI_REG_DMAINTSTS	(0x414)
>> +
>> +/* NFI Global Registers */
>> +#define MA35_NFI_REG_GCTL		(0x800)
>> +#define   NAND_EN				BIT(3)
>> +#define MA35_NFI_REG_GINTEN		(0x804)
>> +#define MA35_NFI_REG_GINTSTS		(0x808)
>> +
>> +/* NAND-type Flash Registers */
>> +#define MA35_NFI_REG_NANDCTL		(0x8A0)
>> +#define   SWRST				BIT(0)
>> +#define   DMA_W_EN				BIT(1)
>> +#define   DMA_R_EN				BIT(2)
>> +#define   ECC_CHK				BIT(7)
>> +#define   PROT3BEN				BIT(8)
>> +#define   PSIZE_2K				(1 << 16)
>> +#define   PSIZE_4K				(2 << 16)
>> +#define   PSIZE_8K				(3 << 16)
>> +#define   PSIZE_MASK				(3 << 16)
>> +#define   BCH_T24				BIT(18)
>> +#define   BCH_T8				BIT(20)
>> +#define   BCH_T12				BIT(21)
>> +#define   BCH_MASK				(0x1f << 18)
>> +#define   ECC_EN				BIT(23)
>> +#define   DISABLE_CS0				BIT(25)
>> +
>> +#define MA35_NFI_REG_NANDTMCTL	(0x8A4)
>> +#define MA35_NFI_REG_NANDINTEN	(0x8A8)
>> +#define MA35_NFI_REG_NANDINTSTS	(0x8AC)
>> +#define   INT_DMA				BIT(0)
>> +#define   INT_ECC				BIT(2)
>> +#define   INT_RB0				BIT(10)
>> +#define   INT_RB0_STS				BIT(18)
>> +
>> +#define MA35_NFI_REG_NANDCMD		(0x8B0)
>> +#define MA35_NFI_REG_NANDADDR		(0x8B4)
>> +#define   ENDADDR				BIT(31)
>> +
>> +#define MA35_NFI_REG_NANDDATA		(0x8B8)
>> +#define MA35_NFI_REG_NANDRACTL	(0x8BC)
>> +#define MA35_NFI_REG_NANDECTL		(0x8C0)
>> +#define   ENABLE_WP				(0x0)
>> +#define   DISABLE_WP				BIT(0)
>> +
>> +#define MA35_NFI_REG_NANDECCES0	(0x8D0)
>> +#define   ECC_STATUS_MASK			(0x3)
>> +#define   ECC_ERR_CNT_MASK			(0x1f)
>> +
>> +#define MA35_NFI_REG_NANDECCES1	(0x8D4)
>> +#define MA35_NFI_REG_NANDECCES2	(0x8D8)
>> +#define MA35_NFI_REG_NANDECCES3	(0x8DC)
>> +
>> +/* NAND-type Flash BCH Error Address Registers */
>> +#define MA35_NFI_REG_NANDECCEA0	(0x900)
>> +#define MA35_NFI_REG_NANDECCEA1	(0x904)
>> +#define MA35_NFI_REG_NANDECCEA2	(0x908)
>> +#define MA35_NFI_REG_NANDECCEA3	(0x90C)
>> +#define MA35_NFI_REG_NANDECCEA4	(0x910)
>> +#define MA35_NFI_REG_NANDECCEA5	(0x914)
>> +#define MA35_NFI_REG_NANDECCEA6	(0x918)
>> +#define MA35_NFI_REG_NANDECCEA7	(0x91C)
>> +#define MA35_NFI_REG_NANDECCEA8	(0x920)
>> +#define MA35_NFI_REG_NANDECCEA9	(0x924)
>> +#define MA35_NFI_REG_NANDECCEA10	(0x928)
>> +#define MA35_NFI_REG_NANDECCEA11	(0x92C)
>> +
>> +/* NAND-type Flash BCH Error Data Registers */
>> +#define MA35_NFI_REG_NANDECCED0	(0x960)
>> +#define MA35_NFI_REG_NANDECCED1	(0x964)
>> +#define MA35_NFI_REG_NANDECCED2	(0x968)
>> +#define MA35_NFI_REG_NANDECCED3	(0x96C)
>> +#define MA35_NFI_REG_NANDECCED4	(0x970)
>> +#define MA35_NFI_REG_NANDECCED5	(0x974)
>> +
>> +/* NAND-type Flash Redundant Area Registers */
>> +#define MA35_NFI_REG_NANDRA0		(0xA00)
>> +#define MA35_NFI_REG_NANDRA1		(0xA04)
>> +
>> +#define SKIP_SPARE_BYTES	4
>> +
>> +/* BCH algorithm related constants and variables */
>> +enum {
>> +	eBCH_NONE = 0,
>> +	eBCH_T8,
>> +	eBCH_T12,
>> +	eBCH_T24,
>> +	eBCH_CNT
>> +} E_BCHALGORITHM;
>> +
>> +static const int g_i32BCHAlgoIdx[eBCH_CNT] = {BCH_T8, BCH_T8, BCH_T12, BCH_T24};
>> +static struct nand_ecclayout_user ma35_nand_oob;
> Why this is file-scope?

I will remove the `static`.



>> +static const int g_i32ParityNum[3][eBCH_CNT] = {
>
> This is not a Linux coding style. Do not send Windows or some other
> platform-independent patches to review.
>
This is my mistake. I should have modified it instead of copying it 
directly.

I will fix it.



>> +	{0,  60,  92,  90},  /* for 2K */
>> +	{0, 120, 184, 180},  /* for 4K */
>> +	{0, 240, 368, 360},  /* for 8K */
>> +};
>> +
>> +
>> +struct ma35_nand_info {
>> +	struct nand_controller controller;
>> +	struct device *dev;
>> +	void __iomem *regs;
>> +	int irq;
>> +	struct clk *clk;
>> +	struct completion complete;
>> +
>> +	struct mtd_info mtd;
>> +	struct nand_chip chip;
>> +	struct mtd_partition *parts;
>> +	int nr_parts;
>> +
>> +	int eBCHAlgo;
> No, use Linux coding style.

I will fix it.



>> +	u8 *dma_buf;
>> +	spinlock_t dma_lock;
>> +	dma_addr_t dma_addr;
>> +};
>> +
>> +static int ma35_ooblayout_ecc(struct mtd_info *mtd, int section,
>> +			      struct mtd_oob_region *oobregion)
>> +{
>> +	struct nand_chip *chip = mtd_to_nand(mtd);
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +
>> +	if (section || !ecc->total)
>> +		return -ERANGE;
>> +
>> +	oobregion->length = ecc->total;
>> +	oobregion->offset = mtd->oobsize - oobregion->length;
>> +
>> +	return 0;
>> +}
> ... this code looks poor, really poor.

I will rewrite this function.



>> +}
>> +
>> +static int ma35_nfi_correct(struct nand_chip *chip, unsigned long addr)
>> +{
>> +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	int uStatus, i, j, i32FieldNum = 0;
>> +	int uReportErrCnt = 0;
>> +	int uErrorCnt = 0;
>> +
> More of weird coding style. Use Linux coding style. Patch is for Linux.

I will fix it.



>> +	if ((readl(nand->regs + MA35_NFI_REG_NANDCTL) & BCH_MASK) == BCH_T24)
>> +		i32FieldNum = mtd->writesize / 1024;
>> +	else
>> +		i32FieldNum = mtd->writesize / 512;
>
> ...

I will fix it.



>> +static int ma35_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand;
>> +	struct nand_chip *chip;
>> +	struct mtd_info *mtd;
>> +	int retval = 0;
>> +
>> +	nand = devm_kzalloc(&pdev->dev, sizeof(struct ma35_nand_info), GFP_KERNEL);
> sizeof(*)

I will fix it.



>> +	if (!nand)
>> +		return -ENOMEM;
>> +
>> +	nand_controller_init(&nand->controller);
>> +
>> +	nand->regs = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(nand->regs))
>> +		return PTR_ERR(nand->regs);
>> +
>> +	nand->dev = &pdev->dev;
>> +	chip = &nand->chip;
>> +	mtd = nand_to_mtd(chip);
>> +	nand_set_controller_data(chip, nand);
>> +	nand_set_flash_node(chip, pdev->dev.of_node);
>> +
>> +	mtd->priv = chip;
>> +	mtd->owner = THIS_MODULE;
>> +	mtd->dev.parent = &pdev->dev;
>> +
>> +	nand->clk = of_clk_get(pdev->dev.of_node, 0);
> No, no. That's not how you get a clock. Use devm_clk_get().

I will fix it.



>> +	if (IS_ERR(nand->clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(nand->clk),
>> +				     "failed to find nand clock\n");
>> +
>> +	retval = clk_prepare_enable(nand->clk);
>> +	if (retval < 0) {
>> +		dev_err(&pdev->dev, "Failed to enable clock\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +	nand->chip.controller    = &nand->controller;
>> +
>> +	chip->legacy.cmdfunc     = ma35_nand_command;
>> +	chip->legacy.waitfunc    = ma35_waitfunc;
>> +	chip->legacy.read_byte   = ma35_nand_read_byte;
>> +	chip->legacy.select_chip = ma35_nand_select_chip;
>> +	chip->legacy.read_buf    = ma35_read_buf_dma;
>> +	chip->legacy.write_buf   = ma35_write_buf_dma;
>> +	chip->legacy.dev_ready   = ma35_nand_devready;
>> +	chip->legacy.chip_delay  = 25; /* us */
>> +
>> +	/* Read OOB data first, then HW read page */
>> +	chip->ecc.hwctl      = ma35_nand_enable_hwecc;
>> +	chip->ecc.calculate  = ma35_nand_calculate_ecc;
>> +	chip->ecc.correct    = ma35_nand_correct_data;
>> +	chip->ecc.write_page = ma35_nand_write_page_hwecc;
>> +	chip->ecc.read_page  = ma35_nand_read_page_hwecc_oob_first;
>> +	chip->ecc.read_oob   = ma35_nand_read_oob_hwecc;
>> +	chip->options |= (NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA);
>> +
>> +	ma35_nand_initialize(nand);
>> +	platform_set_drvdata(pdev, nand);
>> +
>> +	nand->controller.ops = &ma35_nand_controller_ops;
>> +
>> +	nand->irq = platform_get_irq(pdev, 0);
>> +	if (nand->irq < 0) {
>> +		dev_err(&pdev->dev, "failed to get platform irq\n");
> Syntax is return dev_err_probe

I will fix it.



>> +		return -EINVAL;
>> +	}
>> +
>> +	if (request_irq(nand->irq, (irq_handler_t)&ma35_nand_irq,
>> +			IRQF_TRIGGER_HIGH, "ma35d1-nand", nand)) {
>> +		dev_err(&pdev->dev, "Error requesting NAND IRQ\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +	retval = nand_scan(chip, 1);
>> +	if (retval)
>> +		return retval;
>> +
>> +	if (mtd_device_register(mtd, nand->parts, nand->nr_parts)) {
>> +		nand_cleanup(chip);
>> +		devm_kfree(&pdev->dev, nand);
>> +		return retval;
>> +	}
>> +
>> +	pr_info("ma35-nfi: registered successfully! mtdid=%s\n", mtd->name);
> Drop, does not help.
>
> Drivers do not use pr_xxx anyway. Why your code is so inconsistent? It's
> like random junk glued together.

I will remove all the `pr_info`.



>> +
>> +	return retval;
>> +}
>> +
>> +static void ma35_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
>> +	struct nand_chip *chip = &nand->chip;
>> +	int ret;
>> +
>> +	ret = mtd_device_unregister(nand_to_mtd(chip));
>> +	WARN_ON(ret);
>> +	nand_cleanup(chip);
>> +
>> +	clk_disable_unprepare(nand->clk);
>> +
>> +	kfree(nand);
>> +	platform_set_drvdata(pdev, NULL);
>> +}
>> +
>> +/* PM Support */
>> +#ifdef CONFIG_PM
>> +static int ma35_nand_suspend(struct platform_device *pdev, pm_message_t pm)
>> +{
>> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
>> +	unsigned long timeo = jiffies + HZ/2;
>> +
>> +	/* wait DMAC to ready */
>> +	while (1) {
>> +		if ((readl(nand->regs + MA35_NFI_REG_DMACTL) & DMA_BUSY) == 0)
>> +			break;
>> +		if (time_after(jiffies, timeo))
>> +			return -ETIMEDOUT;
>> +	}
>> +
>> +	clk_disable(nand->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35_nand_resume(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
>> +
>> +	clk_enable(nand->clk);
>> +	ma35_nand_hwecc_init(nand);
>> +	ma35_nand_dmac_init(nand);
>> +
>> +	return 0;
>> +}
>> +
>> +#else
>> +#define ma35_nand_suspend NULL
>> +#define ma35_nand_resume NULL
>> +#endif
>> +
>> +static const struct of_device_id ma35_nfi_of_match[] = {
>> +	{ .compatible = "nuvoton,ma35d1-nand" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, ma35_nfi_of_match);
>> +
>> +static struct platform_driver ma35_nand_driver = {
>> +		.driver = {
>> +		.name   = "ma35d1-nand",
>> +		.owner  = THIS_MODULE,
>> +		.of_match_table = of_match_ptr(ma35_nfi_of_match),
> Drop of_match_ptr. You have warnings here.

Okay. I will remove it.



>> +		},
>> +		.probe = ma35_nand_probe,
>> +		.remove_new = ma35_nand_remove,
>> +		.suspend = ma35_nand_suspend,
>> +		.resume = ma35_nand_resume,
>> +};
>> +
>> +static int __init ma35_nand_init(void)
>> +{
>> +	int ret;
>> +
>> +	pr_info("ma35 mtd nand driver\n");
> NAK, drop, useless and really pointless.

I will remove all the `pr_info`.



>> +
>> +	ret = platform_driver_register(&ma35_nand_driver);
>> +	if (ret) {
>> +		pr_warn("nand: failed to add device driver %s\n",
>> +			ma35_nand_driver.driver.name);
>> +		return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void __exit ma35_nand_exit(void)
>> +{
>> +	platform_driver_unregister(&ma35_nand_driver);
>> +	pr_info("nand: unregistered successfully!\n");
> NAK, drop, useless and really pointless.

I will remove all the `pr_info`.



>> +}
>> +
>> +module_init(ma35_nand_init);
>> +module_exit(ma35_nand_exit);
> Do not open-code these functions, there are wrappers for this.

Okay. I will remove it.



>> +
>> +MODULE_DESCRIPTION("Nuvoton ma35 NAND driver");
>> +MODULE_AUTHOR("Hui-Ping Chen <hpchen0nvt@gmail.com>");
>> +MODULE_LICENSE("GPL");
> Best regards,
> Krzysztof


Best regards,

Hui-Ping Chen



