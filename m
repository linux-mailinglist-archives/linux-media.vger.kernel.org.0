Return-Path: <linux-media+bounces-8568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C238975A6
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 18:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9345F28D0D2
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 16:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31CD152163;
	Wed,  3 Apr 2024 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYBf2O/G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5331B7F4;
	Wed,  3 Apr 2024 16:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712163177; cv=none; b=toe2wEF+bptjkvxaenyBR8RvQS991UtjCKNcNf08k1LvANtRPV4VWB7vsFdkRfDh9L25pGSSosSLEKAbILIUnzI6gUDEmYBdLR3MP9meJNTdh+b4TSG2hI8DVSceJCRXqWyVWph9r3obDQo6a0EhmH6NRVLUOPoWGoiRQokgRJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712163177; c=relaxed/simple;
	bh=VVoPY7zPCQ+cv0PGvXPEueMxlSVcXc9ZPX78cV1mndI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g16ZoqFSsLO3F3wjmxKh90xH/5W1FTeT/imXCngOXLKUoL8DJnSLbSwhjUM1L1FwcZ4BusUjPWseifSIPAVQQgHtYCj3Y9rQ6e3WSls1LfIH7Ph6qAkJLasEdhk2ceZ/HmiFUwzo3mIiLyxT7Ro5nJrudADts/0ZgNMz75jM26E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYBf2O/G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884D9C433F1;
	Wed,  3 Apr 2024 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712163176;
	bh=VVoPY7zPCQ+cv0PGvXPEueMxlSVcXc9ZPX78cV1mndI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYBf2O/GxSwKTQRKtaEXS3x9B8H+ythuL2SnrNurYBaR00srfvbmzpFKPvLeMHjmY
	 u1nS0zlVCdq4nUrqkYIRTFl9t7TXNFMSxN2Pr7rbPYDr1yhUnixNDaBhUMjz7TTn9D
	 de3uLvzAq+7VrNNCd844vJZZido1u8XOqLRRDXS2DXFQB84IVGlk6lfAY52qTgZG+T
	 B6CyjeOwsNTc0iaQpZ/Egyv3UHfw8hnaOdQ1XyKo3kxIZ+Zm75P0Wm6ZZqWeQ0kFPy
	 AMR13RC8tYOJdOH68yiFpUZS/JabKSFUCuT/cmNRihFuUTrngWCxB0mErb5xGtf5Wn
	 J4Pri1yTH99Fw==
Date: Wed, 3 Apr 2024 11:52:54 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
	conor+dt@kernel.org, sakari.ailus@linux.intel.com,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	hansg@kernel.org
Subject: Re: [PATCH v4 2/2] media: dt-bindings: ovti,ov2680: Document
 link-frequencies
Message-ID: <171216317203.3979008.2467490229461130290.robh@kernel.org>
References: <20240402174028.205434-1-festevam@gmail.com>
 <20240402174028.205434-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402174028.205434-2-festevam@gmail.com>


On Tue, 02 Apr 2024 14:40:28 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Document the link-frequencies property as recommended by the following
> document:
> 
> https://www.kernel.org/doc/html/v6.9-rc1/driver-api/media/camera-sensor.html#handling-clocks
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - Only document link-frequencies.
> 
>  .../bindings/media/i2c/ovti,ov2680.yaml         | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


