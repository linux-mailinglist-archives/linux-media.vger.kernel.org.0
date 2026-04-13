Return-Path: <linux-media+bounces-58652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC/KOgW83GliVwkAu9opvQ
	(envelope-from <linux-media+bounces-58652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 11:48:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C7D3EA06D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 11:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 703A53007284
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79CB3B388A;
	Mon, 13 Apr 2026 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qex+PchW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5857037C10D;
	Mon, 13 Apr 2026 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776073721; cv=none; b=gryhKKyxelU6y78O7Z+PIPaoLe7VbLuweE8J2ui46PJ63Vqh7qfwQaeg1M/u1yMtfoFvGlH66qa9JTH0rgJPnPyyJldzmmCxgptua61yGWv6ErulIbPILZaHAYKJ8Uo0xdJF6Ra/rRr887fA8Aa/T6nydNmlg7hIH8UFFIsGtq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776073721; c=relaxed/simple;
	bh=ei62gy1NTjROvmCzpJDNwUoL/wL4EpzF/cw5QAv3oJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0YjNZ+UwOGU82wPVpwGK8Gzt6f7m+ZXXmBcOW1uYQKB0rinHr2SELGKIE7u9qIgcaPBazyXes3YQFCsSp54pbWhfd2kncER1fAY9qfsM5tAAryF4iNmXLNluuQfUVfFp/fGfc566SCKvzKPQolbtbZVUbMSh7niz6xAr/iuhwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qex+PchW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F72C116C6;
	Mon, 13 Apr 2026 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776073721;
	bh=ei62gy1NTjROvmCzpJDNwUoL/wL4EpzF/cw5QAv3oJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qex+PchWpAPgmOQM8WlERs/crhywWswafr8Wr0wMzHZrdulOUHfDw7uqv1zNHExCm
	 ytWk9KLPw/FutUb8/1zeM50fS1HjoGL9oxMehV9+oGuxnA4c8+XR/k2iMblt/2mpPQ
	 GzdTYz5hwTKzPpwRsquD0d+TRVNeg6IOlRJvo3SOsYyLISZ5QmHWl2S9MaeoY2wEaX
	 QXUaCxQ+P1meEc/oWigZjnGLBp8pk29Jds4QqKYkXJXnZlZwYDlfHPGdkGHmB2FDzj
	 rmqsGln1GY5tYt9uQRnGBuXL+qHagQEfKNv9uvu2BfdMYFtcXlwPGfEOAOfN16ZKan
	 Sxw70DbzbVgQw==
Message-ID: <5120a664-9fb5-41f7-b9d4-16e4369430d7@kernel.org>
Date: Mon, 13 Apr 2026 11:48:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] platform/x86: intel_lpss: add resource conflict
 quirk for Dell Latitude 5285
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 lee@kernel.org, djrscally@gmail.com, ilpo.jarvinen@linux.intel.com,
 mchehab@kernel.org, sakari.ailus@linux.intel.com,
 jacopo.mondi@ideasonboard.com, nicholas@rothemail.net
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
 <20260324214129.17300-2-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260324214129.17300-2-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58652-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5C7D3EA06D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 24-Mar-26 10:41 PM, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.
> 
> Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
> machine, matching the existing pattern used by other LPSS quirks.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
> index 63406026d..7d0964848 100644
> --- a/drivers/mfd/intel-lpss-acpi.c
> +++ b/drivers/mfd/intel-lpss-acpi.c
> @@ -13,6 +13,8 @@
>  #include <linux/ioport.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_device.h>
> @@ -52,6 +54,15 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
>  	.swnode = &spt_i2c_node,
>  };
>  
> +/* Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
> + * where ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources.
> + */
> +static const struct intel_lpss_platform_info spt_i2c_info_ignore_conflicts = {
> +	.clk_rate = 120000000,
> +	.swnode = &spt_i2c_node,
> +	.quirks = QUIRK_IGNORE_RESOURCE_CONFLICTS,
> +};
> +
>  static const struct property_entry uart_properties[] = {
>  	PROPERTY_ENTRY_U32("reg-io-width", 4),
>  	PROPERTY_ENTRY_U32("reg-shift", 2),
> @@ -172,6 +183,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
>  
> +static const struct dmi_system_id dell5285_lpss_dmi[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static int intel_lpss_acpi_probe(struct platform_device *pdev)
>  {
>  	const struct intel_lpss_platform_info *data;
> @@ -182,6 +203,17 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENODEV;
>  
> +	/* Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
> +	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
> +	 * due to a BIOS bug where both use the same SB04 variable.
> +	 */
> +	if (data == &spt_i2c_info &&
> +	    acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev), "INT3446", NULL) &&
> +	    dmi_check_system(dell5285_lpss_dmi)) {
> +		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");
> +		data = &spt_i2c_info_ignore_conflicts;
> +	}
> +
>  	info = devm_kmemdup(&pdev->dev, data, sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;


