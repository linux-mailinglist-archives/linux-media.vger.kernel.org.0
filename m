Return-Path: <linux-media+bounces-42421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE3B54B89
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 13:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FBA4189814B
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 11:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFEA26FDB6;
	Fri, 12 Sep 2025 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="TuGBNjKg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0115301465;
	Fri, 12 Sep 2025 11:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677669; cv=none; b=Vm6dZeIRGt1FuBAR3LEItFNcjR71cqtY1HOYXINCy5k8uruEtlkwjos8hmh2MXV5QRNIG7gOOw1SRwvSUA410769DKoS6PMmAgzvUuy1sDBkC5mesC3DBlH3/M6snXvNJdMuDMGUDhHqsXf8a8VOWW0q7vlppIHB+wTWLAbFUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677669; c=relaxed/simple;
	bh=O23FHartpNXa3B2+8P0e6umlSTmWF4M31wzrGfMsxNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YT36q8Wnv0mJ0kMbJDjoI8bWhO32MFRPC/0yWTz5llDRSuzLk+XsixxsJTwamLl/c36VqwgPo/3W/b1bEjSMsyoaZUoJH4V57SP/Ba38VtOligG7f78kKVY04EJdGf8/G61uJJV4zRhQOnHUKsumrMTqmn7HN5KnaO2y5PBtjXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=TuGBNjKg; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4BA0D55365;
	Fri, 12 Sep 2025 13:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757677664;
	bh=O23FHartpNXa3B2+8P0e6umlSTmWF4M31wzrGfMsxNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TuGBNjKgGjc7yqBhEUgn6FK+hrsA0xOfz8y++MiUux96Cu5EPYKWt3cGVfHpQ1cpE
	 /RiikfxzkmAqO4Y5GF/SrUmOLpGdK3KgqFuGJIRMc/2MJrVOWZ06RoQFYtiK0gdSDF
	 rBxXdNbLB7IGD0PCef2ssrTmY3sQdgGpT6fEuonOyCJW94SN2K/MFwUnLKSYusdhwH
	 qIoztTMU6AQGs8mmyhrhDYG0UeVvnSN4QlLstjxHq1B3QryYndb9Ite7LO7QKIZfsm
	 lf0lscBIUmro4C1yDVaDjycQvSz5nLwdV9HbiSFehWRNXEoTY8dxV1JbdkIuor/8UY
	 FRXOYph4gmacQ==
Date: Fri, 12 Sep 2025 13:47:43 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com, jgg@ziepe.ca, 
	p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911155720.180465-4-benjamin.gaignard@collabora.com>

On Thu, Sep 11, 2025 at 05:57:13PM +0200, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/iommu/Kconfig     |  11 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
>  include/linux/vsi-iommu.h |  21 +
>  4 files changed, 841 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>  create mode 100644 include/linux/vsi-iommu.h

This will not go in before Will Deacons comment about code duplication with the
Rockchip driver is addressed.


	Joerg

