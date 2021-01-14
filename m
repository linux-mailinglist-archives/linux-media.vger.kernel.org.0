Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B6E2F5830
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 04:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbhANCPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 21:15:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbhANCPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 21:15:19 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 008CA279;
        Thu, 14 Jan 2021 03:14:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610590478;
        bh=gGcX7lcfM0iCQ6q8iGJIajqVIFrdbyZylHHpNTEIpik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i5SlE41ajy5bjEvDukqJQPhpniq53aElJj4GciYVmrfIDw1TQHV7dyL+sCvgouPSP
         xLM3nEuQKjFRgt80/rgBqQJIE0NiMe4BdPijMEgh6A19Y32SyQ6uFjhB5fHbbeesnY
         pTLwRxJsUfvdnN+oaWmHJue31NlkhQsbVzlEff9M=
Date:   Thu, 14 Jan 2021 04:14:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 11/13] media: v4l2-async: Drop
 v4l2_fwnode_reference_parse_sensor_common mention
Message-ID: <X/+o/P3DB+SBzieL@pendragon.ideasonboard.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-12-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112132339.5621-12-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for the patch.

On Tue, Jan 12, 2021 at 10:23:37AM -0300, Ezequiel Garcia wrote:
> The v4l2_async_notifier_cleanup documentation mentions
> v4l2_fwnode_reference_parse_sensor_common, which doesn't exist.
> Drop it.

The function is actually called
v4l2_async_notifier_parse_fwnode_sensor_common(). It was introduced in
commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
parsing common external refs") with an incorrect name in the
documentation. Commit b064945517ee ("media: fix kernel-doc markups")
fixed the kerneldoc header for the function, but forgot to address this
location.

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  include/media/v4l2-async.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 76be1e01222e..2429ac55be1c 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -290,9 +290,8 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
>   * sub-devices allocated for the purposes of the notifier but not the notifier
>   * itself. The user is responsible for calling this function to clean up the
>   * notifier after calling
> - * @v4l2_async_notifier_add_subdev,
> - * @v4l2_async_notifier_parse_fwnode_endpoints or
> - * @v4l2_fwnode_reference_parse_sensor_common.
> + * @v4l2_async_notifier_add_subdev or
> + * @v4l2_async_notifier_parse_fwnode_endpoints.
>   *
>   * There is no harm from calling v4l2_async_notifier_cleanup in other
>   * cases as long as its memory has been zeroed after it has been

-- 
Regards,

Laurent Pinchart
