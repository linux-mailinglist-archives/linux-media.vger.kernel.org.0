Return-Path: <linux-media+bounces-24815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31229A12C7F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 21:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7531C1887D2F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 20:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2271D9337;
	Wed, 15 Jan 2025 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zqcvd/BK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06814B959;
	Wed, 15 Jan 2025 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736972534; cv=none; b=qMvxS8DLL1ldkpKml+MSzkh1hLK9+pL+izvOz1hbSxtQmfpeC8o5DVkNmP0hj8FoA4mjGqpeVnT15ceFIh4EpZspAy+Vr5N5jRoBsP78gpMPoUxDUXExZKAZLGsQvhXeCMBI/smwmSQwL71DNg/dBSrj//mB1yC6I4qQE8RhJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736972534; c=relaxed/simple;
	bh=w9Wn64DoAN8/dBg3LlZDo5cAZRy6oHLkGiuq4h2HW1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K217oQHZTUZp7bP/EhwMjgCGw7HxmERZmKSwuKsWbivfaWqxqL76JI6gjCNKwZ0mVtKW8DEttLY1rNGVy5spj6INGkyL0vdxktnhfluOYb329cf/0BkhOeu7/9DnTpL6Mm9Sgclpy+js0544yp6b4tyzY0qnUqFjrsAnZtFPlqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zqcvd/BK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEADC4CED1;
	Wed, 15 Jan 2025 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736972534;
	bh=w9Wn64DoAN8/dBg3LlZDo5cAZRy6oHLkGiuq4h2HW1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zqcvd/BK7XJAcN9PlCqUnexoJ3SOBR1ea/wKgafVC8l2gQmEed+s1DMEF3JdySsph
	 /0gG519X66Jb/OWsr4Tg0u60OqyOj4dBs8zCyNIRak1tUojpUHUDCa4ksxdDo5cLUn
	 XNUoVigzp2g6KK97RjW1Qny2uFGEzD/HXCaBRlcIPKJg+BFO4Rq0Nm9IUDHa2oJKg3
	 TuwZZTuKpN2ftvuKIlaItzdm3BoHLPPKtacgVF3gDLBot+MOHMOFdJA183z1mzD8HR
	 L+4AQxTvGvoviNtU2d/0IdgIGUe8qMq1simbxx1aUL39wbRo3JwjjhXUOsK98FOrDJ
	 1zaTexyTYRDjg==
Date: Wed, 15 Jan 2025 14:22:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Renjiang Han <quic_renjiang@quicinc.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/3] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Message-ID: <hlre46s5jz7kro34w5ah3pvxvkdnplukoiubkptx6oeepdx2ox@mh6geaqspa6l>
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
 <8322416c-5762-4b64-80aa-7ef1b0b0287c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8322416c-5762-4b64-80aa-7ef1b0b0287c@linaro.org>

On Wed, Jan 15, 2025 at 12:02:31PM +0000, Bryan O'Donoghue wrote:
> On 15/01/2025 09:30, Renjiang Han wrote:
> > The POWER_CONTROL register addresses are not constant and can vary across
> > the variants. Also as per the HW recommendation, the GDSC mode switching
> > needs to be controlled from respective GDSC register and this is a uniform
> > approach across all the targets. Hence use dev_pm_genpd_set_hwmode() API
> > which controls GDSC mode switching using its respective GDSC register.
> 
> This paragraph is difficult to read and understand. Try something a bit more
> like "Use dev_pm_genpd_set_hwmode() API to control GDSC mode switching. Do
> that because of reason x, y z"

No, follow https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

It says "describe your problem, then describe your solution". "Use "
isn't a good start of any problem description that I can think of.

Regards,
Bjorn

> 
> "We are making this change because of reason a, b, c"
> 
> Basically just try to state the facts as clearly and concisely as possible.
> 
> ---
> bod

