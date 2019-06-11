Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F360D3D224
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 18:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403829AbfFKQX6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 12:23:58 -0400
Received: from casper.infradead.org ([85.118.1.10]:36862 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391573AbfFKQX5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 12:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QE9oxoSFaaJ7U001aIWfbiK801miHTLQuP4YifzCDnA=; b=jrUpIS4F/l8kdlU1vcVulO7MY/
        1l7tPYi4+3bKaoqJRu1k4V/uH/8913gJXJVUDdlLXSpNhhqwNqNzhidxEBLNOhG8kvFOJOb6GChaY
        oanJUIXEQboJdtYxMa5TJObPDgerZeUtGkwpiraEkwjTcRiPgrhdmybSpt0awVazG1NARgMixl1El
        bGqFjvzHXSp2+NnqSMwEWzDPQBJuDZan3yc9yZklQa1Rg25MYx7HlowDmmFNTwm90ukU21BJojdme
        bKqssi1xq4sU5Ve5Pb6Xg7bb+m9PD/YBvqmJtKQD5q1YXVDoNw9B9EWQV/SJuBm91Veb9r/wa+Yg4
        X3AkLGOg==;
Received: from 177.41.119.178.dynamic.adsl.gvt.net.br ([177.41.119.178] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hajYw-0000X4-RO; Tue, 11 Jun 2019 16:23:55 +0000
Date:   Tue, 11 Jun 2019 13:23:50 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.3] UVC and sensor changes
Message-ID: <20190611132350.3fad32f0@coco.lan>
In-Reply-To: <20190608120222.GC4786@pendragon.ideasonboard.com>
References: <20190608120222.GC4786@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Em Sat, 8 Jun 2019 15:02:22 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> The following changes since commit edadd68031e5b7c1ba0c413a9549dce62a02844c:
> 
>   media: MAINTAINERS: update email address (2019-06-05 15:58:40 -0400)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20190608
> 
> for you to fetch changes up to b9cc8bb11c6bd9036d3ff36cfeb4e12f9ff80463:
> 
>   media: i2c: mt9p031: simplify getting the adapter of a client (2019-06-08 14:54:15 +0300)
> 
> ----------------------------------------------------------------
> uvcvideo and sensor changes for v5.3
> 
> ----------------------------------------------------------------
> Laurent Pinchart (1):
>       media: uvcvideo: Replace copyright text with SPDX header

This patch was superseded by an upstream change:

	Author: Thomas Gleixner <tglx@linutronix.de>
	Date:   Mon May 27 08:55:01 2019 +0200

	    treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 152

There's one little difference: your patch is using:

	// SPDX-License-Identifier: GPL-2.0+

While upstream opted for:

	// SPDX-License-Identifier: GPL-2.0-or-later

Both are equivalent. So, I dropped this patch.

> 
> Oliver Neukum (1):
>       media: uvcvideo: Fix access to uninitialized fields on probe error
> 
> Torleiv Sundre (1):
>       media: uvcvideo: Include streaming interface number in debugfs dir name
> 
> Wolfram Sang (1):
>       media: i2c: mt9p031: simplify getting the adapter of a client

Applied, thanks!

> 
>  drivers/media/i2c/mt9p031.c          |  2 +-
>  drivers/media/usb/uvc/uvc_ctrl.c     | 11 ++++-------
>  drivers/media/usb/uvc/uvc_debugfs.c  | 12 ++++--------
>  drivers/media/usb/uvc/uvc_driver.c   |  7 +------
>  drivers/media/usb/uvc/uvc_entity.c   |  7 +------
>  drivers/media/usb/uvc/uvc_isight.c   |  7 +------
>  drivers/media/usb/uvc/uvc_metadata.c |  6 +-----
>  drivers/media/usb/uvc/uvc_queue.c    |  7 +------
>  drivers/media/usb/uvc/uvc_status.c   |  7 +------
>  drivers/media/usb/uvc/uvc_v4l2.c     |  7 +------
>  drivers/media/usb/uvc/uvc_video.c    |  7 +------
>  11 files changed, 17 insertions(+), 63 deletions(-)
> 



Thanks,
Mauro
