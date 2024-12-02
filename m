Return-Path: <linux-media+bounces-22402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E829DFB7F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 08:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0586D1637C7
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 07:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E2E1F9F64;
	Mon,  2 Dec 2024 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAQBLFbz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE1F1F9EAA;
	Mon,  2 Dec 2024 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733126171; cv=none; b=rOEjnR0JmWEcndJ4f1T/tSRKY5buapDm3llApdiEk0HO7I+fw325cJ+2k8bcD5gBgo1mv+RWp8CBXoIFWrBmk7zlxxAnuSemgWMb0t0v77Yuc+JIfo1GTDLZkvCcESygR7cxzGdZCcWw8WxaUsS3brmkLPTCtFmhekhaZEPerRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733126171; c=relaxed/simple;
	bh=kZjVug5ya7hH0mDNjWlcPVU/GfxeZCgwrE9NG175/s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiyQC3YUrPuSuPweJ/c4X5NvTDx5GTnpxIN0LewhkQycGlg5UbyMvPPRg1gP3r//Sd6Q4BQxy4HRmzp+Rh6LUtGlli5UXEvYSkSJPUyog2OhM+FjR9KLuwOBOUBrCD9mg8BPXhOh9tEvqn7U74qLKbUgIdeM8u63UAHsrVOSejA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAQBLFbz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D21C4CED2;
	Mon,  2 Dec 2024 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733126170;
	bh=kZjVug5ya7hH0mDNjWlcPVU/GfxeZCgwrE9NG175/s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAQBLFbzade4+DSJ9YhBk0Yft2NNUlROVJ3w1OZynq1eVWROLvLc3ieheeSwrWfgJ
	 GSGu1f+rBsnsRISz5mla0Ok/GvoJs8TN/mpUspXtJv8HT9unMivZ8uvcL4IVKGmQQO
	 UlRAr2m06+t48T34AW6hhOjmhU4Amqt+9D0fdkFXCn/qKHB972QIsF+kYG1rf2rxW7
	 nYY6mAejKzs7N7WCKRCX689XRrRCqg4Kk+mMO1rqV6LH2jAJnI3MnY51/mTd9nICjM
	 0mXg1531ZuMTM9eJtHt3v7a1bxWhUCIZC3U8GR0LV2ArZEfoUn3SYw4vaQETo0BZq7
	 ZduM6j8UAACXA==
Date: Mon, 2 Dec 2024 08:56:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Michael Riesch <michael.riesch@wolfvision.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx415: add required
 clock-names property
Message-ID: <bh3obpt6bcklejdvrk4r6ienraz5zmhrdyotijhvlwexussqgj@hicmx34vi27w>
References: <20241130141716.1007115-1-matthias.fend@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241130141716.1007115-1-matthias.fend@emfend.at>

On Sat, Nov 30, 2024 at 03:17:15PM +0100, Matthias Fend wrote:
> The imx415 driver expects a clock with the name "inck".
> Document this in the bindings.

No, fix the driver instead of bypassing review. It was decided to drop
it during review, so you cannot reintroduce it 2 years later claiming
that's now ABI. Of course original submission was buggy and never
tested, but that does not allow review bypass.

Best regards,
Krzysztof


