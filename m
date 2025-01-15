Return-Path: <linux-media+bounces-24817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B84A12CC1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 21:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 065DF1888478
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 20:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60B41D95A2;
	Wed, 15 Jan 2025 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlEwjR0W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2499B41C6C;
	Wed, 15 Jan 2025 20:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736973414; cv=none; b=EvdbMy+8cnwjiZ8P9UdgDWoH6H/ZNmC1/BU7yhIU6kvg2iVTs6a3JpD/ia2GLF3E5uxtNg24/3IIE/ldrcgInSyBX+3CJcBaA5lP2Wp2S4/3zbATi23kxWTXCOHPGfWZMQyp4KDTf8Bks47hLQ7zwYUmZGLEMcTocQqXFBFJXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736973414; c=relaxed/simple;
	bh=kuJY3TgXQJr1XHQFK3y8JWvrFnD7+WKIbFOp2nhFwrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZ68iTcshAxY1lenTH2zzh5B/M9DzqimUU6b1NnV1e93cwTgpEEdbo7aDfQyobvRtA9mnoB6/VdKxNaDj3dkxEugepNJia2RIyGVZqt18Mw4AU0vuI1DBOLnSIBZHPax88I9tmcsGNIxsT1jHYb7uNN9+jncOx6im7X8bmzEddE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlEwjR0W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6EFC4CED1;
	Wed, 15 Jan 2025 20:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736973413;
	bh=kuJY3TgXQJr1XHQFK3y8JWvrFnD7+WKIbFOp2nhFwrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlEwjR0WKPurtFO5D9fBje943ctd9Djv9G5zTfr3NBWIGAFcqxK1FNs0EqSfh01wW
	 KPWVf72L+PD3ultELDOjk1JUGsQRgyB0qi8uVWmIpIPdsfIfEQljRjf+DLS8kZ1SMU
	 nlnmCzLKflGfDaachZq5DJH09+EOQOqj7oXd3R69L3mdtOHpkJ5TMC+oobWB8tWIHm
	 DvZZog8tt6FH1JtBhWUERkUXvfq2ccVgoB77MOuQX4tW5eZxqhO+JBjPpD9xqfny4W
	 vX2Y1YCwx0OUjojP8Z7HOKUxfXQ9azjFPz4NPFP74f8aqHbbgLAauZ116dQkVPC/6l
	 FGhvG1un3Z2WA==
Date: Wed, 15 Jan 2025 14:36:50 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Renjiang Han <quic_renjiang@quicinc.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/3] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Message-ID: <lo2zma6ch6av3obo4mj5hpua6hpi4dn6fl5cjnmwpplu66v6mf@nkfegdca5mzu>
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
 <8322416c-5762-4b64-80aa-7ef1b0b0287c@linaro.org>
 <hlre46s5jz7kro34w5ah3pvxvkdnplukoiubkptx6oeepdx2ox@mh6geaqspa6l>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hlre46s5jz7kro34w5ah3pvxvkdnplukoiubkptx6oeepdx2ox@mh6geaqspa6l>

On Wed, Jan 15, 2025 at 02:22:11PM -0600, Bjorn Andersson wrote:
> On Wed, Jan 15, 2025 at 12:02:31PM +0000, Bryan O'Donoghue wrote:
> > On 15/01/2025 09:30, Renjiang Han wrote:
> > > The POWER_CONTROL register addresses are not constant and can vary across
> > > the variants. Also as per the HW recommendation, the GDSC mode switching
> > > needs to be controlled from respective GDSC register and this is a uniform
> > > approach across all the targets. Hence use dev_pm_genpd_set_hwmode() API
> > > which controls GDSC mode switching using its respective GDSC register.
> > 
> > This paragraph is difficult to read and understand. Try something a bit more
> > like "Use dev_pm_genpd_set_hwmode() API to control GDSC mode switching. Do
> > that because of reason x, y z"
> 
> No, follow https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
> It says "describe your problem, then describe your solution". "Use "
> isn't a good start of any problem description that I can think of.
> 

But just to clarify, I have no concern with your request for
improvements to the description of the problem being addressed. 

Regards,
Bjorn

