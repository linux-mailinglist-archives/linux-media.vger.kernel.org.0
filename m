Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC5E2F2EBB
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 13:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732590AbhALMKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 07:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732067AbhALMKd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 07:10:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD283C061575;
        Tue, 12 Jan 2021 04:09:52 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EC053E;
        Tue, 12 Jan 2021 13:09:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610453391;
        bh=/lkGqww9BD+hFczUHYX7tCR5AwXbb4+oHjXj9qfw3hc=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=bAQg0hsGP0FMt3xwJnSS9YcPMT5repc5QccnN15U4Eda0LM6wHitwiiIo5bazQXi7
         lFcdRglT55cs21YJ6Ao3hsTbbp55kAPsPEQ45do0+zMO3PeXFMWnNbUfDpaAAVi6yO
         iANfpDD6R1dJuMSEeNJEzkt2ygx/S5EC3UUCMvv4=
Subject: Re: [PATCH 3/9] media: mtk-vcodec: Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-4-ribalda@chromium.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <d9a74387-fc20-5364-1903-bdcd97331bc7@ideasonboard.com>
Date:   Tue, 12 Jan 2021 12:09:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-4-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On 11/01/2021 14:54, Ricardo Ribalda wrote:
> Core code already clears reserved fields of struct
> v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
> v4l2_plane_pix_format reserved fields").
> 
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

There's also another memset.*reserved occurring in
  platform/mtk-vcodec/mtk_vcodec_enc.c: vidioc_enum_fmt()

While v4l2-core/v4l2-ioctl.c has:
> static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>                                 struct file *file, void *fh, void *arg)
> {
>         struct video_device *vdev = video_devdata(file);
>         struct v4l2_fmtdesc *p = arg;
>         int ret = check_fmt(file, p->type);
>         u32 mbus_code;
>         u32 cap_mask;
> 
>         if (ret)
>                 return ret;
>         ret = -EINVAL;
> 
>         if (!(vdev->device_caps & V4L2_CAP_IO_MC))
>                 p->mbus_code = 0;
> 
>         mbus_code = p->mbus_code;
>         CLEAR_AFTER_FIELD(p, type);

So would that mean ^^^ should also be sufficient to remove the need for
that memset?

With that fixed or resolved:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 5 -----
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 8 --------
>  2 files changed, 13 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index c768a587a944..d746c41ea805 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -715,12 +715,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>  		}
>  	}
>  
> -	for (i = 0; i < pix_fmt_mp->num_planes; i++)
> -		memset(&(pix_fmt_mp->plane_fmt[i].reserved[0]), 0x0,
> -			   sizeof(pix_fmt_mp->plane_fmt[0].reserved));
> -
>  	pix_fmt_mp->flags = 0;
> -	memset(&pix_fmt_mp->reserved, 0x0, sizeof(pix_fmt_mp->reserved));
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 21de1431cfcb..db1f62cc38b3 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -320,13 +320,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>  		}
>  	}
>  
> -	for (i = 0; i < pix_fmt_mp->num_planes; i++)
> -		memset(&(pix_fmt_mp->plane_fmt[i].reserved[0]), 0x0,
> -			   sizeof(pix_fmt_mp->plane_fmt[0].reserved));
> -
>  	pix_fmt_mp->flags = 0;
> -	memset(&pix_fmt_mp->reserved, 0x0,
> -		sizeof(pix_fmt_mp->reserved));
>  
>  	return 0;
>  }
> @@ -532,8 +526,6 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
>  	for (i = 0; i < pix->num_planes; i++) {
>  		pix->plane_fmt[i].bytesperline = q_data->bytesperline[i];
>  		pix->plane_fmt[i].sizeimage = q_data->sizeimage[i];
> -		memset(&(pix->plane_fmt[i].reserved[0]), 0x0,
> -		       sizeof(pix->plane_fmt[i].reserved));
>  	}
>  
>  	pix->flags = 0;
> 

