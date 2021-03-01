Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F34B327959
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 09:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhCAIf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 03:35:27 -0500
Received: from mga05.intel.com ([192.55.52.43]:57185 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233110AbhCAIfN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 03:35:13 -0500
IronPort-SDR: 1er/7xRjkrEnUDQQiHHKvNBI3cS0DgoTKD54XCl3PzckuQ/aR1/XGgXlUyQfDnEsdUMkc8eEjl
 2NkrwxeJE8Rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="271393088"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="271393088"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 00:33:18 -0800
IronPort-SDR: 6BGOXUAqgvhmNQ0d5WoXKH1fHuucsPeWDsGuuDGiAro/r0Ui5Wfdhev1FTGEYN5967UVVhiIPX
 pQbo8oImVPRQ==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="366632610"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 00:33:12 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 3C2DF202DD;
        Mon,  1 Mar 2021 10:33:08 +0200 (EET)
Date:   Mon, 1 Mar 2021 10:33:08 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        mchehab@kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/2] media: v4l2-async: Safely unregister an
 non-registered async subdev
Message-ID: <20210301083308.GS3@paasikivi.fi.intel.com>
References: <20210226224938.18166-1-laurent.pinchart@ideasonboard.com>
 <20210226224938.18166-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226224938.18166-2-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Feb 27, 2021 at 12:49:38AM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Make the V4L2 async framework a bit more robust by allowing to
> unregister a non-registered async subdev. Otherwise the
> v4l2_async_cleanup() will attempt to delete the async subdev from the
> subdev_list with the corresponding list_head not initialized.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

IMO this can be merged through another tree once the first patch is agreed
on. Cc Hans and Mauro, too.

> ---
>  drivers/media/v4l2-core/v4l2-async.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 37cc0263b273..2347b7ac54d4 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -750,6 +750,9 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
>  
>  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  {
> +	if (list_is_null(&sd->async_list))
> +		return;
> +
>  	mutex_lock(&list_lock);
>  
>  	__v4l2_async_notifier_unregister(sd->subdev_notifier);

-- 
Kind regards,

Sakari Ailus
