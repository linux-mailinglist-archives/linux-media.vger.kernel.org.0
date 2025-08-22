Return-Path: <linux-media+bounces-40777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5945B31BDB
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E8791D6287A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140EB313534;
	Fri, 22 Aug 2025 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQhLwhwK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467D3101DA;
	Fri, 22 Aug 2025 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872661; cv=none; b=aJ0eOQ6bZEwiw1Na1u/YmkDcCiuErJ4UXz49KMnPjyiJ54sx8CLC+L1g4ZgnDnkKYksBdHU24sDKQn9m9xTQ85W3eTZyKZeOYyD1YpGBLErCiVS+H3onE0JahN7WDfimKuZ7WtnvJWdb37EiLyGjJEQMWHYjw7/cbQocNYAOrTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872661; c=relaxed/simple;
	bh=GHecUB/f6hF+l9nChS4AFiY+XY/E6xx0si6J6vs4S50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFnINe2/C3VT9ynd+e7Jld/rlQSSR/ENLWZjoIFkkG/AJ0x7EUZlWgYk6sOcZkheNTEM8hap76gRRhlPDw3vXR/cADJmwDWEmg+SECLBY+jx1tc/nXDKCvf5Ly0seO/v18QX8fempamLc+jt3sMRdLckmbl8Tkncrg2o6nclBn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQhLwhwK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE016C4CEED;
	Fri, 22 Aug 2025 14:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872660;
	bh=GHecUB/f6hF+l9nChS4AFiY+XY/E6xx0si6J6vs4S50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQhLwhwK9qrnQh0flYJggQka8E9ZJzmwlNyAz3bfl0zQfiwan5NF/9FvEXCkpfzG2
	 UupBjYLXpTAxzPNfowHY8wR7FevmagLt8My5R2DRDtbh89GRxOWNmxWxoSHxRiuWRq
	 Vo/k7FSAsf6Pk+xGvOF41pl0MkbnNsWqEZ49JWls1wxcthZveWEQhM+OaCijUyK06P
	 /r7MpjTSsCvyJue9PKF6SCPgoLB5ah9QXKItaB0BZDPD7hOrkaYbN0la8fsaShRnmc
	 DZsqAb946JMkf8qu9xNWWPGOST3sTqIf3kVJkrsUoqXnFEUqqZtInP5MYOnlZPXwnV
	 Ee7I6aPWCj55Q==
Date: Fri, 22 Aug 2025 09:24:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	jose.abreu@synopsys.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	kernel@collabora.com, nicolas.dufresne@collabora.com,
	Heiko Stuebner <heiko@sntech.de>, nelson.costa@synopsys.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	shawn.wen@rock-chips.com, Hans Verkuil <hverkuil@xs4all.nl>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: dt-bindings: snps,dw-hdmi-rx.yaml: Updated
 maintainers entry
Message-ID: <175587265951.3629173.15028167331028929815.robh@kernel.org>
References: <20250820103059.342850-1-dmitry.osipenko@collabora.com>
 <20250820103059.342850-2-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820103059.342850-2-dmitry.osipenko@collabora.com>


On Wed, 20 Aug 2025 13:30:59 +0300, Dmitry Osipenko wrote:
> Shreeya no longer works at Collabora, set Dmitry as maintainer of
> the Synopsys HDMI RX binding.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


