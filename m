Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F467BF6B5
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 11:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjJJJCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 05:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjJJJCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 05:02:32 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CD2A9
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 02:02:30 -0700 (PDT)
X-KPN-MessageId: bad3e69d-674b-11ee-abd3-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id bad3e69d-674b-11ee-abd3-005056999439;
        Tue, 10 Oct 2023 11:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=c53ccr8wRpEZkzKHt7o2M8COijahMHjvJeKdaywOk/c=;
        b=Dt3RRK3EnKnML4ibv6xpD+JGFKr+5u3NoBIfR7W8QxDQwIn+XdaqgFNZJGOUWVsBqM56aH0/dTp8H
         LnL7eudpS9FKv9+AwsGzsxaoCO5WYfkw9iXV6S/Fx+mg2wia8RCfZ88d7LPV/k0xVu1pfvFDjRfM04
         5W8mv5T7UQ4snVpxAZzFCMmHywUfyuP2tr30ITSLwvDzkCfEwjlP3AvzJFEbE1LACYRdHwlRpiMkR0
         DiimV0usApITHuKXY/GThvokm+E4LktHJWrmaYH6bEb2p6svFk/aCE4F0RHWJegfynkGiJn7J/HMIO
         FZbL3ETXHngwxEhxRfpjOrumvTmMPLg==
X-KPN-MID: 33|TyG1fv1hu0xJ7lxqCHuLHMDzzpSk1zAa2vNzKlMjY47q4oO0hy3rdqwBPKK353j
 GRKGW4gDp+t+FcloO91ZSmQ==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|Fm6xNyNPGTpPGwV2X/RKEtS2RSI8Y06gpvxbgeKWJ87pfQ4ZtDASeGfJA7dB2Ig
 Q6pjnOqTffl/7TFVA1yzo2g==
X-Originating-IP: 173.38.220.40
Received: from [10.47.78.242] (unknown [173.38.220.40])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id bcdd8830-674b-11ee-acaa-00505699d6e5;
        Tue, 10 Oct 2023 11:02:29 +0200 (CEST)
Message-ID: <dd76bcc1-b74c-4232-ba7f-a70db437a1db@xs4all.nl>
Date:   Tue, 10 Oct 2023 11:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>, linux-media@vger.Kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
References: <20230817072537.2837504-1-yunkec@google.com>
 <20230817072537.2837504-2-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230817072537.2837504-2-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/17/23 09:25, Yunke Cao wrote:
> Tested with VIVID
> 
>  ./v4l2-ctl -C rect -d 0
> rect: 300x400@200x100
> 
>  ./v4l2-ctl -c rect=1000x2000@0x0
>  ./v4l2-ctl -C rect -d 0
> rect: 1000x2000@0x0
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  include/linux/videodev2.h          |  2 ++
>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index c19441a1..a27ea755 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -1776,6 +1776,7 @@ struct v4l2_ext_control {
>  		struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>  		struct v4l2_ctrl_hevc_scaling_matrix *p_hevc_scaling_matrix;
>  		struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> +		struct v4l2_rect *p_rect;
>  		void *ptr;
>  	};
>  } __attribute__ ((packed));
> @@ -1818,6 +1819,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
>  	V4L2_CTRL_TYPE_AREA          = 0x0106,
> +	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>  
>  	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
>  	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,

Keep this as a separate patch. This won't be merged, instead we periodically
sync the public headers in v4l-utils from the latest kernel.

> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index a1cc93c8..07d2e34b 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -516,6 +516,13 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>  		case V4L2_CTRL_TYPE_AREA:
>  			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>  			break;
> +		case V4L2_CTRL_TYPE_RECT:
> +			printf("%ux%u@%dx%d",
> +			       ctrl.p_rect->width,
> +			       ctrl.p_rect->height,
> +			       ctrl.p_rect->left,
> +			       ctrl.p_rect->top);

Just keep this on one or two lines.

> +			break;
>  		default:
>  			printf("unsupported payload type");
>  			break;
> @@ -604,6 +611,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>  	case V4L2_CTRL_TYPE_AREA:
>  		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>  		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
> +		break;
>  	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>  		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>  		break;
> @@ -1157,6 +1167,11 @@ void common_set(cv4l_fd &_fd)
>  					sscanf(set_ctrl.second.c_str(), "%ux%u",
>  					       &ctrl.p_area->width, &ctrl.p_area->height);
>  					break;
> +				case V4L2_CTRL_TYPE_RECT:
> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
> +					break;
>  				default:
>  					fprintf(stderr, "%s: unsupported payload type\n",
>  							qc.name);

Looks good otherwise.

Regards,

	Hans
