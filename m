Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FACC4D038
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 16:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfFTOUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 10:20:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33642 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfFTOUP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 10:20:15 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F65452A;
        Thu, 20 Jun 2019 16:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561040413;
        bh=Axu8bikjTPR/MFTtXfYZHRgaN2HoQlgRm5rz9eneFG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TatzaAb+XYwc5EQnOa0qxfbX33MASYTQ82KuLNo6srp1KySeVYyQF8IhHT6TKh27P
         yc6P17ZLfJ+09hVOa45YzC6HVXjQjms/AfPigOAOJhk1zULODFW4M6UCKFpS34G2xH
         nc0tbYAJ9LY9mSuCkWIEiFb4fJWgEbJUuYxuie8I=
Date:   Thu, 20 Jun 2019 17:19:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] MAINTAINERS: Add maintainers for Media Controller
Message-ID: <20190620141955.GF5720@pendragon.ideasonboard.com>
References: <20190620141753.15983-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190620141753.15983-1-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Jun 20, 2019 at 05:17:53PM +0300, Sakari Ailus wrote:
> When Media Controller was merged to mainline long, long time ago, no-one
> bothered to think what its MAINTAINERS entry should be. Now that Media
> Controller is moved into its own directory, address this at the same time.
> 
> So tell people to mail patches to myself and Laurent Pinchart.
> 
> Note that the patches are still merged through the Media tree, just like
> any other driver or framework bits that have separate "mail patches to"
> entries different from the main drivers/media one.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

This will help me catching changes to the media controller, and being
more active on reviews, so I welcome that change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(pick the tag you find the most appropriate, or both if you desire)

> ---
> This patch adds a MAINTAINERS entry for the MC framework and API, as
> discussed in this week's weekly meeting.
> 
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad2bf808b02c..0a064d10a5df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9643,6 +9643,17 @@ L:	linux-iio@vger.kernel.org
>  S:	Maintained
>  F:	drivers/iio/dac/cio-dac.c
>  
> +MEDIA CONTROLLER FRAMEWORK
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +W:	https://www.linuxtv.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Supported
> +F:	drivers/media/mc/
> +F:	include/media/media-*.h
> +F:	include/uapi/linux/media.h
> +
>  MEDIA DRIVERS FOR ASCOT2E
>  M:	Sergey Kozlov <serjk@netup.ru>
>  M:	Abylay Ospan <aospan@netup.ru>

-- 
Regards,

Laurent Pinchart
