Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F9333EF87
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 12:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhCQL1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 07:27:18 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42103 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229960AbhCQL0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 07:26:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id MUK0lAQEAGEYcMUK4lNHS5; Wed, 17 Mar 2021 12:26:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615980404; bh=tKMGyrtMbTVpKdKsoeXx4G5qiS186E38tQtatRpyEKk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j67KMQt6ZunqZv2OAE4OE93zruftSrhAwoUP5Bsl43rAKiZ8QLvjAvWxI5xKnv0Di
         rXX56W/GTJbCP2jtMXvdgezXdlmjL8barE/qbgSLMrQxbDqJWXdaOMfeTCw9Srn7TM
         bil9vemy7GA8VCQo6iaKXWcJkbJXaz1uz2n/hiHKwfBcDK4kQd1dy2nESRxudputCM
         xdsIiWLtMA0A+hAohladRozCEOCdH07SF4PqOeQW7LyO4uWUj/0j5KK83PPggdr52o
         0LWckmbFlYgc2Ru2X7O51xYfgTDSoB/R8sXwO945nM0q2VyYTE9cT3AwL1bnGuAliq
         pE7/qpPNbBYbA==
Subject: Re: [PATCH v5 10/13] media: uvcvideo: Return -EACCES to inactive
 controls
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
References: <20210316180004.1605727-1-ribalda@chromium.org>
 <20210316180004.1605727-11-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <bf944318-3a20-e932-aaba-523025d19ad3@xs4all.nl>
Date:   Wed, 17 Mar 2021 12:26:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316180004.1605727-11-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDYhKn5a513HErxBRiwsJzg4qJhd3aWZSeoPXVNvhLHuDXZKL6RWL//9aFWwbrI+rFds5ijUDzOFjUj51P6UkGS02w/z6t/DpFlpCFCpEgbXsnrb+2Al
 VTquLjlfEBgl+8PMmDoemPNG/GR19F+n+wOvh2kq5MSchb5wpIHsn01jFeGItT1hxHJtluWgBfnr8Mp16McFVI4qRQWJSsEIKGP9c1CH5LhGXvStkjnTdZCr
 xT0KiAAIWRxot6ifZr8tvHqYf27TaFkJi+zbNH20Qz8Hlcmfwr6rzrj0A/hKZXBx/eMhVHawdCNSmuKT9yvQgAEMMjk2AbTeHwbFMw3iLmX1N6YojY+SafQu
 OyTemzZjt8GOBXZ0OxM25XFFUs0rxlsJqEkdG4rftsc3SzvZ0ZjhVl7xhNjj4bRnmz6kBP5QK84wqG5PrI0xaEP3QVf0Ipb6QbUj79VKSZupvq7hSpo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2021 19:00, Ricardo Ribalda wrote:
> If a control is inactive return -EACCES to let the userspace know that
> the value will not be applied automatically when the control is active
> again.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index ba14733db757..98614e1be829 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1578,6 +1578,18 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
>  	return mutex_lock_interruptible(&chain->ctrl_mutex) ? -ERESTARTSYS : 0;
>  }
>  
> +static bool uvc_ctrl_is_inactive(struct uvc_control *ctrl)

This doesn't test if the control is inactive, it tests if it *might* be
inactive. To test if it is really inactive would require checking the value
of the master control.

> +{
> +	struct uvc_control_mapping *map;
> +
> +	list_for_each_entry(map, &ctrl->info.mappings, list) {
> +		if (map->master_id)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  	struct uvc_entity *entity, int rollback)
>  {
> @@ -1621,8 +1633,11 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		ctrl->dirty = 0;
>  
> -		if (ret < 0)
> +		if (ret < 0) {
> +			if (uvc_ctrl_is_inactive(ctrl))
> +				return -EACCES;

So here you assume that if setting the control failed, and if the control
might be inactive, then it probably was inactive.

I feel a bit uncomfortable by this assumption.

Regards,

	Hans

>  			return ret;
> +		}
>  	}
>  
>  	return 0;
> 

