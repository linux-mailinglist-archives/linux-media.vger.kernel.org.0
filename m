Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505D7382E11
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 15:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235967AbhEQN6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 09:58:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:43970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232924AbhEQN6j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 09:58:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FB87611ED;
        Mon, 17 May 2021 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621259842;
        bh=oRn2k+vSlFwDIc2QK+eBvBWMy+OIb7F6v4LHbmff01g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qn7AULGWBb73/eXHX5d2RCHKXF54apLvJ96NMmBw6EcLw9Azs5CpT6xHe/uaP+Lue
         wjNRHo8qveWltYhJBUckLsu0eOMFtPoWEMGQ7fQA+hfw9GryUT9vqqfFxKWsyUC8+Y
         UbM/2bBnbKD/tASIQqTVuzwUMaHhygcaTECIUXItMS85vRXUrHzMH2PRqyguBenM5G
         gjZe8OMBu4aZs2fuS0sapHbP8OcYG1+L+M2poYJ/60QVqOowpPN9kvPEXyGlJiHHiD
         o5HjUBIocmZgtfKPo1+5Ju5jEggxc9CZTeSmMOy0RMzTdrDAXufQCMMSGW5SvA5NgR
         p8LNm+XLpEqtQ==
Date:   Mon, 17 May 2021 15:57:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>
Subject: Re: [GIT PULL FOR v5.14] More Outreachy cleanups (v2)
Message-ID: <20210517155718.196a6089@coco.lan>
In-Reply-To: <706ba93e-fa1c-34ce-8c54-d8a1c442811e@xs4all.nl>
References: <706ba93e-fa1c-34ce-8c54-d8a1c442811e@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 30 Apr 2021 12:11:22 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> This supersedes an earlier PR. This v2 adds more patches from Martiros and
> Deepak.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 6756ae29420f849de4dc5c41f9fe948450b09285:
> 
>   media: staging: media: atomisp: pci: Format comments according to coding-style in file atomisp_cmd.h (2021-04-21 14:07:01 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14-out1
> 
> for you to fetch changes up to 68dc2d762b637dd980f8dcc9e762da8cb788b57e:
> 
>   staging: media: atomisp: remove unwanted dev_*() calls (2021-04-30 11:49:40 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Aline Santana Cordeiro (5):
>       staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_cmd.c
>       staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_compat_css20.c
>       staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_subdev.c
>       staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_v4l2.c
>       staging: media: tegra-video: Align line break to match with the open parenthesis in file vi.c
> 
> Deepak R Varma (8):
>       staging: media: atomisp: balance braces around if...else block
>       staging: media: atomisp: remove unnecessary braces
>       staging: media: atomisp: use __func__ over function names
>       staging: media: atomisp: reformat code comment blocks
>       staging: media: atomisp: fix CamelCase variable naming
>       staging: media: atomisp: replace raw pr_*() by dev_dbg()
>       staging: media: atomisp: remove unnecessary pr_info calls
>       staging: media: atomisp: remove unwanted dev_*() calls
> 
> Martiros Shakhzadyan (9):
>       staging: media: atomisp: Fix sh_css.c brace coding style issues
>       staging: media: atomisp: Remove redundant assertions in sh_css.c
>       staging: media: atomisp: Fix the rest of sh_css.c brace issues
>       staging: media: atomisp: Remove all redundant assertions in sh_css.c
>       staging: media: atomisp: Remove a superfluous else clause in sh_css.c
>       staging: media: atomisp: Replace if else clause with a ternary
>       staging: media: atomisp: Fix alignment and line length issues
>       staging: media: atomisp: Refactor ia_css_stream_load()
>       staging: media: atomisp: Fix line split style issues

I ended not applying two patches from this series:

- staging: media: atomisp: use __func__ over function names

Dan requested some changes on it, as it has several dev_dbg() calls
used just for tracing. I sent a reply with a few additional issues;

- staging: media: atomisp: remove unwanted dev_*() calls

This one didn't apply. Is it touching the same lines the first patch
changed? If so, please merge both into a single one, after applying
the fixes I mentioned on my e-mail:

	https://lore.kernel.org/linux-media/20210517154448.7bb8be17@coco.lan/T/#ma9ded10c22aaa86de74babf1bd2a2320c3dac70b
	
The remaining ones were applied.

Thanks!
Mauro
