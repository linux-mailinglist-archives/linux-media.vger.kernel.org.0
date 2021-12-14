Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA79474D30
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 22:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhLNVWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 16:22:21 -0500
Received: from mga02.intel.com ([134.134.136.20]:54898 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231845AbhLNVWU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 16:22:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226366167"
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; 
   d="scan'208";a="226366167"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 13:22:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,206,1635231600"; 
   d="scan'208";a="463977346"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 13:22:17 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 023D4200D3;
        Tue, 14 Dec 2021 23:22:15 +0200 (EET)
Date:   Tue, 14 Dec 2021 23:22:14 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 3/5] media: entity: Skip non-data links in graph iteration
Message-ID: <YbkLBobSglC1sgsF@paasikivi.fi.intel.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-4-djrscally@gmail.com>
 <Ybixw0dIZyC6wQL4@paasikivi.fi.intel.com>
 <955c5e8e-d898-9987-4f21-f7dacb6b178e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <955c5e8e-d898-9987-4f21-f7dacb6b178e@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Dec 14, 2021 at 04:14:21PM +0000, Daniel Scally wrote:
> Hi Sakari
> 
> On 14/12/2021 15:01, Sakari Ailus wrote:
> > Hi Daniel,
> >
> > On Mon, Dec 13, 2021 at 11:28:47PM +0000, Daniel Scally wrote:
> >> When iterating over the media graph, don't follow links that are not
> >> pad-to-pad links.
> >>
> >> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >> ---
> >> Changes since the rfc:
> >>
> >> 	- new patch
> >>
> >>  drivers/media/mc/mc-entity.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> >> index d79eb88bc167..aeddc3f6310e 100644
> >> --- a/drivers/media/mc/mc-entity.c
> >> +++ b/drivers/media/mc/mc-entity.c
> >> @@ -325,6 +325,14 @@ static void media_graph_walk_iter(struct media_graph *graph)
> >>  
> >>  	link = list_entry(link_top(graph), typeof(*link), list);
> >>  
> >> +	/* If the link is not a pad-to-pad link, don't follow it */
> > This comment should mention data links, not pad-to-pad links.
> 
> 
> I wondered about the terminology of this actually...since we create
> those links with media_create_pad_link(), and they're called pad-to-pad
> links in the documentation [1], but in other cases called data links. Do
> we need to fix those other references too?
> 
> 
> 
> [1] https://www.kernel.org/doc/html/v5.0/media/kapi/mc-core.html#links

Good point.

There were only one type of links before the interface links were
introduced. Some of the documentation seems to discuss pad links whereas
the corresponding macro name is MEDIA_LNK_FL_DATA_LINK. What the links
really represent is flow of data.

It would be good to align this, although that should probably be done in a
different context from this patchset.

-- 
Kind regards,

Sakari Ailus
