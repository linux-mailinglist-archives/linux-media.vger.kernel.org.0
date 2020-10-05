Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BBE283077
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 08:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgJEGzU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 02:55:20 -0400
Received: from mga06.intel.com ([134.134.136.31]:51662 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgJEGzT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Oct 2020 02:55:19 -0400
IronPort-SDR: T/jPfnZgD+voXJ6rP6bBk8MfCRAwH5LV9suOg4Gq/urTZ/F7byFfAmVi4mo+vMPcWFluKvmjnv
 kHfipiB6TwNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="224961761"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="224961761"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2020 23:55:12 -0700
IronPort-SDR: cJxkWtCekEwiln79KrPzN9tx9OyGnNLL0wYniCTRcD5i89awUfUVj3DdsBh988tVeyNRIlbBCo
 KRUEOGd7ZTFQ==
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="515893226"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2020 23:55:11 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 49DB6205CA; Mon,  5 Oct 2020 09:55:05 +0300 (EEST)
Date:   Mon, 5 Oct 2020 09:55:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jmondi@jmondi.org
Subject: Re: [PATCH 5/5] v4l2-fwnode: Say it's fine to use
 v4l2_fwnode_endpoint_parse
Message-ID: <20201005065505.GB26842@paasikivi.fi.intel.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-6-sakari.ailus@linux.intel.com>
 <20201004084148.GF3938@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004084148.GF3938@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 04, 2020 at 11:41:48AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Sep 30, 2020 at 05:48:11PM +0300, Sakari Ailus wrote:
> > Earlier it was expected that there would be more variable size endpoint
> > properties and that most if not all drivers would need them. For that
> > reason it was expected also that v4l2_fwnode_endpoint_parse would no
> > longer be needed.
> > 
> > What actually happened that not all drivers require "link-frequencies",
> > the only variable size media endpoint property without a small upper
> > limit. Therefore drivers that do not need that information are fine using
> > v4l2_fwnode_endpoint_parse. So don't tell drivers to use
> > v4l2_fwnode_endpoint_alloc_parse in all cases.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-fwnode.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index 0c28dc11e829..cbd872e59f8e 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -245,8 +245,8 @@ struct v4l2_fwnode_connector {
> >   * The function does not change the V4L2 fwnode endpoint state if it fails.
> >   *
> >   * NOTE: This function does not parse properties the size of which is variable
> > - * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() in
> > - * new drivers instead.
> > + * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() if
> > + * you need properties of variable size.
> 
> Shouldn't we explicitly mention link-frequencies ? "properties the size
> of which is variable without a low fixed limit" is not very clear for a
> casual reader.

I can add that, sure.

-- 
Sakari Ailus
