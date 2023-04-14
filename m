Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA7C6E21E5
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjDNLQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjDNLQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:16:36 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C96893FF
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681470991; x=1713006991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MqsH2pbmmI+7X51zhz5+Pw3fkK4pdSwFUh1F43530eg=;
  b=lXnXIZim3wGPNZazdCx2JW+BF/9P7xFx4dQcr5c3RF0uTnIyPznyR109
   htOTAFoB+7OgaLdyw4ONBuaXsel86T3PYguKe3L9XDWMZzard9QEOGIK8
   BW7XMbbc4fFZ0VfUVh4p1hAuiVceY7u4H5tlYmtz0BZ049AQOUvE3Vvwi
   Nn23nVwMN42WODzGn6WAy6VXQhNEIZg+YRg77L9ZrrZ0XjeRzaiUUGAg/
   sX1YxiVm1Yo2FfeXSzArSPrLzPmJkaj/exKh5zsrmIWu5He8yGsZfbULZ
   g23G5oOKVu3HbsEaS0maRh6VDivXHJzCTlToSqH7c4A6/5hwJqCt4DunZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="430733626"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="430733626"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="935984219"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="935984219"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:16:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0D989122DC1;
        Fri, 14 Apr 2023 14:16:23 +0300 (EEST)
Date:   Fri, 14 Apr 2023 14:16:23 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 05/18] media: v4l: async: Clean testing for duplicated
 async subdevs
Message-ID: <ZDk2B3K/X+IkXrVZ@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-6-sakari.ailus@linux.intel.com>
 <pp7ndz4qud6g5cmkcsbbqogybfqwvjcokqebnzka2wpv6bqqg7@thzj5mo4mjzt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pp7ndz4qud6g5cmkcsbbqogybfqwvjcokqebnzka2wpv6bqqg7@thzj5mo4mjzt>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Apr 13, 2023 at 06:58:56PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Mar 30, 2023 at 02:58:40PM +0300, Sakari Ailus wrote:
> > There's a need to verify that a single async sub-device isn't being added
> > multiple times, this would be an error. This takes place at the time of
> > adding the async sub-device to the notifier's list as well as when the
> > notifier is added to the global notifier's list.
> >
> > Use the pointer to the sub-device for testing this instead of an index to
> > an array that is long gone.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index bb78e3618ab5..fc9ae22e2b47 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -456,21 +456,19 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> >
> >  /*
> >   * Find out whether an async sub-device was set up already or
> > - * whether it exists in a given notifier before @this_index.
> > - * If @this_index < 0, search the notifier's entire @asd_list.
> > + * whether it exists in a given notifier.
> >   */
> >  static bool
> >  v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> > -			       struct v4l2_async_subdev *asd, int this_index)
> > +			       struct v4l2_async_subdev *asd, bool skip_self)
> 
> is skip_self used ?

Yes, it should have been there. I'll add it for v2.

-- 
Kind regards,

Sakari Ailus
