Return-Path: <linux-media+bounces-54800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJCSJP/iqmkTYAEAu9opvQ
	(envelope-from <linux-media+bounces-54800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:21:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3BD2228A4
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BD8E3032892
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E8A3A9DBA;
	Fri,  6 Mar 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jil9XdiN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB719D891;
	Fri,  6 Mar 2026 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806906; cv=none; b=s839kPN5gufxYYRNanuTQdvHn6Hy365NDC+tNhONFF3enSnSjINKJKeww55okP0ZD+Um87YGaR9v5QIo1BGdggRmex+C9XtNh112EFYIAjzQ9RqKWHphQAMIVDjNA3QpHXSF5bChTaaDGvOsXXHuXeU67vSyl7tP2yd2ecMfkkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806906; c=relaxed/simple;
	bh=QlowReCLCXaDEPiS+S2GX0Mrds2Ec/PskTemUWOyu5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYhTadCLKU+qMGY/Ii4YE8sHaCe7YcGZpl3vNzODw/XGP/KAZGC60rN+npc3JWyCN3eTpX/S+npzaP3Eiz9eI928rJDxvvjCermkNnbxEOF+nUMK8OX43SQ6/y1PQztiZDmd1acmhvgFtvTPN4NnEhINDXY82/IRQLdykq0x2GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jil9XdiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C60EC4CEF7;
	Fri,  6 Mar 2026 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806905;
	bh=QlowReCLCXaDEPiS+S2GX0Mrds2Ec/PskTemUWOyu5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jil9XdiNACVK8YNzZ5AQCO0O/A1VouaMzryqqOCAUCJDpa/RrLxWj2Q3MeCF2Mslg
	 7d+1SpFsGEfaWNks+Ufj1woTgQrxd0nsBHhcCL925Zm5YXPkiJdb9okYaFmTbCBpSL
	 tDokRNtYiIUIxpSJuB7Br0LeJb7U9sQ4B7N//dG+efQgrdFRsFNi36aOqOjosrFlXT
	 Lb1i29HxExS4viNqXTeYq7O1E3gVR8ouf7x/dhLRrp8av5Oh0QuIlZnQWu4/34ggH1
	 7+mecAb4+B6N63mbxF1LV/aCoWx9adrtQySO77EcmT6LE/cyZmtVIpwkuK8gxMxg9j
	 0W+3NlSCajVyg==
Message-ID: <110dace9-3ff9-4750-813f-93c6827b105c@kernel.org>
Date: Fri, 6 Mar 2026 15:21:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] accel/neutron: Add driver for NXP Neutron NPU
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>,
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
 <20260306-neutron-v2-4-3019bd8c91ef@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260306-neutron-v2-4-3019bd8c91ef@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3A3BD2228A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54800-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c09:e001:a7::12fc:5321:from];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.30.226.201:received];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 06/03/2026 14:27, Ioana Ciocoi-Radulescu wrote:
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a5b27b061da..f7a687eb6b54 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19191,6 +19191,16 @@ S:	Orphan
>  F:	Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
>  F:	drivers/nfc/nxp-nci
>  
> +NXP Neutron NPU DRIVER

s/Neutron/NEUTRON/ as everything here is in uppercase

> +M:	Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
> +M:	Jiwei Fu <jiwei.fu@nxp.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/accel/neutron/
> +F:	drivers/accel/neutron/
> +F:	include/uapi/drm/neutron_accel.h


>  
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 1d3a7251b950..698136e12cce 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -4,5 +4,6 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
>  obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
> +obj-$(CONFIG_DRM_ACCEL_NXP_NEUTRON)	+= neutron/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> -obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file

You still have patch warnings.

> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> diff --git a/drivers/accel/neutron/Kconfig b/drivers/accel/neutron/Kconfig
> new file mode 100644
> index 000000000000..37b8ecb49804
> --- /dev/null
> +++ b/drivers/accel/neutron/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +config DRM_ACCEL_NXP_NEUTRON
> +	tristate "NXP Neutron NPU"
> +	depends on HAS_IOMEM
> +	depends on DRM_ACCEL
> +	depends on ARCH_MXC

Missing compile test

> +	select DRM_GEM_DMA_HELPER
> +	select DRM_SCHED
> +	help
> +	  Enables driver for NXP Neutron NPU.
> +
> +	  Select this if you have an NXP SoC with Neutron, like i.MX95,
> +	  and want to run machine learning applications.
> +
> +	  If built as module, the module is named neutron.

...

> +
> +	ret = devm_request_threaded_irq(dev, ndev->irq, NULL,
> +					neutron_irq_handler_thread,
> +					IRQF_ONESHOT, KBUILD_MODNAME, ndev);
> +	if (ret) {
> +		dev_err(dev, "Failed to request irq %d\n", ndev->irq);

Drop, not needed.

> +		return ret;
> +	}
> +
> +	ret = of_reserved_mem_device_init(&pdev->dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize reserved memory\n");
> +		return ret;
> +	}
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		goto free_reserved;
> +
> +	pm_runtime_set_autosuspend_delay(dev, NEUTRON_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret = drm_dev_register(&ndev->base, 0);
> +	if (ret)
> +		goto free_reserved;
> +
> +	return 0;
> +
> +free_reserved:
> +	of_reserved_mem_device_release(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static void neutron_remove(struct platform_device *pdev)
> +{
> +	struct neutron_device *ndev = platform_get_drvdata(pdev);
> +
> +	drm_dev_unregister(&ndev->base);
> +	of_reserved_mem_device_release(&pdev->dev);
> +}
> +
> +static int neutron_runtime_suspend(struct device *dev)
> +{
> +	struct neutron_device *ndev = dev_get_drvdata(dev);
> +
> +	neutron_disable_irq(ndev);
> +	neutron_shutdown(ndev);
> +
> +	clk_bulk_disable_unprepare(ndev->num_clks, ndev->clks);
> +
> +	return 0;
> +}
> +
> +static int neutron_runtime_resume(struct device *dev)
> +{
> +	struct neutron_device *ndev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(ndev->num_clks, ndev->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = neutron_boot(ndev);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(ndev->num_clks, ndev->clks);
> +		return ret;
> +	}
> +
> +	neutron_enable_irq(ndev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops neutron_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +	RUNTIME_PM_OPS(neutron_runtime_suspend, neutron_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id neutron_match_table[] = {
> +	{ .compatible = "nxp,imx95-neutron" },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, neutron_match_table);
> +
> +static struct platform_driver neutron_driver = {
> +	.probe	= &neutron_probe,
> +	.remove	= &neutron_remove,
> +	.driver	= {
> +		.name		= "neutron",
> +		.of_match_table	= of_match_ptr(neutron_match_table),

Drop of_match_ptr. You will have (or you have already same as v1) here
warning.

> +		.pm		= pm_ptr(&neutron_pm_ops),
> +	},
> +};
Best regards,
Krzysztof

