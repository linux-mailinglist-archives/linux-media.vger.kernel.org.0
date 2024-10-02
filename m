Return-Path: <linux-media+bounces-18958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191C98CD02
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59F22856AD
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 06:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7399584D12;
	Wed,  2 Oct 2024 06:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQuUGJeR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB35464E;
	Wed,  2 Oct 2024 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727849781; cv=none; b=m7G6yZBtM4laI3XADlXK8BBot8sZl3lrGd9EFgT6/IDtfeKY6KMMAyVPuKcaVxuZT85EFHvs+Ic+JrK1QqktfrQ6fZlE6QusFsiF8E7sD1KId7rrBlmR9c+UMiY37EIvBlzUdSa1AfuzBFr9NWLyImsBQiShZjoTXXurO24hRlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727849781; c=relaxed/simple;
	bh=5onFaWDsfjRqVLFgmX8TYa5l4emUjeqXUisKazGF7oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/a810b3gUzAquvmxMoae958GHfGJw5seMwyDb1E/tLa2hDmcIdorwNLZfRMBonSwG8fMbo5FRhF2MHqLboJVDMAXJ0QFD1ITUh+dZmfZr3YoFaKQjjUA4Au5zOMsK7KB174HoVqu9UFbLeroXRggUUU3+F5+7y8r44Ff8TpS40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQuUGJeR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B51C4CEC5;
	Wed,  2 Oct 2024 06:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727849781;
	bh=5onFaWDsfjRqVLFgmX8TYa5l4emUjeqXUisKazGF7oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQuUGJeROPqlnHPNwY9eeBEp5vQ3ueIGDxa8kZKc5BQOfWYhXK+CIqQzjzwACM0AV
	 PxbkpoLhl35J/bH5DNCoY9pUldZF61JuJOdcA8TfeK5bFCHZHXniQ0fD8eLsTwRZSs
	 f7PR8BTIlxeT45c8oekmOUp9lP1LDapZo9CrBHkvjyIGbZD7VYS0iuMbJ0F3y6MRnx
	 p38DGVnboFz3KHgIIL3TBhm5i0ZSQiqjRn7vQVV68dDDPrxGeHQvgD/EqDpzLPlBzN
	 jH7FpId3iAw9/XTSUVDQFDSNMOe5Cq/68jvF6XyB/8B/EGW/bG0ywZS4VuFMHhP/eO
	 9hlbqWrxnyOHA==
Date: Wed, 2 Oct 2024 08:16:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bin Liu <bin.liu@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Xia Jiang <xia.jiang@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: media: mediatek,jpeg: Relax IOMMU
 max item count
Message-ID: <r22z7eehmuprvq67gxekqwsah2mcobfsyhn7xzyyh2gdtjegve@zl32uljxrilx>
References: <20241001113052.3124869-1-fshao@chromium.org>
 <20241001113052.3124869-4-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001113052.3124869-4-fshao@chromium.org>

On Tue, Oct 01, 2024 at 07:27:21PM +0800, Fei Shao wrote:
> On MediaTek platforms with Multimedia MMU (M4U), a multimedia hardware
> can be assigned with a local arbiter (LARB) which has a maximum of 32
> ports for MediaTek's IOMMU infrastructure. That means there can be at
> most 32 items in the iommus property in theory.
> 
> Instead of relaxing the max item count every time a newly introduced
> device tree hits the limit, bump the number to 32 as an one-time effort.
> 
> On the other hand, all existing and foreseeable JPEG decoder nodes at
> this point have at least 2 IOMMUs, so set minItems to 2 accordingly.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> It's not in the upstream tree yet, but the upcoming MT8188 DT will have
> 6 IOMMUs in its JPEG decoder. This patch is to pave the way for that.
> 
> Changes in v2:
> New patch.
> 

I do not see any user of this in this patchset.

Best regards,
Krzysztof


