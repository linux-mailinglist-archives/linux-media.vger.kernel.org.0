Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7FF810C736
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 11:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfK1KvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 05:51:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:38500 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726227AbfK1KvG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 05:51:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0E73DAD78;
        Thu, 28 Nov 2019 10:51:03 +0000 (UTC)
Message-ID: <1574938260.21204.5.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Thu, 28 Nov 2019 11:51:00 +0100
In-Reply-To: <Pine.LNX.4.44L0.1911271304410.1319-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1911271304410.1319-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, den 27.11.2019, 13:07 -0500 schrieb Alan Stern:
> Index: usb-devel/drivers/media/radio/si470x/radio-si470x-usb.c
> ===================================================================
> --- usb-devel.orig/drivers/media/radio/si470x/radio-si470x-usb.c
> +++ usb-devel/drivers/media/radio/si470x/radio-si470x-usb.c
> @@ -370,15 +370,14 @@ static void si470x_int_in_callback(struc
>         unsigned char tmpbuf[3];
>  
>         if (urb->status) {
> -               if (urb->status == -ENOENT ||
> +               if (!(urb->status == -ENOENT ||
>                                 urb->status == -ECONNRESET ||
> -                               urb->status == -ESHUTDOWN) {
> -                       return;
> -               } else {
> +                               urb->status == -ESHUTDOWN))
>                         dev_warn(&radio->intf->dev,
> -                        "non-zero urb status (%d)\n", urb->status);
> -                       goto resubmit; /* Maybe we can recover. */
> -               }
> +                                       "unrecognized urb status (%d)\n",
> +                                       urb->status);
> +               radio->int_in_running = 0;
> +               return;

Hi,

it is a bit awkward to complain here, as your patch tests as correct
while mine didn't, but this is a race condition.
You can't guarantee that urb->status != 0.
The kill may happen while the completion handler is running for
a successful transfer.

I really appreciate your help, but I must understand what is going
wrong here. You are stopping the resubmit, but how could the resubmit
ever have not failed?

	Regards
		Oliver

