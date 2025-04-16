Return-Path: <linux-media+bounces-30379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B76A90B29
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 20:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AAFF5A4AD4
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 18:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DBA21147A;
	Wed, 16 Apr 2025 18:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDXQykB/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C319211A0C;
	Wed, 16 Apr 2025 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827300; cv=none; b=u6Ke358QwlXVhTatEYB55YzcHfPE1jmjSOPp79YfnIV+5cCoYinBIkAqvTYmiNcMA5xQYMnQTocU0YOvgOFcwjTm7BUr5VY7L09R9vQgE9+ZCEM1Jbn6D6FaUx5BItg38xbl0blx8E/+n9J6br4XD61sbYYVnPs5e2nAOG6EwkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827300; c=relaxed/simple;
	bh=Hl+qE6e1hKPx8LvF4MK3eS/E9KO8+f/r4ccwLgLC7yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdt8UUHE0R5V5Xxw5jRpAS3CQ47loQn0M7Tilit63q68e76WNxyknlw91oGulpXTCT1/Z3eX9+m/vfYbKH2vNSdzUf7buJHyfuQ2d0Z1Q2BXw4SSI01v76R+EWavaoPG7xc4bnEhRWvVc+hIvJCdNOQTBRH3emXgzzKbo82m4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDXQykB/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F175C4CEE4;
	Wed, 16 Apr 2025 18:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827299;
	bh=Hl+qE6e1hKPx8LvF4MK3eS/E9KO8+f/r4ccwLgLC7yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDXQykB/D06KZRTLdQ5o3lYgLD9XD2kpcCUzEUq0WlKoy6aBuC6Prsz4Ylho53i6v
	 f78bXvCgXVR3oq/TaGCGzBaxJv/4ehH5zTTmDWMMyTj+cUEdrMAFyQWbTT+KdK+VRC
	 EA8/5cT9lsWaL+iQsJxuGZir4uJjEe70XyIQ2zS1Rd3yZZCTYCgU9Q9kcI1UUA2jNP
	 eoBdwsxrGB5vOfXWijmxYLapyg7GBvmuVsZtcIXf+x4ZEvphEmRwQGfit9jxVk9KLf
	 cef6OEKm7p7/SrZZ9PNdgG10jgR9KcMSL7GhTF67uZD2kc9bpKqI/eKvRct+1VyYio
	 Y2eHuYW6fdjnA==
Date: Wed, 16 Apr 2025 13:14:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: media: convert imx.txt to yaml format
Message-ID: <174482729735.3601453.17180979927666632350.robh@kernel.org>
References: <20250416154729.3424617-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416154729.3424617-1-Frank.Li@nxp.com>


On Wed, 16 Apr 2025 11:47:27 -0400, Frank Li wrote:
> Convert binding doc imx.txt to yaml format. Create two yaml files:
> fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.
> 
> Additional changes:
> - add example for fsl,imx6-mipi-csi2
> - add irq err1 and err2 description
> - update MAINTAINERS
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - add irq err1 and err2 description
> - ^port@[1-4] to ^port@[1-4]$
> - add port1 in example files
> - update MAINTAINERS files
> ---
>  .../media/fsl,imx-capture-subsystem.yaml      |  38 +++++
>  .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 144 ++++++++++++++++++
>  .../devicetree/bindings/media/imx.txt         |  53 -------
>  MAINTAINERS                                   |   2 +-
>  4 files changed, 183 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/imx.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


