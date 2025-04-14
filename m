Return-Path: <linux-media+bounces-30090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4AA87796
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C455B1891200
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 05:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FCD1A2632;
	Mon, 14 Apr 2025 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I8KfdBzl"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CCD25776;
	Mon, 14 Apr 2025 05:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744610105; cv=none; b=NkVYC6aMx4ehej2eH8im9HqUZfXd5fSjU8Ag/AW6pSlQsfWN46vq04ZcwgdkIVShEPbr1yybyM5IIaUB8nKvd53Z1qqQ9K9MxAGpezEI/eY2J/VNkqQ+gNKX7RpC15yWxm/mTZxDdiRzbk1N/KchYEbRF3fqpjuVv+8TFbdGH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744610105; c=relaxed/simple;
	bh=Twf51frDL1JgECgIjkhofiy9l7pFeDlWuBWZG0A6w00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI+tBDsRMi/j4IE/4wZTMLdr12IvDowYaGr1hi/ddwVSJsvmRNyNuPTSYv+r1Es7brlkWBzcYnAmykt0lLC/ilbvoIP+dQdDeoWk9sGulwPXyvtO/BdJKxsIG7ropisGoUxhpBOWYyQUGw97Qdlu/6vidBTISGi2TNLvoBNglXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I8KfdBzl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ThCKDRswempuOEJ84yo2mtU9l4yxvOGeZE8tpO0fpn4=; b=I8KfdBzlRA2N9nmXn+STRIjztw
	2+LGoe/I754+SGvknv8AkTj4J3+46jJ89atsgpbyhLPLRKCwIkQkHkK8x1oiaGMmwVYgtgeaI/Yad
	V0Fc7vx+6DT3abW+WLCZGC4V82XGjT2VZPHOwz4Zv2UgLPRWgysoSC3j7+xuf1jo3vxN6aqcXmen0
	0f+GApbMTtVUVG6rUxjfUFq1ilH/d7lGRoTrWo/O9PYM2FPirNXuIq5o68vxqqS3V1N6x8i/ODWDg
	Hoz31hEt89k+/PMu8U1jAQK6nQBGwiRk05KrDW/szU/+NcBQ9diDOH1iclyGdr2SFsrcAddYXijea
	pyEzPO8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Cmc-00000000kIO-48Kt;
	Mon, 14 Apr 2025 05:55:02 +0000
Date: Sun, 13 Apr 2025 22:55:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Message-ID: <Z_yjNgY3dVnA5OVz@infradead.org>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 10, 2025 at 04:53:17PM +0200, Bastien Curutchet wrote:
> Hi all,
> 
> Many UIO users performing DMA from their UIO device need to access the
> DMA addresses of the allocated buffers. There are out-of-tree drivers
> that allow to do it but nothing in the mainline.

In which case it does not matter at all for mainline.

FYI the proper and safe way to do DMA from userspace is to use
vfio/iommufd.


