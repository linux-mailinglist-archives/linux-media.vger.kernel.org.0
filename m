Return-Path: <linux-media+bounces-55794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGcxJoaYtGnMqwAAu9opvQ
	(envelope-from <linux-media+bounces-55794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 00:06:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7BE28A962
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 00:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 626CE316A26B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 23:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACBA3E3C4B;
	Fri, 13 Mar 2026 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jt2I9UnZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D534C815;
	Fri, 13 Mar 2026 23:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773443191; cv=none; b=OvPgchGnjuzW37tKyfgDuSpv+OYbNNEkpjJCeToCImBcyMT5swStn5xaafLlKS1787FYO+pjTJQ+AJPQv5rdT7BaMt/0uMGahKmO8pjODquWxIB4NZ2/4B2itsvmKUfxN5Z5hc4BQqojqBBFFRw7t9sgvbMzMD3UZ6TwQL4TVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773443191; c=relaxed/simple;
	bh=yFVSBh4WIS/NwxjvqQ8QJjFjOyTSxSn7QLtwu40ICpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEEXh6HLzOYYEs6DEHx7FlczvxZqTwtcAw4hSg2F/xNh+/0z0Y2Qn0Zn1CUUE82Fk37JpWnOshoHZds2isVA6J+MLCnmE+mO4OshVHT5JRo60Cz7/leE7lYWkI3sJWSduWbQc37/cLzj7HQPKCp6HB/YANl3MC0DLXkmXmmgpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jt2I9UnZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1AAC19421;
	Fri, 13 Mar 2026 23:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773443191;
	bh=yFVSBh4WIS/NwxjvqQ8QJjFjOyTSxSn7QLtwu40ICpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jt2I9UnZ2kDKSz/mk7fs/bJcvr7jO5ba3GhlsVjWsZKxKnz+Mi5/wklcExgENbE0w
	 hPsMhYavxA4/Ii3mKP8MxniNHhQx5gBjDs3C2TLn61IuVVhJwW5sAH3qjrGKXao+M5
	 KVlpVwH9xej7Bczoui+2oyTP8pLjAoAHmohs9xSiZQFf4qtSaeleG65oJ9dBaNMG2r
	 w0P3Vvwc99eHe//v5RRFJP1t6Oxwo7YfHhVRjCwg3/sbqN7eg6WnOmaUA3lzASbaaQ
	 wKMC3VLWgyT2l5v95CGEo6Jf+yK1w2fJtEGgVP80Toc/pboqWhkx9R+MBovmhfyGL6
	 NVi4he/PVvSQQ==
Date: Fri, 13 Mar 2026 18:06:29 -0500
From: Rob Herring <robh@kernel.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	mripard@redhat.com, echanude@redhat.com
Subject: Re: [PATCH v3 3/6] of_reserved_mem: add a helper for rmem
 device_init op
Message-ID: <20260313230629.GA3603067-robh@kernel.org>
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
 <20260306-b4-dmabuf-heap-coherent-rmem-v3-3-3d00d36c9bc4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-b4-dmabuf-heap-coherent-rmem-v3-3-3d00d36c9bc4@redhat.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55794-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B7BE28A962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 06, 2026 at 11:36:34AM +0100, Albert Esteve wrote:
> Add a helper function wrapping internal reserved memory
> device_init call and expose it externally.

Why?

The diff tells us what. The commit msg needs to tell us why. Maybe the 
rest of the series explains it, but this commit needs to stand on its 
own.

> 
> Use the new helper function within of_reserved_mem_device_init_by_idx().
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

Version history?

>  drivers/of/of_reserved_mem.c    | 68 ++++++++++++++++++++++++++---------------
>  include/linux/of_reserved_mem.h |  8 +++++
>  2 files changed, 52 insertions(+), 24 deletions(-)

