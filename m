Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D571845FD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgCMLb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:31:27 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51113 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbgCMLb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:31:27 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CiXBj27JchVf8CiXEjObB6; Fri, 13 Mar 2020 12:31:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584099085; bh=RqFft5VEIH6IZbrvJuRxVJzYe3kWZaUPl+dtOxSgqGI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=H6EmHfKhukT5kXEeK7fwSTHsWno3x9kB3XnGLovMgTe230yzeXg4LxScMiIxsKqtc
         FcEJgPK4XRuqRCL6QVilLadEEDfs6k2zM7la8ZRSqsccMZisJ0v8Oj0RzZqeCXHrd9
         M8ViOv7oLFvd23zNXjCnTcIHlZMRYdCcwH9zcOu8W2TMrjx3a5YEtunQxpmyUHynGo
         MqCvl+OdNwFhGUnxLvWulZfxIS5MCXQZYxyopHZQpNpIgEpWqVwBLPj6q0oxyhZ7ya
         JH18bVajBSu5igh9fX555qRD5LNOWhszykgRumCaleggMCUhScje0wolzUAEUVd9xG
         PYWt9bhC16siA==
Subject: Re: [PATCH] media: qcom: venus: Fix a possible null-pointer
 dereference in vdec_g_fmt()
To:     Jia-Ju Bai <baijiaju1990@gmail.com>, stanimir.varbanov@linaro.org,
        agross@kernel.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190727091547.11674-1-baijiaju1990@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0c24a860-7bd7-4f25-3ccf-4c88bdff34c2@xs4all.nl>
Date:   Fri, 13 Mar 2020 12:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20190727091547.11674-1-baijiaju1990@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOVaX+hSZFFa2zv5ki43vKjqzxomfvC5iitQG0aK2D+4Vpl1X98UEtAfe2CH89VnpbxZ4KVuvHaW/n8jTwFo5gty0BvOcxcBsh/aobBz5p0V0u7XvhNV
 dApJB0cfsLCUW8ekwFGUBTQ1n73kmFD7YhZLpG8TIE1sYKlHFdMiER5gU4eu0MtaA78n/6O3axt3Lyk7EiSrFoYHMmclH/c44siGstjRnA7BRmCLtwpiLkpr
 TdIqnl/ufiXPD6RgkSp0j4/Vy1ROHK5uvEaNVCZhrOG6ndNoWPPfCoSCgCISo5A0uCsxAYESlwYsfS7wC8fKJ5U/CrNu4lYFMcM2/ZV0+Z8S2CCIELWvRoAj
 1NasPwyIFqRpeTNMUBk00mAQfGi193BeSfjN1m8fOsu9SVDFw1M=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fell between the cracks, but while cleaning up patchwork
it popped up again :-)

On 7/27/19 11:15 AM, Jia-Ju Bai wrote:
> In vdec_g_fmt(), fmt is firstly assigned NULL, and it could be never
> assigned before being used on line 223:
>     pixmp->pixelformat = fmt->pixfmt;
> 
> Thus, a possible null-pointer dereference may occur.
> 
> To fix this bug, fmt is checked before being used here.

Actually, this function can only be called for f->type values
V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE or V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE.

The easiest way to fix this is to replace this:

        if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
                fmt = inst->fmt_cap;
        else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
                fmt = inst->fmt_out;

by:

        if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
                fmt = inst->fmt_cap;
        else
                fmt = inst->fmt_out;

And the same in a bit lower down in this function.

Regards,

	Hans

> 
> This bug is found by a static analysis tool STCheck written by us.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index e1f998656c07..12c31551f191 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -211,7 +211,8 @@ static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  		inst->height = format.fmt.pix_mp.height;
>  	}
>  
> -	pixmp->pixelformat = fmt->pixfmt;
> +	if (fmt)
> +		pixmp->pixelformat = fmt->pixfmt;
>  
>  	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>  		pixmp->width = inst->width;
> 

