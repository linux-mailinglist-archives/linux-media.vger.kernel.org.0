Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52671DE4BC
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 12:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbgEVKqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 06:46:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53314 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728606AbgEVKqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 06:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590144373;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Trji5Xaa18O0L2sXoHjLZxS8mlUJs/p3GigjT8THDjU=;
        b=OUT0+hDnCx2SGcxwtlC9DnvMP4c4enu1Gu2FXvBaLCUSw0utG5BAxiZwIKcPibk5KrShj7
        nPCi4lG1XcEJlhKDbb6PrIte0xsrijnB7TuEMn/0ACQkiEe1j5FDtjP76UIuwZuauvG5ja
        GKQaMCNt3P3XJRzGX7E3HfBmMV7ohT8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-9ia7u5sjOQKKdD41IrG_cA-1; Fri, 22 May 2020 06:46:09 -0400
X-MC-Unique: 9ia7u5sjOQKKdD41IrG_cA-1
Received: by mail-ej1-f71.google.com with SMTP id f17so4432201ejc.7
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 03:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Trji5Xaa18O0L2sXoHjLZxS8mlUJs/p3GigjT8THDjU=;
        b=cv3U5UPE2+GmgH10FyUAI5Zn1de/U4WvnakvwJUuNiK2yOuegLSPhNxh1GtEM4WFks
         SuohYdh7d95JbVFFPw9q836lcDtuBE0nBmxeyveMoM2EGNrvOnAKFwx8XAl7nDXNA6iA
         /I1ET2GYiXnaEtm3IRLG/cW28KaDMoYnoD1uukIxMuzw+wOFh5Q3zb5BKRHIsXAnK8sM
         osK5dJlN+rOJ12Bwz75wsTMcVdIP4pMtIsmM96gp9k3rWd8mZxwvyeeUVdQzgDhaHmCT
         5iQvjqnf0wUuT59whscZMbAtlB075fqE6Knn24y00yr0OvNRzWUNbpvxYArM1Xg9jLXq
         nUWA==
X-Gm-Message-State: AOAM531hxje0YyYL9LU8MwSLNDvpLQRqxH8EbxwBF07r/nPkwfuu0tIK
        QjHEXeVzvwYT3vE9qOI8rLqlZhNSXl1SNutgD5BEGGOKVdxT1OQtF19qDV+95bQ/ar2D2pBwfUQ
        HzChlOQNe2UmSRwGqM7zGOsg=
X-Received: by 2002:a17:906:6a18:: with SMTP id o24mr7515409ejr.66.1590144368630;
        Fri, 22 May 2020 03:46:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAsZkmAJT29bYdUkwMjJ6XEfq3n6bmytWJxe45LivHA8M2lZ5fPrDEisyrO4T4erg3MIFUfA==
X-Received: by 2002:a17:906:6a18:: with SMTP id o24mr7515394ejr.66.1590144368426;
        Fri, 22 May 2020 03:46:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a18sm6946783edb.44.2020.05.22.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 03:46:07 -0700 (PDT)
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20200501215741.3be05695@coco.lan>
 <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
 <20200503173213.78ae6aaa@coco.lan>
 <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
 <20200503180751.0b1e29c4@ASUS> <20200504101628.0f632bf2@ASUS>
 <20200504104934.7873cee3@coco.lan> <20200504124539.77eac397@ASUS>
 <20200504140833.11dd5622@coco.lan> <20200504154420.5dcf505f@ASUS>
 <20200515103232.47b2a35e@coco.lan>
 <be0935ce-4d88-e7de-5013-6651b8c4edac@redhat.com>
 <20200515114245.266a6fc8@coco.lan> <20200519093920.7bb22161@coco.lan>
 <20200519193635.14e806b6@coco.lan>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4dd760d6-6445-f3b5-cb14-1705e05820bc@redhat.com>
Date:   Fri, 22 May 2020 12:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519193635.14e806b6@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/19/20 7:36 PM, Mauro Carvalho Chehab wrote:

<snip>

> I did a lot of progress today. After identified the above bug, which
> was turning down the ISP device, causing the firmware load to fail
> (as the turn on code is not OK), I solved several other issues there.
> 
> The current status is that:
> 
> - the ISP firmware is properly loading;
> - it can properly communicate with the camera sensor;
> - Userspace can read video controls (tested with v4l2-ctl and qv4l2);
> - set a video format is now working;
> - buffers are being queued, and per-frame IRQs are arriving.
> 
> I did a really quick test today of trying to get a video from it,
> using a simple tool I developed for such kind of tests (v4l2grab
> from v4l-utils package, changed to work with the only format that
> my camera sensor supports). This tool needs uses a bare minimum
> set of ioctls, with would avoid hitting a bug somewhere else.
> 
> Running it makes the device to start receiving frames from the
> hardware. Yet, there's something wrong at the part with stores
> the data into the video frame buffers. This driver has a weird
> mm/DMA code, based on a fork of get_user_pages() taken probably
> during Kernel 3.10 old days.
> 
> Addressing it has a high chance of grabbing some image from it.
> 
> Ok, driver is at staging quality: there are lots of crap there that
> will require changes, but it seems we're getting there.

This is very good news. Hopefully you will get an actual image
out of these soon. That would be awesome.

I happened to notice an advert for a second-hand Asus T101HA
locally, for not too much money. So now I'm the happy owner of
an Asus T101HA myself. So once you have something working I can
try to reproduce your work on identical hardware then as time
permits help with cleaning things up.   Although I might focus
at first on trying to get your work to run on more Cherry Trail
based models, to find out what bits we need to make configurable
and if we can get the info from ACPI or if we need to have a
DMI based table with model specific info.

Regards,

Hans

