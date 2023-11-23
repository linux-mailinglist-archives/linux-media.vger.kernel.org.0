Return-Path: <linux-media+bounces-881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D507F5BD8
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 11:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 689F5B21020
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D5B224C3;
	Thu, 23 Nov 2023 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPLGGEjj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011B722321
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 10:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F66C433C8;
	Thu, 23 Nov 2023 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700733762;
	bh=y0/RuGlu1dBnZG0L6M7MzEDKRGcwT7c03g5OYivpzZ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cPLGGEjjbybZR9LRzCXeCCZ8FUiPo5UDE8loJwV/f/SGrGQNIlD8yWGS5q2X4GJN/
	 pk0M2tQyIWd78a0EAqbnaweNy+VShOWNnwRNlvUBwpy7MSjZhMTtyQraNCBU/cIJp0
	 Qw+4KHIW80fBl4kTDNugfAjv4XLO8yyaarx5S4+5vVbGiI0lWGt+bp+WJziRbTKesC
	 mtLV7jqJeEhZ4MHHZRzbmzAYhEO6OU6f6TqYfAYkcy1hOGzLCvaxHYIu4hPVChc9p+
	 tpIDTcYjrEWCyxydjx60tjxz2SUothlGgy61anC/6Y6spD3P8AqwjiFu/ywyBQeSvf
	 pqUhwr5r/JldA==
Date: Thu, 23 Nov 2023 11:02:38 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.7] Mediatek Vcodec: Codec profile and level
 setting
Message-ID: <20231123110230.7c7a9d8e@coco.lan>
In-Reply-To: <20231027085058.k65rwgxepmx5ivu5@basti-XPS-13-9310>
References: <20231027085058.k65rwgxepmx5ivu5@basti-XPS-13-9310>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 27 Oct 2023 10:50:58 +0200
Sebastian Fricke <sebastian.fricke@collabora.com> escreveu:

> Hey Mauro and Hans,
> 
> first attempt at doing a PR, could you please check and pull this?
> 
> The following changes since commit 19e67e01eb1e84f3529770d084b93f16a4894c42:
> 
>    media: venus: Fix firmware path for resources (2023-10-23 12:24:53 +0200)
> 
> are available in the Git repository at:
> 
>    https://gitlab.collabora.com/sebastianfricke/linux tags/for-6.7-signed
> 
> for you to fetch changes up to ccd08a80f5e1844819874b01c5ff61e18aa9e133:
> 
>    media: mediatek: vcodec: Set the supported vp9 profile for each platform (2023-10-26 09:09:21 +0200)


Checkpatch is producing some warnings here:

WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#32: 
The following changes since commit 19e67e01eb1e84f3529770d084b93f16a4894c42:

ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 19e67e01eb1e ("media: venus: Fix firmware path for resources")'
#32: 
The following changes since commit 19e67e01eb1e84f3529770d084b93f16a4894c42:

ERROR:NOT_UNIFIED_DIFF: Does not appear to be a unified-diff format patch

Could you please double-check those?

Regards,
Mauro

> 
> ----------------------------------------------------------------
> Mediatek Codec patches for 6.7
> 
> ----------------------------------------------------------------
> Yunfei Dong (7):
>        media: mediatek: vcodec: Get the chip name for each platform
>        media: mediatek: vcodec: Set the supported h264 level for each platform
>        media: mediatek: vcodec: Set the supported h265 level for each platform
>        media: mediatek: vcodec: Set the supported h264 profile for each platform
>        media: mediatek: vcodec: Set the supported h265 profile for each platform
>        media: mediatek: vcodec: Set the supported vp9 level for each platform
>        media: mediatek: vcodec: Set the supported vp9 profile for each platform
> 
>   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c           |  24 +-----------------
>   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c       |  26 ++++++++++++++++++++
>   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h       |  14 +++++++++++
>   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 168 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>   4 files changed, 208 insertions(+), 24 deletions(-)
> 
> Greetings,
> Sebastian



Thanks,
Mauro

