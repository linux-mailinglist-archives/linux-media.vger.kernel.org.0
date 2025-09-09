Return-Path: <linux-media+bounces-42113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4854CB4FC20
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 15:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7FEC4E17FE
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5DA340D98;
	Tue,  9 Sep 2025 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gp3d7dds"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF34335BAE;
	Tue,  9 Sep 2025 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423530; cv=none; b=LYNhCLC+tWVWlrBWvYE2xplUZWF4qbqNPXIzVyuzdCB5nEjp95thXgvogaoKPYbTVxKxb09uBSVgpd9lDxCUzxaolnX4PZS1mJ1cAz8XJDP1qGITq4/ZVg8kyzlqXRk5G3soe9y0JhGR6C4y540vIoai809G1nTcOLstmfYuBlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423530; c=relaxed/simple;
	bh=gKJA5qVK6epw+rflk+7KDWhPkkSQ8HIBUNn4mxtldCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iav+lbsI1UA7GG8DaKzrJncfjS1Ti0CiXCtnJXNaQ+cPN72LuNmhkEeZLtmKIuc2AhL6D3bYEs8iKswjIR1ljYpgXXRBsLUOT4Qap3JX3AiKpbXDevGjKSSdcLlJKYE8dYaWZzIu5zTUTJ/WlEC1dV/KLMK2fo1WssAJUVoEHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gp3d7dds; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97C5C4CEF4;
	Tue,  9 Sep 2025 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757423530;
	bh=gKJA5qVK6epw+rflk+7KDWhPkkSQ8HIBUNn4mxtldCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gp3d7ddsviq3ErlSBbi033LuArTUBYaS5C0afFD1U0Ug2gkTLVzeFPAq/3+Rfke1I
	 K3jxfcIT0zTgDuNhNuGNhqIororwgN/HQwNLPXP7xVnOPa/PCaQgM6XEJuifEkB3y3
	 g+D63JOCvT0mJKpyaC5h7szDkdty0dTk5IwhJ/+BUy+z6VteCzJb8JVncXCim/mCuE
	 L4gjtRR3QyrbH4D+yDjeKPRreF9PIgBHCiTjRMpkkO4Pd4/frN55hEoktz1JXl17Ue
	 aChOQ6lwu/X7poekW/TNKNK7mijz6JpMnrSRlZj6U3ZRdViK9XmueE7UjbAmnpIL3H
	 3hDg1Zy85VDEA==
Date: Tue, 9 Sep 2025 14:12:03 +0100
From: Will Deacon <will@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, jgg@ziepe.ca,
	p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <aMAno-DkDJumcAtj@willie-the-truck>
References: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
 <20250827090809.34555-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827090809.34555-4-benjamin.gaignard@collabora.com>

On Wed, Aug 27, 2025 at 11:07:59AM +0200, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 8:
> - Add API to restore VSI iommu context from decoder driver
> - Fix reported checkpatch issues: add comment in pinlock_t declaration
>   and remove blank line.
> 
>  drivers/iommu/Kconfig     |  11 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 810 ++++++++++++++++++++++++++++++++++++++
>  include/linux/vsi-iommu.h |  21 +
>  4 files changed, 843 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>  create mode 100644 include/linux/vsi-iommu.h

I still object to the duplication with the rockchip driver:

https://lore.kernel.org/all/aH5yR9CkYSJ4PaZV@willie-the-truck/

at least drop me from cc if you're going to ignore my comments, please.

Will

