Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173BD792F61
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 21:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239775AbjIET5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 15:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242370AbjIET5c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 15:57:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F2C9C
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 12:57:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C83D3D8B;
        Tue,  5 Sep 2023 19:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693934636;
        bh=Hyrud7yzPo7GujY0Dh/WL5Fw5baoeRw1FvwAGCarspI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kwRPKYrjmne+9L995+3Jj94fL6A/GmlimjgkLblLFU+W91Sbq7yETd5GtYYfzI83V
         DDlK3RzXhFj3lIs3wzPBxnNXgswf9TuegPpGyLFKQgXpv6yQhmRy0GvDzYId+wH9eF
         rlFOm5itssfmOrLlyBXChnU7AeOOmnWo3Z2VVMzs=
Date:   Tue, 5 Sep 2023 20:25:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 09/10] media: Add media bus codes for MIPI CCS
 embedded data
Message-ID: <20230905172535.GI7971@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-10-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808075538.3043934-10-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Aug 08, 2023 at 10:55:37AM +0300, Sakari Ailus wrote:
> Add new MIPI CCS embedded data media bus formats.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 32 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         | 10 +++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index c615da08502d..5d5407738af9 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8491,3 +8491,35 @@ and finally the bit number in subscript. "p" indicates a padding bit.
>        - p
>        - p
>        - p
> +
> +MIPI CCS Embedded Data Formats
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines an

s/an$/a/

> +metadata format for sensor embedded data, which is used to store the register
> +configuration used for capturing a given frame. The format is defined in the CCS
> +specification.

Strictly speaking, the MIPI CCS embedded data format specifies not just
the data packing (insertion of padding bytes) and the data encoding (the
data format byte and the tag codes), but also the register addresses and
values that are reported in the embedded data. Do you envision the media
bus formats defined here as being applicable to sensors that use the
same packing and encoding as CCS, but different registers, or only to
fully compliant CCS sensors ?

> +
> +The bit depth of the CCS embedded data matches the pixel data bit depth
> +configured on the sensor. The formats used and their corresponding generic
> +formats are listed in the table below.
> +
> +.. flat-table: CCS embedded data mbus formats and corresponding generic formats
> +    :header-rows: 1
> +
> +    * - CCS embedded data mbus format
> +      - Generic metadata format
> +    * - MEDIA_BUS_FMT_CCS_EMBEDDED_8
> +      - MEDIA_BUS_FMT_META_8
> +    * - MEDIA_BUS_FMT_CCS_EMBEDDED_10
> +      - MEDIA_BUS_FMT_META_10
> +    * - MEDIA_BUS_FMT_CCS_EMBEDDED_12
> +      - MEDIA_BUS_FMT_META_12
> +    * - MEDIA_BUS_FMT_CCS_EMBEDDED_14
> +      - MEDIA_BUS_FMT_META_14
> +    * - MEDIA_BUS_FMT_CCS_EMBEDDED_16
> +      - MEDIA_BUS_FMT_META_16
> +    * - MEDIA_BUS_FMT_CCS_EMBEDDED_20
> +      - MEDIA_BUS_FMT_META_20
> +    * - MEDIA_BUS_FMT_CCS_EMBEDDED_24
> +      - MEDIA_BUS_FMT_META_24
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 2486b4178c5f..31d532446b23 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -182,7 +182,15 @@
>  #define MEDIA_BUS_FMT_META_20			0x8006
>  #define MEDIA_BUS_FMT_META_24			0x8007
>  
> +/* Specific metadata formats. Next is 0x9008. */
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED_8		0x9001
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED_10		0x9002
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED_12		0x9003
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED_14		0x9004
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED_16		0x9005
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED_20		0x9006
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED_24		0x9007
> +
>  #define MEDIA_BUS_FMT_IS_META(code)		\
>  	((code) & 0xf000 == 0x7000 || (code) & 0xf000 == 0x8000)
> -
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart
