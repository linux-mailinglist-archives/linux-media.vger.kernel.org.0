Return-Path: <linux-media+bounces-4540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA518845168
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 07:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 177EEB284D4
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 06:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB5314079D;
	Thu,  1 Feb 2024 06:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZxuDrDw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F99140784
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 06:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706769133; cv=none; b=eu8e7depJddnnZwK0IXfeBSYzolQFEDMnWmNBCspgg4b5NRrQ1p6TLAgvY89RwvM3eVS9WG1ARY+UDD5/Q/K5gbJYmDY9ruGrE0ygo0eVLaektiM5hOLG9IjG3cZrDHY7KjMuYZlIkZrOVYo+wn3PUNS+XToa1/a3gMBKKZCECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706769133; c=relaxed/simple;
	bh=Z4mWkDvMQHWRfAfTfmn2g5hCjAEJTi5GH2M9g06KvYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cnFSNtaoUlyHNTok/fD8dKlmBeoT+SRiJMrkzSLu+uhPZ3IyjoEWeeGl2v7OQtusr5ej+FUYxqv5ujGSh0Wdt22MUWVQIxezUm7SFxExX4z/A/LhnvcZOYSK4rUFbOu9TPkDHdlu29fDW79Bw6VkHQ7dE5nNQZjC9Nr7A5QO9qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZxuDrDw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603AAC433C7;
	Thu,  1 Feb 2024 06:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706769133;
	bh=Z4mWkDvMQHWRfAfTfmn2g5hCjAEJTi5GH2M9g06KvYI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dZxuDrDw+PN8f6GBOH2Rp09yjLzaT5YEAEnKOZL1Y/BHR+CzwyDidr9yuBHXjNIKB
	 7Ob+CtVjBCM0zhcNDy8oYxjdzA1TQuooBTt4c68uh/qQ+cfNZMrl+WlDc0F251GmwW
	 DvHUnFR8kvuxhsGV1uvuECQ9sNlqNu92jZBgIJEwQq2n9seJ1VDrxj+gj7dIEGc4z8
	 IKmU2bsm6dFd2D0yLzwD3bzpaNgl1viFFgZwUnhODYPZCqc9UqoJq4yMUb+oZyIfMc
	 3K5UaPzplZ2PACm4ToTyAu2xa5WnDUJ3TeYnymlDVuIl4B7vyaNEQVG/naDIGnBJcE
	 U4JMF46B6dcMA==
Date: Thu, 1 Feb 2024 07:32:09 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.9] MDP3 on MT8195 support
Message-ID: <20240201073200.42911bd2@coco.lan>
In-Reply-To: <20240127124708.equgiz7tsu4mlx4v@basti-XPS-13-9310>
References: <20240127124708.equgiz7tsu4mlx4v@basti-XPS-13-9310>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 27 Jan 2024 13:47:08 +0100
Sebastian Fricke <sebastian.fricke@collabora.com> escreveu:

> Hey Mauro & Hans,
> 
> this set of patches has been delayed because it was originally submitted
> on top of linux-next and had dependencies that were not found on the
> media tree, now that these dependencies have been merged I can post the
> pull request.
> This patch set adds support for MDP3 on the Mediatek platform MT8195.
> 
> Please pull.
> 
> The following changes since commit 04447d48afd365a837e23cde631517f166045b9d:
> 
>    media: mediatek: vcodec: drop excess struct members descriptions (2024-01-24 11:38:34 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9.0-mdp3-signed

Hmm... it seems you're not using "git request-pull". This time, I'll handle the PR,
but please use "git request-pull" instead of manually formatting a message that
resembles it. My import scripts are very picky, as it validates the message,
rejecting manually-formatted pull requests.

Regards,
Mauro

> 
> for you to fetch changes up to dda00d8a598d9afa7d6da2e924467fbf543cabb7:
> 
>    media: platform: mtk-mdp3: add support for parallel pipe to improve FPS (2024-01-27 13:24:51 +0100)
> 
> ----------------------------------------------------------------
> add support MDP3 on MT8195 platform
> 
> ----------------------------------------------------------------
> Moudy Ho (12):
>        media: platform: mtk-mdp3: add support second sets of MMSYS
>        media: platform: mtk-mdp3: add support second sets of MUTEX
>        media: platform: mtk-mdp3: introduce more pipelines from MT8195
>        media: platform: mtk-mdp3: introduce more MDP3 components
>        media: platform: mtk-mdp3: add checks for dummy components
>        media: platform: mtk-mdp3: avoid multiple driver registrations
>        media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
>        media: platform: mtk-mdp3: add support for blending multiple components
>        media: platform: mtk-mdp3: add mt8195 platform configuration
>        media: platform: mtk-mdp3: add mt8195 shared memory configurations
>        media: platform: mtk-mdp3: add mt8195 MDP3 component settings
>        media: platform: mtk-mdp3: add support for parallel pipe to improve FPS
> 
>   drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c  | 729 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>   drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h   |  25 +++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_color.h |  31 ++++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h    |  23 ++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h   |  31 ++++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h |  25 +++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h   |  25 +++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h   |  21 ++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h  |  24 ++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h   |   2 +
>   drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h |  34 ++++++
>   drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h  |   8 ++
>   drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h | 283 ++++++++++++++++++++++++++++++++++++++++++++++
>   drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h   |   4 +
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h  |   2 +
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 440 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h |   1 +
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 895 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h |  93 +++++++++++++---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 142 +++++++++++++++++++-----
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h |  50 ++++++++-
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c  |  15 +++
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c |  18 +++
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h |   1 +
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  |   3 +-
>   25 files changed, 2747 insertions(+), 178 deletions(-)
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
> 



Thanks,
Mauro

