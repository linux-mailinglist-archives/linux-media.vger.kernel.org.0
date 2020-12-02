Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DBD2CB7E3
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 09:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387819AbgLBI6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 03:58:49 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40883 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729057AbgLBI6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 03:58:49 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kNxakxhHvkGBYkNxdkZUuA; Wed, 02 Dec 2020 09:58:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606899487; bh=0yyL4+0ZiiDETqfzLKE+m+XevNol2C/Wx4yxmumKbaM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YCkd/XF08PuBb8b3I7D8sZk/2x1oNrItGhYgUTcjibCl7IvJHBQLlNI1QDujRgi6h
         9iiGak4aKP1f2bT8Ai8qgY8pATO/hBlJnBYr6DZgyCRDWfD9KgQc5kZsDKf/Z98IoV
         NjGvwOaSuzWZ9TQcLklKnjFu0w8sL8hDPITP7PxCBlTK+UngqRYcPHMPHgVQWr2o0v
         Tw4gZQXycmQ/n/sI1sRufreST9E/wKFMEHS2cL4eLQ6WfiXi3AW74MgcCbeoh4xY2c
         x4wCrsL5HwZQCMV/FFxAk9nYC4k/F9om/pgBg/22HKd1tSpcQaNee3TAqvw5uYzgRf
         daMCDbLisQ5ZA==
Subject: Re: [PATCH] media: gspca: Fix memory leak in probe
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <20201123215345.GA721643@rowland.harvard.edu>
 <0000000000004b629f05b4cd7124@google.com>
 <20201123222428.GB721643@rowland.harvard.edu>
 <c2cf1a80-ec47-69ac-c3e2-1b0e32447ef2@xs4all.nl>
 <20201124160026.GA749809@rowland.harvard.edu>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eb89a572-3022-39a9-989c-f2f80cc69edf@xs4all.nl>
Date:   Wed, 2 Dec 2020 09:58:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124160026.GA749809@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMCv5m/37rVkK23xm73DPx7a7Me+nMPgkZCikxRrTF3jtMSDZxTTpAI6IeR7/rsXj/7RySt2J+oI41k5RlHHMr0NnBl5LEkaaNBJ+8oyAueGKwGIY4fu
 h1WFpzXjOudl+Y9bq7mjnDBI3f3M5wXpfM2TgkxSHVN5phEusdKQbOEXZ41QWg5eG9lJTGNkUmYeb2ge2/ImeRPtVGLkFE2oDd8o1T0qtAKJyzXalOwJwzxg
 fpL5jOY7HDlQNK+3A+OlKsJ5q9LCgHNBiTpIgRntZR39unZzNWg+ndj4srpII8ZJA6F9GIvv5tE4fXg9C/KG2M9BVo5px1/p8smwhxO9Wk65eo5i6k2UOWl9
 jXcfoFux+IjkGLir+GufD4gXiCBXOHUviX2t4iDqdu9teOWtLHMTBlD9Jnm4M/ddgTcSk2oo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/11/2020 17:00, Alan Stern wrote:
> The gspca driver leaks memory when a probe fails.  gspca_dev_probe2()
> calls v4l2_device_register(), which takes a reference to the
> underlying device node (in this case, a USB interface).  But the
> failure pathway neglects to call v4l2_device_disconnect(), the routine
> responsible for dropping this reference.  Consequently the memory for
> the USB interface and its device never gets released.
> 
> This patch adds the missing function call.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-and-tested-by: syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com
> CC: <stable@vger.kernel.org>
> 
> ---
> 
> This doesn't fully fix syzbot's test case, because the test goes on and 
> encounters another memory leak in a different driver.
> 
> 
> [as1949]
> 
> 
>  drivers/media/usb/gspca/gspca.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: usb-devel/drivers/media/usb/gspca/gspca.c
> ===================================================================
> --- usb-devel.orig/drivers/media/usb/gspca/gspca.c
> +++ usb-devel/drivers/media/usb/gspca/gspca.c
> @@ -1575,6 +1575,7 @@ out:
>  		input_unregister_device(gspca_dev->input_dev);
>  #endif
>  	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
> +	v4l2_device_disconnect(&gspca_dev->v4l2_dev);

Close, but no cigar. This should call v4l2_device_unregister(), the
counterpart of video_device_register. This unregister function also
calls v4l2_device_disconnect, but the code makes a lot more sense if
the v4l2_device_register is matched with the v4l2_device_unregister.

Regards,

	Hans

>  	kfree(gspca_dev->usb_buf);
>  	kfree(gspca_dev);
>  	return ret;
> 

