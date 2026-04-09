Return-Path: <linux-media+bounces-58324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJwnHNyd12kUQQgAu9opvQ
	(envelope-from <linux-media+bounces-58324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 14:38:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F05163CA837
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 14:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21BCE3029E74
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 12:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CAF3CBE7B;
	Thu,  9 Apr 2026 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2IAl2WF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C963BE652
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738292; cv=none; b=qtK+W3fTRpEY978ErPK0JuRkrCsaN+dmWW18BskVCy17mylVy8/IwCMvKzMlTEHimAog0hLRBIpH2yH7YtDVA4QzaWFaTvq+YLzpnzmiW5h+YJa29ptQGLIZ6tHocx7I4x5NMqbd3kdTh6u8cR1zyUXHlNArvvY1PzAUj38i6xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738292; c=relaxed/simple;
	bh=d1+Vn1+nmxQUEpEEZem6yPloSUx3IAA5s3+3Sci+Ir0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lh1WcakNLnLHK3qerzFt9639KTN9jE+6th4hY5eFE2Zw9Lw3Fswz0QSRMRUpDWhoXDXUG7PjdPno6sZX3rSNquiLo/7UK+pv5AQfoqd/feaJfanPIAogzpWEP6RKMAgOWCNu7OgIoEufbzfrnODEWyMwI9oic92VmQmbT8gZ6t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2IAl2WF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931EFC19424;
	Thu,  9 Apr 2026 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775738292;
	bh=d1+Vn1+nmxQUEpEEZem6yPloSUx3IAA5s3+3Sci+Ir0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2IAl2WFlmirhF6vkuPjE6CbkOOQke4RMNkNasosllkTXMB0eoDY8D6cOPPPKsWPK
	 AlIDQ+RyMTqhs61avp173c3TxXaIQw4KEsnIs0qR+vbKe2zLOWWdhOd+3vjRbL1cXc
	 WKAT2RYWanJA6tX6O7yjwINYgQDeE42lfWvnrItEV3Pl2JCq9Z6quKO0RacCoDhanK
	 JRZQOtpaT4Icsk3goBrvmhsuJCKPiPpLO4qMMbIkgtVqkncIlemTDiEBFg5Cg4koWr
	 WctFfznlq21DLOPmSmFsTvJ+iNK6XMaJhu343AZCN3jKr12yPD4ZSliNVG3Njwoc9N
	 eskYmSGFg+x/A==
Date: Thu, 9 Apr 2026 14:38:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc: janusz.krzysztofik@intel.com, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, gaoxiang17@xiaomi.com, 
	sumit.semwal@linaro.org
Subject: Re: [PATCH] dma-buf: fix order of trace and fput
Message-ID: <adedTCplYHeJPVKP@zenone.zhora.eu>
References: <20260408122437.1364-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408122437.1364-1-christian.koenig@amd.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58324-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F05163CA837
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christian,

> @@ -845,9 +845,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
>  	if (WARN_ON(!dmabuf || !dmabuf->file))
>  		return;
>  
> -	fput(dmabuf->file);
> -
>  	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
> +	fput(dmabuf->file);

funny, I just found out I sent the exact same patch, just few
minutes later :-) [*]

Andi

>  }

[*] https://lore.kernel.org/all/20260408123916.2604101-2-andi.shyti@kernel.org/

