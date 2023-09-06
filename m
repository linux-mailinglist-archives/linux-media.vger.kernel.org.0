Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521EB793D60
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 15:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238177AbjIFNEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 09:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjIFNEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 09:04:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C6C10CC
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694005463; x=1725541463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNnYJ7tj02Pzlw0qiPeqO9GZ25LtQS+/CdYz7/Lg0vE=;
  b=YUoGW+mgvlcIxehtAlDNDCe2wHurcstECaAgCdeF10UgvSsJqyQNQpJL
   DGecWyFRNZJWERtDlN4Iz+fcRiuMi0fgBsI/0+wv6NZbq/fslk3I4HNQv
   S6olcFCs1HxsWpZQkpRCHKDbBNjm82GWQsSv3CNDMp9HkHZ2lIw92qvVc
   2UDO9qEWQXQLDjOs14PUg62YLAEMc3HL+9w5FDCl43bhPYxgx86uWiYMP
   RTqvzvR4jYal3HrsEfmLQNcHf71SPdMSooo+wj6YmAOazWF4UUzZ9KL2N
   pbpkcdNRskdrvD9Mfbu0WXhDKdjW2fU60R/mWDFCgSglwgFNOatOMdPEX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443452306"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="443452306"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 06:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741539081"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="741539081"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 06:03:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 246DB11FC2C;
        Wed,  6 Sep 2023 16:03:18 +0300 (EEST)
Date:   Wed, 6 Sep 2023 13:03:18 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 09/10] media: Add media bus codes for MIPI CCS
 embedded data
Message-ID: <ZPh4ln9GkyQDmbfp@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-10-sakari.ailus@linux.intel.com>
 <20230905172535.GI7971@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905172535.GI7971@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Sep 05, 2023 at 08:25:35PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Aug 08, 2023 at 10:55:37AM +0300, Sakari Ailus wrote:
> > Add new MIPI CCS embedded data media bus formats.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/subdev-formats.rst              | 32 +++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         | 10 +++++-
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index c615da08502d..5d5407738af9 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8491,3 +8491,35 @@ and finally the bit number in subscript. "p" indicates a padding bit.
> >        - p
> >        - p
> >        - p
> > +
> > +MIPI CCS Embedded Data Formats
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines an
> 
> s/an$/a/

Yes. I think I had "embedded" there in the past...

> 
> > +metadata format for sensor embedded data, which is used to store the register
> > +configuration used for capturing a given frame. The format is defined in the CCS
> > +specification.
> 
> Strictly speaking, the MIPI CCS embedded data format specifies not just
> the data packing (insertion of padding bytes) and the data encoding (the
> data format byte and the tag codes), but also the register addresses and
> values that are reported in the embedded data. Do you envision the media
> bus formats defined here as being applicable to sensors that use the
> same packing and encoding as CCS, but different registers, or only to
> fully compliant CCS sensors ?

There are sensors that aren't fully compatible with CCS (including those
compatible with SMIA and SMIA++) but I wouldn't expect the format to be
used by devices that are entirely incompatible with CCS.

-- 
Regards,

Sakari Ailus
