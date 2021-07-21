Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619BD3D0EC3
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 14:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237299AbhGULlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 07:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhGULlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 07:41:24 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F77C061574;
        Wed, 21 Jul 2021 05:22:00 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id dt7so2895515ejc.12;
        Wed, 21 Jul 2021 05:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JXhJq/LmVudsVenUjd6F9TiOla6qbxeUF5Sbd3Fur1A=;
        b=ug9niw6keprpwO2RL8rEqsFpnNIcIbuoD3BjnB0WnlnFLkgdqz+uARsWWP/tN46Vsv
         5IFJXr/81n5kYRZEu/dDHpuDnw+yBWgsO91CFaJ12l4639cFRtxbxe2ybLyyrEwlRHXO
         TmMwH8m+ZoFd7nwiipmsv7wO6QRbuTWpq1+edjcPQHymrpsddMkc6ZT4cK9zoDCiIGcY
         lEzp7GfVuzcbxk1p/6Redb/gdMShp6lIGfJuPSkHhTM8NotRKQMMeLUXm7hufqcBXQN9
         Z0JOqt2eUEorDh43bWPQo9bc3ICji29UcLMO55fu0jf/9n2xfR4tWcA8DmNm6gczNGjW
         tqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JXhJq/LmVudsVenUjd6F9TiOla6qbxeUF5Sbd3Fur1A=;
        b=YLbtWC0DVlOc0mivKcYiJ245MrIajwXYijKD99R/jsM2Wf//JNCksqN+Bxn8H67x4/
         dGzIHq4lNph5y0jXtfmKmn7ALnbdJzRIVZgFX3NVPxRCkjFCTbyXInwEnF3NXfgSd/xj
         GRSiSBMhlOGDP+z/ujVaC5Ly5zgH23zc/kt2w/VJo1PobF98hPQPIl3Sso7m2bqm02SM
         fN03aWqpZk6ub3hT/1oYvkqFE+3VZ0zfN/b5alTwAbkwoesCqgBCexTjvQJUaRny8jii
         EqPBuk2f1GFFDjw+0/8otxVFqJccoUHD/x9oPfV16Yz91S1ADeprgv6S1VHbTf5OXmWe
         +stA==
X-Gm-Message-State: AOAM532oQqpnjBZUSbBNXs5afu/I96S0EIcmuUObvlmXBxHgBCbnprkh
        y+yPSCm+m4omDZpLBiRugUM=
X-Google-Smtp-Source: ABdhPJxIM6N9pcojHe1rA3JZ3zZ9F1m0hQuUr7vM1XQMo9cpCCYprhkWVsINRgnY28mUgwc/BoF2vQ==
X-Received: by 2002:a17:906:3948:: with SMTP id g8mr37488946eje.282.1626870118407;
        Wed, 21 Jul 2021 05:21:58 -0700 (PDT)
Received: from localhost.localdomain ([176.30.109.247])
        by smtp.gmail.com with ESMTPSA id u5sm10770113edv.64.2021.07.21.05.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 05:21:58 -0700 (PDT)
Date:   Wed, 21 Jul 2021 15:21:54 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: em28xx: fix corrupted list
Message-ID: <20210721152154.6b1a4e68@gmail.com>
In-Reply-To: <c6bb9cd0-2a8d-99c3-a14d-51c6364ba92d@xs4all.nl>
References: <20210706145025.25776-1-paskripkin@gmail.com>
        <c6bb9cd0-2a8d-99c3-a14d-51c6364ba92d@xs4all.nl>
X-Mailer: Claws Mail 3.17.8git77 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 20 Jul 2021 14:13:13 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 06/07/2021 16:50, Pavel Skripkin wrote:
> > Syzbot reported corrupted list in em28xx driver. The problem was in
> > non-reinitialized lists on disconnect. Since all 2 lists are global
> > variables and driver can be connected and disconnected many times we
> > should call INIT_LIST_HEAD() in .disconnect method to prevent
> > corrupted list entries.
> > 
> > Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code
> > to a proper place") Reported-by:
> > syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com> ---
> >  drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
> >  drivers/media/usb/em28xx/em28xx-core.c  | 6 ++++++
> >  drivers/media/usb/em28xx/em28xx.h       | 1 +
> >  3 files changed, 9 insertions(+)
> > 
> > diff --git a/drivers/media/usb/em28xx/em28xx-cards.c
> > b/drivers/media/usb/em28xx/em28xx-cards.c index
> > ba9292e2a587..8b1ff79c37a0 100644 ---
> > a/drivers/media/usb/em28xx/em28xx-cards.c +++
> > b/drivers/media/usb/em28xx/em28xx-cards.c @@ -4148,6 +4148,8 @@
> > static void em28xx_usb_disconnect(struct usb_interface *intf)
> > dev->dev_next = NULL; }
> >  	kref_put(&dev->ref, em28xx_free_device);
> > +
> > +	em28xx_reset_lists();
> >  }
> >  
> >  static int em28xx_usb_suspend(struct usb_interface *intf,
> > diff --git a/drivers/media/usb/em28xx/em28xx-core.c
> > b/drivers/media/usb/em28xx/em28xx-core.c index
> > 584fa400cd7d..03970ed00dba 100644 ---
> > a/drivers/media/usb/em28xx/em28xx-core.c +++
> > b/drivers/media/usb/em28xx/em28xx-core.c @@ -1131,6 +1131,12 @@
> > void em28xx_init_extension(struct em28xx *dev)
> > mutex_unlock(&em28xx_devlist_mutex); }
> >  
> > +void em28xx_reset_lists(void)
> > +{
> > +	INIT_LIST_HEAD(&em28xx_devlist);
> > +	INIT_LIST_HEAD(&em28xx_extension_devlist);
> 
> This needs a mutex_lock(&em28xx_devlist_mutex);
> 
> But actually, I don't think this is right: if there are multiple
> em28xx devices, then I think if you disconnect one, then the other is
> - with this code - also removed from the list.
> 
> Can you give a link to the actual syzbot bug? I'm not at all sure you
> are fixing the right thing here.

Hi, Hans!

I guess, I missed my coffee that morning, sorry :) This patch looks
complety wrong, of course.

I've took a close look at this bug one more time, and I found the true
root case of this bug.

If em28xx dev has dev_next pointer we need to close dev->next extension
on disconnect to avoid UAF and corrupted list bug. So, something like
this should work:

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index c1e0dccb7408..d56b040e1bd7 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4139,8 +4139,10 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
 
 	em28xx_close_extension(dev);
 
-	if (dev->dev_next)
+	if (dev->dev_next) {
 		em28xx_release_resources(dev->dev_next);
+		em28xx_close_extension(dev->dev_next);
+	}
 	em28xx_release_resources(dev);
 
 	if (dev->dev_next) {

How to You feel about it? I am going to send this patch for syzbot
testing


Syzbot link:
https://syzkaller.appspot.com/bug?id=3609bbf45bf63a8f6032f330eb3d34f51cc81493


Again, sorry for v1 patch, I don't know how I came up with this fix :(
 


With regards,
Pavel Skripkin
