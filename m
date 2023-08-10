Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE96777BF7
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 17:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbjHJPTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 11:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbjHJPTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 11:19:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEA890
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 08:19:08 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-14-125.net.vodafone.it [5.90.14.125])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F06974DE;
        Thu, 10 Aug 2023 17:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691680677;
        bh=UgvYwDS6K5Lgzs2wWPx5F6JnZjWTD34kvyxdVqjvGtw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u8Wtj3WZf9QrC9yLqsLg3rh0CWLlRPdp65mn4VzVUWiWQONFImcQ5TwZOXlN704hI
         hJclp0HDbiF7IC6VxVhRtbWGlwKwvloIuDsu1YR1s10omUgvQO0JD5NuUosk8QAchf
         PA9w+K0TXAFqf1IXfODqgb5vOMEqU3XDUiJ6XFh8=
Date:   Thu, 10 Aug 2023 17:19:02 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 05/10] media: uapi: Document which mbus format fields
 are valid for metadata
Message-ID: <xh5qpzbzamydaanlmfcqzlpwd7dfaawpxabsnejuoupsbx2yx7@dk3s6zuujtvf>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808075538.3043934-6-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, Aug 08, 2023 at 10:55:33AM +0300, Sakari Ailus wrote:
> Now that metadata mbus formats have been added, it is necessary to define
> which fields in struct v4l2_mbus_format are applicable to them (not many).
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/uapi/linux/v4l2-mediabus.h | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> index 6b07b73473b5..3cadb3b58b85 100644
> --- a/include/uapi/linux/v4l2-mediabus.h
> +++ b/include/uapi/linux/v4l2-mediabus.h
> @@ -19,12 +19,18 @@
>   * @width:	image width
>   * @height:	image height
>   * @code:	data format code (from enum v4l2_mbus_pixelcode)
> - * @field:	used interlacing type (from enum v4l2_field)
> - * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
> - * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> - * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
> - * @quantization: quantization of the data (from enum v4l2_quantization)
> - * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> + * @field:	used interlacing type (from enum v4l2_field), not applicable
> + *		to metadata mbus codes

"not applicable" is a bit geeric. Should this be set to
V4L2_FIELD_NONE (for metadata, and progressive image formats maybe ?)

> + * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
> + *		metadata mbus codes
> + * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
> + *		on metadata mbus codes
> + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
> + *		metadata mbus codes

Can this be zero ?

enum v4l2_hsv_encoding {

	/* Hue mapped to 0 - 179 */
	V4L2_HSV_ENC_180		= 128,

	/* Hue mapped to 0-255 */
	V4L2_HSV_ENC_256		= 129,
};

> + * @quantization: quantization of the data (from enum v4l2_quantization), zero
> + *		on metadata mbus codes
> + * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
> + *		on metadata mbus codes
>   * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
>   * @reserved:  reserved bytes that can be later used
>   */
> --
> 2.39.2
>
