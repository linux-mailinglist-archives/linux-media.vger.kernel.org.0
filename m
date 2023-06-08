Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9EFF727A87
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 10:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbjFHIzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 04:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbjFHIyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 04:54:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E05810EA
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 01:54:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 158C863CC0
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 08:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1B1C433D2;
        Thu,  8 Jun 2023 08:54:44 +0000 (UTC)
Message-ID: <7f9143e7-81c5-4b0f-aa4c-08178b9fcc65@xs4all.nl>
Date:   Thu, 8 Jun 2023 10:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 6/7] media: uapi: Add generic 8-bit metadata format
 definitions
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-7-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230505215257.60704-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2023 23:52, Sakari Ailus wrote:
> Generic 8-bit metadata formats define the in-memory data layout but not
> the format of the data itself. The reasoning for having such formats is to
> allow CSI-2 receiver drivers to receive and DMA drivers to write the data
> to memory without knowing a large number of device specific formats.
> 
> These formats may be used only in conjunction of a Media controller
> pipeline where the internal pad of the source sub-device defines the
> specific format of the data (using an mbus code).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/metafmt-generic.rst             | 317 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
>  include/uapi/linux/videodev2.h                |   9 +
>  4 files changed, 335 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 0bb61fc5bc00..919f595576b9 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -19,3 +19,4 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-vsp1-hgo
>      metafmt-vsp1-hgt
>      metafmt-vivid
> +    metafmt-generic
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> new file mode 100644
> index 000000000000..09d3fabb1e94
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> @@ -0,0 +1,317 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O'), V4L2_META_FMT_GENERIC_CSI2_2_24 ('MC2O')
> +**************************************************************************************************************************************************************************************************************************************************************************************************************************
> +
> +
> +Generic line-based metadata formats
> +
> +
> +Description
> +===========
> +
> +These generic line-based metadata formats define the memory layout of the data
> +without defining the format or meaning of the metadata itself. These formats may
> +only be used with a Media controller pipeline where the more specific format is
> +defined in an :ref:`internal source pad <MEDIA-PAD-FL-INTERNAL-SOURCE>` of the
> +source sub-device. See also :ref:`source routes <v4l2-subdev-source-routes>`.
> +
> +.. _v4l2-meta-fmt-generic-8:
> +
> +V4L2_META_FMT_GENERIC_8
> +-----------------------
> +
> +The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format whereas the
> +rest of the formats have CSI-2 packing that are typically used on camera sensors
> +in conjunction with pixel data of the same bit depth.

You keep referring to CSI-2 packing without ever defining it.

I'm not sure you should include CSI2 in the name either. It is OK to say something
here like: "The way the data is stored follows the CSI-2 specification."

But it is not limited to CSI-2 and can be used with other buses as well.

> +
> +This format is also used on CSI-2 on both 8 bits per sample as well as on
> +16 bits per sample when two bytes of metadata are packed into one sample.

Little or big endian?

Regards,

	Hans

> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_8.**
> +Each cell is one byte. "M" denotes a byte of metadata.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +    * - start + 4:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +
> +.. _v4l2-meta-fmt-generic-csi2-10:
> +
> +V4L2_META_FMT_GENERIC_CSI2_10
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_10 contains 8-bit generic metadata with CSI-2
> +packing, 10 bits for each 8 bits of data. Every four bytes of metadata is
> +followed by a single byte of padding.
> +
> +This format is also used on CSI2 on 20 bits per sample format that packs two
> +bytes of metadata into one sample.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
> +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +      - p
> +    * - start + 5:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +      - p
> +
> +.. _v4l2-meta-fmt-generic-csi2-12:
> +
> +V4L2_META_FMT_GENERIC_CSI2_12
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_12 contains 8-bit generic metadata with CSI-2
> +packing, 12 bits for each 8 bits of data. Every four bytes of metadata is
> +followed by two bytes of padding.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
> +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +      - p
> +      - p
> +    * - start + 6:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +      - p
> +      - p
> +
> +.. _v4l2-meta-fmt-generic-csi2-14:
> +
> +V4L2_META_FMT_GENERIC_CSI2_14
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_14 contains 8-bit generic metadata with CSI-2
> +packing, 14 bits for each 8 bits of data. Every four bytes of metadata is
> +followed by three bytes of padding.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
> +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +      - p
> +      - p
> +      - p
> +    * - start + 7:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +      - p
> +      - p
> +      - p
> +
> +.. _v4l2-meta-fmt-generic-csi2-16:
> +
> +V4L2_META_FMT_GENERIC_CSI2_16
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_16 contains 8-bit generic metadata with CSI-2
> +packing, 16 bits for each 8 bits of data. Every byte of metadata is
> +followed by one byte of padding.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
> +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - p
> +      - M\ :sub:`10`
> +      - p
> +      - M\ :sub:`20`
> +      - p
> +      - M\ :sub:`30`
> +      - p
> +    * - start + 8:
> +      - M\ :sub:`01`
> +      - p
> +      - M\ :sub:`11`
> +      - p
> +      - M\ :sub:`21`
> +      - p
> +      - M\ :sub:`31`
> +      - p
> +
> +.. _v4l2-meta-fmt-generic-csi2-20:
> +
> +V4L2_META_FMT_GENERIC_CSI2_20
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_20 contains 8-bit generic metadata with CSI-2
> +packing, 20 bits for each 8 bits of data. Every byte of metadata is followed by
> +alternating one and two bytes of padding.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
> +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - p
> +      - M\ :sub:`10`
> +      - p
> +      - p
> +      - M\ :sub:`20`
> +      - p
> +      - M\ :sub:`30`
> +      - p
> +      - p
> +    * - start + 10:
> +      - M\ :sub:`01`
> +      - p
> +      - M\ :sub:`11`
> +      - p
> +      - p
> +      - M\ :sub:`21`
> +      - p
> +      - M\ :sub:`31`
> +      - p
> +      - p
> +
> +.. _v4l2-meta-fmt-generic-csi2-24:
> +
> +V4L2_META_FMT_GENERIC_CSI2_24
> +-----------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_24 contains 8-bit generic metadata with CSI-2
> +packing, 24 bits for each 8 bits of data. Every byte of metadata is followed by
> +alternating one and two bytes of padding.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
> +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - p
> +      - p
> +      - M\ :sub:`10`
> +      - p
> +      - p
> +      - M\ :sub:`20`
> +      - p
> +      - p
> +      - M\ :sub:`30`
> +      - p
> +      - p
> +    * - start + 12:
> +      - M\ :sub:`01`
> +      - p
> +      - p
> +      - M\ :sub:`11`
> +      - p
> +      - p
> +      - M\ :sub:`21`
> +      - p
> +      - p
> +      - M\ :sub:`31`
> +      - p
> +      - p
> +
> +.. _v4l2-meta-fmt-generic-csi2-2-24:
> +
> +V4L2_META_FMT_GENERIC_CSI2_2_24
> +-------------------------------
> +
> +V4L2_META_FMT_GENERIC_CSI2_2_24 contains 8-bit generic metadata with CSI-2
> +packing, 24 bits for each two times 8 bits of data. Every two bytes of metadata
> +are followed by one byte of padding.
> +
> +**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_2_24.**
> +Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - M\ :sub:`00`
> +      - M\ :sub:`10`
> +      - p
> +      - M\ :sub:`20`
> +      - M\ :sub:`30`
> +      - p
> +    * - start + 6:
> +      - M\ :sub:`01`
> +      - M\ :sub:`11`
> +      - p
> +      - M\ :sub:`21`
> +      - M\ :sub:`31`
> +      - p
> +
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a858acea6547..7781b0bd3e7d 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1451,6 +1451,14 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> +	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8b Generic Meta, 10b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8b Generic Meta, 12b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8b Generic Meta, 14b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8b Generic Meta, 16b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8b Generic Meta, 20b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8b Generic Meta, 24b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_2_24:	descr = "2x8b Generic Meta, 24b CSI-2"; break;
>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index aee75eb9e686..adcbdc15dcdb 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -834,6 +834,15 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_2_24	v4l2_fourcc('M', 'C', '2', 'O') /* 2 bytes of 8-bit metadata, 24-bit CSI-2 packed */
> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>  

