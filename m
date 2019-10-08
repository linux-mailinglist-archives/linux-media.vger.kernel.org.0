Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05367CF00A
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 02:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729612AbfJHAvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 20:51:31 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:37330 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbfJHAva (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 20:51:30 -0400
Received: by mail-wr1-f47.google.com with SMTP id p14so16370389wro.4
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 17:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Gj+IGTztXbGFp7gJZa7gTAeUJHCDm1ksaIK3a9y+gW8=;
        b=Z2sMMqu/S1Jrs3CzaKRJqKRD58UmdEetmW5Us+qXbgb7lx0jErO2v7vTiXYZjF+G4j
         lzc0yOQR/1QMv3nFpj9kdch05OIqTaUVWj2Zg6Uxe9t/Wzr80+4DLxbnNWWfeamMBsoY
         axeKqzRRyQNdvuGqENy474r9UJcXQreyGE34kHC5fITsWVFY5rhCRS16rns6H+qudzLY
         E+P9DzcSGHZozNM2g7SuukJRGk+JrkWtuGxR/vOvCn3WZe3J2UflV4Ou+QApeKoKIbcf
         hHdjkTeGcaIY6CXSsipmNfV3TCHCEaVV/NMCRHelsvo0LubBlUdU7C5+Esm3Tc/wog3c
         3FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Gj+IGTztXbGFp7gJZa7gTAeUJHCDm1ksaIK3a9y+gW8=;
        b=iYtcy2B1jRyQ3T8aodteAC1ks8xZkKddehxhlhmQBqQHrbMcIlD2gYhIRHlapx/5GC
         xS+Ymjdc76nGGQBv/5C6UWM0p0wcAmXChkvru1Q/a035YxMTZt8vxULFhTXzbeqYUYXq
         YfutfegxKdXLcT2vMb8h19ZnKtjLkr4K41qIZq0lGHG9T6XZ3mwyqR1mEwj0UHtu7Flp
         SRucljVKBQhyeCbcs2ak58MyfLbCQFZirQ/jPRilOH3TgSlMwpVsiQHOeMmkgWzIwqi2
         jVcb8/vHZehxsCoXiC/Ev3R8AZ4aZ7hIvr+E/Ck5RgfsOfYfE7kIiE+P5KK0WIYaXOCG
         S6Mg==
X-Gm-Message-State: APjAAAXcng9PURJlcO9E+C5mBIWg7w0MkGdliTGJ4+y9/brsp6MnjB1S
        BsXbdKQ6XmhMygJ4sO68jr4=
X-Google-Smtp-Source: APXvYqwZnfaaviKg3AQtvKPrW82WUhyNdFbSEcYA2gZOydT8d+5lffP0rn0i5zGtYYa9b26f+iHMXA==
X-Received: by 2002:adf:f503:: with SMTP id q3mr19800825wro.295.1570495888321;
        Mon, 07 Oct 2019 17:51:28 -0700 (PDT)
Received: from [172.30.88.146] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id o22sm40721222wra.96.2019.10.07.17.51.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 17:51:27 -0700 (PDT)
Subject: Re: ADV7180 Capture with i.MX53
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com>
 <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com>
Date:   Mon, 7 Oct 2019 17:51:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/7/19 5:46 PM, Fabio Estevam wrote:
> Hi Steve,
>
> On Mon, Oct 7, 2019 at 9:37 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
>> The adv7180 driver in 5.3.x doesn't support seq-bt, only alternate. So
>> pad format should be "[fmt:UYVY2X8/720x240 field:alternate]".
> Thanks for the suggestion. After changing to field:alternate I get:
>
> # gst-launch-1.0 v4l2src ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
> '/dev/video0' does not support progressive interlacing

Ah progress. Try:

v4l2-ctl -d0 --set-fmt-video=field=interlaced

Unless you specify interlaced at the video interface, the driver will 
just combine alternate fields into seq-bt. I guess the v4l2src plugin 
doesn't support seq-bt.


Steve

> Additional debug info:
> ../../../gst-plugins-good-1.14.4/sys/v4l2/gstv4l2object.c(3813):
> gst_v4l2_object_set_format_full ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Device wants interleaved interlacing
> Execution ended after 0:00:00.020459489
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Setting pipeline to NULL ...
> Freeing pipeline ...

