Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0486638BFF
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 15:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiKYOVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 09:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiKYOUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 09:20:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0AD233B0;
        Fri, 25 Nov 2022 06:20:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B8AC0B82AFB;
        Fri, 25 Nov 2022 14:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A4FC433C1;
        Fri, 25 Nov 2022 14:20:48 +0000 (UTC)
Message-ID: <a021fcb2-81f4-38bd-6958-4fca59738878@xs4all.nl>
Date:   Fri, 25 Nov 2022 15:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 1/8] media: uapi: ctrls: Add Time of Flight class
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
 <8819951fe1bb25501ab88e00bcf8e76734e97663.1669381013.git.vkh@melexis.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <8819951fe1bb25501ab88e00bcf8e76734e97663.1669381013.git.vkh@melexis.com>
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
> Define Time of Flight class controls.
> Also add most common TOF controls:
>  - phase sequence
>  - time integration
>  - frequency modulation
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> ---
>  include/uapi/linux/v4l2-controls.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index d27e255ed33b..a9ecfaa4252c 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -68,6 +68,7 @@
>  #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
>  #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
>  #define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
> +#define V4L2_CTRL_CLASS_TOF		0x00a60000	/* Time of light camera controls */

light -> flight

>  
>  /* User-class control IDs */
>  
> @@ -2782,6 +2783,13 @@ struct v4l2_ctrl_vp9_compressed_hdr {
>  	struct v4l2_vp9_mv_probs mv;
>  };
>  
> +#define V4L2_CID_TOF_CLASS_BASE		(V4L2_CTRL_CLASS_TOF | 0x900)
> +#define V4L2_CID_TOF_CLASS		(V4L2_CTRL_CLASS_TOF | 1)
> +
> +#define V4L2_CID_TOF_PHASE_SEQ		(V4L2_CID_TOF_CLASS_BASE + 0)
> +#define V4L2_CID_TOF_FMOD		(V4L2_CID_TOF_CLASS_BASE + 1)

I'd go for _FREQ_MOD

> +#define V4L2_CID_TOF_TINT		(V4L2_CID_TOF_CLASS_BASE + 2)

and _TIME_INTEGRATION

Regards,

	Hans

> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC

