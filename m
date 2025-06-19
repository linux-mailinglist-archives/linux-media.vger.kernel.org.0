Return-Path: <linux-media+bounces-35225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9018ADFC65
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 06:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C63D7A13CF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 04:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7685623C4FB;
	Thu, 19 Jun 2025 04:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="oIL3Q0De"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CD43085D4;
	Thu, 19 Jun 2025 04:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750307295; cv=none; b=SWgMduUf/3HWb21na35H152raVfDw/mmIepIwUtDm9+BHs8XqOj6+BIcH6bf9LBF4SybIrdJeT84WtBvpTWdFRFkcrbnYJrWcnHNOJLgB/cMlCwEUnWIZ0eYA8Ueptm3ucSdk/E8GGLCmuheJIePPYd3Qd4q01pYfyOoGAaJ9EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750307295; c=relaxed/simple;
	bh=wGPPr8evg8EGvCbT/ay4qY+qSgTYYixp+8b3bm2r8yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kllvPnFc1NiX8dlbWmyLk3dZsGyfM25IOBT6QvnuATT4AFyb2OIYzDZzmmBV2do38Uzr/tjcaUjWMTf/CMFh/i3n6uEgozBerDJTbhTWKLZT9HtNtO+xfanIxabEh6iCIen7+lrRZPqp4XJaBM3CR++10G3Z5IQP74J03oE0GkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oIL3Q0De; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7Yv8PVd52JTRw4r6qh65xK+kFgGp7k/YH+t5aN2ivQM=;
	b=oIL3Q0De6A3nMNlyVAjT96y81tN5M/D0G3WdBE0268+AIXgutdBEL4keyZiTUm
	Yyo0jkkZjwwl9DbTsUGXq/vAXZzuGxY3gsH+DQZdkDluJnKylod0iDvZ18myVvWA
	XXc6o43PuZS+Gg4g82XJ7Lw7WMYQTwv5IbLQhY+UoB16A=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHfw6ikVNoUc_2AA--.36272S3;
	Thu, 19 Jun 2025 12:27:16 +0800 (CST)
Date: Thu, 19 Jun 2025 12:27:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, krzysztof.kozlowski@linaro.org,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
Message-ID: <aFORokzx/sImgDtA@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-1-Frank.Li@nxp.com>
 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
X-CM-TRANSID:M88vCgAHfw6ikVNoUc_2AA--.36272S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy5tr4rtF45AFy5uw13CFg_yoWfXrbE9w
	18Zw1Iqay3ZrW3Wry5AFs5C34Fga47XryUXryFyw1kuws0yr98AFZrGrn3XFy5uFZ5WF9F
	kwnrtw1DCa9FgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1Hq2tUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwlxZWhTizsX7wAAsl

On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 21 mai 2025 à 13:34 -0400, Frank Li a écrit :
> > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
> > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
> > wrap and all slots together. Reduce minItems of power-domains to 1 for
> > i.MX95 and keep the same restriction for others.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Krzysztof, will you take this one once the DTS part is ready ?

dt-bindings is the prerequisite of DTS.  DTS patch looks good to me
and I'm waiting for dt-bindings part to be applied first.

Shawn


