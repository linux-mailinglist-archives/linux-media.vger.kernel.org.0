Return-Path: <linux-media+bounces-4547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 487298453E0
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 10:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5171C26D9E
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 09:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E686215B102;
	Thu,  1 Feb 2024 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z+dLlSxE"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A515B0F5
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706779824; cv=none; b=cj6EKT9qj5AVSHieQWkFdSGoYDrccWASK3EMCEyPcriq4wXC8lgoTFB61FKOG4qvPdgvg2mhD8LW05/CjFInHz2SAehFiHofnY15e6lDr8dCPLJyhwjs6Tv3UVrkCoe3wyAU8wSDq+7m3tN+/i2OJHQLbz+4f3jF68iNohJIgf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706779824; c=relaxed/simple;
	bh=VrXv2gS2TyXBZc341RcN2m4mda7mjs02xNbkXTnrdd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnemFclcHEZqTH3WfCEN8nWf8z9iYJ7aGRYrDFnMx8ZD1V1mPh6094PBLXLRQvkdxj09wcAkwwYLQOeNs6vI6SqiflAmrGLMTowg3ubJ3vInhA3B5kqVz45QNNXr7ml/YdCGfzIzTCZGNlPviw2m59KPGytbrH9Rqmg1XMmOPEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z+dLlSxE; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706779820;
	bh=VrXv2gS2TyXBZc341RcN2m4mda7mjs02xNbkXTnrdd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+dLlSxEL4PyufxCq2og5JWI/LDva+XETCyF71DrexnLG4gv/qVde+xlrbXekbkjd
	 yqLWYNrroo++MHy/nrzruAu2iqRk/SK+9kweHKZLaesEOuTZyOXDiBVCxYURBr6H+Z
	 JO+CTtsHHMZQHff51YRMlK4ESBB2BaQwiEPVg/MSZN8ZZRu0k7pWD2l2qKYzpaJMxV
	 sJrc75tmduSm+2rMvX9bWGTJtiv7qxmtUiKWwjZkvQCv146ov5dIjz1tdaPe1xOaC6
	 zNeeLexXoxfU8reOnL0yRa5/LHh9+8KvNvnT+6dP53u5dmi87M8sFshb4f0c/deAJS
	 16vaDWkfp3BVw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A8BD63782081;
	Thu,  1 Feb 2024 09:30:20 +0000 (UTC)
Date: Thu, 1 Feb 2024 10:30:19 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.9] MDP3 on MT8195 support
Message-ID: <20240201093019.hdtjgkca4rvfobuh@basti-XPS-13-9310>
References: <20240127124708.equgiz7tsu4mlx4v@basti-XPS-13-9310>
 <20240201073200.42911bd2@coco.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240201073200.42911bd2@coco.lan>

Hey Mauro,

On 01.02.2024 07:32, Mauro Carvalho Chehab wrote:
>Em Sat, 27 Jan 2024 13:47:08 +0100
>Sebastian Fricke <sebastian.fricke@collabora.com> escreveu:
>
>> Hey Mauro & Hans,
>>
>> this set of patches has been delayed because it was originally submitted
>> on top of linux-next and had dependencies that were not found on the
>> media tree, now that these dependencies have been merged I can post the
>> pull request.
>> This patch set adds support for MDP3 on the Mediatek platform MT8195.
>>
>> Please pull.
>>
>> The following changes since commit 04447d48afd365a837e23cde631517f166045b9d:
>>
>>    media: mediatek: vcodec: drop excess struct members descriptions (2024-01-24 11:38:34 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9.0-mdp3-signed
>
>Hmm... it seems you're not using "git request-pull". This time, I'll handle the PR,
>but please use "git request-pull" instead of manually formatting a message that
>resembles it. My import scripts are very picky, as it validates the message,
>rejecting manually-formatted pull requests.

I have used git request-pull for this, here is the command, I still had it in my history:
`git request-pull 04447d48afd365a837e23cde631517f166045b9d https://gitlab.collabora.com/sebastianfricke/linux.git for-6.9.0-mdp3-signed`

>
>Regards,
>Mauro

Greetings,
Sebastian
>
>>
>> for you to fetch changes up to dda00d8a598d9afa7d6da2e924467fbf543cabb7:
>>
>>    media: platform: mtk-mdp3: add support for parallel pipe to improve FPS (2024-01-27 13:24:51 +0100)
>>
>> ----------------------------------------------------------------
>> add support MDP3 on MT8195 platform
>>
>> ----------------------------------------------------------------
>> Moudy Ho (12):
>>        media: platform: mtk-mdp3: add support second sets of MMSYS
>>        media: platform: mtk-mdp3: add support second sets of MUTEX
>>        media: platform: mtk-mdp3: introduce more pipelines from MT8195
>>        media: platform: mtk-mdp3: introduce more MDP3 components
>>        media: platform: mtk-mdp3: add checks for dummy components
>>        media: platform: mtk-mdp3: avoid multiple driver registrations
>>        media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
>>        media: platform: mtk-mdp3: add support for blending multiple components
>>        media: platform: mtk-mdp3: add mt8195 platform configuration
>>        media: platform: mtk-mdp3: add mt8195 shared memory configurations
>>        media: platform: mtk-mdp3: add mt8195 MDP3 component settings
>>        media: platform: mtk-mdp3: add support for parallel pipe to improve FPS
>>
>>   drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c  | 729 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h   |  25 +++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_color.h |  31 ++++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h    |  23 ++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h   |  31 ++++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h |  25 +++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h   |  25 +++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h   |  21 ++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h  |  24 ++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h   |   2 +
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h |  34 ++++++
>>   drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h  |   8 ++
>>   drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h | 283 ++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h   |   4 +
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h  |   2 +
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 440 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h |   1 +
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 895 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h |  93 +++++++++++++---
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 142 +++++++++++++++++++-----
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h |  50 ++++++++-
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c  |  15 +++
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c |  18 +++
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h |   1 +
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  |   3 +-
>>   25 files changed, 2747 insertions(+), 178 deletions(-)
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
>>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
>>
>
>
>
>Thanks,
>Mauro

