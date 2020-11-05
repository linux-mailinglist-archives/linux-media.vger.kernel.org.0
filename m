Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FDC2A7EDB
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbgKEMoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:44:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:46508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730418AbgKEMoP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:44:15 -0500
Received: from coco.lan (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBEB820782;
        Thu,  5 Nov 2020 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604580254;
        bh=YP50ClQ5W94WexJmyMNgTYYaS0+7op1hN0UJWch/R3E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PljPB8IHzsvtzFmvzZMVKf/qY/ltDBV20QsROXleSiP20P9OFtuesxyVaIZbDrUxn
         B6ByeSduoMPNaI6naN8J0vD2ldE3ELsEa2A1K10n1+xI/dSB+MUXULs8BnPQtGyNSD
         HD0IXnrwBBEQx6gANtyoyCbOpIt7omfBvjt9KtDc=
Date:   Thu, 5 Nov 2020 13:44:11 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 106/106] ccs: Add CCS ACPI device ID
Message-ID: <20201105134411.69140aa7@coco.lan>
In-Reply-To: <20201007084557.25843-97-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-97-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  7 Oct 2020 11:45:57 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> The CCS compliant sensors use device ID "MIPI0200". Use this id for ACPI
> device matching.

Better to place this patch before the one dropping I2C table, as it
helps to understand why you dropped the I2C table.

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 10ed3d01af16..297c5373a305 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3604,6 +3604,12 @@ static const struct ccs_device smia_device = {
>  
>  static const struct ccs_device ccs_device = {};
>  
> +static const struct acpi_device_id ccs_acpi_table[] = {
> +	{ .id = "MIPI0200", .driver_data = (unsigned long)&ccs_device },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, ccs_acpi_table);
> +
>  static const struct of_device_id ccs_of_table[] = {
>  	{ .compatible = "mipi-ccs-1.1", .data = &ccs_device },
>  	{ .compatible = "mipi-ccs-1.0", .data = &ccs_device },
> @@ -3620,6 +3626,7 @@ static const struct dev_pm_ops ccs_pm_ops = {
>  
>  static struct i2c_driver ccs_i2c_driver = {
>  	.driver	= {
> +		.acpi_match_table = ccs_acpi_table,
>  		.of_match_table = ccs_of_table,
>  		.name = CCS_NAME,
>  		.pm = &ccs_pm_ops,



Thanks,
Mauro
