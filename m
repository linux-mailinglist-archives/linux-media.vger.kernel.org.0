Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38311909E8
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 10:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgCXJrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 05:47:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56240 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgCXJrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 05:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=vcY4LovXnAkMYtSUeDtTCNCAPqqsgEMMoWrKTOHbwH8=; b=FAjTXzDcqNzo1++ZRsUSgcFXi1
        zyNeO7lMM62SghpMdM7XRp/8rwmY/7lVSKnrijfHzpDAULrq4aCsFFXsTyAF/DqpdtzuM7h0G4CUF
        U8rFLyYIHtzwLtHzt2BSxUlkzoU1YS1PC8cu4tshMMuGoUwa0b6K8HbMb56O2XaRCZ3u+hzs6tjYp
        u6iM711EH3dfBbckOxVX9TndURmTMq4XzcEXVaMO0BHoAECK9s8mPIFTYWkr6c3UGcOVotrBqLNGz
        bSf3/QCJdIkvvf4dMSTNJ/FsKjoGj1KElJszq1jMs6SURqDvhoEuiXqcjwXSZf/5evvJ+tTme7jOd
        4K7HXM5Q==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGg9h-00027h-ST; Tue, 24 Mar 2020 09:47:30 +0000
Date:   Tue, 24 Mar 2020 10:47:22 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Michael Ira Krufky <mkrufky@gmail.com>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH 2/2] media: Remove VIDEO_DEV unneeded dependency
Message-ID: <20200324104722.1c605792@coco.lan>
In-Reply-To: <20200323211022.28297-3-ezequiel@collabora.com>
References: <20200323211022.28297-1-ezequiel@collabora.com>
        <20200323211022.28297-3-ezequiel@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 23 Mar 2020 18:10:22 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> Enable VIDEO_DEV (which compiles Video4Linux core)
> when MEDIA_SUPPORT is selected. This is needed, in order
> to be able to enable devices such as stateless codecs.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index b36a41332867..7de472ad07a2 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -93,13 +93,11 @@ source "drivers/media/mc/Kconfig"
>  
>  #
>  # Video4Linux support
> -#	Only enables if one of the V4L2 types (ATV, webcam, radio) is selected
>  #
>  
>  config VIDEO_DEV
>  	tristate
>  	depends on MEDIA_SUPPORT
> -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
>  	default y
>  
>  config VIDEO_V4L2_SUBDEV_API

The rationale of the above is to exclude Digital TV and remote
controller.

Removing the above will make the V4L2 core available every time, even
if all the user wants is remote controller or Digital TV support.

I'm working on a patchset that should hopefully address the issues
you're concerning.

Thanks,
Mauro
