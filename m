Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040393AA47C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 21:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbhFPTpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 15:45:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33540 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFPTpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 15:45:32 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E3AEFC9;
        Wed, 16 Jun 2021 21:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623872604;
        bh=QoljJieeX9Img5iH6etn4VYAB35CsGHvhXyqcSxnf/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PdAYSdpajhvJ67PS/DO2g4G1f6efIlvp7BIcw9XGlCdgiZSXAncZWfA6azBtPDiHQ
         U2RRMD0Hi34EAN48XgW4Pvg6HN2AzUl0TfP7FTlLjsCJ8v5OnUC2MDBxEVUqMT7yFG
         AWSHfrhXb/vdbOI7Z7Bh7+XRqpiMWkoepvXqSDYI=
Date:   Wed, 16 Jun 2021 22:43:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: omap3isp: Extract struct group for memcpy() region
Message-ID: <YMpUR34kFSbiyi+q@pendragon.ideasonboard.com>
References: <20210616185938.1225218-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210616185938.1225218-1-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kees,

Thank you for the patch.

On Wed, Jun 16, 2021 at 11:59:38AM -0700, Kees Cook wrote:
> Avoid writing past the end of a structure member by wrapping the target
> region in a common named structure. This additionally fixes a
> misalignment of the copy (since the size of "buf" changes between 64-bit
> and 32-bit).

Could you have been mislead by the data64 name ? The difference between
omap3isp_stat_data_time and omap3isp_stat_data_time32 is the size of the
ts field, using 32-bit timestamps with legacy userspace, and 64-bit
timestamps with more recent userspace. In both cases we're dealing with
a 32-bit platform, as the omap3isp is not used in any 64-bit ARM SoC.
The size of void __user *buf is thus 4 bytes in all cases, as is __u32
buf.

> I actually think this code is completely unused in the real world:
> I don't think it could have ever worked, as it would either always
> fail (with an uninitialized data->buf_size) or would cause corruption
> in userspace due to the copy_to_user() in the call path against an
> uninitialized data->buf value:
> 
> omap3isp_stat_request_statistics_time32(...)
>     struct omap3isp_stat_data data64;
>     ...
>     omap3isp_stat_request_statistics(stat, &data64);
> 
> int omap3isp_stat_request_statistics(struct ispstat *stat,
>                                      struct omap3isp_stat_data *data)
>     ...
>     buf = isp_stat_buf_get(stat, data);
> 
> static struct ispstat_buffer *isp_stat_buf_get(struct ispstat *stat,
>                                                struct omap3isp_stat_data *data)
> ...
>     if (buf->buf_size > data->buf_size) {
>             ...
>             return ERR_PTR(-EINVAL);
>     }
>     ...
>     rval = copy_to_user(data->buf,
>                         buf->virt_addr,
>                         buf->buf_size);
> 
> Regardless, additionally initialize data64 to be zero-filled to avoid
> undefined behavior.
> 
> Fixes: 378e3f81cb56 ("media: omap3isp: support 64-bit version of omap3isp_stat_data")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/media/platform/omap3isp/ispstat.c |  5 +--
>  include/uapi/linux/omap3isp.h             | 44 +++++++++++++++++------
>  2 files changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
> index 5b9b57f4d9bf..ea8222fed38e 100644
> --- a/drivers/media/platform/omap3isp/ispstat.c
> +++ b/drivers/media/platform/omap3isp/ispstat.c
> @@ -512,7 +512,7 @@ int omap3isp_stat_request_statistics(struct ispstat *stat,
>  int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
>  					struct omap3isp_stat_data_time32 *data)
>  {
> -	struct omap3isp_stat_data data64;
> +	struct omap3isp_stat_data data64 = { };
>  	int ret;
>  
>  	ret = omap3isp_stat_request_statistics(stat, &data64);
> @@ -521,7 +521,8 @@ int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
>  
>  	data->ts.tv_sec = data64.ts.tv_sec;
>  	data->ts.tv_usec = data64.ts.tv_usec;
> -	memcpy(&data->buf, &data64.buf, sizeof(*data) - sizeof(data->ts));
> +	data->buf = (uintptr_t)data64.buf;
> +	memcpy(&data->frame, &data64.buf, sizeof(data->frame));
>  
>  	return 0;
>  }
> diff --git a/include/uapi/linux/omap3isp.h b/include/uapi/linux/omap3isp.h
> index 87b55755f4ff..0a16af91621f 100644
> --- a/include/uapi/linux/omap3isp.h
> +++ b/include/uapi/linux/omap3isp.h
> @@ -159,13 +159,25 @@ struct omap3isp_h3a_aewb_config {
>  };
>  
>  /**
> - * struct omap3isp_stat_data - Statistic data sent to or received from user
> - * @ts: Timestamp of returned framestats.
> - * @buf: Pointer to pass to user.
> + * struct omap3isp_stat_frame - Statistic data without timestamp nor pointer.
> + * @buf_size: Size of buffer.
>   * @frame_number: Frame number of requested stats.
>   * @cur_frame: Current frame number being processed.
>   * @config_counter: Number of the configuration associated with the data.
>   */
> +struct omap3isp_stat_frame {
> +	__u32 buf_size;
> +	__u16 frame_number;
> +	__u16 cur_frame;
> +	__u16 config_counter;
> +};
> +
> +/**
> + * struct omap3isp_stat_data - Statistic data sent to or received from user
> + * @ts: Timestamp of returned framestats.
> + * @buf: Pointer to pass to user.
> + * @frame: Statistic data for frame.
> + */
>  struct omap3isp_stat_data {
>  #ifdef __KERNEL__
>  	struct {
> @@ -176,10 +188,15 @@ struct omap3isp_stat_data {
>  	struct timeval ts;
>  #endif
>  	void __user *buf;
> -	__u32 buf_size;
> -	__u16 frame_number;
> -	__u16 cur_frame;
> -	__u16 config_counter;
> +	union {
> +		struct {
> +			__u32 buf_size;
> +			__u16 frame_number;
> +			__u16 cur_frame;
> +			__u16 config_counter;
> +		};
> +		struct omap3isp_stat_frame frame;
> +	};
>  };
>  
>  #ifdef __KERNEL__
> @@ -189,10 +206,15 @@ struct omap3isp_stat_data_time32 {
>  		__s32	tv_usec;
>  	} ts;
>  	__u32 buf;
> -	__u32 buf_size;
> -	__u16 frame_number;
> -	__u16 cur_frame;
> -	__u16 config_counter;
> +	union {
> +		struct {
> +			__u32 buf_size;
> +			__u16 frame_number;
> +			__u16 cur_frame;
> +			__u16 config_counter;
> +		};
> +		struct omap3isp_stat_frame frame;
> +	};
>  };
>  #endif
>  

-- 
Regards,

Laurent Pinchart
