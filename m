Return-Path: <linux-media+bounces-19543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF499C1D4
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 188AB1C242B5
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDF814C5AE;
	Mon, 14 Oct 2024 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWJqjVtO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3768214E2E6;
	Mon, 14 Oct 2024 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891952; cv=none; b=sJOyerYrnGHgiG2eJlBXytIGmGdMZKg2KOmpLR7IPhMb2ZCgBPNDFzZpb9r1bxtz2yaCYcy4y1D8DPzLY2FfJs7LR51vUTOo5AR7UXEr33kyRCPCBTiyQ+OPGa+RmsHwYorRn2ytpB1o4+GlD9n7BRheK0r4allVx+UWXFVORU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891952; c=relaxed/simple;
	bh=KuzBE1eS2VzzpIWZRpNHIKPPUfuZf7rQ4X3PVZ4j6c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mS7Jf8tam0FRPntzPd7UgWIUyYrHhiRTsoeWAtYhh+NgaI+nQuqh5VEo2zSuBfdaXeTxTQ9dJEmPfHZypcKjXiYrfAsmcNA9uzwkC4ufC2fyXg07PVvpId0ltc/xzu/7JLBBm1TahzIRJQVQLPpSbJ2ks3/nDvFZShsXzrkHip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWJqjVtO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1048FC4CEC3;
	Mon, 14 Oct 2024 07:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728891951;
	bh=KuzBE1eS2VzzpIWZRpNHIKPPUfuZf7rQ4X3PVZ4j6c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWJqjVtOshtHq7acROzpzAtjqI2ZO2lQn3W3cmhit+Qkhldri0LiD6+Cf17L2Pe3v
	 svd8ibHhIdB6Vr+jUyyppIJFCnJeqxSIzx9sVBD5H82LsIrI8C95BYWHHqvrToBHFu
	 G92VKK04ClmZujWMLa4y9PdQNRi+5KCJhyWL9B/mYZBfAL/h+RciyYUcUlTjhTT5ii
	 nzXYo8h1xosHWCje+fJIOXQluZRRry3bC2AvkaK1A70lly482XfzUu80mQX3KsZTZf
	 bXJQMCzdOdRHqjN2XN+GePKXZulEKL0WQQ7thiETSbbJ/tNQWOv3cWuiMTK/6YVIsn
	 +tz8liFtI+X6A==
Date: Mon, 14 Oct 2024 09:45:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dongchun Zhu <dongchun.zhu@mediatek.com>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Todor Tomov <todor.too@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
Message-ID: <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>

On Sat, Oct 12, 2024 at 04:02:51PM +0100, Bryan O'Donoghue wrote:
> Some of our sensor schemas use unevaluatedProperities: false for endpoint:
> properties: while other schemas use additionalProperties: false.
> 
> The effect of using unevaluatedProperities: false in this instance is that
> any property in media/video-interfaces.yaml can be considered in a dts for
> an endpoint.

... which is what we want and what is expected.

You change the code from expected to less expected variant, so please
clearly document why.

> 
> Converting to additionalProperties: false and running DT checkers show that
> such a liberal policy is unnecessary.
> 
> We should have a consistent way of defining these properties if for no
> other reason than aid other developers in the preferred way of writing
> these schemas for media/i2c in the future.

There is consistent way - common schema defines them.

I do not understand the reasoning behind this change at all. I don't
think DT maintainers ever suggested it (in fact, rather opposite:
suggested using unevaluatedProps) and I think is not a consensus of any
talks.

Best regards,
Krzysztof


