Return-Path: <linux-media+bounces-16508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 428EB957CC5
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 07:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97381F23D89
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 05:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1166352F88;
	Tue, 20 Aug 2024 05:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMZ9On2p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3DC446DC;
	Tue, 20 Aug 2024 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724132133; cv=none; b=HQ3z9MJB1H/CXT/Lrw+HRnWcpnqP4GOKoLWBHPt8UNPAV/vBQaEWEG9i5MgxwTqalIDsdVTmGuclYwAcNUZnH2Qu9Kl3Y/58NRAvfN+J/5XPCv962+X5f9fEspfx28EdxARd8yx7HYmnmiG85PpyB1SQSrx0o5p7Xfy4V8p0oBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724132133; c=relaxed/simple;
	bh=J8mWwTYjE5MWSBjxWks5vl6q20m+SsIpp7Ej2x/gIkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5OowHw9f4/LjMe3Z8/rT6FisD9B4lo12Z2XaOLZ7w4CduipVO9M9dck9mgrQ3xfYo0OlGSJg2oLlbRMPtNprVukZ1+serbjFVleIfDEZNWEWHaBcj6fmwSL11DL4cLTtnKUUVAdkbK/KBXxhpmGr218kcUEYuOA1jdzTqlTwBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMZ9On2p; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2703e8d3f7bso1553096fac.2;
        Mon, 19 Aug 2024 22:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724132131; x=1724736931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndtfIALYxvSwyfZwUZk30HMSZOs/3lo4XrgNJ0/XS/Y=;
        b=YMZ9On2pZCZkL3hdEIdY95xReAW4fXgtn9lHgPS3oPoIJ45QqjOHDY1v6LgOagAB4c
         uMDet1bp3Iu5uDQiehpCRajNE2uTcKdXfCdTo+2TSVse6iTa7w5/i5HSYLSZA8HaHjxe
         veGRuRk7a7grRMHaoiwxHGCGWstR05LdpfnfDIeYLr5wtcyQYQ0M/Je0xu3wDIP9l0EA
         8IMTYyKjPmzvxbw9FfsIgvdUhoRW7QlDu+3nff4LhicglxpvFEwR59fqmBuvQr8dOtL8
         rwna9DN1vScD0W/xhaXtzcggw2Fjm0E5MEfNsvr24Ded3ILR10vRck7+e10NXN5eTM8h
         SNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724132131; x=1724736931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndtfIALYxvSwyfZwUZk30HMSZOs/3lo4XrgNJ0/XS/Y=;
        b=qRoC4/ST0v0xhoHjutmzIhoaqEnHfWbSTJxYR4bKhTvNxdF2+QujZXUsxJQ9fWGxkx
         UtiyWRVrgPNH5xtaGMy/6anlrf2r08ZjOfaONi6JSyUqTKS2XzJarh+pXZQRWLub4x9e
         tXT931GvwF+G7UBFgGmrsT/9JGXx+HARbdbZS+2LfjyjuLINesj2Jp7PAHDisv/rq88T
         2mA5i2afj5jR0TapVu8BbI2Tet3JpEf6h2KYgkrvKBUeotIwRzN/f1H7ql6pzSHWC///
         MJX7WW91ZAzdCk+mMe8w+ni2CWzq9O4BpdYwHv2aWZAWRJ2hiJ3kzIA9ZxgKW5BujRCB
         waUA==
X-Forwarded-Encrypted: i=1; AJvYcCVjOYzhD9MKT6YctUWochGz7jumFTG58FiTv6QqRhdUZ1XKnJwSci64BQHxlQOOD4yvLPWbZwnBudRwmV8=@vger.kernel.org, AJvYcCX8p22vOEFhPnklMUHm3rewsvqjtKJKZSUmm+MwxY9QoeEEECUl6dCQjS5y7DPTg4NQwyfC/Qdgcq6xJHc4@vger.kernel.org, AJvYcCXdQ+W/qRfqsMbqd4QrJSJFUlRNzZh278QPkCRuGCATZAb4Z7xtHHwEv4Y/8Fj1AY/szha86HelEmn7@vger.kernel.org
X-Gm-Message-State: AOJu0YxgX+huW3c33npYKc234lD1mC4pDS+PlpDL3Y6g/tjQYlJi93bF
	fe7oq3hlcS67a1f2to9Bi2Xe4yvVYjD4oZiTX1+PodgJ9eVrMv+KXw7Npw==
X-Google-Smtp-Source: AGHT+IFtEn8H0UZ4sEWSOI7G4y4Mo1XLRTZ28Kau1HwcAHNrGsrgcbQQoKbgrUrFfpCGq+Yq/fxnrQ==
X-Received: by 2002:a05:6870:224e:b0:268:a074:39cf with SMTP id 586e51a60fabf-2701c349599mr11711600fac.8.1724132130748;
        Mon, 19 Aug 2024 22:35:30 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef5431sm7461828b3a.109.2024.08.19.22.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 22:35:30 -0700 (PDT)
Message-ID: <fe56d8be-9c75-48d5-bc2c-76a79e5d7843@gmail.com>
Date: Tue, 20 Aug 2024 13:35:26 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
 <20240819092037.110260-3-hpchen0nvt@gmail.com>
 <t7igmxzylpem6qbasb2esnren743m4dnzw6j3i7vn3dveubu5n@4sy6mmmlhtw3>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <t7igmxzylpem6qbasb2esnren743m4dnzw6j3i7vn3dveubu5n@4sy6mmmlhtw3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,

Thank you for your reply.



On 2024/8/19 下午 07:19, Krzysztof Kozlowski wrote:
> On Mon, Aug 19, 2024 at 09:20:37AM +0000, Hui-Ping Chen wrote:
>> Nuvoton MA35 SoCs NAND Flash Interface Controller
>> supports 2KB, 4KB and 8KB page size, and up to 8-bit,
>> 12-bit, and 24-bit hardware ECC calculation circuit
>> to protect data communication.
>>
>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> ...
>
>> +static int ma35_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand;
>> +	struct nand_chip *chip;
>> +	struct mtd_info *mtd;
>> +	int retval = 0;
>> +
>> +	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
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
>> +	nand->clk = devm_clk_get(&pdev->dev, "nand_gate");
>> +	if (IS_ERR(nand->clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(nand->clk),
>> +				     "failed to find nand clock\n");
>> +
>> +	retval = clk_prepare_enable(nand->clk);
>> +	if (retval < 0) {
>> +		dev_err(&pdev->dev, "failed to enable clock\n");
>> +		retval = -ENXIO;
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
>> +	if (nand->irq < 0)
>> +		return dev_err_probe(&pdev->dev, nand->irq,
>> +				     "failed to get platform irq\n");
>> +
>> +	if (request_irq(nand->irq, ma35_nand_irq, IRQF_TRIGGER_HIGH, "ma35d1-nand", nand)) {
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
>> +	return retval;
>> +}
>> +
>> +static void ma35_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
>> +	struct nand_chip *chip = &nand->chip;
>> +	int ret;
>> +
> Where do you release IRQ handler?

I will add a release IRQ handler to this function.



>> +	ret = mtd_device_unregister(nand_to_mtd(chip));
>> +	WARN_ON(ret);
>> +	nand_cleanup(chip);
>> +
>> +	clk_disable_unprepare(nand->clk);
>> +
>> +	kfree(nand);
> NAK, you never tested your code.

I will strengthen the testing of this function.



>> +	platform_set_drvdata(pdev, NULL);
> Why? Drop.

I will remove it.



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
> Messed indentation.

I will fix it.



>> +		.name   = "ma35d1-nand",
>> +		.owner  = THIS_MODULE,
> Drop. Please do not upstream some 10 year old code... Use recent code as
> template, not 10yo stuff...

I will refer to the new driver implementation.



> Best regards,
> Krzysztof


Best regards,

Hui-Ping Chen


