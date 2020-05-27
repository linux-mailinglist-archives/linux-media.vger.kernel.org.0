Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535E71E49E9
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 18:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391054AbgE0QYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 12:24:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53668 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391026AbgE0QYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 12:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590596638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rr6Bc7xecPh/xypHfhD32p7uN7phjbkmI0iUtFgeEO4=;
        b=S2DZ1Il8/TrzkBoz/FvGuJE+d2YwBfZyQzg3tt1JS/qNz3Oa2Y7edbOlx4r+CAQa5zv5fe
        4pq1ZwjbUkh23Z3sqnYk+cqdKgxoNPZkTsLOdfhv1FEvVITswUbqRrK2bHOPiGCB87DSGB
        m1rtyl45eWnbEsPSJP98IOfIsCPeqaw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-CjGwLG4oMvWbyjRl2uSavw-1; Wed, 27 May 2020 12:23:29 -0400
X-MC-Unique: CjGwLG4oMvWbyjRl2uSavw-1
Received: by mail-ed1-f69.google.com with SMTP id ba29so6060660edb.16
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 09:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rr6Bc7xecPh/xypHfhD32p7uN7phjbkmI0iUtFgeEO4=;
        b=HuRTx/MxkK/kkFGRWEiXG9Ft5Mx+j9mq3qePKYyIyjcfgMlKLnMfWBOydKnJihP/5J
         3QGEYJmlwAuqzr9oprnoLbThyzM2B5Q882l2m+Ow9OBWlw48x1XreRh3+8L0ambNsqku
         iCthzgRq0cJVVDregou1OfUhdd571mwivC7Y6qnvAMiUHAcqq9cu+sYMa5hwxc2wpJ4h
         3nk1iPRfP2pHooPyUVykrEapXzg/NNaqnSyqSObUsUfzMgmqivsmw8wiuoq7M2gWHO0Z
         98E0BPe9IfF9IUxLrA/wRVosyxaBcdMDIlJSVllE+739cM2Pi76XS1VHArcPq/j4xvEr
         jUHg==
X-Gm-Message-State: AOAM532TyGPojiJtQjQCvMJ8CS9cNGq41i9V9W3FL9Fufm2ddriUnZf3
        HJp4sWCfpMjk3No4HNUehr1Q6Rl0ne7lcZJPcOFOFf0Ils6j1hsOMRq38mxeCI8ZguyH+TxwUQh
        bvvrS0PMhf6uqq3l3AQkPYXQ=
X-Received: by 2002:aa7:d71a:: with SMTP id t26mr19860984edq.123.1590596607529;
        Wed, 27 May 2020 09:23:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFlDYlSBxyF8cSN4gQszUWVXFtPfDT54Wr465MluY+Z//c6ywyQn9ZTpUnlnqMyaOk7NRipg==
X-Received: by 2002:aa7:d71a:: with SMTP id t26mr19860965edq.123.1590596607366;
        Wed, 27 May 2020 09:23:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id i9sm2882006ejv.44.2020.05.27.09.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 09:23:26 -0700 (PDT)
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
 <4dd760d6-6445-f3b5-cb14-1705e05820bc@redhat.com>
 <20200522134203.0fe139d6@coco.lan> <20200523100000.1131bd29@coco.lan>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bb6c2d97-1614-246a-35b1-ee1531115734@redhat.com>
Date:   Wed, 27 May 2020 18:23:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200523100000.1131bd29@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/23/20 10:00 AM, Mauro Carvalho Chehab wrote:

<snip>

> Btw, this can also be useful:
> 
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=yocto_intel_aero_ported_v2
> 
> This is basically the Yocto Aero patchset from:
> 
> 	https://github.com/intel-aero/meta-intel-aero-base
> 
> applied on the top of Kernel 4.4.76 and then ported to
> Kernel 5.7-rc2, making it run there.
> 
> On such version, I tried to preserve the patch history as much
> as possible and minimize the changes, while not touching at the media
> framework. This version contains 3 new I2C sensor drivers.
> 
>  From the new sensors, I ported only the ov8858 code to be built
> on the top of v5.7-rc2, but aiming another device I have here,
> using ipu3. So, it got removed from all atomisp-dependent code.

Thanks for the info, that might be useful later.

Note ATM I'm swamped with a lot of other stuff, so I have no idea
when I will have time to scratch my itch wrt to looking at this.

And TBH I'm waiting for you to reach that all important milestone
of actually getting some sort of picture outside of the sensor
before I start sinking time into this :)

Regards,

Hans

