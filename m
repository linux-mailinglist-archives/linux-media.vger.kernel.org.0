Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05F8778D35
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 13:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236137AbjHKLM1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Aug 2023 07:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbjHKLMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Aug 2023 07:12:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849F8C3
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 04:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691752343; x=1723288343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=npiWKYWn3WKay+REbGSkfA5Za/bjvGhb2pANJ+aU1AE=;
  b=dwrPkJsu8dhFkhnkkqXrmHAqbqGYAP/wAraKaIyOfUJSP9tqa1wmJSld
   EFOuOo3RXadKklnM8YokEGhnZT5KWSiFCwZbWlI6WeifaPnT/iqkiKxlY
   jzE2CyxZuXlYNOxSDsHHZ2itEwXvAC3jXC4wqJbnCrJhl0WTgjt8LBg/d
   gM+OuyEtBkxPmlppRG324HsWkFvVRoQfvKKKwzRLrAE1RBBK4iTX7fwYu
   x+LDhvS8Gy5Uox9BKdTzYE8U7Fq26fcz/C7g4VM11XHYEv8rmRXpEN8mn
   XLrJN7+Avl/TdoBxNl0QfdEQwf7LSjH3CTL2aSLtSVmbasNkZ2kALFxyY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437992298"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="437992298"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:12:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="802636120"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="802636120"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:12:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4F30F11FAE0;
        Fri, 11 Aug 2023 14:12:11 +0300 (EEST)
Date:   Fri, 11 Aug 2023 11:12:11 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 07/10] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <ZNYXiyqP84BpfMLG@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-8-sakari.ailus@linux.intel.com>
 <9d3f512c-69c6-3789-83af-d151acd58ebe@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d3f512c-69c6-3789-83af-d151acd58ebe@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the review.

On Tue, Aug 08, 2023 at 10:22:21AM +0200, Hans Verkuil wrote:
> On 08/08/2023 09:55, Sakari Ailus wrote:
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
> >  .../media/v4l/metafmt-generic.rst             | 331 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
> >  include/uapi/linux/videodev2.h                |   9 +
> >  4 files changed, 349 insertions(+)
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
> > index 000000000000..a27bfc721edf
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > @@ -0,0 +1,331 @@
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
> > +defined in an :ref:`internal source pad <MEDIA-PAD-FL-INTERNAL>` of the source
> > +sub-device. See also :ref:`source routes <v4l2-subdev-source-routes>`.
> > +
> > +.. _v4l2-meta-fmt-generic-8:
> > +
> > +V4L2_META_FMT_GENERIC_8
> > +-----------------------
> > +
> > +The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format.
> > +
> > +This format is also used on CSI-2 on both 8 bits per sample as well as on
> 
> on both 8 bits per sample as well as on ->
> for both 8 bits per sample as well as for
> 
> Same elsewhere.

There's another for 10 bits per sample, the usage is different elsewhere as
there is only a single bit depth in other cases. 

> 
> > +16 bits per sample when two bytes of metadata are packed into one sample.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_8.**
> > +Each cell is one byte. "M" denotes a byte of metadata.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +    * - start + 4:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-10:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_10
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > +byte of padding. The way the data is stored follows the CSI-2 specification.
> > +
> > +This format is also used on CSI-2 on 20 bits per sample format that packs two
> > +bytes of metadata into one sample.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> 
> I think you should document whether the padding is always 0 or can be any value.
> Perhaps 'X' is a better 'name' for the padding byte in the latter case.

I'll change these for v4.

> 
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +      - p
> > +    * - start + 5:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +      - p
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-12:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_12
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_12 contains packed 8-bit generic metadata, 12 bits
> > +for each 8 bits of data. Every four bytes of metadata is followed by two bytes
> > +of padding. The way the data is stored follows the CSI-2 specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +      - p
> > +      - p
> > +    * - start + 6:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +      - p
> > +      - p
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-14:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_14
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_14 contains packed 8-bit generic metadata, 14 bits
> > +for each 8 bits of data. Every four bytes of metadata is followed by three
> > +bytes of padding. The way the data is stored follows the CSI-2 specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +      - p
> > +      - p
> > +      - p
> > +    * - start + 7:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +      - p
> > +      - p
> > +      - p
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-16:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_16
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_16 contains packed 8-bit generic metadata, 16 bits
> > +for each 8 bits of data. Every byte of metadata is followed by one byte of
> > +padding. The way the data is stored follows the CSI-2 specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - p
> > +      - M\ :sub:`10`
> > +      - p
> > +      - M\ :sub:`20`
> > +      - p
> > +      - M\ :sub:`30`
> > +      - p
> > +    * - start + 8:
> > +      - M\ :sub:`01`
> > +      - p
> > +      - M\ :sub:`11`
> > +      - p
> > +      - M\ :sub:`21`
> > +      - p
> > +      - M\ :sub:`31`
> > +      - p
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-20:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_20
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_20 contains packed 8-bit generic metadata, 20 bits
> > +for each 8 bits of data. Every byte of metadata is followed by alternating one
> > +and two bytes of padding. The way the data is stored follows the CSI-2
> > +specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - p
> > +      - M\ :sub:`10`
> > +      - p
> > +      - p
> > +      - M\ :sub:`20`
> > +      - p
> > +      - M\ :sub:`30`
> > +      - p
> > +      - p
> > +    * - start + 10:
> > +      - M\ :sub:`01`
> > +      - p
> > +      - M\ :sub:`11`
> > +      - p
> > +      - p
> > +      - M\ :sub:`21`
> > +      - p
> > +      - M\ :sub:`31`
> > +      - p
> > +      - p
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-24:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_24
> > +-----------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_24 contains packed 8-bit generic metadata, 24 bits
> > +for each 8 bits of data. Every byte of metadata is followed by two bytes of
> > +padding. The way the data is stored follows the CSI-2 specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - p
> > +      - p
> > +      - M\ :sub:`10`
> > +      - p
> > +      - p
> > +      - M\ :sub:`20`
> > +      - p
> > +      - p
> > +      - M\ :sub:`30`
> > +      - p
> > +      - p
> > +    * - start + 12:
> > +      - M\ :sub:`01`
> > +      - p
> > +      - p
> > +      - M\ :sub:`11`
> > +      - p
> > +      - p
> > +      - M\ :sub:`21`
> > +      - p
> > +      - p
> > +      - M\ :sub:`31`
> > +      - p
> > +      - p
> > +
> > +.. _v4l2-meta-fmt-generic-csi2-2-24:
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_2_24
> > +-------------------------------
> > +
> > +V4L2_META_FMT_GENERIC_CSI2_2_24 contains packed 8-bit generic metadata, 24 bits
> > +for each two times 8 bits of data. Every two bytes of metadata are followed by
> > +one byte of padding. The way the data is stored follows the CSI-2
> > +specification.
> > +
> > +This format is little endian.
> > +
> > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_2_24.**
> > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > +
> > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths: 12 8 8 8 8 8 8
> > +
> > +    * - start + 0:
> > +      - M\ :sub:`00`
> > +      - M\ :sub:`10`
> > +      - p
> > +      - M\ :sub:`20`
> > +      - M\ :sub:`30`
> > +      - p
> > +    * - start + 6:
> > +      - M\ :sub:`01`
> > +      - M\ :sub:`11`
> > +      - p
> > +      - M\ :sub:`21`
> > +      - M\ :sub:`31`
> > +      - p
> > +
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index f4d9d6279094..fbbddc333a30 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1452,6 +1452,14 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
> >  	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
> >  	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> > +	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8b Generic Meta, 10b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8b Generic Meta, 12b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8b Generic Meta, 14b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8b Generic Meta, 16b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8b Generic Meta, 20b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8b Generic Meta, 24b CSI-2"; break;
> > +	case V4L2_META_FMT_GENERIC_CSI2_2_24:	descr = "2x8b Generic Meta, 24b CSI-2"; break;
> >  
> >  	default:
> >  		/* Compressed formats */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 78260e5d9985..b4284a564025 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -838,6 +838,15 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
> >  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
> >  
> > +#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_2_24	v4l2_fourcc('M', 'C', '2', 'O') /* 2 bytes of 8-bit metadata, 24-bit CSI-2 packed */
> > +
> >  /* priv field value to indicates that subsequent fields are valid. */
> >  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> >  
> 
> Regards,
> 
> 	Hans

-- 
Regards,

Sakari Ailus
