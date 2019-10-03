Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1960EC9EF2
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730229AbfJCM6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:58:49 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:52069 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727911AbfJCM6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 08:58:48 -0400
Received: from [IPv6:2001:420:44c1:2577:6d0e:6b32:a8b6:66d9] ([IPv6:2001:420:44c1:2577:6d0e:6b32:a8b6:66d9])
        by smtp-cloud8.xs4all.net with ESMTPA
        id G0gti2lMXop0AG0gxi88yY; Thu, 03 Oct 2019 14:58:47 +0200
Subject: Re: [PATCH v2 1/2] v4l2-core: Add new metadata format
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <9439560a-dbc7-9aeb-a27b-314ace85dc81@xs4all.nl>
 <20191003110858.7120-1-bnvandana@gmail.com>
 <20191003110858.7120-2-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1916a903-fff7-3006-b070-78165eb9a8ad@xs4all.nl>
Date:   Thu, 3 Oct 2019 14:58:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003110858.7120-2-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOL+LEFlLdsFtSaRvdU2e72NEvACYamiI0GYbaj6a5O09/IBSMtXoGhth8qnwoQzzQnM9Su+na7l/22hgouJBtCmHKtsQGuCcC1O7V9th7JFFqBaGicJ
 jIbtSho+IZpu116//0lIq599eoWPtP3gxdQwgZMyFr8t65TKT1cs2SNKzf/SOltrhbJJ5cIv1ztuXQuLOYvHTaGFsVGVIZ+lKTnjtkJHNGFczRJb6fImvu/r
 9fEP6vyQAQTcSSzIe1D6rNQIjldr+id+zBv5PNKBjZopgKT55BKiepJZQZaVYiuyhu3XbEfc/h8G0pMMk75MkPlzX0xuo28p5tGryRDLEB1i1rbTqnaHalsq
 NCElGRPMpCu9+qA1F+9zkFfhf8M8xg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/3/19 1:08 PM, Vandana BN wrote:
> Add new metadata format to support metadata output in vivid.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 20b3107dd4e8..2753073cf340 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1340,6 +1340,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
> +	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..a82181e27c5a 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -755,6 +755,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +#define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>  
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> 

Still no documentation for this new metadata format!

Regards,

	Hans
