Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1964729CDD
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 16:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbjFIO1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 10:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241462AbjFIO1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 10:27:53 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC1A35B0
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686320838; x=1717856838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9TmvrWG/M7iOnXzZRoBsL34CLO71gQOrNaTjVL12PXo=;
  b=j6dQZBi0A22+iz/Eym8WMPv8aaE3sNycjxwijL2BMQng0KOQPeInmRQQ
   hrPhGKoLwlKrOacRnVPw9WTG8GWlWF2l3220VFwJGSh0U6/AZr9iLJNry
   5pWj9BWkApPP4WzdWGh2FYU98SYlWDXtTtXuFvAQz+s1KlC1+Cf9xRZeS
   dos6ct42381Ftt3H0LWIdGEUAIRwpoPI00Z2Cd6zdNZvb1wvUvX/i+yCR
   pc3kIzEmVGW9b80seBO9a8H+C+ecjZ0/P7ym4t4YeTcJ9SRoixiA6bp1S
   +SJID3u3hXK0VPc4kkkaW7JDPg3vvwHa6xWK32oEWvn0o700JIi8Tj8zg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="357609222"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="357609222"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743501450"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="743501450"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:27:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C43D511F76F;
        Fri,  9 Jun 2023 17:27:12 +0300 (EEST)
Date:   Fri, 9 Jun 2023 14:27:12 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 6/7] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <ZIM2wIdKtdQUB5JJ@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-7-sakari.ailus@linux.intel.com>
 <7f9143e7-81c5-4b0f-aa4c-08178b9fcc65@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f9143e7-81c5-4b0f-aa4c-08178b9fcc65@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jun 08, 2023 at 10:54:43AM +0200, Hans Verkuil wrote:
> On 05/05/2023 23:52, Sakari Ailus wrote:
> > Generic 8-bit metadata formats define the in-memory data layout but not
> > the format of the data itself. The reasoning for having such formats is to
> > allow CSI-2 receiver drivers to receive and DMA drivers to write the data
> > to memory without knowing a large number of device specific formats.
> > 
> > These formats may be used only in conjunction of a Media controller
> > pipeline where the internal pad of the source sub-device defines the
> > specific format of the data (using an mbus code).
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
> >  .../media/v4l/metafmt-generic.rst             | 317 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
> >  include/uapi/linux/videodev2.h                |   9 +
> >  4 files changed, 335 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > index 0bb61fc5bc00..919f595576b9 100644
> > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > @@ -19,3 +19,4 @@ These formats are used for the :ref:`metadata` interface only.
> >      metafmt-vsp1-hgo
> >      metafmt-vsp1-hgt
> >      metafmt-vivid
> > +    metafmt-generic
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > new file mode 100644
> > index 000000000000..09d3fabb1e94
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > @@ -0,0 +1,317 @@
> > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > +
> > +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> > +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O'), V4L2_META_FMT_GENERIC_CSI2_2_24 ('MC2O')
> > +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> > +
> > +
> > +Generic line-based metadata formats
> > +
> > +
> > +Description
> > +===========
> > +
> > +These generic line-based metadata formats define the memory layout of the data
> > +without defining the format or meaning of the metadata itself. These formats may
> > +only be used with a Media controller pipeline where the more specific format is
> > +defined in an :ref:`internal source pad <MEDIA-PAD-FL-INTERNAL-SOURCE>` of the
> > +source sub-device. See also :ref:`source routes <v4l2-subdev-source-routes>`.
> > +
> > +.. _v4l2-meta-fmt-generic-8:
> > +
> > +V4L2_META_FMT_GENERIC_8
> > +-----------------------
> > +
> > +The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format whereas the
> > +rest of the formats have CSI-2 packing that are typically used on camera sensors
> > +in conjunction with pixel data of the same bit depth.
> 
> You keep referring to CSI-2 packing without ever defining it.
> 
> I'm not sure you should include CSI2 in the name either. It is OK to say something
> here like: "The way the data is stored follows the CSI-2 specification."
> 
> But it is not limited to CSI-2 and can be used with other buses as well.

That's true, certainly, but where this packing is most commonly used is
CSI-2 (or derives from CSI-2).

> 
> > +
> > +This format is also used on CSI-2 on both 8 bits per sample as well as on
> > +16 bits per sample when two bytes of metadata are packed into one sample.
> 
> Little or big endian?

Little endian. I'll address these for v2.

-- 
Kind regards,

Sakari Ailus
