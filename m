Return-Path: <linux-media+bounces-59581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JZvEhCN7GkZZwAAu9opvQ
	(envelope-from <linux-media+bounces-59581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 11:44:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B8465C30
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 11:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B07AF3022FA4
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 09:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755373932C8;
	Sat, 25 Apr 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phvxTtvj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC17A3148CF;
	Sat, 25 Apr 2026 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777110209; cv=none; b=dS5SjEUmxOn8kkFpYZRBQ0LnvFmeNIPGto2+ixofpeo8PVHCgf2WcUQ2MRphsClkV92yDgL6Pl3cgPIZ7oYt/MWz9opb0zNXWWfXWYmh3X5kH15qnwVNpkzhegmIoaO38vvFMO2oHxh1FfROKMuK6fKlGKrcYtcrZqq9RyyNBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777110209; c=relaxed/simple;
	bh=pbYkUgEPSKLSBxJCAQasaIIIPDC/CM0syFqX/x3vfKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qzm3BtxENjdZi4QCvo2uFVoBxj83n7GoK/lbKAVMGMBVzarHXiUguCA9Alp5QTmizpRTPRSeJKa2ARkA8+Ja8gmao0Jb3OlBMT3OTrSnRWwdLi3fPM+jUexBvE4+1nI+RMxfqvQ4L//COFP8B46lhvrZvlFMPT/VdfE3tkwhG9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phvxTtvj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD299C2BCB0;
	Sat, 25 Apr 2026 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110209;
	bh=pbYkUgEPSKLSBxJCAQasaIIIPDC/CM0syFqX/x3vfKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phvxTtvj1tAarM6UaL8X68iv2IkYyOSRYLiSx8JZv8GU+HxaC1jX8KGbv5rm9sMeb
	 L2zDuuNMITwIMih5C+l+mDsbLtEH2yYw0HAJvxNm+9bHQ5ZxmF5du5nhbS4Amar7pn
	 mTKZQ/zYausX+N+luFJphfxw1IbFizpT6AcjOpQLjvvaqDTOLVPVKuSva1vcyI5x8e
	 HzHYWmfQYbI2D9Uv7lCLVdA5qUW/JjNJdp4GImQaWwgLBMTGy15O716lzAMwV6cJLK
	 G2nc9s1YOJpKv8NExAyzRHQnWR2DMFN9k9dLi5tpEvDN1rRq2yC6QKQzWSXnj7A6bL
	 FHXCgelBiu6+A==
Date: Sat, 25 Apr 2026 11:43:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: i2c: Add os02g10 sensor
Message-ID: <20260425-spirited-neon-alpaca-bf827e@quoll>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-2-elgin.perumbilly@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424092554.26130-2-elgin.perumbilly@siliconsignals.io>
X-Rspamd-Queue-Id: 911B8465C30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59581-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,siliconsignals.io:email]

On Fri, Apr 24, 2026 at 02:55:45PM +0530, Elgin Perumbilly wrote:
> Add bindings for Omnivision OS02G10 sensor.
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> ---
>  .../bindings/media/i2c/ovti,os02g10.yaml      | 91 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


