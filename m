Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 317D4F1042
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 08:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729958AbfKFHaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 02:30:03 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41429 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729683AbfKFHaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 02:30:03 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id SFlDilsww9P9bSFlIicPA8; Wed, 06 Nov 2019 08:29:59 +0100
Subject: Re: [PATCH] pvrusb2: Fix oops on tear-down when radio support is not
 present
To:     Mike Isely at pobox <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <alpine.DEB.2.21.1911052034300.31133@sheridan.isely.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5491a24e-e41a-5d11-7ac5-6d6804989550@xs4all.nl>
Date:   Wed, 6 Nov 2019 08:29:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911052034300.31133@sheridan.isely.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGdfI3TDc2NnorQhQx1V7ZhhxNM81FDJQyN21HuildDLKPJOTVsc9LUUqFTVP3+AMxz6oCZYX3cFQJBUY/2zRp4zKjJn+BBGBOYSDUap+uYf0Lzg1Mir
 Bi4TBoMBEFUZiIbfYb+gF+EVVqcIfw5EidYYZRPrU1OvMoRNOWbty8ePG1YIQFQu9FsRvNxCQcUvgy4x87lzIV7Bng3VKVfwKbRLO7zWNj3OHRp6THWLeiaY
 VIkBU9fmupzaS3kWCUmFdxgjtnbVJAxmW/MKWeVjfN0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mike,

For some reason your mailer didn't include a "From:" line, only a "Reply-To:"
line. This means that the patch authorship is not detected by patchwork and
git. Can you repost with a valid From: line in the email header?

Thanks!

	Hans

On 11/6/19 3:36 AM,  wrote:
> In some device configurations there's no radio or radio support in the
> driver.  That's OK, as the driver sets itself up accordingly.  However
> on tear-down in these caes it's still trying to tear down radio
> related context when there isn't anything there, leading to
> dereferences through a null pointer and chaos follows.
> 
> How this bug survived unfixed for 11 years in the pvrusb2 driver is a
> mystery to me.
> 
> Signed-off-by: Mike Isely <isely@pobox.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> index aa4fbc3e88cc..339119f6cc23 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> @@ -909,8 +909,12 @@ static void pvr2_v4l2_internal_check(struct pvr2_channel *chp)
>  	pvr2_v4l2_dev_disassociate_parent(vp->dev_video);
>  	pvr2_v4l2_dev_disassociate_parent(vp->dev_radio);
>  	if (!list_empty(&vp->dev_video->devbase.fh_list) ||
> -	    !list_empty(&vp->dev_radio->devbase.fh_list))
> +	    ((vp->dev_radio != NULL) &&
> +	     !list_empty(&vp->dev_radio->devbase.fh_list))) {
> +		pvr2_trace(PVR2_TRACE_STRUCT,
> +			   "pvr2_v4l2 internal_check exit-empty id=%p", vp);
>  		return;
> +	}
>  	pvr2_v4l2_destroy_no_lock(vp);
>  }
>  
> @@ -946,7 +950,8 @@ static int pvr2_v4l2_release(struct file *file)
>  	kfree(fhp);
>  	if (vp->channel.mc_head->disconnect_flag &&
>  	    list_empty(&vp->dev_video->devbase.fh_list) &&
> -	    list_empty(&vp->dev_radio->devbase.fh_list)) {
> +	    ((vp->dev_radio == NULL) ||
> +	     list_empty(&vp->dev_radio->devbase.fh_list))) {
>  		pvr2_v4l2_destroy_no_lock(vp);
>  	}
>  	return 0;
> 

