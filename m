Return-Path: <linux-media+bounces-18397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C2A97C3C4
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 07:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98FC91F21D45
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 05:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C311BC44;
	Thu, 19 Sep 2024 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAMXf2vE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A27D1859;
	Thu, 19 Sep 2024 05:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726722401; cv=none; b=MPt7YPHUWtihQ0+DZiNCLiF2TJnA2pUApG8yHDcWcntJhz+DBvz0wGbTG7II3Ty+o/dXXjweKNB9XMwhSmPBg1q5AEZp9tetXXZEhkbJilzoZuc6AKTkjXCJkiXl8AcmGH+jB+EOKcic5jenAjnZ6d3IIIkWa19gqwNBd/sxEXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726722401; c=relaxed/simple;
	bh=VlwACfUfr8PJ/Z7o55InbtIVuxggWae7EOJMcTzQTfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpyFQu8OsrVXSNgg1VutRE7TNDWP8FGno0skjjgltZaH/mWNvcOdYqel+i6xBLZyHcGp9xFhZ1n/9riIxYDtlJkKBQg4IWamifogBBBscWIVCV0SzWy5VhO3PgXfZFsHMtGHAfT5HxAm7nqJD3dvfwJDbqrykma/S2aLJIBpkfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAMXf2vE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2055a3f80a4so3426395ad.2;
        Wed, 18 Sep 2024 22:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726722399; x=1727327199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRZ6kZIXMDkvuvzVlk8DqRdvcI2YElVnlDqYB8dJ4es=;
        b=gAMXf2vEeMS8dYJ4M3UGtFo6EOjr1I63yBCxvJOFpEDEYoFm0teoLMU9BNSIhPfeOq
         rQ7UBiuC456G2MZ8lel5pWNAUi+kUXVFU0VdbiFIYjurm08g6NzGzs74G0+DI9F0jM63
         aeAVqLfBuwz1vhttSd+4VbMjWJzuAG1CvaJKQExTEtTI1tiLaWGwFmxaoFrxue3GEWEH
         KWeU6lmwGphtYmaeSyc/cHUlCY9ObNFVggpXDVVEivi+5uCJ8GMjHbywMtrJGoBzPzW0
         /0EHwJjW5iLz0eWHEogUWZtRGET25Gc6kHNg6fNoItsnDO7VbInsDb8dQa9vUlfW7HWT
         7B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726722399; x=1727327199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRZ6kZIXMDkvuvzVlk8DqRdvcI2YElVnlDqYB8dJ4es=;
        b=jCaLphOE3+fps+q/IiuB4H4rDJ0jVCeRluMCF4ZaMMMGg0Y3yzsxdnoIwHlsPSbarB
         uzWspxCxvrq59j0OUWx3Ma64RgbSkMwVXXwZFGbEcB5NTAt7UN/uxzqMHQRBDthATNyB
         NGyVYG47xXGR9WkZtRz6L+yvsM47Etzy/4ZYbcSmTQdK2q+UICT9Do/t2p+FYwFBPWgY
         vraLrpRDPa9NaPB2i/yxe6KcKXHfhIBPNvyWskm7AWOO+357uwlsnijfV3C3OgzZ9wu1
         5G0+0wAt75NUXGLRDFTVfL+q7S0ABjih7ZiDTgqITOo3HuxcIe5Sz9YgZwp/U2M0APL3
         soHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzX2iV391jhZEKJXwb6px2O9hpBTL1tXL9grRmobWqTQxcfQzFG8iI2O9GX+bSN4nm1Ix8kwLJ4jN88Zo=@vger.kernel.org, AJvYcCWZJulrcM+EDK2G/qdAjnv1gxEWmvlrPV3jDg/X2w7De9E6HxBVtVz0+aiDFJIrtfa/2M+cKppg6+ZFxyjM@vger.kernel.org, AJvYcCXME8E84LJlPCIQI9xA5ZEEuK6Dv59ZReVE/NrxtunPI+iQ1YBtt6atT0+JbzCyfXk/1O0Xbov0KJWf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45L9GzvC/HOsnXTBmYAbNNY8jBvX1Nh79CVJIC0q4voN/eg8d
	EC3tIP62Uf09kyModvFb1tL7zBHf+Wwvl0tZ2mXUsMMovANf6WVyo33hVg==
X-Google-Smtp-Source: AGHT+IEBzBgKJNZ9ImAhnxz5MW6/LIqkckCtdwbFUVbzpE4n8F6xLUpmtGRYLkYQYN6R+O6sc+4A5A==
X-Received: by 2002:a17:902:cf42:b0:202:3711:6fe9 with SMTP id d9443c01a7336-2076e4485fbmr369904095ad.51.1726722398917;
        Wed, 18 Sep 2024 22:06:38 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d28b4sm72515445ad.177.2024.09.18.22.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 22:06:38 -0700 (PDT)
Message-ID: <efe29129-ce26-44a5-ac02-b3cb3786662e@gmail.com>
Date: Thu, 19 Sep 2024 13:06:33 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240918090308.292617-1-hpchen0nvt@gmail.com>
 <20240918090308.292617-3-hpchen0nvt@gmail.com>
 <ZuqyRXi-LWZ7-Qgw@pengutronix.de>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <ZuqyRXi-LWZ7-Qgw@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Sascha,

Thank you for your reply.



On 2024/9/18 下午 06:58, Sascha Hauer wrote:
> Hi,
>
> The driver has a few minor whitespace issues, please run through
> checkpatch.pl to catch them.

I will fix it.


> Some more things inline.
>
> On Wed, Sep 18, 2024 at 09:03:08AM +0000, Hui-Ping Chen wrote:
>> Nuvoton MA35 SoCs NAND Flash Interface Controller
>> supports 2kiB, 4kiB and 8kiB page size, and up to
>> 8-bit, 12-bit, and 24-bit hardware ECC calculation
>> circuit to protect data.
>>
>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
>> ---
>>   drivers/mtd/nand/raw/Kconfig               |   8 +
>>   drivers/mtd/nand/raw/Makefile              |   1 +
>>   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c | 935 +++++++++++++++++++++
>>   3 files changed, 944 insertions(+)
>>   create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
>>
>> +#define SKIP_SPARE_BYTES	4
> Unused, please drop.

I will remove it.


>> +static int ma35_nfi_ecc_check(struct nand_chip *chip, unsigned long addr)
>> +{
>> +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	int status, i, j, nchunks = 0;
> status should be unsigned.

Okay, I will modify it.


>> +	int report_err = 0;
>> +	int err_cnt = 0;
>> +
>> +	nchunks = mtd->writesize / chip->ecc.steps;
>> +	if (nchunks < 4)
>> +		nchunks = 1;
>> +	else
>> +		nchunks /= 4;
>> +
>> +	for (j = 0; j < nchunks; j++) {
>> +		status = readl(nand->regs + MA35_NFI_REG_NANDECCES0 + j*4);
>> +		if (!status)
>> +			continue;
>> +
>> +		for (i = 0; i < 4; i++) {
>> +			if (!(status & ECC_STATUS_MASK)) {
>> +				/* No error */
>> +				status >>= 8;
>> +				continue;
>> +
>> +			} else if ((status & ECC_STATUS_MASK) == 0x01) {
>> +				/* Correctable error */
>> +				err_cnt = (status >> 2) & ECC_ERR_CNT_MASK;
>> +				dev_warn(nand->dev, "nchunks (%d, %d) have %d error!\n",
>> +					j, i, err_cnt);
> Correctable bitflips are expected. Please don't spam the log with it.

I will remove it.


>> +				ma35_nfi_correct(nand, j*4+i, err_cnt, (u8 *)addr);
>> +				report_err += err_cnt;
>> +
>> +			} else {
>> +				/* uncorrectable error */
>> +				dev_warn(nand->dev, "uncorrectable error! 0x%4x\n", status);
>> +				return -1;
>> +			}
>> +			status >>= 8;
>> +		}
>> +	}
>> +	return report_err;
> There are a few things wrong here. Your chip->ecc.read_page op must
> return the maximum number of bitflips occured on a subpage while
> reading a page.
>
> To archieve this I suggest you fix the return value of this function
> accordingly and call it from chip->ecc.read_page rather than from the
> interrupt handler.
>
> Nevertheless mtd->ecc_stats.corrected counts the total number of
> bitflips, so you must handle this counter in this function.
>
> See rk_nfc_read_page_hwecc() as an example of a driver which gets it
> right.
>
> The background is that we have to rewrite the page once one ECC block
> hits a critical bitflip limit. A whole page might be fine when the
> bitflips are evenly distributed across the subpages, but it's not when
> all bitflips are occur in a single subpage.

I will refer to rk_nfc_read_page_hwecc() and then rewrite it.


>> +static int ma35_nand_do_write(struct nand_chip *chip, const u8 *addr, u32 len)
>> +{
>> +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	dma_addr_t dma_addr;
>> +	int ret = 0, i;
>> +	u32 val, reg;
>> +
>> +	ma35_nand_target_enable(nand);
>> +
>> +	if (len != mtd->writesize) {
>> +		for (i = 0; i < len; i++)
>> +			writel(addr[i], nand->regs + MA35_NFI_REG_NANDDATA);
>> +		ma35_nand_target_disable(nand);
>> +		return ret;
>> +	}
>> +
>> +	/* Check the DMA status before enabling the DMA */
>> +	ret = readl_poll_timeout(nand->regs + MA35_NFI_REG_DMACTL, val,
>> +				 !(val & DMA_BUSY), 50, HZ/2);
>> +	if (ret)
>> +		dev_warn(nand->dev, "dma busy\n");
>> +
>> +	/* Reinitial dmac */
>> +	ma35_nand_dmac_init(nand);
> The function name already says it and the comment doesn't offer any
> additional information. Please drop such comments.

I will remove it.


>> +
>> +	writel(mtd->oobsize, nand->regs + MA35_NFI_REG_NANDRACTL);
>> +
>> +	/* setup and start DMA using dma_addr */
>> +	writel(INT_DMA, nand->regs + MA35_NFI_REG_NANDINTEN);
>> +	/* To mark this page as dirty. */
>> +	reg = readl(nand->regs + MA35_NFI_REG_NANDRA0);
>> +	if (reg & 0xffff0000)
>> +		writel(reg & 0xffff, nand->regs + MA35_NFI_REG_NANDRA0);
>> +
>> +	/* Fill dma_addr */
>> +	dma_addr = dma_map_single(nand->dev, (void *)addr, len, DMA_TO_DEVICE);
>> +	dma_sync_single_for_device(nand->dev, dma_addr, len, DMA_TO_DEVICE);
>> +	ret = dma_mapping_error(nand->dev, dma_addr);
>> +	if (ret) {
>> +		dev_err(nand->dev, "dma mapping error\n");
>> +		return -EINVAL;
>> +	}
> Call dma_sync_single_for_device() after you have checked for an error
> with dma_mapping_error().
>
> That said, I think calling dma_sync_single_for_device() after
> dma_map_single() is unnecessary.

I will modify the calling sequence.


>> +
>> +	writel((unsigned long)dma_addr, nand->regs + MA35_NFI_REG_DMASA);
>> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DMA_W_EN,
>> +		nand->regs + MA35_NFI_REG_NANDCTL);
>> +	ret = wait_for_completion_timeout(&nand->complete, msecs_to_jiffies(1000));
>> +	if (!ret) {
>> +		dev_err(nand->dev, "write timeout\n");
>> +		ret = -ETIMEDOUT;
>> +	}
>> +
>> +	dma_unmap_single(nand->dev, dma_addr, len, DMA_TO_DEVICE);
>> +
>> +	ma35_nand_target_disable(nand);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ma35_nand_do_read(struct nand_chip *chip, const u8 *addr, u32 len)
> The addr argument shouldn't be const. You are supposed to write to this
> buffer and you actually do so.

I will change this argument to u8 *.


>> +{
>> +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	u8 *ptr = (u8 *)addr;
>> +	dma_addr_t dma_addr;
>> +	int ret = 0, i;
>> +	u32 val;
>> +
>> +	ma35_nand_target_enable(nand);
>> +
>> +	if (len != mtd->writesize) {
>> +		for (i = 0; i < len; i++)
>> +			*(ptr+i) = (u8)readl(nand->regs + MA35_NFI_REG_NANDDATA);
>> +		ma35_nand_target_disable(nand);
>> +		return ret;
> Just return 0 here. It's easier to read than having to look up the
> initialization value.

I will change it to return 0 directly.


>> +	}
>> +
>> +	/* Check the DMA status before enabling the DMA */
>> +	ret = readl_poll_timeout(nand->regs + MA35_NFI_REG_DMACTL, val,
>> +				 !(val & DMA_BUSY), 50, HZ/2);
>> +	if (ret)
>> +		dev_warn(nand->dev, "dma busy\n");
>> +
>> +	/* Reinitial dmac */
>> +	ma35_nand_dmac_init(nand);
>> +
>> +	writel(mtd->oobsize, nand->regs + MA35_NFI_REG_NANDRACTL);
>> +
>> +	/* setup and start DMA using dma_addr */
>> +	dma_addr = dma_map_single(nand->dev, (void *)addr, len, DMA_FROM_DEVICE);
>> +	ret = dma_mapping_error(nand->dev, dma_addr);
>> +	if (ret) {
>> +		dev_err(nand->dev, "dma mapping error\n");
>> +		return -EINVAL;
>> +	}
>> +	nand->dma_buf = (u8 *)addr;
>> +	nand->dma_addr = dma_addr;
>> +
>> +	writel((unsigned long)dma_addr, nand->regs + MA35_NFI_REG_DMASA);
>> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DMA_R_EN,
>> +		nand->regs + MA35_NFI_REG_NANDCTL);
>> +	ret = wait_for_completion_timeout(&nand->complete, msecs_to_jiffies(1000));
>> +	if (!ret) {
>> +		dev_err(nand->dev, "read timeout\n");
>> +		ret = -ETIMEDOUT;
>> +	}
>> +
>> +	dma_sync_single_for_cpu(nand->dev, dma_addr, len, DMA_FROM_DEVICE);
>> +	dma_unmap_single(nand->dev, dma_addr, len, DMA_FROM_DEVICE);
> No need to call dma_sync_single_for_cpu() before dma_unmap_single().

I will remove it.


>> +
>> +	ma35_nand_target_disable(nand);
>> +
>> +	return ret;
>> +}
>> +
>> +
>> +static int ma35_nand_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
>> +				      int oob_required, int page)
>> +{
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	u8 *ecc_calc = chip->ecc.calc_buf;
> Make this a void * to get rid of the explicit casting below.

I will modify it.


>> +
>> +	ma35_clear_spare(chip, mtd->oobsize);
>> +	ma35_write_spare(chip, mtd->oobsize - chip->ecc.total, (u32 *)chip->oob_poi);
>> +
>> +	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
>> +	nand_prog_page_end_op(chip);
>> +
>> +	/* Copy parity code in NANDRA to calc */
>> +	ma35_read_spare(chip, chip->ecc.total, (u32 *)ecc_calc,
>> +			mtd->oobsize - chip->ecc.total);
>> +
>> +	/* Copy parity code in calc to oob_poi */
>> +	memcpy((void *)(chip->oob_poi + (mtd->oobsize - chip->ecc.total)),
>> +		(void *)ecc_calc, chip->ecc.total);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t ma35_nand_irq(int irq, void *id)
>> +{
>> +	struct ma35_nand_info *nand = (struct ma35_nand_info *)id;
>> +	struct mtd_info *mtd = nand_to_mtd(&nand->chip);
>> +	int stat = 0;
>> +	u32 isr;
>> +
>> +	spin_lock(&nand->dma_lock);
>> +
>> +	isr = readl(nand->regs + MA35_NFI_REG_NANDINTSTS);
>> +	if (isr & INT_ECC) {
>> +		dma_sync_single_for_cpu(nand->dev, nand->dma_addr, mtd->writesize,
>> +					DMA_FROM_DEVICE);
>> +		stat = ma35_nfi_ecc_check(&nand->chip, (unsigned long)nand->dma_buf);
> nand->dma_buf already is a pointer which you cast to unisgned long here
> and back to a pointer in ma35_nfi_ecc_check(). ma35_nfi_ecc_check()
> should take a poiner instead.

I will fix it.


>> +		if (stat < 0) {
>> +			mtd->ecc_stats.failed++;
>> +			writel(DMA_RST | DMA_EN, nand->regs + MA35_NFI_REG_DMACTL);
>> +			writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | SWRST,
>> +				nand->regs + MA35_NFI_REG_NANDCTL);
>> +		} else if (stat > 0) {
>> +			mtd->ecc_stats.corrected += stat;   /* Add corrected bit count */
>> +		}
>> +		writel(INT_ECC, nand->regs + MA35_NFI_REG_NANDINTSTS);
>> +	}
>> +	if (isr & INT_DMA) {
>> +		writel(INT_DMA, nand->regs + MA35_NFI_REG_NANDINTSTS);
>> +		complete(&nand->complete);
>> +	}
>> +	spin_unlock(&nand->dma_lock);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int ma35_nfc_exec_op(struct nand_chip *chip,
>> +			  const struct nand_operation *op,
>> +			  bool check_only)
>> +{
>> +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
>> +	u32 i, reg;
>> +	int ret = 0;
>> +
>> +	if (check_only)
>> +		return 0;
>> +
>> +	ma35_nand_target_enable(nand);
>> +	reg = readl(nand->regs + MA35_NFI_REG_NANDINTSTS);
>> +	reg |= INT_RB0;
>> +	writel(reg, nand->regs + MA35_NFI_REG_NANDINTSTS);
>> +
>> +	for (i = 0; i < op->ninstrs; i++) {
>> +		ret = ma35_nfc_exec_instr(chip, &op->instrs[i]);
>> +		if (ret)
>> +			break;
>> +	}
> The way ma35_nand_target_[en|dis]able() is called looks inconsistent.
>
> This function calls ma35_nand_target_enable(), so I would expect that
> the corresponding ma35_nand_target_disable() should be called here as
> well.
>
> ma35_nand_do_read() is called from here which has its own call to
> ma35_nand_target_enable(), but it doesn't call ma35_nand_target_disable()
> from all of its return pathes.

Okay. I will check and fix it.


>> +
>> +	ret = devm_request_irq(&pdev->dev, nand->irq, ma35_nand_irq,
>> +				  IRQF_TRIGGER_HIGH, "ma35d1-nand", nand);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to request NAND irq\n");
>> +		clk_disable_unprepare(nand->clk);
> You used devm_clk_get_enabled(), so this will be done automatically.

I will remove it.


>> +		return -ENXIO;
>> +	}
>> +
>> +	nand->chip.controller = &nand->controller;
>> +	platform_set_drvdata(pdev, nand);
>> +
>> +	chip->options |= NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA;
>> +
>> +	/* set default mode in case dt entry is missing */
>> +	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
>> +
>> +	chip->ecc.write_page = ma35_nand_write_page_hwecc;
>> +	chip->ecc.read_page  = ma35_nand_read_page_hwecc;
>> +	chip->ecc.read_oob   = ma35_nand_read_oob_hwecc;
>> +
>> +	mtd = nand_to_mtd(chip);
>> +	mtd->priv = chip;
>> +	mtd->owner = THIS_MODULE;
>> +	mtd->dev.parent = &pdev->dev;
>> +
>> +	writel(NAND_EN, nand->regs + MA35_NFI_REG_GCTL);
>> +
>> +	ret = nand_scan(chip, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (ret) {
>> +		nand_cleanup(chip);
>> +		devm_kfree(&pdev->dev, nand);
> Unnecessary free. Drop it.

I will remove it.


>> +		return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void ma35_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
>> +	int ret;
>> +
>> +	devm_free_irq(&pdev->dev, nand->irq, nand);
> devm_ is a mechanism to let resources be freed automatically. There's
> normally no need to do this manually.

Okay. I will check and remove it.


> Sascha


Best regards,

Hui-Ping Chen



