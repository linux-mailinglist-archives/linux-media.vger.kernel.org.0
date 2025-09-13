Return-Path: <linux-media+bounces-42478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4848CB55EBD
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 07:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B2AE7BA9AA
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 05:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0682F2E62BE;
	Sat, 13 Sep 2025 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="XqK1+UPu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8DE2E2DD8;
	Sat, 13 Sep 2025 05:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757743094; cv=none; b=WbJyoul8CydymhHHowqIz3sqC1NhUzaMU0+c2V59TohJvHc6/e77gtEHkLj1bkmhNomO7A6iQAHcqZwgLySzKdhGdPTB0brKgSl/6XvuI6a+zsnLIhlMO6WqFdOhgpRb2HU8u6YREqV/KeAwyydLZPntjbQD1rXpejOAjYGQdf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757743094; c=relaxed/simple;
	bh=TdTQRlOgkFFp121tWctGOE7zJMN8424tRrjVZduIikg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjZx5IacdQeWA4N8YYg743B/n/yiOFhb7R5IVQ2SI4ANhvh+D/NIR3wiJQIhFT1UraFg8IpYpYj5YEfsOoehg0jmI2L82oj53vgI+XbDfvBdjHTGmIsEyts4ud0PE2+3mii2fqtQCxexVwzvUpu98uuNoEl+3PrXAXeBnBRxJ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=XqK1+UPu; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 20DBB4FD40;
	Sat, 13 Sep 2025 07:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757743086;
	bh=TdTQRlOgkFFp121tWctGOE7zJMN8424tRrjVZduIikg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqK1+UPuImxMQZCxA6SMPJbtwsVcWCAEAh20urbbjeTj7wMT+Sv/Pfi6Luy1xLiJB
	 K4wYK1jOR9pgBY4L/Z+Hifkxw4YopSYDUrHwlrgPTBeytduGK1/BEJG1rVUjO46x/m
	 It4hn6eb/zBK1bX/ddQEjFCD0xWQqbohk+ZnuCQgdtSsZyaEGznKDVbS2Nv3uVqLls
	 6T3cqm32KoGrl6CT1weUyJ2Gl1KkhRgNGuJd0gERBjHseLnsxapr/baWqBostSLSxR
	 G45QWT5TqIuGRW/J7eTwrH0PUeDSj+ENwVNo36DdZK7uHzSx4Xrkh1XJdLQwC5xlqD
	 T0WyvAhR7p0WQ==
Date: Sat, 13 Sep 2025 07:58:04 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, jgg@ziepe.ca, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-media@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <rt6nvgazcl6mvyy4iuut3n7irf72t7rex2iwabbkuxp7cdvez5@2nanenqgxjdy>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
 <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>

[Adding Will back to Cc]

On Fri, Sep 12, 2025 at 01:37:11PM -0400, Nicolas Dufresne wrote:
> To me this rejection isn't about Benjamin's driver, all iommu seems to look
> alike, so anyone else that would have sent new driver would have face the same
> issue.

This is about ignoring comments from one of the IOMMU maintainers. I am not
going to merge a driver with open comments/objections[1] from Will (and a few
others), so resolve this with him and get his Ack.


	Joerg

[1] https://lore.kernel.org/all/aMAno-DkDJumcAtj@willie-the-truck/

