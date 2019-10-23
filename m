Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1770BE17C3
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 12:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404357AbfJWKXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 06:23:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46911 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404312AbfJWKXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 06:23:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id t8so15582897lfc.13
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2019 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WpD/YljpWmTam/2MTLvoaB931r9WFg9CiXxmASdc5DQ=;
        b=0vRbcyzUcOCGbTVvML4MSC3Ts5iUbc3+j/FQITHv1Ye8911AXQM8XilLsHmNodzadm
         7a11Ayb96dxIES3+1zxa+xIeUygjy9vEi6I/bpuh9DyoMSfH2GpFjhZYmolPe9QJoN0m
         gPSnkUX7npq6JyWYROx0xxiWLzRnn+eVIZKni0yEJGyzbHOrtnaoIBV0giQklGc8pbMp
         2orFeo+JH33DveAW2XGX+au1LUn/IZyeecQ0+X67o53c4kHkDVzQwH22H4e06b8LCjlU
         Qs4x82Arco69N32FDVXWG5zkMIo3TslQTDkl0ZB5q8tGMXe7bkFzLUlWvjsTrut/tahq
         8a7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WpD/YljpWmTam/2MTLvoaB931r9WFg9CiXxmASdc5DQ=;
        b=pEdmut0BlzjrgUJkEmu8quNEm63fIRy8vw4Djh70fhZ3INzK9+slwUKC+TKnXkSLr6
         VsZL+1YndjpW20N4PNyUivFt7kHbgb7iF/AzztCDcdXCyPphMmq5UEIryZrzpG611ASE
         GFCQWf4+GhY5Mf/QT3AnffxR2wYa+AayGH+4JVBi57iTRNtITbQQvpFKXlXV1CmVXb7j
         pGraHpRUKMezP+qdOOJhT2izpAGEE5zDjVqtu89aewu8ijQsX/KKGzREpXp+PDHPzRfS
         YpQReKVIWeCCUfBBZNs8oB094hMHBH3BXFVb6AuZaSJX+3oh0dn36hUzRNTuxT0UO5XV
         0sNg==
X-Gm-Message-State: APjAAAXpxI08YTdxUyaH0xeuJsmHPnd1tJS403YO+0XRmQJwBx/qvY5e
        EVRfFufpzMGnn+ag0BM97K0sIhuJYkk=
X-Google-Smtp-Source: APXvYqwZFPy0+NNPOzFyjnXW2jeDBUWHAnyj6Au3tOYtm2bBHXB4e2ImIX0A7x5tUddTnvYwdpFmUw==
X-Received: by 2002:a19:c354:: with SMTP id t81mr14165915lff.179.1571826179957;
        Wed, 23 Oct 2019 03:22:59 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id z24sm6887256lfj.40.2019.10.23.03.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 03:22:59 -0700 (PDT)
Date:   Wed, 23 Oct 2019 12:22:58 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 0/3] vimc: Allow multiple capture devices to use the same
 sensor
Message-ID: <20191023102258.GE5283@bigcity.dyn.berto.se>
References: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
 <991b7e6e-9420-ef3b-5271-fb272b97ff29@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <991b7e6e-9420-ef3b-5271-fb272b97ff29@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2019-10-23 09:01:40 +0200, Hans Verkuil wrote:
> Hi Niklas,
> 
> For one reason or another this series was never reviewed/picked up and
> it now no longer applies.
> 
> Combined with the big switch to a monolithic driver I am sure that this
> series needs to be redone. So I am marking it as "Changes Requested" and
> it is up to you to decide whether to rebase/rework this series.

I talked to Helen about this series and she thought it could be a nice 
candidate for a student workshop/class so I'm not planing to respin this 
myself.

> 
> Regards,
> 
> 	Hans
> 
> On 5/18/19 3:07 AM, Niklas Söderlund wrote:
> > Hi,
> > 
> > This series adds support for two (or more) capture devices to be 
> > connected to the same senors and run simultaneously. Each capture device 
> > can be started and stopped independent of each other.
> > 
> > Patch 1/3 and 2/3 deals with solving the issues that arises once two 
> > capture devices can be part of the same pipeline. While 3/3 allows for 
> > two capture devices to be part of the same pipeline and thus allows for 
> > simultaneously use.
> > 
> > The series is based on the latest media-tree and it functionality can be 
> > demonstrated with the following test.
> > 
> >>>> begin test <<<
> > mdev=/dev/media0
> > 
> > media-ctl -d $mdev -l "'Debayer A':1 -> 'Scaler':0 [1]"
> > media-ctl -d $mdev -l "'Debayer B':1 -> 'Scaler':0 [0]"
> > 
> > media-ctl -d $mdev -V "'Debayer A':0 [fmt:RGB888_1X24/640x480 field:none]"
> > media-ctl -d /dev/media0 -V "'Sensor A':0 [fmt:SRGGB8_1X8/640x480 field:none]"
> > 
> > yavta -f RGB24 -s 1920x1440 --field none /dev/video2
> > yavta -f SRGGB8 -s 640x480 --field none /dev/video0
> > 
> > yavta -f RGB24 -s 1920x1440 --field none /dev/video2 --capture=100 &
> > yavta -f SRGGB8 -s 640x480 --field none /dev/video0 --capture=100
> > wait
> >>>> end test <<<
> > 
> > In addition to testing with this test the series is tested with multiple 
> > qv4l2 instances controlling different capture devices connected to the 
> > same sensor.
> > 
> > Niklas Söderlund (3):
> >   vimc: Add usage count to subdevices
> >   vimc: Serialize vimc_streamer_s_stream()
> >   vimc: Join pipeline if one already exists
> > 
> >  drivers/media/platform/vimc/vimc-capture.c  | 35 ++++++++++++++++++++-
> >  drivers/media/platform/vimc/vimc-debayer.c  |  8 +++++
> >  drivers/media/platform/vimc/vimc-scaler.c   |  8 +++++
> >  drivers/media/platform/vimc/vimc-sensor.c   |  7 +++++
> >  drivers/media/platform/vimc/vimc-streamer.c | 23 +++++++++-----
> >  5 files changed, 73 insertions(+), 8 deletions(-)
> > 
> 

-- 
Regards,
Niklas Söderlund
