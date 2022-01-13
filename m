Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A4548DAAF
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 16:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236115AbiAMP2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 10:28:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42956 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbiAMP2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 10:28:16 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 386FF97;
        Thu, 13 Jan 2022 16:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642087695;
        bh=Q1ChUMa1rotERKSUZgs47MthEWRVLkH0DCnedxthV1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J0skv+0xKEav9jW+6FbDdTt8eefreh1v1uDkK6/eS/yrdY9a1wc4t1rOy/q3x4eqV
         3gcSk4F92MvCgSCPQqtqnynw301awWNqyD4BC/NraJtKFnB1i+tNYhE199VSgZ0OVn
         +QU53UX3rXb9n6TeieknR/jvKT71Vwe08eY84xZg=
Date:   Thu, 13 Jan 2022 17:28:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 0/2] media: mc: Simplify media pipeline start/stop
Message-ID: <YeBFA4M6svBcF+Nr@pendragon.ideasonboard.com>
References: <20220113150042.15630-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220113150042.15630-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 13, 2022 at 05:00:40PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This small series simplifies the implementation of the
> media_pipeline_start() function (and to a lesser extend, the
> media_pipeline_stop() function as well) by avoiding unnecessary graph
> walks.
> 
> Patch 1/2 adds a small inline helper function to avoid direct access to
> the media_entity.stream_count field in drivers, making it easier in
> patch 2/2 to rework the implementation (dropping the stream_count field)
> without disturbing drivers. Please see patch 2/2 for a detailed
> explanation of the simplification.

I forgot to mention that I've tested this with the Renesas R-Car VSP1
test suite that has pipeline with multiple output and capture video
nodes, as well on a Xilinx platform with a pipeline that has two capture
video nodes.

> Laurent Pinchart (2):
>   media: media-entity: Add media_pad_is_streaming() helper function
>   media: media-entity: Simplify media_pipeline_start()
> 
>  drivers/media/mc/mc-entity.c                  | 55 ++++++++-----------
>  drivers/media/platform/exynos4-is/common.c    |  5 +-
>  drivers/media/platform/exynos4-is/fimc-isp.c  |  2 +-
>  drivers/media/platform/exynos4-is/fimc-lite.c |  6 +-
>  drivers/media/platform/rcar-vin/rcar-core.c   |  2 +-
>  include/media/media-entity.h                  | 21 +++++--
>  6 files changed, 48 insertions(+), 43 deletions(-)
> 
> 
> base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c

-- 
Regards,

Laurent Pinchart
