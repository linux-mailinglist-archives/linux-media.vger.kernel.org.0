Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CB42A8126
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 15:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbgKEOnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 09:43:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:48666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728371AbgKEOnq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 09:43:46 -0500
Received: from coco.lan (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCF752087D;
        Thu,  5 Nov 2020 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604587425;
        bh=9jHyAJeI97dYg973dhS1qPwB7y51UdLoBAEwV8/7I80=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G69/twvftTfi+iKjeJdrS9zVRM0hw+mIlX1WuHldK5agyo1+r+o/DnGy3RVrE0MFv
         LdwMrzxDnGN5Iq/N8LcAZGjtdhw1y1FagMP14d0CFyxdyYCFlBikNllQ5T+XaYvz/a
         ufsOhRhZBkqkeJn+4fBr64ok0yGo6v5f1OREeTKg=
Date:   Thu, 5 Nov 2020 15:43:40 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [GIT PULL FOR v5.11] rkisp1 fixes/changes
Message-ID: <20201105154340.5f7a69f3@coco.lan>
In-Reply-To: <613dc41c-7174-7c32-7c28-c05ff1e8348c@xs4all.nl>
References: <613dc41c-7174-7c32-7c28-c05ff1e8348c@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 30 Oct 2020 10:17:06 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> After this series there are only a handful patches remaining before this
> driver can be moved out of staging.
> 
> Dafna, I marked the patches that need a bit more work as 'Changes Requested'.
> It looks like it isn't much work to make a new version of those few patches.
> It would be nice to get this done early in the v5.11 cycle.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit dfe3d19bd092cefb184c6e65b881602c793edd33:
> 
>   Merge tag 'v5.10-rc1' into patchwork (2020-10-29 09:03:21 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11b
> 
> for you to fetch changes up to 698e29d26ee79103310dd09a2b7ba09d9febd41a:
> 
>   media: MAINTAINERS: rkisp1: add path to dt-bindings (2020-10-30 10:02:18 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Dafna Hirschfeld (9):
>       media: staging: rkisp1: remove TODO item to document quantization handling
>       media: staging: rkisp1: validate links before powering and streaming
>       media: staging: rkisp1: params: in stop_streaming, use list_splice_init to move the buffers
>       media: staging: rkisp1: initialize buffer lists only on probe
>       media: staging: rkisp1: remove the 'is_streaming' field from stats and params
>       media: staging: rkisp1: params: remove unnecessary "!!"
>       media: staging: rkisp1: params: remove unnecessary parentheses
>       media: staging: rkisp1: uapi: add "WITH Linux-syscall-note"
>       media: staging: rkisp1: capture: set default quantization on 'set_fmt'
> 
> Helen Koike (8):
>       media: staging: rkisp1: cap: refactor enable/disable stream to allow multistreaming
>       media: staging: dt-bindings: rkisp1: add missing required nodes
>       media: staging: dt-bindings: rkisp1: drop i2c unit address
>       media: staging: dt-bindings: rkisp1: re-order properties
>       media: staging: dt-bindings: rkisp1: drop parent unit address
>       media: staging: rkisp1: remove unecessary clocks

Applied all the above...

>       dt-bindings: media: rkisp1: move rockchip-isp1 bindings out of staging
>       media: MAINTAINERS: rkisp1: add path to dt-bindings

... except by those two, as they should be placed together with a patch
moving the driver out of staging.

Regards,
Mauro

> 
>  .../devicetree/bindings/media/rockchip-isp1.yaml                     |  81 +++++++----
>  MAINTAINERS                                                          |   2 +
>  drivers/staging/media/rkisp1/TODO                                    |   4 -
>  drivers/staging/media/rkisp1/rkisp1-capture.c                        | 241 ++++++++++++++++---------------
>  drivers/staging/media/rkisp1/rkisp1-common.h                         |  12 +-
>  drivers/staging/media/rkisp1/rkisp1-dev.c                            |   8 +-
>  drivers/staging/media/rkisp1/rkisp1-params.c                         |  87 ++++-------
>  drivers/staging/media/rkisp1/rkisp1-stats.c                          |  21 ---
>  drivers/staging/media/rkisp1/uapi/rkisp1-config.h                    |   2 +-
>  9 files changed, 216 insertions(+), 242 deletions(-)
>  rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (81%)



Thanks,
Mauro
