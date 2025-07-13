Return-Path: <linux-media+bounces-37549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EF5B02E5C
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 03:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDF084A327B
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 01:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE848634A;
	Sun, 13 Jul 2025 01:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="E3+8DopX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B44A00;
	Sun, 13 Jul 2025 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752370948; cv=none; b=rsJUGsR3iDuhidTRD0g8gE2IzipqYXBYKT9AmfGrwVVmhzbvrUEjVcovjRBsH9iXMW0YfzSvcMFuAS+hyV8vE/vhE/H5EobCFms34WFPUommBN0H4PkK/K5npjPoGpgIynfXtdfbm8hJMoQzDvfv+Er6xsu/rhXW8LsYYuzEeAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752370948; c=relaxed/simple;
	bh=MjTgCoQdGbJfJErk2z9+A7PX2rE1LZcNmmBG5UNIxIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2yUfpXrfKvDBjPuaqfKt82TvVvzOrwKmbxL+XwNyI0t3C09nXRcR8Vg/LdJR1G0JGhMsb3tYNwQD1HZZqqQndwp6cQ3mtplt+NKuTvWtQw+cD4Y7ih963oL/aUEGlwiJreeRij361vcjBjnTSqs7Q0JYWwmAcdeKJwOzfP2P6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=E3+8DopX; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vWLaBlCVDMaG0LM+7ESP1e8rEdQZfK6CkV/TbehX7h0=;
	b=E3+8DopXZ90MyNE8JeJ19lNdg6CVVUoetjdwpPd9L5MZjFG3adC9dP5Hx0tY0q
	mqSruYdstve+zKA5DZtiUVF9t2eDiElZhpvci6dwLphC5TkPnTHJrXhsCReJC5xo
	QDmGHIDG7uCK1IDf/rmEKygDU+9V6oHsoxM/rXs1YmD/c=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnP6enDnNoU2t5AA--.2390S3;
	Sun, 13 Jul 2025 09:40:58 +0800 (CST)
Date: Sun, 13 Jul 2025 09:40:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 13/13] arm64: dts: imx8q: add camera ov5640 support
 for imx8qm-mek and imx8qxp-mek
Message-ID: <aHMOp7cjFDOrrA26@dragon>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com>
 <aHC7wm98PlShUqWk@dragon>
 <aHEkNZPfVw2drb4p@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHEkNZPfVw2drb4p@lizhi-Precision-Tower-5810>
X-CM-TRANSID:M88vCgDnP6enDnNoU2t5AA--.2390S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUe5rcDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgqkCmhzDqpVRwAA3r

On Fri, Jul 11, 2025 at 10:48:51AM -0400, Frank Li wrote:
> > > +	ov5640_mipi_0: camera@3c {
> > > +		compatible = "ovti,ov5640";
> > > +		reg = <0x3c>;
> > > +		clocks = <&xtal24m>;
> > > +		clock-names = "xclk";
> > > +		pinctrl-0 = <&pinctrl_mipi_csi0>;
> > > +		pinctrl-names = "default";
> > > +		powerdown-gpios = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
> > > +		reset-gpios = <&lsio_gpio1 27 GPIO_ACTIVE_LOW>;
> > > +		AVDD-supply = <&reg_2v8>;
> > > +		DVDD-supply = <&reg_1v5>;
> > > +		DOVDD-supply = <&reg_1v8>;
> > > +		status = "okay";
> >
> > Unnecessary "okay" status?
> 
> Yes, Do you need me to resend?

I fixed it up and applied.

Shawn


