Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19893CF969
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 14:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhGTLck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 07:32:40 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:34915 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231707AbhGTLck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 07:32:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 5ocbmt71dhqx95occmvjYR; Tue, 20 Jul 2021 14:13:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626783195; bh=8LNbX59qTEjPV5haDNG1ReO6rc37pgbdjgLqdJPr36U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=S0veEs2dKYjQaSSRFOALKiR+7lSNBgoqCq77lF1PJAG4i4oAt1Z/xlaJoY7kMgb9n
         uaA8gFhgRzmooB82CwXWIuydMdheJ0wYuSaXhzi3MMKt1uq5UMDQE2f8O/SwtoiAMi
         IJWMCkAgYgfhrEuBp8AFb4XWoQN5dMpXnZ9hmyKuGKi4K8mrfRKzg4Po7mttYNm0nn
         gmpxqtKnT7FEGshUug9IdbjdOJWlnWhSNhNvDGcwvjL1pGqFgdRzL4p4mMYYwwKwI0
         ACsOC1UB9DKOgQz9FeYvcjw9ekhMPaAjoWp/bjZ48jZEuOOli6PYYgu7qWycWIN3c5
         ubfyYgwwQUmPQ==
Subject: Re: [PATCH] media: em28xx: fix corrupted list
To:     Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
References: <20210706145025.25776-1-paskripkin@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c6bb9cd0-2a8d-99c3-a14d-51c6364ba92d@xs4all.nl>
Date:   Tue, 20 Jul 2021 14:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706145025.25776-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKCqy+MZNsZBoM/nl8NEJHCiuF065/vJ60zpyfe9tpSxK5FXvkTFXuiI4V4Bwl15LRszCQ+7r5seEfaTbjO930qqFLwN/fLXjsILEhMegbMLosfWAX3i
 BS66QxpEhQmxfAXf4ItFjzututqkihdnS8HpzFJA8ARcV3fP8iYKZT5FsmeUt6PI1Q7sUgaq1eJIR6sP8wWcyYJDT3hd2bAQjIOlRaZRetcngLPtjF/BfExc
 HyMIrnh8Uca0T81bL2Mg8RRZGBnUH1f745kOxzICdRJ0HkGfl1PSIjtZOY/iDPx+RRkyAlGBQyOjRV5jBQJbxY+twJAPC8DKWRUFRLsk2/jpfQ9udz4kZQPA
 Wo1XV8gChU3MpUh8b7eXR3ETOoZX4sX/PVjdTlnleJFNzdM9yI8kVdS16dw7kHWcLXu/Oj1nYTNgtYB1WFRcrF1FFwkO3QsDqzO302a0yv8FjF7Lv6ZTVq7r
 o1QOieYqQf7JgLHz
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/07/2021 16:50, Pavel Skripkin wrote:
> Syzbot reported corrupted list in em28xx driver. The problem was in
> non-reinitialized lists on disconnect. Since all 2 lists are global
> variables and driver can be connected and disconnected many times we
> should call INIT_LIST_HEAD() in .disconnect method to prevent corrupted
> list entries.
> 
> Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code to a proper place")
> Reported-by: syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
>  drivers/media/usb/em28xx/em28xx-core.c  | 6 ++++++
>  drivers/media/usb/em28xx/em28xx.h       | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index ba9292e2a587..8b1ff79c37a0 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -4148,6 +4148,8 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
>  		dev->dev_next = NULL;
>  	}
>  	kref_put(&dev->ref, em28xx_free_device);
> +
> +	em28xx_reset_lists();
>  }
>  
>  static int em28xx_usb_suspend(struct usb_interface *intf,
> diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
> index 584fa400cd7d..03970ed00dba 100644
> --- a/drivers/media/usb/em28xx/em28xx-core.c
> +++ b/drivers/media/usb/em28xx/em28xx-core.c
> @@ -1131,6 +1131,12 @@ void em28xx_init_extension(struct em28xx *dev)
>  	mutex_unlock(&em28xx_devlist_mutex);
>  }
>  
> +void em28xx_reset_lists(void)
> +{
> +	INIT_LIST_HEAD(&em28xx_devlist);
> +	INIT_LIST_HEAD(&em28xx_extension_devlist);

This needs a mutex_lock(&em28xx_devlist_mutex);

But actually, I don't think this is right: if there are multiple em28xx
devices, then I think if you disconnect one, then the other is - with this
code - also removed from the list.

Can you give a link to the actual syzbot bug? I'm not at all sure you are
fixing the right thing here.

Regards,

	Hans

> +}
> +
>  void em28xx_close_extension(struct em28xx *dev)
>  {
>  	const struct em28xx_ops *ops = NULL;
> diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
> index ab167cd1f400..73caaaa398d3 100644
> --- a/drivers/media/usb/em28xx/em28xx.h
> +++ b/drivers/media/usb/em28xx/em28xx.h
> @@ -835,6 +835,7 @@ void em28xx_stop_urbs(struct em28xx *dev);
>  int em28xx_set_mode(struct em28xx *dev, enum em28xx_mode set_mode);
>  int em28xx_gpio_set(struct em28xx *dev, const struct em28xx_reg_seq *gpio);
>  int em28xx_register_extension(struct em28xx_ops *dev);
> +void em28xx_reset_lists(void);
>  void em28xx_unregister_extension(struct em28xx_ops *dev);
>  void em28xx_init_extension(struct em28xx *dev);
>  void em28xx_close_extension(struct em28xx *dev);
> 

