Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17D57B9EC8
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjJEOMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjJEOK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:10:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9BC24E8F
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 04:28:25 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF6EE552;
        Thu,  5 Oct 2023 13:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696505197;
        bh=Z4bMHRirZ1ZHmdWqutvtALlN2ehtveJtB78fXvV0p6w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sTP+Rlau0OHrVyWk9uw6j6XcI/KGF3Zq4XzaMzK0veVzMXXw/r/ycSTcBEoGmc4hS
         ehV63Uz7yU7A+YPilm3SAXPxzKNq9R5fwQvbG0JeqIC7kpbMcetmQcgFr5b/JZgM1n
         HLbeSUFxAXfxTMVnxZ078Zv9QjmTaguirn7hCfZA=
Message-ID: <4b604381-49af-be89-65dd-d8898a3b6a00@ideasonboard.com>
Date:   Thu, 5 Oct 2023 14:28:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 03/28] media: uapi: Document which mbus format fields
 are valid for metadata
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-4-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20231003115237.76828-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/10/2023 14:52, Sakari Ailus wrote:
> Now that metadata mbus formats have been added, it is necessary to define
> which fields in struct v4l2_mbus_format are applicable to them (not many).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   include/uapi/linux/v4l2-mediabus.h | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> index 6b07b73473b5..3cadb3b58b85 100644
> --- a/include/uapi/linux/v4l2-mediabus.h
> +++ b/include/uapi/linux/v4l2-mediabus.h
> @@ -19,12 +19,18 @@
>    * @width:	image width
>    * @height:	image height
>    * @code:	data format code (from enum v4l2_mbus_pixelcode)
> - * @field:	used interlacing type (from enum v4l2_field)
> - * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
> - * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> - * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
> - * @quantization: quantization of the data (from enum v4l2_quantization)
> - * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> + * @field:	used interlacing type (from enum v4l2_field), not applicable
> + *		to metadata mbus codes

This one does say "zero", like the others do. Is that on purpose? 
Annoyingly V4L2_FIELD_NONE is 1, not 0, but perhaps zeroing this would 
still be best?

> + * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
> + *		metadata mbus codes
> + * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
> + *		on metadata mbus codes
> + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
> + *		metadata mbus codes
> + * @quantization: quantization of the data (from enum v4l2_quantization), zero
> + *		on metadata mbus codes
> + * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
> + *		on metadata mbus codes
>    * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
>    * @reserved:  reserved bytes that can be later used
>    */

