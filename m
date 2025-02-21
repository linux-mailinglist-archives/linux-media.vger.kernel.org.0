Return-Path: <linux-media+bounces-26592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67824A3F9CC
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3612E16F767
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513961F1934;
	Fri, 21 Feb 2025 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LGll4wxM"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9D11DB958;
	Fri, 21 Feb 2025 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153209; cv=none; b=iwlKdS9ux5GS3pgPoJMM+aMFXwtpyP8wE8Y9lbbWTWnKMfBiw5UrVb8iyqFwsPtGDlL/xGvsQvc//eEWKReMonBxmC+b/zr+OzG4mdsWKCmea97l1mrVwW94PccxkrcTy9eKKhWV0N/WNdUDHURcV67t5ecQOip/Hyn+NwruFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153209; c=relaxed/simple;
	bh=DRRk8ySHM7d80jUzaigsI9T4dZ5O56rDrKF/hwqGjjE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P/28Z7BooAM+b/RC51rIOAVBPPGugYt9DND0Zis4Z1WBTvT0ll++pRmwa6NXcgf7QmhtorIEMcW28hOAPQfhGw/4kjIvVuG0RzJgmh39U/Cm6v6DaA2ITCoXylXpid86Tr431x9PRaGKzYfswEOagl2hnQtTQDebXYN76iFIojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LGll4wxM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740153200;
	bh=DRRk8ySHM7d80jUzaigsI9T4dZ5O56rDrKF/hwqGjjE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LGll4wxMdtC9VuU1cqAJl3FPPep48bfwtMgKC4WgcM/G8HMuayRO29U0ZUSgfakeq
	 tBq1E4kJN6BHNSfXtNb6p1qo7xGOi0P5Xm02uplDWaE7YJtYoKI4NJtea35tD54mcE
	 EQh2uwfFMkJzmfvwlfUKsPkAlf5epvS3tFqakLDOCamE6Sdlq9rP37BFbCfKYyrvp/
	 fzQyeBkIvQ7724xVu1CEFsY6H0qyIzQ/RksSUeN9WLwDf5UaDOhynR0AnCpviJISut
	 uHgqKDSgMMJGaYK64TAfB6Y0mYvYLizMcimTLF8DiQzRgNjr/l3w9GOTH644nscv57
	 R3kv+iVFRl6sg==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1DE1217E0199;
	Fri, 21 Feb 2025 16:53:19 +0100 (CET)
Message-ID: <cd8f43a310f771f7db7ae1ab7fb2f8b5d554c2da.camel@collabora.com>
Subject: Re: [PATCH 0/2] Add support for MT8196 video encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, Yunfei Dong
 <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Longfei Wang <longfei.wang@mediatek.com>
Date: Fri, 21 Feb 2025 10:53:17 -0500
In-Reply-To: <20250221031004.9050-1-irui.wang@mediatek.com>
References: <20250221031004.9050-1-irui.wang@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le vendredi 21 février 2025 à 11:10 +0800, Irui Wang a écrit :
> This patch series adds support for MT8196 video encoder. The changes
> include introducing a new encoder driver interface and add support
> for the
> new encoder driver encoding process.

thanks for your contribution. In general, when adding new HW support,
we would like to see in your cover letter your v4l2-compliance report. 

Since this is a firmware based encoder, we also want to know how the
process with uploading your firmware in linux-firmware is going. We can
do reviews ahead of this of course, but merging depends on having
firmware upstream. We did some favours in the past and it worked for
many SoC, but things seems to have changed lately with the MT8188
firmware situation. Hope you understand this concern.

regards,
Nicolas

> 
> Irui Wang (2):
>   media: mediatek: encoder: Add a new encoder driver interface
>   media: mediatek: encoder: Add support for common driver encode
> process
> 
>  .../platform/mediatek/vcodec/encoder/Makefile |   1 +
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   2 +
>  .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   3 +
>  .../vcodec/encoder/venc/venc_common_if.c      | 704
> ++++++++++++++++++
>  .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
>  .../mediatek/vcodec/encoder/venc_drv_if.h     |   3 +
>  .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
>  .../mediatek/vcodec/encoder/venc_vpu_if.c     |  37 +-
>  8 files changed, 764 insertions(+), 15 deletions(-)
>  create mode 100644
> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
> 

