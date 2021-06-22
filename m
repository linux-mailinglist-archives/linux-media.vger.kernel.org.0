Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A644B3AFF47
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 10:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhFVIcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 04:32:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:46324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229747AbhFVIcJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 04:32:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02A5760C3E;
        Tue, 22 Jun 2021 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624350593;
        bh=COzimfgMz1afj8XdLcr3vdgxvcJ0o12svjbRCymcLjs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pSDN5ID0mABoH5DVe6bJVNEEOoGxe+cIgxlb9ec8CQe+Vo07LEeKL48SbF27+KHoY
         v+9QNlP6hxUPbx/kcuQUAuC0JdcMz1qgzX3j1bw2lrzVODrWubj4iGhDN/yIAQ0Czv
         6vYxPFQG6g1HhlH9L/KjxnAVWNLbXNGpqEPsiDDnFEZTCAZf7pTkKaQHh+bS6LruJ9
         xZ8q4mCNS0Ao4TPx/9gcJo9v9S//RkogZ+tQVkUodhvmqpLLG9m1S1xq5BP39tQzII
         lAIBKRWnGURJNPgqJOo8QCa7U0Ge6ppxGV0m+cXitsplbUHumMgY1jiTVX/WcjWgat
         /lgJrGVwC8HNA==
Date:   Tue, 22 Jun 2021 10:29:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvc: limit max bandwidth for HDMI capture
Message-ID: <20210622102948.47b86fbe@coco.lan>
In-Reply-To: <YNDY4iesZGF+7Cr0@pendragon.ideasonboard.com>
References: <b791d5874c83663505cbd4f74907ac38d00bb727.1612206534.git.mchehab+huawei@kernel.org>
        <YNDY4iesZGF+7Cr0@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 21 Jun 2021 21:22:26 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> Thank you for the patch.

Thanks for reviewing it!

> 
> On Mon, Feb 01, 2021 at 08:08:59PM +0100, Mauro Carvalho Chehab wrote:
> > This device:
> >         534d:2109 MacroSilicon
> > 
> > Announces that it supports several frame intervals for
> > their resolutions for MJPEG compression:
> > 
> >         VideoStreaming Interface Descriptor:
> >         bLength                            46
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                           1920
> >         wHeight                          1080
> >         dwMinBitRate                   768000
> >         dwMaxBitRate                196608000
> >         dwMaxVideoFrameBufferSize     4147200
> >         dwDefaultFrameInterval         166666
> >         bFrameIntervalType                  5
> >         dwFrameInterval( 0)            166666
> >         dwFrameInterval( 1)            333333
> >         dwFrameInterval( 2)            400000
> >         dwFrameInterval( 3)            500000
> >         dwFrameInterval( 4)           1000000
> > 
> > However, the highest frame interval (166666), which means 60 fps
> > is not supported. For such resolution, the maximum interval
> > is, instead 333333 (30 fps).  
> 
> What happens if you try to select it ?

Basically, URBs get lost: they cause apps like qv4l2 to crash
sometimes, with:

	v4l-convert: libjpeg error: Corrupt JPEG data: premature end of data segment

The image keeps blinking, and part of the image is replaced by
white noise.

Clearly, it tries to send more data than the maximum available bandwidth
on this chipset.


Sent a v2 addressing the issues you pointed.


Thanks,
Mauro
