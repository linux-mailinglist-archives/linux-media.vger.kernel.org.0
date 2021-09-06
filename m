Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D17F9401D4B
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 16:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243585AbhIFO6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 10:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243493AbhIFO54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 10:57:56 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBEDC061757
        for <linux-media@vger.kernel.org>; Mon,  6 Sep 2021 07:56:51 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n39so3085623wms.1
        for <linux-media@vger.kernel.org>; Mon, 06 Sep 2021 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CtHiP+D7k5znLaPfpOQWBuuhn0SZQDsGXEHIILBBc1E=;
        b=WCfNNygVYAjJNE3QPiwsT3pzkIfLqzGlZq7FFjAb99YiilaQBopfe1sVzhYZzwsHKb
         P/1WE1p1AipRlP3kD+WRUNrrTwNA4wj2ONI8OQpwrLf/1ZGQyEjWZGiaeyBRDsjOdWy9
         bI/xps0XWhbOXF3PB0ZfALeqob/0rqm68nOHITE74KPteoi3awxHyfAbR5Ty/rvfTJRe
         2CSD2uEtVlokfkGKiPlWJmoDpzpRdJ3/6fd8DujAPhM34Vsljv2EoHDBTydX8ozILMFp
         EBwAfWl0gqnVgUpMkgXFekVYRf1VCwn58KNOyw5Ig2J9OywZZLbgomROXpS9D7eARKla
         b4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CtHiP+D7k5znLaPfpOQWBuuhn0SZQDsGXEHIILBBc1E=;
        b=WXLhz49gMjBTHqvldXb7AR7MdbHtRMQZf8XrWIQlMHfSRHJNeDhJJ1QDgrzreawplL
         SkpcMS4GgQ0TYAjIHpxEZyVgZLwgSzeCUdrCELKuqr+ivP0HO7qgssYVmgiwKCZfmopD
         SIK6wwm2Uqnchga9c7D54t4nMYdau43P/FMhAuAMzbp+fpfrnKqNwAo1Ryks1M4oJ0BT
         OdEBevIbiN9Q9ReNUnnp9JCKFxU6YUPSWv43F8vZa/Szc0L4HkgDyRSk/DAdh5zOvBZA
         qdtNlCFaM3+BqBakbaoLr2pa4IevrgNm5unrYm5ENYWtf6mWzrXPyrzwGq8xaw3E48N2
         RqmQ==
X-Gm-Message-State: AOAM5337cRVygtIEj1sSygG5J9Ok1ELpbfzErwU9qaFD37JzPLtjPxBJ
        D0X8LlT2h6CS62HCyU5jrUK5RdaoR+ME/w==
X-Google-Smtp-Source: ABdhPJy/Skl3RAKF+wBcqUVU5L4hNy7a3LuFeFL2VfNZsmXXpG71TAEvQwFvX+0uZiQrutD1qWuhmA==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr11811897wma.42.1630940210493;
        Mon, 06 Sep 2021 07:56:50 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id g1sm251095wmk.2.2021.09.06.07.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 07:56:50 -0700 (PDT)
Date:   Mon, 6 Sep 2021 16:56:47 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 0/8] staging: media: zoran: fusion in one module
Message-ID: <YTYsL5i0B48k/V0Z@Red>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <efe035cc-1839-210f-c0d4-4d58801aa65c@xs4all.nl>
 <YTYcf3We4dcvBx1h@Red>
 <940d5bdf-89b8-b5a4-f485-aa5b1c51286b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <940d5bdf-89b8-b5a4-f485-aa5b1c51286b@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Mon, Sep 06, 2021 at 04:11:16PM +0200, Hans Verkuil a écrit :
> On 06/09/2021 15:49, LABBE Corentin wrote:
> > Le Mon, Sep 06, 2021 at 01:03:56PM +0200, Hans Verkuil a écrit :
> >> Hi Corentin,
> >>
> >> I finally had the opportunity to test the staging zoran driver.
> >>
> >> I found several issues when running v4l2-compliance -s (I posted a patch
> >> for that), but more seriously is the fact that trying to capture MJPG
> >> at resolutions 384x288 or less just hangs my PC. It works OK with 768x576.
> >>
> >> I discovered this when running 'v4l2-compliance -s -a -f'.
> >>
> >> BTW, why isn't the initial format equal to MJPG 768x576?
> >> I would expect that for these boards that should be the default format.
> >>
> >> Another issue is that the TODO should mention that for video output there
> >> should be a second video device node. And that's really something that
> >> has to be done before the zoran driver can be moved out of staging.
> >>
> >> It shouldn't be that hard to implement, I think.
> >>
> >> Right now it is impossible to run the compliance test for the output, since
> >> it doesn't even see it as an output.
> >>
> >> Regards,
> >>
> >> 	Hans
> > 
> > I work on having a second device for output, (it is the reason of "staging: media: zoran: move videodev alloc" which will help).
> > 
> > But I still have the problem of non working output.
> > 
> > Does output is really needed for going out of staging ?
> > Probably nobody have it working for ages. The only way to had it was to use an old mplayer output which is broken since so many time.
> > Note that this plugin will never work again.
> > 
> > The only way to work on output is to use ffmpeg which just recently have suport for writing non-raw video to V4L.
> 
> Then just remove it. The code for output remains in the git history so if someone wants to
> resurrect that, then that's always possible.
> 
> The point is that I don't want to have half-baked output support in mainline.
> 
> But what exactly is the problem with getting output to work? Doesn't it just decode
> MJPEG frames? (Sorry if you explained it before, it's so long ago that I looked at this
> that I forgot the details)
> 

The first problem is that zoran dont like comment COM/APP0 markers.
This imply a per buffer filtering but this is already handled in my next branch.

But the remaining problem is that any output is like http://kernel.montjoie.ovh/zoran_out.png.

I hacked the driver to grab a working buffer when doing input and overrun output buffer later.
And the result is a working static output.
So the hw handling is good and the problem came from the data feeding/handling.

I believe that something is wrong in what ffmpeg negociate/send.

Regards
