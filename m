Return-Path: <linux-media+bounces-61656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gELyHT78BmrtqQIAu9opvQ
	(envelope-from <linux-media+bounces-61656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:58:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28F54DE22
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1034317A249
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11FC4657F8;
	Fri, 15 May 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoTx566A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FF644B67F;
	Fri, 15 May 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841698; cv=none; b=LB0F0ZK0XVebbyKY1loFG/2/L0FA35IThFSkBGDf9DXWTXFM+zRKN5Gc5QmPds7plv0HHEc5KBdkxjqD9MZL63KcvcAtZhnkpReSnn2gmBFG+p24UtyTcw//gpr8zbljZzQaYjMjVutZs/cZe80kL0H05CST4FzlyhU0VbQBD8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841698; c=relaxed/simple;
	bh=ZPp1ndVMVWLYC7Sk18kpys0/Vxz72Hm26ip8CZBljYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAwtbrJ8V+xX0DXbgOG4JgKqNjOKv1v/r8LN2KpYS6tVnIrVuKxSAali6BFZgz4ZVB4n/IKEsLkRkEMi4Y2HArVJ7I6l4eBKlahNg+va3Ako8Qxwg8qYvun+MgOZWxD/dkHZAgPbWjNhopxnPAsHr26zufAr6skA+tbfRUnXUYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoTx566A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFA4C2BCB0;
	Fri, 15 May 2026 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778841697;
	bh=ZPp1ndVMVWLYC7Sk18kpys0/Vxz72Hm26ip8CZBljYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoTx566AZfQ7AhbCDv8iJXLbQuv4WxHkjBv793wCwifvvzWY9mvl9BUQNXCw+fCSL
	 Tq6zOxvUrSgBVp2X7+D/JduW0dq8Ucna1aMZ1UHNteo1x9f1878XHeQfFtJKS7+hAz
	 O+YSW5vQ4LypYB4ROn0kAhlHp5pP5WvgNlmowLrjwfoYXWbkCi/ZsU7kvGsTVAr8Sf
	 lsttYtXhDHvRhX8l1v2gU0apZKTiTavcMoXaM9JBVL0+TSwbPnXjp8JOGjAOMFUHBF
	 gvQrwWCob8ceNdomHFsbl5u2UvIWvaEQa0qR8zIcJsgLCNo5cyK2yG5bKSmeBzkq15
	 hE+yLbESijFqw==
Date: Fri, 15 May 2026 12:41:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx678: Add driver for Sony IMX678
Message-ID: <20260515-meteoric-prudent-walrus-eee028@quoll>
References: <20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com>
 <20260513-imx678-v1-2-30fc593ed8fa@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-imx678-v1-2-30fc593ed8fa@ideasonboard.com>
X-Rspamd-Queue-Id: BD28F54DE22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61656-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 09:03:17PM +0530, Jai Luthra wrote:
> +static int imx678_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  u32 pad, u64 mask)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct imx678 *imx678 = to_imx678(sd);
> +	int ret = 0;
> +
> +	/* Master mode disable */
> +	cci_write(imx678->cci, IMX678_REG_XMSTA, 0x01, &ret);
> +	/* Standby */
> +	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, IMX678_MODE_STANDBY, &ret);
> +	if (ret)
> +		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static int imx678_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx678 *imx678 = to_imx678(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx678_supply_name), imx678->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	usleep_range(500, 550); /* Tlow */
> +
> +	gpiod_set_value_cansleep(imx678->reset_gpio, 1);

Never tested. How can you have device powered on when it is in reset
stage?

> +
> +	ret = clk_prepare_enable(imx678->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n",
> +			__func__);
> +		goto reg_off;
> +	}
> +
> +	usleep_range(20, 22); /* T4 */
> +
> +	return 0;
> +
> +reg_off:
> +	regulator_bulk_disable(ARRAY_SIZE(imx678_supply_name), imx678->supplies);
> +	return ret;
> +}
> +
> +static int imx678_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx678 *imx678 = to_imx678(sd);
> +
> +	gpiod_set_value_cansleep(imx678->reset_gpio, 0);

And here as well bug. And if you looked at existing drivers you would
see how to do that correctly.


> +	regulator_bulk_disable(ARRAY_SIZE(imx678_supply_name), imx678->supplies);
> +	clk_disable_unprepare(imx678->xclk);
> +
> +	/* Force reprogramming of the common registers when powered up again. */
> +	imx678->common_regs_written = false;

You should just use regcache.

Best regards,
Krzysztof


