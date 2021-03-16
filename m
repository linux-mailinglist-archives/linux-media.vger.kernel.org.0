Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89CF33D2DC
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbhCPLVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:21:24 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36421 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231513AbhCPLVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:21:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M7kxl1V9v4ywlM7l1lAjQh; Tue, 16 Mar 2021 12:21:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615893663; bh=lFaMUIywMj08Hbt1FozVgRqYO6rwiY/lE/AH9dUNSMs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=f8BDJI3F+U8GXJ3LbYTiFrz0s/lRweaLzytT4JDOsWkfmwi51H3CKwclD7HrunML1
         ZYuAO1QIyWV136k96SYM/OL90Xae+oREnpQ23TgausR9R2b81vSd5YmKWFMRHJKUCH
         X0rhpOIMg7fD6dR0CtUM+CC+dzg0TMjZwcAmSGZ9dly/BcaG/AjVNc28eGCljqzRj1
         3IuKyIsMKVBd5s8XSNayuiXOiMNAoikke8U2HM3v8HooadvidDYFTjKBKB+PgcPyVz
         y8k/kkRv5G4rb20xlKJmctYBuIUe9XMCW8ipjvCShL5XqFgTzC0tixxdiAqxDOdDCw
         5Xglz5gVvSsUQ==
Subject: Re: [PATCH v4 04/11] media: uvcvideo: set error_idx to count on
 EACCESS
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210315173609.1547857-1-ribalda@chromium.org>
 <20210315173609.1547857-5-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a9e7df54-3b2e-0f95-1975-25c424eb6735@xs4all.nl>
Date:   Tue, 16 Mar 2021 12:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315173609.1547857-5-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAB64SNb/pmcOy6dZ23h1tW5Z8ljmjo3cF98zALcSf3w1m70/K+WATitKWtD14DuShh0MBSBMU1TcRF4VO51WC5rpJJ6lL8p052pcSXfASNFLo9gOSZC
 rCr1mIBdQx9x9sTaaC+UN4QlAA01lqOIFXUVTscPJqFgD6IhW5JZLbuOA4DEkbnvptbf5csIM0VIWRVSy5VVSWuT/s9hxeeH7IPjsn3S+kjHCrZMXrE6rjn0
 DAHSrWghWsJCWmnFwg1UHgpr3mSwgzC7ZrQLxfGPJpq3mmQZVgcvsjRplxqv3qad6gBwgvaC9WL9gTVLAypVkjTX2ig8RyAjXNZ7VkPetFGmFccQHotJdk6v
 CnmWkRIUExciIw76ZQY4y+IhvrXLjzH+9OW1ntQBb+T8J79uSmE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 18:36, Ricardo Ribalda wrote:
> If an error is found when validating the list of controls passed with
> VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
> indicate to userspace that no actual hardware was touched.
> 
> It would have been much nicer of course if error_idx could point to the
> control index that failed the validation, but sadly that's not how the
> API was designed.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 157310c0ca87..36eb48622d48 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1073,7 +1073,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  		ret = uvc_ctrl_get(chain, ctrl);
>  		if (ret < 0) {
>  			uvc_ctrl_rollback(handle);
> -			ctrls->error_idx = i;
> +			ctrls->error_idx = (ret == -EACCES) ?
> +						ctrls->count : i;

This isn't right.

For G_EXT_CTRLS error_idx should be set to either ctrls->count or the index of the
failing control depending on whether the hardware has been touched or not.

In the case of the 'if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {' the hardware
has not been touched, so there is should set error_idx to ctrls->count.

In the case where we obtain the actual values with uvc_ctrl_get() it must return
the index of the failing control.

According to the spec if VIDIOC_G_EXT_CTRLS returns an error and error_idx is equal
to the total count, then no hardware was touched, so it was during the validation
phase that some error was detected. If it returns an error and error_idx < count,
then the hardware was accessed and the contents of the controls at indices >= error_idx
is undefined.

So setting error_idx to i is the right thing to do, regardless of the EACCES test.

This does create a problem in v4l2-compliance, since it assumes that the control
framework is used, and that framework validates the control first in a separate step
before accessing the hardware. That's missing in uvc. I think v4l2-compliance should
be adjusted for uvcvideo since uvc isn't doing anything illegal by returning i here
since it really accessed hardware.

An alternative would be to introduce an initial validation phase in uvc_ioctl_g_ext_ctrls
as well, but I'm not sure that it worth the effort. It's quite difficult to get it really
right.

Relaxing the tests in v4l2-compliance for uvc is a better approach IMHO.

Or rewrite uvc to use the control framework :-) :-)

Regards,

	Hans

>  			return ret;
>  		}
>  	}
> 

