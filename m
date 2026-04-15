Return-Path: <linux-media+bounces-58820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG6rDoui32miXAAAu9opvQ
	(envelope-from <linux-media+bounces-58820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:36:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8684055EA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A40B0308A584
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 14:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFB43D3D1E;
	Wed, 15 Apr 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CiU2a4Ll"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905E735DA40;
	Wed, 15 Apr 2026 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776263726; cv=none; b=qfmMpsX5M6IVWcc0ElqNOK6a2ZEuS4mGLBqvRNAqwzzLCRCkgwVFjOHaJgU1HkiWfGblxcdbbnd7z7K6AVGIESGzlg+4NK3f3dFXsSy86EilOM9Yoly63vFmX6KHUqSJFmRsSXzM0tkNuLxVD+TnIqH+DR53RyvyoEifkckK7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776263726; c=relaxed/simple;
	bh=WnKn70BAZ4sIf6ZszM++Jo6mlB40fmv2BMBcceSDkYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z++s0LbztiSphTPUD/WJq0szlb22wNQHoy8oiszUl5KtqqBK8GuJJh8XNgoJOC4v7DmffpzMXise3/8AxGivvu3gGJvuvhLqoHL80JyY1cxjvXjkE9GTFNF3lQE+pAgSaikLxPyDtqZceSK3jeSk2gcsoMoS/JfZOhyGTGE7Zlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CiU2a4Ll; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776263723;
	bh=WnKn70BAZ4sIf6ZszM++Jo6mlB40fmv2BMBcceSDkYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CiU2a4LlRImsM5l+nSEb0eApmWCoCHT3iaWM5v++oJlHVdZJ14Yq0iKPj+AAo8Ec1
	 z/WUs1E2sUwGuwt5MFKd6Hp6Wl7qHRLckSAKG6mNx+8q+1z616CD+WIyOY5+YPybAv
	 YcHRl5SZ26CkGGotAlJE9rVWhVnf8dFirqvbzp+bTB/bViqqVLCvW5sENkkrP/17Ge
	 uJ4bMQmmgUot7sTh2Dh+a7Zuly4E+TCX6OKPCHTvZUBNn5ZA9IDDDxZHO/N45m72yK
	 z0UoigsfQj08VU3mrRJDtrseTZd0ZNn6vjwfEo8a3wH1VVWFUr1gDwnwjZoJ6RcxEZ
	 dJ/JnSbRe6NYA==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BEE517E0610;
	Wed, 15 Apr 2026 16:35:23 +0200 (CEST)
Message-ID: <fd663d6d-2380-41f9-8d03-8f7740cbd6ce@collabora.com>
Date: Wed, 15 Apr 2026 16:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] media: verisilicon: Simplification and clean up
To: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 kernel@collabora.com
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58820-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,pengutronix.de,kernel.org,nxp.com,gmail.com,sntech.de,foss.st.com,sholland.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: 9C8684055EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Le 15/04/2026 à 16:04, Benjamin Gaignard a écrit :
> Simplify motion vectors and reference allocation with common helpers.
> Since it requires to move some of codecs specific functions and
> structure in codecs header files add a patch to finish the clean up.

I forgot to mention that this series depends on
https://patchwork.linuxtv.org/project/linux-media/patch/20260415073801.58369-1-benjamin.gaignard@collabora.com/

>
> Benjamin Gaignard (2):
>    media: verisilicon: Simplify motion vectors and rfc buffers allocation
>    media: verisilicon: Clean up messy include
>
>   drivers/media/platform/verisilicon/hantro.h   |  31 +-
>   .../media/platform/verisilicon/hantro_av1.c   |   7 -
>   .../media/platform/verisilicon/hantro_av1.h   | 100 +++-
>   .../platform/verisilicon/hantro_g1_h264_dec.c |   1 +
>   .../verisilicon/hantro_g1_mpeg2_dec.c         |   2 +-
>   .../platform/verisilicon/hantro_g1_vp8_dec.c  |   2 +-
>   .../media/platform/verisilicon/hantro_g2.c    |  36 --
>   .../platform/verisilicon/hantro_g2_hevc_dec.c |  26 +-
>   .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
>   .../media/platform/verisilicon/hantro_h264.c  |   2 +-
>   .../media/platform/verisilicon/hantro_h264.h  |  98 ++++
>   .../media/platform/verisilicon/hantro_hevc.c  |  37 +-
>   .../media/platform/verisilicon/hantro_hevc.h  |  82 ++++
>   .../media/platform/verisilicon/hantro_hw.h    | 446 +-----------------
>   .../media/platform/verisilicon/hantro_mpeg2.c |   1 +
>   .../media/platform/verisilicon/hantro_mpeg2.h |  27 ++
>   .../platform/verisilicon/hantro_postproc.c    |  29 +-
>   .../media/platform/verisilicon/hantro_v4l2.c  | 262 +++++++++-
>   .../media/platform/verisilicon/hantro_vp8.c   |   1 +
>   .../media/platform/verisilicon/hantro_vp8.h   |  29 ++
>   .../media/platform/verisilicon/hantro_vp9.h   | 104 ++++
>   .../media/platform/verisilicon/imx8m_vpu_hw.c |   5 +
>   .../verisilicon/rockchip_vpu2_hw_h264_dec.c   |   2 +-
>   .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c  |   2 +-
>   .../verisilicon/rockchip_vpu2_hw_vp8_dec.c    |   2 +-
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
>   .../platform/verisilicon/rockchip_vpu_hw.c    |   3 +
>   .../platform/verisilicon/stm32mp25_vpu_hw.c   |   2 +
>   .../media/platform/verisilicon/sunxi_vpu_hw.c |   1 +
>   29 files changed, 796 insertions(+), 572 deletions(-)
>   create mode 100644 drivers/media/platform/verisilicon/hantro_h264.h
>   create mode 100644 drivers/media/platform/verisilicon/hantro_hevc.h
>   create mode 100644 drivers/media/platform/verisilicon/hantro_mpeg2.h
>   create mode 100644 drivers/media/platform/verisilicon/hantro_vp8.h
>

