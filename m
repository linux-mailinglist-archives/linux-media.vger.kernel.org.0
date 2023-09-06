Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE254793D67
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 15:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238177AbjIFNHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 09:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjIFNHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 09:07:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61234CC7
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 06:07:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8C3FDA8;
        Wed,  6 Sep 2023 15:05:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694005549;
        bh=khElIurWPz5qnt+WKeZwAXrH+P1ZWg3SzxhL878nYgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fJOvjj21zkr7XN80ber7tVZJcuxutNDRhuwdYqlWgV33eQPj9gZXsudmKh6opr0jQ
         juqbeFui+IwyKFzc54771jU000uTN5aSu/iNVrymoH7WmgKWCluUOBQIMAfOyOGMNO
         snd8YNt25/HY+/Oa3SOVVGCXWR4rKYCezV5MZB4Y=
Date:   Wed, 6 Sep 2023 16:07:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 07/10] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <20230906130729.GJ17308@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-8-sakari.ailus@linux.intel.com>
 <20230905165558.GD7971@pendragon.ideasonboard.com>
 <ZPho//Cib9DtXx0o@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPho//Cib9DtXx0o@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 06, 2023 at 11:56:47AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Tue, Sep 05, 2023 at 07:55:58PM +0300, Laurent Pinchart wrote:
> > On Tue, Aug 08, 2023 at 10:55:35AM +0300, Sakari Ailus wrote:
> > > Generic 8-bit metadata formats define the in-memory data layout but not
> > > the format of the data itself. The reasoning for having such formats is to
> > > allow CSI-2 receiver drivers to receive and DMA drivers to write the data
> > > to memory without knowing a large number of device specific formats.
> > > 
> > > These formats may be used only in conjunction of a Media controller
> > > pipeline where the internal pad of the source sub-device defines the
> > > specific format of the data (using an mbus code).
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
> > >  .../media/v4l/metafmt-generic.rst             | 331 ++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
> > >  include/uapi/linux/videodev2.h                |   9 +
> > >  4 files changed, 349 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > index 0bb61fc5bc00..919f595576b9 100644
> > > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > @@ -19,3 +19,4 @@ These formats are used for the :ref:`metadata` interface only.
> > >      metafmt-vsp1-hgo
> > >      metafmt-vsp1-hgt
> > >      metafmt-vivid
> > > +    metafmt-generic
> > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > > new file mode 100644
> > > index 000000000000..a27bfc721edf
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > > @@ -0,0 +1,331 @@
> > > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > > +
> > > +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> > > +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O'), V4L2_META_FMT_GENERIC_CSI2_2_24 ('MC2O')
> > > +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> > > +
> > > +
> > > +Generic line-based metadata formats
> > > +
> > > +
> > > +Description
> > > +===========
> > > +
> > > +These generic line-based metadata formats define the memory layout of the data
> > > +without defining the format or meaning of the metadata itself. These formats may
> > > +only be used with a Media controller pipeline where the more specific format is
> > > +defined in an :ref:`internal source pad <MEDIA-PAD-FL-INTERNAL>` of the source
> > > +sub-device. See also :ref:`source routes <v4l2-subdev-source-routes>`.
> > > +
> > > +.. _v4l2-meta-fmt-generic-8:
> > > +
> > > +V4L2_META_FMT_GENERIC_8
> > > +-----------------------
> > > +
> > > +The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format.
> > > +
> > > +This format is also used on CSI-2 on both 8 bits per sample as well as on
> > 
> > s/also on/by/
> > 
> > I would also mention "MIPI CCS" instead of "CSI-2".
> 
> If CCS were to be mentioned here, then all uses of this format should be
> included as well.
> 
> > > +16 bits per sample when two bytes of metadata are packed into one sample.
> > 
> > "bits per sample" is very ill-defined for metadata, as there's no
> > sample. I would write "for both the RAW8 packing and the 2 bytes RAW16
> > packing" or something similar.
> > 
> > Similar comments for below.
> 
> From CSI-2 bus point of view there's no difference between pixel and
> embedded data when it comes to encoding that data. "Sample" is the next
> best term beyond "pixel", as the bus can carry samples that may or may not
> be pixel data. But I'm fine with changing the wording if you think it makes
> it more understandable.

The CSI-2 specification doesn't seem to define any "sample" concept.

> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_8.**
> > > +Each cell is one byte. "M" denotes a byte of metadata.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +    * - start + 4:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-10:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_10
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
> > > +for each 8 bits of data. Every four bytes of metadata is followed by a single
> > > +byte of padding.
> > 
> > It sounds really weird to write that this format writes 10 bits for each
> > 8 bits of data, when essentially it adds a packing byte every four
> > bytes.
> 
> That's how the hardware has been implemented and probably there is a
> hardware implementation related reason for this.

I can imagine the specification has been designed to make it possible to
push embedded data and pixel data through the same serialization
hardware, but I can't tell if that's how hardware has been implemented.
Still, from an application point of view, when documenting pixel
formats, it sounds confusing. Can't we instead say that there's a 0x55
padding after every four bytes of data ?

> > > The way the data is stored follows the CSI-2 specification.
> > 
> > Again, it's CCS, not CSI-2.
> 
> The packing comes from CSI-2 but CCS adds padding. I'll add this
> information.
> 
> > > +
> > > +This format is also used on CSI-2 on 20 bits per sample format that packs two
> > > +bytes of metadata into one sample.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +      - p
> > > +    * - start + 5:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +      - p
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-12:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_12
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_12 contains packed 8-bit generic metadata, 12 bits
> > > +for each 8 bits of data. Every four bytes of metadata is followed by two bytes
> > > +of padding. The way the data is stored follows the CSI-2 specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +      - p
> > > +      - p
> > > +    * - start + 6:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +      - p
> > > +      - p
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-14:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_14
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_14 contains packed 8-bit generic metadata, 14 bits
> > > +for each 8 bits of data. Every four bytes of metadata is followed by three
> > > +bytes of padding. The way the data is stored follows the CSI-2 specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +      - p
> > > +      - p
> > > +      - p
> > > +    * - start + 7:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +      - p
> > > +      - p
> > > +      - p
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-16:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_16
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_16 contains packed 8-bit generic metadata, 16 bits
> > > +for each 8 bits of data. Every byte of metadata is followed by one byte of
> > > +padding. The way the data is stored follows the CSI-2 specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - p
> > > +      - M\ :sub:`10`
> > > +      - p
> > > +      - M\ :sub:`20`
> > > +      - p
> > > +      - M\ :sub:`30`
> > > +      - p
> > > +    * - start + 8:
> > > +      - M\ :sub:`01`
> > > +      - p
> > > +      - M\ :sub:`11`
> > > +      - p
> > > +      - M\ :sub:`21`
> > > +      - p
> > > +      - M\ :sub:`31`
> > > +      - p
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-20:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_20
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_20 contains packed 8-bit generic metadata, 20 bits
> > > +for each 8 bits of data. Every byte of metadata is followed by alternating one
> > > +and two bytes of padding. The way the data is stored follows the CSI-2
> > > +specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - p
> > > +      - M\ :sub:`10`
> > > +      - p
> > > +      - p
> > > +      - M\ :sub:`20`
> > > +      - p
> > > +      - M\ :sub:`30`
> > > +      - p
> > > +      - p
> > > +    * - start + 10:
> > > +      - M\ :sub:`01`
> > > +      - p
> > > +      - M\ :sub:`11`
> > > +      - p
> > > +      - p
> > > +      - M\ :sub:`21`
> > > +      - p
> > > +      - M\ :sub:`31`
> > > +      - p
> > > +      - p
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-24:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_24
> > > +-----------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_24 contains packed 8-bit generic metadata, 24 bits
> > > +for each 8 bits of data. Every byte of metadata is followed by two bytes of
> > > +padding. The way the data is stored follows the CSI-2 specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - p
> > > +      - p
> > > +      - M\ :sub:`10`
> > > +      - p
> > > +      - p
> > > +      - M\ :sub:`20`
> > > +      - p
> > > +      - p
> > > +      - M\ :sub:`30`
> > > +      - p
> > > +      - p
> > > +    * - start + 12:
> > > +      - M\ :sub:`01`
> > > +      - p
> > > +      - p
> > > +      - M\ :sub:`11`
> > > +      - p
> > > +      - p
> > > +      - M\ :sub:`21`
> > > +      - p
> > > +      - p
> > > +      - M\ :sub:`31`
> > > +      - p
> > > +      - p
> > > +
> > > +.. _v4l2-meta-fmt-generic-csi2-2-24:
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_2_24
> > > +-------------------------------
> > > +
> > > +V4L2_META_FMT_GENERIC_CSI2_2_24 contains packed 8-bit generic metadata, 24 bits
> > > +for each two times 8 bits of data. Every two bytes of metadata are followed by
> > > +one byte of padding. The way the data is stored follows the CSI-2
> > > +specification.
> > > +
> > > +This format is little endian.
> > > +
> > > +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_2_24.**
> > > +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> > > +
> > > +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths: 12 8 8 8 8 8 8
> > > +
> > > +    * - start + 0:
> > > +      - M\ :sub:`00`
> > > +      - M\ :sub:`10`
> > > +      - p
> > > +      - M\ :sub:`20`
> > > +      - M\ :sub:`30`
> > > +      - p
> > > +    * - start + 6:
> > > +      - M\ :sub:`01`
> > > +      - M\ :sub:`11`
> > > +      - p
> > > +      - M\ :sub:`21`
> > > +      - M\ :sub:`31`
> > > +      - p
> > > +
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index f4d9d6279094..fbbddc333a30 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1452,6 +1452,14 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >  	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
> > >  	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
> > >  	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> > > +	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8b Generic Meta, 10b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8b Generic Meta, 12b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8b Generic Meta, 14b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8b Generic Meta, 16b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8b Generic Meta, 20b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8b Generic Meta, 24b CSI-2"; break;
> > > +	case V4L2_META_FMT_GENERIC_CSI2_2_24:	descr = "2x8b Generic Meta, 24b CSI-2"; break;
> > >  
> > >  	default:
> > >  		/* Compressed formats */
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index 78260e5d9985..b4284a564025 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -838,6 +838,15 @@ struct v4l2_pix_format {
> > >  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
> > >  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
> > >  
> > > +#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> > > +#define V4L2_META_FMT_GENERIC_CSI2_2_24	v4l2_fourcc('M', 'C', '2', 'O') /* 2 bytes of 8-bit metadata, 24-bit CSI-2 packed */
> > > +
> > >  /* priv field value to indicates that subsequent fields are valid. */
> > >  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> > >  

-- 
Regards,

Laurent Pinchart
