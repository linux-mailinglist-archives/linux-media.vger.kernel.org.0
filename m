Return-Path: <linux-media+bounces-62284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFAdN5ixDWpy1gUAu9opvQ
	(envelope-from <linux-media+bounces-62284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:05:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB858E722
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF962309B77F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2383E1D17;
	Wed, 20 May 2026 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kA2PRPH8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD224E4A1
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281917; cv=none; b=JuTyqAnQIUev/OP2k1NYJhAwUell19x2f0d3fVXjuLMmqG+PQxAsuD9CUTyU0wQOdwye7v+jNkP1ttW9MXTdI/jeYmO3tY5PfxdEumjzhF29r6lCcFIE5aEgwEpN/G28+f+IQhyDDcPOZB/5q9PAg7bDiEWJipFe1YgV9tzt5f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281917; c=relaxed/simple;
	bh=rPmW1aZdmYR29JdSXKX7+ZOA84meYMry2Pus+9yZQKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcRBtNdzkuviaT1CsP2rR+vk8eL5Du8e4knhQx8yGeUGVG7GZAd6zIBTgmtG8P4ZNzh2uEJQlgkogo+BP+SeTYSJ4z8xWycakr1s2SzsRVv+2SRyskvOlcFqAdd980P9d5TqYeTO/vnGgb05uKV31L4m+r3QSr2mMI6kQNdpprM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kA2PRPH8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779281916; x=1810817916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rPmW1aZdmYR29JdSXKX7+ZOA84meYMry2Pus+9yZQKI=;
  b=kA2PRPH8O0L2EELPwxlpfLtFaB6lQ4yOeufucV/aTuf0D9sbWu4SkOpH
   iC0NPowVkndeXjGEQ5O3xGqC/T6dngj8J8nxpwHir5vTSUBLcFHhtcSmE
   Hl6QbM9GSAfWanjxA0bOgGakBxxRfplfUcOW5H3O7Iw+0IOpk77cBfG0Z
   KPR+NChOOXx7dykO5vuoFiYB6e5jXl0gJkJJmAy3eRxUAySkjF4G+kwnJ
   tXJRaim7OISoP6HFNRLgECYI8JWYiiAJbCX/+KSH2FFzBHFy4RW4/sjBb
   vBhmz+M9WnzRTrreXdzYcu8cotiWshCYKUEWoNR9R/r3UCqI3dzeslqO1
   w==;
X-CSE-ConnectionGUID: gKIhh567Qoeln5fqsueAnA==
X-CSE-MsgGUID: QApwCQyzR7qnlWh+umGKLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80295329"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80295329"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:58:35 -0700
X-CSE-ConnectionGUID: 0n01ZIFeQcOH8dEaB9YzQg==
X-CSE-MsgGUID: JPA9hZg8TFuZb25tsWY7kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="278268937"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:58:33 -0700
Date: Wed, 20 May 2026 14:58:26 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com, 
	sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH v2 1/2] media: i2c: cvs: Add driver of Intel Computer
 Vision Sensing Controller(CVS)
Message-ID: <ag2s6q1XJ7bdP4ai@mdjait-mobl>
References: <20260514184431.288353-1-miguel.vadillo@intel.com>
 <20260514184431.288353-2-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514184431.288353-2-miguel.vadillo@intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62284-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 42CB858E722
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

Thank you for the patch!

On Thu, May 14, 2026 at 11:44:30AM -0700, Miguel Vadillo wrote:

[..]

> +/**
> + * cvs_hw_init - Probe device for prefix support and apply quirks
> + * @ctx: CVS device context
> + *
> + * Sends GET_DEV_VID_PID and probes for a 32-bit prefix.
> + * If it matches ICVS_PREFIX_VAL, sets ctx->prefix for subsequent reads.
> + * Then reads VID/PID and applies matching quirks.
> + * GET_DEV_VID_PID is supported by all protocol versions.
> + *
> + * Return: 0 on success or negative errno.
> + */
> +static int cvs_hw_init(struct icvs *ctx)
> +{
> +	struct i2c_client *i2c = ctx->i2c_client;
> +	struct icvs_resp n = { };
> +	__be16 cmd = cpu_to_be16(ICVS_GET_DEV_VID_PID);
> +	int cnt, resp;
> +	int ret;
> +
> +	cnt = i2c_master_send(i2c, (const char *)&cmd, sizeof(cmd));
> +	if (cnt != sizeof(cmd))
> +		return -EIO;
> +
> +	cnt = i2c_master_recv(i2c, (char *)&resp, sizeof(u32));
> +	if (cnt != sizeof(u32))
> +		return -EIO;

Is it possible to use cvs_read_i2c() here to avoid code duplication ?
Something like:

	u32 resp;

	ret = cvs_read_i2c(ctx, cmd, &resp, sizeof(resp));
	if (ret)
		return ret;
> +
> +	ctx->prefix = resp == ICVS_PREFIX_VAL;
> +
> +	/* Now read VID/PID to apply quirks */
> +	n.cmd_id = cpu_to_be16(ICVS_GET_DEV_VID_PID);

you already defined cmd, use it again here.

> +	ret = cvs_read_i2c(ctx, n.cmd_id,
> +			   &n.resp.vid_pid, sizeof(n.resp.vid_pid));
> +	if (ret)
> +		return ret;
> +
> +	cvs_set_quirks(ctx, n.resp.vid_pid.v_id, n.resp.vid_pid.p_id);
> +
> +	return 0;
> +}

[..]

> + * cvs_core_probe - Shared probe path for I2C & platform instantiation
> + * @dev: Parent device
> + * @i2c: I2C client (NULL for platform devices)
> + *
> + * Discovers IPU, parses ACPI resources, sets up GPIOs/IRQs, initializes
> + * sub-device (CSI) and host identifier, and exposes sysfs firmware interface.
> + *
> + * Return: 0 on success or negative errno.
> + */
> +static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
> +{
> +	struct pci_dev *ipu = NULL;
> +	struct icvs *ctx;
> +	int ret;
> +
> +	/* Locate IPU device */
> +	for (unsigned int i = 0; !ipu && icvs_pci_tbl[i].vendor; i++)
> +		ipu = pci_get_device(icvs_pci_tbl[i].vendor,
> +				     icvs_pci_tbl[i].device, NULL);
> +	if (!ipu)
> +		return -ENODEV;
> +
> +	ret = ipu_bridge_init(&ipu->dev, ipu_bridge_parse_ssdb);
> +	if (ret < 0) {
> +		put_device(&ipu->dev);

why is put_device() only used here ? And not again in other error paths
after ?

> +		return ret;
> +	}
> +
> +	if (!dev_fwnode(dev))
> +		return -ENXIO;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->i2c_client = i2c;
> +
> +	ret = gpiod_count(dev, NULL);
> +	switch (ret) {
> +	case ICVS_GPIO_SYNC:
> +		ctx->res = ICVS_LIGHTCAP;
> +		break;
> +	case ICVS_GPIO_ASYNC:
> +		ctx->res = ICVS_FULLCAP;
> +		break;
> +	default:
> +		dev_err(dev, "unexpected GPIO count %d\n", ret);
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_acpi_dev_add_driver_gpios(dev,
> +					     ctx->res == ICVS_FULLCAP ?
> +					     icvs_acpi_gpios :
> +					     icvs_acpi_lgpios);
> +	if (ret) {
> +		dev_err(dev, "failed to add ACPI GPIOs (%d)\n", ret);
> +		return -EINVAL;

return dev_err_probe() ?
Please check other places in the probe where you can replace this
pattern by return dev_err_probe()

> +	}
> +
> +	ctx->req = devm_gpiod_get(dev, "req", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->req))
> +		return PTR_ERR(ctx->req);
> +
> +	ctx->resp = devm_gpiod_get(dev, "resp", GPIOD_IN);
> +	if (IS_ERR(ctx->resp))
> +		return PTR_ERR(ctx->resp);
> +
> +	if (ctx->res == ICVS_FULLCAP) {
> +		struct gpio_desc *wake;
> +
> +		ctx->rst = devm_gpiod_get(dev, "rst", GPIOD_OUT_HIGH);
> +		if (IS_ERR(ctx->rst))
> +			return PTR_ERR(ctx->rst);
> +
> +		wake = devm_gpiod_get(dev, "wake", GPIOD_IN);
> +		if (IS_ERR(wake))
> +			return PTR_ERR(wake);
> +
> +		ctx->irq = gpiod_to_irq(wake);
> +		if (ctx->irq < 0)
> +			return ctx->irq;
> +
> +		ret = devm_request_threaded_irq(dev, ctx->irq, NULL,
> +						cvs_irq_handler,
> +						IRQF_ONESHOT | IRQF_NO_SUSPEND,
> +						"cvs_wake", ctx);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = devm_mutex_init(dev, &ctx->lock);
> +	if (ret)
> +		return ret;
> +
> +	init_completion(&ctx->cmd_completion);
> +	init_waitqueue_head(&ctx->hostwake_event);
> +	INIT_DELAYED_WORK(&ctx->work, cvs_recv);
> +
> +	if (i2c) {
> +		ret = cvs_hw_init(ctx);
> +		if (ret) {
> +			dev_err(dev, "HW init failed (%d)\n", ret);
> +			/*
> +			 * Fallback to GPIO-only mode.
> +			 * Some BIOS show the device on the I2C bus, however,
> +			 * the device is not accessible via I2C.
> +			 */
> +			ctx->i2c_client = NULL;
> +			goto fail_i2c;
> +		}
> +
> +		ret = cvs_get_device_caps(ctx, &ctx->caps);
> +		if (ret) {
> +			dev_err(dev, "get caps failed (%d)\n", ret);
> +			return ret;
> +		}
> +
> +		ret = cvs_configure_dev_caps(ctx);
> +		if (ret) {
> +			dev_err(dev, "configure dev caps failed (%d)\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +fail_i2c:
> +	ret = cvs_csi_init(ctx, dev, i2c);
> +	if (ret) {
> +		dev_err(dev, "CSI init failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(dev, ctx);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	/*
> +	 * Create a PM runtime device link with IPU as consumer and CVS as
> +	 * supplier. When the IPU runtime-resumes to start streaming, the PM
> +	 * framework automatically resumes CVS first, triggering
> +	 * cvs_runtime_resume() which hands CSI-2 link ownership to the host.
> +	 */
> +	ctx->ipu_link = device_link_add(&ipu->dev, dev,
> +					DL_FLAG_PM_RUNTIME |
> +					DL_FLAG_RPM_ACTIVE |
> +					DL_FLAG_STATELESS);
> +	if (!ctx->ipu_link)
> +		dev_warn(dev, "IPU device link failed\n");

Just a warning here ? Will the camera even work if device_link_add()
fails ?

> +	put_device(&ipu->dev);
> +
> +	if (has_acpi_companion(dev))
> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> +
> +	return 0;

--
Kind Regards
Mehdi Djait

