Return-Path: <linux-media+bounces-26854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A32CA429BB
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E600188CB0A
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 17:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE35B266185;
	Mon, 24 Feb 2025 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBTc5lYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2001537C8;
	Mon, 24 Feb 2025 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740418055; cv=none; b=rCfrPkT8Ru/+/j8CHMjrzUe+eyJJ7zPZfYcUNLzNiSBwNUEAfpYBFqiPbYqg2PlRJL0rgRoSKBWHfgAKGg/DD8TfZbOJUBwX9eaWBQCNSo+lgtOkWfXVhlB7cvGdzJi8x5g2ltBH8zIY7i36WvlMCIhuw3LplgFqNMcrmQ5FDWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740418055; c=relaxed/simple;
	bh=G0hV6F5emoBjP6Cj6DWH8LiN2FaXariNip3s524lSAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/prmxc393PL8Bae8HPiaQ/VK/wwpIlwkgyeZuiQzofKlZP/MY0PQVF2Mhf6FT0VGDh75ZuEoh64O7Q+3AmvzJPChvMCW9zhoxq1HypIVafqRBAyi76Hizf4wVdenwRlDpCp6MZX+IqHamNXbsJdeXNpVFezVM428dTVjTXmVcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBTc5lYQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638B9C4CED6;
	Mon, 24 Feb 2025 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740418054;
	bh=G0hV6F5emoBjP6Cj6DWH8LiN2FaXariNip3s524lSAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBTc5lYQbTzRWGQ5P3GfXxR+yM0X3GlUVwxWdvnnQlQl3aKDDy6fz428q3jSwjxK8
	 dsHkT3/b2G7FP27CuVqAr6l/L8Sp4fIW05ZYp7JlABPWeR8Y6ojzCC8SK2L8AeXBW0
	 qDrOCh5ks/m9DztuRrVl8OyaBnZeMAc2xUrJxbSPxWJ+VCY+aeKVRGBuaz5UtOx8D8
	 c1mMBgRejvA1uij7mJJWU2idox2M/hpjxcsDAXbKg6qvjVvlppGmjPhdIda3fvDGkm
	 F7NN96Tnqe8isXyZMGefrD2Pu4lmWvcKBO/g/ZnwG602Jg4WYuO1JvYtLbf/7scSzX
	 to+0Zyqm2yxKQ==
Date: Mon, 24 Feb 2025 11:27:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-kernel@vger.kernel.org, tomm.merciai@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 03/18] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G3E SoC
Message-ID: <174041805249.3557955.16934017711809968171.robh@kernel.org>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-4-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-4-tommaso.merciai.xr@bp.renesas.com>


On Fri, 21 Feb 2025 16:55:17 +0100, Tommaso Merciai wrote:
> The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
> interrupts:
> 
>  - image_conv:    image_conv irq
>  - axi_mst_err:   AXI master error level irq
>  - vd_addr_wend:  Video data AXI master addr 0 write end irq
>  - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
>  - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq
> 
> This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.
> 
> Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Changes since v1:
>  - Use oneOf for interrupts and interrupt-names
>  - Handle interrupts and interrupt names base on soc variants.
> 
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 65 +++++++++++++++----
>  1 file changed, 54 insertions(+), 11 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


