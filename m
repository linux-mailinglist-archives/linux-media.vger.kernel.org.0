Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41DD2638C06
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 15:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiKYOWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 09:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiKYOWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 09:22:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7A223385;
        Fri, 25 Nov 2022 06:22:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BD29DB82AFB;
        Fri, 25 Nov 2022 14:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCE9C433C1;
        Fri, 25 Nov 2022 14:22:17 +0000 (UTC)
Message-ID: <29a4cc81-f43c-71a6-25f1-23234d7041e0@xs4all.nl>
Date:   Fri, 25 Nov 2022 15:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/8] media: v4l: ctrls: Fill V4L2_CID_TOF_CLASS
 controls
Content-Language: en-US
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <d3fb74f580865c972877047f95cb65b65e773837.1669381013.git.vkh@melexis.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <d3fb74f580865c972877047f95cb65b65e773837.1669381013.git.vkh@melexis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> Define names, flags and types of TOF controls. *dims* is driver specific.
> It also means, that it is not possible to use new_std for arrays.
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 564fedee2c88..1135d33c1baa 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1196,6 +1196,13 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
>  	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
> +
> +	/* Time of light camera controls */
> +	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> +	case V4L2_CID_TOF_CLASS:	return "Time of light Camera Controls";

light -> Flight

> +	case V4L2_CID_TOF_PHASE_SEQ:	return "TOF phase sequence";

Capitalize, so: "TOF Phase Sequence"

> +	case V4L2_CID_TOF_FMOD:		return "TOF frequency modulation";

"TOF Frequency Modulation"

> +	case V4L2_CID_TOF_TINT:		return "TOF time integration";

"TOF Time Integration"

>  	default:
>  		return NULL;
>  	}
> @@ -1403,6 +1410,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_DETECT_CLASS:
>  	case V4L2_CID_CODEC_STATELESS_CLASS:
>  	case V4L2_CID_COLORIMETRY_CLASS:
> +	case V4L2_CID_TOF_CLASS:
>  		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
>  		/* You can neither read nor write these */
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
> @@ -1541,6 +1549,18 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>  		break;
> +	case V4L2_CID_TOF_PHASE_SEQ:
> +		*type = V4L2_CTRL_TYPE_U16;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> +	case V4L2_CID_TOF_FMOD:
> +		*type = V4L2_CTRL_TYPE_U8;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> +	case V4L2_CID_TOF_TINT:
> +		*type = V4L2_CTRL_TYPE_U16;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;

Regards,

	Hans
