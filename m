Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0812EAC88
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 15:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbhAEN7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbhAEN7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:59:24 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE412C061793
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 05:58:43 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id 2so20824921qtt.10
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 05:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=YijoxjaSbDn8EkcLYrALCvCV2UwiAYY04Ev049yW7eY=;
        b=S5n6akkvila7jc9wqAP6tQ6a/gfLNiRChMmmxw63M9BNw3vbVS+GTrdPqsoV2LNI5b
         co30O1OJmrJx+bqJIV/+3KTvxMbfUjyQ2ccnQ/2jr2J6Fp6Bvh8UnpKfWsVw0cTcb210
         m3tOEIuDV4kQZHpcCwPHDUxMh/tTwIignVAqydv083y8JJXLQSvG/jVbFrYoaqlGZFIv
         uhwfm8wuM/VZJ31Zrj+ea8RCigcB2pF35BLTphONtsciJ6ZDLfC4mopzAlYJBUJJbqLO
         hgdhgHV/CknXixlu2roynkGqH0y9eYrOB9eLu55S1DjJ+6dZze4qQ1Wrl7x3T2OI5emW
         Uhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=YijoxjaSbDn8EkcLYrALCvCV2UwiAYY04Ev049yW7eY=;
        b=rQ6AC9dOBgr28gRDH/jL/wSpo4VCEL7xJlwM8AbK5nL2Z84qZ5C/epyo0jsooNT2hV
         qj4d58jub7sYKSG0L64JbfkwttgnUJFglCJAH6NYET1s5GdWHk/7TDXn/GkcCiGvUVwV
         2n56zeXhk0ap+TMnX/N8CeCNViKqNDA+gvFxC6MAs6yE5zWRGoDtZgqhLG+RMWVZaTn9
         IY6SMjHIH4fAkiXPBbYzIIv/SJILXZV5QKEg1bE0oFpCbf/Gk2gkzI2a956sIwgMLY6k
         Zr3LJSkuQYkQYEMVjaQ1UG20Qiqrn/i47Ho1WTobS36J/tyyhchAUTVn0Fz1EoaJCw8j
         oPBA==
X-Gm-Message-State: AOAM532QrCYlSIs/LiklF20p+/nE3aRrbeKucSb1fz2SMUHkwu0VGtxs
        M8Nw82zfOpy72P1uA6p9xgg=
X-Google-Smtp-Source: ABdhPJx+8FLaQ6fCLimi49QJfCUnOmWksFul6+jfgb5WanvesMQJ5yxktHxAZeMJ13UN1xT64ETVCQ==
X-Received: by 2002:ac8:4692:: with SMTP id g18mr76546981qto.255.1609855122983;
        Tue, 05 Jan 2021 05:58:42 -0800 (PST)
Received: from dwls-dell ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id j29sm37907703qtv.11.2021.01.05.05.58.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 05:58:42 -0800 (PST)
Date:   Tue, 5 Jan 2021 10:58:35 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        "=?utf-8?Q?mchehab=40kernel.org?=" <mchehab@kernel.org>
Cc:     "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>
Message-ID: <DBE23E47-E626-4FF3-8F5A-C009239C7F7F@getmailspring.com>
In-Reply-To: <6cd794fc-90f5-52fe-97d6-69692ec31333@xs4all.nl>
References: <6cd794fc-90f5-52fe-97d6-69692ec31333@xs4all.nl>
Subject: Re: On test-media script integration for vidtv
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans & Mauro.

So I sent a few patches today implementing some of what was discussed
here. I added support for modprobe/rmmod, bind/unbind and kmemleak
results at the test-media script by basically adapting the
implementation for vim2m.

The initial compliance test part is missing, of course.

> I'm not a DVB expert, but I was thinking of testing if it can discover
> channels, and perhaps just a test to stream data without checking if
> it is
> actually valid video.
> 
> The problem is that I am not all that familiar with the DVB utilities
> so I
> don't know if anything can be automated.

Mauro, can you chime in on the above please? 

Some of the last changes for vidtv broke some very minor details in the
driver. This meant that some of the tables would not get picked up by
userspace software, even though the driver itself did not crash.

I wonder whether this sort of failure can be picked up in some automated way?

> An alternative is to start adding dtv support to v4l2-compliance. That utility
> already has media controller support, but it needs a bit of work to comfortably
> integrate DTV support as well. I can help with that if you want to go
> in that
> direction. v4l2-compliance would need a bit of refactoring, but it is
> nice to
> have the tests there since that makes it easy to support hybrid
> devices with a
> single compliance utility.

I am still getting acquainted with this tool, but otherwise I am fine
with that.

Also, as let's recap this from a past email from Mauro:

> I suspect that, before that (or together with such tooling), we need
> to properly implement the frontend ioctl, validating the per delivery
> system parameters, as, right now, it just accepts anything from
> userspace. 

Mauro, can you give me some tips on how to get started? I assume there's
some technical documentation detailing what would be considered valid
values for the different delivery systems in use today? 

Also, where should I add the checks? Is it at
"vidtv_demod_set_frontend()" ?

-- Daniel
