Return-Path: <linux-media+bounces-17273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818209671B6
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 15:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA172839C3
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 13:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D6711CA1;
	Sat, 31 Aug 2024 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="F48ETAZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88264C74;
	Sat, 31 Aug 2024 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110173; cv=none; b=dQR2s1irQICy9xva5jt1IWaGbyEdf7aoIgkrJ3xZ13eWBxhU1ohXgZuqmhWMBzdh9b04VaNr/e4J89jFAI3KNu588gKAHvBMFfNsf09TVrO5vD/IR7AwtjZHL3HxucPyPDdDSAPfhRTWnCnQ/o3auzGT1o8ye5jjlia1JCf70vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110173; c=relaxed/simple;
	bh=tLcADBlUpicJI7YwEir5KwcWT1YA0FCaATHsP3sCmXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fntCAIHXZs58pZC/3zIes4fWT01UXEN0tcAX4W6yaSjteRbZQpnvrwb6Oa6T+tkjnNPDF+79EyRRbxM75tRe/b4OLI7FGTDg0A6kQZD3IaQdJ1h16AvyVYmNWqdTm4rAUKtG1qFhkJ590dmFYQuI28yDwwT08RNyA4Z4IB0OGzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=F48ETAZ5; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=EuKozmDV8mePyOV+B4UXYcEUDBeI4bY+pV28D9Slulo=;
	b=F48ETAZ5kO1ZMjlO3CUi2tRVnvEyZjbVCxnB93pjLZYT0QiBPRgQVhtx4MWaHr
	Rd2/azDlXKsaM+A2X5doMP5F8YJUsFLEZ7E0t3I1wrjq2aFWMtIwQL5IgeBwc1Qk
	3jYAE8FmWyHV13W0MPlUHPZNuYoa3mjg9Y6GiEuJvbZMY=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3VwAZF9Nmsz06AA--.20596S3;
	Sat, 31 Aug 2024 21:14:03 +0800 (CST)
Date: Sat, 31 Aug 2024 21:14:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Clarify csis clock frequency
Message-ID: <ZtMXGbpyv/1loJZM@dragon>
References: <20240813234010.17852-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813234010.17852-1-laurent.pinchart@ideasonboard.com>
X-CM-TRANSID:M88vCgD3VwAZF9Nmsz06AA--.20596S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyxJF18CF47WrW8XF1DZFb_yoWDGwc_ua
	9xKFnrAw1UAF1fXw4DG34rW342k3W5CF48Zw1Iqr43tryUXrWku3W2v34jvw40gay2qwsI
	k34kK3W7C3s7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eT5JUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ5MZWbS+P46mQAAs-

On Wed, Aug 14, 2024 at 02:40:10AM +0300, Laurent Pinchart wrote:
> The DT nodes for the MIPI CSI-2 receivers (MIPI_CSI) configure the
> CAM1_PIX and CAM2_PIX clocks to 266 MHz through the assigned-clock-rates
> property, and report that frequency in the clock-frequency property. The
> i.MX8MP reference manual and datasheet list 266 MHz as a nominal
> frequency when using both CSI-2 receivers, so all looks normal.
> 
> In reality, the clock is actually set to 250 MHz, as the selected
> parent, IMX8MP_SYS_PLL2_1000M, has a 1/4 output that is selected as the
> closest frequency to 266 MHz. This doesn't break operation of the
> device, but is clearly misleading.
> 
> Clarify the clock configuration by selecting the IMX8MP_SYS_PLL2_250M
> parent, dropping the redundant assigned-clock-rates, and setting
> clock-frequency to 250 MHz. This doesn't cause any functional change.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!


