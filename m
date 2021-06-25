Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3F83B492F
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 21:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhFYTUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 15:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYTUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 15:20:39 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F34C061766
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 12:18:17 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id g12so8309097qtb.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8+KjGlQXDp1DON4loL8+NNiLFcog4PhK3R6OgOdGdTI=;
        b=wE9u87UEdrnhb7k9MI0rUCRn4ce3qpkqOIiCj8Y4WetGAi1hxWd9u9teRhilyoHer7
         zPpfiWsLu7xz6Ut6xP96iyi4k+TNMdw7t6DIzkUs4WVHB7pJ/6hlKjxZzhenLibjrrQT
         xU9ei8NNvhyYrHuA9PXfSmuKqLXs7PeuI1iAaV15W858V7FjP/Qses/LVcSwcmaehCs1
         4D0bXjhu6SHXPFB+mLnELih13rdOHuBiTvbvxUFhtFd8HoAgu4NWbCNT0PhF05uylJ9u
         yyUZ3XLlgVkiomxVzdkylr9Z/iW9/m6c+KVmBldK+dLrYH5BWLKS6pwQI6jU7xl10eOw
         l44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8+KjGlQXDp1DON4loL8+NNiLFcog4PhK3R6OgOdGdTI=;
        b=gcnSo862V4PsqcZAsvWyiZn5BrVMIIJbNbt+PzAQwHINpX4aZQQTWVAf+3yhfSXdUs
         soUbiN0698N2Y2mNXIAMFio655aSi0vgfqxcGXlS3xwy6m7Lb9rgJbM5/HCIwe6KMt4w
         fWZTs4cvWePdiOYuNam+iOKqtvZiclEMmnNlr0A+QHDN7m112PYPRzpGvy9aAGFhb2Xz
         FRDKtrpP7+xf4eho9OW4O5x9CpGLsCPx1hF9Iv043MRaRZdq4soRsrQeCzMAlQeaF4aA
         ssW3l1IBiOLskN/qmzDISkDvP3KT+A+g0179rJqAQLK0esIBLmbf/utw+KrLmeBQZKfR
         HRJA==
X-Gm-Message-State: AOAM532wyD1DQ3OslvQdR8yuIrD4/ip8MkeJtueHYEO9KhetC5KZJFeR
        YqmqMj/71jXAVBIgBmzKvf1kKQ==
X-Google-Smtp-Source: ABdhPJxEG0jYjwnY1ZlD7YyTkCNd5N6niMHGfTQPn4XxvEkkXLg8nIyzd5U3eq0qaui6Vv1twpNlug==
X-Received: by 2002:a05:622a:11cd:: with SMTP id n13mr11010873qtk.233.1624648696968;
        Fri, 25 Jun 2021 12:18:16 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 202sm4030603qki.83.2021.06.25.12.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 12:18:16 -0700 (PDT)
Message-ID: <0d5ce46a81ca02a9cf2a01175818846fba802194.camel@ndufresne.ca>
Subject: Re: [PATCH] media: uvc: limit max bandwidth for HDMI capture
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Date:   Fri, 25 Jun 2021 15:18:15 -0400
In-Reply-To: <20210622102948.47b86fbe@coco.lan>
References: <b791d5874c83663505cbd4f74907ac38d00bb727.1612206534.git.mchehab+huawei@kernel.org>
         <YNDY4iesZGF+7Cr0@pendragon.ideasonboard.com>
         <20210622102948.47b86fbe@coco.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 22 juin 2021 à 10:29 +0200, Mauro Carvalho Chehab a écrit :
> Em Mon, 21 Jun 2021 21:22:26 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> 
> > Hi Mauro,
> > 
> > Thank you for the patch.
> 
> Thanks for reviewing it!
> 
> > 
> > On Mon, Feb 01, 2021 at 08:08:59PM +0100, Mauro Carvalho Chehab wrote:
> > > This device:
> > >         534d:2109 MacroSilicon
> > > 
> > > Announces that it supports several frame intervals for
> > > their resolutions for MJPEG compression:
> > > 
> > >         VideoStreaming Interface Descriptor:
> > >         bLength                            46
> > >         bDescriptorType                    36
> > >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> > >         bFrameIndex                         1
> > >         bmCapabilities                   0x00
> > >           Still image unsupported
> > >         wWidth                           1920
> > >         wHeight                          1080
> > >         dwMinBitRate                   768000
> > >         dwMaxBitRate                196608000
> > >         dwMaxVideoFrameBufferSize     4147200
> > >         dwDefaultFrameInterval         166666
> > >         bFrameIntervalType                  5
> > >         dwFrameInterval( 0)            166666
> > >         dwFrameInterval( 1)            333333
> > >         dwFrameInterval( 2)            400000
> > >         dwFrameInterval( 3)            500000
> > >         dwFrameInterval( 4)           1000000
> > > 
> > > However, the highest frame interval (166666), which means 60 fps
> > > is not supported. For such resolution, the maximum interval
> > > is, instead 333333 (30 fps).  
> > 
> > What happens if you try to select it ?
> 
> Basically, URBs get lost: they cause apps like qv4l2 to crash
> sometimes, with:
> 
> 	v4l-convert: libjpeg error: Corrupt JPEG data: premature end of data segment

This is the emulated format handler that decodes jpeg behind application back
that is broken. The converter should implement this in a nicer way. E.g. it
could return ERROR buffer with payload = 0 in that case.

> 
> The image keeps blinking, and part of the image is replaced by
> white noise.
> 
> Clearly, it tries to send more data than the maximum available bandwidth
> on this chipset.
> 
> 
> Sent a v2 addressing the issues you pointed.
> 
> 
> Thanks,
> Mauro


