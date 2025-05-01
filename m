Return-Path: <linux-media+bounces-31495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EEFAA5E01
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 13:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DBD4C29BD
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 11:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E2B224B0E;
	Thu,  1 May 2025 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7biSUC9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD8E2DC76D;
	Thu,  1 May 2025 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100178; cv=none; b=QRVes6Ibylj55qLTePCtjmyuKKgFbxBDB95BaIYDxWAdtIzp0qlcjSvVVWXy+XeMdNNBy4RDV8eeBN/JCcQWjErlEKGHgjU9Q35nFBdH/K2cQqtOsbZif/QnAbDZ0emF41s8daptTmIHtLB+K0LBZNIxZRuQEYTlADPvZHnN1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100178; c=relaxed/simple;
	bh=FTxRP/NnhPU5ICm8D7Ow5D8WYpEp0BGoUoIw9tq6zRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVrkb3sc8ex2ZcZ2i9mN5fHdX7So5g5mgs7K7D6G2FjFY8OdduHwNMCo56vdpAg7mOJEiIbIS8ucq/0rg2QmxKliFGlWDp9SOoIcRiMJpeYt/I7fOMhQTwbP0S7JeGUW+dnqPcyGdEGTGw6ght96EoR1EFJscY5Xe2TvYSoDnTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7biSUC9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B567AC4CEE3;
	Thu,  1 May 2025 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100177;
	bh=FTxRP/NnhPU5ICm8D7Ow5D8WYpEp0BGoUoIw9tq6zRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7biSUC90d0iurJoQdGw/mhEIxzn2WC1jyuPfbexApRPFHI5LH1eKc+ylGYrFqkVQ
	 e8NvnwS1/wNGEVkdiz/233X45/rQDBvZRbyE0arJTV0ZcI3Pa+KDgDeZUhfyQVEh4q
	 HpF1fu9rfIxFwI/VioUSE+ouKAymUZhHrIflRk12fopd8edCxI1WqyzS4v6bKZ2A7+
	 2FqH21nDu+x1MSqZwzpXoJj1w8l8eyUdAqHO+L3eMVshZpgfGkVN2VJEHbWCa186W+
	 AxZXKYDAicejeRAsiIKHLS59+H7Rl45JCkGroI0PgEGkmteSIribnilTMYvCZ6RQNp
	 8nWuKpsJZeA3g==
Date: Thu, 1 May 2025 13:49:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Collabora Kernel Team <kernel@collabora.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v6 04/13] media: dt-bindings: add rockchip rk3568 vicap
Message-ID: <20250501-tidy-bittern-of-genius-ed375e@kuoka>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-4-d2f5fbee1551@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v6-4-d2f5fbee1551@collabora.com>

On Wed, Apr 30, 2025 at 11:15:53AM GMT, Michael Riesch wrote:
> From: Michael Riesch <michael.riesch@wolfvision.net>
> 
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 171 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


