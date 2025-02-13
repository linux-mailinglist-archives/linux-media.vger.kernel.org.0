Return-Path: <linux-media+bounces-26117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC16A33B33
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 10:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1088165D12
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 09:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5B520D4EF;
	Thu, 13 Feb 2025 09:26:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE5201276;
	Thu, 13 Feb 2025 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739438803; cv=none; b=Lb+NnT36eO25Q8/FlKMNUIjNZIHhw+HqLad5R2PwAVIqwawrfZZKIawrtflwfpfNp+KipgjVWpbJy7oyf2Q7iOnPuHRHnnoEwChMPzhxDMFy6gANTMP2ASFs8+yGRi9ZqKYpqmumasJ3VzIjnLTK3TJIOPgAuImRWHAB63Ug+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739438803; c=relaxed/simple;
	bh=lax+HrlMpQdynxzj6EcGBdocd4Mvn4Ob4p9CcQRFY04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBAkwhncG8vz6jURbpaTcXSWzmStbC1DNBLA5wDfJYYNBABIbDhwhzp8ex7pRjH4sxZsj7WYNDy/6W9EJ1tUALfRPUEwq1lkxFH+GG7S9IJCkWimopa8vHghiHl2vUe1XHGSgmzTSjN3dvTurbm2IGk7N8CqP3NGOPWsPYdJ8xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B42C4CEE8;
	Thu, 13 Feb 2025 09:26:42 +0000 (UTC)
Date: Thu, 13 Feb 2025 10:26:35 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sebastian LaVine <slavine@d3embedded.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Abel Vesa <abel.vesa@linaro.org>, 
	Achath Vaishnav <vaishnav.a@ti.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>, 
	Julien Massot <julien.massot@collabora.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Kory Maincent <kory.maincent@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Nishanth Menon <nm@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>, 
	Thakkar Devarsh <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
Message-ID: <20250213-shrewd-tacky-chachalaca-778a50@krzk-bin>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212195656.69528-2-slavine@d3embedded.com>

On Wed, Feb 12, 2025 at 02:56:53PM -0500, Sebastian LaVine wrote:
> Adds bindings for the Sony IMX728.
> 
> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
> ---

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Best regards,
Krzysztof


