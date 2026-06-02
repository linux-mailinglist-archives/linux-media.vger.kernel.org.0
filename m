Return-Path: <linux-media+bounces-63360-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP/kENOvHmr7JAAAu9opvQ
	(envelope-from <linux-media+bounces-63360-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 12:26:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA762C847
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 12:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27C873045D21
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 10:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F8F3D75A2;
	Tue,  2 Jun 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UUVbMuGv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1E93D349A;
	Tue,  2 Jun 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395516; cv=none; b=icJAGs7RYjd+zMF7MmIH3OiNZF/WSszYlKV2kKfoTmEp+Xp8shEoCe20HP6x4z9x2XWFuOz5heVtOCGqXOOI4+96DErgSTWZBZ7XR7eRT16EPl3TafJbxg/zhju8KGk1HUlakujT67EVM+4t+LDCWE6CfWQPaIFXGVI+vtIQH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395516; c=relaxed/simple;
	bh=0CwGFvg6msXZHsPhvYki0SBF0WQtGa73wA83lE4DqsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl7DUPyDjzq9g5T5U0Wsq2RYSKYGzKHguXbNONI6iSE/Y0W8Y8GztvaLlzA8U8nLzS7Cis84bLFjEmLFHJwK9QcbvFkMP25ka2l6ECGUWS12gctTlVvTqALBMfG7HotN4pYqHh6mk5O4BjyAsmL8L9zBf0lsMaRO4Zqbmgo5FWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UUVbMuGv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48307802;
	Tue,  2 Jun 2026 12:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780395483;
	bh=0CwGFvg6msXZHsPhvYki0SBF0WQtGa73wA83lE4DqsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UUVbMuGv5ok3OC/BscovpMISUUR/RwkgrZx4eJmeOtddPzKNeJvgO9jmk5gsr9v2u
	 3q4vlH4RKtudjte204arqRNXDz9fyl/P6BzgwolQyBpBMFtXVzuP2qJumCLUKxl3cZ
	 gnWMgmom656pJZoM33ARQp0EpQMVWMxtsBwwNUco=
Date: Tue, 2 Jun 2026 12:18:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David CARLIER <devnexen@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: mali-c55: fix integer overflow in scaler
 factor calculation
Message-ID: <ah6seVCMzk0JODrf@zed>
References: <20260529024429.6942-1-devnexen@gmail.com>
 <20260529050649.14109-1-devnexen@gmail.com>
 <ahqh3Zv8xXNENzHb@zed>
 <CA+XhMqyhpn0kHgz=i9WUS+1rFN4kWW3DpUYubBN1k-qcKo+RpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+XhMqyhpn0kHgz=i9WUS+1rFN4kWW3DpUYubBN1k-qcKo+RpQ@mail.gmail.com>
X-Rspamd-Queue-Id: ECBA762C847
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63360-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi David

On Sat, May 30, 2026 at 11:02:40AM +0100, David CARLIER wrote:
> Hi Jacopo,
>
>   On Sat, May 30, 2026 at 10:55:59AM +0200, Jacopo Mondi wrote:
>   > Have you hit this issue ?
>
>   Not on hardware, I found it by code analysis. The sink format is clamped to
>   8192 and crop is clamped against the sink, so crop->width can reach
>   4096+, where (crop << 20) overflows 32 bits before landing in the u64.
>   I don't have a >=4096 source to reproduce on, but it's provable from the
>   operand widths and the clamp. UHD (3840) is just under; 4096 gives a
>   zero increment, wider values a garbage one.
>
>   > Could we maybe first do the crop/scale division and then do the Q4.20
>   > conversion ? We could maybe save the below do_div() [...]
>
>   I don't think we can - dividing first loses the fraction the Q4.20
>   factor is there to keep. E.g. crop=4096, scale=1920:
>
>     correct:      4096 * 2^20 / 1920 = 2236962  (~2.133)
>     divide-first: (4096 / 1920) << 20 = 2097152  (2.0)   -> ~6.7% off
>
>   So the multiply has to come first, and that pushes the numerator up to
>   8192 * 2^20 = 2^33, which needs a 64-bit divide either way. BIT_ULL()
>   just does the existing multiply in 64-bit. Happy to switch do_div() to
>   div_u64() if you prefer, but that's orthogonal.

Oh yes you're right, I think using ULL is certainly better.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j



>
> Cheers !

