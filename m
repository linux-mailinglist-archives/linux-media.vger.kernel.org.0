Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 154871A2A0B
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 22:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbgDHUEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 16:04:48 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35588 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgDHUEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 16:04:47 -0400
Received: by mail-pj1-f68.google.com with SMTP id mn19so289272pjb.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 13:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8GCfRArAzrIYMvoPCnXaj76GTC76cY7Prk0lf2gAotg=;
        b=T5Nvo0D8NmJKbt3le0rHyxvNuTXX/nV7NYIs/mfC864oHWRCN5f72DYljZ5xAQoZlY
         1tDDgVgpUsrv3J9ErJKVNc9idRzdffpUkCltmH8V/m87rI7Q3nkU1dc4GT7I5njNrelv
         9VVDKimpr+iy4MtM/ggb56G2zwu/FbR0Q/Ed90u4FWAg4h5KkQDIXqdzwYw7BIque128
         A/8hRepO1uvGFZzWpRBZ8ovmQFTeaHHxBdTcfJ1j0/s5ztp+3bsBsiikDbbjTv68pt5m
         PY2fl8WKQYs1uDFntrBD8D5B8Wzhw/ihvlFiRPnQ29NLcD5zv2wGEupI9IWlpx1sEbMO
         Zt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8GCfRArAzrIYMvoPCnXaj76GTC76cY7Prk0lf2gAotg=;
        b=cwK9xN316Ua8fnKZmE038vxH0HeUATeja8vNYEYTkhfdoXK5nocHJXYNqv6GHUX/jk
         JfN3FQmgWO8qq8S+ULmBeDIIt5UFnug88ZQjiXE9pmIDoz3PcQu8NhSv4ogzCjPt4Bwk
         6BuwOsf5fyWh7ta2JbRnh9OrLo0UV8vpefOtZ+0THi3FbzJhAZX/IX/DbwPMNFvc7JKc
         qHHK0/ZC40quNSxegBFR24u7F1puIXEh26V9ewrrUq0p5r2gqqNq3Sud+vYmj8ePq869
         VZCC1FueYfRXGYezbfOuvpQ67b4RtArwKmf4Mp4AMi2XJc5EjYyDSCuUBd5muXQN47Ul
         kjxw==
X-Gm-Message-State: AGi0PuYky+mDx7kYjKo/eJlGBhXnydUG+v108YKCmIboPppZXot0jqqY
        cIRdI74B9YsDHDX8HmlJ5nx83g8kUts=
X-Google-Smtp-Source: APiQypJLq21k/x+7K1+i4X6o195kPBWHVYWH6TIUuqsk+beKm5l9jHSsFFWHtS+t+ucydMD8wRzhIw==
X-Received: by 2002:a17:902:b089:: with SMTP id p9mr8659252plr.233.1586376286090;
        Wed, 08 Apr 2020 13:04:46 -0700 (PDT)
Received: from [192.168.1.104] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id fh6sm342777pjb.7.2020.04.08.13.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 13:04:45 -0700 (PDT)
Subject: Re: [PATCH 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
References: <20200408123215.2531-1-festevam@gmail.com>
 <c069af02-af3c-9527-eed4-839681c73ce6@gmail.com>
 <CAOMZO5BN6igxVGRnOnftv=PGZWi=2Qb2Th0fhBon93Fk-zWj+w@mail.gmail.com>
 <a23d2559-5498-75bb-0bce-3bc11bb6b5ae@gmail.com>
 <CAOMZO5BoD4K9Z7GCZHtrWDkYre3aFNd6YdDkUfKB1xVwdjaNzg@mail.gmail.com>
 <CAOMZO5AQKQhE4THON2LGtN-Btmz=E_AbYpFxi6KV3TpTdBWOzA@mail.gmail.com>
 <09a8b94a-9175-b9b3-1000-50a308e6526a@gmail.com>
Message-ID: <f157403f-676b-539f-f3c2-97907345c75f@gmail.com>
Date:   Wed, 8 Apr 2020 13:04:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <09a8b94a-9175-b9b3-1000-50a308e6526a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

So sorry!

I was testing with the patchset:

[PATCH v7 00/11] media: imx: Miscellaneous format-related cleanups

which specifically fixes a bug with enumerating non-mbus RGB formats:

[PATCH v7 01/11] media: imx: utils: fix and simplify pixel format 
enumeration

Without that patchset, /dev/video1 only lists:

arm:~/scripts % v4l2-ctl -d1 --list-formats
ioctl: VIDIOC_ENUM_FMT
     Index       : 0
     Type        : Video Capture
     Pixel Format: 'RGBP'
     Name        : 16-bit RGB 5-6-5

     Index       : 1
     Type        : Video Capture
     Pixel Format: 'RGB3'
     Name        : 24-bit RGB 8-8-8

     Index       : 2
     Type        : Video Capture
     Pixel Format: 'BX24'
     Name        : 32-bit XRGB 8-8-8-8

But with the bug fix:

arm:~ % v4l2-ctl -d1 --list-formats
ioctl: VIDIOC_ENUM_FMT
         Index       : 0
         Type        : Video Capture
         Pixel Format: 'RGBP'
         Name        : 16-bit RGB 5-6-5

         Index       : 1
         Type        : Video Capture
         Pixel Format: 'RGB3'
         Name        : 24-bit RGB 8-8-8

         Index       : 2
         Type        : Video Capture
         Pixel Format: 'BGR3'
         Name        : 24-bit BGR 8-8-8

         Index       : 3
         Type        : Video Capture
         Pixel Format: 'BX24'
         Name        : 32-bit XRGB 8-8-8-8

         Index       : 4
         Type        : Video Capture
         Pixel Format: 'XR24'
         Name        : 32-bit BGRX 8-8-8-8

         Index       : 5
         Type        : Video Capture
         Pixel Format: 'RX24'
         Name        : 32-bit XBGR 8-8-8-8

         Index       : 6
         Type        : Video Capture
         Pixel Format: 'XB24'
         Name        : 32-bit RGBX 8-8-8-8


And with that, kmssink is able to negotiate XR24.

With the anticipation that the patchset mentioned will be merged, can 
you try again with that patchset applied, and update the imx.rst doc 
accordingly?

Thanks,
Steve


On 4/8/20 12:51 PM, Steve Longerbeam wrote:
>
>
> On 4/8/20 12:33 PM, Fabio Estevam wrote:
>> On Wed, Apr 8, 2020 at 4:28 PM Fabio Estevam <festevam@gmail.com> wrote:
>>
>>> Should I change the Gstreamer pipeline?
>> It works if I use the v4l2convert element:
>>
>> gst-launch-1.0 -v v4l2src device=/dev/video1 ! v4l2convert ! kmssink
>
> I think that works because the csc-scaler mem2mem driver is able to 
> provide the frame dimensions that kmssink requires, but I don't think 
> you need v4l2convert, I think this should work (use can-scale=false):
>
> gst-launch-1.0 v4l2src device=/dev/video1 ! kmssink connector-id=54 
> name=imx-drm sync=0 can-scale=false
>
> but use the connector-id for your display.
>
> Steve
>

