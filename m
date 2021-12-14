Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DBA4745C7
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 16:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbhLNPB3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 10:01:29 -0500
Received: from mga11.intel.com ([192.55.52.93]:31244 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230488AbhLNPB2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 10:01:28 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="236526264"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="236526264"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 07:01:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="609890038"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 07:01:25 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 5853D20462;
        Tue, 14 Dec 2021 17:01:23 +0200 (EET)
Date:   Tue, 14 Dec 2021 17:01:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 3/5] media: entity: Skip non-data links in graph iteration
Message-ID: <Ybixw0dIZyC6wQL4@paasikivi.fi.intel.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213232849.40071-4-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Dec 13, 2021 at 11:28:47PM +0000, Daniel Scally wrote:
> When iterating over the media graph, don't follow links that are not
> pad-to-pad links.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since the rfc:
> 
> 	- new patch
> 
>  drivers/media/mc/mc-entity.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index d79eb88bc167..aeddc3f6310e 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -325,6 +325,14 @@ static void media_graph_walk_iter(struct media_graph *graph)
>  
>  	link = list_entry(link_top(graph), typeof(*link), list);
>  
> +	/* If the link is not a pad-to-pad link, don't follow it */

This comment should mention data links, not pad-to-pad links.

Seems fine apart from this.

> +	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) != MEDIA_LNK_FL_DATA_LINK) {
> +		link_top(graph) = link_top(graph)->next;
> +		dev_dbg(entity->graph_obj.mdev->dev, "walk: skipping %s link\n",
> +			link_type(link));
> +		return;
> +	}
> +
>  	/* The link is not enabled so we do not follow. */
>  	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
>  		link_top(graph) = link_top(graph)->next;

-- 
Kind regards,

Sakari Ailus
