Return-Path: <linux-media+bounces-36049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 036A3AEAA81
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FA06640133
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 23:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57780223322;
	Thu, 26 Jun 2025 23:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/sVwzH4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00EE1DED7B;
	Thu, 26 Jun 2025 23:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750980151; cv=none; b=OEwtmUWA4898BNQN/kp1aoN+H0AMhDDj0ZOI7H2FCE6TUlK17svh8jIrlSFTOfZ0wuEX8KV01yZ59Dp5fYj3ISiB3IPV/gW8m8J2FtEXlyfDWQOS9daDUEDajlO5Ycm0zE55al60X5Rud/mEIdEWZrxZoCAnLa2PVi48OCZmRTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750980151; c=relaxed/simple;
	bh=iCtlLNqs4td/sAbrwzzl0mCercZnD9PWCfAlyf24ubY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1DSqlbux4x5RuyfnnBaXz0uAfmcx1FoJf1o/CvmcFiEgw7zjCbyZhmNDf5LU/moC83Qzaj13EZHOyZxtgj16OAO9WFyTnhwdh01b+yFo1SS9mNX6DlsAjclghNBnHWk/P5yawl3SKjaszX/Cf2Xu4I1jOvDvkv6udS2l+G07Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/sVwzH4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A71AC4CEEB;
	Thu, 26 Jun 2025 23:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750980151;
	bh=iCtlLNqs4td/sAbrwzzl0mCercZnD9PWCfAlyf24ubY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/sVwzH47ESATrCJ0HpGSUIe/ZVAy1lcIGLcaz2gT0L8bIT5xS569DM9OVyVNd0fq
	 5bWbdk3NrbB6tXd1SsbqXt8VmxdPmVAaogdwIoGr9o8czZIpV7YGSey0HdLleOuPoL
	 okmfCDoAo36E7LberQTXRTCSLw/WSjyvFFsCdZXlrRJHHYGNWcTokM2rnr1fSWOKw+
	 7RZrX0xC5lgN+ziRnFMSqghhMF82DDJLFjLFfKMOoJ99rQsgSIRSpUOO+WYB5yzhac
	 b/yEuypL0Mw0/Pp0wAP7hoT72Ehu1To3srB/YPuI5j5AJKfKDgUo91AqqqV++LI3CR
	 7jTOfSYGTVkiA==
Date: Thu, 26 Jun 2025 18:22:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Purism Kernel Team <kernel@puri.sm>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, Rui Miguel Silva <rmfrfs@gmail.com>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <175098014957.1390900.11681586327735894598.robh@kernel.org>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>


On Mon, 09 Jun 2025 02:58:38 +0300, Laurent Pinchart wrote:
> The CSI-2 receiver can be instantiated with up to four output channels.
> This is an integration-specific property, specify the number of
> instantiated channels through a new fsl,num-channels property. The
> property is optional, and defaults to 1 as only one channel is currently
> supported by drivers.
> 
> The only known SoC to have more than one channel is the i.MX8MP. As the
> binding examples do not cover that SoC, don't update them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


