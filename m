Return-Path: <linux-media+bounces-32535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE9AB767B
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 22:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72AD98C59BF
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 20:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714792957C3;
	Wed, 14 May 2025 20:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fbtdd/oH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16F12951A6;
	Wed, 14 May 2025 20:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253557; cv=none; b=SpmpH0N1IiIGPo09agK9keVXeAbzxkEVU0oVVFLnmj/p24j4vW9LgUGSxfj3+BDCSGyXieUX8U+OpxepreNl5Qv8DSVLnnFKu3MNerM3pw7t2ul2s18f9One2y2jt3XM3fDtbBX4VKKt2ZdLKnsJi+LklW0W6U7VjHS+R/9tWtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253557; c=relaxed/simple;
	bh=2WYpJnl1ax8rwpFL8L3G6L2FOopXlQPNK3SrFZq0AQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVOVCBhEw25/gOUp2DX+0Dr3kvNyRVHC7ntq6fqZDi1uD3SRIkpkptXu6qFD2cNfPZ5d2P7IJ1pOJpTW2qU/qVrn3xM0O7KwJLqz20X+IMD4jEgarXSEwU6qDvH3RN2nNaMX70mY4ZEsLdi2Hm0Mo6QAPx/oKWWLG91YkR9bCdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fbtdd/oH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10B1C4CEE3;
	Wed, 14 May 2025 20:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747253557;
	bh=2WYpJnl1ax8rwpFL8L3G6L2FOopXlQPNK3SrFZq0AQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fbtdd/oHH/eFNDqfEXpXCkjsSKFCfZ1wdk/dFjtcP69HWJgdJQFePY3VR48iavwFx
	 DxMP7ArmTZdZ8w/uafGAIdImGvmeQLX/2QfYkSe5tRQ+L4PMJIUDJitLWSwcpZNql5
	 bCAbcrXyfYiGBD0ARw9z6Q7hoWkg/GOcp5jDP7zkQPt/iEYvgd0iSMEd+V2a4lUGyX
	 L4wuz5vVpwCJln75WamZxymz+yTuZJdYgRk4inyBH5+vh7z9U0b32nLxqb8cBUbUqz
	 r8b8xZ7Z7w5Tr++Ov2hci5iAzsq+D3dT8lmdGssACsJJOcSr5QbPM/vjYS5/MZ8LYP
	 n24j3W6gnyK7Q==
Date: Wed, 14 May 2025 15:12:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicholas Roth <nicholas@rothemail.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: ov8858: inherit
 video-interface-devices properties
Message-ID: <174725355479.2958040.5700144507602583801.robh@kernel.org>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
 <20250509-camera-v3-1-dab2772d229a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-camera-v3-1-dab2772d229a@bootlin.com>


On Fri, 09 May 2025 23:51:37 +0200, Olivier Benjamin wrote:
> Update the OV8858 binding to inherit properties defined in the
> video-interface-devices binding.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


