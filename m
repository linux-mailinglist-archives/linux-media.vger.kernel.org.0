Return-Path: <linux-media+bounces-55691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KLvGBEYtGlkgwAAu9opvQ
	(envelope-from <linux-media+bounces-55691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:58:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D41A22845DA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0AC63140773
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9DB390CAC;
	Fri, 13 Mar 2026 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5Iyz6HI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D499385539;
	Fri, 13 Mar 2026 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409608; cv=none; b=n2QfDOLizn62NWhDC5VxhVwZBnXp2bTSQ0dxBDZCia4xA3dFU+X7YlP/FeGxqQBbsKDbSK50kxd8rSdYaDOqvJKq0l8iWEIZ7rl+Yr/FrguGU6TVloMx3aVux+4NjQkm6UrwV1cBOXgx1TJVqTBv04+k9x8Znr4+kxgakGJ4QmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409608; c=relaxed/simple;
	bh=QPw8426T/PP1DrrGzhza5epQpzNZNJj2LmEcOvZao8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3WAvrICIcPc3UsSTf9yAGUTGrx0AndgBk6zTSzgI05kA9ZtTOrr9vdoDpZQZVihbs46/wuTggeAytLA45Gd+xZODpTSdXdYAJTB1pcXs9kZ9vG1eGf/89/CIsMnwHb6SSYyBQZhO+RccP/FK4uug0TmQFCwgTz1C1+BWXuLG0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5Iyz6HI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE68C19421;
	Fri, 13 Mar 2026 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409607;
	bh=QPw8426T/PP1DrrGzhza5epQpzNZNJj2LmEcOvZao8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p5Iyz6HIQ5kJmNp3AVrXjvyuwL7NANsN77FVzuqINLj/Hxyci4EW2SZ0lIrG3wTeC
	 5myP+cY32eJv/qcKIb3/xpfJuvL+DA1HOx3PCvUKxjF7lDHh5t9SImf9Jx7TsO/ex0
	 e7KIvOdpOw6haQi8JptMwo8gsyvTYGRXr0+H5PEKLixPt3/Vklk+kHFIBLQuVzOC+i
	 7GAkwVUD5Etwb3dUtHABuZLHHa3gs2L4OqBXnMio2ktHvB63fUEhF2b5nldvuZJ9ZR
	 rwIHZwJ6JHUa6LLqXAXaQ6A3N5mFOcsYyWsrSoYGs0h6VI2V5RFqyetsv+U56OyDz4
	 jSG7tNg+kN0Pw==
Date: Fri, 13 Mar 2026 14:46:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
Message-ID: <20260313-nippy-nebulous-quoll-3cb9ab@quoll>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-3-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312150437.1091195-3-eagle.alexander923@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55691-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: D41A22845DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 06:04:37PM +0300, Alexander Shiyan wrote:
> This patch adds a V4L2 subdevice driver for the Sony IMX662 CMOS image

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

...

> +
> +static int imx662_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx662 *imx662 = to_imx662(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx662->supplies),
> +				    imx662->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable regulators\n");

Is this probe path?

> +
> +	ret = clk_prepare_enable(imx662->clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable clock\n");
> +		regulator_bulk_disable(ARRAY_SIZE(imx662->supplies),
> +				       imx662->supplies);

If yes, thus must be return dev_err_probe. If not, earlier code was
wrong.

> +		return ret;
> +	}
> +
> +	usleep_range(1, 2);
> +	gpiod_set_value_cansleep(imx662->reset, 1);

You did not test your code. Logical level 1 means reset is asserted, so
you leave your device in reset state after power on.

> +	usleep_range(30000, 31000);
> +
> +	return 0;
> +}
> +
> +static int imx662_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx662 *imx662 = to_imx662(sd);
> +
> +	gpiod_set_value_cansleep(imx662->reset, 0);

And you de-assert it in power off.

Look how other drivers do it. They even have explicit comment that above
is wrong.

Best regards,
Krzysztof


