Return-Path: <linux-media+bounces-41567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB5B40022
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E4B75E590A
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F2F30BF79;
	Tue,  2 Sep 2025 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G624TEn7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B142FD7BD;
	Tue,  2 Sep 2025 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815040; cv=none; b=O9z2ZoaN48pxd2bwZnxQ1ApQ5NVlDVgPaP9GDJqLm/DInJTXF6vLKIJZED0BPvBiaTVI4rwUu2CDnS+J/cnIhfW+mXgy1NhhjFaCi/VxXf+pfwM5q46hQwzs8/ncps7nrVeo3z7gg/kJFn2IOuSL3CS6N/WrOdBiAsGQrMAbm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815040; c=relaxed/simple;
	bh=GbbFeZzrbcI8rDp8W4QhTXZmbwTKXN2A7HqoJkccNMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7BhlXSAWqDuWw0pWozGZ+WIjLwO07Q5/qrLVctNQ2cAEhf4iZiT9nqxVmjxbKgeRkRSBonkjOEcXPh0BCb6OnHJeCm+LnWeoFI6Nlz/grZgf6jd9W0HHKJexCJ205yphEJm5WAM5z2Ha92QuQP67cPwLi7FS/r/8m2VbpT8MvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G624TEn7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 17A72C77;
	Tue,  2 Sep 2025 14:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756814968;
	bh=GbbFeZzrbcI8rDp8W4QhTXZmbwTKXN2A7HqoJkccNMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G624TEn7U+k1qutEWygtZ71VS4M4AdCFCT2951MnoCwutqaiubDZM1ky7U/iI3P1f
	 aoyEzRhQ2IrinA1+dt0OfB0iZQ4Xn69vmkz1th51Okkue+hYqC6OPras8qLE0reK8n
	 xmhfAHZDuyzuGR4inm6/C+9iYXD/UU+YiUmQfUKs=
Date: Tue, 2 Sep 2025 14:10:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, linux@treblig.org, arnd@arndb.de,
	mchehab@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <20250902121015.GI13448@pendragon.ideasonboard.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250808154903.GB23187@pendragon.ideasonboard.com>
 <20250902103249.GG2163762@google.com>
 <20250902113527.GB1694@pendragon.ideasonboard.com>
 <88042d72-b428-442e-ba3c-b15e587e12a7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88042d72-b428-442e-ba3c-b15e587e12a7@sirena.org.uk>

On Tue, Sep 02, 2025 at 12:47:39PM +0100, Mark Brown wrote:
> On Tue, Sep 02, 2025 at 01:35:27PM +0200, Laurent Pinchart wrote:
> 
> > Patch 1/4 has been queued in the media tree and should be in linux-next
> > as commit 103b0cfc9ab6. It is based straight on v6.17-rc1. Patch 2/4 is
> > also in linux-next, but is based on other ALSA patches. The simplest
> > course of action would be for you to merge 3/4 for v6.18, and 4/4 for
> > v6.19.
> 
> Or given that it's a driver removal we could just get a rebase of the
> series against the meda tree applied?  The conflicts with ASoC should be
> trivial to resolve.

I don't mind either way. I know Linus doesn't like having the same patch
merged with different commit IDs, but I don't know how strict the rule
is, especially when git should be able to resolve the conflict
transparently.

-- 
Regards,

Laurent Pinchart

