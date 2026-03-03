Return-Path: <linux-media+bounces-54359-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGzcHbPdpmnRXwAAu9opvQ
	(envelope-from <linux-media+bounces-54359-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:10:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843C1EFF02
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F412A3033889
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 13:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89A6423A8E;
	Tue,  3 Mar 2026 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXOwY/0l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF6347C6;
	Tue,  3 Mar 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543406; cv=none; b=PPcoXaFdSoJD/cavFo2LQrOVs244ktKtwAkI4N8vezPSitl29vQZwPqOHCGbyNTfStGZ32JtIwWvf56lSE0dKhYivMb4dTWOkw5g+CtKSVda7zUUfe4tN8ThGHCJZ178egjBbkKq+uoxExh0ZaNZ0ZBKQi5ER49jx0EiZAOv2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543406; c=relaxed/simple;
	bh=HUeuT9h9PdBSYE/DGwyF8wqKXoc/6Qk3eot9qc8dq1Q=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=LrGHrfK3mYF1AvfK16xpAE0j2cyyCBVAKsDi0hU7L8KJpSm7YkRGRz32IHzx38lUOCYpN9gB9aSqeYJWGiBHmRkEbkXfgAKM61HzoLFze0V0/HTF0yTqmIhberLsgssgUAy/UwOH+r1C1yyvQOXwMaDNPVXzd8POAjNdTrLD/fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXOwY/0l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55358C116C6;
	Tue,  3 Mar 2026 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772543405;
	bh=HUeuT9h9PdBSYE/DGwyF8wqKXoc/6Qk3eot9qc8dq1Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=mXOwY/0lplsiNBAMoUcSfq5Gwic6Za+XuOA1oLsfQdiFpSsLDlzGt1nefY+6wghA0
	 VLzRclPrmUqz+5UTEojQIBZR5pkNzIVEBrIwRYPzyrZlHmmIZLreMSCjQQ4O55K6rU
	 vPoeV6OLrkRS1+bVJBZty9hADMJKUSsS3HWkwun7LNwoavmW/L8Lhl21Msx0l6YioM
	 V2fnlfvRGB45l/9rfS+tQJ67oQkwcgghmwyRGQ5RT1vBrDqGvzTNUMf2Imw7xgYGTZ
	 IcWpRccSLY0JTfuwlir3UupYNA3SUZHb9tWuY7iozVab7TzcK7ND7cMR74CLuB0K1J
	 D+2LRd2meA+1w==
Message-ID: <ec1b4d750ae4d87d84d8a751400f468a@kernel.org>
Date: Tue, 03 Mar 2026 13:10:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
Subject: Re: [PATCH v2 1/6] dma-buf: dma-heap: Keep track of the heap device
 struct
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-1-65a4653b3378@redhat.com>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-1-65a4653b3378@redhat.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, echanude@redhat.com, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mripard@redhat.com, "Benjamin
 Gaignard" <benjamin.gaignard@collabora.com>, "Brian Starkey" <Brian.Starkey@arm.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "John
 Stultz" <john.stultz@linaro.org>, "John Stultz" <jstultz@google.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Maxime Ripard" <mripard@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Saravana
 Kannan" <saravanak@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>, "T.J.
 Mercier" <tjmercier@google.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 1843C1EFF02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54359-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, 3 Mar 2026 13:33:44 +0100, Albert Esteve wrote:
> From: John Stultz <john.stultz@linaro.org>
> 
> Keep track of the heap device struct.
> 
> This will be useful for special DMA allocations
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

