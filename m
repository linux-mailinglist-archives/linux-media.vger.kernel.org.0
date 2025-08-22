Return-Path: <linux-media+bounces-40801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F9B32372
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 22:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF7BB58815D
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 20:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75932D73B9;
	Fri, 22 Aug 2025 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doumbUTk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C11DED5B;
	Fri, 22 Aug 2025 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755893724; cv=none; b=QJ1v8XwOGbJVjQ/IT0YVi1EORhzJI39QtlD9/CEsc9xeE5wwXKKIPWBQwLfl7tA7B1PdS/Td+tcm/AZinYyg8t3w0BL8F9oz6RyToaWskuGltmAkZYdL8/xRVN4v4SXxYamhlgEXSL4nvR1R+/s5VbCJh3CIwD0ooBKTh5OGPUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755893724; c=relaxed/simple;
	bh=1Wup3O/kJKm/ZC5Sk9t0n/JhaFTwNdq1SU4O8pcpU7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWP7h0c2khu4tGx7gvVtpye5GmtK2FPuPEsp388VOrZiZKMwMEvSCFoBEWlwwJCOZEmMIg6wrxT/9ckyX25HAkNufwR8mVfWpMNnXV4y+3XdWU+Kr7Pn7yEZPvzugXR18CTqmIwMBrkgd6tfauAPvjeFRKsd9JX+BtzG/pHSmI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doumbUTk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D25AC4CEED;
	Fri, 22 Aug 2025 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755893723;
	bh=1Wup3O/kJKm/ZC5Sk9t0n/JhaFTwNdq1SU4O8pcpU7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doumbUTkxdxy5qD8tSwxIqmCWw1C+OAOW3s5urGlMmsHQFd+NT7V0Djyj7t88RS7J
	 /fK5Ozi66cGfCXt05DaxJ3UrKhkbTJ92GRoSXtV5Xzh5HpoLAHNXiSHAotKvIOx8n7
	 jqnviij6a9RquHEFabBbkJ0Yvi7mmAoAGs6yy0fMPgn/ZKjKRU3aum2taviMFLGp3b
	 xuq4wn7o8u7E9Q38ITLTbC08PV+4nKRH719kjfkoZKoIsUznx6sFt2ibOgCEO/L2+8
	 86zkEIt0Imw3/BeEi1LR44g/IMP3C+cfYDhwSWS0oXCf24Aamo66sR8ZnhUdNJYHU/
	 /vbUo5m8BJX+A==
Date: Fri, 22 Aug 2025 15:15:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Alice Yuan <alice.yuan@nxp.com>,
	imx@lists.linux.dev, Martin Kepplinger <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-staging@lists.linux.dev,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-kernel@vger.kernel.org, Luis Oliveira <lolivei@synopsys.com>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <175589372183.282948.13173863715963070537.robh@kernel.org>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>


On Thu, 21 Aug 2025 16:15:36 -0400, Frank Li wrote:
> From: Eugen Hristev <eugen.hristev@linaro.org>
> 
> Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> and i.MX95 platform.
> 
> Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3
> - drop remote-endpoint: true
> - drop clock-lanes
> 
> Change in v2
> - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> - update ugen Hristev's s-o-b tag to align original author's email address
> - remove single snps,dw-mipi-csi2-v150 compatible string
> - move additionalProperties after required
> ---
>  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 152 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


