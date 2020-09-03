Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86CD25B919
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 05:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgICDTO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 23:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgICDTM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 23:19:12 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89382C061244;
        Wed,  2 Sep 2020 20:19:11 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h12so932219pgm.7;
        Wed, 02 Sep 2020 20:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NybMT57+LqComuPCH5w4ICM4pB0an3OV0/NxCqZvdQ4=;
        b=OTReT3xy09LAvQqw3J5r88uZhYemMZRJILPZfkUolo7+YtDKHYCeiSzguKt/eXhxMX
         GXjSoHvOEaWjitkIneYVQc3aTR6c+qUnvh/SN5DNBfcrHqQewl8EAaJxvv3nx9pKlcnD
         vdpnVWNPeah+FMbeN9k69j3J72qNd/aiXe9z/qpiEuuZTEDymoSvrjrljcljOi/YWCIf
         3IgojqR2mpucNIb7kX8u3GUI9m28tHWYuwJSpLjY6NN2L6OaetR7wbpVqBkTWs/aeGXV
         sD1BaIvjnLIxnPkMvHbVgNK+j28xCtUeJPqgqpHw75NmA2jubpcDAK1hB15gXe3mpTV4
         Mcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NybMT57+LqComuPCH5w4ICM4pB0an3OV0/NxCqZvdQ4=;
        b=aPKu7YgK54G2zD3Ok3ewQrh8NChe/zT2AQXOOdRYCgJ6yeSv9DQxwbdqUjG2eoXdbB
         OsreHLYVr0mBWs84jZ28RbKSWbkEPkiwR+kKo12KhAa+tW/EnSckof4Zc5mkWCsAbiri
         iy4BqIeMR5QZqeM8PejfUw49uDn2et0XZUD0dRF0ld2sg+gsA0JS0uB1+vIBqU2EXWo4
         /2sMppYjKT8lPhvGk1brzJoQe6HA4qo0TbrCT41o8kv065RnEPlbbjagA2kuz5W7hKIa
         xsMJe7Ois9BLPKc+2G+gjm5lrHBDuMQUjdYkAXVJgTlrGt5FSVl989BzmbQiHtzeYYNS
         L+dQ==
X-Gm-Message-State: AOAM532ikMrVdebFwxKnS3+fHeLZf9kbXPVT9HHOmGvueBwN1fL81zxx
        OVBWoSjfA6uybGQp0fjFDLX7/4K3+kg=
X-Google-Smtp-Source: ABdhPJxFvmAcO+NEPAiW/SfP3uzv4RdE9NWt6eVkmB6vyO4C/HemrVN4IYXYzPeOtjrgPmv1iAyWAw==
X-Received: by 2002:a63:fc18:: with SMTP id j24mr1023744pgi.452.1599103149294;
        Wed, 02 Sep 2020 20:19:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t11sm726057pjy.40.2020.09.02.20.19.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 20:19:08 -0700 (PDT)
Date:   Wed, 2 Sep 2020 20:19:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] media: uvcvideo: Fix race conditions
Message-ID: <20200903031907.GA103631@roeck-us.net>
References: <20200830150443.167286-1-linux@roeck-us.net>
 <20200830155833.GA6043@pendragon.ideasonboard.com>
 <ac2080a1-3b00-ac9e-cd49-d1ee84c6ca25@roeck-us.net>
 <20200830213621.GC6043@pendragon.ideasonboard.com>
 <20200831001010.GA92208@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831001010.GA92208@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 30, 2020 at 05:10:10PM -0700, Guenter Roeck wrote:
> On Mon, Aug 31, 2020 at 12:36:21AM +0300, Laurent Pinchart wrote:
> > Hi Guenter,
> > 
> [ ... ]
> 
> > I'll try to prototype what I envision would be a good solution in the
> > V4L2 core. If stars align, I may even try to push it one level up, to
> > the chardev layer. Would you then be able to test it ?
> > 
> 
> Sure, I'll be happy to do that.
> 
> I ordered a couple of non-UVC webcams (pwc and gspca) from eBay for
> comparison. Both of those use the v4l2 locking mechanism, so we should
> be able to see the difference.
> 

Turns out gspca webcams (or at least the one I got - Logitech QuickCam for
Notebooks Deluxe) don't have a problem. As mentioned before, the gspca
driver uses the locking mechanism provided by the v4l2/vb2 code. Unlike
uvcvideo, its open function doesn't trigger sending send usb packets.
Its usb disconnect function acquires the lock, and the rest of the code
holds that lock where needed. I''ll keep trying, but so far I can't
get it to do anything wrong.

I am still waiting for the pwc webcam, but that also uses the v4l2/vb2
locking mechanism, and it seems unlikely that I'll get it to fail.
I'll try anyway.

Guenter
