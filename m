Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94D42192DCB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 17:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgCYQG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 12:06:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727702AbgCYQG2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 12:06:28 -0400
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D96B72073E;
        Wed, 25 Mar 2020 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585152388;
        bh=lkL2BXtoW1/2+YT7Y7oy7vJ/NAJKiqaBw13uXrgkUJY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hwKz3G+DBMLKTSeBLGtnFAu95vM6N310C7TFpUhguseEfw4e1ovKGIG9MpYqtgS7d
         bis+7Qsyp75OwQAgc52EkmLA7Bf7YMa+SIjIgKGW3SdvSdyazCzie/M8j437XTEGG+
         aR/xtB0ztQ/5JMWd8FZlVgDmBTmZpE6Rb8xytmGw=
Date:   Wed, 25 Mar 2020 17:06:23 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL FOR v5.7] ti-vpe/cal and imx7-mipi-csis
 cleanups/fixes
Message-ID: <20200325170623.57804089@coco.lan>
In-Reply-To: <64c740ae-3ebd-cec3-14f4-e65f2cb53af3@xs4all.nl>
References: <64c740ae-3ebd-cec3-14f4-e65f2cb53af3@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 25 Mar 2020 14:51:55 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> The following changes since commit ad71693f41aa60217eaf1c29afb49b3aa0a2db5d:
> 
>   media: mtk-vpu: load vpu firmware from the new location (2020-03-24 17:11:47 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7n
> 
> for you to fetch changes up to 938b4f6cbbd7c7bd2236f4594ef37431c519f7a7:
> 
>   media: ti-vpe: cal: fix stop state timeout (2020-03-25 13:21:59 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Laurent Pinchart (14):
...

> Tomi Valkeinen (19):
...

>  drivers/media/platform/ti-vpe/cal.c        | 397 ++++++++++++++++++++++++++++++---------------------
>  drivers/media/platform/ti-vpe/cal_regs.h   |  21 +--
>  drivers/staging/media/imx/imx7-mipi-csis.c | 446 ++++++++++++++++++++++++++++++++++++----------------------
>  3 files changed, 518 insertions(+), 346 deletions(-)

That sounds too much for a late pull request. Any of the patches here
are fixing a regression? Otherwise, I'll likely postpone merging it
only after the merge window.

Thanks,
Mauro
