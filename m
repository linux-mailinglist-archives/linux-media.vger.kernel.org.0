Return-Path: <linux-media+bounces-42606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C73B59143
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 10:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B91071BC3E45
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 08:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099EA2741C6;
	Tue, 16 Sep 2025 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7LdLz0v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE0288C08;
	Tue, 16 Sep 2025 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758012520; cv=none; b=rcNOtwuHPP3S0UMv56fiTC9zx+oiJUvIpmQJrTB5t520FjSki26tNENeNI5JGIuapfi6/1Zq+qxAXoiQMtm9uaC5M5JiwCpml+k8WQEsHcef2VURLht/riUVJxiG3QEUSxKpanAzx6/ToF8aFY2h07kTihCqOYn2Jmz8w6IYJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758012520; c=relaxed/simple;
	bh=gBC89acRt2ZWThI6GiBXUA4qAUTNm8vCd8qyDvzjiZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5W+aFDMTUogwMSg58UBKNBUnxGI5STyoYkqqAPu8jiu+mwAiLod0UuISxxC/gFQqbdKw5yeEXtkQ82OSpI6/rtxlrxWF1shwYZMa78FVH9JEivDeXc/qIjPQUByQtrXw7Mt+aWlaib9g27j4lw95W9b5tm5Texi1CI/kmGi8lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7LdLz0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88BFC4CEEB;
	Tue, 16 Sep 2025 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758012519;
	bh=gBC89acRt2ZWThI6GiBXUA4qAUTNm8vCd8qyDvzjiZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7LdLz0vXRu1QDRO3ZuQvA3+jqh3JxhTQHX8IW4VHNOE6jLAJTC8Gk87eluIh4jMT
	 bli4cXARt8ZQ6n6iqCiYQqtVy69DTegtOxc8LKakwQKUEqA2ZHBE2k+mYufiJ3o/h7
	 qesqNhorL9QrNX78rRFFprSYoXlFml9tgAj1rkmlm6pyvZupIiXfDuOty7eTB9qDqo
	 CouLVJhpNf8Pm+Q7rzYldmyitAeHqbukysVTR/mjP/u05hEnXKBbZCt/KRGpHXsHfJ
	 +n8uUiWSVq10XIvunL3dTV/12Q4aEpBQsfBiiIxiFvqrecpRpSlZT0oZuc1Pk+VoTO
	 +1DIAmhw7/dug==
Date: Tue, 16 Sep 2025 09:48:33 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <aMkkYU-p2ouknnAc@willie-the-truck>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
 <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
 <rt6nvgazcl6mvyy4iuut3n7irf72t7rex2iwabbkuxp7cdvez5@2nanenqgxjdy>
 <20250915225806.GM882933@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915225806.GM882933@ziepe.ca>

On Mon, Sep 15, 2025 at 07:58:06PM -0300, Jason Gunthorpe wrote:
> On Sat, Sep 13, 2025 at 07:58:04AM +0200, Jörg Rödel wrote:
> > [Adding Will back to Cc]
> > 
> > On Fri, Sep 12, 2025 at 01:37:11PM -0400, Nicolas Dufresne wrote:
> > > To me this rejection isn't about Benjamin's driver, all iommu seems to look
> > > alike, so anyone else that would have sent new driver would have face the same
> > > issue.
> > 
> > This is about ignoring comments from one of the IOMMU maintainers. I am not
> > going to merge a driver with open comments/objections[1] from Will (and a few
> > others), so resolve this with him and get his Ack.
> 
> I would strongly object to trying to share map_pages, unmap_pages,
> iova_to_phys, free and other iommu pt related functions in some
> limited way instead of helping on the much more complete iommu pt
> work. Which is what I said to Will, but for some reason he suggested
> it anyhow.

If the answer is to convert this to iommu pt, then so be it. My
understanding was that was still premature at this stage but you know
better than me.

When I bothered to look at this driver side-by-side with the rockchip
driver which, despite apparently being totally different IP (honest!),
is *remarkably* similar, I summarised the similarity in the default
domain ops:

https://lore.kernel.org/all/aH5yR9CkYSJ4PaZV@willie-the-truck/

But rather than respond to that, Benjamin just sent a new version. I
was hoping for a bit more discussion...

> Sorry, but it doesn't make sense to complain about duplication in
> drivers and then not help advance one of the biggest projects to
> actually concretely and comprehensively address that duplication.

I don't think it needs to be one or the other. afaict, these drivers
should share the default domain ops and if the page-table code is using
iommu-pt then that's even better.

Will

