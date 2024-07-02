Return-Path: <linux-media+bounces-14503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4391F04E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 817A01F230DC
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775DE14387C;
	Tue,  2 Jul 2024 07:35:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE14174047;
	Tue,  2 Jul 2024 07:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719905712; cv=none; b=VgtTnHJH+d3w8hEnTvVLNAZOAHuQQnoe2v1u81YOeQQHLYceUneV+epPaVwSXLNW9nIWKZug2LA+66sFrfIktSifbOy9bbciq8cTkWmdNPrQQckmlxyH2KtWaWdl57fhK3jRmO8drMaLA0D0nLl681zvwxwOP1vEBCFEaiYfThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719905712; c=relaxed/simple;
	bh=0yNWfrktYXxBCVqkz3LsRguM6Od88HtvY6n70FtxqUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1UM1Bnr07nwHu6GgUWRb9T/6B7ueMTDwxk6aXC2hSbt8DI0tngvAK/6Rk2IW/fjGW4LDof4mNzWoBi8ypJQ3MeKMm73gHLie4uJBoBj+EuWeHXXTiHubRJsVrALQ2a844j2wjr8z/Uqm21PKozPz98bpPmx7pwYRUyXkCZBgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9631968AFE; Tue,  2 Jul 2024 09:35:04 +0200 (CEST)
Date: Tue, 2 Jul 2024 09:35:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christoph Hellwig <hch@lst.de>,
	Thorsten Blum <thorsten.blum@toblux.com>, jack@suse.cz,
	surenb@google.com, linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
Message-ID: <20240702073504.GA29323@lst.de>
References: <20240630011215.42525-1-thorsten.blum@toblux.com> <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org> <20240702064017.GA24838@lst.de> <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com> <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jul 02, 2024 at 12:33:57AM -0700, Andrew Morton wrote:
> Dang, yes, that was a regrettable change.  But hardly the end of the
> world.  I do think each such alteration should have included a comment
> to prevent people from going and cleaning them up.

.. or we should have never merged that utter mess ..


