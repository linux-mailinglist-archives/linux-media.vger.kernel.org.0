Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D855C338671
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 08:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhCLHOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 02:14:32 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46635 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230117AbhCLHOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 02:14:18 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Kbzxly0zJ4ywlKc01l2HU8; Fri, 12 Mar 2021 08:14:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615533257; bh=6g8+gSQAaWLcIbnVturWejzKHRu+EMHJHcj4Rrs6MQY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SPjEccPjjcFOym3cQtnOZW1FpGn1QLaa07VmeXZIDSc0hVK1zkF4pupAXgq4FtsMm
         4nLpLBKGC7/6stTzA+5mLABWcYlkffJFi/t6r8nd895/bTynN8dZ5+hknQdgXi+hjX
         IRlM759PFNqrHfTSYHWlwvbAiY0mCXsYEKkc4GPmays6XxY65qSOmJO74ME+TbCCn9
         oVHTP/hPKtujxGi2aDWrBxJKsRxpBY92iZ+6cKlIPbK8HGUYXeOmsRGoouTA9mL/RJ
         4wRjQHX0iaX6ac7XSa6R67UXXoTwubQJnAUTNezeFvq3rqxShH5z8yBDvSSmJMFQZP
         Sr8h0rcmI3ajg==
Subject: Re: [PATCH v2 4/6] media: uvcvideo: set error_idx to count on EACCESS
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-5-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e5860193-a672-96b8-9a40-5f6d77dd4783@xs4all.nl>
Date:   Fri, 12 Mar 2021 08:14:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311221946.1319924-5-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBZzqdDzjyRDk1lRka82kKwyyuO9An12q7n1wGtk+9NL5VC9wGLf2H45S8/y6icaPwcCJufVWHCS0lvDCoUcqROC/1IkAjih+vDOSgtuxV95wk6X25he
 PJ9U4ipe9O5irnjntIxHJy6wgkadOZPgjCSpGVCTeKAD9j+uDMEMApLnwartvHWjauADM8aL9LTJvJ9pv/vpfWvHAf6J4pktJG72medV4ReKv872JvuGQt2m
 I57XOvVYB4B2yp7NWQ+NoFvGIhsJMBkmvteqBDDYdu6w82bQuFR9upsQ3Np9+SbMS4Kqx20t3spGXTMOyVopU0QszDpbWwz6wdjp5Va/5+fm90d0BuGjJiji
 /IycTNS5lenqKiRHK3eyJ5TbPMNGR343nasOW3zSNBzZpDoiLf9A9olssoUQPI7TJYLCI2NF
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 23:19, Ricardo Ribalda wrote:
> According to the doc:
> The, in hindsight quite poor, solution for that is to set error_idx to
> count if the validation failed.

I think this needs a bit more explanation. How about this:

"If an error is found when validating the list of controls passed with
VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to indicate
to userspace that no actual hardware was touched.

It would have been much nicer of course if error_idx could point to the
control index that failed the validation, but sadly that's not how the
API was designed."

> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

After improving the commit log you can add my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

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
>  			return ret;
>  		}
>  	}
> 

