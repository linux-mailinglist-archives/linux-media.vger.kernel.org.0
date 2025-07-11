Return-Path: <linux-media+bounces-37447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82445B012C8
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 07:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 482A4641890
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 05:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4843E1C84D5;
	Fri, 11 Jul 2025 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Y/qrJMXG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDCC188907;
	Fri, 11 Jul 2025 05:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752212326; cv=none; b=LgBqcJCR42zBEufitHlXj2lZKjhjgn8PThyY6qdGk0y5PzXvHD1T6SqW7lOS5FRuVfmfpk8DYBUfeQQ0HK/ASXQrO/DpCjYGOhMSOM8HhP8v1Ep4QkixVWzcI3xsddGBbnn/wdTugEU1i2DYQ1Yc3py54U/P8GkAYANoFepZBj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752212326; c=relaxed/simple;
	bh=nLHSptOydqU3sd1HGj41xS54ASHMzq03kbynAozo8V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktPneTAbaCJja07ObTOHEiKdOD0EWaFzD3HXJKgpDLaPHgVwNqHs6d+57/ms65ebFc3v+hfms//ZYut4Vig1ySMxcC0F/yB09mOyL11fatdnYo6XE3SgRZ+yw1FnYveswmu77oG/uheZNpShhAYzFCBg1NZfXWLH5Rk4ZTBsj6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Y/qrJMXG; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GlJko1hEIFB3Xv6RCR38uaerUEqKv1vPAiOCkuwmKnw=;
	b=Y/qrJMXGUZrgz17RUlwvQNX6XeMaE+1+eVcSakyEbmHNY0dxF4fsSb9hxhHZlm
	iP6+bd/GdNtZvvJA+OEcnJ1PcG1GfSpx9kn986y7LRdmfwe7C0UikcUpO65+eqZk
	SyZcUweGyCQUh4QxAxWakFoTDnGvGD7JmZB44N9+Y2LBo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAXNos3o3BopgpPAA--.47957S3;
	Fri, 11 Jul 2025 13:38:01 +0800 (CST)
Date: Fri, 11 Jul 2025 13:37:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: mirela.rabulea@nxp.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Subject: Re: [PATCH RESEND 2/2] arm64: dts: imx95: add jpeg encode and decode
 nodes
Message-ID: <aHCjNtw9G7joUnka@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-2-Frank.Li@nxp.com>
 <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
X-CM-TRANSID:M88vCgAXNos3o3BopgpPAA--.47957S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzxhLUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgSHZWhwe3SZbAAAsW

On Wed, Jul 09, 2025 at 10:48:15PM -0400, Frank Li wrote:
> On Wed, May 21, 2025 at 01:34:04PM -0400, Frank Li wrote:
> > Add jpeg encode\decode and related nodes for i.MX95.
> 
> shawn:
> 	can you help check this?

It looks good to me.  But has the binding change been applied already?

Shawn


