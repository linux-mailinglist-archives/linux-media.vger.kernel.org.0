Return-Path: <linux-media+bounces-62624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE+ADvVsEGqgXAYAu9opvQ
	(envelope-from <linux-media+bounces-62624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:49:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 791625B6758
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22913305EA30
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F45F426D02;
	Fri, 22 May 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMfBQwzK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871923ACA4C
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460891; cv=none; b=twfnHUbJBbMIhwZZP3EEIS+hhItoCE9eWG5QtUbDwfaIf57NacNaKGhLE15Y4lur49uoKbRQABVLuQCA+MTGJVIJF1TZD4e3SXWbw5RsTpuxCSmOhg9LtgBJ2OwfLsDpsHgJO/uUerhmo7AkblPFCgWtVtZWYvkvpQhjXMDYGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460891; c=relaxed/simple;
	bh=SCaSYP846XZGGVUW2Z9TFZ4Z7vcQm0ZVpgi54KrsDxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3fjgtgtRGzrqHUSqGUwOHtNRjkq6VfooQy4UuXWblVyDA0IBzMtsT6GP3RG8Afej4r4bSyUr2HcrMIot+0V49iBi8Kk97eh52OUCSuHKLVt9inVAOUGdI5MyIk3+96SCbBTREfzwXRs12B3jmfIrtIC9vi6FL+6tWyDr1NBsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMfBQwzK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779460889; x=1810996889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SCaSYP846XZGGVUW2Z9TFZ4Z7vcQm0ZVpgi54KrsDxE=;
  b=TMfBQwzKhZk1qmZjr/KIqrEJ/a3zRftrO4gEyTjurqtGgafNMKb2WEn0
   uz11L32tkSO4XR3IgUwT9qRxSy7M3Fw77/rE8S1zCiCMKpQ0wH00NKddv
   LVV8w3e6XUCEx3Wh0Udi26q924LGcFP47n4ckIJbmAYEpMhwOH1rKioIk
   tRdFnJcD6r365LY2Askxi33DULsR0s7Wllw/qVY9aTsbnhzD64xh1NyNH
   7WeUvvybUQd8NJBMTygVNujILOjhOFmPTHCEctbflJsDCQeVKUJqVGutN
   /gB5CY74NttN2MKDGlJg6zNeBcRBDL3xCKP/KYXiP9a72KnmQO442o+W5
   w==;
X-CSE-ConnectionGUID: Myh6l/5HRZG6BjN1USqXxA==
X-CSE-MsgGUID: lVuQcP4yQva0QoFRUtQMrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80423617"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80423617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 07:41:29 -0700
X-CSE-ConnectionGUID: 50OHLfMNT/qZCwapzAwP5A==
X-CSE-MsgGUID: 3XEcQI1ISSOh5mIEeB9W4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="236495315"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.54])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 07:41:27 -0700
Date: Fri, 22 May 2026 16:41:19 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com, 
	sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 1/3] media: i2c: cvs: Add driver of Intel Computer
 Vision Sensing Controller(CVS)
Message-ID: <ahBmGsv67RcYAvsc@mdjait-mobl>
References: <20260521222359.16716-1-miguel.vadillo@intel.com>
 <20260521222359.16716-2-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521222359.16716-2-miguel.vadillo@intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62624-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 791625B6758
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

Thank you for the patch!

A couple of comments below.

On Thu, May 21, 2026 at 03:23:57PM -0700, Miguel Vadillo wrote:

[..]

> +
> +/* I2C transport helpers */
> +
> +/**
> + * cvs_read_i2c - Issue a read-type command and fetch device response
> + * @ctx: CVS device context
> + * @cmd_id: Command identifier (big endian)
> + * @resp: Destination buffer for response payload
> + * @size: Size of payload to read into @resp (without prefix)
> + *
> + * Sends @cmd_id and reads back the response in a single I2C transaction.
> + * When the device prepends a 4-byte protocol prefix, the combined
> + * prefix+payload is read into a temporary buffer and only the payload is
> + * copied to @resp, avoiding any dependency on the layout of the caller's
> + * buffer.
> + *
> + * Return: 0 on success or negative errno.
> + */
> +static int cvs_read_i2c(struct icvs *ctx, __be16 cmd_id, void *resp,
> +			size_t size)
> +{
> +	size_t prefix_size = ctx->prefix ? sizeof(u32) : 0;
> +	size_t read_size = size + prefix_size;
> +	struct i2c_client *i2c = ctx->i2c_client;
> +	u8 *buf;

use this instead:
u8 *buf __free(kfree) = NULL;

and then remove the two calls to kfree() below.

> +	int cnt;
> +
> +	if (!resp || !size)
> +		return -EINVAL;
> +
> +	cnt = i2c_master_send(i2c, (const char *)&cmd_id, sizeof(cmd_id));
> +	if (cnt != sizeof(cmd_id))
> +		return cnt < 0 ? cnt : -EIO;
> +
> +	buf = kmalloc(read_size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	cnt = i2c_master_recv(i2c, buf, read_size);
> +	if (cnt != read_size) {
> +		dev_dbg(cvs_dev(ctx), "recv cmd 0x%04x short read (%d/%zu)\n",
> +			be16_to_cpu(cmd_id), cnt, read_size);
> +		kfree(buf);
> +		return cnt < 0 ? cnt : -EIO;
> +	}
> +
> +	memcpy(resp, buf + prefix_size, size);
> +	kfree(buf);
> +
> +	return 0;
> +}

[..]

> +/**
> + * cvs_send - Common command submission path
> + * @ctx: CVS device context
> + * @cmd: Command buffer (icvs_cmd) with cmd_id and param populated
> + * @len: Buffer length
> + *
> + * Dispatches a set of supported commands:
> + * - ICVS_SET_DEV_HOST_ID,
> + * - ICVS_HOST_SENSOR_OWNER,
> + * - ICVS_HOST_SET_MIPI_CONFIG
> + * - ICVS_FW_LOADER_*
> + *
> + * For I2C based commands it sets big-endian cmd ids, writes to the device
> + * and waits (via delayed work) for completion or timeout.
> + * GPIO based ownership toggles are handled locally.
> + *
> + * Caller must hold ctx->lock when invoking this function and check for i2c
> + * bus availability.
> + *
> + * Return: 0 on success, negative errno, -EINVAL for unsupported command
> + * or status from device in ctx->wq_resp.
> + */
> +int cvs_send(struct icvs *ctx, struct icvs_cmd *cmd, size_t len)
> +{
> +	int ret, status = 0;
> +
> +	dev_dbg(cvs_dev(ctx), "send cmd = 0x%04x", be16_to_cpu(cmd->cmd_id));

From where I see this function being called, it needs to hold the
ctx->lock. It is also mentioned in the documentation of function

Let's add a lockdep_assert_held() to make sure of it at the beginning of
cvs_send()

> +
> +	reinit_completion(&ctx->cmd_completion);
> +
> +	switch (be16_to_cpu(cmd->cmd_id)) {
> +	case ICVS_SET_DEV_HOST_ID:
> +		cmd->cmd_id = cpu_to_be16(ICVS_SET_DEV_HOST_ID);
> +		ret = cvs_write_i2c(ctx, cmd, len);
> +		if (ret < 0)
> +			break;
> +
> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
> +					    CMD_TIMEOUT);
> +		if (ret < 0)
> +			break;
> +
> +		status = ctx->wq_resp.resp.state &
> +			  ICVS_DEV_STATE_ERROR ? -EINVAL : 0;
> +		break;
> +	case ICVS_HOST_SENSOR_OWNER:
> +		gpiod_set_value_cansleep(ctx->req, cmd->param.param);
> +		fsleep(FW_READY_DELAY_MS * USEC_PER_MSEC);
> +		ret = gpiod_get_value_cansleep(ctx->resp);
> +		status = cmd->param.param == ret ? 0 : -EINVAL;
> +		ret = 0; /* success */
> +		break;
> +	case ICVS_HOST_SET_MIPI_CONFIG:
> +		cmd->cmd_id = cpu_to_be16(ICVS_HOST_SET_MIPI_CONFIG);
> +		ret = cvs_config_mipi(ctx, cmd, len);
> +		if (ret < 0)
> +			break;
> +
> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
> +					    CMD_TIMEOUT);
> +		status = (ctx->wq_resp.resp.state &
> +			  ICVS_DEV_STATE_ERROR) ? -EINVAL : 0;
> +		break;
> +	case ICVS_FW_LOADER_START:
> +		cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_START);
> +		ret = cvs_write_i2c(ctx, cmd, len);
> +		if (ret < 0)
> +			break;
> +
> +		ret = cvs_wait_wake_or_sleep(ctx, CMD_TIMEOUT,
> +					     FW_READY_DELAY_MS);
> +		if (ret)
> +			break;
> +
> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
> +					    CMD_TIMEOUT);
> +		status = (ctx->wq_resp.resp.state &
> +			  ICVS_DEV_STATE_DOWNLOAD) ? 0 : -EINVAL;
> +		break;
> +	case ICVS_FW_LOADER_DATA:
> +		/* Quirk for older protocols */
> +		if (ctx->caps.protocol_version_major >= 2 &&
> +		    ctx->caps.protocol_version_minor >= 2) {
> +			cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_DATA);
> +			ret = cvs_write_i2c(ctx, cmd, len);
> +		} else {
> +			ret = cvs_write_i2c(ctx, &cmd->param,
> +					    len - sizeof(cmd->cmd_id));
> +		}
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = cvs_wait_wake_or_sleep(ctx, FW_READY_DELAY_MS,
> +					     FW_READY_DELAY_MS);
> +		if (ret)
> +			break;
> +
> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
> +					    CMD_TIMEOUT);
> +		status = ctx->wq_resp.resp.state &
> +			  ICVS_DEV_STATE_ERROR ? -EINVAL : 0;
> +		break;
> +	case ICVS_FW_LOADER_END:
> +		cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_END);
> +		ret = cvs_write_i2c(ctx, cmd, len);
> +		if (ret < 0)
> +			break;
> +
> +		ret = cvs_wait_wake_or_sleep(ctx, CMD_TIMEOUT,
> +					     FW_READY_DELAY_MS);
> +		if (ret)
> +			break;
> +
> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
> +					    CMD_TIMEOUT);
> +		status = !(ctx->wq_resp.resp.state &
> +			   ICVS_DEV_STATE_DOWNLOAD) ? 0 : -EINVAL;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return ctx->wq_resp.status = status;
> +}

[..]

> + * cvs_core_remove - Shared remove logic
> + * @dev: Device
> + */
> +static void cvs_core_remove(struct device *dev)
> +{
> +	struct icvs *ctx = dev_get_drvdata(dev);
> +
> +	cvs_csi_remove(ctx);

Shouldn't we cancel ctx work first ? And then do the CSI2 v4l2 cleanup ?

> +	cancel_delayed_work_sync(&ctx->work);
> +
> +	if (ctx->ipu_link)
> +		device_link_del(ctx->ipu_link);
> +
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +
> +	cvs_reset(ctx);
> +}
> +
> +/**
> + * cvs_remove - I2C driver remove
> + * @client: I2C client
> + */
> +static void cvs_remove(struct i2c_client *client)
> +{
> +	cvs_core_remove(&client->dev);

[..]

--
Kind Regards
Mehdi Djait

