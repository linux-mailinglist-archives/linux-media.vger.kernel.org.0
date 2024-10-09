Return-Path: <linux-media+bounces-19330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB099765B
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 22:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DEEC1F21666
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 20:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575281E2319;
	Wed,  9 Oct 2024 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfLj6KGU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F1A161313;
	Wed,  9 Oct 2024 20:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728505360; cv=none; b=a2haJ1nVc5d2Jey+agE8W80AKmnW7R5++07t5Yzo7qZRbaA+JD/XAcCeIxLDPQmfyn3uzRw4r5zAM1hbs7CFVaShkE8YiMfMW31/z2KIWnmHQbmQxC/ZySGIm//d7DMwwBEZcacw2ei0JQ0U4hQBmmE47A+2EggZZGa60YB84N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728505360; c=relaxed/simple;
	bh=3chjhrxe4mVFzDrB9/1rKyEXfeTfkRp/J9ozq1wFLvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6MPZC1HA1jQfEaA/6yJwtJysy/PdkmMfKsKcp/tpXgCR5BjSiDhtZgnSExxQhKtZ4qkpGYqDGDzeIpOfplVjt3xI5BNv7JnPHC5F7skB0a0rSj9+Yg7KQuXT3PuNIc65bEU8GQDZAfGe1aKFQu7K4Ss/2wdzK9orYR9+FVnGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfLj6KGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201FCC4CEC3;
	Wed,  9 Oct 2024 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728505360;
	bh=3chjhrxe4mVFzDrB9/1rKyEXfeTfkRp/J9ozq1wFLvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfLj6KGUbwi336mxtmp/vTDCEEtmYu38uV4h1qVGNIndTx4/LneJr37cmIuACihH4
	 7O7zcEfkzno+b2tFqwMqcgdXjQ5z9LRf61gvqOf3pd3JDmBaLrZdREDzDxS9aGQZHB
	 OtkAcazr6WNq+qU+lSmNbuzvwXlX4xYQve/1wc/CT90YOeLfmLlFHUoJ2O87zXJVZ3
	 ocWFB+CGbBxfKmIYvV1rM/qAD4djk3TvWbQYknejg4MIgLtXzQNHDC6qSWo2Pcqmr5
	 wafK1UdD1s4ka10uI4Bhn6F8YGyjX98JA4i6NDGTxPijTrwxSFYk7X56O4HFsX4tsf
	 awZ4y6tKCLxEg==
Date: Wed, 9 Oct 2024 15:22:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/2] media: dt-bindings: media: i2c: Add AR0233 camera
 sensor
Message-ID: <172850535856.610900.16965477529708195917.robh@kernel.org>
References: <20241009084304.14143-1-eagle.alexander923@gmail.com>
 <20241009084304.14143-2-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009084304.14143-2-eagle.alexander923@gmail.com>


On Wed, 09 Oct 2024 11:43:04 +0300, Alexander Shiyan wrote:
> Add device tree binding for the onsemi AR0233 CMOS camera sensor.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  .../bindings/media/i2c/onnn,ar0233.yaml       | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0233.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


