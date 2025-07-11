Return-Path: <linux-media+bounces-37450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67112B01310
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 07:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3006C3AADD4
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 05:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC831D2F42;
	Fri, 11 Jul 2025 05:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JEOHwPFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A22469D;
	Fri, 11 Jul 2025 05:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752213322; cv=none; b=EfeEqXFA8uFeabw6joU6S+yTGK2m99to0TJ7ixEkgq83U81UuSm+DIJQ88Az+nlYVffTGvz5i4HIQM9ccnxWrFq+b60rbcMryHHb9tBr4ioDsCMNtgJ11/olLvaAQzkSl13jXSMWJy8GKrDbiDKUBO4YeFiypmR6yWNz9dKK/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752213322; c=relaxed/simple;
	bh=sjdOPV0hLXQwoBTOcCwn5qWdkG5GleRK8fMScamA74U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOetE9fymlbXYgOpYWdpHSm0QaJ8XUwM5KUWe4IOO8Q8hAD5YAUAhwuO08dYTbuHmkkL+2JxroL4usj9IwvPwsBnFUdVX5nLqWEna6/Yjc8LW91IL/T6+PMKjd1mtaEcmFK4Mil/5Ba8jtFnoB3zoawW7OwCAnegQaWGgGzQpjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JEOHwPFK; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IGfVJrIs+Pij/SWFkdNGobNKoCD6jqjK+ey/0S2BwBY=;
	b=JEOHwPFK3FtaliTRrTP5o4Cqu5ZfZCa+gFJwL4S1tbP2OKpX9u0Q20KeDXG+GH
	LtoaIm8kpOAWLfQXXIldIj75eZpmfT9+Q5rhuj53yiOHuurlyhMaEDgalIoX6f4H
	lGksK+Ydj27yG6QYfbjOASlv5/r1Cr7/bIJeKVICSdywQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCn1rL6pnBopvJQAA--.25092S3;
	Fri, 11 Jul 2025 13:54:05 +0800 (CST)
Date: Fri, 11 Jul 2025 13:54:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
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
Subject: Re: [PATCH v5 12/13] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Message-ID: <aHCm-sAwdHHlbzdM@dragon>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-12-d4be869fdb7e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-12-d4be869fdb7e@nxp.com>
X-CM-TRANSID:Mc8vCgCn1rL6pnBopvJQAA--.25092S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5l1vUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB6HZWhwjvpRUwAAsW

On Thu, May 22, 2025 at 01:56:50PM -0400, Frank Li wrote:
> Add linux,cma node because some devices, such as camera, need big continue
> physical memory.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


