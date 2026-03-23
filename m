Return-Path: <linux-media+bounces-56755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKpVIGF6wWkQTQQAu9opvQ
	(envelope-from <linux-media+bounces-56755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 18:37:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B17F2FA170
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 18:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01E203337DE8
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C303BB9FB;
	Mon, 23 Mar 2026 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bHj+jVhd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFFA3B961F;
	Mon, 23 Mar 2026 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281787; cv=none; b=FneMOYHnT5D3r7i05QyLzSDs96PaAKeJi42m8311DgRsVieWtei5JqpLz2FrCwBr8LIYf/84rBv35jxCVmHUJdT4q8DPioTbnA3ZNsnqMjzg5BuVVVQv1G0emaD+1i2/+o24KxZ+vkk4lhqcjVQy9EDJnDPggUYxQhA85yV8+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281787; c=relaxed/simple;
	bh=xEt1T+5IaD2kByZSscV0lMn0HH53U/nhFkZ0bQ/2eZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1zW2rxz/4BYMHKJ1UvRgk0aQHAZiXFyazoWMQWfgOB55jPmUn4cT1Kkig5LupdpmKywLqvZo/g4mf1cXg9uv+dssgY49FOICJsvmKnaVvdxxIIKeKPj0Crcxr3IgRwO6Fwv+Gp/xEGDijBbnysHWfBjn6KJYngZkFxhnN2yE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bHj+jVhd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 993D719DF;
	Mon, 23 Mar 2026 17:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774281706;
	bh=xEt1T+5IaD2kByZSscV0lMn0HH53U/nhFkZ0bQ/2eZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHj+jVhdypJ3PdOJJ+vxoW4Mrt6GXypueUbe6MFnf3SYcKN2qAgR5D0p2h8OorLcC
	 8A+TznZMrbjxQQQkKxYzSnw6mgVOqb0bEFY3lzbwKaAfwl2JN+RW7P69Zu7lktQEOH
	 5T+yrqd9OUBjl6ZkEtx4Q6IxRwLbevYt/CayLbrI=
Date: Mon, 23 Mar 2026 17:03:00 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Message-ID: <acFkAPreOFBvoHid@zed>
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56755-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[fastmail.com,ideasonboard.com,kernel.org,sntech.de,chromium.org,samsung.com,xs4all.nl,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B17F2FA170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello

On Mon, Mar 03, 2025 at 02:40:08PM +0300, Mikhail Rudenko wrote:
> This small series adds support for non-coherent video capture buffers
> on Rockchip ISP V1. Patch 1 fixes cache management for dmabuf's
> allocated by dma-contig allocator. Patch 2 allows non-coherent
> allocations on the rkisp1 capture queue. Some timing measurements are
> provided in the commit message of patch 2.
>
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

I regularly get back to this series everytime I have to reason about
the caching policies in vb2..

Is there any reason why it didn't get in ?

> ---
> Changes in v4:
> - rebase to media/next
> - use `direction` instead of `buf->dma_dir` in dma_sync_sgtable_*
> - Link to v3: https://lore.kernel.org/r/20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com
>
> Changes in v3:
> - ignore skip_cache_sync_* flags in vb2_dc_dmabuf_ops_{begin,end}_cpu_access
> - invalidate/flush kernel mappings as appropriate if they exist
> - use dma_sync_sgtable_* instead of dma_sync_sg_*
> - Link to v2: https://lore.kernel.org/r/20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com
>
> Changes in v2:
> - Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
> - Add cache management timing information to patch 2 commit message.
> - Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com
>
> ---
> Mikhail Rudenko (2):
>       media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
>       media: rkisp1: Allow non-coherent video capture buffers
>
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-capture.c      |  1 +
>  2 files changed, 23 insertions(+)
> ---
> base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
> change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
>
> Best regards,
> --
> Mikhail Rudenko <mike.rudenko@gmail.com>
>
>

