Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042AAD80DD
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 22:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfJOUTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 16:19:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58386 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfJOUTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 16:19:30 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32BC3324;
        Tue, 15 Oct 2019 22:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571170768;
        bh=ANnfdi/tTnen/XQiJfSTwoDMKG6nWKFpsp5gb9d5Adg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uXUJvEvFz461Dy1AP6FweROvg29D3d7BVjUQp4wsvk8YS9Yk2vuVxowwQlOwdVvWQ
         y+p+0on3HbfZeD659nQBIfJ6uGZHzfJZdftH6cDgO411gyBs8P9JBHSobb3rB6My8a
         2H5Jfcy1gWUhLShVogofYuWaNxJUPQMXLlerm+TM=
Date:   Tue, 15 Oct 2019 23:19:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv6 0/3] v4l2-core: improve ioctl validation
Message-ID: <20191015201925.GD19403@pendragon.ideasonboard.com>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 14, 2019 at 10:40:18AM +0200, Hans Verkuil wrote:
> This supersedes https://www.mail-archive.com/linux-media@vger.kernel.org/msg150027.html
> based on feedback from Laurent:
> 
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg150117.html
> 
> and Sakari:
> 
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg150129.html
> 
> This v6 only moves some code from patch 1 to patch 3, the final code
> is the same as for v5. I plan to make a PR for this very soon together
> with the vivid metadata patches that need this.
> 
> Regards,
> 
> 	Hans
> 
> Changes in v6:
> 
> Patch 1/3 dropped the check against GRABBER for the g_parm ioctl,
> but that is too early: this should be done in patch 3/3 where this
> code no longer applies to touch devices (which was the reason for
> the GRABBER test).
> 
> Changes in v5:
> 
> I now check if a GRABBER device is a video or metadata device
> (or both!) by checking device_caps.
> 
> 
> Hans Verkuil (2):
>   v4l2-dev: simplify the SDR checks
>   v4l2-dev: fix is_tch checks
> 
> Vandana BN (1):
>   v4l2-core: correctly validate video and metadata ioctls

For the whole series,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
>  drivers/media/v4l2-core/v4l2-dev.c   | 104 ++++++++++++++++-----------
>  drivers/media/v4l2-core/v4l2-ioctl.c |  16 ++++-
>  2 files changed, 75 insertions(+), 45 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
