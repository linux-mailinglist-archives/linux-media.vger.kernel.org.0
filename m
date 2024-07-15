Return-Path: <linux-media+bounces-15014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F302930F0B
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 09:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBCF31F216F7
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 07:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4C2184102;
	Mon, 15 Jul 2024 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHrP8tjn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF056AB8;
	Mon, 15 Jul 2024 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721029658; cv=none; b=NxKf3V4tNJOs00tNzmHu0Ca5pwBWgI7jns6t17mxuh82/OVvO1ymaUX4f32uockddPYQLyr4Km3Bu95cpJSiL/wcVykVAzvdrTezMtm2m8TynwY7PbCs5J9+zlFIhZVDZoVGSCvBBbmKvWvSe20jMYwBYRxhD5vZWQr+5nQVQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721029658; c=relaxed/simple;
	bh=8sikqxOaP7rGsbpjatkHaaUFgoTb6NlQqRQVWu/jUYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rq2HYN4520gsueNNYzaBB4c8pTBVC16lDnXeb+ob46Rf7WacTtGKaJecgIqhmBUjMuuAYkVwefky4mY/8V6s24JPJ8fb4YBZxW/Fc6hOjpwrspySdCxzklXTlZQEvvuqEKey3m3xfRhA7QkuikGK85fHAMkV30JxDYG12qJXEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHrP8tjn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6EBC32782;
	Mon, 15 Jul 2024 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721029658;
	bh=8sikqxOaP7rGsbpjatkHaaUFgoTb6NlQqRQVWu/jUYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tHrP8tjnWd+rGXXEl3MpqiAmQyeKqdc9jgpOprK9KhaAbL6T+B6d4EMfCuJRA+B1G
	 Q/3gEM8YsceTjF+lLp5YqWI7VbdSw7v0ZNLHcnUeUsdAtImNdSO10g9u0S/Ry/8uc/
	 4UBI1ZlePYSuoCHJj4GQn9FHPMpeW8Bm9IYkf+hRr+DT5Mf2mLWBT/KHvEKcdZkvS6
	 DvXNC708acNHv8xjCktM6LeoxuuhO5yzzIYT6ceYNWsQZAsGnJcGMaPwk59g3YlvTf
	 SLTJLjzNFPva1QReoa4KG5alHc9QCN2j1Dpp+eKA7mVPKrgEuCm8YjMuZysZdGJ1kf
	 5Ex/cJ4mPa37Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTGQp-000000001UK-3P47;
	Mon, 15 Jul 2024 09:47:35 +0200
Date: Mon, 15 Jul 2024 09:47:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] media: ov5675: Fix power on/off delay timings
Message-ID: <ZpTUF85TffLjKhZi@hovoldconsulting.com>
References: <20240713-linux-next-ov5675-v3-1-527f5b985836@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240713-linux-next-ov5675-v3-1-527f5b985836@linaro.org>

On Sat, Jul 13, 2024 at 11:33:29PM +0100, Bryan O'Donoghue wrote:
> The ov5675 specification says that the gap between XSHUTDN deassert and the
> first I2C transaction should be a minimum of 8192 XVCLK cycles.
> 
> Right now we use a usleep_rage() that gives a sleep time of between about
> 430 and 860 microseconds.
> 
> On the Lenovo X13s we have observed that in about 1/20 cases the current
> timing is too tight and we start transacting before the ov5675's reset
> cycle completes, leading to I2C bus transaction failures.
> 
> The reset racing is sometimes triggered at initial chip probe but, more
> usually on a subsequent power-off/power-on cycle e.g.
> 
> [   71.451662] ov5675 24-0010: failed to write reg 0x0103. error = -5
> [   71.451686] ov5675 24-0010: failed to set plls
> 
> The current quiescence period we have is too tight. Instead of expressing
> the post reset delay in terms of the current XVCLK this patch converts the
> power-on and power-off delays to the maximum theoretical delay @ 6 MHz with
> an additional buffer.
> 
> 1.365 milliseconds on the power-on path is 1.5 milliseconds with grace.
> 85.3 microseconds on the power-off path is 90 microseconds with grace.
> 
> Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and support runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I haven't hit this issue, but the camera on the Lenovo ThinkPad X13s
still works with this patch so:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

