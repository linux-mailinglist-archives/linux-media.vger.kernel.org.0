Return-Path: <linux-media+bounces-32536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63994AB767F
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 22:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB8B8C6328
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 20:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA13296174;
	Wed, 14 May 2025 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjrD7uF3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768F2951A6;
	Wed, 14 May 2025 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253563; cv=none; b=U2Ldwm1yVc2UkHM6TR7httQPyMlgzHGBbFAijREDikc6Qh9w1T/U/quJgdrmyyaJm+8ORPb7DmUgiD9fNV4ZRtwplH++NLj0i7LBifZsFoK1wJIO1GWo+UGCrQMKKpajj0GCykgTOQNKrfxmqXry6LZuUVJajlI0KMGDj8ye1kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253563; c=relaxed/simple;
	bh=OzKdPvbRk8hZ5qrmc01ogW5Qt/80h78/YBJYjWWOc4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urRKIJzbyAW6in45N7aIQRZpT50No0TSWsEN/V74N3Spm2Wjlbn99jVKUHaAldHSwEdhZVMkl90LqHj6xUuJHGsFrMlZI73eI3VJtLBUnifNZ60gB4oJOkORb/3Lv96B+nYYotr2nGJMv/5cbAX1psCxZEZ/oj7vmWzDLcmQ4C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjrD7uF3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB4FC4CEE3;
	Wed, 14 May 2025 20:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747253562;
	bh=OzKdPvbRk8hZ5qrmc01ogW5Qt/80h78/YBJYjWWOc4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjrD7uF3s4MzpmCi5++bmuEF1uYLGz2YMBnsiMqoFW7YDj5mc8aOQESHbZu88v1DH
	 /d18hc+b+qCiFIU8wjE+VT3AUBn0WHkoTjMtfQSxakcobRGXhUIUhXcjPqfE+3ENm4
	 50iYiKTv8Q57RXy9OlgNnwEWWkUcdDj30VbH5Lu0yYNjQhv5K538xqA5La1qGLzQyq
	 J+Y37RDoc0V7KiNuD3QEUxsqrff7ZF0EBInFFBUijITqyrdwWAepJiQqqBBdPcRYzZ
	 baQkY+Gry6SJbiMS9tY+h8YfTzXl7CVbMG3lItpymdu1EpEzqXNWmzOfa9fyCEN98Z
	 xI4qL7dgk4dgw==
Date: Wed, 14 May 2025 15:12:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicholas Roth <nicholas@rothemail.net>,
	linux-rockchip@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: media: imx258: inherit
 video-interface-devices properties
Message-ID: <174725356050.2958291.9709026924364137236.robh@kernel.org>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
 <20250509-camera-v3-2-dab2772d229a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-camera-v3-2-dab2772d229a@bootlin.com>


On Fri, 09 May 2025 23:51:38 +0200, Olivier Benjamin wrote:
> Update the IMX258 binding to inherit properties defined in the
> video-interface-devices binding.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


