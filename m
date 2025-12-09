Return-Path: <linux-media+bounces-48497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4FCB1235
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 22:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B984030E3C7C
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 21:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F25E3112D0;
	Tue,  9 Dec 2025 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSsQaaSo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59742DC769;
	Tue,  9 Dec 2025 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765314924; cv=none; b=WLUkHMW86PR6xrvqp0wZHmAuzVlt/yXwFeI1IOwxCyIBp0w8XX2mS2JXH1k1rxXNLE3TrTd1Dk4GvnzjOHFWi+/VSMLgGVriELYIYh6wRC3ZRMl+Kt5HW+pPY4j60YOkAaXpSanWm4dq5OpRuCaOmGL6UE6oWFOhMIAyA//WJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765314924; c=relaxed/simple;
	bh=GZzlQAeYSZb5jVj++vPLnWFa3c9qeYvB2alZl24BowI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WudxF8W6oZWie7DRW716O2hyYxfWnsbRhan84xYL4+aGjD/OZzQramj4bWTTo7Ws9Z+S/PECO4agfWPiPdUjZ2f24HhfzO/6fzfjPiJk8GrLsw2ukXNTylX5aoh6+G/xbf9dzcFrT4qN2okweybnOSj3HYK9i0/Fp0y9J0Dd7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSsQaaSo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F306C4CEF5;
	Tue,  9 Dec 2025 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765314924;
	bh=GZzlQAeYSZb5jVj++vPLnWFa3c9qeYvB2alZl24BowI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSsQaaSox3Sv1ZZXnrjg6JPER4Jkf+EjpO/ud+3A+icp4zA7Rk8fgdQGpgJODbX2C
	 G2DbLtfrtVAQJ+puOb2xhlO6yk8SOVVy2NqKYvzQQ3BW4UwpmkxxWB0z9r+uMUEQCv
	 phYtW7NqHunI+Wt1DF6bIFlvIRzvFpJ9kqFhp/zjuVoqO0AXtgh4XGTjJtv395LO3c
	 jXbjJc12mdSfpY8VqB4VbhJgE+4OAbiwV1YsFkRXwaTkBzoBWfKaOROpZ9khgjjD2a
	 gd8spWk2HJ+N0AZMFhdzal62kSz6QGQLn8NJwVoMBKtpyuQxqPF5P43aDYbfjBellY
	 x9Eaqk/IDy+7A==
Date: Tue, 9 Dec 2025 15:15:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>, linux-media@vger.kernel.org,
	Olivier =?iso-8859-1?Q?Cr=EAte?= <olivier.crete@collabora.com>,
	devicetree@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 2/4] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
Message-ID: <176531492074.1107900.2748821252600292565.robh@kernel.org>
References: <20251206082809.2040679-1-christianshewitt@gmail.com>
 <20251206082809.2040679-3-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206082809.2040679-3-christianshewitt@gmail.com>


On Sat, 06 Dec 2025 08:28:07 +0000, Christian Hewitt wrote:
> The video decoder in RK356X (vdpu346) is described in the same way as
> the one in RK3588 (vdpu381). A new compatible is added as the decoder
> capabilities are a subset of the vdpu381 capabilities.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> nb: I've chosen to us rk3568-vdec not rk356x-vdec as other compatibles
> for these chips are using rk3568.
> 
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


