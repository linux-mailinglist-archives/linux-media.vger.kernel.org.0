Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7B2C98F2
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 09:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfJCHXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 03:23:18 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60031 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725613AbfJCHXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 03:23:18 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id FvSCiGpRGJQzFFvSGi8yUd; Thu, 03 Oct 2019 09:23:16 +0200
Subject: Re: [PATCH 1/2] v4l2-core: Add new metadata format
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20191003071856.23664-1-bnvandana@gmail.com>
 <20191003071856.23664-2-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5a95f800-c1b2-409e-0739-b65bc0bc451d@xs4all.nl>
Date:   Thu, 3 Oct 2019 09:23:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003071856.23664-2-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN8jlCJf8IFszDXKHGQHv4YnplSgrR+woj13w5ISvIEkw0dUNIAieDsqAN08QgJOTEYEwNNZfRAIttrbSAU4xn+c8pAiT5fOMXbPeyOUquEgtkgKJIvz
 QtksaeL2f7L1dnRBs/h6p0Q6slf4Vwa9UknA622U1aqpsoyLiRh58To0zsEB9mj/r2ON21LtA2R2ZaUAG4iNliQzgQkOLxtR9xBSR68ef498Yya4YB9zwmJQ
 vUFy12d/fafCJsfghVPxnqcF14i9DCVsmG1Is32x62U=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/3/19 9:18 AM, Vandana BN wrote:
> Add new metadata format to support metadata output in vivid.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 20b3107dd4e8..34c1a2bd7f28 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1340,6 +1340,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
> +	case V4L2_META_FMT_VIVID:       descr = "Vivid Output Metadata"; break;
>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..a32335fcd064 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -755,6 +755,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +#define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Output Metadata */
>  
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> 

This format needs to be documented in a Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst file.

It would be nice if vivid would also support this metadata format for metadata capture.
Something for a follow-up patch.

Regards,

	Hans
