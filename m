Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51AC355031
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 11:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236786AbhDFJij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 05:38:39 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45647 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232650AbhDFJih (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 05:38:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TiADl44YD43ycTiAGlNPD7; Tue, 06 Apr 2021 11:38:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617701909; bh=3dsMqlS1G5ayIjWOfmxUdLppiavjULJfqJxvJXi/QxM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Xo9n8slwo6qpsx7R5kjOGGIf/2z1St8sm4NtN9UT63wOnjXpetx3ZTUt0Jtrab4ih
         KGj1y91+jJN8Dg+N7A2IYR9G+K5053ApSw4HUFcjfP3tJ0KTYsHwl9pW1RIZWXQtnq
         YjsIFddm+hQ4/HtSAQec9+WOz1ZJ8WTpLk8PeGalVG/HuvKuEhOSzdg1G4byKhNXfg
         hNI9gQkiqP8pSwZV6yR45Cofnem9biDtj1EQ5r89X02OeaSMZMQuPYvuBIKHoR+DPl
         /tPeu4ATVKoTVZzIK+mJhtOJXBaODgTAeW8zpT9a0SnaWk9XX3h7wjhScThzirSXHo
         h+xTNePt24KhA==
Subject: Re: [PATCH] media: pvrusb2: fix warning in pvr2_i2c_core_done
To:     Anirudh Rayabharam <mail@anirudhrb.com>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     gregkh@linuxfoundation.org,
        syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401123338.3937-1-mail@anirudhrb.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b81e4612-dde3-d6e5-e647-b61c7c3501da@xs4all.nl>
Date:   Tue, 6 Apr 2021 11:38:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401123338.3937-1-mail@anirudhrb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLjV1wEbijLYUgNiBLSvJWe1Xmr0vs5gkCLNHBwveJrZKMcbdwFtZDECMPwytKHgu2DLSbc0dQTxEY4v4mc2JLKNtaQ4/IeI1dneAAuM9jMUa0xLS8lj
 q6ZBwavUFtUsR/u/SD+No714QEks+hIEY+apMhK+oNaQhmz1RGBbCOZv5pAoJScgMNd5E76g/qg6PKGHGP9r59uCojUWxqtCUmfZ70I0pP6DTuyIl8boryVy
 88cxOkK8FeKkc2gRdysbTwFvAQw+8nZ8rmxBZfNM8qIbp2CEg5Y3bGq7uXv8xi1GEN72bL+uKR2VOErNg5J8Wx00NdwPZ2ns9TIKV0lWY2RRM3JjJwBamWCL
 wsbeFQarVZHdybZxXrossLbTi9PusMRWXvr6abc3qHjLHtfeev1mKLOKgK3X8ZVqR5gjb/pq4LqrRk4Uwh5xc4oisCi3vw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 14:33, Anirudh Rayabharam wrote:
> syzbot has reported the following warning in pvr2_i2c_done:
> 
> 	sysfs group 'power' not found for kobject '1-0043'
> 
> When the device is disconnected (pvr_hdw_disconnect), the i2c adapter is
> not unregistered along with the USB and vl42 teardown. As part of the

vl42 -> v4l2

> USB device disconnect, the sysfs files of the subdevices are also
> deleted. So, by the time pvr_i2c_core_done is called by
> pvr_context_destroy, the sysfs files have been deleted.
> 
> To fix this, unregister the i2c adapter too in pvr_hdw_disconnect. Make
> the device deregistration code shared by calling pvr_hdw_disconnect from
> pvr2_hdw_destory.

destory -> destroy

> 
> Reported-and-tested-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index f4a727918e35..791227787ff5 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -2676,9 +2676,7 @@ void pvr2_hdw_destroy(struct pvr2_hdw *hdw)
>  		pvr2_stream_destroy(hdw->vid_stream);
>  		hdw->vid_stream = NULL;
>  	}
> -	pvr2_i2c_core_done(hdw);
> -	v4l2_device_unregister(&hdw->v4l2_dev);

I think this should still remain since pvr2_hdw_disconnect() doesn't call
v4l2_device_unregister().

Can you test that with syzbot?

Regards,

	Hans

> -	pvr2_hdw_remove_usb_stuff(hdw);
> +	pvr2_hdw_disconnect(hdw);
>  	mutex_lock(&pvr2_unit_mtx);
>  	do {
>  		if ((hdw->unit_number >= 0) &&
> @@ -2705,6 +2703,7 @@ void pvr2_hdw_disconnect(struct pvr2_hdw *hdw)
>  {
>  	pvr2_trace(PVR2_TRACE_INIT,"pvr2_hdw_disconnect(hdw=%p)",hdw);
>  	LOCK_TAKE(hdw->big_lock);
> +	pvr2_i2c_core_done(hdw);
>  	LOCK_TAKE(hdw->ctl_lock);
>  	pvr2_hdw_remove_usb_stuff(hdw);
>  	LOCK_GIVE(hdw->ctl_lock);
> 

