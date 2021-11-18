Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF544558B2
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 11:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245476AbhKRKOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 05:14:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244348AbhKRKMc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 05:12:32 -0500
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FBF13E5;
        Thu, 18 Nov 2021 11:09:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637230170;
        bh=3pLHTNBE1WM/rk1PCLQ17lD4OrDPFpCnTJCbT044dpA=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=OfRyTAotKZ08HXLg+NAP3Qtlmr1CXDTc0qxesKi7s+xH05Gcl/bXhWrqcHPyx9j6C
         Jmgwkns+YVOo7x7IfKXf0i5xtHu7P82Spi8KejaKScqA2M5x17j2mdwLTOYBJRDsY0
         f4IQq2P2yCJH4eSI3ThxmqxxU/ynQ7dqHz+HUe8w=
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, mchehab+huawei@kernel.org, rosenp@gmail.com
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
 <db868d34-aaa5-7e89-59a5-a61e024b2ec9@ideasonboard.com>
Message-ID: <400c6b9e-c783-864d-e5c2-63892d133ac7@ideasonboard.com>
Date:   Thu, 18 Nov 2021 12:09:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <db868d34-aaa5-7e89-59a5-a61e024b2ec9@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/11/2021 11:03, Tomi Valkeinen wrote:

> I was testing this (well, I'm using it, as I can't get the autoconf work 
> with
> cross-compilation..), and I see this problem if gconv is enabled when
> cross-compiling for arm (buildroot system):
> 
> [1/2] Linking target contrib/gconv/EN300-468-TAB00.so
> FAILED: contrib/gconv/EN300-468-TAB00.so
> /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc  
> -o contrib/gconv/EN300-468-TAB00.so 
> contrib/gconv/EN300-468-TAB00.so.p/en300-468-tab00.c.o -Wl,--as-needed 
> -Wl,--allow-shlib-undefined -shared -fPIC 
> -Wl,-rpath,/usr/lib/x86_64-linux-gnu/gconv 
> -Wl,-rpath-link,/usr/lib/x86_64-linux-gnu/gconv -Wl,--start-group 
> /usr/lib/x86_64-linux-gnu/gconv/libJIS.so 
> /usr/lib/x86_64-linux-gnu/gconv/libJISX0213.so -Wl,--end-group
> /usr/lib/x86_64-linux-gnu/gconv/libJIS.so: file not recognized: file 
> format not recognized
> collect2: error: ld returned 1 exit status
> [2/2] Linking target contrib/gconv/ARIB-STD-B24.so
> FAILED: contrib/gconv/ARIB-STD-B24.so
> /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc  
> -o contrib/gconv/ARIB-STD-B24.so 
> contrib/gconv/ARIB-STD-B24.so.p/arib-std-b24.c.o -Wl,--as-needed 
> -Wl,--allow-shlib-undefined -shared -fPIC 
> -Wl,-rpath,/usr/lib/x86_64-linux-gnu/gconv 
> -Wl,-rpath-link,/usr/lib/x86_64-linux-gnu/gconv -Wl,--start-group 
> /usr/lib/x86_64-linux-gnu/gconv/libJIS.so 
> /usr/lib/x86_64-linux-gnu/gconv/libJISX0213.so -Wl,--end-group
> /usr/lib/x86_64-linux-gnu/gconv/libJIS.so: file not recognized: file 
> format not recognized

You can ignore the above, I think it was an error in my meson cross file.

  Tomi

