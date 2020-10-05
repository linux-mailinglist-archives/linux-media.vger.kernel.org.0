Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11AB283076
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 08:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgJEGxQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 02:53:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:40053 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgJEGxQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Oct 2020 02:53:16 -0400
IronPort-SDR: p7JckPbnl3oQpQOc3y/W28qxlwLo4vAiV7e6hiAO6NYyoD73J2HN1syWl5BFgywccgafCmkTNm
 agSrVjADxE5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="248075908"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="248075908"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2020 23:53:06 -0700
IronPort-SDR: jM7JVjgHsG0eCFT+RqSioW0IOzWXk66HQx6oXymqjsmEPq3LhtM4ioIYrEkkmY9Jh3LexbYsjd
 PMkXru4LtPZw==
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="459367540"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2020 23:53:04 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A1C78205CA; Mon,  5 Oct 2020 09:53:01 +0300 (EEST)
Date:   Mon, 5 Oct 2020 09:53:01 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jmondi@jmondi.org
Subject: Re: [PATCH 4/5] v4l2-fwnode: Rework v4l2_fwnode_endpoint_parse
 documentation
Message-ID: <20201005065301.GA26842@paasikivi.fi.intel.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-5-sakari.ailus@linux.intel.com>
 <20201004084013.GE3938@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004084013.GE3938@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Oct 04, 2020 at 11:40:13AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Sep 30, 2020 at 05:48:10PM +0300, Sakari Ailus wrote:
> > Rework the documentation of v4l2_fwnode_endpoint_parse for better
> > readability, usefulness and correctness.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-fwnode.h | 62 ++++++++++++++++++++++++-------------
> >  1 file changed, 40 insertions(+), 22 deletions(-)
> > 
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index 0f9a768b1a8d..0c28dc11e829 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -219,17 +219,26 @@ struct v4l2_fwnode_connector {
> >   * @vep: pointer to the V4L2 fwnode data structure
> >   *
> >   * This function parses the V4L2 fwnode endpoint specific parameters from the
> > - * firmware. The caller is responsible for assigning @vep.bus_type to a valid
> > - * media bus type. The caller may also set the default configuration for the
> > - * endpoint --- a configuration that shall be in line with the DT binding
> > - * documentation. Should a device support multiple bus types, the caller may
> > - * call this function once the correct type is found --- with a default
> > - * configuration valid for that type.
> > - *
> > - * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
> > - * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
> > - * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
> > - * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
> > + * firmware. There are two ways to use this function, either by letting it
> > + * obtain the type of the bus (by setting the @vep.bus_type field to
> > + * V4L2_MBUS_UNKNOWN) or specifying the bus type explicitly to one of the &enum
> > + * v4l2_mbus_type types.
> > + *
> > + * When @vep.bus_type is V4L2_MBUS_UNKNOWN, the function will use the "bus-type"
> > + * property to determine the type when it is available. The caller is
> > + * responsible for validating the contents of @vep.bus_type field after the call
> > + * returns.
> 
> As an additional improvement, I wonder if it would make sense to turn
> the bus types into a bit flag, to let the caller tell which bus types it
> supports. Or maybe that would be overkill ?
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for the review!

I wonder how useful that would be as drivers typically do bus type specific
checks right after this function returns. Although I wouldn't object a
patch doing that if it's seen useful somewhere.

-- 
Sakari Ailus
