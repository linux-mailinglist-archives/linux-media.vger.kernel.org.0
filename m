Return-Path: <linux-media+bounces-45664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D7C0E20F
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 14:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 079194FBFCF
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B352D30505E;
	Mon, 27 Oct 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRs8YjiL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F2923BF9F;
	Mon, 27 Oct 2025 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572250; cv=none; b=h2aIHl3wUXxNk6CrEQPZF8ZYMoriuWTnyRj5bz++lkgS70rGMG981zbQvJVa9VCUHPcCDvIoOtpd9Z3GjXJXHb2iOHM4Qkb2zuD2REwScdBTktE0/izdGr8TZoQPd5oTfO4OjFZHIWSWiPxYfuhzOHbgq7U7wME4ewCWyoptL4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572250; c=relaxed/simple;
	bh=sDzyF2CI4Ve7jNRefYb/GwI6Wxad7x3z6YmDoIi8foo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqnItdSFBjNHyaRu/PKR99QKImjqtjzpEDcv2ere5PL9PDZEiHsimt9eBnej07o19CUAbWi8VtLuMp8qg/wSF+OQf7ftILJyB3WT8R+PPgt3U7p/Dj8kNlwjCTWKix5d2iYge66fo6Y3wAvXc6NdwRjN0IkRkK0SGOFKk3xGD2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRs8YjiL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43E0C4CEF1;
	Mon, 27 Oct 2025 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761572250;
	bh=sDzyF2CI4Ve7jNRefYb/GwI6Wxad7x3z6YmDoIi8foo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRs8YjiL/vupq7FSOVRNEacfhBQcf1T9IF239ohLVyns22THLQIQ9BXfdWQCcNKSr
	 0GB6ETuVxjbeBGQbf4RpFbrrhoB9kk7PRCvKnSDFb6lN2zyATw6bGBB4vRYVXE0IGK
	 ALOpRiHpDyPi1N/kZoShILXepKHMBlA/enKdVhyZfT2VKyKkUqmJWBsNAHsf6UWJYk
	 2pL43uvQsT1HO/AI1dL8fhiRRPXun2lTqRven8udzlAyxhKpNS6eIgP3Xgx2gZ2lK1
	 Kkzau+qsaMFg4AjcJxlq0Qe6mr5iphzHUfNZWPKWiyvHtQtq+MtdXodtRc7WRfwfP9
	 2Uq2br7Mufr+Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDNPh-000000000Jg-2TyV;
	Mon, 27 Oct 2025 14:37:33 +0100
Date: Mon, 27 Oct 2025 14:37:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
Message-ID: <aP91nfnpShIhXcVQ@hovoldconsulting.com>
References: <20250924133552.28841-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>

On Wed, Sep 24, 2025 at 03:35:49PM +0200, Johan Hovold wrote:
> This series fixes VPU device leaks during probe of the mdp and two codec
> drivers.
> 
> Included is also a minor documentation update to make it clear that the
> VPU lookup helper returns the device with an incremented refcount.

Can these be picked up for 6.19?

Johan

