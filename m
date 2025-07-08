Return-Path: <linux-media+bounces-37148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A059AFD501
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 19:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A27B1AA5C61
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1C72DD5EF;
	Tue,  8 Jul 2025 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOBPe097"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86819EED3;
	Tue,  8 Jul 2025 17:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994979; cv=none; b=PNyphXC0gqs0Zasy4r6dKkqyCdTgG0UPtBMoA2S+3mr1gDGyu6VdncBKaqA/ZhAjwD68qni4IAHaUJd0IvtfrppFXWmRyNgnptMx906pnA441DulkHBfLl1NMMdFpZezWbnTdxc8kqKA2CSstslY2Wb/pZ2Xu8ItkKXDinC3zKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994979; c=relaxed/simple;
	bh=9BnTd3kqHiI+RLRuW2SIH7nDiSe8klvUWwh1RoroQaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmRzQTmOBuTDo6UrwlAT2Hkb0ojvG0L3aqdvgsQRfNhlfRsjDVGqivPOvBOg2XdIxwJ/cr8Fh9UZRt1mo9wjOlYaXiOHQ/ACNSQOBO6oUV0jf0pIntdqW1BFswpexbPJYVn//mA+mTbPpgqgpDuBKIKPw5oaOZpS6YMmx9eZhB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOBPe097; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FB9C4CEED;
	Tue,  8 Jul 2025 17:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994978;
	bh=9BnTd3kqHiI+RLRuW2SIH7nDiSe8klvUWwh1RoroQaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOBPe097FZ5t6a0C9qYnF21fHnNu5epcIpuRDUjCKell5EMf45OF6TYRCrf/PtuGo
	 7bbp7XyPxJwGxS/N4dlApJAbEoqBYTXs8IShXKgysMPjJkBVWlhGfhOb6W3olv0p4H
	 5hGVRwyRdnlcsxBYNWh+76bNB+/R+HDW15Ss03oAzfrhlwUA0d+RvRRBHuQEinpAqW
	 RXiUVbFFnw80AtaEQrb4uP/ezbEvygBln7JecSNcjr9zLOz/GD5AsWOt9gPFz9kUgI
	 HBZBtxxE3+ZsI9wCDqZ9410ou+7CJY9C8p18JAXYkrkAhx5NsfzoH7AZkOo4RZ+MJg
	 waCzbupzZPt6Q==
Date: Tue, 8 Jul 2025 12:16:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Yong Deng <yong.deng@magewell.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 2/9] dt-bindings: media: sun6i-a31-isp: Add optional
 interconnect properties
Message-ID: <175199497651.649032.8001124742935274339.robh@kernel.org>
References: <20250704154628.3468793-1-paulk@sys-base.io>
 <20250704154628.3468793-3-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704154628.3468793-3-paulk@sys-base.io>


On Fri, 04 Jul 2025 17:46:19 +0200, Paul Kocialkowski wrote:
> An interconnect can be attached to the sun6i-a31-csi device, which is
> useful to attach the dma memory offset. Add related properties.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


