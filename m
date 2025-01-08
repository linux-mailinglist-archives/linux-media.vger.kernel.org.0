Return-Path: <linux-media+bounces-24373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD6A0522B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 05:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1439B7A29F8
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 04:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5221A0706;
	Wed,  8 Jan 2025 04:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7flTe72"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDB2594B3;
	Wed,  8 Jan 2025 04:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311303; cv=none; b=RT3A3pkMdwExBrziFFwCCwudoOla/IgvTW/s0RdPAzITP+0r3vBx9F8G74yUMQfMP/GK5K2+vAHGWKNAmko+3CstamQCazdGoLsD/veGCNItECpuhh3D0CXaN06kUhU1WTrM/R2zvMyuJwGI6SMTl/xOlMut1W0r42v75akkUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311303; c=relaxed/simple;
	bh=t4h8zCOwCG5AD8GpOY5OU6yU/KVdGGb5Rom8rj+cD4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAMti0YEZZnWczwNuw8KRmkV/qmm2uZ2p1r06asqmkC3xh7yvWIe6ruMrAWc5EeQgKAvJDg/nKFvEEJ5urlXTXTyRpHXWkLDjJjvVriOo/HlhXlZ3KY+FIvSkielI5uZzuV07SkGkZNNX/1W3ZCRKQohsVgO0ro9Ijz63XhrVFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7flTe72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C119C4CED0;
	Wed,  8 Jan 2025 04:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311303;
	bh=t4h8zCOwCG5AD8GpOY5OU6yU/KVdGGb5Rom8rj+cD4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7flTe72mW0rA65BkJ/DS8YxQPsoESLFelPPySU02Ab57gj4StRm5bS6t9D7Bmjsk
	 jt5XxiFZS243+2kFAY6izov/vHQ6VDovIAmvXYYRwNQmhOWrsz6rBN6FbabvYOLxax
	 eaNU5JR2JlbDB/G7ws8LIIgT/yf4+D51fqcAwdTjyKvlZ4x02Q8OftM4ul0lJJnEU7
	 +peuafh0Sihs6M8e2oNVhcrSUVKp92Micj/VYBJ9TUCLFyy34SD8VXuHHagN+XpBBj
	 WB2786ENRbnD30Lj/8a84Y5z0vnI+ZUSPdP/t5dM4V5Ici/oPN5a0OHfEb0YBXxMom
	 b+0Mr8gKMPLJg==
Date: Tue, 7 Jan 2025 22:41:40 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <fmxvklw2fmt4akltrpw6v4wmmi6teu7rozz6tozr4hkos6io4s@4jp76l7xql3l>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>
 <szj4urqpxoek3y65ov6bavxqjsgs5nnu5o32e73z47mudelq4v@6fjbmm2h7pen>
 <7556a703-db1a-48f1-8546-e9acf91ca0c6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7556a703-db1a-48f1-8546-e9acf91ca0c6@quicinc.com>

On Thu, Jan 02, 2025 at 12:06:14PM +0800, Renjiang Han wrote:
> 
> On 12/26/2024 11:54 AM, Bjorn Andersson wrote:
> > > The video driver will be using the newly introduced
> > > dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> > > control modes at runtime.
> > "Will be using", does that imply then that if this patch is merged
> > before (or without the venus patch) something unexpected will happen?
> > 
> > Please clarify how you expect this to be merged, or clarify in the
> > commit message that ordering is not of any concern.
> > 
> > Regards,
> > Bjorn
>  Thanks for your comment. This patch series is to make the video driver
>  to use dev_pm_genpd_set_hwmode() to switch GDSC mode. This patch and
>  the venus driver patch need to be merged at the same time. Otherwise,
>  the video will not work properly on these platforms.
> 

The two patches are handled by different maintainers, of different
subsystems and as such would not be expected to be merged together ever.

If you have such requirements, it need to be made very clear to the
maintainers that they will have to synchronize the effort.


You're expected to always keep the tree "bisectable", i.e. the tree
should function after each commit in the git history. Please clarify
the best possible order here, and if the changes truly need to be merged
in some specific order let's see if we can get Maruo's Acked-by and I
could merge the pair through the clock tree.

Regards,
Bjorn

