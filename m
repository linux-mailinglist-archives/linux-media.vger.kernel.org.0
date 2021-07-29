Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90723DA354
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 14:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbhG2MqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 08:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237203AbhG2MqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 08:46:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF6DC0613D3;
        Thu, 29 Jul 2021 05:46:14 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id e5so7393771ljp.6;
        Thu, 29 Jul 2021 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aOPMjYxSfcLxQO5DXf2cS5DmYr4eh4QbyClofMVpXyI=;
        b=XkvrSAPqzJi48W/X2lSLbgNnRGe8o+NyrHsiPiJmsHlrRDqEo+cdPj+rz0MrAGhGHg
         HGzNB36puxEs4gcm8P2OgFjqET6Dnh83N+BWbBOKhNTmBXYXZ2p3Lngm6TUnUsW8ZYnx
         5GUIu6gBncw4hEKlLN1kq+flJmLKVkALxejlGTn824E74q4GyInamllYGPvcifmfw2xv
         PNUziFALxnNMxABcU/Zzc20YSQQMRV3Tglgko/5uSSrZ/CF6cI+K7L8GdGEhsamXWEl5
         zQsTuRPwAR2OCyr/2xrpXoWXStoE/4u9U2Vgc0EBLO1r9gS2j+7HRtPGg1J3e8MFjHm5
         RYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aOPMjYxSfcLxQO5DXf2cS5DmYr4eh4QbyClofMVpXyI=;
        b=CXrhoKIiYCPivu4Qs/h+8L5uhBLWDet7a8TkoV7MTzdQN1dZDXgOjo7fKuaratfdM7
         sPJCu5jShgMQm7Q5CjRziul8H9TfMGrZucMOnnnbrNTVY4U00hxo8xJ4///fdGVA0szL
         HDZuKQi/3x+nmR4qLJroTphBMY530Owk1QpEDjsyMSpF3HHmMiHWa/jnMO3HPGxWOyjE
         /hajak/F/fYgmf+LE2vk50eZu7IMek0CGotQkeb/M2xzmmErSVYMedZVmv2EWo77M6Ta
         tBSpURx8EpaTPPCx7ChALjHCOV+P2UrhTJm7TqwnkNCGfvPulqyNq/g3HL/iJ5uiI0Av
         +KOg==
X-Gm-Message-State: AOAM5324dE0N95NZ7NJFxrH11DTpr/yk9N1ISS/9eWqraMIURtQV7ung
        7aMgAPv6ULN/0wSXLprRE2s=
X-Google-Smtp-Source: ABdhPJwKZygKILp6tWJIGvxjQHtv30yI9MQglDPErSO/+wyW06OS+yj8lxy6IJrs4N2UOVXBGm43tw==
X-Received: by 2002:a05:651c:1587:: with SMTP id h7mr2795884ljq.110.1627562772640;
        Thu, 29 Jul 2021 05:46:12 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.213])
        by smtp.gmail.com with ESMTPSA id g28sm295555lfj.279.2021.07.29.05.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 05:46:12 -0700 (PDT)
Date:   Thu, 29 Jul 2021 15:45:56 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] media: em28xx: add missing em28xx_close_extension
Message-ID: <20210729154556.6e257405@gmail.com>
In-Reply-To: <3b1de658-ebf0-e45f-49ef-953e3467e7d4@xs4all.nl>
References: <7df1705e-b2c7-ddfc-9cc5-582fb1a304e5@xs4all.nl>
        <20210721194307.12155-1-paskripkin@gmail.com>
        <3b1de658-ebf0-e45f-49ef-953e3467e7d4@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 29 Jul 2021 11:45:19 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 21/07/2021 21:43, Pavel Skripkin wrote:
> > If em28xx dev has ->dev_next pointer, we need to delete dev_next
> > list node from em28xx_extension_devlist on disconnect to avoid UAF
> > bugs and corrupted list bugs, since driver frees this pointer on
> > disconnect.
> > 
> > Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code
> > to a proper place") Reported-and-tested-by:
> > syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com> ---
> > 
> > Changes in v2:
> > 	Previous patch was completely broken. I've done some
> > debugging again and found true root case of the reported bug.
> > 
> > ---
> >  drivers/media/usb/em28xx/em28xx-cards.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/usb/em28xx/em28xx-cards.c
> > b/drivers/media/usb/em28xx/em28xx-cards.c index
> > c1e0dccb7408..d56b040e1bd7 100644 ---
> > a/drivers/media/usb/em28xx/em28xx-cards.c +++
> > b/drivers/media/usb/em28xx/em28xx-cards.c @@ -4139,8 +4139,10 @@
> > static void em28xx_usb_disconnect(struct usb_interface *intf) 
> >  	em28xx_close_extension(dev);
> >  
> > -	if (dev->dev_next)
> > +	if (dev->dev_next) {
> >  		em28xx_release_resources(dev->dev_next);
> > +		em28xx_close_extension(dev->dev_next);
> 
> Wouldn't it be better to swap these two?
> 
> That order is also used for em28xx_close_extension(dev) and
> em28xx_release_resources(dev).
> 
> You do need to store dev->dev_next in a temp variable, though.
> 

Hi, Hans!

I don't understand why I need to store dev->dev_next in a temp
variable. I don't see code in em28xx_release_resources() or
em28xx_close_extension() that zeroes this pointer.



With regards,
Pavel Skripkin


